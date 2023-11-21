package com.web.member.service;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.commit;
import static com.web.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.web.member.dao.jhMemberDao;
import com.web.member.dto.Member;

public class JhMemberService {
    private jhMemberDao dao = new jhMemberDao();
    
    public int selectMemberUpdate(int userId) {
        Connection conn = getConnection();
        int result = dao.selectMemberUpdate(conn, userId);
        if (result > 0) commit(conn);
        close(conn);
        return result;
    }
    
}


