package vn.edu.nlu.fit.mythuatshop.Service;

import vn.edu.nlu.fit.mythuatshop.Dao.UserDao;
import vn.edu.nlu.fit.mythuatshop.Model.Users;

public class UserService {
    private final UserDao userDao;

    public UserService() {
        this.userDao = new UserDao();
    }

    public Users login(String email, String password) {
        return userDao.findByEmailAndPassword(email, password);
    }
    public boolean register(String fullName, String email, String phoneNumber, String password) {
        if(userDao.findByEmail(email)!=null){
            return false;
        }
        Users user = new Users();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhoneNumber(phoneNumber);
        user.setRole("USER");

        int row =   userDao.insertUser(user);
        return row>0;
    }
}
