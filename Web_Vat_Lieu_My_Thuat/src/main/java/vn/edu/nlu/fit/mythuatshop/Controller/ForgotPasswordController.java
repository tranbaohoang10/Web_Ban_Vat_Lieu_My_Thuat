package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.mythuatshop.Service.UserService;

import java.io.IOException;

@WebServlet("/forgotpassword")
public class ForgotPasswordController extends HttpServlet {
    private UserService userService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        userService = new UserService();
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        if (email == null || email.trim().isEmpty()) {
            req.setAttribute("error", "Vui lòng nhập email!");
            req.getRequestDispatcher("ForgotPassword.jsp").forward(req, resp);
            return;
        }
        boolean ok = userService.resetAndSendEmail(email);
        if (!ok) {
            req.setAttribute("error", "Email chưa được đăng ký!");
        } else {
            req.setAttribute("success", "Kiểm tra email nhận mật khẩu mới.");
        }
        req.getRequestDispatcher("ForgotPassword.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("ForgotPassword.jsp").forward(req, resp);
    }
}
