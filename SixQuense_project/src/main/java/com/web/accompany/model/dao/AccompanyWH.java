package com.web.accompany.model.dao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Properties;

import com.web.accompany.model.dto.AccompanyAttachment;
import com.web.accompany.model.dto.AccompanyComment;
import com.web.accompany.model.dto.AccompanyDTO;
import com.web.accompany.model.dto.Continent;
import com.web.accompany.model.dto.Coordinate;



public class AccompanyWH {
	private Properties sql=new Properties();
	{
		String path=AccompanyWH.class.getResource("/sql/accompany/accompany_sql.properties").getPath();
		try(FileReader fr=new FileReader(path)) {
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
		
	public AccompanyDTO getAccompanyDTO(ResultSet rs) throws SQLException{
		return AccompanyDTO.builder()
					.accompanyNo(rs.getInt("ACCOMPANY_NO"))
					.accompanyTitle(rs.getString("ACCOMPANY_TITLE"))
					.accompanyContent(rs.getString("ACCOMPANY_CONTENT"))
					.accompanyCount(rs.getInt("ACCOMPANY_COUNT"))
					.accompanyDate(rs.getDate("ACCOMPANY_DATE"))
					.memberNo(rs.getInt("MEMBER_NO"))
					.accompanyReadCount(rs.getInt("ACCOMPANY_READCOUNT"))
					.coordinate(getCoordinate(rs))		
					.originalFilename(rs.getString("ORIGINAL_FILENAME"))
					.renameFilename(rs.getString("RENAME_FILENAME"))
					.accompanyOfferStatus(rs.getString("ACCOMPANY_OFFER_STATUS"))
					.build();
	}
	
	private List<AccompanyAttachment> getAttachment(ResultSet rs) throws SQLException {
	    return Collections.singletonList(
	        AccompanyAttachment.builder()
	            .originalFilename(rs.getString("ORIGINAL_FILENAME"))
	            .renameFilename(rs.getString("RENAME_FILENAME"))
	            .build()
	    );
	}

	
	public Coordinate getCoordinate(ResultSet rs) throws SQLException{
		return Coordinate.builder()
				.coordinateNo(rs.getInt("COORDINATE_NO"))
				.nation(rs.getString("NATION"))
				.latitude(rs.getDouble("LATITUDE"))
				.longitude(rs.getDouble("LONGITUDE"))
				.continent(getContinent(rs))
				.build();
	}
	
	private Continent getContinent(ResultSet rs) throws SQLException{
		return Continent.builder()
				.continentNo(rs.getInt("CONTINENT_NO"))
				.continentName(rs.getString("CONTINENT_NAME"))
				.build();
	}
	
	//댓글 빌더 
	private AccompanyComment getAccompanyComment(ResultSet rs) throws SQLException {
		return AccompanyComment.builder()
				.accompanyComtNo(rs.getInt("ACCOMPANY_COMMENT_NO"))
				.accompanyComtLevel(rs.getInt("ACCOMPANY_COMMENT_LEVEL"))
				.accompanyComtContent(rs.getString("ACCOMPANY_COMMENT_CONTENT"))
				.accompanyComtRef(rs.getInt("ACCOMPANY_COMMENT_REF"))
				.accompanyComtDate(rs.getDate("COMMENT_DATE"))
				.accompanyNo(rs.getInt("ACCOMPANY_NO"))
				.userId(rs.getString("USER_ID"))
				.build();

	}
	
	
	//게시물 번호를 받아서 게시물을 가져오는 메소드 
	public AccompanyDTO selectAccompanyByNo(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AccompanyDTO a=  null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectAccompanyByNo"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			
			if(rs.next()) a =getAccompanyDTO(rs);
						
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return a;
		
	}

	//댓글 가져오는 메소드 
	public List<AccompanyComment> selectAccompanyComment(Connection conn, int no) {
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		List <AccompanyComment> result= new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectAccompanyComment"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			while(rs.next())result.add(getAccompanyComment(rs));
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	

	public int insertAccompanyComment(Connection conn, AccompanyComment ac) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt= conn.prepareStatement(sql.getProperty("insertAccompanyComment"));
			pstmt.setInt(1,ac.getAccompanyComtLevel());
			pstmt.setString(2,ac.getAccompanyComtContent());
			pstmt.setString(3,ac.getAccompanyComtRef()==0?null:String.valueOf(ac.getAccompanyComtRef()));
			pstmt.setInt(4,ac.getAccompanyNo());
			pstmt.setString(5,ac.getUserId());
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}
	
	
	//조회수 카운트 메소드 
	public int updateAccompanyReadCount(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("updateAccompanyReadCount"));
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}

	public int insertAccompanyOffer(Connection conn, String user, String value, String acompanyBNo) {
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertAccompanyOffer"));
			pstmt.setString(1, value);
			pstmt.setString(2, user);
			pstmt.setString(3, acompanyBNo);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int updateAccompanyOffer(Connection conn, String user, String value) {
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateAccompanyOffer"));
			pstmt.setString(1, value);
			pstmt.setString(2, user);
			result=pstmt.executeUpdate();
			System.out.println(result +"이건 dao");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	


	
}
