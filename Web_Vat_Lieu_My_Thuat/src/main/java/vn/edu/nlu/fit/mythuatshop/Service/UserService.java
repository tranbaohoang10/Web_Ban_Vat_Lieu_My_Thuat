package vn.edu.nlu.fit.mythuatshop.Service;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.nlu.fit.mythuatshop.Dao.UserDao;
import vn.edu.nlu.fit.mythuatshop.Model.Users;

import java.time.LocalDate;
import java.time.LocalDateTime;

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
}
