package com.web.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.accompany.model.dto.AccompanyDTO;
import com.web.accompany.service.AccompanyServiceKH;
import com.web.accompany.service.AccompanyServiceWH;
import com.web.product.dto.ProductDto;

/**
 * Servlet implementation class SearchTotalservlet
 */
@WebServlet("/member/searchTotalservlet.do")
public class SearchTotalservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchTotalservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//검색값을 받아옴 
		String searchValue = request.getParameter("searchValue");
		System.out.println(searchValue);
		//상품이랑 동행 게시글을 list로 들고온다 
		List<ProductDto> searchResult =new AccompanyServiceWH().selectsearchAll(searchValue);
		List<AccompanyDTO> accompanys =new AccompanyServiceWH().selectsearchAccompanyAll(searchValue);
		
		request.setAttribute("searchResult", searchResult);
		request.setAttribute("searchValue", searchValue);
		request.setAttribute("accompanys", accompanys);
		System.out.println(searchResult + "servlet");
		System.out.println(accompanys + "servlet");
		request.getRequestDispatcher("/views/product/searchProductlistWH.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
