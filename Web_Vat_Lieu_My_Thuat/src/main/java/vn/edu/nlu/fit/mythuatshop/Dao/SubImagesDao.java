package vn.edu.nlu.fit.mythuatshop.Dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.nlu.fit.mythuatshop.Model.Subimages;

import java.util.List;

public class SubImagesDao {
    public final Jdbi jdbi;
    public SubImagesDao() {
        this.jdbi = JDBIConnector.getJdbi();
    }
    public List<Subimages> subimagesList(){
        String sql = "SELECT id,productID,image from subimages";
        return jdbi.withHandle(h -> h.createQuery(sql).mapToBean(Subimages.class).list());
    }
    public List<Subimages> findByProductId(int productId) {
        String sql = "SELECT id, productID, image " +
                "FROM subimages " +
                "WHERE productID = :productId";
        return jdbi.withHandle(h ->
                h.createQuery(sql)
                        .bind("productId", productId)
                        .mapToBean(Subimages.class)
                        .list()
        );
    }
    public int insert(int productId, String image) {
        String sql = "INSERT INTO subimages(productID, image) VALUES (:productId, :image)";
        return jdbi.withHandle(h -> h.createUpdate(sql)
                .bind("productId", productId)
                .bind("image", image)
                .execute());
    }

    public int deleteByProductId(int productId) {
        String sql = "DELETE FROM subimages WHERE productID = :productId";
        return jdbi.withHandle(h -> h.createUpdate(sql)
                .bind("productId", productId)
                .execute());
    }

}
