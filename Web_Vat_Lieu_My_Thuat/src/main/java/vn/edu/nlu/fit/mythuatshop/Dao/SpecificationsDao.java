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
}
