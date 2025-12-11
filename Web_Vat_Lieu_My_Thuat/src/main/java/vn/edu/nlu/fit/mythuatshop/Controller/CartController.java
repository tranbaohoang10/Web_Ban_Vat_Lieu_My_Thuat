package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.mythuatshop.Model.Cart;
import vn.edu.nlu.fit.mythuatshop.Model.CartItem;
import vn.edu.nlu.fit.mythuatshop.Model.Users;

import java.io.IOException;
@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        // Bắt buộc login (giống cũ)
        Users currentUser = (Users) session.getAttribute("currentUser");
        if (currentUser == null) {
            resp.sendRedirect("login");
            return;
        }

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        int totalQuantity = cart.getTotalQuantity();
        long totalAmount = 0L;

        for (CartItem item : cart.getCarts().values()) {
            totalAmount += (long) item.totalPriceCartItem();
        }

        req.setAttribute("cartItems", cart.getCarts().values());
        req.setAttribute("totalQuantity", totalQuantity);
        req.setAttribute("totalAmount", totalAmount);
        req.setAttribute("cartSize", cart.cartSize());

        req.getRequestDispatcher("/Cart.jsp").forward(req, resp);
    }
}
