package com.web.accompany.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.accompany.service.AccompanyServiceWH;

/**
 * Servlet implementation class DeletecommentAjax
 */
@WebServlet("/accompany/deletecomment.do")
public class DeletecommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletecommentServlet() {
    	
    	
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));	
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));	
		int commentNo=Integer.parseInt(request.getParameter("commentNo"));
		System.out.println(userNo+"유저번호"+boardNo+"게시글번호"+commentNo+"댓글번호");
		int result = new AccompanyServiceWH().deletecomment(commentNo);
		System.out.println(result + "dao 결과 ");
		
		response.sendRedirect(request.getContextPath()+"/accompany/accompanyview.do?no="+boardNo+"&userNo="+userNo) ;

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
