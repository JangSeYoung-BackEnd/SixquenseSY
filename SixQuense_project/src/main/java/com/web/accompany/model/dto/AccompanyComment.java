package com.web.accompany.model.dto;

import java.sql.Date; 
import lombok.Builder;
import lombok.Data;


@Data
@Builder
public class AccompanyComment {
	private int accompanyComtNo;
	private int accompanyComtLevel;
	private String accompanyComtContent;
	private int accompanyComtRef;
	private Date accompanyComtDate;
	private int accompanyNo;
	private String userId;	
}
