package com.web.accompany.model.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class AccompanyOffer {
	private int accompanyNo;
	private int memberNo;
	private String accompanyOfferStatus;
	private String offerRename;
	private String userId ;
}
