package vn.edu.nlu.fit.mythuatshop.Service;

import vn.edu.nlu.fit.mythuatshop.Dao.CategoryDao;
import vn.edu.nlu.fit.mythuatshop.Dao.ProductDao;
import vn.edu.nlu.fit.mythuatshop.Model.Product;

import java.util.List;

public class ProductService {
    private  final ProductDao productDao;

    public ProductService() {
        this.productDao = new ProductDao();
    }
    public List<Product> getAllProducts() {
        return productDao.findAll();
    }
    public List<Product> getAllProductsByCategoryId(int categoryId) {
        return productDao.findByCategoryId(categoryId);
    }
    public List<Product> getProductsByCategoryId(int categoryId) {
        return productDao.findByCategoryId(categoryId);
    }

}
