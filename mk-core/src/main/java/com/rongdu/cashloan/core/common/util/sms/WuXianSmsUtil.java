package com.rongdu.cashloan.core.common.util.sms;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class WuXianSmsUtil {
	
	private final static String[] strDigits = { "0", "1", "2", "3", "4", "5",
            "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };
	
	/**
	 * 发送短信
	 * @return
	 */
	public static String sendSms(String url_send_sms, String cust_code, String cust_pwd, String destMobiles, String content) throws Exception {
		
		String result = null;
		String uid = "";
        // 长号码，选填
        String sp_code = "";
        // 是否需要状态报告
        String need_report = "yes";
        // 数字签名，签名内容根据 “短信内容+客户密码”进行MD5编码后获得
		String sign = content + cust_pwd;
		sign = GetMD5Code(new String(sign.getBytes("UTF-8")));
        String json_send_sms = "{\"cust_code\":\"" + cust_code + "\",\"sp_code\":\"" + sp_code + "\",\"content\":\"" + content +
                "\",\"destMobiles\":\"" + destMobiles + "\",\"uid\":\"" + uid + "\",\"need_report\":\"" + need_report + "\",\"sign\":\"" + sign + "\"}";
		URL url = new URL(url_send_sms);
		HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
		httpURLConnection.setRequestMethod("POST");
		httpURLConnection.setDoOutput(true);
		httpURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		OutputStream out = httpURLConnection.getOutputStream();
		out.write(json_send_sms.getBytes("UTF-8"));
		InputStream inputStream = null;
		InputStreamReader inputStreamReader = null;
		BufferedReader reader = null;
		StringBuffer resultBuffer = new StringBuffer();
		String tempLine = null;
		try {
			inputStream = httpURLConnection.getInputStream();
			inputStreamReader = new InputStreamReader(inputStream, "UTF-8");
			reader = new BufferedReader(inputStreamReader);
			while ((tempLine = reader.readLine()) != null) {
				resultBuffer.append(tempLine);
			}
			result = resultBuffer.toString();
		} catch (Exception e) {
			throw e;
		} finally {
			if (reader != null) {
				reader.close();
			}
			if (inputStreamReader != null) {
				inputStreamReader.close();
			}
			if (inputStream != null) {
				inputStream.close();
			}
			httpURLConnection.disconnect();
		}
		
		return result;
	}
	
	
	
	public static String GetMD5Code(String strObj) {
        String resultString = null;
        try {
            resultString = new String(strObj);
            MessageDigest md = MessageDigest.getInstance("MD5");
            resultString = byteToString(md.digest(strObj.getBytes()));
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
        }
        return resultString;
    }
    
    private static String byteToString(byte[] bByte) {
        StringBuffer sBuffer = new StringBuffer();
        for (int i = 0; i < bByte.length; i++) {
            sBuffer.append(byteToArrayString(bByte[i]));
        }
        return sBuffer.toString();
    }
    
    private static String byteToArrayString(byte bByte) {
        int iRet = bByte;
        if (iRet < 0) {
            iRet += 256;
        }
        int iD1 = iRet / 16;
        int iD2 = iRet % 16;
        return strDigits[iD1] + strDigits[iD2];
    }

    
	
}