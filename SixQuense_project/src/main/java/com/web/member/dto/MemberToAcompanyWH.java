package com.web.member.dto;

import java.util.ArrayList;
import java.util.List;
import com.web.accompany.model.dto.AccompanyDTO;
import com.web.accompany.model.dto.AccompanyOffer;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class MemberToAcompanyWH {
	private int userNo;
	private int accompany;
	private String AcOffer;
//	private List <AccompanyDTO> accompany = new ArrayList<AccompanyDTO>();
//	private List <AccompanyOffer> AcOffer = new ArrayList(); 
	
}
