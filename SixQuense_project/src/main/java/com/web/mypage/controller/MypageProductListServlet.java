package com.web.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.member.service.jhMemberService;
import com.web.product.dto.ProductDto;
import com.web.product.dto.ProductorderinfoDto;
import com.web.product.dto.ProductpaymentDto;

/**
 * Servlet implementation class MypageWishSevlet
 */
@WebServlet("/ProductList.do")
public class MypageProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageProductListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		List<ProductDto> pro = new jhMemberService().selectproductnameByNo(userNo);
		List<ProductorderinfoDto> info = new jhMemberService().selectProductByNo(userNo);
		List<ProductpaymentDto> pay = new jhMemberService().selectpayByNo(userNo);
		System.out.println(info+"info");
		System.out.println(pay+"pay");
		System.out.println(pro+"pro");
		request.setAttribute("pay", pay);
		request.setAttribute("info", info);
		request.setAttribute("pro", pro);
		request.getRequestDispatcher("/views/mypagekategorie/ProductList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
