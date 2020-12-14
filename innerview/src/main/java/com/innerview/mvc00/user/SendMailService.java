package com.innerview.mvc00.user;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseBody;

@Service
public class SendMailService {
	@Autowired
	JavaMailSender mailSender; // 메일보내기

	@Autowired
	RandomCode ran; // 랜덤코드
	
	
	public String mailSending2(UserVO vo) throws Exception {
		String setfrom = "betterclass@gmail.com"; // 보내는 사람 이메일
		String tomail = vo.getuEmail(); // 받는 사람 이메일
		String title = vo.getuID() + " 님의 인증번호입니다."; // 제목
		String content = ran.createKey(); // 내용(랜덤코드)

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		return content;
	}
}
