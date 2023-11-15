package com.web.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.product.dao.ProductDao;
import com.web.product.dto.ProductDto;
import com.web.product.dto.ProductsreviewDto;
import com.web.product.model.service.ProductService;

/**
 * Servlet implementation class ProductViewServlet
 */
@WebServlet("/product/productview.do")
public class ProductViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		
		// 이전 쿠키값이 있는 지 확인
		// 읽은 글이 있을 때 boardNo가 들어가 있다
		Cookie[] cookies = request.getCookies();
		String readBoard = ""; // value 넣을 String 세팅
		boolean readResult = false; // readResult 읽었는지 않읽었는지 판단, false 안읽은 상태
		for (Cookie c : cookies) {
			String name = c.getName(); // name 쿠키 이름 키 확인
			if (name.equals("readBoard")) {
				readBoard = c.getValue(); // 읽은 글번호가 나온다
				if (readBoard.contains("|" + productNo + "|")) {
					readResult = true;
				}
				break;
			}
		}
		
		// 글 안읽었을 때 readReault false
		if (!readResult) {
			Cookie c = new Cookie("readBoard", "" + readBoard + "|" + productNo + "|");
			c.setMaxAge(60 * 60 * 24); // 하루동안 유지
			response.addCookie(c);
		}
		
		ProductDto product = new ProductService().selectProductByNo(productNo,readResult);
		//List<ProductsreviewDto> comments = new ProductService().selectProductComment(productNo);
		
		request.setAttribute("product", product);
		//request.setAttribute("comments", comments);
		
		//상품 상 jsp로 이동
		request.getRequestDispatcher("/views/product/productview.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
