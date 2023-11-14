package com.web.product.dto;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class ProductdateDto {
	private Date ProductDate;
	private String ProductSoldoutYn;
}
