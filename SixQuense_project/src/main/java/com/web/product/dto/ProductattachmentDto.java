package com.web.product.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductattachmentDto {
	private int ProductNo;
	private String OrginalFilename;
	private String RenameFilename;
}
