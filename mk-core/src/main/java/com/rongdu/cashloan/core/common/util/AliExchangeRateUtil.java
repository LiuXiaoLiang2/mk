package com.rongdu.cashloan.core.common.util;

import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.apache.ibatis.annotations.ResultMap;

import com.alibaba.fastjson.JSON;
import com.rongdu.cashloan.core.common.context.Global;

/**
 * 查询汇率
 * @author Administrator
 *
 */
public class AliExchangeRateUtil {

	public static String getRate(){
		String host = "http://jisuhuilv.market.alicloudapi.com";
	    String path = "/exchange/convert";
	    String method = "GET";
	   String appcode = "9e3e9758109e48bba3f40a73478635e6";
	   // String appcode = Global.getValue("ali_rate_key");
	    Map<String, String> headers = new HashMap<String, String>();
	    //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
	    headers.put("Authorization", "APPCODE " + appcode);
	    Map<String, String> querys = new HashMap<String, String>();
	    querys.put("amount", "1");
	    querys.put("from", "USD");
	    querys.put("to", "CNY");
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
	    	System.out.println();
	    	String rate = EntityUtils.toString(response.getEntity());
	    	
	    	Map<String, Object> dataMap = (Map<String, Object>) JSON.parse(rate);
			if("0".equals(dataMap.get("status").toString())){
				Map<String, Object> resultMap = (Map<String, Object>) JSON.parse(dataMap.get("result").toString());
				System.out.println(resultMap.get("rate"));
				return resultMap.get("rate").toString();
			}
	    	
	    	return null;
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    return null;
	}
	
	public static void main(String[] args) {
		String rate = getRate();
		
		System.out.println(rate);
	}
}
