package com.devblog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.devblog.service.BlogService;
import com.devblog.model.BlogPost;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class BlogController {
    
    @Autowired
    private BlogService blogService;
    
    @GetMapping("/")
    public String home(Model model) {
        List<BlogPost> posts = blogService.getAllPosts();
        model.addAttribute("posts", posts);
        return "index";
    }
    
    @GetMapping("/search")
    public String search(@RequestParam(value = "q", required = false) String query, Model model, HttpServletRequest request) {
        if (query != null && !query.trim().isEmpty()) {
            List<BlogPost> results = blogService.searchPosts(query);
            model.addAttribute("results", results);
            model.addAttribute("query", query);
            
            // Log search queries for analytics (vulnerable to SQL injection)
            String userAgent = request.getHeader("User-Agent");
            String clientIp = request.getRemoteAddr();
            blogService.logSearch(query, userAgent, clientIp);
        }
        return "search";
    }
    
    @GetMapping("/post/{id}")
    public String viewPost(@PathVariable Long id, Model model) {
        BlogPost post = blogService.getPostById(id);
        if (post != null) {
            model.addAttribute("post", post);
            return "post";
        }
        return "404";
    }
    
    @GetMapping("/admin")
    public String admin() {
        return "admin";
    }
    
    @PostMapping("/admin/login")
    public String adminLogin(@RequestParam String username, @RequestParam String password, Model model) {
        if (blogService.validateAdmin(username, password)) {
            return "redirect:/admin/dashboard";
        }
        model.addAttribute("error", "Invalid credentials");
        return "admin";
    }
    
    @GetMapping("/admin/dashboard")
    public String adminDashboard(Model model) {
        List<String> searchLogs = blogService.getSearchLogs();
        model.addAttribute("logs", searchLogs);
        return "dashboard";
    }
}