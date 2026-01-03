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
                case "toggleActive" -> handleToggleActive(req);
                default -> { /* ignore */ }
            }
        } catch (Exception e) {
            e.printStackTrace();
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

        String standard = req.getParameter("standard");
        if (standard == null) standard = "";

        // ===== MAIN THUMB: ưu tiên URL từ server (CKFinder), nếu không có thì mới upload file =====
        String mainThumbUrl = trimToNull(req.getParameter("thumbnailMainUrl"));

        Part mainThumb = req.getPart("thumbnailMain");
        if (mainThumbUrl == null) {
            // upload theo cách cũ
            mainThumbUrl = saveUploadAndReturnUrl(req, mainThumb, "uploads/products");
        }

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
        p.setIsActive(1);

        int newId = productDao.insertReturnId(p);

        // ===== SUB IMAGES: (1) nếu có URLs từ server -> insert luôn; (2) nếu upload file -> insert file =====
        String subUrls = trimToNull(req.getParameter("thumbnailSubUrls"));
        if (subUrls != null) {
            for (String url : subUrls.split(",")) {
                url = trimToNull(url);
                if (url != null) subImagesDao.insert(newId, url);
            }
        }

        // upload sub files (nếu user chọn local)
        Collection<Part> parts = req.getParts();
        for (Part part : parts) {
            if ("thumbnailSubs".equals(part.getName()) && part.getSize() > 0) {
                String subUrl = saveUploadAndReturnUrl(req, part, "uploads/products");
                subImagesDao.insert(newId, subUrl);
            }
        }

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

        Product old = productService.getProductById(id);
        String oldThumb = (old != null) ? old.getThumbnail() : null;

        // ===== MAIN THUMB =====
        String mainThumbUrl = trimToNull(req.getParameter("thumbnailMainUrl"));

        Part mainThumb = req.getPart("thumbnailMain");
        String uploadedThumb = null;
        if (mainThumb != null && mainThumb.getSize() > 0) {
            uploadedThumb = saveUploadAndReturnUrl(req, mainThumb, "uploads/products");
        }

        String finalThumb = (uploadedThumb != null) ? uploadedThumb
                : (mainThumbUrl != null ? mainThumbUrl : oldThumb);

        Product p = new Product();
        p.setId(id);
        p.setName(name);
        p.setPrice(price);
        p.setDiscountDefault(discount);
        p.setCategoryId(categoryId);
        p.setQuantityStock(qty);
        p.setBrand(brand);
        p.setThumbnail(finalThumb);

        productDao.update(p);

        // ===== SUB IMAGES =====
        boolean replacedSub = false;

        // 1) nếu user chọn sub urls từ server -> replace all
        String subUrls = trimToNull(req.getParameter("thumbnailSubUrls"));
        if (subUrls != null) {
            subImagesDao.deleteByProductId(id);
            replacedSub = true;
            for (String url : subUrls.split(",")) {
                url = trimToNull(url);
                if (url != null) subImagesDao.insert(id, url);
            }
        }

        // 2) nếu user upload sub files -> replace all (như bạn đang làm)
        Collection<Part> parts = req.getParts();
        for (Part part : parts) {
            if ("thumbnailSubs".equals(part.getName()) && part.getSize() > 0) {
                if (!replacedSub) {
                    subImagesDao.deleteByProductId(id);
                    replacedSub = true;
                }
                String subUrl = saveUploadAndReturnUrl(req, part, "uploads/products");
                subImagesDao.insert(id, subUrl);
            }
        }

        // ===== SPEC =====
        specificationsDao.upsert(id, size, standard, madeIn, warning);
    }

    private void handleToggleActive(HttpServletRequest req) {
        int id = parseInt(req.getParameter("id"), 0);
        int isActive = parseInt(req.getParameter("isActive"), 1);
        if (id <= 0) return;

        productService.updateActive(id, isActive);
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

    private String trimToNull(String s) {
        if (s == null) return null;
        s = s.trim();
        return s.isEmpty() ? null : s;
    }

    private int parseInt(String s, int def) {
        try { return Integer.parseInt(s); } catch (Exception e) { return def; }
    }

    private double parseDouble(String s, double def) {
        try { return Double.parseDouble(s); } catch (Exception e) { return def; }
    }
}
