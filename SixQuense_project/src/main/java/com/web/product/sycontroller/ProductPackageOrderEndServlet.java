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
import com.web.product.dto.ProductDto;
import com.web.product.dto.BookinginfoDto;
import com.web.product.dto.ProductorderinfoDto;
import com.web.product.dto.ProductpaymentDto;
import com.web.product.model.service.ProductService;
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
		/*
		 * String orderDateStr=request.getParameter("paidat"); //주문일자 DateTimeFormatter
		 * dtf=DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss"); LocalDateTime
		 * ltorderDate=LocalDateTime.parse(orderDateStr,dtf); Timestamp
		 * orderdate=Timestamp.valueOf(ltorderDate);
		 */
	    String orderDateStr = request.getParameter("paidat"); //주문일자

	 // 날짜와 시간 분리
	 String[] dateTimeParts = orderDateStr.split("T");
	 String datePart = dateTimeParts[0];
	 String timePart = dateTimeParts[1];

	 // 시간 부분을 ":"로 분리
	 String[] timeParts = timePart.split(":");

	 // 시간, 분, 초가 한 자리일 경우 두 자리로 변환
	 for (int i = 0; i < timeParts.length; i++) {
	     if (timeParts[i].length() == 1) {
	         timeParts[i] = "0" + timeParts[i];
	     }
	 }

	 // 변환된 시간 부분으로 다시 시간 문자열 생성
	 String newTimePart = String.join(":", timeParts);

	 // 새로운 날짜 및 시간 문자열 생성
	 String newOrderDateStr = datePart + "T" + newTimePart;

	 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
	 LocalDateTime ltorderDate = LocalDateTime.parse(newOrderDateStr, dtf);
	 Timestamp orderdate1 = Timestamp.valueOf(ltorderDate);
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
		/*
		 * String orderDateStr2=request.getParameter("paidat"); DateTimeFormatter
		 * dtf2=DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss"); LocalDateTime
		 * ltorderDate2=LocalDateTime.parse(orderDateStr2,dtf2); Timestamp
		 * orderdate2=Timestamp.valueOf(ltorderDate2);
		 */
	    //주문일자
	    String orderDateStr1 = request.getParameter("paidat");

		 // 날짜와 시간 분리
		 String[] dateTimeParts1 = orderDateStr1.split("T");
		 String datePart1 = dateTimeParts1[0];
		 String timePart1 = dateTimeParts1[1];

		 // 시간 부분을 ":"로 분리
		 String[] timeParts1 = timePart1.split(":");
	
		 // 시간, 분, 초가 한 자리일 경우 두 자리로 변환
		 for (int i = 0; i < timeParts1.length; i++) {
		     if (timeParts1[i].length() == 1) {
		         timeParts1[i] = "0" + timeParts1[i];
		     }
		 }
	
		 // 변환된 시간 부분으로 다시 시간 문자열 생성
		 String newTimePart1 = String.join(":", timeParts1);
	
		 // 새로운 날짜 및 시간 문자열 생성
		 String newOrderDateStr1 = datePart1 + "T" + newTimePart1;
	
		 DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
		 LocalDateTime ltorderDate1 = LocalDateTime.parse(newOrderDateStr1, dtf1);
		 Timestamp orderdate2 = Timestamp.valueOf(ltorderDate1);
		 
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
	            .OrderDate(new java.sql.Date(orderdate1.getTime()))
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
   
 
        
        List<Object> dataList = new ArrayList<>();
        dataList.add(p);
        dataList.add(b);
        dataList.add(paymentDto);

        request.setAttribute("dataList", dataList);
      
        request.getRequestDispatcher("/views/product/paymentsuccess.jsp").forward(request, response);
  	}
}
