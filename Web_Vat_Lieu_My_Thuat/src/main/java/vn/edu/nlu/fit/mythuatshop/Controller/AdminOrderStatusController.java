package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.mythuatshop.Service.OrderService;

import java.io.IOException;

@WebServlet(name = "AdminOrderStatusController", urlPatterns = {"/admin/orders/status"})
public class AdminOrderStatusController extends HttpServlet {
    private OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        int orderId = Integer.parseInt(req.getParameter("orderId"));
        String newStatus = req.getParameter("statusName");

        boolean ok = orderService.adminUpdateOrderStatus(orderId, newStatus);

        String msg = ok ? "update_ok" : "update_fail";
        resp.sendRedirect(req.getContextPath() + "/admin/orders?msg=" + msg);
    }
}