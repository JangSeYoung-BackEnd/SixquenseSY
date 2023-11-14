package com.web.product.dto;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductrefundDto {
	private String RefundStaus;
	private Date RefundResultDate;
	private Date RefundApplyDate;
	private String PaymentId;
}
