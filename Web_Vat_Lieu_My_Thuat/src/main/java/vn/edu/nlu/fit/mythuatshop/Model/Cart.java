package vn.edu.nlu.fit.mythuatshop.Model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<Integer, CartItem> carts;
    private int fee = 0;
    private int discount = 0;

    public Cart() {
        carts = new HashMap<>();
    }

    public Map<Integer, CartItem> getCarts() {
        return carts;
    }

    public void setCarts(Map<Integer, CartItem> carts) {
        this.carts = carts;
    }

    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public void addCartItem(CartItem newItem) {
        int productId = newItem.getProductId();
        if (carts.containsKey(productId)) {
            CartItem item = carts.get(productId);
            item.setQuantity(item.getQuantity() + newItem.getQuantity());
        } else {
            carts.put(productId, newItem);
        }
    }


    public void updateQuantity(int productId, int quantity) {
        if (carts != null && carts.containsKey(productId)) {
            CartItem item = carts.get(productId);
            item.setQuantity(quantity);
        }
    }

    public void removeCartItem(int productId) {
        if (carts != null && carts.containsKey(productId)) {
            carts.remove(productId);
        }
    }

    public int cartSize() {
        return carts != null ? carts.size() : 0;
    }

    public int getTotalQuantity() {
        if (carts == null) {
            return 0;
        }

        int total = 0;
        for (CartItem item : carts.values()) {
            total += item.getQuantity();
        }

        return total;
    }
    public double getTotalProductPrice() {
        double sum = 0;
        for (CartItem item : carts.values()) {
            sum += item.totalPriceCartItem();
        }
        return sum;
    }
    public double getTotalPriceToPay() {
        return getTotalProductPrice() - discount + fee;
    }

}
