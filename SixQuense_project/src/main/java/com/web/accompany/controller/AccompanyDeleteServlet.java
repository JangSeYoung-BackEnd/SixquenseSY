package com.web.accompany.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.accompany.service.AccompanyServiceKH;

/**
 * Servlet implementation class AccompanyDeleteServlet
 */
@WebServlet("/accompany/accompanydelete.do")
public class AccompanyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccompanyDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int accompanyNo=Integer.parseInt(request.getParameter("accompanyNo"));
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		int result=new AccompanyServiceKH().DeleteAccompany(accompanyNo,memberNo);
		String msg, loc;
		if(result>0) {
			msg="삭제 완료되었습니다!";
			loc="/accompany/accompanylist.do";
		}else {
			msg="삭제 실패하였습니다!";
			loc="/accompany/accompanylist.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
