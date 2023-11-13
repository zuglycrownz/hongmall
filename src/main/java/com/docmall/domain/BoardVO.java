package com.docmall.domain;

import java.util.Date;

import lombok.Data;


@Data
public class BoardVO {

//create table board (
//BNO number,
//TITLE varchar2(100) not null,
//CONTENT varchar2(1000) not null,
//WRITER varchar2(100) not null,
//REGDATE date default sysdate,
//UPDATEDDATE date default sysdate,
//constraint PK_BOARD primary key(BNO)
//)
	
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private int viewcount;
	
	private Date regDate;
	private Date updateddate;
}
