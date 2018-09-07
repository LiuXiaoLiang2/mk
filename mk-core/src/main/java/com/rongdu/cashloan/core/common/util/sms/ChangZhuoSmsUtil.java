package com.rongdu.cashloan.core.common.util.sms;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.rongdu.cashloan.core.common.context.Global;

/**
 * 畅卓短信发送工具类
 * 
 * @author heyp
 */
public class ChangZhuoSmsUtil {
	// 短信接口账户信息
	private static String API_HOST = Global.getValue("sms_changzhuo_apihost");
	private static String APP_ID = Global.getValue("sms_changzhuo_appid");
	private static String APP_KEY = Md5Util.getMd5(Global.getValue("sms_changzhuo_appkey"));
	private static String SIGN = Global.getValue("title");

	/**
	 * 构造短信发送请求
	 * 
	 * @author heyp
	 * @param params
	 * @return
	 */
	public static String sendPostMessage(List<NameValuePair> params) {
		HttpPost request = new HttpPost(API_HOST);
		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpClients.createDefault();
		HttpResponse httpResponse;
		String result = null;
		try {
			request.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
			httpResponse = httpClient.execute(request);
			if (httpResponse.getStatusLine().getStatusCode() == 200) {
				HttpEntity httpEntity = httpResponse.getEntity();
				result = EntityUtils.toString(httpEntity);
			}
			httpClient.close();
		} catch (Exception e) {
			System.out.println("请求出现异常！" + e);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 构造post请求参数
	 * 
	 * @author heyp
	 * @return
	 */
	private static List<NameValuePair> createParam(String mobile, String content) {
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("account", Global.getValue("sms_changzhuo_appid")));
		params.add(new BasicNameValuePair("password", Md5Util.getMd5(Global.getValue("sms_changzhuo_appkey"))));
		params.add(new BasicNameValuePair("mobile", mobile));
		params.add(new BasicNameValuePair("content", content));
		params.add(new BasicNameValuePair("sendTime", ""));
		return params;
	}

	/**
	 * 发送请求主方法
	 * 
	 * @author heyp
	 */
	public static String czSendSms(String mobile, String content) {
		System.out.println("发送畅卓短信 >> mobile = "+mobile+", content = "+content);
		String result = sendPostMessage(createParam(mobile, "【" + SIGN + "】" + content));
		System.out.println("畅卓发送结果->>" + result);
		return result;
	}
}
