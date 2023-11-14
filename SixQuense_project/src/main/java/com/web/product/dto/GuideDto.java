package com.web.product.dto;

import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class GuideDto {
	private int GuideNo;
	private String GuideName;
	private String GuidePhone;
	private List<ProductDto> product; //상품(패키지)
}
