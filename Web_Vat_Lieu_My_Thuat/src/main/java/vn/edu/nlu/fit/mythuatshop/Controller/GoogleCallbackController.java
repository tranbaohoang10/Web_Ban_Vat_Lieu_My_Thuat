package vn.edu.nlu.fit.mythuatshop.Controller;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.edu.nlu.fit.mythuatshop.Model.Users;
import vn.edu.nlu.fit.mythuatshop.Service.UserService;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet(name = "GoogleCallbackController", value = "/oauth2/callback/google")
public class GoogleCallbackController extends HttpServlet {

    private static final String CLIENT_ID = "client_id";
    private static final String CLIENT_SECRET = "client_secret";

    private UserService userService;

    @Override
    public void init() {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String code = req.getParameter("code");
        String state = req.getParameter("state");

        HttpSession session = req.getSession();
        String savedState = (String) session.getAttribute("OAUTH_STATE");
        session.removeAttribute("OAUTH_STATE");

        if (code == null || savedState == null || !savedState.equals(state)) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String redirectUri = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort()
                + req.getContextPath() + "/oauth2/callback/google";

        // 1) Exchange code -> access_token
        JsonObject tokenJson = exchangeCodeForToken(code, redirectUri);
        String accessToken = tokenJson.get("access_token").getAsString();

        // 2) Lấy userinfo (email, name, picture...)
        JsonObject userInfo = fetchUserInfo(accessToken);
        String email = userInfo.get("email").getAsString();
        String fullName = userInfo.has("name") ? userInfo.get("name").getAsString() : "";

        // 3) Map vào hệ thống của bạn: email là khóa
        // Nếu đã có user theo email -> login luôn
        Users user = userService.findByEmailForGG(email); // bạn cần thêm hàm này (bên dưới)
        if (user == null) {
            // tạo user mới (password random/không dùng)
            user = userService.registerGoogleUser(fullName, email); // bạn cần thêm hàm này
        }

        // 4) set session giống LoginController hiện tại
        session.setAttribute("currentUser", user);
        session.setMaxInactiveInterval(30 * 60);

        resp.sendRedirect(req.getContextPath() + "/home");
    }

    private JsonObject exchangeCodeForToken(String code, String redirectUri) throws IOException {
        URL url = new URL("https://oauth2.googleapis.com/token");
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("POST");
        con.setDoOutput(true);
        con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

        String body =
                "code=" + enc(code)
                        + "&client_id=" + enc(CLIENT_ID)
                        + "&client_secret=" + enc(CLIENT_SECRET )
                        + "&redirect_uri=" + enc(redirectUri)
                        + "&grant_type=authorization_code";

        try (OutputStream os = con.getOutputStream()) {
            os.write(body.getBytes(StandardCharsets.UTF_8));
        }

        String json = readAll(con);
        return JsonParser.parseString(json).getAsJsonObject();
    }

    private JsonObject fetchUserInfo(String accessToken) throws IOException {
        URL url = new URL("https://www.googleapis.com/oauth2/v3/userinfo");
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("Authorization", "Bearer " + accessToken);

        String json = readAll(con);
        return JsonParser.parseString(json).getAsJsonObject();
    }

    private static String readAll(HttpURLConnection con) throws IOException {
        InputStream is = (con.getResponseCode() >= 200 && con.getResponseCode() < 300)
                ? con.getInputStream()
                : con.getErrorStream();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8))) {
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) sb.append(line);
            return sb.toString();
        }
    }

    private static String enc(String s) {
        return URLEncoder.encode(s, StandardCharsets.UTF_8);
    }
}
