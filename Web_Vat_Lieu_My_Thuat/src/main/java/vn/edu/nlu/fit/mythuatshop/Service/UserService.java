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
}
