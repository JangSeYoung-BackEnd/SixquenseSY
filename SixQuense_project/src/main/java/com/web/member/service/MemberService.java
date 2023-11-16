package com.web.member.service;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.commit;
import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.web.member.dao.MemberDao;
import com.web.member.dto.Member;

public class MemberService {
	
	private MemberDao dao=new MemberDao();
	
//	public List<Member> selectMemberAll(){
//		Connection conn=JDBCTemplate.getConnection();
//		List<Member> result=dao.selectMemberAll(conn);
//		JDBCTemplate.close(conn);
//		return result;
//				
//	}

	public Member selectMemberByEmailAndPw(String userId, String userpw) {
		Connection conn=getConnection();
		Member m=dao.selectMemberByEmailAndPw(conn,userId,userpw);

		
		if(m!=null) commit(conn);
		else rollback(conn);

		close(conn);
		return m;
	}
	
	public int insertMember(Member m) {
		Connection conn=getConnection();
		int result=dao.insertMember(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
	
	
	
}
