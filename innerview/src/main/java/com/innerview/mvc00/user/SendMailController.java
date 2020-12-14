package com.innerview.mvc00.user;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Random;

@Controller
public class SendMailController {
	@Autowired
	SendMailService service;

	// mailSending 코드
	@RequestMapping("mailSending.do")
	@ResponseBody
	public String mailSending(UserVO userVO) throws Exception{
		String content = service.mailSending2(userVO);
		return content;
		
	}		
}
