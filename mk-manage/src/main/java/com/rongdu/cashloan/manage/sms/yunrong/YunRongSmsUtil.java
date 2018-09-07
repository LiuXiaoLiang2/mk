package com.rongdu.cashloan.manage.sms.yunrong;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
/**
 * 云融短信工具类
 * @author Administrator
 *
 */
public class YunRongSmsUtil {

	// 表示服务器端的url
		private static String PATH = "http://101.201.238.246/MessageTransferWebAppJs/servlet/messageTransferServiceServletByXml";

		
		/*
		 * params 填写的URL的参数 encode 字节编码
		 */
		public static String sendPostMessage(String url,List<NameValuePair> params) {
			HttpPost httpRequest = new HttpPost(url);
			String strResult = "";	
			try {
				/* 添加请求参数到请求对象 */
				httpRequest.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
				/* 发送请求并等待响应 */
				HttpResponse httpResponse = new DefaultHttpClient()
						.execute(httpRequest);
				/* 若状态码为200 ok */
				if (httpResponse.getStatusLine().getStatusCode() == 200) {
					/* 读返回数据 */
				    strResult = EntityUtils.toString(httpResponse
							.getEntity());
				    System.out.println(strResult);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return strResult;
		}

		
		/*ddd
		 * 发送短信
		 */
		public static List<NameValuePair> sendMessage(String userName, String passWord, String phone, String msg) {

			List<NameValuePair> params = new ArrayList<NameValuePair>();
			params.add(new BasicNameValuePair("cmd", "sendMessage"));
			params.add(new BasicNameValuePair("userName", userName));
			params.add(new BasicNameValuePair("passWord", passWord));
			params.add(new BasicNameValuePair("phoneNumber", phone));
			params.add(new BasicNameValuePair("body", msg));
			return params;
		}
		
		/**
		 * @param args
		 */
		public static String sendMessageMethod(String url,String userName, String passWord, String phone, String msg) {
			String result = sendPostMessage(url,sendMessage(userName, passWord, phone, msg));
			return result;
		}
}
