package com.web.product.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductDto {
	private int ProductNo;
	private String ProductName;
	private int ProductReadcount;
	private Date ProductInsertdate;
	private int MinCount;
	private int MaxCount;
	private int ProductPrice;
	private int GuideNo;
	private double ProductDiscountRate;
	private String ProductDetail;
	private int ProductDuration;
	private String[] ProductDay;
	private int CoodinateNo;
	private String EditorNote;

	
	private List<ProductsreviewDto> review; //상품리뷰
	private List<ProductattachmentDto> attachment; //상품첨부파일
	private List<ProductdateDto> date; // 상품(날짜)
	private List<ProductcourseDto> course; //상품코스
	private List<ProductorderinfoDto> orderinfo; //상품(패키지)주문정보
	private List<ProductwishilistDto> wishlist; //위시리스트
	private ProductCoordinateDto coordinate; //나라 정보
}
