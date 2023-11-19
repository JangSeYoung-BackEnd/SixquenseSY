package com.web.product.sydao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.web.product.dto.ProductpaymentDto;

public class ProductpaymentDao {
	private Properties sql = new Properties();

    {
        String path = ProductpaymentDao.class.getResource("/sql/product/product_sql").getPath();
        try(FileReader fr = new FileReader(path)) {
            sql.load(fr);
        } catch(IOException e) {
            e.printStackTrace();
        }
    }

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
