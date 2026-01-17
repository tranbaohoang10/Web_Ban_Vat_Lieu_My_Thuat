package vn.edu.nlu.fit.mythuatshop.Dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.nlu.fit.mythuatshop.Model.BestSellerChartPoint;
import vn.edu.nlu.fit.mythuatshop.Model.BestSellerRow;
import vn.edu.nlu.fit.mythuatshop.Model.NoSaleRow;
import vn.edu.nlu.fit.mythuatshop.Model.RevenueMonth;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class StatisticDAO {
    private final Jdbi jdbi;

    public StatisticDAO() {
        this.jdbi = JDBIConnector.getJdbi();
    }


    public static LocalDateTime startOfMonthRange(int months) {
        LocalDate firstOfThisMonth = LocalDate.now().withDayOfMonth(1);
        return firstOfThisMonth.minusMonths(months - 1L).atStartOfDay();
    }

    public static LocalDateTime endOfMonthRange() {
        LocalDate firstOfNextMonth = LocalDate.now().withDayOfMonth(1).plusMonths(1);
        return firstOfNextMonth.atStartOfDay();
    }

    public BigDecimal totalRevenueThisYear() {
        String sql = """
            SELECT COALESCE(SUM(o.totalPrice), 0) AS total
            FROM Orders o
            WHERE o.orderStatusID = 3
              AND o.createAt >= MAKEDATE(YEAR(CURDATE()), 1)
              AND o.createAt <  MAKEDATE(YEAR(CURDATE()) + 1, 1)
        """;
        return jdbi.withHandle(h -> h.createQuery(sql).mapTo(BigDecimal.class).one());
    }

    public List<RevenueMonth> revenueByMonthThisYear() {
        String sql = """
            SELECT m.mon AS month,
                   COALESCE(t.revenue, 0) AS revenue
            FROM (
                SELECT 1 AS mon UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
                UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8
                UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12
            ) m
            LEFT JOIN (
                SELECT MONTH(o.createAt) AS mon,
                       SUM(o.totalPrice) AS revenue
                FROM Orders o
                WHERE o.orderStatusID = 3
                  AND o.createAt >= MAKEDATE(YEAR(CURDATE()), 1)
                  AND o.createAt <  MAKEDATE(YEAR(CURDATE()) + 1, 1)
                GROUP BY MONTH(o.createAt)
            ) t ON t.mon = m.mon
            ORDER BY m.mon
        """;

        return jdbi.withHandle(h -> h.createQuery(sql)
                .map((rs, ctx) -> new RevenueMonth(
                        rs.getInt("month"),
                        rs.getBigDecimal("revenue")
                ))
                .list());
    }


    public List<NoSaleRow> noSaleProducts(LocalDateTime from, LocalDateTime to) {
        String sql = """
            SELECT
              p.ID AS productId,
              p.name AS productName,
              c.categoryName AS categoryName,
              p.price AS price,
              p.createAt AS createAt,
              COALESCE(SUM(CASE WHEN o.ID IS NOT NULL THEN od.quantity ELSE 0 END), 0) AS soldQuantity
            FROM Products p
            JOIN Categories c ON c.ID = p.categoryID
            LEFT JOIN Order_Details od ON od.productID = p.ID
            LEFT JOIN Orders o ON o.ID = od.orderID
                             AND o.orderStatusID = 3
                             AND o.createAt >= :from
                             AND o.createAt <  :to
            GROUP BY p.ID, p.name, c.categoryName, p.price, p.createAt
            HAVING soldQuantity = 0
            ORDER BY p.createAt DESC
        """;

        return jdbi.withHandle(h -> h.createQuery(sql)
                .bind("from", Timestamp.valueOf(from))
                .bind("to", Timestamp.valueOf(to))
                .mapToBean(NoSaleRow.class)
                .list());
    }


    public List<BestSellerRow> bestSellersAllTime() {
        String sql = """
            SELECT
              p.ID AS productId,
              p.name AS productName,
              c.categoryName AS categoryName,
              p.price AS price,
              p.createAt AS createAt,
              COALESCE(SUM(od.quantity), 0) AS soldQty
            FROM Products p
            JOIN Categories c ON c.ID = p.categoryID
            LEFT JOIN Order_Details od ON od.productID = p.ID
            LEFT JOIN Orders o ON o.ID = od.orderID AND o.orderStatusID = 3
            GROUP BY p.ID, p.name, c.categoryName, p.price, p.createAt
            ORDER BY soldQty DESC
        """;

        return jdbi.withHandle(h -> h.createQuery(sql)
                .mapToBean(BestSellerRow.class)
                .list());
    }


    public List<BestSellerChartPoint> bestSellerTop5ForChartAllTime() {
        String sql = """
            SELECT
              p.ID AS productId,
              p.name AS productName,
              COALESCE(SUM(od.quantity), 0) AS soldQty
            FROM Products p
            LEFT JOIN Order_Details od ON od.productID = p.ID
            LEFT JOIN Orders o ON o.ID = od.orderID AND o.orderStatusID = 3
            GROUP BY p.ID, p.name
            ORDER BY soldQty DESC
            LIMIT 5
        """;

        return jdbi.withHandle(h -> h.createQuery(sql)
                .mapToBean(BestSellerChartPoint.class)
                .list());
    }
}
