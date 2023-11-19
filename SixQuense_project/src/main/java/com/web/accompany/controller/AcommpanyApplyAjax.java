package com.web.accompany.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.accompany.service.AccompanyServiceWH;

/**
 * Servlet implementation class AcommpanyApply
 */
@WebServlet("/accompay/AcommpanyApply.do")
public class AcommpanyApplyAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AcommpanyApplyAjax() {
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
//		System.out.println(userNo +"회원 번호 값이 잘 들어왓는지 서블렛에서 확인 ");
//		System.out.println(acompanyBNo +"값이 잘 들어왓는지 서블렛에서 확인 ");
		int result = new AccompanyServiceWH().insertAccompanyOffer(userNo,acompanyBNo);
//		System.out.println(result +"서블렛에서 확인 ");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
