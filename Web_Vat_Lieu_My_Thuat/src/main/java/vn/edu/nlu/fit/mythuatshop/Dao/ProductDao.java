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
                "WHERE  categoryId = :categoryId "+
                "ORDER BY soldQuantity DESC " +
                "LIMIT 10;";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql).bind("categoryId",categoryId).mapToBean(Product.class).list());
    }
    }
