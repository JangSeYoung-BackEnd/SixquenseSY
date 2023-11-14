package com.web.accompany.model.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Continent {
	private int continentNo;
	private String continentName;
}
