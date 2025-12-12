package vn.edu.nlu.fit.mythuatshop.Dao;

import com.mysql.cj.jdbc.MysqlDataSource;
import vn.edu.nlu.fit.mythuatshop.Model.Category;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JDBIConnector {
    public static Jdbi jdbi;
    public static Jdbi getJdbi() {
        if (jdbi == null) {
            Connect();
        }
        return jdbi;
    }
    public static void Connect() {
        MysqlDataSource ds = new MysqlDataSource();
        String url = "jdbc:mysql://localhost:3306/Mythuat";
        ds.setUrl(url);
        ds.setUser("root");
        ds.setPassword("");
        try {
            ds.setAutoReconnect(true);
            ds.setUseCompression(true);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        jdbi = Jdbi.create(ds);
    }

    public static void main(String[] args) {
        int id=1;
        List<Category> categories = JDBIConnector.getJdbi().withHandle(h->{
            return h.createQuery("select * from categories where id =?").bind(0,id).mapToBean(Category.class).list();

        });
        System.out.println(categories);


    }

 }
