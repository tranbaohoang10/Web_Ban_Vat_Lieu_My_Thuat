package vn.edu.nlu.fit.mythuatshop.Model;

import java.io.Serializable;

public class OrderStatus implements Serializable {
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
