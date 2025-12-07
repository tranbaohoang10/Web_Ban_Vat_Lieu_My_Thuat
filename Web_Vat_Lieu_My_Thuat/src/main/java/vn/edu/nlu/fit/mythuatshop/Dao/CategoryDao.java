package vn.edu.nlu.fit.mythuatshop.Dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.nlu.fit.mythuatshop.Model.Category;

import java.util.List;

public class CategoryDao {
    private final Jdbi jdbi;
    public CategoryDao() {

        jdbi = JDBIConnector.getJdbi();
    }
    public List<Category> findAll(){
        String sql = "SELECT id, categoryName, thumbnail FROM categories";
        return jdbi.withHandle(h->
            h.createQuery(sql).mapToBean(Category.class).list()
        );

    }
    public Category findById(int id) {
        String sql = "SELECT id, categoryName, thumbnail FROM categories WHERE id = :id";
        return jdbi.withHandle(h ->
                h.createQuery(sql)
                        .bind("id", id)
                        .mapToBean(Category.class)
                        .findOne()
                        .orElse(null)
        );
    }

//    static void main() {
//        CategoryDao dao = new CategoryDao();
//        List<Category> categories = dao.findAll();
//        System.out.println(categories);
//    }

}
