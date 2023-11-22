package com.web.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.member.dto.Member;
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
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		List<ProductwishilistDto> wish = new jhMemberService().selectWishListByNo(userNo);
		request.setAttribute("wish", wish);	
		request.getRequestDispatcher("/views/mypagekategorie/WishList.jsp").forward(request, response);
		
	}
        

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
