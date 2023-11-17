package com.web.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.product.dto.ProductwishilistDto;
import com.web.product.model.service.ProductService;

/**
 * Servlet implementation class RemoveWishlistServlet
 */
@WebServlet("/product/removewishlist.do")
public class RemoveWishlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveWishlistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); //post방식 인코딩 필요
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		
		ProductwishilistDto wishlist = ProductwishilistDto.builder()
				.MemberNo(memberNo)
				.ProductNo(productNo)
				.build();
		
		int result = new ProductService().removewishlist(wishlist);
		System.out.println(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
