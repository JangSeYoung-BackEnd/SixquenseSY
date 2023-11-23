package com.web.accompany.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.accompany.service.AccompanyServiceWH;
import com.web.member.dto.MemberToAcompanyWH;

/**
 * Servlet implementation class DeleteAccompanyAjax
 */
@WebServlet("/accompay/deleteAccompany.do")
public class DeleteAccompanyAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAccompanyAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int userNo =Integer.parseInt(request.getParameter("userNo"));
		int acompanyBNo =Integer.parseInt(request.getParameter("boardNo"));
		System.out.println(userNo+"유저번호"+acompanyBNo+"게시글 번호");
		new AccompanyServiceWH().deleteAccompanyOffer(userNo,acompanyBNo);
		
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
