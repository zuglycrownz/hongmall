package com.docmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {

	private Integer pro_num; //사용자
	private Integer cg_code;
	private String pro_name;
	private int pro_price;
	private int pro_discount;
	private String pro_publisher;
	private String pro_content;
	
	private String pro_up_folder; // 스프링에서 별도로 처리
	private String pro_img; // 스프링에서 별도로 처리
	
	
	private int pro_amount; //사용자
	private String pro_buy;
	
	private Date pro_date; //스프링에서 별도로 처리
	private Date pro_updateddate;
}
