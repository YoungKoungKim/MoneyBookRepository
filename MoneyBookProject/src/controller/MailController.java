package controller;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import service.IMemberService;
import service.KakaoService;

@Controller
public class MailController {
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping(method = RequestMethod.POST, value = "userAuth.do")
	public @ResponseBody int userAuth(HttpSession httpSession, String id) {
		int code = (int) (Math.random() * 90000) + 10000;

		// 이건 보내는 메일에 표시하는 이메일인 듯
		String from_email = "KinukTest@gmail.com";
		// 보낼 이메일 (받아온 아이디)
		String to_email = id;
		String mail_subtitle = "가계이득 인증메일";
		// html형식으로 보내서 태그들 먹네요
		String mail_content = "<h1>인증번호 : " + code + "</h1>";

		// 먼저 환경 정보를 설정해야 한다.
		// 메일 서버 주소를 IP 또는 도메인 명으로 지정한다.
		Properties props = System.getProperties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.quitwait", "false");

		// Authenticator클래스를 상속받아 만든 보내는 이메일 인증클래스
		Authenticator auth = new MyAuthenticator();

		// 위 환경 정보로 "메일 세션"을 만들고 빈 메시지를 만든다
		Session session = Session.getDefaultInstance(props, auth);

		MimeMessage msg = new MimeMessage(session);

		try {
			// 발신자, 수신자, 참조자, 제목, 본문 내용 등을 설정한다
			msg.setFrom(new InternetAddress(from_email, "가계이득"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email, to_email));
			// 여러명 발송인 듯
			/*
			 * msg.addRecipient(Message.RecipientType.TO, new
			 * InternetAddress("eee@fff.co.kr", "선덕여왕"));
			 * msg.addRecipient(Message.RecipientType.CC, new
			 * InternetAddress("ggg@hhh.co.kr", "의자왕"));
			 */
			msg.setSubject(mail_subtitle);
			msg.setContent(mail_content, "text/html; charset=utf-8");

			// 메일을 발신한다
			Transport.send(msg);
			
			httpSession.setAttribute("code", code);
			
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "pwdFoundAuth.do")
	public @ResponseBody int pwdFoundAuth(HttpSession httpSession, String id) {
		int result = memberService.idCheck(id);
		
		if (result == 1001) {
			int code = (int) (Math.random() * 90000) + 10000;

			// 이건 보내는 메일에 표시하는 이메일인 듯
			String from_email = "KinukTest@gmail.com";
			// 보낼 이메일 (받아온 아이디)
			String to_email = id;
			String mail_subtitle = "가계이득 인증메일";
			// html형식으로 보내서 태그들 먹네요
			String mail_content = "<h1>인증번호 : " + code + "</h1>";

			// 먼저 환경 정보를 설정해야 한다.
			// 메일 서버 주소를 IP 또는 도메인 명으로 지정한다.
			Properties props = System.getProperties();
			props.setProperty("mail.transport.protocol", "smtp");
			props.setProperty("mail.host", "smtp.gmail.com");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");
			props.setProperty("mail.smtp.quitwait", "false");

			// Authenticator클래스를 상속받아 만든 보내는 이메일 인증클래스
			Authenticator auth = new MyAuthenticator();

			// 위 환경 정보로 "메일 세션"을 만들고 빈 메시지를 만든다
			Session session = Session.getDefaultInstance(props, auth);

			MimeMessage msg = new MimeMessage(session);

			try {
				// 발신자, 수신자, 참조자, 제목, 본문 내용 등을 설정한다
				msg.setFrom(new InternetAddress(from_email, "가계이득"));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email, to_email));
				// 여러명 발송인 듯
				/*
				 * msg.addRecipient(Message.RecipientType.TO, new
				 * InternetAddress("eee@fff.co.kr", "선덕여왕"));
				 * msg.addRecipient(Message.RecipientType.CC, new
				 * InternetAddress("ggg@hhh.co.kr", "의자왕"));
				 */
				msg.setSubject(mail_subtitle);
				msg.setContent(mail_content, "text/html; charset=utf-8");

				// 메일을 발신한다
				Transport.send(msg);
				
				httpSession.setAttribute("code", code);
				
				return 1;
			} catch (Exception e) {
				e.printStackTrace();
				return -1;
			}
		}
		
		return 0;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "idAuth.do")
	public @ResponseBody boolean idAuth(HttpSession session, int authNo) {
		if(session.getAttribute("code") != null) {
			if((int) session.getAttribute("code") == authNo) {
				session.setAttribute("code", null);
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	static class MyAuthenticator extends Authenticator {
		public PasswordAuthentication getPasswordAuthentication() {
			String username = "KinukTest@gmail.com";
			String password = "test!@#$";
			return new PasswordAuthentication(username, password);
		}
	}
}
