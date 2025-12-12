package vn.edu.nlu.fit.mythuatshop.Model;

public class OrderItem {
    private int productId;
    private String name;
    private String thumbnail;
    private int quantity;
    private double price;

    public OrderItem(int productId, String name, String thumbnail, int quantity, double price) {
        this.productId = productId;
        this.name = name;
        this.thumbnail = thumbnail;
        this.quantity = quantity;
        this.price = price;
    }


    public OrderItem() {
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    public double getLineTotal() { return price * quantity; }
}

