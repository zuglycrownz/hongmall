package com.docmall.domain;

import com.docmall.dto.Criteria;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

	private int startPage; //각 블럭에서 출력할 시작페이지번호
	private int endPage; // 각 블럭에서 출력할 종료페이지번호
	
	private boolean prev,next; // 이전,다음 표시여부
	
	private int total; //테이블의 데이터 총 개수
	
	private Criteria crl; //1)페이징 : pagenum,amount 2)검색:type,keyword
	
	public PageDTO(Criteria crl, int total) {
		this.crl = crl;
		this.total = total;
		//totla = 13, amount = 5로 가정
		int pageSize = 10;
		int endPageinfo = pageSize - 1;
		//1/10.0 * 10, ceil는 무조건올림 0.1=1 즉 10
		this.endPage = (int) (Math.ceil(crl.getPageNum() / (double) pageSize)) * pageSize;
		
		// 10 - 9 = 1
		this.startPage = this.endPage - endPageinfo;
		
		//13*1.0 / 5 = 2.6 -> ceil로인해 3
		int readEnd = (int) (Math.ceil((total * 1.0) / crl.getAmount()));
		
		if(readEnd <= this.endPage) {
			this.endPage = readEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < readEnd;
	}
	
}
