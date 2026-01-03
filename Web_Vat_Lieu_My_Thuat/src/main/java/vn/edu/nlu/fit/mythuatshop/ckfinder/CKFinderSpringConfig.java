package vn.edu.nlu.fit.mythuatshop.ckfinder;

import com.cksource.ckfinder.config.Config;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import jakarta.servlet.ServletContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.File;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

@Configuration
public class CKFinderSpringConfig {

    @Bean(name = "baseConfig")
    public Config baseConfig(ServletContext servletContext) throws Exception {

        // 1) đọc ckfinder.yml từ classpath
        InputStream is = Thread.currentThread()
                .getContextClassLoader()
                .getResourceAsStream("ckfinder.yml");

        if (is == null) {
            throw new RuntimeException("Không tìm thấy ckfinder.yml trong classpath (src/main/resources/ckfinder.yml)");
        }

        String yaml = new String(is.readAllBytes(), StandardCharsets.UTF_8);

        // 2) CHỐT LỖI: loại bỏ mọi block/field 'enabled' và 'connector:' (vì CKFinder 4.0.1 không có)
        // - xóa block connector: ... (nếu có)
        yaml = yaml.replaceAll("(?m)^connector:\\s*\\n(?:^[ \\t].*\\n?)*", "");
        // - xóa mọi dòng enabled: ... ở bất kỳ đâu
        yaml = yaml.replaceAll("(?m)^\\s*enabled\\s*:\\s*.*\\n?", "");
        // - xóa thumbnails.enabled (nếu bạn từng có)
        yaml = yaml.replaceAll("(?m)^\\s*thumbnails:\\s*\\n\\s*enabled\\s*:\\s*.*\\n", "thumbnails:\n");

        // 3) parse YAML -> Config
        ObjectMapper mapper = new ObjectMapper(new YAMLFactory());
        Config cfg = mapper.readValue(yaml, Config.class);

        // 4) thư mục upload (DEV): webapp/uploads/ckfinder
        String uploadRoot = servletContext.getRealPath("/uploads/ckfinder");
        if (uploadRoot == null) {
            uploadRoot = System.getProperty("java.io.tmpdir") + "/mythuatshop_uploads/ckfinder";
        }

        File dir = new File(uploadRoot);
        if (!dir.exists()) dir.mkdirs();

        // tạo sẵn images/files để CKFinder khỏi lỗi đường dẫn
        new File(uploadRoot, "images").mkdirs();
        new File(uploadRoot, "files").mkdirs();

        // 5) override backend default
        Config.Backend be = cfg.getBackendConfig("default");
        if (be == null) {
            throw new RuntimeException("ckfinder.yml thiếu backend name: default");
        }

        be.setRoot(uploadRoot);
        // baseUrl PHẢI có dấu / cuối cho chắc
        be.setBaseUrl(servletContext.getContextPath() + "/uploads/ckfinder/");

        return cfg;
    }
}
