package com.web.product.syservice;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.commit;
import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.web.product.dto.ProductorderinfoDto;
import com.web.product.sydao.ProductorderinfoDao;

public class ProductorderinfoService {
	private ProductorderinfoDao dao = new ProductorderinfoDao();
	public int insertProductOrderInfo(ProductorderinfoDto p, int memberNo) {
        Connection conn = getConnection();
        int result = dao.insertProductOrderInfo(conn, p, memberNo);
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        close(conn);
        return result;
    }
}
