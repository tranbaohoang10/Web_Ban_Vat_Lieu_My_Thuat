package vn.edu.nlu.fit.mythuatshop.Dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.nlu.fit.mythuatshop.Model.Order;
import vn.edu.nlu.fit.mythuatshop.Model.OrderDetail;
import vn.edu.nlu.fit.mythuatshop.Model.OrderItem;

import java.util.List;

public class OrderDao implements DaoInterface<Order> {
    private final Jdbi jdbi;

    public OrderDao() {
        this.jdbi = JDBIConnector.getJdbi();
    }

    public int insert(Order order) {
        // inTransaction sẽ mở transaction, chạy lambda, rồi commit/rollback
        return jdbi.inTransaction(handle -> {
            // 1. Insert vào Orders, lấy ID sinh ra
            int orderId = handle.createUpdate(
                            "INSERT INTO Orders (userID, fullName, email, phoneNumber, address, " +
                                    " totalPrice, paymentID, orderStatusID, voucherID, discount, note) " +
                                    "VALUES (:userID, :fullName, :email, :phoneNumber, :address, " +
                                    " :totalPrice, :paymentID, :orderStatusID, :voucherID, :discount, :note)")
                    .bind("userID", order.getUserId())
                    .bind("fullName", order.getFullName())
                    .bind("email", order.getEmail())
                    .bind("phoneNumber", order.getPhoneNumber())
                    .bind("address", order.getAddress())
                    .bind("totalPrice", order.getTotalPrice())
                    .bind("paymentID", order.getPaymentId())
                    .bind("orderStatusID", order.getOrderStatusId())
                    .bind("voucherID", order.getVoucherId())
                    .bind("discount", order.getDiscount())
                    .bind("note", order.getNote())
                    .executeAndReturnGeneratedKeys("ID")
                    .mapTo(Integer.class)
                    .one();

            // 2. Insert Order_Details cho từng sản phẩm trong giỏ
            for (OrderDetail d : order.getItems()) {
                handle.createUpdate(
                                "INSERT INTO Order_Details (orderID, productID, quantity, price) " +
                                        "VALUES (:orderID, :productID, :quantity, :price)")
                        .bind("orderID", orderId)
                        .bind("productID", d.getProductId())
                        .bind("quantity", d.getQuantity())
                        .bind("price", d.getPrice())
                        .execute();
            }

            // 3. Trả về orderId để hàm insert() nhận được
            return orderId;
        });
    }

    public List<Order> findOrdersByUser(int userId, Integer statusId) {
        String sql =
                "SELECT o.ID            AS id, " +
                        "       o.userID        AS userId, " +
                        "       o.fullName      AS fullName, " +
                        "       o.email         AS email, " +
                        "       o.phoneNumber   AS phoneNumber, " +
                        "       o.address       AS address, " +
                        "       o.totalPrice    AS totalPrice, " +
                        "       o.paymentID     AS paymentId, " +
                        "       o.orderStatusID AS orderStatusId, " +
                        "       o.voucherID     AS voucherId, " +
                        "       o.discount      AS discount, " +
                        "       o.createAt      AS createAt, " +
                        "       o.note          AS note, " +
                        "       os.statusName   AS statusName " +
                        "FROM Orders o " +
                        "JOIN Order_Statuses os ON os.ID = o.orderStatusID " +
                        "WHERE o.userID = :userId ";

        if (statusId != null) {
            sql += " AND o.orderStatusID = :statusId ";
        }

        sql += " ORDER BY o.createAt DESC";

        String finalSql = sql;

        return jdbi.withHandle(handle -> {
            var query = handle.createQuery(finalSql)
                    .bind("userId", userId);

            if (statusId != null) {
                query.bind("statusId", statusId);
            }

            return query.mapToBean(Order.class).list();
        });
    }

    public List<OrderItem> findOrderItemsView(int orderId) {
        String sql =
                "SELECT d.productID AS productId, " +
                        "       p.name      AS name, " +
                        "       p.thumbnail AS thumbnail, " +
                        "       d.quantity  AS quantity, " +
                        "       d.price     AS price " +
                        "FROM Order_Details d " +
                        "JOIN Products p ON p.ID = d.productID " +
                        "WHERE d.orderID = :orderId";

        return jdbi.withHandle(h ->
                h.createQuery(sql)
                        .bind("orderId", orderId)
                        .mapToBean(OrderItem.class)
                        .list()
        );
    }

    @Override
    public int update(Order order) {
        return 0;
    }

    @Override
    public int delete(Order id) {
        return 0;
    }

    @Override
    public Order findByName(String name) {
        return null;
    }
}


