package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.mythuatshop.Model.Product;
import vn.edu.nlu.fit.mythuatshop.Model.Specification;
import vn.edu.nlu.fit.mythuatshop.Model.Subimages;
import vn.edu.nlu.fit.mythuatshop.Service.DetailsProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DetailsProductController", value = "/DetailsProductController")
public class DetailsProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idUrl = request.getParameter("id");
        if (idUrl == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing product id");
            return;
        }
        int productId = Integer.parseInt(idUrl);
        DetailsProductService service = new DetailsProductService();
        Product p = service.getProduct(productId);
        if(p==null){
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
            return;
        }
      List<Specification> specificationList = service.getSpecifications(productId);
        List<Subimages> subimagesList = service.getSubImages(productId);
        List<Product> relatedProducts = service.getRelatedProducts(p);
        request.setAttribute("product", p);
        request.setAttribute("specificationList", specificationList);
        request.setAttribute("subimagesList", subimagesList);
        request.setAttribute("relatedProducts", relatedProducts);
        request.getRequestDispatcher("ProductDetails.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}