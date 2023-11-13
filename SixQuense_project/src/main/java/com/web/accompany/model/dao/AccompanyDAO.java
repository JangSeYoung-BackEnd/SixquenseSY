package com.web.accompany.model.dao;

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

import com.web.accompany.model.dto.AccompanyComment;
import com.web.accompany.model.dto.AccompanyDTO;



public class AccompanyDAO {
	private Properties sql=new Properties();
	{
		String path=AccompanyDAO.class.getResource("/sql/accompany_sql.properties").getPath();
		try(FileReader fr=new FileReader(path)) {
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<AccompanyDTO> selectBoardAll(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<AccompanyDTO> result=new ArrayList<>();
		try {
			pstmt=conn.prepareCall(sql.getProperty("selectAccompanyAll"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(getAccompanyDTO(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public AccompanyDTO getAccompanyDTO(ResultSet rs) throws SQLException{
		return AccompanyDTO.builder()
					.accompanyNo(rs.getInt("ACCOMPANY_NO"))
					.accompanyTitle(rs.getString("ACCOMPANY_CONTENT"))
					.accompanyContent(rs.getString("accompanyContent"))
					.accompanyCount(rs.getInt("accompanyCount"))
					.accompanyDate(rs.getDate("accompanyDate"))
					.memberNo(rs.getInt("memberNo"))
					.accompanyReadCount(rs.getInt("accompanyReadCount"))
					.coordnateNo(rs.getInt("coordnateNo"))
					.openChattingLink(rs.getString("openChattingLink"))
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
	
	//댓글 빌더 
	private AccompanyComment getAccompanyComment(ResultSet rs) throws SQLException {
		return AccompanyComment.builder()
				.accompanyComtNo(rs.getInt("ACCOMPANY_COMMENT_NO"))
				.accompanyComtLevel(rs.getInt("ACCOMPANY_COMMENT_LEVEL"))
				.accompanyComtContent(rs.getString("ACCOMPANY_COMMENT_CONTENT"))
				.accompanyComtRef(rs.getInt("ACCOMPANY_COMMENT_REF"))
				.accompanyComtDate(rs.getDate("COMMENT_DATE"))
				.accompanyNo(rs.getInt("ACCOMPANY_NO"))
				.MemberNo(rs.getInt("MEMBER_NO"))
				.build();

	}
	
	
	//조회수 카운트 메소드 
	public int updateAccompanyReadCount(Connection conn, int no) {
		// TODO Auto-generated method stub
		return 0;
	}
}
