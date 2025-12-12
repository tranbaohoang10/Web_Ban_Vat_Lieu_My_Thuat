package vn.edu.nlu.fit.mythuatshop.Model;

public class OverviewOrderRow extends Order {
    private String productNames;
    private String statusName;

    public String getProductNames() { return productNames; }
    public void setProductNames(String productNames) { this.productNames = productNames; }

    public String getStatusName() { return statusName; }
    public void setStatusName(String statusName) { this.statusName = statusName; }
}
