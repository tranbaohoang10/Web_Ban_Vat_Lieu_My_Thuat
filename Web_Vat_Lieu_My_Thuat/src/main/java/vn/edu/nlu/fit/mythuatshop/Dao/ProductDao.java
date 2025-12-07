package vn.edu.nlu.fit.mythuatshop.Dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.nlu.fit.mythuatshop.Model.Product;

import java.util.List;

public class ProductDao {
    private final Jdbi jdbi;

    public ProductDao() {
        jdbi = JDBIConnector.getJdbi();
    }

    public List<Product> findAll() {
        String sql = "SELECT id, name, price, discountDefault, categoryId, " +
                "thumbnail, quantityStock, soldQuantity, status, createAt " +
                "FROM Products ";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql).mapToBean(Product.class).list());
    }

    public List<Product> findByCategoryId(int categoryId) {
        String sql = "SELECT id, name, price, discountDefault, categoryId, " +
                "thumbnail, quantityStock, soldQuantity, status, createAt " +
                "FROM Products " +
                "WHERE  categoryId = :categoryId " +
                "ORDER BY soldQuantity DESC " +
                "LIMIT 10;";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql).bind("categoryId", categoryId).mapToBean(Product.class).list());
    }

    public List<Product> findByCategoryIdTop5(int categoryId) {
        String sql = "SELECT id, name, price, discountDefault, categoryId, " +
                "thumbnail, quantityStock, soldQuantity, status, createAt " +
                "FROM Products " +
                "WHERE categoryId = :categoryId " +
                "ORDER BY soldQuantity DESC " +
                "LIMIT 6;";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql).bind("categoryId", categoryId).mapToBean(Product.class).list());
    }

    public Product findByProductId(int productId) {
        String sql = "SELECT id, name, price, discountDefault, categoryId, " +
                "thumbnail, quantityStock, soldQuantity, status, createAt,brand " +
                "FROM Products " +
                "WHERE id = :productId ";
        return jdbi.withHandle(h -> h.createQuery(sql).bind("productId", productId).mapToBean(Product.class).findOne().orElse(null));
    }

    public List<Product> findByCategoryIdNoLimit(int categoryId) {
        String sql = "SELECT id, name, price, discountDefault, categoryId, " +
                "thumbnail, quantityStock, soldQuantity, status, createAt " +
                "FROM Products " +
                "WHERE  categoryId = :categoryId " +
                "ORDER BY soldQuantity DESC ;";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql).bind("categoryId", categoryId).mapToBean(Product.class).list());
    }
    public List<Product> findByCategoryWithFilter(int categoryId,
                                                  Double minPrice,
                                                  Double maxPrice,
                                                  String sort) {

        StringBuilder sql = new StringBuilder(
                "SELECT * FROM products WHERE categoryId = :categoryId "
        );

        if (minPrice != null) {
            sql.append(" AND price * (100.0 - discountDefault) / 100.0 >= :minPrice");
        }
        if (maxPrice != null) {
            sql.append(" AND price * (100.0 - discountDefault) / 100.0 <= :maxPrice");
        }

        // ===== SẮP XẾP =====
        if ("priceAsc".equals(sort)) {
            sql.append(" ORDER BY price * (100.0 - discountDefault) / 100.0 ASC");
        } else if ("priceDesc".equals(sort)) {
            sql.append(" ORDER BY price * (100.0 - discountDefault) / 100.0 DESC");
        } else if ("newest".equals(sort)) {
            sql.append(" ORDER BY createAt DESC");
        } else {
            sql.append(" ORDER BY createAt DESC");
        }

        return JDBIConnector.getJdbi().withHandle(handle -> {
            var query = handle.createQuery(sql.toString())
                    .bind("categoryId", categoryId);

            if (minPrice != null) {
                query.bind("minPrice", minPrice);
            }
            if (maxPrice != null) {
                query.bind("maxPrice", maxPrice);
            }

            return query.mapToBean(Product.class).list();
        });
    }
    public List<Product> getProductFilter(String productName ) {
        String sql = "SELECT id, name, price, discountDefault, categoryId, " +
                "thumbnail, quantityStock, soldQuantity, status, createAt " +
                "FROM Products " +
                "WHERE  name = :productName " ;

        return jdbi.withHandle(handle ->handle.createQuery(sql).bind("productName", productName).mapToBean(Product.class).list());
    }

}
