package com.web.product.SYservice;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.commit;
import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.web.product.SYdao.BookinginfoDao;
import com.web.product.dto.BookinginfoDto;

public class BookingService {
	private BookinginfoDao dao = new BookinginfoDao();

    public int insertBookingInfo(BookinginfoDto b, int memberNo, int orderNo) {
        Connection conn = getConnection();
        int result = dao.insertBookingInfo(conn, b, memberNo, orderNo);
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        close(conn);
        return result;
	}
}
