package vn.edu.nlu.fit.mythuatshop.Service;

import vn.edu.nlu.fit.mythuatshop.Dao.ProductDao;
import vn.edu.nlu.fit.mythuatshop.Dao.SpecificationsDao;
import vn.edu.nlu.fit.mythuatshop.Dao.SubImagesDao;
import vn.edu.nlu.fit.mythuatshop.Model.Product;
import vn.edu.nlu.fit.mythuatshop.Model.Specification;
import vn.edu.nlu.fit.mythuatshop.Model.Subimages;

import java.util.List;

public class DetailsProductService {
    private SpecificationsDao  specificationsDao;
    private SubImagesDao subImagesDao;
    private ProductDao productDao;
    public DetailsProductService(){
        specificationsDao = new SpecificationsDao();
        subImagesDao = new SubImagesDao();
        productDao = new ProductDao();
    }
    // Lấy thông tin product
    public Product getProduct(int productId) {
        return productDao.findByProductId(productId);
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
    public List<Product> getRelatedProducts(Product p){
        List<Product> list = productDao.findByCategoryIdTop5(p.getCategoryId());
        // bỏ chính sản phẩm đang xem ra
        return list.stream()
                .filter(pr -> pr.getId() != p.getId())
                .toList();
    }
}
