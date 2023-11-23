package com.web.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.web.product.dto.ProductCoordinateDto;
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
		
		int coordinateNo = Integer.parseInt(request.getParameter("coordinateNo"));
		
		//List<ProductDto> allProducts = new ProductService().selectproductAllByCountry(coordinateNo);
		List<ProductDto> products = new ProductService().selectBestproductByCountry(coordinateNo);
		ProductCoordinateDto coordinate = new ProductService().selectCoordinateByNo(coordinateNo);
		
		
		/*
		 * response.setContentType("applicaion/json;charset=utf-8"); Gson gson = new
		 * Gson();
		 * 
		 * gson.toJson(dicountProducts,response.getWriter());
		 * gson.toJson(recentProducts,response.getWriter());
		 * gson.toJson(dicountProducts,response.getWriter());
		 */
		System.out.println(coordinateNo);
		  //request.setAttribute("allProducts", allProducts);
		  request.setAttribute("products", products);
		  request.setAttribute("coordinateNo", coordinateNo);
		  request.setAttribute("coordinate", coordinate);
		  System.out.println(products);
		  
		 
		  request.getRequestDispatcher("/views/product/productlistbycountry.jsp").
		  forward(request, response);
		  
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
