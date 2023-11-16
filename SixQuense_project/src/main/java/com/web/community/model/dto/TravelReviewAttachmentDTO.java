package com.web.community.model.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class TravelReviewAttachmentDTO {
	private String originalFilename;
	private String renameFilename;
	private int memberNo;
}
