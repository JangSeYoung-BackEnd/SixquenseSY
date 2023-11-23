package com.web.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.member.password.PasswordEncoder;
import com.web.member.service.MemberService;

/**
 * Servlet implementation class RandomUpdatePasswordServlet
 */
@WebServlet("/member/randomupdatepassword.do")
public class RandomUpdatePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RandomUpdatePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("email");
		//패스워드 랜덤으로 만들기
		StringBuffer sb=new StringBuffer();
		for(int i=0;i<8;i++) {
			sb.append((int)(Math.random()*10));
		}
		String encStr=PasswordEncoder.getSHA512(new String(sb));
		int result=new MemberService().updatePassword(userId, encStr);
		
		request.setAttribute("oriPw", new String(sb));
		
		request.getRequestDispatcher("/email/sendemail.do").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
