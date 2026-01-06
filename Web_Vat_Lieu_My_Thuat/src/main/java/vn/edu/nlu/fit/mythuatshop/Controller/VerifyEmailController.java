package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.mythuatshop.Service.UserService;

import java.io.IOException;

@WebServlet(name = "VerifyEmailController", value = "/verify-email")
public class VerifyEmailController extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String token = req.getParameter("token");

        boolean ok = userService.verifyEmailToken(token);
        if (ok) {
            resp.sendRedirect(req.getContextPath() + "/login?verify=success");
        } else {
            resp.sendRedirect(req.getContextPath() + "/login?verify=failed");
        }
    }
}
