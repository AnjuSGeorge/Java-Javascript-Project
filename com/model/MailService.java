package com.model;


import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;


import javax.annotation.Resource;

import org.springframework.mail.MailException;
import org.springframework.mail.javamail.MimeMessagePreparator;



import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.MailParseException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;



/**
 * Servlet implementation class MailService
 */
@Service
public class MailService  {
	
	private JavaMailSender mailSender;
	
	public JavaMailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
/*
	public void sendMail(String emailId)
	{
		MimeMessage message =  this.mailSender.createMimeMessage();
		MimeMessageHelper mimeHelper;
		try {
			mimeHelper = new MimeMessageHelper(message,true);
			mimeHelper.setTo(emailId);
			
			
			mimeHelper.setFrom("m4ver1k.a@gmail.com");
			mimeHelper.setSubject("Password Reset");
			mimeHelper.setText("<html><body>hi,<br/><a href='http://localhost:8080/ForgotPassword/newPassword/"+emailId+"/'> Click here</a> to reset password</body></html>",true);
			mailSender.send(message);
		} catch (MessagingException e) {
			System.out.println("Error Sending email "+ e.getMessage());
		}
		
	}*/

}
