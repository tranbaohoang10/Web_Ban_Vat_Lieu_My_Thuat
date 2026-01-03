package vn.edu.nlu.fit.mythuatshop.Dao;

import com.mysql.cj.jdbc.MysqlDataSource;
import vn.edu.nlu.fit.mythuatshop.Model.Category;
import org.jdbi.v3.core.Jdbi;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class JDBIConnector {
    private static volatile Jdbi jdbi;

    public static Jdbi getJdbi() {
        if (jdbi == null) {
            synchronized (JDBIConnector.class) {
                if (jdbi == null) {
                    connect();
                }
            }
        }
        return jdbi;
    }

    private static void connect() {
        Properties props = loadDbProps();

        String url = pick(props.getProperty("db.url"), System.getenv("DB_URL"));
        String user = pick(props.getProperty("db.user"), System.getenv("DB_USER"));
        String pass = pick(props.getProperty("db.password"), System.getenv("DB_PASSWORD"));

        if (isBlank(url) || isBlank(user)) {
            throw new RuntimeException("Missing DB config. Please set db.properties or env DB_URL/DB_USER/DB_PASSWORD");
        }

        MysqlDataSource ds = new MysqlDataSource();
        ds.setUrl(url);
        ds.setUser(user);
        ds.setPassword(pass == null ? "" : pass);

        try {
            ds.setAutoReconnect(true);
            ds.setUseCompression(true);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        jdbi = Jdbi.create(ds);
    }

    private static Properties loadDbProps() {
        Properties props = new Properties();
        try (InputStream is = JDBIConnector.class.getClassLoader().getResourceAsStream("db.properties")) {
            if (is != null) props.load(is);
        } catch (IOException e) {
            throw new RuntimeException("Cannot load db.properties", e);
        }
        return props;
    }

    private static String pick(String primary, String fallback) {
        if (!isBlank(primary)) return primary.trim();
        if (!isBlank(fallback)) return fallback.trim();
        return null;
    }

    private static boolean isBlank(String s) {
        return s == null || s.trim().isEmpty();
    }
}
