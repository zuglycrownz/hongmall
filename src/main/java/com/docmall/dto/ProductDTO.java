package com.docmall.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@ToString
public class ProductDTO {

	private Integer pro_num; //사용자

	private int pro_price;

	private String pro_buy;
	

}
