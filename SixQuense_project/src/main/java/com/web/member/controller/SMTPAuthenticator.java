package com.web.member.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


public class SMTPAuthenticator extends Authenticator{
	Properties props= new Properties();

	{
		String path=SMTPAuthenticator.class.getResource("/driver.properties").getPath();
		try(FileReader fr=new FileReader(path);) {
			props.load(fr);			
		}catch(IOException e) {
			e.printStackTrace();
		}	
	}

	@Override
	public PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(props.getProperty("username"), props.getProperty("password"));
	}

}
