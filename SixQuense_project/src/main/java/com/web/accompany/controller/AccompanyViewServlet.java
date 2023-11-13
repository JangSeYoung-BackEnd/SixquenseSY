package com.web.accompany.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.accompany.model.dto.AccompanyDTO;
import com.web.accompany.service.AccompanyService;

/**
 * Servlet implementation class AccompanyViewServlet
 */
@WebServlet("/AccompanyView.do")
public class AccompanyViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccompanyViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//글번호를 받아서 조회하도록 한다. 
		int no = Integer.parseInt(request.getParameter("no"));
		
		//조회수 부분 
		Cookie[] cookies = request.getCookies();
		String readAccompany="";
		boolean readResult = false; //읽지 않았다.
		for(Cookie c : cookies) {
			String name = c.getName();
			if(name.equals("readBoard")) {
				readAccompany = c.getValue();
				if(readAccompany.contains("|"+no+"|")) {
					//contain인 애를 찾았다 -> 그전에 읽어었다.
					readResult= true;
				}
				break; //true로 빠지고 반복문 종료
			}
		}
		
		if(!readResult) {
			//안읽었다면 ~ 번호 다시 저장 
			Cookie c = new Cookie("readBoard", readAccompany+"|"+no+"|");
			c.setMaxAge(60*60*24);
			response.addCookie(c);
		}
		
		AccompanyDTO a = new AccompanyService().selectBoardByNo(no,readResult);
		//이 글번호에 대한 댓글들을 List에 저장함.
//		List<AccompanyComment> comments= new AccompanyService().selectBoardComment(no);
//		request.setAttribute("comments", comments);
		request.setAttribute("board", a);
		request.getRequestDispatcher("/views/accompany/accompanyview.jsp").forward(request, response);
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
