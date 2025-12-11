package vn.edu.nlu.fit.mythuatshop.Service;

import vn.edu.nlu.fit.mythuatshop.Dao.OrderDao;
import vn.edu.nlu.fit.mythuatshop.Dao.OrderStatusDao;
import vn.edu.nlu.fit.mythuatshop.Dao.PaymentDao;
import vn.edu.nlu.fit.mythuatshop.Model.*;

import java.sql.Timestamp;
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
            return order;
        }
        return null;

    }
}
