package com.web.community.model.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CommunityDTO {
	private int travelReviewNo;	
	private String travelReviewTitle;
	private String travelReviewContent;
	private Date travelReviewDate;
	private int travelReviewReadCount;
	private int memberNo;
	private List<TravelReviewAttachmentDTO> travelReviewFile=new ArrayList<>();
}
