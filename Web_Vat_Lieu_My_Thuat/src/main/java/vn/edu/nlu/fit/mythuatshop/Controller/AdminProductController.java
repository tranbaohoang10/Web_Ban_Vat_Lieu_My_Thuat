package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vn.edu.nlu.fit.mythuatshop.Dao.ProductDao;
import vn.edu.nlu.fit.mythuatshop.Dao.SpecificationsDao;
import vn.edu.nlu.fit.mythuatshop.Dao.SubImagesDao;
import vn.edu.nlu.fit.mythuatshop.Model.Product;
import vn.edu.nlu.fit.mythuatshop.Model.Specification;
import vn.edu.nlu.fit.mythuatshop.Model.Subimages;
import vn.edu.nlu.fit.mythuatshop.Service.CategoryService;
import vn.edu.nlu.fit.mythuatshop.Service.ProductService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.*;
import java.util.stream.Collectors;

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

        var products = productService.getAllProducts();
        req.setAttribute("products", products);
        req.setAttribute("categories", categoryService.getAllcategories());

        // ✅ MAP productId -> CSV subimages (để edit render ảnh phụ)
        Map<Integer, String> subImagesCsvMap = new HashMap<>();
        for (Product p : products) {
            List<Subimages> subs = subImagesDao.findByProductId(p.getId());
            String csv = subs.stream()
                    .map(Subimages::getImage) // image đang lưu dạng "/uploads/..."
                    .collect(Collectors.joining(","));
            subImagesCsvMap.put(p.getId(), csv);
        }
        req.setAttribute("subImagesCsvMap", subImagesCsvMap);

        // ✅ MAP productId -> Specification (để edit fill size/madeIn/warning/standard)
        Map<Integer, Specification> specMap = new HashMap<>();
        for (Product p : products) {
            List<Specification> specs = specificationsDao.findByProductId(p.getId());
            if (specs != null && !specs.isEmpty()) {
                specMap.put(p.getId(), specs.get(0));
            }
        }
        req.setAttribute("specMap", specMap);

        req.getRequestDispatcher("/admin/Product.jsp").forward(req, resp);
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

        // ✅ MAIN THUMB: chỉ upload local
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
        p.setIsActive(1);

        int newId = productDao.insertReturnId(p);

        // ✅ SUB IMAGES: upload local -> lưu vào uploads/subimages
        Collection<Part> parts = req.getParts();
        for (Part part : parts) {
            if ("thumbnailSubs".equals(part.getName()) && part.getSize() > 0) {
                String subUrl = saveUploadAndReturnUrl(req, part, "uploads/subimages");
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

        // ✅ MAIN THUMB:
        // - nếu upload mới -> dùng mới
        // - nếu không upload -> dùng existingThumbnail hidden (hoặc oldThumb)
        // - nếu user bấm xóa ảnh -> existingThumbnail = "" => finalThumb = null
        String existingThumb = trimToNull(req.getParameter("existingThumbnail"));
        Part mainThumb = req.getPart("thumbnailMain");
        String uploadedThumb = null;
        if (mainThumb != null && mainThumb.getSize() > 0) {
            uploadedThumb = saveUploadAndReturnUrl(req, mainThumb, "uploads/products");
        }

        String finalThumb;
        if (uploadedThumb != null) {
            finalThumb = uploadedThumb;
        } else if (existingThumb != null) {
            finalThumb = existingThumb;
        } else {
            finalThumb = oldThumb; // fallback
        }

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

        // ✅ SUB IMAGES:
        // nhận existingSubImages từ hidden input (CSV sau khi user xóa trên UI)
        String existingSubsCsv = trimToNull(req.getParameter("existingSubImages"));
        List<String> keepSubs = new ArrayList<>();
        if (existingSubsCsv != null) {
            for (String s : existingSubsCsv.split(",")) {
                String t = trimToNull(s);
                if (t != null) keepSubs.add(t);
            }
        }

        List<String> newSubs = new ArrayList<>();
        Collection<Part> parts = req.getParts();
        for (Part part : parts) {
            if ("thumbnailSubs".equals(part.getName()) && part.getSize() > 0) {
                String saved = saveUploadAndReturnUrl(req, part, "uploads/subimages");
                if (saved != null) newSubs.add(saved);
            }
        }


        // replace DB theo danh sách cuối cùng: keep + new
        subImagesDao.deleteByProductId(id);
        for (String img : keepSubs) subImagesDao.insert(id, img);
        for (String img : newSubs) subImagesDao.insert(id, img);

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

        String savedName = UUID.randomUUID().toString().replace("-", "") + ext;

        String realPath = req.getServletContext().getRealPath("/");
        File uploadDir = new File(realPath, folder);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        File savedFile = new File(uploadDir, savedName);
        part.write(savedFile.getAbsolutePath());

        return "/" + folder + "/" + savedName; // lưu vào DB
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
