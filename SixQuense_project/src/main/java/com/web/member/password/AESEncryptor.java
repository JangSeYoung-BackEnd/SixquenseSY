package com.web.member.password;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.nio.charset.Charset;
import java.security.SecureRandom;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

public class AESEncryptor {
	private static SecretKey key;
	private String path;

	public AESEncryptor() {
		this.path =AESEncryptor.class.getResource("/").getPath();
		this.path=this.path.substring(0,this.path.indexOf("calsses"));
		File keyFile =new File(this.path+"bslove.bs");
		if(keyFile.exists()) {
			try(ObjectInputStream ois 
					=new ObjectInputStream(
							new FileInputStream(keyFile));){
					AESEncryptor.key=(SecretKey)ois.readObject();
					
				}catch(IOException|ClassNotFoundException e) {
					e.printStackTrace();
				}
			
				}else {
					getGeneraterKey();
				}
			}
		
	
			private void getGeneraterKey() {
				SecureRandom rnd =new SecureRandom();
				KeyGenerator keygen =null;
				try(ObjectOutputStream oos=new ObjectOutputStream(
						new FileOutputStream(this.path+"/bslove.bs"));) {
					keygen=KeyGenerator.getInstance("AES");
					keygen.init(128,rnd);
					AESEncryptor.key=keygen.generateKey();
					oos.writeObject(AESEncryptor.key);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			
			public static String encryptData(String oridata)
				throws Exception{
				Cipher cipher=Cipher.getInstance("AES");
				cipher.init(Cipher.ENCRYPT_MODE, AESEncryptor.key);
				
				byte[] oribyte=oridata.getBytes(Charset.forName("UTF-8"));
				byte[] encbyte=cipher.doFinal(oribyte);
				return Base64.getEncoder().encodeToString(encbyte);
			}
			
			public static String decryptData(String encdata) throws Exception{
				Cipher cipher=Cipher.getInstance("AES");
				cipher.init(Cipher.DECRYPT_MODE, AESEncryptor.key);
				
				byte[] encbyte=Base64.getDecoder()
						.decode(encdata.getBytes(Charset.forName("UTF-8")));
				byte[] decryptbyte=cipher.doFinal(encbyte);
				return new String(decryptbyte);
			}
			

}