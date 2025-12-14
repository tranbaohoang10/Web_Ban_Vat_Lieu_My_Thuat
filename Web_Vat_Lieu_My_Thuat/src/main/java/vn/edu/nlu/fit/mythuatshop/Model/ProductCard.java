package vn.edu.nlu.fit.mythuatshop.Model;

public class ProductCard extends Product {
    private double avgRating;   // điểm trung bình
    private int reviewCount;    // số lượt đánh giá

    public ProductCard() {}

    public double getAvgRating() {
        return avgRating;
    }
    public void setAvgRating(double avgRating) {
        this.avgRating = avgRating;
    }

    public int getReviewCount() {
        return reviewCount;
    }
    public void setReviewCount(int reviewCount) {
        this.reviewCount = reviewCount;
    }


    public int getAvgStarInt() {
        int r = (int) Math.round(avgRating);
        if (r < 0) r = 0;
        if (r > 5) r = 5;
        return r;
    }
    public double getAvgRatingHalf() {
        double r = Math.round(this.avgRating * 2.0) / 2.0; // 0.5 step
        if (r < 0) r = 0;
        if (r > 5) r = 5;
        return r;
    }

    public int getFullStarCount() {
        return (int) Math.floor(getAvgRatingHalf());
    }

    public boolean isHalfStar() {
        return (getAvgRatingHalf() - getFullStarCount()) == 0.5;
    }

    public int getEmptyStarCount() {
        return 5 - getFullStarCount() - (isHalfStar() ? 1 : 0);
    }

}
