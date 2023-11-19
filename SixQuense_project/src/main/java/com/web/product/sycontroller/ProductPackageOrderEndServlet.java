package com.web.product.sycontroller;


import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.product.dto.BookinginfoDto;
import com.web.product.dto.ProductorderinfoDto;
import com.web.product.dto.ProductpaymentDto;
import com.web.product.syservice.ProductPackageOrderEndService;

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
		
		// 주문번호 변환
	    String merchantuid=request.getParameter("merchantuid");//주문번호
	    String orderNoStr = merchantuid.replace("IMP", ""); 
	    int orderNo = Integer.parseInt(orderNoStr);

	    // 주문정보
	    String productStack=request.getParameter("productStack"); //인원수
	    String orderDateStr=request.getParameter("paidat"); //주문일자
	    DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy-MM-d'T'HH:m:s");
	    LocalDateTime ltorderDate=LocalDateTime.parse(orderDateStr,dtf);
	    Timestamp orderdate=Timestamp.valueOf(ltorderDate); 
	    String userNoStr=request.getParameter("userNo"); //회원번호
	    int userNo=Integer.parseInt(userNoStr);
	    String productNo=request.getParameter("productNo"); //상품번호
	    
	    // 예약자 정보
	    String name2=request.getParameter("name2"); // 예약자 이름
	    String birthDate=request.getParameter("birthDate2"); //여행자 생년월일
	    String gender=request.getParameter("gender2"); //여행자 성별
	    String phone2=request.getParameter("phone2"); //여행자 휴대전화정보
	    
	    //결제 정보
	    String impuid=request.getParameter("impuid"); //결제번호
	    String orderDateStr2=request.getParameter("paidat");
	    DateTimeFormatter dtf2=DateTimeFormatter.ofPattern("yyyy-MM-d'T'HH:m:s");
	    LocalDateTime ltorderDate2=LocalDateTime.parse(orderDateStr2,dtf2);
	    Timestamp orderdate2=Timestamp.valueOf(ltorderDate2);
	    String totalPrice=request.getParameter("totalPrice"); //결제된 총금액
	    String status=request.getParameter("status"); //결제상태
	    if(status!=null){
	        switch (status){
	            case "paid":
	                status = "결제완료";
	                break;
	            case "unpaid":
	                status = "결제대기";
	                break;
	            default:
	                throw new IllegalArgumentException("틀렸어: " + status);
	        }
	    }
	    else{
	        throw new IllegalArgumentException("굿");
	    }

	    // 주문정보
	    ProductorderinfoDto p = ProductorderinfoDto.builder()
	            .OrderNo(orderNo) 
	            .OrderCount(Integer.parseInt(productStack))
	            .OrderDate(new java.sql.Date(orderdate.getTime()))
	            .MemberNO(userNo)
	            .ProductNo(Integer.parseInt(productNo))
	            .build();
	    // 예약자정보
	    BookinginfoDto b = BookinginfoDto.builder()
	            .BookingName(name2)
	            .BookingBrith(java.sql.Date.valueOf(birthDate))
	            .BookingGender(gender)
	            .BookingPhone(phone2)
	            .OrderNo(orderNo) 
	            .build();
	    //결제 정보
	    ProductpaymentDto paymentDto = ProductpaymentDto.builder()
	            .paymentId(impuid)
	            .paymentDate(new java.sql.Date(orderdate2.getTime()))
	            .totalAmount(Integer.parseInt(totalPrice))
	            .paymentStatus(status)
	            .OrderNo(orderNo) 
	            .build();

        // 서비스 호출
        ProductPackageOrderEndService service = new ProductPackageOrderEndService();
        boolean result=service.insertOrder(b, p, paymentDto, userNo, orderNo);

        //데이터를 List에 추가
        List<Object> dataList = new ArrayList<>();
        dataList.add(p);
        dataList.add(b);
        dataList.add(paymentDto);

        request.setAttribute("dataList", dataList);
        
        request.getRequestDispatcher("/views/product/paymentsuccess.jsp").forward(request, response);
  	}
}
