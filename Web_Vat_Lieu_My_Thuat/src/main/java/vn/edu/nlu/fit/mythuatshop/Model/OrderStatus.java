package vn.edu.nlu.fit.mythuatshop.Model;

public class OrderStatus {
    private int id;
    private String statusName;

    public OrderStatus() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }
}
