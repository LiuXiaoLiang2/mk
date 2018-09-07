package com.rongdu.cashloan.manage.sms.chenzi;

import java.util.HashMap;
import java.util.Map;

import com.rongdu.cashloan.core.common.util.HttpUtil;

/**
 * 陈紫推荐渠道
 * 
 * @author Administrator
 *
 */
public class ChenZiSmsUtil {

	public static void main(String[] args) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("account", "ydxx88");
		params.put("pswd", "L4j3D6YZ");
		params.put("mobile", "15108785908");
		params.put("msg", "【短贷王】马彪，您好，您本期订单将于今天到期，请立即处理，避免对信用造成影响，详询：4006665910");
		params.put("product", "");
		params.put("resptype", "json");
		String doPost = HttpUtil.doPost("http://116.62.64.214/msg/HttpBatchSendSM", params);
		System.out.println(doPost);
	}

	/**
	 * 发送短信
	 * 
	 * @param url
	 * @param account
	 * @param pswd
	 * @param mobile
	 * @param msg
	 * @return
	 */
	public static String sendMessage(String url, String account, String pswd, String mobile, String msg) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("account", account);
		params.put("pswd", pswd);
		params.put("mobile", mobile);
		params.put("msg", msg);
		params.put("product", "");
		params.put("resptype", "json");
		String doPost = HttpUtil.doPost(url, params);
		return doPost;

	}
}
