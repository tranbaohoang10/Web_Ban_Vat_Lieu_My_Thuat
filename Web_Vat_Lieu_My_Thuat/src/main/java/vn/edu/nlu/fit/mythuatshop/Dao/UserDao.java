package vn.edu.nlu.fit.mythuatshop.Dao;

import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;
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
    // tìm coi email đã tồn tại chưa
    public Users findByEmail(String email) {
        String sql = "SELECT id, fullName, email, `password`, phoneNumber, dob, address, role, createAt " +
                " FROM Users WHERE email = :email ";
        return jdbi.withHandle(handle -> handle.createQuery(sql).bind("email", email).mapToBean(Users.class).findOne().orElse(null));
    }
    // thêm user mới dô db
    public int insertUser(Users user) {
        String sql = "INSERT INTO users (fullName, email, `password`, phoneNumber, address, role, createAt) " +
                " VALUES (:fullName, :email, :password, :phoneNumber, :address, :role, CURRENT_TIMESTAMP())";
        return jdbi.withHandle(handle -> handle.createUpdate(sql)
                .bind("fullName", user.getFullName())
                .bind("email", user.getEmail())
                .bind("password", user.getPassword())
                .bind("phoneNumber", user.getPhoneNumber())
                .bind("address", user.getAddress())
                .bind("role", user.getRole())
                .execute()
        );
    }

}
