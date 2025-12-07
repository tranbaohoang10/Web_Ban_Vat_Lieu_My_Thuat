package vn.edu.nlu.fit.mythuatshop.Model;

public class Specification {
    private int id;
    private int productID;
    private String size;
    private String standard;
    private String madeIn;
    private String warning;

    public Specification() {
    }

    public Specification(int id, String warning, String madeIn, String standard, String size, int productID) {
        this.id = id;
        this.warning = warning;
        this.madeIn = madeIn;
        this.standard = standard;
        this.size = size;
        this.productID = productID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getStandard() {
        return standard;
    }

    public void setStandard(String standard) {
        this.standard = standard;
    }

    public String getMadeIn() {
        return madeIn;
    }

    public void setMadeIn(String madeIn) {
        this.madeIn = madeIn;
    }

    public String getWarning() {
        return warning;
    }

    public void setWarning(String warning) {
        this.warning = warning;
    }
}
