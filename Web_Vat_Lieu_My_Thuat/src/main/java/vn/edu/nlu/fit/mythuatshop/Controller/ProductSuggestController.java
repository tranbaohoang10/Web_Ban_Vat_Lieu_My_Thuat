package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.mythuatshop.Model.Product;
import vn.edu.nlu.fit.mythuatshop.Service.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductSuggestController", value = "/search-suggest")
public class ProductSuggestController extends HttpServlet {

    private ProductService productService;

    @Override
    public void init() {
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String kw = req.getParameter("keyword");
        if (kw == null) kw = "";
        kw = kw.trim();

        // tránh spam: gõ 1 ký tự thì khỏi query DB
        if (kw.length() < 2) {
            resp.getWriter().write("[]");
            return;
        }

        int limit = 5;
        try {
            String limitStr = req.getParameter("limit");
            if (limitStr != null) limit = Integer.parseInt(limitStr);
        } catch (Exception ignored) {}

        List<Product> list = productService.suggestProducts(kw, limit);

        // build JSON (theo style project bạn đang làm)
        StringBuilder sb = new StringBuilder();
        sb.append("[");

        for (int i = 0; i < list.size(); i++) {
            Product p = list.get(i);

            String name = jsonEscape(p.getName());
            String thumb = jsonEscape(p.getThumbnail());

            double priceAfter = p.getPriceAfterDiscount();
            boolean outOfStock = p.getQuantityStock() <= 0;

            sb.append("{")
                    .append("\"id\":").append(p.getId()).append(",")
                    .append("\"name\":\"").append(name).append("\",")
                    .append("\"thumbnail\":\"").append(thumb).append("\",")
                    .append("\"priceAfter\":").append((long) priceAfter).append(",")
                    .append("\"outOfStock\":").append(outOfStock)
                    .append("}");

            if (i < list.size() - 1) sb.append(",");
        }

        sb.append("]");
        resp.getWriter().write(sb.toString());
    }

    private static String jsonEscape(String s) {
        if (s == null) return "";
        return s.replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\n", "\\n")
                .replace("\r", "\\r")
                .replace("\t", "\\t");
    }
}