package com.web.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.product.dto.ProductDto;
import com.web.product.model.service.ProductService;

/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet("/product/productlist.do")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//int coordinateNO = request.getParameter("coordinateNo");
		
		//List<ProductDto> bestProduct = new ProductService().selectBestproductByCountry(coordinateNO);
		
		//List<ProductDto> recentProduct = new ProductService().selectRecentproductByCountry(coordinateNO);
		
		//List<ProductDto> dicountProduct = new ProductService().selectDicountproductByCountry(coordinateNO);
		
		//request.setAttribute("recentProduct", recentProduct);
		//request.setAttribute("bestProduct", bestProduct);
		//request.setAttribute("dicountProduct", dicountProduct);
		
	
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
