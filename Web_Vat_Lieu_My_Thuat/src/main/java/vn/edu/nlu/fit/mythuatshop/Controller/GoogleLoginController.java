package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.Base64;
import vn.edu.nlu.fit.mythuatshop.Util.Env;


@WebServlet(name = "GoogleLoginController", value = "/oauth2/google")
public class GoogleLoginController extends HttpServlet {


    private static final String CLIENT_ID = "client_id";
    private static final String SCOPE = "openid email profile";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();

        // state để chống CSRF
        String state = genState();
        session.setAttribute("OAUTH_STATE", state);

        String redirectUri = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort()
                + req.getContextPath() + "/oauth2/callback/google";

        String url =
                "https://accounts.google.com/o/oauth2/v2/auth"
                        + "?client_id=" + enc(CLIENT_ID)
                        + "&redirect_uri=" + enc(redirectUri)
                        + "&response_type=code"
                        + "&scope=" + enc(SCOPE)
                        + "&state=" + enc(state)
                        + "&access_type=offline"
                        + "&prompt=consent";

        resp.sendRedirect(url);
    }

    private static String enc(String s) {
        return URLEncoder.encode(s, StandardCharsets.UTF_8);
    }

    private static String genState() {
        byte[] b = new byte[32];
        new SecureRandom().nextBytes(b);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(b);
    }
}
