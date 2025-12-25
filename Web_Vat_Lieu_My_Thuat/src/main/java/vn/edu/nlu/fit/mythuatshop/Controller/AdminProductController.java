package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vn.edu.nlu.fit.mythuatshop.Dao.ProductDao;
import vn.edu.nlu.fit.mythuatshop.Dao.SpecificationsDao;
import vn.edu.nlu.fit.mythuatshop.Dao.SubImagesDao;
import vn.edu.nlu.fit.mythuatshop.Model.Product;
import vn.edu.nlu.fit.mythuatshop.Service.CategoryService;
import vn.edu.nlu.fit.mythuatshop.Service.ProductService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.UUID;

@WebServlet(name = "AdminProductController", value = "/admin/products")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
public class AdminProductController extends HttpServlet {

    private ProductService productService;
    private CategoryService categoryService;

    private ProductDao productDao;
    private SubImagesDao subImagesDao;
    private SpecificationsDao specificationsDao;

    @Override
    public void init() {
        productService = new ProductService();
        categoryService = new CategoryService();

        productDao = new ProductDao();
        subImagesDao = new SubImagesDao();
        specificationsDao = new SpecificationsDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        req.setAttribute("products", productService.getAllProducts());
        req.setAttribute("categories", categoryService.getAllcategories());

        // đổi path JSP theo project bạn
        req.getRequestDispatcher("/admin/SanPham.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");
        if (action == null) action = "";

        try {
            switch (action) {
                case "create" -> handleCreate(req);
                case "update" -> handleUpdate(req);
                case "delete" -> handleDelete(req);
                default -> { /* ignore */ }
            }
        } catch (Exception e) {
            e.printStackTrace();
            // nếu muốn hiển thị lỗi trên JSP:
            // req.setAttribute("error", e.getMessage());
            // doGet(req, resp); return;
        }

        resp.sendRedirect(req.getContextPath() + "/admin/products");
    }

    private void handleCreate(HttpServletRequest req) throws Exception {
        int categoryId = parseInt(req.getParameter("categoryId"), 0);
        String name = req.getParameter("name");
        double price = parseDouble(req.getParameter("price"), 0);
        int discount = parseInt(req.getParameter("discountDefault"), 0);
        int qty = parseInt(req.getParameter("quantityStock"), 0);
        String brand = req.getParameter("brand");

        String size = req.getParameter("size");
        String madeIn = req.getParameter("madeIn");
        String warning = req.getParameter("warning");

        // nếu bạn chưa dùng Standard trên form thì để rỗng
        String standard = req.getParameter("standard");
        if (standard == null) standard = "";

        // upload thumbnail main
        Part mainThumb = req.getPart("thumbnailMain");
        String mainThumbUrl = saveUploadAndReturnUrl(req, mainThumb, "uploads/products");

        Product p = new Product();
        p.setName(name);
        p.setPrice(price);
        p.setDiscountDefault(discount);
        p.setCategoryId(categoryId);
        p.setThumbnail(mainThumbUrl);
        p.setQuantityStock(qty);
        p.setSoldQuantity(0);
        p.setStatus(qty > 0 ? "Còn hàng" : "Hết hàng");
        p.setCreateAt(new Timestamp(System.currentTimeMillis()));
        p.setBrand(brand);

        int newId = productDao.insertReturnId(p);

        // sub images (multiple)
        Collection<Part> parts = req.getParts();
        for (Part part : parts) {
            if ("thumbnailSubs".equals(part.getName()) && part.getSize() > 0) {
                String subUrl = saveUploadAndReturnUrl(req, part, "uploads/products/sub");
                subImagesDao.insert(newId, subUrl);
            }
        }

        // specs upsert
        specificationsDao.upsert(newId, size, standard, madeIn, warning);
    }

    private void handleUpdate(HttpServletRequest req) throws Exception {
        int id = parseInt(req.getParameter("id"), 0);
        if (id <= 0) return;

        int categoryId = parseInt(req.getParameter("categoryId"), 0);
        String name = req.getParameter("name");
        double price = parseDouble(req.getParameter("price"), 0);
        int discount = parseInt(req.getParameter("discountDefault"), 0);
        int qty = parseInt(req.getParameter("quantityStock"), 0);
        String brand = req.getParameter("brand");

        String size = req.getParameter("size");
        String madeIn = req.getParameter("madeIn");
        String warning = req.getParameter("warning");

        String standard = req.getParameter("standard");
        if (standard == null) standard = "";

        // giữ thumbnail cũ nếu không upload mới
        Product old = productService.getProductById(id);
        String oldThumb = (old != null) ? old.getThumbnail() : null;

        Part mainThumb = req.getPart("thumbnailMain");
        String newThumb = null;
        if (mainThumb != null && mainThumb.getSize() > 0) {
            newThumb = saveUploadAndReturnUrl(req, mainThumb, "uploads/products");
        }

        Product p = new Product();
        p.setId(id);
        p.setName(name);
        p.setPrice(price);
        p.setDiscountDefault(discount);
        p.setCategoryId(categoryId);
        p.setQuantityStock(qty);
        p.setBrand(brand);
        p.setThumbnail(newThumb != null ? newThumb : oldThumb);

        productDao.update(p);

        // specs upsert
        specificationsDao.upsert(id, size, standard, madeIn, warning);

        // update subimages?
        // hiện tại bạn đang ẩn ảnh phụ khi edit => bỏ qua cho đơn giản.
        // nếu sau này muốn: xóa cũ (deleteByProductId) rồi insert mới.
    }

    private void handleDelete(HttpServletRequest req) {
        int id = parseInt(req.getParameter("id"), 0);
        if (id <= 0) return;

        // nếu FK đã ON DELETE CASCADE thì không cần gọi 2 dòng này
        // subImagesDao.deleteByProductId(id);
        // (specifications cũng cascade nếu FK ON DELETE CASCADE)

        productDao.deleteById(id);
    }

    // ================= helpers =================

    private String saveUploadAndReturnUrl(HttpServletRequest req, Part part, String folder) throws IOException {
        if (part == null || part.getSize() == 0) return null;

        String original = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        String ext = "";
        int dot = original.lastIndexOf('.');
        if (dot >= 0) ext = original.substring(dot);

        String savedName = UUID.randomUUID() + ext;

        String realPath = req.getServletContext().getRealPath("/");
        File uploadDir = new File(realPath, folder);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        File savedFile = new File(uploadDir, savedName);
        part.write(savedFile.getAbsolutePath());

        return "/" + folder + "/" + savedName;
    }

    private int parseInt(String s, int def) {
        try { return Integer.parseInt(s); } catch (Exception e) { return def; }
    }

    private double parseDouble(String s, double def) {
        try { return Double.parseDouble(s); } catch (Exception e) { return def; }
    }
}
