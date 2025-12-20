package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.nlu.fit.mythuatshop.Model.Users;
import vn.edu.nlu.fit.mythuatshop.Service.OrderService;

import java.io.IOException;

@WebServlet(name = "CancelOrderController", value = "/cancel-order")
public class CancelOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderService orderService = new OrderService();
        HttpSession session = req.getSession();
        Users currentUser = (Users) session.getAttribute("currentUser");
        if (currentUser == null) {
            resp.sendRedirect("login");
            return;
        }

        String idRaw = req.getParameter("id");
        int orderId;

        try {
            orderId = Integer.parseInt(idRaw);
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/order-history?status=all&msg=cancel_fail");
            return;
        }

        boolean ok = orderService.cancelOrder(currentUser.getId(), orderId);
        resp.sendRedirect(req.getContextPath()
                + "/order-history?status=all&msg=" + (ok ? "cancel_ok" : "cancel_fail"));
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}