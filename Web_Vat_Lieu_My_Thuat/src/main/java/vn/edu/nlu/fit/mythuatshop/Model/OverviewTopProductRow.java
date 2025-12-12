package vn.edu.nlu.fit.mythuatshop.Model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class OverviewTopProductRow {
    private int id;
    private String name;
    private String categoryName;
    private BigDecimal price;
    private Timestamp createAt;
    private int soldQty;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getCategoryName() { return categoryName; }
    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }

    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }

    public Timestamp getCreateAt() { return createAt; }
    public void setCreateAt(Timestamp createAt) { this.createAt = createAt; }

    public int getSoldQty() { return soldQty; }
    public void setSoldQty(int soldQty) { this.soldQty = soldQty; }
}
