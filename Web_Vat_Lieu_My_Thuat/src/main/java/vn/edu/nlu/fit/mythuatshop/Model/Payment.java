package vn.edu.nlu.fit.mythuatshop.Model;

import java.io.Serializable;

public class Payment implements Serializable {
    private int id;
    private String paymentName;
    private String description;

    public Payment() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPaymentName() {
        return paymentName;
    }

    public void setPaymentName(String paymentName) {
        this.paymentName = paymentName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
