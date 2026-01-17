package vn.edu.nlu.fit.mythuatshop.Service;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.nlu.fit.mythuatshop.Dao.UserDao;
import vn.edu.nlu.fit.mythuatshop.Model.Users;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

public class AdminUserService {
    private final UserDao userDao = new UserDao();

    public List<Users> listUsers(int page, int pageSize, String keyword) {
        int safePage = Math.max(page, 1);
        int offset = (safePage - 1) * pageSize;
        String kw = (keyword == null) ? "" : keyword.trim();
        return userDao.findUsers(kw, offset, pageSize);
    }

    public int totalPages(int pageSize, String keyword) {
        String kw = (keyword == null) ? "" : keyword.trim();
        int total = userDao.countUsers(kw);
        return (int) Math.ceil(total * 1.0 / pageSize);
    }

    public boolean createUser(String fullName, String email, String phone, String dobStr, String address, String role) {
        if (email == null || email.isBlank()) return false;


        if (userDao.findByEmail(email.trim()) != null) return false;

        Users u = new Users();
        u.setFullName(fullName);
        u.setEmail(email.trim());
        u.setPhoneNumber(phone);
        u.setAddress(address);
        u.setRole(role == null ? "USER" : role.toUpperCase());

        if (dobStr != null && !dobStr.isBlank()) {
            u.setDob(LocalDate.parse(dobStr)); // yyyy-MM-dd
        }

        // mật khẩu random, lưu dạng HASH
        String rawPass = UUID.randomUUID().toString().substring(0, 8);
        u.setPassword(BCrypt.hashpw(rawPass, BCrypt.gensalt(12)));

        // mặc định active
        u.setIsActive(1);

        return userDao.adminCreateUser(u) > 0;
    }

    public boolean updateUser(int id, String fullName, String phone, String dobStr, String address, String role) {
        Users u = userDao.findById(id);
        if (u == null) return false;

        u.setFullName(fullName);
        u.setPhoneNumber(phone);
        u.setAddress(address);
        u.setRole(role == null ? u.getRole() : role.toUpperCase());

        if (dobStr != null && !dobStr.isBlank()) u.setDob(LocalDate.parse(dobStr));
        else u.setDob(null);

        return userDao.adminUpdateUser(u) > 0;
    }

    // KHÓA = isActive=0
    public boolean lockUser(int id) {
        return userDao.setActive(id, 3) > 0;
    }

    // MỞ KHÓA = isActive=1
    public boolean unlockUser(int id) {
        return userDao.setActive(id, 1) > 0;
    }
}
