package com.web.community.model.dao;

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

import com.web.community.model.dto.CommunityDTO;

public class CommunityDAO {
	private Properties sql=new Properties();
	{
		String path=CommunityDAO.class.getResource("/sql/community/community_sql.properties").getPath();
		try(FileReader fr=new FileReader(path)) {
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<CommunityDTO> selectCommunityAll(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CommunityDTO> result=new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty(""));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(getCommunityDTO(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	public CommunityDTO getCommunityDTO(ResultSet rs) throws SQLException {
		return CommunityDTO.builder()
					.travelReviewNo(rs.getInt("TRAVEL_REVIEW_NO"))
					.travelReviewContent(rs.getString("TRAVEL_REVIEW_CONTENT"))
					.travelReviewDate(rs.getDate("TRAVEL_REVIEW_DATE"))
					.travelReviewReadCount(rs.getInt("TRAVEL_REVIEW_READCOUNT"))
					.memberNo(rs.getInt("MEMBER_NO"))
					.build();
	}
}
