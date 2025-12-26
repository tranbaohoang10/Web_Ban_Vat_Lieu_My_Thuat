package vn.edu.nlu.fit.mythuatshop.Model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class BestSellerRow {
    private int productId;
    private String productName;
    private String categoryName;
    private BigDecimal price;
    private Timestamp createAt;
    private int soldQty; // SUM(order_details.quantity) trong range

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public String getCategoryName() { return categoryName; }
    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }

    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }

    public Timestamp getCreateAt() { return createAt; }
    public void setCreateAt(Timestamp createAt) { this.createAt = createAt; }

    public int getSoldQty() { return soldQty; }
    public void setSoldQty(int soldQty) { this.soldQty = soldQty; }
}
