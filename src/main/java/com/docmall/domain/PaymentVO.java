package com.docmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {
	private Integer pay_code; 
	private int odr_code; 
	private int pay_tot_price; 
	private int pay_nobank_price;
	private int pay_rest_price;
	
	
	private String mbsp_id;
	private String pay_method;
	private String pay_nobank_user;
	private String pay_nobank; 
	private String pay_memo;
	
	private Date pay_date;
	
}
