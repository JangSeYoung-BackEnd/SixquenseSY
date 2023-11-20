package com.web.product.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductwishilistDto {
	private int ProductWishlistNo;
	private int MemberNo;
	private int ProductNo;
}
