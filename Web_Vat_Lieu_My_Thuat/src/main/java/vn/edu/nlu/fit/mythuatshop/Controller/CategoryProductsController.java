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

@WebServlet(name = "CategoryProductsController", value = "/category")   
public class CategoryProductsController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryService  categoryService = new CategoryService();
        ProductService productService = new ProductService();
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        Category category = categoryService.getCategoryById(categoryId);
        List<Product> products = productService.getProductsByCategoryId(categoryId);
        request.setAttribute("category", category);
        request.setAttribute("products", products);
        RequestDispatcher rd = request.getRequestDispatcher("/CategoryProducts.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}