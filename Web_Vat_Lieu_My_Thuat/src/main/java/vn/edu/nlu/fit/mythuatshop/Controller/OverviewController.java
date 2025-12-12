package vn.edu.nlu.fit.mythuatshop.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.mythuatshop.Service.OverviewService;

import java.io.IOException;

@WebServlet(name = "OverviewController", value = "/admin/overview")
public class OverviewController extends HttpServlet {

    private OverviewService service;

    @Override
    public void init() {
        service = new OverviewService();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("totalUsers", service.countUsers());
        request.setAttribute("totalProducts", service.countProducts());
        request.setAttribute("totalOrders", service.countCompletedOrders());     // status=3
        request.setAttribute("totalRevenue", service.sumRevenueCompleted());    // status=3

        request.setAttribute("latestOrders", service.latestOrders(10));
        request.setAttribute("topProductsMonth", service.topProductsThisMonth(10));

        request.getRequestDispatcher("/admin/Admin.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}