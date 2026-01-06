package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.edu.nlu.fit.mythuatshop.Service.AdminUserService;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet(name = "AdminUsersController", value = "/admin/users")
public class AdminUserController extends HttpServlet {

    private final AdminUserService service = new AdminUserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int page = 1;
        int pageSize = 10; //

        String pageStr = req.getParameter("page");
        if (pageStr != null) {
            try { page = Integer.parseInt(pageStr); } catch (Exception ignored) {}
        }

        String q = req.getParameter("q"); // có thể null
        String msg = req.getParameter("msg");

        req.setAttribute("users", service.listUsers(page, pageSize, q));
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", service.totalPages(pageSize, q));
        req.setAttribute("q", (q == null) ? "" : q);
        req.setAttribute("msg", msg);

        req.getRequestDispatcher("/admin/User.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        // giữ lại page + q sau khi thao tác
        String page = req.getParameter("page");
        String q = req.getParameter("q");
        if (page == null || page.isBlank()) page = "1";
        if (q == null) q = "";

        boolean ok = false;

        if ("create".equals(action)) {
            ok = service.createUser(
                    req.getParameter("fullName"),
                    req.getParameter("email"),
                    req.getParameter("phoneNumber"),
                    req.getParameter("dob"),
                    req.getParameter("address"),
                    req.getParameter("role")
            );

        } else if ("update".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            ok = service.updateUser(
                    id,
                    req.getParameter("fullName"),
                    req.getParameter("phoneNumber"),
                    req.getParameter("dob"),
                    req.getParameter("address"),
                    req.getParameter("role")
            );

        } else if ("lock".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            ok = service.lockUser(id);

        } else if ("unlock".equals(action)) { // tuỳ chọn
            int id = Integer.parseInt(req.getParameter("id"));
            ok = service.unlockUser(id);
        }

        String msg = ok ? "success" : "fail";
        String qEncoded = URLEncoder.encode(q, StandardCharsets.UTF_8);

        resp.sendRedirect(req.getContextPath() + "/admin/users?page=" + page + "&q=" + qEncoded + "&msg=" + msg);
    }
}
