package vn.edu.nlu.fit.mythuatshop.Service;

import vn.edu.nlu.fit.mythuatshop.Dao.CartDao;
import vn.edu.nlu.fit.mythuatshop.Model.Product;

public class CartService {
    private CartDao cartDao;

    public CartService() {
        this.cartDao = new CartDao();
    }
    public void addToCart(int userId, int productId, int quantity) {
        cartDao.addToCart(userId, productId, quantity);
    }
    public int getCartCount(int userId) {
        return cartDao.getTotalQuantityByUser(userId);
    }
}
