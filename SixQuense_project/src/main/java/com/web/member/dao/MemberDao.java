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

import com.web.common.JDBCTemplate;
import com.web.member.dto.Member;
public class MemberDao {

	public List<Member> selectMemberAll(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="SELECT * FROM MEMBER";
		List<Member> result=new ArrayList<>();
		try{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Member m=getMember(rs);
				result.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}return result;
	}

	public Member selectMemberByEmailAndPw(Connection conn, String useremail, String userpw) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		String sql="SELECT * FROM MEMBER WHERE USER_ID = ? AND USER_PW = ?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, useremail);
			pstmt.setString(2, userpw);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=getMember(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	private Member getMember(ResultSet rs) throws SQLException{
		return Member.builder()
				.userNo(rs.getInt("member_no"))
				.userId(rs.getString("user_id"))
				.userPw(rs.getString("user_pw"))
				.userNn(rs.getString("user_nn"))
				.userDd(rs.getDate("user_dd"))	
				.enrollData(rs.getDate("ENROLL_DATE"))
				.userIntroduce(rs.getString("user_introduce"))
				.travleType(rs.getString("travle_type"))
				.gender(rs.getString("gender"))
				.notificatIonset(rs.getString("notificationset"))
				.originalFilename(rs.getString("PROFILE_ORI_FILNAME"))
				.renameFilename(rs.getString("PROFILE_RE_FILNAME"))
				.build();
	}

	
}
