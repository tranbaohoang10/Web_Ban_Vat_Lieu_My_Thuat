package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.mythuatshop.Model.Order;
import vn.edu.nlu.fit.mythuatshop.Model.Users;
import vn.edu.nlu.fit.mythuatshop.Service.OrderService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderHistoryController", value = "/order-history")
public class OrderHistoryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         OrderService orderService = new OrderService();
         HttpSession session = request.getSession();
        Users currentUser  = (Users) session.getAttribute("currentUser");
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        String status = request.getParameter("status");
        if (status == null || status.isBlank()) {
            status = "all";
        }
        List<Order> orders = orderService.getOrderHistory(currentUser.getId(), status);
        request.setAttribute("orders",orders);
        request.setAttribute("currentStatus", status);
        request.getRequestDispatcher("/OrderHistory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}