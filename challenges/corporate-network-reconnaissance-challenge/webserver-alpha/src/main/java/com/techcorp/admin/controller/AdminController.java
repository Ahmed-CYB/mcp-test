package com.techcorp.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.techcorp.admin.service.UserService;
import com.techcorp.admin.model.User;
import javax.servlet.http.HttpSession;

@Controller
public class AdminController {
    
    @Autowired
    private UserService userService;
    
    @GetMapping("/")
    public String index() {
        return "login";
    }
    
    @GetMapping("/login")
    public String login() {
        return "login";
    }
    
    @PostMapping("/authenticate")
    public String authenticate(@RequestParam String username, 
                             @RequestParam String password,
                             HttpSession session, Model model) {
        
        // Vulnerable authentication logic - SQL injection in username parameter
        String query = "SELECT * FROM users WHERE username = '" + username + "' AND password = '" + password + "'";
        User user = userService.authenticateUser(query);
        
        if (user != null) {
            session.setAttribute("user", user);
            session.setAttribute("authenticated", true);
            return "redirect:/dashboard";
        } else {
            model.addAttribute("error", "Invalid credentials");
            return "login";
        }
    }
    
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        Boolean authenticated = (Boolean) session.getAttribute("authenticated");
        if (authenticated == null || !authenticated) {
            return "redirect:/login";
        }
        
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", user);
        
        // Load network infrastructure data
        model.addAttribute("servers", userService.getNetworkServers());
        model.addAttribute("services", userService.getRunningServices());
        
        return "dashboard";
    }
    
    @GetMapping("/network-scan")
    public String networkScan(HttpSession session, Model model) {
        Boolean authenticated = (Boolean) session.getAttribute("authenticated");
        if (authenticated == null || !authenticated) {
            return "redirect:/login";
        }
        
        // Network reconnaissance data
        model.addAttribute("scanResults", userService.getScanResults());
        return "network-scan";
    }
    
    @GetMapping("/admin-panel")
    public String adminPanel(HttpSession session, Model model) {
        Boolean authenticated = (Boolean) session.getAttribute("authenticated");
        User user = (User) session.getAttribute("user");
        
        if (authenticated == null || !authenticated || user == null || !"admin".equals(user.getRole())) {
            model.addAttribute("error", "Access denied - Admin privileges required");
            return "error";
        }
        
        // Flag hidden in admin panel
        model.addAttribute("flagFragment", "CTF{n3tw0rk_r3c0n_m4st3r_2024}");
        model.addAttribute("systemInfo", userService.getSystemInfo());
        
        return "admin-panel";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}