package com.web.member.service;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.web.member.dao.jhMemberDao;
import com.web.member.dto.Member;

public class jhMemberService {
    private jhMemberDao dao = new jhMemberDao();
    
    public int mypageupdate(Member m) {
		Connection conn=getConnection();
		int result=dao.mypageupdate(conn,m);
		
		close(conn);
		return result;
	}
    public int selectMemberByNo(int userNo) {
        Connection conn = getConnection();
        int result = dao.selectMemberByNo(conn, userNo);
        
        close(conn);
        return result;
    }
    
    
}


