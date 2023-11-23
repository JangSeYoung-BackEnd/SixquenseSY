package com.web.product.dto;

import com.web.accompany.model.dto.Continent;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductCoordinateDto {
	private int coordinateNo;
	private String nation;
	private double latitude;
	private double longitude;
	private int continentNo;
	private Continent continent; 
}



