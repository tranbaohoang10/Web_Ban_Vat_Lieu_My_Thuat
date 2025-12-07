package vn.edu.nlu.fit.mythuatshop.Model;

import java.sql.Timestamp;

public class Cart {
    private int id;
    private int userID;
    private int productID;
    private int quantity;
    private Timestamp createAt;

    public Cart() {
    }

    public Cart(int id, int userID, int productID, int quantity, Timestamp createAt) {
        this.id = id;
        this.userID = userID;
        this.productID = productID;
        this.quantity = quantity;
        this.createAt = createAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", userID=" + userID +
                ", productID=" + productID +
                ", quantity=" + quantity +
                ", createAt=" + createAt +
                '}';
    }
}
