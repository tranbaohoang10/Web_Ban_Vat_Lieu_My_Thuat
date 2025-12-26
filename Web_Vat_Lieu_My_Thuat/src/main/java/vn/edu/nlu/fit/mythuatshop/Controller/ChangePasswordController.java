package vn.edu.nlu.fit.mythuatshop.Controller;

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

@WebServlet("/change-password")
public class ChangePasswordController extends HttpServlet {
    private UserService userService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession(false);
        Users currentUser = (session != null) ? (Users) session.getAttribute("currentUser") : null;
        if (currentUser == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String oldRaw    = req.getParameter("matkhaucu");
        String newRaw    = req.getParameter("matkhaumoi");
        String confirmRaw = req.getParameter("nhaplaimkmoi");

        String matkhaucu    = oldRaw    != null ? oldRaw.trim()    : "";
        String matkhaumoi   = newRaw    != null ? newRaw.trim()    : "";
        String nhaplaimkmoi = confirmRaw!= null ? confirmRaw.trim(): "";

        String error = null;

        // Chưa nhập mật khẩu cũ
        if (matkhaucu.isEmpty()) {
            error = "Vui lòng nhập mật khẩu cũ!";
        }
        // Chưa nhập mật khẩu mới
        else if (matkhaumoi.isEmpty()) {
            error = "Vui lòng nhập mật khẩu mới!";
        }
        else if (!matkhaumoi.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*[^A-Za-z0-9]).{8,}$")) {
            error = "Mật khẩu mới phải có ít nhất 8 ký tự, có chữ hoa, chữ thường và ký tự đặc biệt.";
        }
        // Chưa nhập lại mật khẩu mới
        else if (nhaplaimkmoi.isEmpty()) {
            error = "Vui lòng nhập lại mật khẩu mới!";
        }
        // Mật khẩu mới phải khác mật khẩu cũ
        else if (matkhaumoi.equals(matkhaucu)) {
            error = "Mật khẩu mới phải khác mật khẩu cũ!";
        }
        // Mật khẩu mới và nhập lại không khớp
        else if (!matkhaumoi.equals(nhaplaimkmoi)) {
            error = "Nhập lại mật khẩu mới không khớp!";
        }

        if (error != null) {
            req.setAttribute("error", error);
            req.getRequestDispatcher("ChangePassword.jsp").forward(req, resp);
            return;
        }

        // Kiểm tra mật khẩu cũ đúng không + đổi mật khẩu
        boolean success = userService.changePassword(currentUser.getId(), matkhaucu, matkhaumoi);

        if (!success) {
            // TH này là mật khẩu cũ sai
            req.setAttribute("error", "Mật khẩu cũ không đúng!");
            req.getRequestDispatcher("ChangePassword.jsp").forward(req, resp);
            return;
        }

        // Thành công
        req.setAttribute("success", true);
        req.getRequestDispatcher("ChangePassword.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        Users currentUser = (session != null) ? (Users) session.getAttribute("currentUser") : null;

        if (currentUser == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        req.getRequestDispatcher("ChangePassword.jsp").forward(req, resp);
    }
}
