package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.nlu.fit.mythuatshop.Model.Cart;
import vn.edu.nlu.fit.mythuatshop.Model.Order;
import vn.edu.nlu.fit.mythuatshop.Model.Users;
import vn.edu.nlu.fit.mythuatshop.Service.OrderService;

import java.io.IOException;

@WebServlet(name = "PlaceOrderController", value = "/place-order")
public class PlaceOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderService orderService = new OrderService();

        HttpSession session = req.getSession();
        Users currentUser = (Users) session.getAttribute("currentUser");
        if (currentUser == null) {
            resp.sendRedirect("login");
            return;
        }
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.cartSize() == 0) {
            resp.sendRedirect("/Cart.jsp");
            return;
        }
        req.setCharacterEncoding("UTF-8");
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String note = req.getParameter("note");
        String paymentName = req.getParameter("payment");
        // voucher chưa làm để tạm là null
        Integer voucherId = null;
        Order order = orderService.createOrder(currentUser, cart, fullName, email, phone,
                address, note, paymentName, voucherId);
        if (order != null) {
            // Xóa giỏ hàng sau khi đặt hàng thành công
            session.removeAttribute("cart");
            session.setAttribute("cartCount", 0);
            req.setAttribute("order", order);
            req.getRequestDispatcher("/PaymentSuccess.jsp").forward(req, resp);

        }else {
            req.setAttribute("errorMessage", "Đặt hàng thất bại, vui lòng thử lại.");
            req.getRequestDispatcher("/InfoPayment.jsp").forward(req, resp);
        }
    }
}