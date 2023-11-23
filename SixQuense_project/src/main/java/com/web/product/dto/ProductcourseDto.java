package com.web.product.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductcourseDto {
	private int CourseNo;
	private String CourseName;
	private String CourseDetail;
	private int ProductNo;
}
