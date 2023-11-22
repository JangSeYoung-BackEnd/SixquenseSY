package com.web.product.sydao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.web.common.JDBCTemplate.close;
import com.web.product.dto.ProductpaymentDto;

public class ProductPackageRefundDao {
	private Properties sql = new Properties();

    {
        String path = ProductPackageOrderEndDao.class.getResource("/sql/product/product_sql.properties").getPath();
        try (FileReader fr = new FileReader(path)) {
            sql.load(fr);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public int updatePaymentStatus(Connection conn, String paymentId, String status) {
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            pstmt = conn.prepareStatement(sql.getProperty("updatePaymentStatus"));
            pstmt.setString(1, status);
            pstmt.setString(2, paymentId);
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

