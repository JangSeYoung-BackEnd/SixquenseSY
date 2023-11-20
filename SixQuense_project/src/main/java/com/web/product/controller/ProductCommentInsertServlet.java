package com.web.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.product.dto.ProductsreviewDto;
import com.web.product.model.service.ProductService;

/**
 * Servlet implementation class ProductCommentInsertServlet
 */
@WebServlet("/product/insertComment.do")
public class ProductCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductCommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productNo=Integer.parseInt(request.getParameter("productNo"));
		int commentLevel=Integer.parseInt(request.getParameter("commentLevel"));
		System.out.println(commentLevel);
		String userId=request.getParameter("userId");
		int memberNo = Integer.parseInt(request.getParameter("member_no"));
		String content=request.getParameter("content");
		int CommentRef=Integer.parseInt(request.getParameter("CommentRef"));
		System.out.println(CommentRef);
		
		ProductsreviewDto pr = ProductsreviewDto.builder()
		  .ProductNo(productNo)
		  .UserId(userId)
		  .CommentContent(content)
		  .CommentRef(CommentRef)
		  .CommentLevel(commentLevel)
		  .memberNo(memberNo)
		  .build();
		
		int result=new ProductService().insertProductComment(pr);
		System.out.println(result);
		
		
		
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
