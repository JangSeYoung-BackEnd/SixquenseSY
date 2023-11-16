package com.web.accompany.model.dto;


import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class AccompanyAttachment {
	private String originalFilename;
	private String renameFilename;
	private int accompanyNo;
	
}
