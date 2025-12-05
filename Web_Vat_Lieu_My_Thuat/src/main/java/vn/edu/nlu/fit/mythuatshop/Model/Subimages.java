package vn.edu.nlu.fit.mythuatshop.Model;

public class Subimages {
    private int id;
    private int productID;
    private String image;

    public Subimages() {
    }

    public Subimages(int id, int productID, String image) {
        this.id = id;
        this.productID = productID;
        this.image = image;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
