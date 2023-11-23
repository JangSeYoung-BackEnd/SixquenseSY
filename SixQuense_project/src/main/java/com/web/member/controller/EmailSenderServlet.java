package com.web.member.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

/**
 * Servlet implementation class EmailSenderServlet
 */
@WebServlet("/email/sendemail.do")
public class EmailSenderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailSenderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		String oriPw=(String)request.getAttribute("oriPw");
		String clientEmail=request.getParameter("email");
		String confirmNum=getRandomData(6);
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("confirmNum", confirmNum);
		boolean result=false;
		try {
			String title="트립투게더 인증번호";
			String content=oriPw==null?"<h3>인증번호 : "+confirmNum+"</h3>"
						:"<h3>임시비밀번호 : "+oriPw+"</h3>";
			Properties props = new Properties();
			//이메일요청 기본 세팅값 -> 네트워크통신관련 
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");
			
			
			Authenticator auth=new SMTPAuthenticator();
			
			Session session=Session.getDefaultInstance(props,auth);
			
			MimeMessage msg=new MimeMessage(session);
			//보내는사람 이메일
			msg.setFrom(new InternetAddress("adam911245@gmail.com"));
			//받는사람사람 이메일
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(clientEmail));
			msg.setSubject(title,"utf-8");
			msg.setContent(content,"text/html;charset=utf-8");
			msg.setHeader("Content-type", "text/html;charset=utf-8");
			
			Transport.send(msg);
			
			System.out.println("이메일전송완료");
			
			response.setContentType("application/json;charset=utf-8");
			result=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		new Gson().toJson(result,response.getWriter());
		
	}
	private String getRandomData(int n) {
		StringBuffer sb=new StringBuffer();
		
		for(int i=0;i<n;i++) {
			int num=(int)(Math.random()*10)+1;
			if(('a'<=num&&num<='z')||('A'<=num&&num<='Z')) {
				sb.append((char)num);
			}else {
				sb.append(num);
			}	
		}		
		return new String(sb);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
