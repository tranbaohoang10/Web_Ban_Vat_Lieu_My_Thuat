package vn.edu.nlu.fit.mythuatshop.Dao;

import org.jdbi.v3.core.Handle;
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
        return jdbi.withHandle(handle -> handle.createQuery(sql).mapToBean(Product.class).list());
    }

    public List<Product> findByCategoryId(int categoryId) {
        String sql = "SELECT id, name, price, discountDefault, categoryId, " +
                "thumbnail, quantityStock, soldQuantity, status, createAt " +
                "FROM Products " +
                "WHERE  categoryId = :categoryId " +
                "ORDER BY soldQuantity DESC " +
                "LIMIT 10;";
        return jdbi.withHandle(
                handle -> handle.createQuery(sql).bind("categoryId", categoryId).mapToBean(Product.class).list());
    }

    public List<Product> findByCategoryIdTop5(int categoryId) {
        String sql = "SELECT id, name, price, discountDefault, categoryId, " +
                "thumbnail, quantityStock, soldQuantity, status, createAt " +
                "FROM Products " +
                "WHERE categoryId = :categoryId " +
                "ORDER BY soldQuantity DESC " +
                "LIMIT 6;";
        return jdbi.withHandle(
                handle -> handle.createQuery(sql).bind("categoryId", categoryId).mapToBean(Product.class).list());
    }

    public Product findByProductId(int productId) {
        String sql = "SELECT id, name, price, discountDefault, categoryId, " +
                "thumbnail, quantityStock, soldQuantity, status, createAt,brand " +
                "FROM Products " +
                "WHERE id = :productId ";
        return jdbi.withHandle(
                h -> h.createQuery(sql).bind("productId", productId).mapToBean(Product.class).findOne().orElse(null));
    }

    public List<Product> findByCategoryIdNoLimit(int categoryId) {
        String sql = "SELECT id, name, price, discountDefault, categoryId, " +
                "thumbnail, quantityStock, soldQuantity, status, createAt " +
                "FROM Products " +
                "WHERE  categoryId = :categoryId " +
                "ORDER BY soldQuantity DESC ;";
        return jdbi.withHandle(
                handle -> handle.createQuery(sql).bind("categoryId", categoryId).mapToBean(Product.class).list());
    }

    public List<Product> findByCategoryWithFilter(int categoryId,
                                                  Double minPrice,
                                                  Double maxPrice,
                                                  String sort) {

        StringBuilder sql = new StringBuilder(
                "SELECT * FROM products WHERE categoryId = :categoryId ");

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

    public List<Product> findByCategoryWithFilter(int categoryId,
                                                  Double minPrice,
                                                  Double maxPrice,
                                                  String sort,
                                                  int offset,
                                                  int limit) {

        StringBuilder sql = new StringBuilder(
                "SELECT * FROM products WHERE categoryId = :categoryId ");

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

        sql.append(" LIMIT :limit OFFSET :offset");

        return JDBIConnector.getJdbi().withHandle(handle -> {
            var query = handle.createQuery(sql.toString())
                    .bind("categoryId", categoryId)
                    .bind("limit", limit)
                    .bind("offset", offset);

            if (minPrice != null) {
                query.bind("minPrice", minPrice);
            }
            if (maxPrice != null) {
                query.bind("maxPrice", maxPrice);
            }

            return query.mapToBean(Product.class).list();
        });
    }

    public int countProductsByCategory(int categoryId, Double minPrice, Double maxPrice) {
        StringBuilder sql = new StringBuilder(
                "SELECT COUNT(*) FROM products WHERE categoryId = :categoryId ");

        if (minPrice != null) {
            sql.append(" AND price * (100.0 - discountDefault) / 100.0 >= :minPrice");
        }
        if (maxPrice != null) {
            sql.append(" AND price * (100.0 - discountDefault) / 100.0 <= :maxPrice");
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

            return query.mapTo(Integer.class).one();
        });
    }

    public List<Product> getProductSearch(String productName) {
        String sql = "SELECT id, name, price, discountDefault, categoryId, " +
                "thumbnail, quantityStock, soldQuantity, status, createAt " +
                "FROM Products " +
                "WHERE name LIKE CONCAT('%', :productName, '%')";

        return jdbi.withHandle(
                handle -> handle.createQuery(sql).bind("productName", productName).mapToBean(Product.class).list());
    }

    public List<Product> getProductSearch(String productName, String sort, int offset, int limit) {
        StringBuilder sql = new StringBuilder(
                "SELECT id, name, price, discountDefault, categoryId, " +
                        "thumbnail, quantityStock, soldQuantity, status, createAt " +
                        "FROM Products " +
                        "WHERE name LIKE CONCAT('%', :productName, '%') ");

        if (sort != null && !sort.isEmpty()) {
            switch (sort) {
                case "priceAsc":
                    sql.append(" ORDER BY price * (100.0 - discountDefault) / 100.0 ASC");
                    break;
                case "priceDesc":
                    sql.append(" ORDER BY price * (100.0 - discountDefault) / 100.0 DESC");
                    break;
                case "newest":
                    sql.append(" ORDER BY createAt DESC");
                    break;
                case "soldDesc":
                    sql.append(" ORDER BY soldQuantity DESC");
                    break;
                default:
                    sql.append(" ORDER BY soldQuantity DESC");
                    break;
            }
        }
        sql.append(" LIMIT :limit OFFSET :offset");

        return jdbi.withHandle(handle -> handle.createQuery(sql.toString())
                .bind("productName", productName).bind("limit", limit)
                .bind("offset", offset)
                .mapToBean(Product.class)
                .list());
    }

    public int countProductSearch(String productName) {
        String sql = "SELECT COUNT(*) FROM Products " +
                "WHERE name LIKE CONCAT('%', :productName, '%')";
        return jdbi.withHandle(h -> h.createQuery(sql)
                .bind("productName", productName)
                .mapTo(Integer.class)
                .one());
    }

    public int updateStockAndSold(Handle handle, int productId, int qty) {
        String sql = """
                    UPDATE products
                    SET quantityStock = quantityStock - :qty,
                        soldQuantity = soldQuantity + :qty
                    WHERE ID = :pid
                      AND quantityStock >= :qty
                """;
        return handle.createUpdate(sql)
                .bind("pid", productId)
                .bind("qty", qty)
                .execute();
    }

}
