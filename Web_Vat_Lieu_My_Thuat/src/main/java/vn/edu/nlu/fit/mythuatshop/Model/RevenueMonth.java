package vn.edu.nlu.fit.mythuatshop.Model;

import java.math.BigDecimal;

public class RevenueMonth {
    private int month;
    private BigDecimal revenue;     // SUM(totalPrice)

    public RevenueMonth() {}
    public RevenueMonth(int month, BigDecimal revenue) {
        this.month = month;
        this.revenue = revenue;
    }

    public int getMonth() { return month; }
    public void setMonth(int month) { this.month = month; }

    public BigDecimal getRevenue() { return revenue; }
    public void setRevenue(BigDecimal revenue) { this.revenue = revenue; }
}
