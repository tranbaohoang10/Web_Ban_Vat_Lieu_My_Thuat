package vn.edu.nlu.fit.mythuatshop.Service;

public class VoucherApplyResult {
    private boolean success;
    private String message;
    private double discount;

    public static VoucherApplyResult ok(double discount) {
        VoucherApplyResult r = new VoucherApplyResult();
        r.success = true;
        r.discount = discount;
        r.message = "Áp dụng voucher thành công";
        return r;
    }

    public static VoucherApplyResult fail(String msg) {
        VoucherApplyResult r = new VoucherApplyResult();
        r.success = false;
        r.message = msg;
        r.discount = 0;
        return r;
    }

    public boolean isSuccess() {
        return success;
    }

    public String getMessage() {
        return message;
    }

    public double getDiscount() {
        return discount;
    }
}
