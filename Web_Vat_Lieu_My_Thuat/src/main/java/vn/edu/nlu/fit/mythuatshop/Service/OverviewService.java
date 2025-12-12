package vn.edu.nlu.fit.mythuatshop.Service;

import vn.edu.nlu.fit.mythuatshop.Dao.OverviewDao;
import vn.edu.nlu.fit.mythuatshop.Model.OverviewOrderRow;
import vn.edu.nlu.fit.mythuatshop.Model.OverviewTopProductRow;

import java.math.BigDecimal;
import java.util.List;

public class OverviewService {
    private final OverviewDao dao = new OverviewDao();

    public int countUsers() {
        return dao.countUsers();
    }

    public int countProducts() {
        return dao.countProducts();
    }

    public int countCompletedOrders() {
        return dao.totalOrders();
    }

    public BigDecimal sumRevenueCompleted() {
        return dao.totalRevenues();
    }

    public List<OverviewOrderRow> latestOrders(int limit) {
        return dao.latestOrders(limit);
    }

    public List<OverviewTopProductRow> topProductsThisMonth(int limit) {
        return dao.topProductsThisMonth(limit);
    }
}
