package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.mythuatshop.Model.Category;
import vn.edu.nlu.fit.mythuatshop.Model.ProductCard;
import vn.edu.nlu.fit.mythuatshop.Model.SliderShow;
import vn.edu.nlu.fit.mythuatshop.Service.CategoryService;
import vn.edu.nlu.fit.mythuatshop.Service.ProductCardService;
import vn.edu.nlu.fit.mythuatshop.Service.SliderShowService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryService categoryService = new CategoryService();
        ProductCardService cardService = new ProductCardService();
        SliderShowService sliderShowService = new SliderShowService();

        List<Category> categories = categoryService.getAllActiveCategories();


        Category cat1 = null;
        Category cat2 = null;
        if (categories.size() > 0) cat1 = categories.get(0);
        if (categories.size() > 1) cat2 = categories.get(1);

        List<ProductCard> productsCat1 = (cat1 != null)
                ? cardService.topByCategory(cat1.getId(), 10)
                : List.of();

        List<ProductCard> productsCat2 = (cat2 != null)
                ? cardService.topByCategory(cat2.getId(), 10)
                : List.of();

        List<SliderShow> sliderShows = sliderShowService.getSliderShow();

        request.setAttribute("sliders", sliderShows);
        request.setAttribute("categories", categories);
        request.setAttribute("cat1", cat1);
        request.setAttribute("cat2", cat2);
        request.setAttribute("productsCat1", productsCat1);
        request.setAttribute("productsCat2", productsCat2);

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
