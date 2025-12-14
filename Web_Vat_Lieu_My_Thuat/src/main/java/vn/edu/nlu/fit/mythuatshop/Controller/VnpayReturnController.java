package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.mythuatshop.Model.Order;
import vn.edu.nlu.fit.mythuatshop.Service.OrderService;
import vn.edu.nlu.fit.mythuatshop.Service.VnpayService;

import java.io.IOException;

@WebServlet(name = "VnpayReturnController", value = "/vnpay-return")
public class VnpayReturnController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        VnpayService vnpayService = new VnpayService();
        OrderService orderService = new OrderService();
        // 1) verify chữ ký
        if (!vnpayService.verifyReturn(req)) {
            req.setAttribute("errorMessage", "Dữ liệu VNPAY trả về không hợp lệ .");
            req.getRequestDispatcher("/InfoPayment.jsp").forward(req, resp);
            return;
        }
        // 2) lấy dữ liệu
        String responseCode = req.getParameter("vnp_ResponseCode");         // "00" là OK
        String tranStatus   = req.getParameter("vnp_TransactionStatus");    // "00" là OK
        String txnRef       = req.getParameter("vnp_TxnRef");               // orderId
        String amountStr    = req.getParameter("vnp_Amount");               // *100

        int orderId = Integer.parseInt(txnRef);
        long amountVnd = Long.parseLong(amountStr) / 100;

        boolean success = "00".equals(responseCode) && "00".equals(tranStatus);

        if (!success) {
            // Thanh toán fail / hủy
            orderService.markVnpayFailed(orderId);
            req.setAttribute("errorMessage", "Thanh toán VNPAY thất bại hoặc bị hủy.");
            req.getRequestDispatcher("/InfoPayment.jsp").forward(req, resp);
            return;
        }

        // 3) Thanh toán OK -> xác nhận đơn
        Order paidOrder = orderService.confirmVnpayPaid(orderId, amountVnd);
        if (paidOrder == null) {
            req.setAttribute("errorMessage", "Không thể xác nhận thanh toán (có thể đơn không tồn tại / sai tiền / thiếu tồn kho).");
            req.getRequestDispatcher("/InfoPayment.jsp").forward(req, resp);
            return;
        }

        // 4) xóa cart sau khi thanh toán thành công
        HttpSession session = req.getSession();
        session.removeAttribute("cart");
        session.setAttribute("cartCount", 0);

        req.setAttribute("order", paidOrder);
        req.getRequestDispatcher("/PaymentSuccess.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}