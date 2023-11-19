package com.web.product.sydao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.web.product.dto.BookinginfoDto;
import com.web.product.dto.ProductorderinfoDto;
import com.web.product.dto.ProductpaymentDto;

public class ProductPackageOrderEndDao {
	private Properties sql = new Properties();

    {
        String path = ProductPackageOrderEndDao.class.getResource("/sql/SYproduct/product_sql.properties").getPath();
        try (FileReader fr = new FileReader(path)) {
            sql.load(fr);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    //상품(패키지 주문정보)
    public int insertProductOrderInfo(Connection conn, ProductorderinfoDto p, int memberNo) {
    	PreparedStatement pstmt = null;
    	int result = 0;
    	try {
    		pstmt = conn.prepareStatement(sql.getProperty("insertProductOrderInfo"));
    		pstmt.setInt(1, p.getOrderNo());
    		pstmt.setInt(2, p.getOrderCount());
    		pstmt.setDate(3, new java.sql.Date(p.getOrderDate().getTime()));
    		pstmt.setInt(4, memberNo); // 외래키
    		pstmt.setInt(5, p.getProductNo());
    		result = pstmt.executeUpdate();
    	} catch(SQLException e) {
    		e.printStackTrace();
    	} finally {
    		close(pstmt);
    	}
    	return result;
    }
    //여행자 정보
    public int insertBookingInfo(Connection conn, BookinginfoDto b, int orderNo) {
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            pstmt = conn.prepareStatement(sql.getProperty("insertBookingUser"));
            pstmt.setString(1, b.getBookingName());
            pstmt.setDate(2, new java.sql.Date(b.getBookingBrith().getTime()));
            pstmt.setString(3, b.getBookingGender());
            pstmt.setString(4, b.getBookingPhone());
            pstmt.setInt(5, orderNo); // 외래키
            result = pstmt.executeUpdate();
        } catch(SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
    //결제정보
    public int insertProductPayment(Connection conn, ProductpaymentDto p, int orderNo) {
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            pstmt = conn.prepareStatement(sql.getProperty("insertProductPayment"));
            pstmt.setString(1, p.getPaymentId());
            pstmt.setDate(2, new java.sql.Date(p.getPaymentDate().getTime()));
            pstmt.setInt(3, p.getTotalAmount());
            pstmt.setString(4, p.getPaymentStatus());
            pstmt.setInt(5, orderNo); // 외래키
            result = pstmt.executeUpdate();
        } catch(SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
    //상품(패키지 주문정보)
    public static ProductorderinfoDto getProductOrderInfo(ResultSet rs) throws SQLException {
    	return ProductorderinfoDto.builder()
    			.OrderNo(rs.getInt("ORDER_NO"))
    			.OrderCount(rs.getInt("ORDER_COUNT"))
    			.OrderDate(rs.getDate("ORDER_DATE"))
    			.MemberNO(rs.getInt("MEMBER_NO"))
    			.ProductNo(rs.getInt("PRODUCT_NO"))
    			.build();
    }
    //여행자 정보
    public static BookinginfoDto getBookingInfo(ResultSet rs) throws SQLException {
        return BookinginfoDto.builder()
                .BookingName(rs.getString("BOOKING_NAME"))
                .BookingBrith(rs.getDate("BOOKING_BIRTH"))
                .BookingGender(rs.getString("BOOKING_GENDER"))
                .BookingPhone(rs.getString("BOOKING_PHONE"))
                .OrderNo(rs.getInt("ORDER_NO")) //주문번호
                .build();
    }
    //결제정보
    public static ProductpaymentDto getProductpaymentDto(ResultSet rs)throws SQLException {
    	return ProductpaymentDto.builder()
    			.paymentId(rs.getString("PAYMENT_ID"))
                .paymentDate(rs.getDate("PAYMENT_DATE"))
                .totalAmount(rs.getInt("TOTAL_AMOUNT"))
                .paymentStatus(rs.getString("PAYMENT_STATUS"))
                .OrderNo(rs.getInt("ORDER_NO"))
                .build();
    			
    }
}
