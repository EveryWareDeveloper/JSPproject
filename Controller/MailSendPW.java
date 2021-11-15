package gamestore;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

class MailAuth extends Authenticator{
	
	PasswordAuthentication pa;
    
    public MailAuth() {
        String mail_id = "nanbyum4249";
        String mail_pw = "11Star23!";
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
  
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }

}

public class MailSendPW {
	public static void pwMailSend(String mail) {

		Properties prop = System.getProperties();

		// 로그인시 TLS를 사용할 것인지 설정
		prop.put("mail.smtp.starttls.enable", "true");

		// 이메일 발송을 처리해줄 SMTP서버
		prop.put("mail.smtp.host", "smtp.gmail.com");

		// SMTP 서버의 인증을 사용한다는 의미
		prop.put("mail.smtp.auth", "true");

		// TLS의 포트번호는 587이며 SSL의 포트번호는 465이다.
		prop.put("mail.smtp.port", "587");

		// soket문제와 protocol문제 해결
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		prop.put("mail.smtp.socketFactory.fallback", "false");
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Authenticator auth = new MailAuth();

		Session session = Session.getDefaultInstance(prop, auth);

		MimeMessage msg = new MimeMessage(session);

		try {
			// 보내는 날짜 지정
			msg.setSentDate(new Date());

			// 발송자를 지정한다. 발송자의 메일, 발송자명
			msg.setFrom(new InternetAddress("nanbyum4249@gmail.com", "나는야멋쟁이"));

			// 수신자의 메일을 생성한다.
			InternetAddress to = new InternetAddress(mail);

			msg.setRecipient(Message.RecipientType.TO, to);


			String mailSubject = "테스트1";
			String mailText = "테스트2";

			// 메일의 제목 지정
			msg.setSubject(mailSubject, "UTF-8");
			// Transport는 메일을 최종적으로 보내는 클래스로 메일을 보내는 부분이다.
			msg.setText(mailText, "UTF-8");
			Transport.send(msg);
		} catch (AddressException ae) {
			System.out.println("AddressException : " + ae.getMessage());
		} catch (MessagingException me) {
			System.out.println("MessagingException : " + me.getMessage());
		} catch (UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : " + e.getMessage());
		}
	}
	
	public static void main(String[] args) {
		pwMailSend("rkdqjagml@naver.com");
		System.out.println("hi~~");
	}
}
