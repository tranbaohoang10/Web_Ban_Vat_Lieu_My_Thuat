package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.mythuatshop.Dao.CategoryDao;
import vn.edu.nlu.fit.mythuatshop.Dao.ProductDao;
import vn.edu.nlu.fit.mythuatshop.Dao.Product_ReviewsDao;
import vn.edu.nlu.fit.mythuatshop.Model.Category;
import vn.edu.nlu.fit.mythuatshop.Model.Product;
import vn.edu.nlu.fit.mythuatshop.Model.Product_Review;
import vn.edu.nlu.fit.mythuatshop.Model.Users;
import vn.edu.nlu.fit.mythuatshop.Service.Product_ReviewService;
import vn.edu.nlu.fit.mythuatshop.Service.UserService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Product_ReviewsController", value = "/Product_ReviewsController")
public class Product_ReviewsController extends HttpServlet {
    private Product_ReviewService reviewService;
    private ProductDao productDao;
    @Override
    public void init() throws ServletException {
        reviewService = new Product_ReviewService();
        productDao = new ProductDao();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String url = request.getParameter("id");
        if (url == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing product id");
            return;
        }
    int productID = Integer.parseInt(url);
    Product product = productDao.findByProductId(productID);
        if (product == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
            return;
        }
        List<Product_Review> reviews = reviewService.getReviewsByProductId(productID);
        double avgRating = reviewService.averageRating(productID);
        // làm tròn 1 chữ số thập phân
        avgRating = Math.round(avgRating * 10.0) / 10.0;
        int reviewCount = reviews.size();

        // 4. Gắn dữ liệu vào request
        request.setAttribute("product", product);
        request.setAttribute("reviews", reviews);
        request.setAttribute("avgRating", avgRating);
        request.setAttribute("reviewCount", reviewCount);
        request.getRequestDispatcher("ProductReviews.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}