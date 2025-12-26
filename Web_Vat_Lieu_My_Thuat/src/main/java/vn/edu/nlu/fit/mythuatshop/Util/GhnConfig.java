package vn.edu.nlu.fit.mythuatshop.Util;

import java.io.InputStream;
import java.util.Properties;

public class GhnConfig {
    public final String baseUrl;
    public final String token;
    public final int shopId;

    public final int fromDistrictId;
    public final String fromWardCode;

    public final int weight, length, width, height, insuranceValue;

    private GhnConfig(Properties p) {
        this.baseUrl = p.getProperty("ghn.baseUrl").trim();
        this.token = p.getProperty("ghn.token").trim();
        this.shopId = Integer.parseInt(p.getProperty("ghn.shopId").trim());

        this.fromDistrictId = Integer.parseInt(p.getProperty("ghn.fromDistrictId").trim());
        this.fromWardCode = p.getProperty("ghn.fromWardCode").trim();

        this.weight = Integer.parseInt(p.getProperty("ghn.weight", "500").trim());
        this.length = Integer.parseInt(p.getProperty("ghn.length", "20").trim());
        this.width = Integer.parseInt(p.getProperty("ghn.width", "15").trim());
        this.height = Integer.parseInt(p.getProperty("ghn.height", "10").trim());
        this.insuranceValue = Integer.parseInt(p.getProperty("ghn.insuranceValue", "0").trim());
    }

    public static GhnConfig load() {
        try (InputStream in = Thread.currentThread().getContextClassLoader()
                .getResourceAsStream("ghn.properties")) {

            if (in == null) throw new RuntimeException("Không tìm thấy ghn.properties trong resources");

            Properties p = new Properties();
            p.load(in);
            return new GhnConfig(p);

        } catch (Exception e) {
            throw new RuntimeException("Lỗi đọc ghn.properties: " + e.getMessage(), e);
        }
    }
}
