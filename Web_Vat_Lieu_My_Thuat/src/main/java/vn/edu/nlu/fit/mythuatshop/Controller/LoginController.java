package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.nlu.fit.mythuatshop.Model.Users;
import vn.edu.nlu.fit.mythuatshop.Service.UserService;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // 1. Validate rỗng (giữ của nhánh Login-register)
        if (email == null || password == null || email.isBlank() || password.isBlank()) {
            req.setAttribute("error", "Vui lòng nhập email và mật khẩu!");
            req.getRequestDispatcher("Login.jsp").forward(req, resp);
            return;
        }

        // 2. Gọi login 1 lần
        Users users = userService.login(email, password);

        // 3. Sai tài khoản/mật khẩu
        if (users == null) {
            req.setAttribute("error", "Sai email hoặc mật khẩu");
            req.getRequestDispatcher("Login.jsp").forward(req, resp);
            return;
        }

        // 4. Đúng -> lưu vào session với tên currentUser
        HttpSession session = req.getSession(true);
        session.setAttribute("currentUser", users);
        session.setMaxInactiveInterval(30 * 60); // 30 phút

        // 5. Redirect về home
        resp.sendRedirect(req.getContextPath() + "/home");
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Hiển thị trang đăng nhập
        req.getRequestDispatcher("Login.jsp").forward(req, resp);
    }
}