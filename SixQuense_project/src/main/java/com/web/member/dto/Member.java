package com.web.member.dto;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Member {
	private int userNo;
	private String userId;
	private String userPw;
	private String userName;
	private String phone;
	private Date userDd;
	private Date enrollData;
	private String userIntroduce;
	private String travleType;
	private String gender;
	private String notificatIonset;
	private String originalFilename; 
	
}