package com.web.product.SYcontroller;


import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		request.setCharacterEncoding("UTF-8");
		
		String bookingName=request.getParameter("bookingName");
		String bookingBirth=request.getParameter("bookingBirth");
		String bookingGender=request.getParameter("bookingGender");
		String bookingPhone=request.getParameter("bookingPhone");
		
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		int orderNo=Integer.parseInt(request.getParameter("orderNo"));
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date birth = null;
        try {
            birth = sdf.parse(bookingBirth);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        BookinginfoDto b = BookinginfoDto.builder()
                .BookingName(bookingName)
                .BookingBrith(birth)
                .BookingGender(bookingGender)
                .BookingPhone(bookingPhone)
                .build();
            
            int result = new BookingService().insertBookingInfo(b, memberNo, orderNo);
	}
}
