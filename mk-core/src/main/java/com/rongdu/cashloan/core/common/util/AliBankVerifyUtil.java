package com.rongdu.cashloan.core.common.util;

import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;

/**
 * 银行卡四要素认证
 * @author Administrator
 *
 */
public class AliBankVerifyUtil {

	public static void main(String[] args) {
	    String host = "https://aliyun-bankcard-verify.apistore.cn";
	    String path = "/bank";
	    String method = "GET";
	    String appcode = "9e3e9758109e48bba3f40a73478635e6";
	    Map<String, String> headers = new HashMap<String, String>();
	    //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
	    headers.put("Authorization", "APPCODE " + appcode);
	    Map<String, String> querys = new HashMap<String, String>();
	    querys.put("Mobile", "18500780787");
	    querys.put("bankcard", "6217000010058841191");
	    querys.put("cardNo", "370725199004204394");
	    querys.put("realName", "滕禄东");

	    try {
	    	/**
	    	* 重要提示如下:
	    	* HttpUtils请从
	    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
	    	* 下载
	    	*
	    	* 相应的依赖请参照
	    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
	    	*/
	    	HttpResponse response = AliHttpUtils.doGet(host, path, method, headers, querys);
	    	System.out.println(response.toString());
	    	//获取response的body
	    	System.out.println(EntityUtils.toString(response.getEntity()));
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	}
	
	/**
	 * 
	 * @param Mobile 电话
	 * @param bankcard 银行卡
	 * @param cardNo 身份证
	 * @param realName 真实姓名
	 * @return
	 */
	public static String checkBank(String Mobile, String bankcard, String cardNo, String realName) {
	    String host = "https://aliyun-bankcard-verify.apistore.cn";
	    String path = "/bank";
	    String method = "GET";
	    String appcode = "9e3e9758109e48bba3f40a73478635e6";
	    Map<String, String> headers = new HashMap<String, String>();
	    //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
	    headers.put("Authorization", "APPCODE " + appcode);
	    Map<String, String> querys = new HashMap<String, String>();
	    querys.put("Mobile", Mobile);
	    querys.put("bankcard", bankcard);
	    querys.put("cardNo", cardNo);
	    querys.put("realName", realName);

	    try {
	    	/**
	    	* 重要提示如下:
	    	* HttpUtils请从
	    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
	    	* 下载
	    	*
	    	* 相应的依赖请参照
	    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
	    	*/
	    	HttpResponse response = AliHttpUtils.doGet(host, path, method, headers, querys);
	    	System.out.println(response.toString());
	    	//获取response的body
	    	String result = EntityUtils.toString(response.getEntity());
	    	System.out.println(result);
	    	return result;
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    return null;
	}
}
