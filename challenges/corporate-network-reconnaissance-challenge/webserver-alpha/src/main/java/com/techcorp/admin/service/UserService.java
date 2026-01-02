package com.techcorp.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;
import com.techcorp.admin.model.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;

@Service
public class UserService {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public User authenticateUser(String query) {
        try {
            // Vulnerable: Direct SQL execution without parameterization
            List<User> users = jdbcTemplate.query(query, new UserRowMapper());
            return users.isEmpty() ? null : users.get(0);
        } catch (Exception e) {
            return null;
        }
    }
    
    public List<Map<String, Object>> getNetworkServers() {
        return Arrays.asList(
            createServerMap("webserver-alpha", "192.168.1.10", "Active", "HTTP, HTTPS, SSH, FTP"),
            createServerMap("fileserver-beta", "192.168.1.20", "Active", "SMB, FTP, SNMP"),
            createServerMap("database-gamma", "192.168.1.30", "Active", "MySQL, SSH")
        );
    }
    
    public List<Map<String, Object>> getRunningServices() {
        return Arrays.asList(
            createServiceMap("HTTP", "80", "Apache 2.4.41", "webserver-alpha"),
            createServiceMap("HTTPS", "443", "Apache 2.4.41 SSL", "webserver-alpha"),
            createServiceMap("SSH", "22", "OpenSSH 8.2", "webserver-alpha"),
            createServiceMap("FTP", "21", "vsftpd 3.0.3", "webserver-alpha"),
            createServiceMap("SMB", "445", "Samba 4.11.6", "fileserver-beta"),
            createServiceMap("SNMP", "161", "Net-SNMP 5.8", "fileserver-beta"),
            createServiceMap("MySQL", "3306", "MySQL 8.0.25", "database-gamma")
        );
    }
    
    public List<Map<String, Object>> getScanResults() {
        return Arrays.asList(
            createScanMap("192.168.1.0/24", "Network Range", "24 hosts discovered"),
            createScanMap("192.168.1.10", "webserver-alpha", "4 ports open: 21,22,80,443"),
            createScanMap("192.168.1.20", "fileserver-beta", "3 ports open: 21,161,445"),
            createScanMap("192.168.1.30", "database-gamma", "2 ports open: 22,3306")
        );
    }
    
    public Map<String, String> getSystemInfo() {
        Map<String, String> info = new HashMap<>();
        info.put("hostname", "webserver-alpha.techcorp.local");
        info.put("os", "Ubuntu 20.04.3 LTS");
        info.put("kernel", "5.4.0-84-generic");
        info.put("architecture", "x86_64");
        info.put("uptime", "127 days, 14:32:15");
        info.put("network", "192.168.1.0/24 (Internal Corporate Network)");
        return info;
    }
    
    private Map<String, Object> createServerMap(String name, String ip, String status, String services) {
        Map<String, Object> server = new HashMap<>();
        server.put("name", name);
        server.put("ip", ip);
        server.put("status", status);
        server.put("services", services);
        return server;
    }
    
    private Map<String, Object> createServiceMap(String name, String port, String version, String host) {
        Map<String, Object> service = new HashMap<>();
        service.put("name", name);
        service.put("port", port);
        service.put("version", version);
        service.put("host", host);
        return service;
    }
    
    private Map<String, Object> createScanMap(String target, String name, String result) {
        Map<String, Object> scan = new HashMap<>();
        scan.put("target", target);
        scan.put("name", name);
        scan.put("result", result);
        return scan;
    }
    
    private static class UserRowMapper implements RowMapper<User> {
        @Override
        public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            User user = new User();
            user.setId(rs.getLong("id"));
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setRole(rs.getString("role"));
            user.setEmail(rs.getString("email"));
            return user;
        }
    }
}