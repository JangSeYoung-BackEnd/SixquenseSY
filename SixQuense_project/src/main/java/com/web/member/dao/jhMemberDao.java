package com.web.member.dao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.web.member.dto.Member;

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
	public int updateMember(Connection conn, Member m) {
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
			pstmt.setString(8, m.getOriginalFilename());
			pstmt.setString(9, m.getRenameFilename());
			
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	public int selectMemberUpdate(Connection conn, int userId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectmember")); 
			pstmt.setInt(1, userId);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	}