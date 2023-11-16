package com.web.product.SYservice;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.web.member.dto.Member;
import com.web.product.SYdao.BookingUserDao;

public class BookingUserService {
	private BookingUserDao dao=new BookingUserDao();

	public Member selectMemberById(String userId) {
		Connection conn=getConnection();
		Member m=dao.selectMemberById(conn,userId);
		close(conn);
		return m;
	}

}
