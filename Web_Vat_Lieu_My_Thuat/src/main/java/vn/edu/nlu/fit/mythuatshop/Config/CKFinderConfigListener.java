package vn.edu.nlu.fit.mythuatshop.Config;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * Listener để tạo file ckfinder.yml động dựa trên context path thực tế
 * Giải quyết vấn đề: context path có thể thay đổi khi deploy
 */
@WebListener
public class CKFinderConfigListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        
        // Lấy context path thực tế (VD: /mythuat-shop-1.0-SNAPSHOT hoặc /mythuat_shop_war)
        String contextPath = context.getContextPath();
        
        // Lấy real path của thư mục upload
        String uploadPath = context.getRealPath("/assets/images/product");
        
        System.out.println("=== CKFinder Configuration ===");
        System.out.println("Context Path: " + contextPath);
        System.out.println("Upload Path: " + uploadPath);
        
        // Tạo thư mục nếu chưa tồn tại
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            boolean created = uploadDir.mkdirs();
            System.out.println("Upload directory created: " + created);
        }
        
        // Tạo file ckfinder.yml động
        createDynamicConfig(context, contextPath, uploadPath);
    }

    private void createDynamicConfig(ServletContext context, String contextPath, String uploadPath) {
        try {
            // Đọc template từ resources
            InputStream templateStream = context.getResourceAsStream("/WEB-INF/classes/ckfinder-template.yml");
            
            if (templateStream == null) {
                // Nếu không có template, tạo config mặc định
                createDefaultConfig(context, contextPath, uploadPath);
                return;
            }
            
            String template = new String(templateStream.readAllBytes());
            templateStream.close();
            
            // Thay thế placeholders
            String config = template
                .replace("${contextPath}", contextPath)
                .replace("${uploadPath}", uploadPath.replace("\\", "/"));
            
            // Ghi file config vào WEB-INF/classes/ckfinder.yml
            String configPath = context.getRealPath("/WEB-INF/classes/ckfinder.yml");
            Files.writeString(Path.of(configPath), config);
            
            System.out.println("CKFinder config created at: " + configPath);
            
        } catch (Exception e) {
            System.err.println("Error creating CKFinder config: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void createDefaultConfig(ServletContext context, String contextPath, String uploadPath) {
        String config = String.format("""
enabled: true
serveStaticResources: true
csrfProtection: false

accessControl:
  - role: "*"
    resourceType: "*"
    folder: "/"
    FOLDER_VIEW: true
    FOLDER_CREATE: true
    FOLDER_RENAME: true
    FOLDER_DELETE: true
    FILE_VIEW: true
    FILE_CREATE: true
    FILE_RENAME: true
    FILE_DELETE: true
    IMAGE_RESIZE: true
    IMAGE_RESIZE_CUSTOM: true

backends:
  - name: default
    adapter: local
    root: "%s"
    baseUrl: "%s/assets/images/product/"

resourceTypes:
  - name: Images
    backend: default
    directory: ""
    allowedExtensions: "jpg,jpeg,png,gif,webp,bmp"
    deniedExtensions: ""
    maxSize: 10485760
""", uploadPath.replace("\\", "/"), contextPath);

        try {
            String configPath = context.getRealPath("/WEB-INF/classes/ckfinder.yml");
            Files.writeString(Path.of(configPath), config);
            System.out.println("Default CKFinder config created at: " + configPath);
        } catch (IOException e) {
            System.err.println("Error creating default config: " + e.getMessage());
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Cleanup if needed
    }
}
