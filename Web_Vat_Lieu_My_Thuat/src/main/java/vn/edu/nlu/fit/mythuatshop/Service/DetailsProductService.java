package vn.edu.nlu.fit.mythuatshop.Service;

import vn.edu.nlu.fit.mythuatshop.Dao.ProductDao;
import vn.edu.nlu.fit.mythuatshop.Dao.SpecificationsDao;
import vn.edu.nlu.fit.mythuatshop.Dao.SubImagesDao;
import vn.edu.nlu.fit.mythuatshop.Model.Product;
import vn.edu.nlu.fit.mythuatshop.Model.ProductCard;
import vn.edu.nlu.fit.mythuatshop.Model.Specification;
import vn.edu.nlu.fit.mythuatshop.Model.Subimages;

import java.util.List;

public class DetailsProductService {
    private SpecificationsDao  specificationsDao;
    private SubImagesDao subImagesDao;
    private ProductDao productDao;
    private final ProductCardService cardService = new ProductCardService();

    public DetailsProductService(){
        specificationsDao = new SpecificationsDao();
        subImagesDao = new SubImagesDao();
        productDao = new ProductDao();
    }
    // Lấy thông tin product
    public Product getProduct(int productId) {
        return productDao.findByProductId(productId);
    }
    public Product getProductActive(int productId) {
        return productDao.findByProductIdActive(productId);
    }
    // Lấy thông số kĩ thuật theo product
    public List<Specification> getSpecifications(int productId) {
        return specificationsDao.findByProductId(productId);
    }

    // Lấy các sub-image theo product
    public List<Subimages> getSubImages(int productId) {
        return subImagesDao.findByProductId(productId);
    }
    // mới: lấy danh sách sản phẩm cùng loại
    public List<ProductCard> getRelatedProductCards(Product p){
        if (p == null) return List.of();
        return cardService.topByCategory(p.getCategoryId(), 6).stream()
                .filter(x -> x.getId() != p.getId())
                .toList();
    }
}
