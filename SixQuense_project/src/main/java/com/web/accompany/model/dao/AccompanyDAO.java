package com.web.accompany.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.web.accompany.model.dto.AccompanyDTO;
import static com.web.common.JDBCTemplate.*;

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
}
