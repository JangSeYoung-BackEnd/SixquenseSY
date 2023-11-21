package com.web.member.dao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.web.member.dto.Member;
import com.web.product.dto.ProductorderinfoDto;
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
	public List<ProductwishilistDto> selectWishListByNo(Connection conn, int memberNo ) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		List<ProductwishilistDto> wish = new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectWishListByNo")); 
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				wish.add(getProductwishilistDto(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return wish;
	}
	public List<ProductorderinfoDto> selectProductByNo(Connection conn, int memberNo){
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		List<ProductorderinfoDto> info= new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectProductByNo"));
			pstmt.setInt(1, 0);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return info;
		
	}
	
	private ProductwishilistDto getProductwishilistDto(ResultSet rs) throws SQLException{
		return ProductwishilistDto.builder()
				.ProductNo(rs.getInt("PRODUCT_WISHLIST_NO"))
				.MemberNo(rs.getInt("MEMBER_NO"))
				.ProductNo(rs.getInt("PRODUCT_NO"))
				.build();				
	}
	private ProductorderinfoDto getProductorderinfoDto(ResultSet rs) throws SQLException{
		return ProductorderinfoDto.builder()
				.OrderNo(rs.getInt("ORDER_NO"))
				.OrderCount(rs.getInt("ORDER_COUNT"))
				.OrderDate(rs.getDate("ORDER_DATE"))
				.MemberNO(rs.getInt("MEMBER_NO"))
				.ProductNo(rs.getInt("PROUCT_NO"))
				.build();
	}
}
