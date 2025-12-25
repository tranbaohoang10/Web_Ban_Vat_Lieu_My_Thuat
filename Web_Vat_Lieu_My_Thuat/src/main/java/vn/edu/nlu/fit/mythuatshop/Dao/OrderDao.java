package vn.edu.nlu.fit.mythuatshop.Dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.nlu.fit.mythuatshop.Model.Order;
import vn.edu.nlu.fit.mythuatshop.Model.OrderDetail;
import vn.edu.nlu.fit.mythuatshop.Model.OrderItem;

import java.util.List;

public class OrderDao implements DaoInterface<Order> {
    private final Jdbi jdbi;
    private final ProductDao productDao = new ProductDao();


    public OrderDao() {
        this.jdbi = JDBIConnector.getJdbi();
    }

    public int insert(Order order, boolean updateInventory) {
        // inTransaction sẽ mở transaction, chạy lambda, rồi commit/rollback
        return jdbi.inTransaction(handle -> {
            // 1. Insert vào Orders, lấy ID sinh ra
            String sql = "INSERT INTO Orders (userID, fullName, email, phoneNumber, address, " +
                    " totalPrice, paymentID, orderStatusID, voucherID, discount,shippingFee, note) " +
                    "VALUES (:userID, :fullName, :email, :phoneNumber, :address, " +
                    " :totalPrice, :paymentID, :orderStatusID, :voucherID, :discount,:shippingFee, :note)";
            int orderId = handle.createUpdate(sql)
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
                    .bind("shippingFee", order.getShippingFee())
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
            //3.  Update tồn kho + số bán
            if (updateInventory) {
                for (OrderDetail d : order.getItems()) {
                    int affected = productDao.updateStockAndSold(handle, d.getProductId(), d.getQuantity());
                    if (affected == 0) {
                        // Không đủ hàng ->  rollback toàn bộ
                        throw new IllegalStateException("Không đủ tồn kho cho sản phẩm : " + d.getProductId());
                    }
                }
            }
            // 4. Trả về orderId để hàm insert() nhận được
            return orderId;
        });
    }

    public Order confirmVnpayPaid(int orderId, long amountVnd) {
        return jdbi.inTransaction(handle -> {
            String sql = """
                        SELECT ID, userID, fullName, email, phoneNumber, address,
                               totalPrice, paymentID, orderStatusID, voucherID, discount,shippingFee, note
                        FROM Orders
                        WHERE ID = :id
                    """;
            // 1) Lấy order (để check tồn tại + lấy email gửi mail sau)
            Order order = handle.createQuery(sql)
                    .bind("id", orderId)
                    .map((rs, ctx) -> {
                        Order o = new Order();
                        o.setId(rs.getInt("ID"));
                        o.setUserId(rs.getInt("userID"));
                        o.setFullName(rs.getString("fullName"));
                        o.setEmail(rs.getString("email"));
                        o.setPhoneNumber(rs.getString("phoneNumber"));
                        o.setAddress(rs.getString("address"));
                        o.setTotalPrice(rs.getDouble("totalPrice"));
                        o.setPaymentId(rs.getInt("paymentID"));
                        o.setOrderStatusId(rs.getInt("orderStatusID"));
                        o.setVoucherId((Integer) rs.getObject("voucherID"));
                        o.setDiscount(rs.getDouble("discount"));
                        o.setShippingFee(rs.getDouble("shippingFee"));
                        o.setNote(rs.getString("note"));
                        return o;
                    })
                    .findOne()
                    .orElse(null);

            if (order == null) return null;

            // 2) Check tiền: vnp_Amount/100 phải match totalPrice (làm tròn 0 lẻ)
            long dbAmountVnd = java.math.BigDecimal.valueOf(order.getTotalPrice())
                    .setScale(0, java.math.RoundingMode.HALF_UP)
                    .longValue();

            if (dbAmountVnd != amountVnd) {
                throw new IllegalStateException("Sai số tiền thanh toán cho đơn hàng #DH0=" + orderId);
            }

            // 3) Lấy Order_Details
            List<OrderDetail> details = handle.createQuery("""
                                SELECT productID, quantity, price
                                FROM Order_Details
                                WHERE orderID = :oid
                            """)
                    .bind("oid", orderId)
                    .map((rs, ctx) -> {
                        OrderDetail d = new OrderDetail();
                        d.setProductId(rs.getInt("productID"));
                        d.setQuantity(rs.getInt("quantity"));
                        d.setPrice(rs.getDouble("price"));
                        return d;
                    })
                    .list();

            // 4) Trừ kho + tăng sold (rollback nếu thiếu hàng)
            for (OrderDetail d : details) {
                int affected = productDao.updateStockAndSold(handle, d.getProductId(), d.getQuantity());
                if (affected == 0) {
                    throw new IllegalStateException("Không đủ tồn kho cho sản phẩm: " + d.getProductId());
                }
            }

            // 5) Update status -> "Đang xử lý"
            // (lấy id status bằng subquery theo tên)
            handle.createUpdate("""
                                UPDATE Orders
                                SET orderStatusID = (
                                    SELECT ID FROM Order_Statuses WHERE statusName = 'Đang xử lý' LIMIT 1
                                )
                                WHERE ID = :id
                            """)
                    .bind("id", orderId)
                    .execute();

            // trả order (gắn items để controller forward)
            order.setItems(details);
            return order;
        });
    }

    public void markVnpayFailed(int orderId) {
        String sql = """
                    UPDATE Orders
                    SET orderStatusID = (
                        SELECT ID FROM Order_Statuses WHERE statusName = 'Thanh toán thất bại' LIMIT 1
                    )
                    WHERE ID = :id
                """;
        jdbi.useHandle(handle -> handle.createUpdate(sql)
                .bind("id", orderId)
                .execute()
        );
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
                        "       o.shippingFee AS shippingFee, "+
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

    public Order findOrderHeaderByIdAndUser(int orderId, int userId) {
        String sql = "SELECT o.ID            AS id, " +
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
                "       o.shippingFee AS shippingFee, "+
                "       o.createAt      AS createAt, " +
                "       o.note          AS note, " +
                "       os.statusName   AS statusName, " +
                "       p.paymentName   AS paymentName " +
                "FROM Orders o " +
                "JOIN Order_Statuses os ON os.ID = o.orderStatusID " +
                "JOIN payments p ON p.ID = o.paymentID " +
                "WHERE o.ID = :orderId AND o.userID = :userId";

        return jdbi.withHandle(h ->
                h.createQuery(sql)
                        .bind("orderId", orderId)
                        .bind("userId", userId)
                        .mapToBean(Order.class)
                        .findOne()
                        .orElse(null)
        );
    }

    public boolean cancelOrder(int orderId, int userId) {
        String sql = """
                    UPDATE Orders
                    SET orderStatusID = 4
                    WHERE ID = :orderId
                      AND userID = :userId
                      AND orderStatusID = 1
                """;

        int affected = jdbi.withHandle(h ->
                h.createUpdate(sql)
                        .bind("orderId", orderId)
                        .bind("userId", userId)
                        .execute()
        );

        return affected == 1;
    }


    @Override
    public int insert(Order order) {
        return 0;
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


