package vn.edu.nlu.fit.mythuatshop.Model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Product implements Serializable {
    private int id;
    private String name;
    private double price;
    private int discountDefault;
    private int categoryId;
    private String thumbnail;
    private int quantityStock;
    private int soldQuantity;
    private String status;
    private Timestamp createAt;

    public Product() {
    }

    public Product(int id, String name, double price, int discountDefault, int categoryId, String thumbnail, int quantityStock, int soldQuantity, String status, Timestamp createAt) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.discountDefault = discountDefault;
        this.categoryId = categoryId;
        this.thumbnail = thumbnail;
        this.quantityStock = quantityStock;
        this.soldQuantity = soldQuantity;
        this.status = status;
        this.createAt = createAt;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public int getDiscountDefault() {
        return discountDefault;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public int getQuantityStock() {
        return quantityStock;
    }

    public int getSoldQuantity() {
        return soldQuantity;
    }

    public String getStatus() {
        return status;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setDiscountDefault(int discountDefault) {
        this.discountDefault = discountDefault;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public void setQuantityStock(int quantityStock) {
        this.quantityStock = quantityStock;
    }

    public void setSoldQuantity(int soldQuantity) {
        this.soldQuantity = soldQuantity;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }
    public double getPriceAfterDiscount() { // tính giá bán (giá gốc sau khi giảm)
        return price * (100.0 - discountDefault) / 100.0;
    }
    public boolean isOutOfStock() {
        return quantityStock <= 0;
    }
    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", discountDefault=" + discountDefault +
                ", categoryId=" + categoryId +
                ", thumbnail='" + thumbnail + '\'' +
                ", quantityStock=" + quantityStock +
                ", soldQuantity=" + soldQuantity +
                ", status=" + status +
                ", createAt=" + createAt +
                '}';
    }


}
