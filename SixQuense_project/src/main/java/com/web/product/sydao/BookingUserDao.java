package com.web.product.sydao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.web.member.dto.Member;



public class BookingUserDao {
	private Properties sql=new Properties();
	{
		String path=BookingUserDao.class
					.getResource("/sql/SYproduct/product_sql.properties").getPath();
		
		try(FileReader fr=new FileReader(path);) {
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public Member selectMemberById(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member b=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectMemberById"));
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) b=getMember(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return b;
	}
	private Member getMember(ResultSet rs) throws SQLException{
		return Member.builder()
				.userNo(rs.getInt("member_no"))
				.userId(rs.getString("user_id"))
				.userName(rs.getString("kr_user_name"))
				.userDd(rs.getDate("user_dd"))	
				.gender(rs.getString("gender"))
				.build();
	}
}
