package com.web.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.product.dto.ProductDto;
import com.web.product.syservice.ProductMainService;

/**
 * Servlet implementation class ProductMainViewServlet
 */
@WebServlet("/product/productmain.do")
public class ProductMainViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductMainViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
		request.getRequestDispatcher("/views/product/syproductlistbytheme.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// 사용자의 요청에서 상품 번호를 가져옵니다.
//	    int productNo = Integer.parseInt(request.getParameter("productNo"));
//
//	    // ProductMainService를 이용해 상품 정보를 가져옵니다.
//	    ProductMainService service = new ProductMainService();
//	    ProductDto product = service.selectProductByNo(productNo, true);
//
//	    // 상품 정보를 요청에 추가합니다.
//	    request.setAttribute("product", product);
//
//	    
//	    // 상품 정보를 보여줄 JSP 페이지로 포워딩합니다.
	  // request.getRequestDispatcher("/views/product/syproductlistbytheme.jsp").forward(request, response);

	}

}
