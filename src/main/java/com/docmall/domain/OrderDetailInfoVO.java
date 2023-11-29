package com.docmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderDetailInfoVO {

	
//	ot.ord_code, ot.PRO_NUM, ot.DT_AMOUNT, ot.ord_price,p.pro_num, p.CG_CODE, p.PRO_NAME, p.PRO_PRICE, p.PRO_DISCOUNT, p.PRO_PUBLISHER, p.PRO_CONTENT, p.PRO_UP_FOLDER,
//	p.PRO_IMG, p.PRO_AMOUNT, p.PRO_BUY, p.PRO_DATE, p.PRO_UPDATEDATE from ORDETAIL_TBL ot,PRODUCT_TBL p
	
		private Long ord_code;
	    private Integer pro_num;
		private	String	pro_name;
		private	int		pro_price;
		private int dt_amount;
		private	int		ord_price;

		
		private	String	pro_up_folder;  // 스프링에서 별도로 처리
		private	String	pro_img;	// // 스프링에서 별도로 처리
}
