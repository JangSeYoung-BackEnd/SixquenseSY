package com.web.accompany.model.dao;

import static com.web.common.JDBCTemplate.*;

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
import com.web.accompany.model.dto.Continent;
import com.web.accompany.model.dto.Coordinate;

import oracle.jdbc.proxy.annotation.Pre;



public class AccompanyDAOKH {
	private Properties sql=new Properties();
	{
		String path=AccompanyDAOKH.class.getResource("/sql/accompany/accompany_sql.properties").getPath();
		try(FileReader fr=new FileReader(path)) {
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<AccompanyDTO> selectBoardAll(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
//		String sqlTemp="WHERE CONTINENT_NAME LIKE '%"+coordinate+"%' \\";
		List<AccompanyDTO> result=new ArrayList<>();
		try {
			pstmt=conn.prepareCall(sql.getProperty("selectAll"));
//			pstmt.setString(1, coordinate!=null||coordinate.equals("전체보기")?"":sqlTemp);
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
	
	public List<AccompanyDTO> selectAccompanyByPopularity(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<AccompanyDTO> result=new ArrayList<>();
		try {
			pstmt=conn.prepareCall(sql.getProperty("selectAccompanyByPopularity"));
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
	
	public List<AccompanyDTO> selectAccompanyByCoordinate(Connection conn, String coordinate){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<AccompanyDTO> result=new ArrayList<>();
		try {
			pstmt=conn.prepareCall(sql.getProperty("selectAccompanyByCoordinate"));
			pstmt.setString(1, coordinate);
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
	
	public List<AccompanyDTO> selectAccompanyByCoordinatePopularity(Connection conn, String coordinate){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<AccompanyDTO> result=new ArrayList<>();
		try {
			pstmt=conn.prepareCall(sql.getProperty("selectAccompanyByCoordinatePopularity"));
			pstmt.setString(1, coordinate);
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
	
	public int insertAccompany(Connection conn, AccompanyDTO a, String nation, String userId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertAccompany"));
			pstmt.setString(1, a.getAccompanyContent());
			pstmt.setString(2, userId);
			pstmt.setString(3, a.getOpenChattingLink());
			pstmt.setString(4, a.getAccompanyTitle());
			pstmt.setString(5, nation);
			pstmt.setString(6, a.getOriginalFilename());
			pstmt.setString(7, a.getRenameFilename());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			
		}return result;
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
					.coordinate(getCoodinate(rs))
					.originalFilename(rs.getString("ORIGINAL_FILENAME"))
					.renameFilename(rs.getString("RENAME_FILENAME"))
					.accompanyStatus(rs.getString("ACCOMPANY_STATUS"))
					.build();
	}
	public Coordinate getCoodinate(ResultSet rs) throws SQLException{
		return Coordinate.builder()
				.coordinateNo(rs.getInt("COORDINATE_NO"))
				.nation(rs.getString("NATION"))
				.latitude(rs.getInt("LATITUDE"))
				.longitude(rs.getInt("LONGITUDE"))
				.continent(getContinent(rs))
				.build();
	}
	
	private Continent getContinent(ResultSet rs) throws SQLException{
		return Continent.builder()
				.continentNo(rs.getInt("CONTINENT_NO"))
				.continentName(rs.getString("CONTINENT_NAME"))
				.build();
	}
}
