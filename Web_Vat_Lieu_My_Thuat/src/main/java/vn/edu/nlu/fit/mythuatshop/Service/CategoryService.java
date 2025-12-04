package vn.edu.nlu.fit.mythuatshop.Service;

import vn.edu.nlu.fit.mythuatshop.Dao.CategoryDao;
import vn.edu.nlu.fit.mythuatshop.Model.Category;

import java.util.List;

public class CategoryService {
    public final CategoryDao  categoryDao;

    public CategoryService() {
        this.categoryDao = new CategoryDao();
    }
    public List<Category> getAllcategories() {
        return categoryDao.findAll();
    }

    }
