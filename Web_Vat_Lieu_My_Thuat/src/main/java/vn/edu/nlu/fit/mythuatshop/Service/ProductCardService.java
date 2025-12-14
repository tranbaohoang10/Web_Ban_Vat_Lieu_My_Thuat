package vn.edu.nlu.fit.mythuatshop.Service;

import vn.edu.nlu.fit.mythuatshop.Dao.ProductCardDao;
import vn.edu.nlu.fit.mythuatshop.Model.ProductCard;

import java.util.List;

public class ProductCardService {
    private final ProductCardDao dao = new ProductCardDao();

    public List<ProductCard> topByCategory(int categoryId, int limit) {
        return dao.topByCategory(categoryId, limit);
    }

    public List<ProductCard> search(String keyword, String sort, int offset, int limit) {
        return dao.search(keyword, sort, offset, limit);
    }

    public int countSearch(String keyword) {
        return dao.countSearch(keyword);
    }
    // ProductCardService.java
    public List<ProductCard> byCategoryWithFilter(int categoryId, Double minPrice, Double maxPrice,
                                                  String sort, int offset, int limit) {
        return dao.byCategoryWithFilter(categoryId, minPrice, maxPrice, sort, offset, limit);
    }

    public int countByCategoryWithFilter(int categoryId, Double minPrice, Double maxPrice) {
        return dao.countByCategoryWithFilter(categoryId, minPrice, maxPrice);
    }

}
