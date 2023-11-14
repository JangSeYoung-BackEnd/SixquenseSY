package com.web.accompany.model.dto;

import java.sql.Date;


@Data
@Builder
public class AccompanyComment {
	private int accompanyComtNo;
	private int accompanyComtLevel;
	private String accompanyComtContent;
	private int accompanyComtRef;
	private Date accompanyComtDate;
	private int accompanyNo;
	private int MemberNo;
}
