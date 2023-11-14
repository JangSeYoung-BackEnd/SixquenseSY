package com.web.community.model.dto;

import java.sql.Date;
import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CommunityDTO {
	private int travelReviewNo;
	private String travelReviewContent;
	private Date travelReviewDate;
	private int travelReviewReadCount;
	private Member member;
	private List<TravelReviewAttachmentDTO> travelReviewFile;
}
