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
    private CategoryService categoryService;
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        categoryService = new CategoryService();
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categories = categoryService.getAllcategories();
        List<Product> products = productService.getAllProducts();

        request.setAttribute("categories", categories);
        request.setAttribute("products", products);

        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}