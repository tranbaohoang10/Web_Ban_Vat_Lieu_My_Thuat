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

@WebServlet ("/change-password")
public class ChangePasswordController extends HttpServlet {
    private UserService userService ;

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
            resp.sendRedirect(req.getContextPath()+"/login");
            return;
        }
        String matkhaucu = req.getParameter("matkhaucu");
        String matkhaumoi = req.getParameter("matkhaumoi");

        if(matkhaumoi==null || matkhaumoi.trim().isEmpty()){
            req.setAttribute("error", "Vui lòng nhập mật khẩu mới!");
            req.getRequestDispatcher("ChangePassword.jsp").forward(req,resp);
            return;
        }

        boolean success = userService.changePassword(currentUser.getId(), matkhaucu, matkhaumoi);

        if(!success){
            req.setAttribute("error", "Mật khẩu cũ không đúng!");
            req.getRequestDispatcher("ChangePassword.jsp").forward(req,resp);
            return;
        }
       req.setAttribute("success", true);
        req.getRequestDispatcher("ChangePassword.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      HttpSession session = req.getSession(false);
      Users currentUser = (session != null) ? (Users) session.getAttribute("currentUser") : null;

      if (currentUser == null) {
            resp.sendRedirect(req.getContextPath()+"/login");
            return;
      }
      req.getRequestDispatcher("ChangePassword.jsp").forward(req,resp);
    }
}
