package com.web.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.member.service.MemberService;
import com.web.product.dto.ProductDto;
import com.web.product.model.service.ProductService;

/**
 * Servlet implementation class MakeOrderServlet
 */
@WebServlet("/product/makeorder.do")
public class MakeOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MakeOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 상품 번호
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		// 인원수 가져오기
		int selectOption = Integer.parseInt(request.getParameter("selectOption"));
		//	여행 날짜
		String travelDate = request.getParameter("travel_date");
		
		// 상품 번호에 해당하는 상품 정보
		ProductDto product = new ProductService().selectProductByNo(productNo, true);

		// 회원정보
		//String memberNo=request.getParameter("memberNo");
		//memberNo m=new MemberService().selectMemberById(userId);
		
		//request.setAttribute("memberNo", m)
		request.setAttribute("product", product);
		request.setAttribute("selectOption", selectOption);
		request.setAttribute("travel_date", selectOption);		
				
		
		
		
		request.getRequestDispatcher("/views/product/syproductcart.jsp").forward(request, response);
	
	
	}

}
