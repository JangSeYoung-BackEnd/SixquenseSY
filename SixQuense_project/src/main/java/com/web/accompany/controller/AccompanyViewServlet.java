package com.web.accompany.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.accompany.model.dto.AccompanyComment;
import com.web.accompany.model.dto.AccompanyDTO;
import com.web.accompany.service.AccompanyServiceWH;

/**
 * Servlet implementation class AccompanyViewServlet
 */
@WebServlet("/accompany/accompanyview.do")
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
		
		//쿠키를 확인해서 전에 해당하는 게시물을 읽었는지 안읽었는지 확인을 위해 쿠키값을 가져온다. 
		Cookie[] cookies= request.getCookies();
		String readBoard="";
		boolean readResult = false; //-> 읽지 않았다.
		for (Cookie c: cookies) {
			String name= c.getName();
			if(name.equals("readBoard")) {
				readBoard=c.getValue();
				if(readBoard.contains("|"+no+"|")) {
					//-> contains(no) 이렇게 적혀있으면 구분할 수 없음 . 그래서 앞 뒤에 문자를 지칭해줌 
					readResult=true; //-> 읽었다 !!!!!!!
				}
				break;
			}
		}
		
		
		//한번 글을 클릭했으면 쿠키기간동안은 조회수가 증가되지 않게 한다. 
		if(!readResult) {
			Cookie cookie = new Cookie("readBoard", readBoard+"|"+no+"|");
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
		}
		
		
		
		
		AccompanyDTO a = new AccompanyServiceWH().selectBoardByNo(no,readResult);
		List <AccompanyComment> comments = new AccompanyServiceWH().selectAccompanyComment(no);
		request.setAttribute("board", a);
		request.setAttribute("comments", comments);
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
