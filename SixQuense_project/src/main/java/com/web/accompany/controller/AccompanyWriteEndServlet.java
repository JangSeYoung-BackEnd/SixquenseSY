package com.web.accompany.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.accompany.model.dto.AccompanyDTO;
import com.web.accompany.service.AccompanyServiceKH;

/**
 * Servlet implementation class AccompanyWriteEndServlet
 */
@WebServlet("/accompnay/accompanywriteend.do")
public class AccompanyWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccompanyWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title=request.getParameter("accompany-title");
		String openchattinglink=request.getParameter("kakao-link");
		String accompanyfile=request.getParameter("accompany-file");
		String content=request.getParameter("accompany-content");
		String nation=request.getParameter("clickedText");
		String uploadfile=request.getParameter("");
		AccompanyDTO a=AccompanyDTO.builder()
							.accompanyTitle(title)
							.accompanyContent(content)
							.openChattingLink(openchattinglink)
							.attachment(null)
							.build();
		//게시글 등록하려면, 나라명 데이터값, 사용자 아이디값 필요함. 첨부파일 1개로 갈예정.
		int result=new AccompanyServiceKH().insertAccompany(a,nation);
		
		
		request.getRequestDispatcher("/accompany/accompanylist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
