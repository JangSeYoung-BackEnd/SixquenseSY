package com.web.community.model.dao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Member;
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
				result.add(getCommunityDTO());
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	public List<CommunityDTO> getCommunityDTO(ResultSet rs) throws SQLException {
		return CommunityDTO.builder()
					.travelReviewNo(rs.getInt(""))
					.travelReviewContent(rs.getString(""))
					.travelReviewDate(rs.getDate(""))
					.travelReviewReadCount(rs.getInt(""))
					.member(new Member())
					.build();
	}
}
