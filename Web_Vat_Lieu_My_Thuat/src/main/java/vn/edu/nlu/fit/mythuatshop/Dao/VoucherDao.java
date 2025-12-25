package vn.edu.nlu.fit.mythuatshop.Dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.nlu.fit.mythuatshop.Model.Voucher;

public class VoucherDao {
    private final Jdbi jdbi;

    public VoucherDao() {
        this.jdbi = JDBIConnector.getJdbi();
    }

    public Voucher findByCode(String code) {
        String sql = "SELECT ID, code, name, description, voucherCash, minOrderValue, " +
                "startDate, endDate, quantity, quantityUsed, isActive " +
                "FROM Vouchers " +
                "WHERE code = :code LIMIT 1";

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("code", code)
                        .mapToBean(Voucher.class)
                        .findOne()
                        .orElse(null)
        );
    }

    public boolean increaseUsed(int voucherId) {
        String sql = "UPDATE Vouchers " +
                "SET quantityUsed = quantityUsed + 1 " +
                "WHERE ID = :id " +
                "  AND isActive = 1 " +
                "  AND quantityUsed < quantity " +
                "  AND NOW() BETWEEN startDate AND endDate";

        int updated = jdbi.withHandle(h ->
                h.createUpdate(sql).bind("id", voucherId).execute()
        );
        return updated > 0;
    }
}


