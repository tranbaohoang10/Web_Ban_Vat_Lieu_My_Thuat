package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.mythuatshop.Model.Cart;
import vn.edu.nlu.fit.mythuatshop.Model.CartItem;
import vn.edu.nlu.fit.mythuatshop.Model.Product;
import vn.edu.nlu.fit.mythuatshop.Model.Users;
import vn.edu.nlu.fit.mythuatshop.Service.ProductService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddToCartController", value = "/AddToCart")
public class AddToCartController extends HttpServlet {
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        Users currentUser = (Users) session.getAttribute("currentUser");
        if (currentUser == null) {
            resp.sendRedirect("login");
            return;
        }

        String action = req.getParameter("action");
        if ("remove".equals(action)) {
            handleRemoveItem(req, resp, session);
        } else {
            resp.sendRedirect(req.getContextPath() + "/Cart.jsp");
        }
    }

    private void handleRemoveItem(HttpServletRequest req, HttpServletResponse resp,
            HttpSession session) throws IOException {

        String pidStr = req.getParameter("productId");
        if (pidStr == null || pidStr.isBlank()) {
            resp.sendRedirect(req.getContextPath() + "/Cart.jsp");
            return;
        }

        int pid = Integer.parseInt(pidStr);

        Cart cart = getOrCreateCart(session);
        cart.removeCartItem(pid);
        session.setAttribute("cart", cart);
        session.setAttribute("cartCount", cart.getTotalQuantity());

        resp.sendRedirect(req.getContextPath() + "/Cart.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        Users currentUser = (Users) session.getAttribute("currentUser");
        if (currentUser == null) {
            resp.sendRedirect("login");
            return;
        }

        String action = req.getParameter("action");
        if ("update".equals(action)) {
            // nếu sau này còn dùng form submit
            handleUpdateCart(req, resp, session);
        } else if ("ajaxUpdate".equals(action)) {
            // cập nhật số lượng bằng AJAX
            handleAjaxUpdate(req, resp, session);
        } else {
            // mặc định: thêm vào giỏ (trang chi tiết sản phẩm)
            handleAddToCart(req, resp, session);
        }
    }

    // ========= THÊM 1 SẢN PHẨM =========
    private void handleAddToCart(HttpServletRequest req, HttpServletResponse resp,
            HttpSession session) throws IOException {

        String pidStr = req.getParameter("productId");
        String qtyStr = req.getParameter("quantity");

        if (pidStr == null || pidStr.isBlank() ||
                qtyStr == null || qtyStr.isBlank()) {
            String ref = req.getHeader("referer");
            resp.sendRedirect(ref != null ? ref : (req.getContextPath() + "/home"));
            return;
        }

        int productId = Integer.parseInt(pidStr);
        int quantity = Integer.parseInt(qtyStr);
        if (quantity <= 0)
            quantity = 1;

        Cart cart = getOrCreateCart(session);
        cart.addCartItem(productId, quantity);

        session.setAttribute("cart", cart);
        session.setAttribute("cartCount", cart.getTotalQuantity());

        // Kiểm tra nếu là AJAX request
        String ajaxHeader = req.getHeader("X-Requested-With");
        boolean isAjax = "XMLHttpRequest".equals(ajaxHeader) ||
                req.getContentType() != null && req.getContentType().contains("application/x-www-form-urlencoded");

        if (isAjax) {
            // Trả về JSON response cho AJAX
            resp.setContentType("application/json; charset=UTF-8");
            resp.getWriter().write("{\"success\":true,\"cartCount\":" + cart.getTotalQuantity() + "}");
        } else {
            // Redirect thông thường
            String referer = req.getHeader("referer");
            resp.sendRedirect(referer != null ? referer : (req.getContextPath() + "/Cart.jsp"));
        }
    }

    // ========= UPDATE TOÀN BỘ GIỎ (NẾU CÒN DÙNG FORM) =========
    private void handleUpdateCart(HttpServletRequest req, HttpServletResponse resp,
            HttpSession session) throws IOException {

        String[] productIds = req.getParameterValues("productId");
        String[] quantities = req.getParameterValues("quantity");

        if (productIds == null || quantities == null ||
                productIds.length == 0 || productIds.length != quantities.length) {
            resp.sendRedirect(req.getContextPath() + "/Cart.jsp");
            return;
        }

        Cart cart = getOrCreateCart(session);
        cart.getCarts().clear();

        for (int i = 0; i < productIds.length; i++) {
            int pid = Integer.parseInt(productIds[i]);
            int qty = Integer.parseInt(quantities[i]);
            if (qty < 1)
                qty = 1;

            cart.addCartItem(pid, qty);
        }

        session.setAttribute("cart", cart);
        session.setAttribute("cartCount", cart.getTotalQuantity());

        resp.sendRedirect(req.getContextPath() + "/Cart.jsp");
    }

    // ========= UPDATE 1 SẢN PHẨM (AJAX) =========
    private void handleAjaxUpdate(HttpServletRequest req, HttpServletResponse resp,
            HttpSession session) throws IOException {

        resp.setContentType("application/json; charset=UTF-8");

        String pidStr = req.getParameter("productId");
        String qtyStr = req.getParameter("quantity");

        if (pidStr == null || pidStr.isBlank() ||
                qtyStr == null || qtyStr.isBlank()) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("{\"success\":false}");
            return;
        }

        int productId = Integer.parseInt(pidStr);
        int quantity = Integer.parseInt(qtyStr);
        if (quantity < 1)
            quantity = 1;

        Cart cart = getOrCreateCart(session);
        cart.updateQuantity(productId, quantity);
        session.setAttribute("cart", cart);

        long totalAmount = 0;
        long itemSubtotal = 0;

        for (CartItem item : cart.getCarts().values()) {
            Product p = productService.getProductById(item.getProductId());
            if (p == null)
                continue;

            long price = (long) p.getPriceAfterDiscount();
            long sub = price * item.getQuantity();
            totalAmount += sub;

            if (item.getProductId() == productId) {
                itemSubtotal = sub;
            }
        }

        int cartCount = cart.getTotalQuantity();
        session.setAttribute("cartCount", cartCount);

        PrintWriter out = resp.getWriter();
        out.write("{\"success\":true,"
                + "\"itemSubtotal\":" + itemSubtotal + ","
                + "\"totalAmount\":" + totalAmount + ","
                + "\"cartCount\":" + cartCount + "}");
    }

    // ========= HELPER METHOD =========
    private Cart getOrCreateCart(HttpSession session) {
        Object cartObj = session.getAttribute("cart");

        // Nếu cart cũ là ArrayList (từ code cũ), reset về Cart mới
        if (cartObj instanceof java.util.ArrayList) {
            Cart newCart = new Cart();
            session.setAttribute("cart", newCart);
            return newCart;
        }

        // Nếu đã là Cart, trả về
        if (cartObj instanceof Cart) {
            return (Cart) cartObj;
        }

        // Nếu null hoặc kiểu khác, tạo mới
        Cart newCart = new Cart();
        session.setAttribute("cart", newCart);
        return newCart;
    }
}
