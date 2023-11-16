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

public class BookinginfoDao {
	
	
	private Properties sql = new Properties();

    {
        String path = BookinginfoDao.class.getResource("/sql/product/product_sql").getPath();
        try(FileReader fr = new FileReader(path)) {
            sql.load(fr);
        } catch(IOException e) {
            e.printStackTrace();
        }
    }

    public int insertBookingInfo(Connection conn, BookinginfoDto b, int memberNo, int orderNo) {
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            pstmt = conn.prepareStatement(sql.getProperty("insertBookingUser"));
            pstmt.setString(1, b.getBookingName());
            pstmt.setDate(2, new java.sql.Date(b.getBookingBrith().getTime()));
            pstmt.setString(3, b.getBookingGender());
            pstmt.setString(4, b.getBookingPhone());
            pstmt.setInt(5, memberNo); // 외래키
            pstmt.setInt(6, orderNo); // 외래키
            result = pstmt.executeUpdate();
        } catch(SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
    
    public static BookinginfoDto getBookingInfo(ResultSet rs) throws SQLException {
        return BookinginfoDto.builder()
                .BookingName(rs.getString("BOOKING_NAME"))
                .BookingBrith(rs.getDate("BOOKING_BIRTH"))
                .BookingGender(rs.getString("BOOKING_GENDER"))
                .BookingPhone(rs.getString("BOOKING_PHONE"))
                .build();
    }
}