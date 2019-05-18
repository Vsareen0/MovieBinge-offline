package com.comaniacs.configurations;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSenderBean {

	public void sendEmail(String fromEmail, String toEmail, String subject, String message) {
		
		Properties props = System.getProperties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
	    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	    props.put("mail.smtp.socketFactory.port", "465");
	    props.put("mail.smtp.socketFactory.fallback", "false");


	    Session mailSession = Session.getDefaultInstance(props, null);
	    mailSession.setDebug(true);
	    
	    Message mailMessage = new MimeMessage(mailSession);
	    try {
			mailMessage.setFrom(new InternetAddress(fromEmail));
		    mailMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
		    mailMessage.setContent(message, "text/html");
		    
		    mailMessage.setSubject(subject);
		    
		    Transport transport = mailSession.getTransport("smtp");
		    transport.connect("smtp.gmail.com","vsareen24@gmail.com","password@Google1");
		    
		    transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
		    
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	    
	}
	
}
