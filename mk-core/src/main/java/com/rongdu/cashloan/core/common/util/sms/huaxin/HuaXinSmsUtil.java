package com.rongdu.cashloan.core.common.util.sms.huaxin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSONObject;
import com.rongdu.cashloan.core.common.context.Global;

public class HuaXinSmsUtil {

	private static HttpClient client;

	private static String url = Global.getValue("sms_huaxin_send_url");
	private static String userId = Global.getValue("sms_huaxin_uerId");
	private static String userName = Global.getValue("sms_huaxin_userName");
	private static String password = Global.getValue("sms_huaxin_password");
	
	public static String sendSms(String mobile,
			String content) {
		System.out.println(content);
		// 扩展号，没有请留空
		String ext = "";

		// 即时短信请留空，定时短信请指定，格式为：yyyy-MM-dd HH:mm:ss
		String sendTime = "";
		String stamp = new SimpleDateFormat("MMddHHmmss").format(new Date());
		String secret = MD5.GetMD5Code(password + stamp).toUpperCase();
		System.out.println(secret);

		try {

			JSONObject jsonObj = new JSONObject();
			jsonObj.put("UserName", userName);
			jsonObj.put("Stamp", stamp);
			jsonObj.put("Secret", secret);
			jsonObj.put("Moblie", mobile);
			jsonObj.put("Text", content + "【币链合约】");
			jsonObj.put("Ext", ext);
			jsonObj.put("SendTime", sendTime);

			// Des加密，base64转码
			String text64 = DesHelper.Encrypt(jsonObj.toString(), password);

			client = new SSLClient();
			HttpPost post = new HttpPost(url);
			post.setHeader("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			List<NameValuePair> nvps = new ArrayList<NameValuePair>();
			nvps.add(new BasicNameValuePair("UserId", userId));
			nvps.add(new BasicNameValuePair("Text64", text64));
			post.setEntity(new UrlEncodedFormEntity(nvps));
			HttpResponse response = client.execute(post);
			System.out.println(response.getStatusLine());

			HttpEntity entity = response.getEntity();
			String returnString = EntityUtils.toString(entity, "UTF-8");
			System.out.println("****************" + returnString);
			return returnString;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		}
	}
	
	public static void main(String[] args) {
		sendSms("15810140695", "您有一笔数字资产质押已过强平线，质押物已归质权方。【币链合约】");
	}
}
