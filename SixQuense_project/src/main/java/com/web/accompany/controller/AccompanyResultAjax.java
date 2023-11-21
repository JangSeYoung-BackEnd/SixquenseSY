package com.web.accompany.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.accompany.service.AccompanyServiceWH;

/**
 * Servlet implementation class AccompanyResultAjax
 */
@WebServlet("/accompany/AccompanyResultAjax.do")
public class AccompanyResultAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccompanyResultAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String value = request.getParameter("value");
//		String user =request.getParameter("acUser");
		int acompanyBNo =Integer.parseInt(request.getParameter("boardNo"));
//		PrintWriter out=response.getWriter();
//		out.print(value);
//		out.print(user);
//		System.out.println(value+"servlet");
//		System.out.println(user+"servlet");
//		System.out.println(acompanyBNo+"servlet");
		int result = new AccompanyServiceWH().updateAccompanyOffer(acompanyBNo,value);
//		System.out.println(result);
		//request.setAttribute("result", result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
