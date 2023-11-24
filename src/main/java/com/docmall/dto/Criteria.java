package com.docmall.dto;


import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Criteria {
	private int pageNum;
	private int amount; //페이지마다 출력할 데이터 개수
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1,10);
		System.out.println("Criteria 기본생성자 호출");
	}
	
	public Criteria(int pageNum,int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {} : type.split("");
}
	
	public String getlistLink() {
		UriComponentsBuilder bulider = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return bulider.toUriString();
				
	}
}


