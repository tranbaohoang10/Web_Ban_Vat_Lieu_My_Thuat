package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.mythuatshop.Model.Product;
import vn.edu.nlu.fit.mythuatshop.Service.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductSearchController", value = "/search")
public class ProductSearchController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductService productService = new ProductService();
        String keyword = request.getParameter("keyword");
        String sort = request.getParameter("sort");

        // Xử lý null/empty cho keyword
        if (keyword == null) {
            keyword = "";
        }

        List<Product> products;
        // phân trang
        int pageSize = 8;
        int page = 1;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (Exception ignored) {
        }
        if (page < 1)
            page = 1;
        int offset = (page - 1) * pageSize;
        int totalProducts = productService.countProductSearch(keyword);
        int totalPages = (int) Math.ceil(totalProducts * 1.0 / pageSize);
        products = productService.getProductSearch(keyword, sort, offset, pageSize);

        request.setAttribute("keyword", keyword);
        request.setAttribute("products", products);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("sort", sort);
        boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"))
                || "1".equals(request.getParameter("ajax"));

        if (isAjax) {
            RequestDispatcher rd = request.getRequestDispatcher("/ProductList.jsp");
            rd.forward(request, response);
        } else {

            RequestDispatcher rd = request.getRequestDispatcher("/ProductSearch.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}