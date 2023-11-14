package com.web.product.dto;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class BookinginfoDto {
	private String BookingName;
	private Date BookingBrith;
	private String BookingGender;
	private String BookingPhone;
	private int MemberNo;
	private int OrderNo;
}
