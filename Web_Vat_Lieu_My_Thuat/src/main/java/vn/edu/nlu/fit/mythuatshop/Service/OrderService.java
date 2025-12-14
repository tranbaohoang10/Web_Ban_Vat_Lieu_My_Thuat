package vn.edu.nlu.fit.mythuatshop.Service;

import vn.edu.nlu.fit.mythuatshop.Dao.OrderDao;
import vn.edu.nlu.fit.mythuatshop.Dao.OrderStatusDao;
import vn.edu.nlu.fit.mythuatshop.Dao.PaymentDao;
import vn.edu.nlu.fit.mythuatshop.Model.*;
import vn.edu.nlu.fit.mythuatshop.Util.EmailUtil;

import java.util.ArrayList;
import java.util.List;

public class OrderService {
    private final OrderDao orderDao;
    private final PaymentDao paymentDao;
    private final OrderStatusDao orderStatusDao;

    public OrderService() {
        this.orderDao = new OrderDao();
        this.paymentDao = new PaymentDao();
        this.orderStatusDao = new OrderStatusDao();

    }

    public Order createOrder(Users user, Cart cart, String fullName, String email, String phone,
                             String address, String note, String paymentName, Integer voucherId) {
        if (user == null || cart == null || cart.cartSize() == 0) {
            return null;
        }
        Order order = new Order();
        order.setUserId(user.getId());
        order.setFullName(fullName);
        order.setEmail(email);
        order.setPhoneNumber(phone);
        order.setAddress(address);
        order.setNote(note);
        //Lấy paymentID từ bảng Payments dựa vào paymentName
        Payment payment = paymentDao.findByName(paymentName);
        if (payment == null) {
            payment = paymentDao.findByName("COD");
        }
        order.setPaymentId(payment.getId());
        OrderStatus status = orderStatusDao.findByName("Đang xử lý");
        if (status != null) {
            order.setOrderStatusId(status.getId());
        } else {
            order.setOrderStatusId(1);

        }
        order.setDiscount(cart.getDiscount());
        order.setVoucherId(voucherId);

        double totalToPay = cart.getTotalPriceToPay();
        order.setTotalPrice(totalToPay);

        List<OrderDetail> details = new ArrayList<>();
        for (CartItem item : cart.getCarts().values()) {
            OrderDetail d = new OrderDetail();
            d.setProductId(item.getProductId());
            d.setQuantity(item.getQuantity());
            d.setPrice(item.getPriceAfterDiscount()); // giá 1 sản phẩm đã trừ discountDefault
            details.add(d);
        }
        order.setItems(details);
        //Gọi Dao để insert vào DB (Orders + Order_Details)
        int newId = orderDao.insert(order);
        if (newId > 0) {
            order.setId(newId);
            try {
                String subject = "Xác nhận đơn hàng #DH" + newId;
                String html = buildOrderEmailHtml(order, cart, paymentName);
                EmailUtil.sendHtml(order.getEmail(), subject, html);
            } catch (Exception ex) {
                ex.printStackTrace();
            }

            return order;
        }
        return null;

    }



    public List<Order> getOrderHistory(int userId, String status) {
        Integer statusId = mapStatusToId(status);

        List<Order> orders = orderDao.findOrdersByUser(userId, statusId);
        for (Order o : orders) {
            List<OrderItem> items = orderDao.findOrderItemsView(o.getId());
            o.setViewItems(items);
        }
        return orders;
    }

    private Integer mapStatusToId(String status) {
        if (status == null || status.isBlank() || "all".equalsIgnoreCase(status)) {
            return null;
        }
        return switch (status.toLowerCase()) {
            case "pending" -> 1;
            case "shipping" -> 2;
            case "completed" -> 3;
            case "cancelled" -> 4;
            default -> null;
        };
    }
    public Order getOrderDetail(int userId, int orderId) {
        Order order = orderDao.findOrderHeaderByIdAndUser(orderId, userId);
        if (order == null) return null;

        order.setViewItems(orderDao.findOrderItemsView(orderId));
        return order;
    }
    private String buildOrderEmailHtml(Order order, Cart cart, String paymentName) {
        StringBuilder sb = new StringBuilder();

        sb.append("<h2>Thiên Long - Xác nhận đơn hàng</h2>");
        sb.append("<p>Chào ").append(escape(order.getFullName())).append(",</p>");

        sb.append("<p>");
        sb.append("Mã đơn hàng: <b>#").append(order.getId()).append("</b><br/>");
        sb.append("SĐT: ").append(escape(order.getPhoneNumber())).append("<br/>");
        sb.append("Địa chỉ: ").append(escape(order.getAddress())).append("<br/>");
        sb.append("Thanh toán: ").append(escape(paymentName)).append("<br/>");
        sb.append("</p>");

        if (order.getNote() != null && !order.getNote().trim().isEmpty()) {
            sb.append("<p>Ghi chú: ").append(escape(order.getNote())).append("</p>");
        }

        sb.append("<p><b>Danh sách sản phẩm:</b></p>");
        sb.append("<ul>");
        for (CartItem item : cart.getCarts().values()) {
            sb.append("<li>")
                    .append("SP #").append(item.getProductId())
                    .append(" - SL: ").append(item.getQuantity())
                    .append(" - Giá: ").append(formatVnd(item.getPriceAfterDiscount()))
                    .append("</li>");
        }
        sb.append("</ul>");

        sb.append("<p>");
        sb.append("Giảm giá: <b>").append(formatVnd(order.getDiscount())).append("</b><br/>");
        sb.append("Tổng thanh toán: <b>").append(formatVnd(order.getTotalPrice())).append("</b>");
        sb.append("</p>");

        sb.append("<p>Cảm ơn bạn đã mua hàng tại Thiên Long!</p>");

        return sb.toString();
    }

    private String formatVnd(double value) {
        long v = Math.round(value);
        return String.format("%,d", v).replace(',', '.') + " đ";
    }

    private String escape(String s) {
        if (s == null) return "";
        return s.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }


}
