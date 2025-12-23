package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.mythuatshop.Model.Category;
import vn.edu.nlu.fit.mythuatshop.Model.ProductCard;
import vn.edu.nlu.fit.mythuatshop.Service.CategoryService;
import vn.edu.nlu.fit.mythuatshop.Service.ProductCardService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryProductsController", value = "/category")
public class CategoryProductsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CategoryService categoryService = new CategoryService();
        ProductCardService cardService = new ProductCardService();

        // ✅ parse categoryId an toàn
        String cid = request.getParameter("categoryId");
        if (cid == null || cid.isBlank()) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        int categoryId;
        try {
            categoryId = Integer.parseInt(cid);
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        String priceRange = request.getParameter("priceRange");
        String sort = request.getParameter("sort");

        // ✅ phân trang
        int pageSize = 8;
        int page = 1;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (Exception ignored) {}
        if (page < 1) page = 1;
        int offset = (page - 1) * pageSize;

        // ✅ filter giá
        Double minPrice = null;
        Double maxPrice = null;
        if (priceRange != null) {
            switch (priceRange) {
                case "1" -> maxPrice = 100000.0;
                case "2" -> { minPrice = 100000.0; maxPrice = 300000.0; }
                case "3" -> { minPrice = 300000.0; maxPrice = 500000.0; }
                case "4" -> { minPrice = 500000.0; maxPrice = 700000.0; }
                case "5" -> { minPrice = 700000.0; maxPrice = 1000000.0; }
                case "6" -> minPrice = 1000000.0;
            }
        }

        Category category = categoryService.getCategoryById(categoryId);

        // ✅ đếm + list (ProductCard có avgRating/reviewCount)
        int totalProducts = cardService.countByCategoryWithFilter(categoryId, minPrice, maxPrice);
        int totalPages = (int) Math.ceil(totalProducts * 1.0 / pageSize);

        List<ProductCard> products = cardService.byCategoryWithFilter(
                categoryId, minPrice, maxPrice, sort, offset, pageSize
        );

        request.setAttribute("category", category);
        request.setAttribute("products", products);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("sort", sort);
        request.setAttribute("priceRange", priceRange);

        boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"))
                || "1".equals(request.getParameter("ajax"));

        RequestDispatcher rd = request.getRequestDispatcher(
                isAjax ? "/ProductList.jsp" : "/CategoryProducts.jsp"
        );
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
