package com.web.product.sycontroller;


import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<<<<<<< HEAD
import com.web.product.syservice.BookingService;
import com.web.product.dto.BookinginfoDto;

/**
 * Servlet implementation class ProductPackageOrderEndServlet
 */
@WebServlet("/productpackage/orderend.do")
public class ProductPackageOrderEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductPackageOrderEndServlet() {
        super();
=======
import com.web.product.dto.BookinginfoDto;
import com.web.product.syservice.BookingService;

/**
 * Servlet implementation class ProductPackageOrderEndServlet
 */
@WebServlet("/productpackage/orderend.do")
public class ProductPackageOrderEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductPackageOrderEndServlet() {
        super();
        
>>>>>>> branch 'test' of https://github.com/ImmortalDeveloper/Sixquense.git
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
		String imp=request.getParameter("imp_");
	}
}
