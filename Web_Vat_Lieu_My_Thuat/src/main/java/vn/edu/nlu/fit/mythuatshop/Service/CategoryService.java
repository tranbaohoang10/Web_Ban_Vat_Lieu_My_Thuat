package vn.edu.nlu.fit.mythuatshop.Service;

import vn.edu.nlu.fit.mythuatshop.Dao.CategoryDao;
import vn.edu.nlu.fit.mythuatshop.Model.Category;

import java.util.List;

public class CategoryService {
    private final CategoryDao categoryDao;

    public CategoryService() {
        this.categoryDao = new CategoryDao();
    }

    // Admin
    public List<Category> getAllcategories() {
        return categoryDao.findAll();
    }

    // Client
    public List<Category> getAllcategoriesActive() {
        return categoryDao.findAllActive();
    }

    public Category getCategoryById(int id) {
        return categoryDao.findById(id);
    }

    public Category getCategoryByIdActive(int id) {
        return categoryDao.findByIdActive(id);
    }

    public int create(Category c) {
        return categoryDao.insertReturnId(c);
    }

    public int update(Category c) {
        return categoryDao.update(c);
    }

    public int toggleActive(int id, int currentIsActive) {
        int newValue = (currentIsActive == 1) ? 0 : 1;
        return categoryDao.updateActive(id, newValue);
    }
}
