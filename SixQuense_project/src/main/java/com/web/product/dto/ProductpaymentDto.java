package com.web.product.dto;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductpaymentDto {
	private String paymentId;
	private Date paymentDate;
	private int totalAmount;
	private String paymentStatus;
	private int OrderNo; //주문번호
}
