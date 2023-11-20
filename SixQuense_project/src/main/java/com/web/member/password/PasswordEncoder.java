package com.web.member.password;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class PasswordEncoder extends HttpServletRequestWrapper{
	
	public PasswordEncoder(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String name) {
		if(name.equals("userpw")) {
			String ori=super.getParameter(name);
			System.out.println("password 원본 : "+ori);
			String change=getSHA512(ori);
			System.out.println("password 변경: "+change);
			return change;
		}
		return super.getParameter(name);
	}
	
	private String getSHA512(String orival) {
		MessageDigest md=null;
		try {
		md=MessageDigest.getInstance("SHA-512");
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] oridatabyte=orival.getBytes();
		md.update(oridatabyte); //sha-512방식으로 암호화 처리
		byte[] encryptData=md.digest();
		
		String encryptStr=Base64.getEncoder().encodeToString(encryptData);
		
		return encryptStr;
	}
}
