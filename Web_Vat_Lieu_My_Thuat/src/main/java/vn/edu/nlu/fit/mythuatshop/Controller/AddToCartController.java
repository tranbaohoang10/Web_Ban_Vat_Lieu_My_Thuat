package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.mythuatshop.Model.Users;
import vn.edu.nlu.fit.mythuatshop.Service.CartService;

import java.io.IOException;

@WebServlet(name = "AddToCartController", value = "/AddToCartController")
public class AddToCartController extends HttpServlet {
    private CartService cartService;

    @Override
    public void init() throws ServletException {
        cartService = new CartService();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users currentUser = (Users) session.getAttribute("currentUser");

        if (currentUser == null) {
            response.sendRedirect("login");
            return;
        }

        String pidStr = request.getParameter("productId");
        String qtyStr = request.getParameter("quantity");

        if (pidStr == null || qtyStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing productId or quantity");
            return;
        }

        int userId = currentUser.getId();
        int productId = Integer.parseInt(pidStr);
        int quantity = Integer.parseInt(qtyStr);
        if (quantity <= 0) quantity = 1;

        // Gọi service
        cartService.addToCart(userId, productId, quantity);

        int cartCount = cartService.getCartCount(userId);
        session.setAttribute("cartCount", cartCount);

        // quay lại trang chi tiết sản phẩm khi người dùng bấm thêm giỏ hàng
        String referer = request.getHeader("referer");
        if (referer != null) {
            response.sendRedirect(referer);
        } else {
            response.sendRedirect("GioHang.jsp");
        }
    }
    }