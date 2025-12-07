package vn.edu.nlu.fit.mythuatshop.Dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.nlu.fit.mythuatshop.Model.Cart;

import java.util.List;

public class CartDao {
    private final Jdbi jdbi;
    public CartDao() {
        this.jdbi = JDBIConnector.getJdbi();
    }
    // Thêm sản phẩm vào giỏ: nếu đã tồn tại thì cộng dồn quantity
    public void addToCart(int userId, int productId, int quantity) {
        jdbi.useHandle(h -> {
            String selectSql = "SELECT quantity FROM carts " +
                    "WHERE userID = :sid AND productID = :pid";

            Integer currentQty = h.createQuery(selectSql)
                    .bind("sid", userId)
                    .bind("pid", productId)
                    .mapTo(Integer.class)
                    .findOne()
                    .orElse(null);

            if (currentQty == null) { // chưa có -> insert
                String insertSql = "INSERT INTO carts(userID, productID, quantity, createAt) " +
                        "VALUES (:sid, :pid, :qty, NOW())";
                h.createUpdate(insertSql)
                        .bind("sid", userId)
                        .bind("pid", productId)
                        .bind("qty", quantity)
                        .execute();
            } else { // đã có -> update quantity
                String updateSql = "UPDATE carts SET quantity = :qty " +
                        "WHERE userID = :sid AND productID = :pid";
                h.createUpdate(updateSql)
                        .bind("sid", userId)
                        .bind("pid", productId)
                        .bind("qty", currentQty + quantity)
                        .execute();
            }
        });
    }

    // Tổng số lượng sản phẩm trong giỏ của 1 user
    public int getTotalQuantityByUser(int userId) {
        String sql = "SELECT COALESCE(SUM(quantity), 0) FROM carts WHERE userID = :sid";
        return jdbi.withHandle(h ->
                h.createQuery(sql)
                        .bind("sid", userId)
                        .mapTo(Integer.class)
                        .one()
        );
    }

    // Lấy list cart theo user (sau này dùng cho trang GioHang.jsp)
    public List<Cart> findByUser(int userId) {
        String sql = "SELECT id, userID, productID, quantity, createAt " +
                "FROM carts WHERE userID = :sid";
        return jdbi.withHandle(h ->
                h.createQuery(sql)
                        .bind("sid", userId)
                        .mapToBean(Cart.class)
                        .list()
        );
    }
}
