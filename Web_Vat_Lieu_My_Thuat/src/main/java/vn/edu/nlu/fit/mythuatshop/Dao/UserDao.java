package vn.edu.nlu.fit.mythuatshop.Dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.nlu.fit.mythuatshop.Model.Users;

public class UserDao {
    private final Jdbi jdbi;
    public UserDao() {
        this.jdbi = JDBIConnector.getJdbi();
    }
    public Users findByEmailAndPassword(String email, String password) {
        String sql = "SELECT id, fullName, email, `password`, phoneNumber, dob, address, role, createAt " +
                " FROM Users WHERE email = :email AND password = :password";
        return jdbi.withHandle(handle -> handle.createQuery(sql).bind("email", email).bind("password", password).mapToBean(Users.class).findOne().orElse(null));

    }

}
