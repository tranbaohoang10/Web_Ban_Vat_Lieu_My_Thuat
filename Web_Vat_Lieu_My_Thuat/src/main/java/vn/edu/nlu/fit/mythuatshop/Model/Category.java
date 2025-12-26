package vn.edu.nlu.fit.mythuatshop.Model;

import java.io.Serializable;

public class Category implements Serializable {
    private int id;
    private String categoryName;
    private String thumbnail;
    private int isActive; // ✅ thêm

    public Category() {}

    public Category(int id, String categoryName, String thumbnail, int isActive) {
        this.id = id;
        this.categoryName = categoryName;
        this.thumbnail = thumbnail;
        this.isActive = isActive;
    }

    public int getId() { return id; }
    public String getCategoryName() { return categoryName; }
    public String getThumbnail() { return thumbnail; }
    public int getIsActive() { return isActive; } // ✅ thêm

    public void setId(int id) { this.id = id; }
    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }
    public void setThumbnail(String thumbnail) { this.thumbnail = thumbnail; }
    public void setIsActive(int isActive) { this.isActive = isActive; } // ✅ thêm

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", categoryName='" + categoryName + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                ", isActive=" + isActive +
                '}';
    }
}
