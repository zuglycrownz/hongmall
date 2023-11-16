package com.docmall.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.docmall.kakaopay.ApproveResponse;
import com.docmall.kakaopay.ReadyResponse;

//결제준비하기
//POST	https://kapi.kakao.com/v1/payment/ready
//헤더 :uthorization	Authorization: KakaoAK ${SERVICE_APP_ADMIN_KEY}
//헤더 :Content-type	Content-type: application/x-www-form-urlencoded;charset=utf-8

@Service
public class KakaoPayServiceImpl {
	
	private HttpHeaders getHeaderInfo() {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK f8ccc077f6a23c53a9da7f63ec52b981");
		headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		return headers;
	}
	
	
	public ReadyResponse payReady(Long odr_code, String iteamName, int quantity, String mbsp_id, int totalAmount) {
		
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		
		parameters.add("cid", "TC0ONETIME");                 				//가맹점코드
		parameters.add("partner_order_id", String.valueOf(odr_code));		//가맹점 주문번호
		parameters.add("partner_user_id", mbsp_id);							//가맹점 회원
		parameters.add("item_name", iteamName);								//상품명
		parameters.add("quantity", String.valueOf(quantity));				//상품수량
		parameters.add("total_amount",  String.valueOf(totalAmount));		//상품 총액
		parameters.add("tax_free_amount", "0");							//상품 비과세 금액
		parameters.add("approval_url", "http://localhost:9090/user/order/orderApproval");							//결제성공시
		parameters.add("cancel_url", "http://localhost:9090/user/order/orderCancel");								//결제취소시
		parameters.add("fail_url", "http://localhost:9090/user/order/orderFail");									//결제실패시
			
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String,String>>(parameters,this.getHeaderInfo());
		
		RestTemplate template = new RestTemplate();
		
		String kakaReadoUrl = "https://kapi.kakao.com/v1/payment/ready";
		
		//url,request,class 순서로 입력
		ReadyResponse readyResponse = template.postForObject(kakaReadoUrl, requestEntity, ReadyResponse.class);
		
		return readyResponse;
	}	
	
	public ApproveResponse payApprove(Long odr_code, String tid,String pg_token, String mbsp_id) {
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		
		
		parameters.add("cid", "TC0ONETIME");
		parameters.add("tid", tid);
		parameters.add("partner_order_id", String.valueOf(odr_code));
		parameters.add("partner_user_id", mbsp_id);
		parameters.add("pg_token", pg_token);
		
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String,String>>(parameters,this.getHeaderInfo());
		
		RestTemplate template = new RestTemplate();
		
		String kakaApproveUrl = "https://kapi.kakao.com/v1/payment/approve";
		
		//url,request,class 순서로 입력
		ApproveResponse approveResponse = template.postForObject(kakaApproveUrl, requestEntity, ApproveResponse.class);
		
		return approveResponse;
		
	}
}
