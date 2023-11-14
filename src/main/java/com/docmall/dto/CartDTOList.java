package com.docmall.dto;

import lombok.Data;

@Data
public class CartDTOList {

	//c.cart_code,c.pro_num,c.cart_amount, p.pro_name, p.pro_price, p.pro_img,p.pro_discount,p.pro_up_folder
	
	private long cart_code;
	private Integer pro_num;
	private int cart_amount;
	
	private String pro_name;
	private int pro_price;
	private int pro_discount;
	private	String	pro_up_folder;
	private	String	pro_img;
}
