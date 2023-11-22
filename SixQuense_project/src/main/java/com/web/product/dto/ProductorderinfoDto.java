package com.web.product.dto;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductorderinfoDto {
	private int OrderNo; 
	private int OrderCount;
	private Date OrderDate;
	private int MemberNO; //회원번호
	private int ProductNo; //상품번호
	private String paymentId ;
	private String ProductName ;
	private int totalAmount;
	
}
