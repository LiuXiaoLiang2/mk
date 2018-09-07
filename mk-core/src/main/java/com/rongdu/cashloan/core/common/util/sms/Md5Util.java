package com.rongdu.cashloan.core.common.util.sms;

import java.security.MessageDigest;

/**
 * MD5加密工具
 * 
 * @author heyp
 *
 */
public class Md5Util {

	private static MessageDigest md5 = null;

	static {
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	/**
	 * 获取一个String的md5值（32位大写）
	 * 
	 * @author heyp
	 * @param str
	 * @return
	 */
	public static String getMd5(String str) {
		byte[] bs = md5.digest(str.getBytes());
		StringBuilder sb = new StringBuilder(40);
		for (byte x : bs) {
			if ((x & 0xff) >> 4 == 0) {
				sb.append("0").append(Integer.toHexString(x & 0xff));
			} else {
				sb.append(Integer.toHexString(x & 0xff));
			}
		}
		return sb.toString().toUpperCase();
	}
}
