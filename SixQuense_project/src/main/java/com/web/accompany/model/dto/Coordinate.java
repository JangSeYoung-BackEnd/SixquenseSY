package com.web.accompany.model.dto;


import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Coordinate {
	private int coordinateNo;
	private String nation;
	private int latitude;
	private int longitude;
	private Continent continent; 
}
