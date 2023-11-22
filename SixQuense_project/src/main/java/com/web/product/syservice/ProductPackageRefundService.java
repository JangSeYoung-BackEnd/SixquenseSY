package com.web.product.syservice;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.commit;
import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.web.product.sydao.ProductPackageRefundDao;

public class ProductPackageRefundService {
    private ProductPackageRefundDao refundDao = new ProductPackageRefundDao();

    public boolean updatePaymentStatus(String paymentId, String status) {
        boolean result = false;
        Connection conn = getConnection();

        int updateResult = refundDao.updatePaymentStatus(conn, paymentId, status);

        if(updateResult>0){
            commit(conn);
            result = true; 
        } else {
            rollback(conn);
        }

        close(conn);
        return result;
    }
}
