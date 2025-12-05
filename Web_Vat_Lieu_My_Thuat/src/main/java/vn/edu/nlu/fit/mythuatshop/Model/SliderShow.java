package vn.edu.nlu.fit.mythuatshop.Model;

public class SliderShow {
    private int id;
    private String title;
    private String thumbnail;
    private int  status;
    private  int indexOrder;
    private String linkTo;

    public SliderShow() {
    }

    public SliderShow(int id, String title, String thumbnail, int status, int indexOrder, String linkTo) {
        this.id = id;
        this.title = title;
        this.thumbnail = thumbnail;
        this.status = status;
        this.indexOrder = indexOrder;
        this.linkTo = linkTo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getIndexOrder() {
        return indexOrder;
    }

    public void setIndexOrder(int indexOrder) {
        this.indexOrder = indexOrder;
    }

    public String getLinkTo() {
        return linkTo;
    }

    public void setLinkTo(String linkTo) {
        this.linkTo = linkTo;
    }
}
