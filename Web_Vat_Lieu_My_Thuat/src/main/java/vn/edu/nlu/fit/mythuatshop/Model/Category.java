package vn.edu.nlu.fit.mythuatshop.Model;

import java.io.Serializable;

public class Category implements Serializable {
    private int id;
    private String categoryName;
    private String thumbnail;

    public Category() {
    }

    public Category(int id, String categoryName, String thumbnail) {
        this.id = id;
        this.categoryName = categoryName;
        this.thumbnail = thumbnail;
    }

    public int getId() {
        return id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", categoryName='" + categoryName + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                '}';
    }
}
