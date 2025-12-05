package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.mythuatshop.Model.Category;
import vn.edu.nlu.fit.mythuatshop.Model.Product;
import vn.edu.nlu.fit.mythuatshop.Service.CategoryService;
import vn.edu.nlu.fit.mythuatshop.Service.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryService categoryService = new CategoryService();
        ProductService productService = new ProductService();
        List<Category> categories = categoryService.getAllcategories();
        Category cat1 = null;
        Category cat2 = null;
        if (categories.size() > 0) cat1 = categories.get(0);
        if (categories.size() > 1) cat2 = categories.get(1);
        List<Product> productsCat1 = (cat1 != null)
                ? productService.getAllProductsByCategoryId(cat1.getId())
                : List.of();

        List<Product> productsCat2 = (cat2 != null)
                ? productService.getAllProductsByCategoryId(cat2.getId())
                : List.of();
        List<Product> products = productService.getAllProducts();

        request.setAttribute("cat1", cat1);
        request.setAttribute("cat2", cat2);
        request.setAttribute("productsCat1", productsCat1);
        request.setAttribute("productsCat2", productsCat2);

        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}