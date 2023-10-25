package com.docmall.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class EmailDTO {

		private String senderName;
		private String senderMail;
		private String receiverMail;
		private String subjsect;
		private String message;
		
		public EmailDTO() {
			this.senderName = "DocMall";
			this.senderMail = "DocMall";
			this.subjsect = "DocMall 회원가입 메일인증코드입니다.";
			this.message = "메일 인증코드를 확인하시고, 회원가입시 인증코드 입력란에 입력바랍니다.";
		}
}
