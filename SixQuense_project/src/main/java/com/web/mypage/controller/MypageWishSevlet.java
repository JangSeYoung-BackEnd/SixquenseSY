package com.web.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.member.service.jhMemberService;
import com.web.product.dto.ProductwishilistDto;

/**
 * Servlet implementation class MypageWishSevlet
 */
@WebServlet("/Wish.do")
public class MypageWishSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageWishSevlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		 ProductwishilistDto wish=(ProductwishilistDto)session.getAttribute("wish");
		 
		if(session.getAttribute("wish") != null) {
			wish.setProductWishlistNo(Integer.parseInt(request.getParameter("productwishlistno")));
			wish.setMemberNo(Integer.parseInt(request.getParameter("memberno")));
			wish.setProductNo(Integer.parseInt(request.getParameter("productno")));
		}
		 int result = new jhMemberService().selectWishListByNo(wish);
			if (result > 0) {
                request.setAttribute("wish", wish);
                request.getRequestDispatcher("/views/mypagekategorie/Updatedata.jsp").forward(request, response);
            } else {
                // 업데이트 실패 처리
                
                System.out.println("null");
            }
        } 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
