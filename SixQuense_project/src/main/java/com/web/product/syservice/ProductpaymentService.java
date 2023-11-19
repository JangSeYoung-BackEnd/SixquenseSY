package com.web.product.syservice;

import java.sql.Connection;

import com.web.product.dto.ProductpaymentDto;
import com.web.product.sydao.ProductpaymentDao;
import static com.web.common.JDBCTemplate.*;

public class ProductpaymentService {
	private ProductpaymentDao dao = new ProductpaymentDao();

    public int insertProductPayment(ProductpaymentDto p, int orderNo) {
        Connection conn = getConnection();
        int result = dao.insertProductPayment(conn, p, orderNo);
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        close(conn);
        return result;
    }
}
