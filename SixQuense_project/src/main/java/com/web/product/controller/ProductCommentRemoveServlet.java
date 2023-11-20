package com.web.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.product.model.service.ProductService;

/**
 * Servlet implementation class ProductCommentRemoveServlet
 */
@WebServlet("/product/removecomment.do")
public class ProductCommentRemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductCommentRemoveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		System.out.println("코멘트 프로덕트No"+productNo);
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		System.out.println("받아온 코멘트 넘버"+commentNo);
		
		int result=new ProductService().removeProductComment(commentNo);
		System.out.println("댓글 삭제 결과"+result);
		
		response.sendRedirect(request.getContextPath()+"/product/productview.do?productNo="+productNo);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
