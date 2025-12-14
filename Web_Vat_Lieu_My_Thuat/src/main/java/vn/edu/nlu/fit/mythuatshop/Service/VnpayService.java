package vn.edu.nlu.fit.mythuatshop.Service;

import jakarta.servlet.http.HttpServletRequest;
import vn.edu.nlu.fit.mythuatshop.Model.Order;
import vn.edu.nlu.fit.mythuatshop.Util.ConfigVNPay;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
import java.util.*;

public class VnpayService {
    public String buildPaymentUrl(HttpServletRequest req, Order order) {

        long amountVnd = BigDecimal.valueOf(order.getTotalPrice())
                .setScale(0, RoundingMode.HALF_UP)
                .longValue();
        long vnpAmount = amountVnd * 100;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", "2.1.0");
        vnp_Params.put("vnp_Command", "pay");
        vnp_Params.put("vnp_TmnCode", ConfigVNPay.vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(vnpAmount));
        vnp_Params.put("vnp_CurrCode", "VND");

        // Dùng orderId để về return xử lý
        vnp_Params.put("vnp_TxnRef", String.valueOf(order.getId()));

        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang DH" + order.getId());
        vnp_Params.put("vnp_OrderType", "other");

        vnp_Params.put("vnp_Locale", "vn");
        vnp_Params.put("vnp_ReturnUrl", ConfigVNPay.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", ConfigVNPay.getIpAddress(req));
        vnp_Params.put("vnp_CreateDate", nowyyyyMMddHHmmss());

        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MINUTE, 15);
        vnp_Params.put("vnp_ExpireDate", new SimpleDateFormat("yyyyMMddHHmmss").format(cal.getTime()));

        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);

        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();

        for (int i = 0; i < fieldNames.size(); i++) {
            String fieldName = fieldNames.get(i);
            String fieldValue = vnp_Params.get(fieldName);
            if (fieldValue == null || fieldValue.isEmpty()) continue;

            String encodedFieldName = java.net.URLEncoder.encode(fieldName, java.nio.charset.StandardCharsets.UTF_8);
            String encodedFieldValue = java.net.URLEncoder.encode(fieldValue, java.nio.charset.StandardCharsets.UTF_8);

            hashData.append(fieldName).append("=").append(encodedFieldValue);
            query.append(encodedFieldName).append("=").append(encodedFieldValue);

            if (i < fieldNames.size() - 1) {
                hashData.append("&");
                query.append("&");
            }
        }
        String secureHash = ConfigVNPay.hmacSHA512(ConfigVNPay.secretKey, hashData.toString());
        return ConfigVNPay.vnp_PayUrl + "?" + query + "&vnp_SecureHash=" + secureHash;
    }


    public boolean verifyReturn(HttpServletRequest req) {
        String vnp_SecureHash = req.getParameter("vnp_SecureHash");
        if (vnp_SecureHash == null || vnp_SecureHash.isEmpty()) return false;

        Map<String, String> fields = new HashMap<>();
        Enumeration<String> params = req.getParameterNames();

        while (params.hasMoreElements()) {
            String name = params.nextElement();
            if (name.startsWith("vnp_")) {
                if ("vnp_SecureHash".equals(name) || "vnp_SecureHashType".equals(name)) continue;
                String value = req.getParameter(name);
                if (value != null && !value.isEmpty()) fields.put(name, value);
            }
        }

        String signValue = ConfigVNPay.hashAllFields(fields);
        return signValue != null && signValue.equalsIgnoreCase(vnp_SecureHash);
    }

    private String nowyyyyMMddHHmmss() {
        return new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
    }
}
