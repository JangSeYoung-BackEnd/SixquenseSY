package com.web.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.member.dto.Member;
import com.web.member.service.MemberService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 클라이언트가 보낸 아이디와 패스워드를 받아온다
		String useremail=request.getParameter("useremail");
		String userpw=request.getParameter("userpw");
		
		//2. DB의 member테이블에 보낸 이메일와 패스워드 가 일치하는 회원을 가져온다. 
		Member m=new MemberService().selectMemberByEmailAndPw(useremail,userpw);
		if(m!=null) {
			HttpSession session=request.getSession();
			session.setAttribute("loginMember",m);
		}else {
			
		}
		
		//3. 결과를 출력(응답페이지 선택하면 됩니다.)
		
		response.sendRedirect(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
