package com.docmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {
	private Integer pay_code; 
	private Long ord_code; 
	private Integer pay_tot_price; 
	private Integer pay_nobank_price;
	
	
	private String mbsp_id;
	private String pay_method;
	private String pay_nobank_user;
	private String pay_nobank; 
	private String pay_memo;
	
	
	private String pay_bankaccount;
	private Date pay_date;
	
}
