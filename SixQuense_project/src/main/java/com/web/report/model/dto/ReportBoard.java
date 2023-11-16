package com.web.report.model.dto;

import java.lang.reflect.Member;
import java.sql.Date;

import com.web.community.model.dto.CommunityDTO;

public class ReportBoard {
	private int reportNo;
	private Date reportDate;
	private String reportContent;
	private int accompanyNo;
	private int reportCategoryNo;
	private int reportLevel;
	private Member member;
	private CommunityDTO community;
	
	
	
}
