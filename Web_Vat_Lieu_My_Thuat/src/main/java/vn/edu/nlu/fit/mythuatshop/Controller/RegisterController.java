package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.mythuatshop.Service.UserService;

import java.io.IOException;

@WebServlet(name = "RegisterController", value = "/register")
public class RegisterController extends HttpServlet {
    private UserService userService = new UserService();


    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("DangKy.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      req.setCharacterEncoding("UTF-8");
      resp.setCharacterEncoding("UTF-8");

      String fullName = req.getParameter("fullName");
      String email = req.getParameter("email");
      String password = req.getParameter("password");
      String phoneNumber = req.getParameter("phoneNumber");
      String address = req.getParameter("address");

      boolean success = userService.register(fullName, email, phoneNumber, password, address);
      if(!success){
          req.setAttribute("error", "Email đã được sử dụng, vui lòng nhập email khác!");
          req.getRequestDispatcher("DangKy.jsp").forward(req,resp);
          return;
      }

            resp.sendRedirect(req.getContextPath() + "/register?success=true");

    }

}
