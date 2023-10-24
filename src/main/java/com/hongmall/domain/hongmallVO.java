package com.hongmall.domain;


import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class hongmallVO {

	private String  MBSP_ID;
	private String MBSP_NAME ;
	private String MBSP_EMAIL ;
	private String MBSP_PASSWORD;
	private String MBSP_PASSWORD2;
	private String MBSP_ZIPCODE;
	private String MBSP_ADDR;
	private String MBSP_DEADDR;
	private String MBSP_PHONE;
	private String MBSP_NICK;
	private String MBSP_RECEIVE;
	private int MBSP_POINT;
	private Date MBSP_LASTLOGIN;
	private Date MBSP_DATESUB;
	private Date MBSP_UPDATEDATE;
}
