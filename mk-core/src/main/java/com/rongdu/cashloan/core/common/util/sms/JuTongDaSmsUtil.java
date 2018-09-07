package com.rongdu.cashloan.core.common.util.sms;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;


import org.apache.commons.lang.StringUtils;


public class JuTongDaSmsUtil {
	
	//用户uid
	public static String uid = "202225";
	//密码
	public static String password="698933";
	//普通群发短信url
	public static String nomalUrl = "http://119.90.36.56:8090/jtdsms/smsSend.do";
	
	
/*	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String uid="202225";
		String pwd="698933";
		String moblies="18515079373,15011576851,18664351171";
		String content="【短贷王】您验证码是6666";
		String ext="";
		String attime="";
		String result = JuTongDaSmsUtil.smsSend(uid, pwd, moblies, content, ext, attime);
		System.out.println("result="+result);
	}
	*/
	
	//发送短信
	public static String smsSend(String mobile, String content, String ext, String attime) {
		String errMess = "";
		StringBuffer sendData = new StringBuffer("");
		try {
			sendData.append("uid=").append(uid);	// 用户名
			String pwd = Md5Util.getMd5(password);//原始密码做MD5加密，32位大写格式		
			sendData.append("&password=").append(pwd);	// 密码
			
			sendData.append("&encode=").append("utf8");	// encode=GBK或者encode=utf8
			String contentBase64 = Base64.getEncoder().encodeToString(content.getBytes("utf8"));// 先用encode中定义的格式编码，再用base64加密内容
			sendData.append("&encodeType=base64");	// 固定
			sendData.append("&content=").append(contentBase64);	// base64加密后的内容
			
			sendData.append("&mobile=").append(mobile);	// 手机号
//			sendData.append("&cid=").append("45955855252252555");	// 唯一标识，选填，如果不填系统自动生成作为当前批次的唯一标识
			if(!StringUtils.isEmpty(ext)){
				sendData.append("&extNumber=").append(ext);	// 扩展
			}
			
			if(!StringUtils.isEmpty(attime)){
				sendData.append("&schtime=").append(attime);	// 定时时间，选填，格式2008-06-09 12:00:00
			}
			errMess =sendPost(nomalUrl, sendData.toString());//普通短信
		} catch (Exception e) {
			errMess = "-601";
		}	
		return errMess;
	}
	
	
	public static String sendPost(String url, String param) {
		PrintWriter out = null;
		BufferedReader in = null;
		String result = "";
		try {
			URL realUrl = new URL(url);
			// 打开和URL之间的连接
			URLConnection conn = realUrl.openConnection();
			// 设置通用的请求属性
			conn.setRequestProperty("accept", "*/*");
			conn.setRequestProperty("connection", "Keep-Alive");
			conn.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
			// 发送POST请求必须设置如下两行
			conn.setDoOutput(true);
			conn.setDoInput(true);
			// 获取URLConnection对象对应的输出流
			out = new PrintWriter(conn.getOutputStream());
			// 发送请求参数
			out.print(param);
			// flush输出流的缓冲
			out.flush();
			// 定义BufferedReader输入流来读取URL的响应
			in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
				result += line;
			}
		} catch (Exception e) {
			System.out.println("发送 POST 请求出现异常！" + e);
			e.printStackTrace();
		}
		// 使用finally块来关闭输出流、输入流
		finally {
			try {
				if (out != null) {
					out.close();
				}
				if (in != null) {
					in.close();
				}
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
		return result;
	}
}

