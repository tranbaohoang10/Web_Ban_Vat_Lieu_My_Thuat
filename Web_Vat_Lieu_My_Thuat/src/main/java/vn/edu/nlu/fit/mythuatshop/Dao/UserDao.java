package vn.edu.nlu.fit.mythuatshop.Dao;

import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;
import vn.edu.nlu.fit.mythuatshop.Model.Users;

public class UserDao {
    private final Jdbi jdbi;
    public UserDao() {
        this.jdbi = JDBIConnector.getJdbi();
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
    // Cập nhật thông tin
    public int updateUser(Users user) {
        String sql = "UPDATE users " +
                "SET fullName = :fullName, " +
                "    phoneNumber = :phoneNumber, " +
                "    dob = :dob, " +
                "    address = :address " +
                "WHERE id = :id";
        return jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("fullName", user.getFullName())
                        .bind("phoneNumber", user.getPhoneNumber())
                        .bind("dob", user.getDob() != null ? java.sql.Date.valueOf(user.getDob()) : null)
                        // có thể là java.sql.Date / Timestamp
                        .bind("address", user.getAddress())
                        .bind("id", user.getId())
                        .execute()
        );
    }
    // Chức năng cập nhật thông tin
    public Users findById(int id) {
        String sql = "SELECT id, fullName, email, `password`, phoneNumber, dob, address, role, createAt " +
                "  FROM users WHERE id = :id";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", id)
                        .mapToBean(Users.class)
                        .findOne()
                        .orElse(null)
        );
    }
    public int updateInforUser(Users user) {
        String sql = "UPDATE users " +
                "SET fullName = :fullName, " +
                "    phoneNumber = :phoneNumber, " +
                "    dob = :dob, " +
                "    address = :address " +
                "WHERE id = :id";
        return jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("fullName", user.getFullName())
                        .bind("phoneNumber", user.getPhoneNumber())
                        .bind("dob", user.getDob())
                        .bind("address", user.getAddress())
                        .bind("id", user.getId())
                        .execute()
        );
    }
    // đổi mật khẩu
    public boolean updatePassword(int userId, String newHash) {
        String sql = "UPDATE users SET password = :matkhaumoi WHERE id = :id";
        int row = jdbi.withHandle(handle ->handle.createUpdate(sql)
                .bind("matkhaumoi", newHash)
                .bind("id", userId)
                .execute());
        return row > 0;
    }
    // quên mật khẩu
    public Users findByEmailFp(String email){
        String sql = "SELECT id, fullName, email, password, phoneNumber, dob, address, role, createAt" +
                " FROM users WHERE email = :email ";
        return jdbi.withHandle(handle ->handle.createQuery(sql).bind("email", email).mapToBean(Users.class).findOne().orElse(null));
    }
    public int updatePasswordByEmail(String email, String matkhaumoi) {
        String sql = "UPDATE Users SET password = :password WHERE email = :email";
        return jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("password", matkhaumoi)
                        .bind("email", email)
                        .execute()
        );    }
}
