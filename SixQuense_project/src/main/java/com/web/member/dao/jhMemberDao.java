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
public class jhMemberDao {
    private Properties sql=new Properties();
    {
        String path=jhMemberDao.class
                .getResource("/sql/mypage/mypage_sql.properties").getPath();
        try(FileReader fr=new FileReader(path)) {
            sql.load(fr);
        }catch(IOException e) {
            e.printStackTrace();
        }
    }
	

	public int selectMemberUpdate(Connection conn,Member m) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt=null;
		int result=0;
		//SET USER_PW = '?', USER_NN = '?', PHONE = '?', USER_DD = '?', USER_INTRODUCE = '?',\
		//GENDER = '?', NOTIFICATIONSET = '?', PROFILE_ORI_FILNAME = '?',PROFILE_RE_FILNAME = '?'
		//WHERE MEMBER_NO = '?'
		try {
			pstmt=conn.prepareStatement(sql.getProperty("mypageupdate")); 
			pstmt.setString(1, m.getUserPw());
			pstmt.setString(2, m.getUserNn());
			pstmt.setString(3, m.getPhone());
			pstmt.setDate(4, m.getUserDd());
			pstmt.setString(5, m.getUserIntroduce());
			pstmt.setString(6, m.getGender());
			pstmt.setString(7, m.getNotificatIonset());
			pstmt.setString(8, m.getOriginalFilename());
			pstmt.setString(9, m.getRenameFilename());
			pstmt.setInt(10, m.getUserNo());
			result=pstmt.executeUpdate();			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
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
