package vn.edu.nlu.fit.mythuatshop.Service;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.nlu.fit.mythuatshop.Dao.UserDao;
import vn.edu.nlu.fit.mythuatshop.Model.Users;
import vn.edu.nlu.fit.mythuatshop.Util.EmailUtil;
import vn.edu.nlu.fit.mythuatshop.Dao.EmailVerificationTokenDao;
import java.time.LocalDateTime;

import java.time.LocalDate;
import java.util.Random;
import java.util.UUID;

public class UserService {
    private final UserDao userDao;
    private final EmailVerificationTokenDao tokenDao = new EmailVerificationTokenDao();

    public UserService() {
        this.userDao = new UserDao();
    }

    //  LOGIN: chặn tài khoản bị khóa
    public Users login(String email, String password) {
        if (email == null || password == null) return null;

        Users user = userDao.findByEmail(email.trim());
        if (user == null) return null;

        //  CHẶN nếu bị khóa
        // (yêu cầu Model Users có getIsActive() hoặc isActive)
        if (user.getIsActive() == 0) {
            return null; // hoặc bạn có thể throw / set message tùy hệ thống
        }

        boolean matched = BCrypt.checkpw(password, user.getPassword());
        if (!matched) return null;

        return user;
    }

    //  REGISTER: set address + set isActive=1
    public boolean register(String fullName, String email, String phoneNumber, String password, String address, String baseUrl) {
        if (email == null || email.isBlank()) return false;
        if (password == null || password.isBlank()) return false;

        email = email.trim();

        if (userDao.findByEmail(email) != null) return false;

        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));

        Users user = new Users();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPassword(hashedPassword);
        user.setPhoneNumber(phoneNumber);
        user.setAddress(address);
        user.setRole("USER");

        user.setIsActive(0); // ✅ CHƯA KÍCH HOẠT

        int userId = userDao.insertUserAndReturnId(user);
        if (userId <= 0) return false;

        // tạo token
        String token = UUID.randomUUID().toString().replace("-", "");
        LocalDateTime expiresAt = LocalDateTime.now().plusHours(24);
        tokenDao.insert(userId, token, expiresAt);

        // gửi mail
        String verifyLink = baseUrl + "/verify-email?token=" + token;
        String subject = "Xác nhận đăng ký tài khoản";
        String html = ""
                + "<p>Chào bạn,</p>"
                + "<p>Vui lòng nhấn link sau để kích hoạt tài khoản:</p>"
                + "<p><a href='" + verifyLink + "'>Kích hoạt tài khoản</a></p>"
                + "<p>Link hết hạn sau 24 giờ.</p>";

        EmailUtil.sendHtml(email, subject, html);
        return true;
    }

    // =================== Cập nhật thông tin ===================
    public Users getUserById(int id) {
        return userDao.findById(id);
    }

    public boolean updateProfile(int userId, String fullName, String phoneNumber, String dobStr, String address) {
        Users user = userDao.findById(userId);
        if (user == null) return false;

        //  nếu user bị khóa thì bạn có thể chặn sửa profile (tuỳ bạn)
        // if (user.getIsActive() == 0) return false;

        user.setFullName(fullName);
        user.setPhoneNumber(phoneNumber);
        user.setAddress(address);

        if (dobStr != null && !dobStr.isEmpty()) {
            LocalDate ld = LocalDate.parse(dobStr);
            user.setDob(ld);
        }

        int row = userDao.updateUser(user);
        return row > 0;
    }

    // =================== Đổi mật khẩu ===================
    public boolean changePassword(int userId, String oldPassword, String newPassword) {
        Users user = userDao.findById(userId);
        if (user == null) return false;

        //  nếu user bị khóa thì chặn đổi pass (tuỳ bạn)
        // if (user.getIsActive() == 0) return false;

        String currentHash = user.getPassword();
        boolean match = BCrypt.checkpw(oldPassword, currentHash);
        if (!match) return false;

        String newHash = BCrypt.hashpw(newPassword, BCrypt.gensalt(12));
        return userDao.updatePassword(userId, newHash);
    }

    // =================== Quên mật khẩu ===================
    public Users getUserByEmail(String email) {
        return userDao.findByEmailFp(email);
    }

    public boolean resetAndSendEmail(String email) {
        if (email == null) return false;
        email = email.trim();

        Users user = userDao.findByEmailFp(email);
        if (user == null) return false;

        //  nếu user bị khóa thì bạn có thể chặn reset (tuỳ bạn)
        // if (user.getIsActive() == 0) return false;

        String matKhauMoi = generateRandomPassword();
        String hashed = BCrypt.hashpw(matKhauMoi, BCrypt.gensalt(12));

        int row = userDao.updatePasswordByEmail(email, hashed);
        if (row <= 0) return false;

        String subject = "Đặt lại mật khẩu cho tài khoản";
        String nd = "Mật khẩu mới của bạn là: " + matKhauMoi;

        try {
            EmailUtil.send(email, subject, nd);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private String generateRandomPassword() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder sb = new StringBuilder();
        Random rnd = new Random();
        for (int i = 0; i < 8; i++) {
            sb.append(chars.charAt(rnd.nextInt(chars.length())));
        }
        return sb.toString();
    }

    // =================== Đăng nhập bằng Google ===================
    public Users findByEmailForGG(String email) {
        if (email == null) return null;
        return userDao.findByEmail(email.trim());
    }

    //  register google: role USER + isActive=1
    public Users registerGoogleUser(String name, String email) {
        if (email == null || email.isBlank()) return null;
        email = email.trim();

        // nếu đã tồn tại thì trả về user hiện có
        Users existed = userDao.findByEmail(email);
        if (existed != null) return existed;

        String randomPassword = UUID.randomUUID().toString();
        String hashed = BCrypt.hashpw(randomPassword, BCrypt.gensalt(12));

        Users user = new Users();
        user.setFullName(name);
        user.setEmail(email);
        user.setPassword(hashed);
        user.setRole("USER");      //  đồng nhất role
        user.setPhoneNumber("");
        user.setAddress("");
        user.setIsActive(1);       //  mặc định active

        userDao.insertUser(user);
        return userDao.findByEmail(email);
    }

    //  bản safe cũng set isActive=1
    public void registerGoogleUserSafe(String name, String email) {
        if (email == null || email.isBlank()) return;
        email = email.trim();

        if (userDao.findByEmail(email) != null) return;

        Users user = new Users();
        user.setFullName(name != null && !name.isBlank() ? name : "Google User");
        user.setEmail(email);

        String raw = UUID.randomUUID().toString();
        String hashed = BCrypt.hashpw(raw, BCrypt.gensalt(12));
        user.setPassword(hashed);

        user.setPhoneNumber("");
        user.setAddress("");
        user.setRole("USER");
        user.setIsActive(1);       //  mặc định active

        userDao.insertUser(user);
    }
    // xác nhân tài khoản
    public boolean verifyEmailToken(String token) {
        if (token == null || token.isBlank()) return false;

        Integer userId = tokenDao.findUserIdIfValid(token);
        if (userId == null) return false;

        userDao.setActive(userId, 1);
        tokenDao.markUsed(token);
        return true;
    }

}
