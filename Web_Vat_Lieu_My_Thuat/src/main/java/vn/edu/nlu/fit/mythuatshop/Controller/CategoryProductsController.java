package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.mythuatshop.Model.Category;
import vn.edu.nlu.fit.mythuatshop.Model.Product;
import vn.edu.nlu.fit.mythuatshop.Service.CategoryService;
import vn.edu.nlu.fit.mythuatshop.Service.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryProductsController", value = "/category")
public class CategoryProductsController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryService categoryService = new CategoryService();
        ProductService productService = new ProductService();
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String priceRange = request.getParameter("priceRange");
        String sort = request.getParameter("sort");
        Double minPrice = null;
        Double maxPrice = null;
        if (priceRange != null) {
            switch (priceRange) {
                case "1":
                    maxPrice = 100000.0;
                    break;
                case "2":
                    minPrice = 100000.0;
                    maxPrice = 300000.0;
                    break;
                case "3":
                    minPrice = 300000.0;
                    maxPrice = 500000.0;
                    break;
                case "4":
                    minPrice = 500000.0;
                    maxPrice = 700000.0;
                    break;
                case "5":
                    minPrice = 700000.0;
                    maxPrice = 1000000.0;
                    break;
                case "6":
                    minPrice = 1000000.0;
                    break;
            }
        }

        Category category = categoryService.getCategoryById(categoryId);
        List<Product> products =
                productService.getProductsByCategoryWithFilter(categoryId, minPrice, maxPrice, sort);
        request.setAttribute("category", category);
        request.setAttribute("products", products);

        boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"))
                || "1".equals(request.getParameter("ajax"));

        if (isAjax) {
            RequestDispatcher rd = request.getRequestDispatcher("/ProductList.jsp");
            rd.forward(request, response);
        } else {

            RequestDispatcher rd = request.getRequestDispatcher("/CategoryProducts.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}