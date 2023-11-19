package com.web.product.sydao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.web.product.dto.ProductorderinfoDto;

public class ProductorderinfoDao {
	private Properties sql = new Properties();

    {
        String path = ProductorderinfoDao.class.getResource("/sql/product/product_sql").getPath();
        try(FileReader fr = new FileReader(path)) {
            sql.load(fr);
        } catch(IOException e) {
            e.printStackTrace();
        }
    }

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
    public static ProductorderinfoDto getProductOrderInfo(ResultSet rs) throws SQLException {
    	return ProductorderinfoDto.builder()
    			.OrderNo(rs.getInt("ORDER_NO"))
    			.OrderCount(rs.getInt("ORDER_COUNT"))
    			.OrderDate(rs.getDate("ORDER_DATE"))
    			.MemberNO(rs.getInt("MEMBER_NO"))
                .ProductNo(rs.getInt("PRODUCT_NO"))
                .build();
    }
}
