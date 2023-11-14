package com.web.product.dto;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductpaymentDto {
	private String payment_id;
	private Date payment_date;
	private int total_amount;
	private String payment_status;
	private int orderNo;
	private ProductrefundDto refund;
}
