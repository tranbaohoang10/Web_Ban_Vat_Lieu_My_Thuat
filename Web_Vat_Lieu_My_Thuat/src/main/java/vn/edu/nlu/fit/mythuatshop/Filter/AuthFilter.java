package vn.edu.nlu.fit.mythuatshop.Filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Không cần làm gì khi khởi tạo filter
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        // Ngăn cache sau logout
        resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        resp.setHeader("Pragma", "no-cache");
        resp.setDateHeader("Expires", 0);

        String ctx = req.getContextPath();            // ví dụ: /mythuat_shop_war_exploded
        String uri = req.getRequestURI();             // ví dụ: /mythuat_shop_war_exploded/admin
        String path = uri.substring(ctx.length());    // ví dụ: /admin

        // Các đường dẫn public (không yêu cầu đăng nhập)
        boolean isPublic =
                path.equals("/") ||
                        path.startsWith("/login") ||
                        path.startsWith("/logout") ||
                        path.startsWith("/register") ||
                        path.startsWith("/assets/") ||
                        path.endsWith(".css") ||
                        path.endsWith(".js") ||
                        path.endsWith(".png") || path.endsWith(".jpg") ||
                        path.endsWith(".jpeg") || path.endsWith(".gif") ||
                        path.endsWith(".ico");

        HttpSession session = req.getSession(false);
        Object authUser = (session == null) ? null : session.getAttribute("authUser");

        if (!isPublic && authUser == null) {
            resp.sendRedirect(ctx + "/login");
            return;
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Không cần làm gì khi hủy filter
    }
}
