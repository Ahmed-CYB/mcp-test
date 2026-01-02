package com.devblog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.devblog.model.BlogPost;
import javax.sql.DataSource;
import java.sql.*;
import java.util.*;
import java.time.LocalDateTime;

@Service
public class BlogService {
    
    @Autowired
    private DataSource dataSource;
    
    public List<BlogPost> getAllPosts() {
        List<BlogPost> posts = new ArrayList<>();
        try (Connection conn = dataSource.getConnection()) {
            String sql = "SELECT id, title, content, author, created_at FROM blog_posts ORDER BY created_at DESC";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                BlogPost post = new BlogPost();
                post.setId(rs.getLong("id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setAuthor(rs.getString("author"));
                post.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }
    
    public List<BlogPost> searchPosts(String query) {
        List<BlogPost> posts = new ArrayList<>();
        try (Connection conn = dataSource.getConnection()) {
            // Vulnerable SQL query - direct string concatenation
            String sql = "SELECT id, title, content, author, created_at FROM blog_posts WHERE title LIKE '%" + query + "%' OR content LIKE '%" + query + "%'";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                BlogPost post = new BlogPost();
                post.setId(rs.getLong("id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setAuthor(rs.getString("author"));
                post.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                posts.add(post);
            }
        } catch (SQLException e) {
            System.err.println("Search error: " + e.getMessage());
        }
        return posts;
    }
    
    public BlogPost getPostById(Long id) {
        try (Connection conn = dataSource.getConnection()) {
            String sql = "SELECT id, title, content, author, created_at FROM blog_posts WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                BlogPost post = new BlogPost();
                post.setId(rs.getLong("id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setAuthor(rs.getString("author"));
                post.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                return post;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public void logSearch(String query, String userAgent, String clientIp) {
        try (Connection conn = dataSource.getConnection()) {
            // Vulnerable logging - direct string concatenation allows SQL injection
            String sql = "INSERT INTO search_logs (query, user_agent, client_ip, timestamp) VALUES ('" + 
                        query + "', '" + userAgent + "', '" + clientIp + "', NOW())";
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            System.err.println("Logging error: " + e.getMessage());
        }
    }
    
    public boolean validateAdmin(String username, String password) {
        return "admin".equals(username) && "devblog2024".equals(password);
    }
    
    public List<String> getSearchLogs() {
        List<String> logs = new ArrayList<>();
        try (Connection conn = dataSource.getConnection()) {
            String sql = "SELECT query, user_agent, client_ip, timestamp FROM search_logs ORDER BY timestamp DESC LIMIT 100";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                String log = String.format("[%s] %s searched for '%s' from %s", 
                    rs.getTimestamp("timestamp"), 
                    rs.getString("client_ip"),
                    rs.getString("query"),
                    rs.getString("user_agent"));
                logs.add(log);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return logs;
    }
}