package com.docmall.kakaopay;

import lombok.Data;

@Data
public class Amount {

	
	private int total;
	private int tax_free;
	private int vat;
	private int point;
	private int discount;
}
