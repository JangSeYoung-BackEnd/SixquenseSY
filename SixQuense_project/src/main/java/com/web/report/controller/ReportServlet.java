package com.web.report.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.report.service.ReportService;

/**
 * Servlet implementation class ReportServlet
 */
@WebServlet("/report/report.do")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int accompanyNo=Integer.parseInt(request.getParameter("no"));
		int memberNo=Integer.parseInt(request.getParameter("userNo"));
		String report=request.getParameter("report");
		String reporttext=request.getParameter("reporttext");
		System.out.println(accompanyNo+""+memberNo);
		System.out.println(report+""+reporttext);
		int result = new ReportService().InterReport(report,reporttext,accompanyNo,memberNo);
		String msg, loc;
		if(result>0) {
			msg="신고가 완료되었습니다";
			loc="/accompany/accompanylist.do";
		}else {
			msg="신고가 안되었습니다";
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
