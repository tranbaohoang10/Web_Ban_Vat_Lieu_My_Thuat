package vn.edu.nlu.fit.mythuatshop.Util;
import io.github.cdimascio.dotenv.Dotenv;

public final class Env {
    private static final Dotenv DOTENV = Dotenv.configure()

            .ignoreIfMissing()
            .load();

    private Env() {}

    public static String get(String key) {
        String v = DOTENV.get(key);
        if (v == null || v.isBlank()) v = System.getenv(key);
        if (v == null || v.isBlank()) v = System.getProperty(key); // <-- thêm dòng này
        return v;
    }


    public static String require(String key) {
        String v = get(key);
        if (v == null || v.isBlank()) {
            throw new IllegalStateException("Missing config: " + key);
        }
        return v;
    }
}