package vn.edu.nlu.fit.mythuatshop.Service;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.nlu.fit.mythuatshop.Dao.UserDao;
import vn.edu.nlu.fit.mythuatshop.Model.Users;
import vn.edu.nlu.fit.mythuatshop.Util.EmailUtil;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Random;

public class UserService {
    private final UserDao userDao;

    public UserService() {
        this.userDao = new UserDao();
    }

    public Users login(String email, String password) {
       Users user = userDao.findByEmail(email);
       if(user==null){
           return null;
       }
       boolean matched = BCrypt.checkpw(password, user.getPassword());
       if(!matched){
           return null;
       }
       return user;
    }

    public boolean register(String fullName, String email, String phoneNumber, String password, String address) {
        if(userDao.findByEmail(email)!=null){
            return false;
        }
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));
        Users user = new Users();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPassword(hashedPassword);
        user.setPhoneNumber(phoneNumber);
        user.setRole("USER");

        int row =   userDao.insertUser(user);
        return row>0;
    }
    // Chức năng cập nhật thông tin
    public Users getUserById(int id) {
        return userDao.findById(id);
    }
    public boolean updateProfile(int userId, String fullName, String phoneNumber, String dobStr, String address) {
        Users user = userDao.findById(userId);
        if(user==null){
            return false;
        }
        user.setFullName(fullName);
        user.setPhoneNumber(phoneNumber);
        user.setAddress(address);

        if(dobStr!=null && !dobStr.isEmpty()){
            LocalDate ld = LocalDate.parse(dobStr);
            user.setDob(ld);
        }
        int row = userDao.updateUser(user);
        return row>0;
    }
    // Chức năng đổi mật khẩu
    public boolean changePassword(int userId, String oldPassword, String newPassword) {
        Users user = userDao.findById(userId);
        if (user == null) {
            return false;
        }
        String curentHash = user.getPassword();
        boolean match = BCrypt.checkpw(oldPassword, curentHash);
        if (!match) {
            return false;
        }
        String newHash = BCrypt.hashpw(newPassword, BCrypt.gensalt(12));
        return userDao.updatePassword(userId, newHash);
    }
    // quên mật khẩu
    public Users getUserByEmail(String email) {
        return userDao.findByEmailFp(email);
    }
    public boolean resetAndSendEmail(String email){
        email = email.trim();
        Users user = userDao.findByEmailFp(email);
        if(user == null) return false;

        String matkhaumoi = generateRandomPassword();
        String hashed = BCrypt.hashpw(matkhaumoi, BCrypt.gensalt(12));

        int row = userDao.updatePasswordByEmail(email, hashed);
        if(row <= 0) return false;

        String subject = "Đặt lại mật khẩu cho tài khoản";
        String nd = "Mật khẩu mới của bạn là: " + matkhaumoi;

        try {
            System.out.println(">>> START send mail to: " + email);
            EmailUtil.send(email, subject, nd);
            System.out.println(">>> SEND MAIL OK to: " + email);
            return true;
        } catch (Exception e) {
            System.out.println(">>> SEND MAIL FAILED to: " + email);
            e.printStackTrace();   // ⭐ dòng này sẽ cho bạn biết lỗi SMTP/Auth/Port
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
}
