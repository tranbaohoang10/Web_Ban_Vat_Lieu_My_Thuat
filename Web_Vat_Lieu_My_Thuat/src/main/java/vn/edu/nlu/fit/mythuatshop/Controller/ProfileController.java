// ProfileController.java
package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.nlu.fit.mythuatshop.Model.Users;
import vn.edu.nlu.fit.mythuatshop.Service.UserService;

import java.io.IOException;

@WebServlet(name = "ProfileController", value = "/profile")
public class ProfileController extends HttpServlet {

    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        Users currentUser = (Users) (session != null ? session.getAttribute("currentUser") : null);

        // Chưa đăng nhập thì đá về trang login
        if (currentUser == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // Lấy lại user từ DB cho chắc (phòng trường hợp dữ liệu đổi)
        Users userFromDb = userService.getUserById(currentUser.getId());
        Users userToUse = currentUser;

        if (userFromDb != null) {
            // Cập nhật lại session
            session.setAttribute("currentUser", userFromDb);
            userToUse = userFromDb;
        }

        // Xử lý ngày sinh để hiển thị lên <input type="date">
        if (userToUse.getDob() != null) {
            String dobString = userToUse.getDob().toLocalDate().toString(); // yyyy-MM-dd
            req.setAttribute("dob", dobString);
        }

        // Chuyển sang trang JSP
        req.getRequestDispatcher("ThongTinKhachHang.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession(false);
        Users currentUser = (Users) (session != null ? session.getAttribute("currentUser") : null);

        // Nếu chưa đăng nhập thì cho về login
        if (currentUser == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // Lấy dữ liệu từ form
        String fullName = req.getParameter("fullName");
        String phoneNumber = req.getParameter("phoneNumber");
        String dob = req.getParameter("dob");        // dạng yyyy-MM-dd
        String address = req.getParameter("address");

        boolean success = userService.updateProfile(
                currentUser.getId(),
                fullName,
                phoneNumber,
                dob,
                address
        );

        if (!success) {
            // Cập nhật thất bại
            req.setAttribute("error", "Cập nhật thông tin thất bại, vui lòng thử lại!");
            // Giữ lại dob người dùng vừa nhập để hiển thị lại
            req.setAttribute("dob", dob);
        } else {
            // Lấy lại thông tin mới từ DB để cập nhật session
            Users updatedUser = userService.getUserById(currentUser.getId());
            if (updatedUser != null) {
                session.setAttribute("currentUser", updatedUser);

                if (updatedUser.getDob() != null) {
                    String dobString = updatedUser.getDob().toLocalDate().toString();
                    req.setAttribute("dob", dobString);
                }
            }

            req.setAttribute("success", "Cập nhật thông tin thành công!");
        }

        // Quay lại trang thông tin khách hàng
        req.getRequestDispatcher("ThongTinKhachHang.jsp").forward(req, resp);
    }
}
