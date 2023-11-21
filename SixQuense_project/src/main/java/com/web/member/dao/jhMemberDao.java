package com.web.member.dao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.web.member.dto.Member;
import com.web.product.dto.ProductwishilistDto;

public class jhMemberDao {

	private Properties sql=new Properties();
	
	{
		String path=jhMemberDao.class
					.getResource("/sql/mypage/mypage_sql.properties").getPath();
		
		try(FileReader fr=new FileReader(path);) {
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public int mypageupdate(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("mypageupdate")); 
			pstmt.setString(1, m.getUserPw());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getPhone());
			pstmt.setDate(4, m.getUserDd());
			pstmt.setString(5, m.getUserIntroduce());
			pstmt.setString(6, m.getGender());
			pstmt.setString(7, m.getNotificatIonset());	
			pstmt.setInt(8, m.getUserNo());			

			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int selectMemberByNo(Connection conn, int userNo) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int result = 0;
	    try {
	        pstmt = conn.prepareStatement(sql.getProperty("selectMemberByNo"));
	        pstmt.setInt(1, userNo);
	        rs = pstmt.executeQuery();

	        // ResultSet에서 결과가 있는지 확인
	        if (rs.next()) {
	            result = 1; // 결과가 있다면 1로 설정
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    return result;
	}
	public int selectWishListByNo(Connection conn, ProductwishilistDto wish) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int result = 0;

	    try {
	        // "wish" 객체가 null인지 확인
	        if (wish != null) {
	            Integer productWishlistNo = wish.getProductWishlistNo();
	            
	            // "productWishlistNo"가 null이 아닌지 확인
	            if (productWishlistNo != null) {
	                pstmt = conn.prepareStatement(sql.getProperty("selectWishListByNo"));
	                pstmt.setInt(1, productWishlistNo);
	                pstmt.setInt(2, wish.getMemberNo());
	                pstmt.setInt(3, wish.getProductNo());

	                rs = pstmt.executeQuery();

	                // 나머지 코드 작성...
	                // ...

	            } else {
	                // "productWishlistNo"가 null일 때 처리
	                System.out.println("productWishlistNo가 null입니다.");
	            }
	        } else {
	            // "wish" 객체가 null일 때 처리
	            System.out.println("Wish 객체가 null입니다.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }

	    return result;
	}
}