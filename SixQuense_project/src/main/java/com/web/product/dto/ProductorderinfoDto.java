package com.web.product.dto;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductorderinfoDto {
	private int OrderNo;
	private int OrderCount;
	private Date OrderDate;
	private int MemberNO;
	private int ProductNo;
	private BookinginfoDto bookinginfo;
	private ProductpaymentDto payment; //결제
}
