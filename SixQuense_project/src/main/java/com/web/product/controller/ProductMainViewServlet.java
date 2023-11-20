package com.web.product.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.product.dto.ProductDto;
import com.web.product.model.service.ProductService;

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

//		ProductService productService = new ProductService();
//
//		List<Integer> coordinateNos = Arrays.asList(10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43);
//
//		Map<Integer, List<ProductDto>> recentProductsByCountry=new HashMap<>();
//		Map<Integer, List<ProductDto>> discountProductsByCountry=new HashMap<>();
//
//		for(Integer coordinateNo : coordinateNos) {
//		    List<ProductDto> recentProducts=productService.selectRecentproductByCountry(coordinateNo);
//		    List<ProductDto> discountProducts=productService.selectDicountproductByCountry(coordinateNo);
//		    recentProductsByCountry.put(coordinateNo, recentProducts);
//		    discountProductsByCountry.put(coordinateNo, discountProducts);
//		}
//		System.out.println(recentProductsByCountry);
//		System.out.println(discountProductsByCountry);
//		request.setAttribute("recentProductsByCountry", recentProductsByCountry);
//		request.setAttribute("discountProductsByCountry", discountProductsByCountry);

	}

}
