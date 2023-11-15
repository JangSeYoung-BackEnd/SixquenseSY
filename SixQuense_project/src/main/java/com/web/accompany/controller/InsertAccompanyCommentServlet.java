package com.web.accompany.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.accompany.model.dto.AccompanyComment;
import com.web.accompany.service.AccompanyServiceWH;

/**
 * Servlet implementation class InsertAccompanyComment
 */
@WebServlet("/accompany/insertaccompanycomment.do")
public class InsertAccompanyCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAccompanyCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	int boardNo=Integer.parseInt(request.getParameter("accompanyNo"));
	int level = Integer.parseInt(request.getParameter("level"));
	String writer= request.getParameter("writer");
	String content =request.getParameter("content");
	int accompanyCommentRef = Integer.parseInt(request.getParameter("accompanyCommentRef"));
	System.out.println(boardNo+level+writer+content+accompanyCommentRef);
	
	AccompanyComment ac= AccompanyComment.builder()
			.accompanyComtLevel(level)
			.accompanyComtContent(content)
			.accompanyComtRef(accompanyCommentRef)
			.accompanyNo(boardNo)
			.userId(writer)
			.build();
		System.out.println(ac);
		int result = new AccompanyServiceWH().insertAccompanyComment(ac);
		System.out.println(result);
		//절대경로로 작성 + 댓글 작성시 게시물 번호를 넘겨주면서 그글에 계속 남아있도록 한다. 
		response.sendRedirect(request.getContextPath()+"/accompany/accompanyview.do?no="+boardNo);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
