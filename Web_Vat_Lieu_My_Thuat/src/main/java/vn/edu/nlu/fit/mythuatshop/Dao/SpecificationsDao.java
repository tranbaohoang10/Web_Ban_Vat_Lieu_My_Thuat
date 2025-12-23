package vn.edu.nlu.fit.mythuatshop.Dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.nlu.fit.mythuatshop.Model.Category;
import vn.edu.nlu.fit.mythuatshop.Model.Specification;

import java.util.List;

public class SpecificationsDao {
    public final Jdbi jdbi;
    public SpecificationsDao() {
        this.jdbi = JDBIConnector.getJdbi();
    }
    public List<Specification> specificationsList(){
        String sql = "SELECT id,productID,Size,Standard,MadeIn,Warning FROM specifications ";
        return jdbi.withHandle(h ->
            h.createQuery(sql).mapToBean(Specification.class).list()
        );
    }
    public List<Specification> findByProductId(int productId) {
        String sql = "SELECT id, productID, Size, Standard, MadeIn, Warning " +
                "FROM specifications " +
                "WHERE productID = :productId";
        return jdbi.withHandle(h ->
                h.createQuery(sql)
                        .bind("productId", productId)
                        .mapToBean(Specification.class)
                        .list()
        );
    }
    public int upsert(int productId, String size, String standard, String madeIn, String warning) {
        // nếu có thì update
        String updateSql = """
        UPDATE specifications
        SET Size = :size,
            Standard = :standard,
            MadeIn = :madeIn,
            Warning = :warning
        WHERE productID = :productId
    """;

        int updated = jdbi.withHandle(h -> h.createUpdate(updateSql)
                .bind("productId", productId)
                .bind("size", size)
                .bind("standard", standard)
                .bind("madeIn", madeIn)
                .bind("warning", warning)
                .execute());

        if (updated > 0) return updated;

        // nếu chưa có thì insert
        String insertSql = """
        INSERT INTO specifications(productID, Size, Standard, MadeIn, Warning)
        VALUES (:productId, :size, :standard, :madeIn, :warning)
    """;

        return jdbi.withHandle(h -> h.createUpdate(insertSql)
                .bind("productId", productId)
                .bind("size", size)
                .bind("standard", standard)
                .bind("madeIn", madeIn)
                .bind("warning", warning)
                .execute());
    }

}
