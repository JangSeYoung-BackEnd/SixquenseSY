package com.web.product.dto;

import java.util.Date;
import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductsreviewDto {
	private int CommentNo; //댓글번호
	private String UserId; //댓글작성자
	private String CommentContent;
	private Date CommentDate;
	private int CommentRef; //대댓글
	private int CommentLevel;
	private int ProductNo;
	private int memberNo;
	private List<ProductreviewattachmentDto> attachment; //리뷰첨부파일
}
