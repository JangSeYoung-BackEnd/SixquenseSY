package com.web.member.service;

import java.sql.Connection;
import java.util.List;
import static com.web.common.JDBCTemplate.*;
import com.web.common.JDBCTemplate;
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

	public Member selectMemberByEmailAndPw(String useremail, String userpw) {
		Connection conn=getConnection();
		Member m=dao.selectMemberByEmailAndPw(conn,useremail,userpw);
		close(conn);
		return m;
	}
	

	
	
	
	
	
}
