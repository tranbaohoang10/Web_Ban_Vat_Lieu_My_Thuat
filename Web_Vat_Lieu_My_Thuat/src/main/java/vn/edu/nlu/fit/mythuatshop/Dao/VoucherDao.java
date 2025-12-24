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
}


