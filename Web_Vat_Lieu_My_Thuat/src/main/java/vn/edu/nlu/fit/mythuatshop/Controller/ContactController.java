package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.mythuatshop.Model.Contact;
import vn.edu.nlu.fit.mythuatshop.Model.Users;
import vn.edu.nlu.fit.mythuatshop.Service.ContactService;

import java.io.IOException;

@WebServlet(name = "ContactController", value = "/contact")
public class ContactController extends HttpServlet {

    private ContactService contactService;
    @Override
    public void init() throws ServletException {
        contactService = new ContactService();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Contact.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Users currentUser = (Users) session.getAttribute("currentUser");

        if (currentUser == null) {
            // nếu dùng servlet /login thì sửa lại cho đúng path
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // chỉ lấy nội dung từ form
        String message = request.getParameter("message");

        Contact contact = new Contact();
        contact.setUserId(currentUser.getId());
        contact.setFullName(currentUser.getFullName());
        contact.setEmail(currentUser.getEmail());
        contact.setPhoneNumber(currentUser.getPhoneNumber());
        contact.setMessage(message);

        // lưu DB
        contactService.addContact(contact);

        // báo thành công
        request.setAttribute("successMsg", "Gửi liên hệ thành công!");
        RequestDispatcher rd = request.getRequestDispatcher("Contact.jsp");
        rd.forward(request, response);
    }
}