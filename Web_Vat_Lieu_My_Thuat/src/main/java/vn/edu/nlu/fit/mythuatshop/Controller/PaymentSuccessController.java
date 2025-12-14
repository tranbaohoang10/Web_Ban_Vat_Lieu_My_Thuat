package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.mythuatshop.Model.Order;

import java.io.IOException;

@WebServlet(name = "PaymentSuccessController", value = "/payment-success")
public class PaymentSuccessController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy order đã lưu từ session
        HttpSession session = req.getSession();
        Order order = (Order) session.getAttribute("paidOrder");
        if (order == null) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }
        session.removeAttribute("paidOrder");

        req.setAttribute("order", order);
        req.getRequestDispatcher("/PaymentSuccess.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}