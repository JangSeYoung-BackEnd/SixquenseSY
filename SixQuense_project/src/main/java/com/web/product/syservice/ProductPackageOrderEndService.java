package com.web.product.syservice;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.commit;
import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.web.product.dto.BookinginfoDto;
import com.web.product.dto.ProductorderinfoDto;
import com.web.product.dto.ProductpaymentDto;
import com.web.product.sydao.ProductPackageOrderEndDao;

public class ProductPackageOrderEndService {
	private ProductPackageOrderEndDao dao = new ProductPackageOrderEndDao();

    public boolean insertOrder(BookinginfoDto b, ProductorderinfoDto p, ProductpaymentDto paymentDto, int memberNo, int orderNo) {
        boolean result = false;
        Connection conn = getConnection();
        	int orderinfoResult = dao.insertProductOrderInfo(conn, p, memberNo); //상품(패키지 주문정보)
            int bookingResult = dao.insertBookingInfo(conn, b, orderNo); //여행자 정보
            int paymentResult = dao.insertProductPayment(conn, paymentDto, orderNo); //결제정보

            if (orderinfoResult>0 && bookingResult>0 && paymentResult>0){
                commit(conn);
                result = true; 
            } else {
                rollback(conn);
            }
            close(conn);
            return result;
        }
    }
