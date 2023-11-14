package com.web.accompany.model.dto;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class AccompanyDTO {
	private int accompanyNo;
	private String accompanyTitle;
	private String accompanyContent;
	private int accompanyCount;
	private Date accompanyDate;
	private int memberNo;
	private int accompanyReadCount;
	private int coordnateNo;
	private String openChattingLink;
}
