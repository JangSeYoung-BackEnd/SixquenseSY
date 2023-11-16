package com.web.member.service;

import com.web.member.dao.jhMemberDao;
import java.sql.Connection;
import java.util.List;
import static com.web.common.JDBCTemplate.*;
import com.web.common.JDBCTemplate;
import com.web.member.dto.Member;

public class jhMemberService {
	private jhMemberDao dao=new jhMemberDao();
	
	public int selectMemberUpdate(Member m) {
		Connection conn = getConnection();
		int result = dao.selectMemberUpdate(conn, m);
		close(conn);
		return result;
	}
}
