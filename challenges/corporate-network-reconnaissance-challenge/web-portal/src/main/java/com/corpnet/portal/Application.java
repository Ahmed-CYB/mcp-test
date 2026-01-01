package com.corpnet.portal;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.concurrent.TimeUnit;

@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}

@Controller
public class PortalController {
    
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/corpnet";
    private static final String DB_USER = "portal_user";
    private static final String DB_PASS = "portal123";
    
    @GetMapping("/")
    public String index() {
        return "index";
    }
    
    @GetMapping("/login")
    public String login() {
        return "login";
    }
    
    @GetMapping("/reset")
    public String resetForm() {
        return "reset";
    }
    
    @PostMapping("/reset")
    @ResponseBody
    public String resetPassword(@RequestParam String username, HttpServletRequest request) {
        try {
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
            
            // Vulnerable SQL query - blind SQLi through timing
            String query = "SELECT email FROM users WHERE username = '" + username + "' AND active = true";
            
            long startTime = System.currentTimeMillis();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            
            if (rs.next()) {
                String email = rs.getString("email");
                // Simulate email sending delay
                Thread.sleep(500);
                return "Password reset link sent to " + email.substring(0, 3) + "***@" + email.split("@")[1];
            } else {
                return "Username not found or account inactive";
            }
            
        } catch (Exception e) {
            // SQL errors cause noticeable delay
            try {
                Thread.sleep(3000);
            } catch (InterruptedException ie) {}
            return "Error processing request";
        }
    }
    
    @GetMapping("/admin")
    @ResponseBody
    public String admin(@RequestParam(required = false) String token) {
        if ("admin_reset_token_2024".equals(token)) {
            return "Admin Panel Access Granted<br>System Status: Online<br>Flag: CTF{blind_sqli_timing_attack_success}";
        }
        return "Access Denied";
    }
    
    @GetMapping("/network-tools")
    public String networkTools() {
        return "tools";
    }
    
    @PostMapping("/scan")
    @ResponseBody
    public String performScan(@RequestParam String target, @RequestParam String scanType) {
        // Simulate nmap scan results
        StringBuilder result = new StringBuilder();
        result.append("Nmap scan report for ").append(target).append("\n");
        
        if ("tcp".equals(scanType)) {
            result.append("PORT     STATE SERVICE\n");
            result.append("22/tcp   open  ssh\n");
            result.append("53/tcp   open  domain\n");
            result.append("80/tcp   open  http\n");
            result.append("443/tcp  open  https\n");
            result.append("8080/tcp open  http-proxy\n");
        } else if ("udp".equals(scanType)) {
            result.append("PORT     STATE SERVICE\n");
            result.append("53/udp   open  domain\n");
            result.append("161/udp  open  snmp\n");
        }
        
        return result.toString();
    }
}