package com.docmall.service;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.docmall.dto.EmailDTO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class EmailServiceimpl implements EmailService {

	
	private final JavaMailSender mailSender;

	@Override
	public void sendMail(EmailDTO dto, String message) {
		// TODO Auto-generated method stub
		MimeMessage mimemessage = mailSender.createMimeMessage();
		
		try {
			//받는사람 메일주소
			mimemessage.addRecipient(RecipientType.TO  ,new InternetAddress(dto.getReceiverMail()));
			//보내는사람
			mimemessage.addFrom(new InternetAddress[] {new InternetAddress(dto.getSenderMail(),dto.getSenderName())});
			//메일제목
			mimemessage.setSubject(dto.getSubjsect(),"utf-8");
			//본문내용
			mimemessage.setText(message,"utf-8");
			
			mailSender.send(mimemessage);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
}
