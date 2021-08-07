package com.funsoft.hmm.web.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.commons.codec.binary.Base64; // commons-codec.jar

/**
 * 비밀번호 인코딩
 * 
 * @author hgko
 *
 */
public class EncryptUtil {

	/**
	 * 인자로 주어진 비밀번호의 md5 해쉬값을 구하고 이것을 Base64로 인코딩하여 리턴한다.
	 * 
	 * @param pass_
	 * @return
	 */
	public static String makeMD5Password(byte[] pass) {

		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(pass);
			return new String(Base64.encodeBase64(md.digest())); // spring lib의 메소드
		} catch (NoSuchAlgorithmException e) {
			return null;
		}
	}

	/**
	 * 문자열을 MD5 해쉬 값으로 수정한다.
	 * 
	 * @param pwd 비밀번호
	 * @return MD5 해쉬 문자열
	 */
	public static String stringToMD5(final String pwd) {
		
		StringBuilder sb = new StringBuilder();

		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			md5.reset();
			md5.update(pwd.getBytes());

			byte[] byteHash = md5.digest();

			for (int i = 0; i < byteHash.length; i++) {
				sb.append(Integer.toHexString(0xFF & byteHash[i]));
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return sb.toString();
	}
}