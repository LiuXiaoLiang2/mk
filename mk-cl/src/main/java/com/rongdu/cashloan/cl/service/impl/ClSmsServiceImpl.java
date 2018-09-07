package com.rongdu.cashloan.cl.service.impl;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.SimpleHttpConnectionManager;
import org.apache.commons.httpclient.URI;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpClientParams;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.rongdu.cashloan.cl.domain.Sms;
import com.rongdu.cashloan.cl.domain.SmsTpl;
import com.rongdu.cashloan.cl.mapper.SmsMapper;
import com.rongdu.cashloan.cl.mapper.SmsTplMapper;
import com.rongdu.cashloan.cl.monitor.BusinessExceptionMonitor;
import com.rongdu.cashloan.cl.service.ClSmsService;
import com.rongdu.cashloan.core.common.context.Global;
import com.rongdu.cashloan.core.common.mapper.BaseMapper;
import com.rongdu.cashloan.core.common.service.impl.BaseServiceImpl;
import com.rongdu.cashloan.core.common.util.DateUtil;
import com.rongdu.cashloan.core.common.util.StringUtil;
import com.rongdu.cashloan.core.common.util.sms.ChangZhuoSmsUtil;
import com.rongdu.cashloan.core.common.util.sms.huaxin.HuaXinSmsUtil;
import com.rongdu.cashloan.core.domain.User;
import com.rongdu.cashloan.core.mapper.UserBaseInfoMapper;
import com.rongdu.cashloan.core.mapper.UserMapper;

import credit.Header;
import smscredit.SmsCreditRequest;

@Service("clSmsService")
public class ClSmsServiceImpl extends BaseServiceImpl<Sms, Long> implements ClSmsService {

	public static final Logger logger = LoggerFactory.getLogger(ClSmsServiceImpl.class);

	@Resource
	private SmsMapper smsMapper;
	@Resource
	private SmsTplMapper smsTplMapper;
	@Resource
	private UserMapper userMapper;
	@Resource
	private UserBaseInfoMapper userBaseInfoMapper;

	@Override
	public BaseMapper<Sms, Long> getMapper() {
		return smsMapper;
	}

	@Override
	public long findTimeDifference(String phone, String type) {
		int countdown = Global.getInt("sms_countdown");
		Map<String, Object> data = new HashMap<>();
		data.put("phone", phone);
		data.put("smsType", type);
		Sms sms = smsMapper.findTimeMsg(data);
		long times = 0;
		if (sms != null) {
			Date d1 = sms.getSendTime();
			Date d2 = DateUtil.getNow();
			long diff = d2.getTime() - d1.getTime();
			if (diff < countdown * 1000) {
				times = countdown - (diff / 1000);
			} else {
				times = 0;
			}
		}
		return times;
	}

	@Override
	public int countDayTime(String phone, String type) {
		String mostTimes = Global.getValue("sms_day_most_times");
		int mostTime = JSONObject.parseObject(mostTimes).getIntValue(type);

		Map<String, Object> data = new HashMap<>();
		data.put("phone", phone);
		data.put("smsType", type);
		int times = smsMapper.countDayTime(data);

		return mostTime - times;
	}

	@Override
	public String sendSms(String phone, String type) {
		logger.info("准备发送短信，phone：" + phone + "， type：" + type);
		Map<String, Object> search = new HashMap<>();
		search.put("type", type);
		search.put("state", "10");
		SmsTpl tpl = smsTplMapper.findSelective(search);
		if (tpl != null) {
			Map<String, Object> payload = new HashMap<>();
			int vcode = (int) (Math.random() * 9000) + 1000;
			payload.put("mobile", phone);
			String sms_passageway = Global.getValue("sms_passageway");
			if("40".equals(sms_passageway)){
				payload.put("message", change(type).replace("@", vcode+""));
			} else {
				payload.put("message", change(type) + vcode);
			}
			payload.put("code", vcode+"");
			String result = sendCode(payload, tpl.getNumber(), type);
			logger.debug("发送短信，phone：" + phone + "， type：" + type + "，同步响应结果：" + result);
			return result(result, phone, type, vcode);
		}
		logger.error("发送短信，phone：" + phone + "， type：" + type + "，没有获取到smsTpl");
		return null;
	}


	public int verifySms(String phone, String type, String code) {
		if ("dev".equals(Global.getValue("app_environment")) && "0000".equals(code)) {
			return 1;
		}

		if (StringUtil.isBlank(phone) || StringUtil.isBlank(type) || StringUtil.isBlank(code)) {
			return 0;
		}

		if (!StringUtil.isPhone(phone)) {
			return 0;
		}

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("phone", phone);
		data.put("smsType", type);
		Sms sms = smsMapper.findTimeMsg(data);
		if (sms != null) {
			String mostTimes = Global.getValue("sms_day_most_times");
			int mostTime = JSONObject.parseObject(mostTimes).getIntValue("verifyTime");

			data = new HashMap<>();
			data.put("verifyTime", sms.getVerifyTime() + 1);
			data.put("id", sms.getId());
			smsMapper.updateSelective(data);

			if("extract".equals(type) && sms.getVerifyTime() >= mostTime){
				return 10;
			}
			
			if (StringUtil.equals("20", sms.getState()) || sms.getVerifyTime() > mostTime) {
				return 0;
			}

			long timeLimit = Long.parseLong(Global.getValue("sms_time_limit"));

			Date d1 = sms.getSendTime();
			Date d2 = DateUtil.getNow();
			long diff = d2.getTime() - d1.getTime();
			if (diff > timeLimit * 60 * 1000) {
				return -1;
			}
			if (sms.getCode().equals(code)) {
				Map<String, Object> map = new HashMap<>();
				map.put("id", sms.getId());
				map.put("state", "20");
				smsMapper.updateSelective(map);
				return 1;
			}
		}
		return 0;
	}

	protected String changeMessage(String smsType, Map<String, Object> map) {
		String message = "";
		if ("overdue".equals(smsType)) {
			message = ret(smsType);
			message = message
					.replace("{$name}",
							StringUtil
									.isNull(map
											.get("name")))
					.replace("{$platform}",
							DateUtil.dateStr(
									DateUtil.valueOf(DateUtil.dateStr(DateUtil.valueOf(map.get("platform").toString()),
											DateUtil.DATEFORMAT_STR_002)),
									"M月dd日"))
					.replace("{$loan}",
							StringUtil.isNull(map.get("loan")))
					.replace("{$time}",
							DateUtil.dateStr(
									DateUtil.valueOf(DateUtil.dateStr(DateUtil.valueOf(map.get("time").toString()),
											DateUtil.DATEFORMAT_STR_002)),
									"M月dd日"))
					.replace("{$overdueDay}", StringUtil.isNull(map.get("overdueDay")))
					.replace("{$amercement}", StringUtil.isNull(map.get("amercement")));
		}
		if ("loanInform".equals(smsType)) {
			message = ret(smsType);
			message = message.replace("{$time}", DateUtil.dateStr(DateUtil.valueOf(
					DateUtil.dateStr(DateUtil.valueOf(map.get("time").toString()), DateUtil.DATEFORMAT_STR_002)),
					"M月dd日"));
		}
		if ("repayInform".equals(smsType)) {
			message = ret(smsType);
			message = message.replace("{$time}",
					DateUtil.dateStr(DateUtil.valueOf(DateUtil.dateStr(DateUtil.valueOf(map.get("time").toString()),
							DateUtil.DATEFORMAT_STR_002)), "M月dd日"))
					.replace("{$loan}", StringUtil.isNull(map.get("loan")));
		}
		if ("repayBefore".equals(smsType)) {
			message = ret(smsType);
			message = message
					.replace("{$loan}",
							StringUtil.isNull(map.get("loan")))
					.replace("{$time}",
							DateUtil.dateStr(
									DateUtil.valueOf(DateUtil.dateStr(DateUtil.valueOf(map.get("time").toString()),
											DateUtil.DATEFORMAT_STR_002)),
									"M月dd日"))
					.replace("{$name}", StringUtil.isNull(map.get("name")))
					.replace("{$cardNo}", StringUtil.isNull(map.get("cardNo")))
					.replace("{$bankCardNo}", StringUtil.isNull(map.get("bankCardNo")));
		}
		if ("offlineAlipay".equals(smsType)) {
			message = ret(smsType);
			message = message
					.replace("{$loan}",
							StringUtil.isNull(map.get("loan")))
					.replace("{$time}",
							DateUtil.dateStr(
									DateUtil.valueOf(DateUtil.dateStr(DateUtil.valueOf(map.get("time").toString()),
											DateUtil.DATEFORMAT_STR_002)),
									"M月dd日"))
					.replace("{$name}", StringUtil.isNull(map.get("name")))
					.replace("{$title}", StringUtil.isNull(map.get("title")))
					.replace("{$bankAccount}", StringUtil.isNull(map.get("bankAccount")))
					.replace("{$bankInfo}", StringUtil.isNull(map.get("bankInfo")))
					.replace("{$alipayAccount}", StringUtil.isNull(map.get("alipayAccount")))
					.replace("{$company}", StringUtil.isNull(map.get("company")));
		}
		if ("offlineBank".equals(smsType)) {
			message = ret(smsType);
			message = message
					.replace("{$loan}",
							StringUtil.isNull(map.get("loan")))
					.replace("{$time}",
							DateUtil.dateStr(
									DateUtil.valueOf(DateUtil.dateStr(DateUtil.valueOf(map.get("time").toString()),
											DateUtil.DATEFORMAT_STR_002)),
									"M月dd日"))
					.replace("{$name}", StringUtil.isNull(map.get("name")))
					.replace("{$company}", StringUtil.isNull(map.get("company")))
					.replace("{$title}", StringUtil.isNull(map.get("title")))
					.replace("{$bankAccount}", StringUtil.isNull(map.get("bankAccount")))
					.replace("{$bankInfo}", StringUtil.isNull(map.get("bankInfo")));
		}
		return message;
	}

	public String change(String code) {
		String message = null;
		if ("register".equals(code)) {
			message = ret("register");
		} else if ("findReg".equals(code)) {
			message = ret("findReg");
		} else if ("bindCard".equals(code)) {
			message = ret("bindCard");
		} else if ("findPay".equals(code)) {
			message = ret("findPay");
		} else if ("overdue".equals(code)) {
			message = ret("overdue");
		} else if ("loanInform".equals(code)) {
			message = ret("loanInform");
		} else if ("repayInform".equals(code)) {
			message = ret("repayInform");
		} else if ("repayBefore".equals(code)) {
			message = ret("repayBefore");
		} else if ("extract".equals(code)) {
			message = ret("extract");
		}
		return message;
	}

	public String ret(String type) {
		Map<String, Object> search = new HashMap<>();
		search.put("type", type);
		SmsTpl tpl = smsTplMapper.findSelective(search);
		return tpl.getTpl();
	}

	private String result(String result, String phone, String type, int vcode) {
		String msg = null;
		JSONObject resultJson = JSONObject.parseObject(result);

		String sms_passageway = Global.getValue("sms_passageway");
		
		if (StringUtil.isNotBlank(resultJson)) {
			Integer code = null;
			if(!"40".equals(sms_passageway)){
				code = resultJson.getInteger("code") != null ? resultJson.getInteger("code") : resultJson.getInteger("status");
			}
			logger.debug("发送短信，phone：" + phone + "， type：" + type + "，保存sms时code：" + code);
			Date now = DateUtil.getNow();
			Sms sms = new Sms();
			sms.setPhone(phone);
			sms.setSendTime(now);
			sms.setRespTime(now);
			sms.setSmsType(type);
			sms.setVerifyTime(0);
			// 大圣
			if ("10".equals(sms_passageway) && code == 200) {
				JSONObject resJson = JSONObject.parseObject(StringUtil.isNull(resultJson.get("res")));
				JSONObject tempJson = JSONObject.parseObject(StringUtil.isNull(resultJson.get("tempParame")));
				String orderNo = StringUtil.isNull(resultJson.get("orderNo"));
				Integer tempCode = tempJson.getInteger("code");
				sms.setContent(resJson.getString("result"));
				sms.setResp("短信发送中");
				sms.setCode(StringUtil.isNull(tempCode));
				sms.setOrderNo(orderNo);
				sms.setState("30");
				int ms = smsMapper.save(sms);
				if (ms > 0) {
					msg = orderNo;
				}
			}
			// 畅卓
			if ("30".equals(sms_passageway) && code == 0 && resultJson.getInteger("mobileCount") > 0) {
				String taskId = resultJson.getString("taskId");
				sms.setContent(result);
				sms.setResp(resultJson.getString("desc"));
				sms.setCode(StringUtil.isNull(vcode));
				sms.setOrderNo(taskId);
				sms.setState("30");
				int ms = smsMapper.save(sms);
				if (ms > 0) {
					msg = taskId;
				}
			} else if("30".equals(sms_passageway) && code != 0){
				sms.setContent(result);
				sms.setResp("短信发送失败");
				sms.setCode("");
				sms.setOrderNo("");
				sms.setState("20");
				smsMapper.save(sms);
				BusinessExceptionMonitor.add(BusinessExceptionMonitor.TYPE_18, phone, resultJson.getString("desc"));
			}
			
			//华信短信
			if ("40".equals(sms_passageway) && resultJson.getInteger("StatusCode") == 1 && resultJson.getInteger("SuccessCounts") == 1) {
				String taskId = resultJson.getString("MsgId");
				sms.setContent(result);
				sms.setResp(resultJson.getString("Description"));
				sms.setCode(StringUtil.isNull(vcode));
				sms.setOrderNo(taskId);
				sms.setState("30");
				int ms = smsMapper.save(sms);
				if (ms > 0) {
					msg = taskId;
				}
			} else if("40".equals(sms_passageway) && resultJson.getInteger("StatusCode") != 1){
				sms.setContent(result);
				sms.setResp("短信发送失败");
				sms.setCode("");
				sms.setOrderNo("");
				sms.setState("20");
				smsMapper.save(sms);
				BusinessExceptionMonitor.add(BusinessExceptionMonitor.TYPE_18, phone, resultJson.getString("desc"));
			}
			
		}
		return msg;
	}

	/**
	 * 判断短信发送渠道，默认大圣数据短信渠道
	 * 
	 * register, 		注册验证码
	 * overdue, 		逾期催收	
	 * loanInform, 		放款通知
	 * repayInform, 	还款通知
	 * repayBefore, 
	 * offlineAlipay, 
	 * offlineBank
	 * findReg			找回登陆密码
	 * 
	 */
	private String sendCode(Map<String, Object> payload, String smsNo, String type) {
		String sms_passageway = Global.getValue("sms_passageway");
		if (StringUtil.isBlank(sms_passageway)) {
			sms_passageway = "10";
		}

		if ("10".equals(sms_passageway)) {
			return dsSendSms(payload, smsNo);
		}

		if ("20".equals(sms_passageway)) {
			String cl_sms_value = Global.getValue("cl_sms_value");
			@SuppressWarnings("unchecked")
			Map<String, Object> smsMap = JSONObject.parseObject(cl_sms_value, Map.class);
			payload.putAll(smsMap);
			if (payload.containsKey("url") && payload.containsKey("un") && payload.containsKey("pw")
					&& payload.containsKey("mobile") && payload.containsKey("message") && payload.containsKey("rd")
					&& payload.containsKey("ex")) {
				return clSendSms(payload);
			}
		}

		if ("30".equals(sms_passageway)) {
			String mobile = (String) payload.get("mobile");
			String content = (String) payload.get("message");
			return ChangZhuoSmsUtil.czSendSms(mobile, content);
		}
		/**
		 * 使用华信短信
		 */
		if ("40".equals(sms_passageway)) {
			String mobile = (String) payload.get("mobile");
			String content = (String) payload.get("message");
			return HuaXinSmsUtil.sendSms(mobile, content);
		}
		return "";
	}

	/**
	 * 创蓝短信
	 * 
	 * @param url
	 *            应用地址，类似于http://ip:port/msg/
	 * @param un
	 *            账号
	 * @param pw
	 *            密码
	 * @param phone
	 *            手机号码，多个号码使用","分割
	 * @param msg
	 *            短信内容
	 * @param rd
	 *            是否需要状态报告，需要1，不需要0
	 */
	private String clSendSms(Map<String, Object> payload) {
		HttpClient client = new HttpClient(new HttpClientParams(), new SimpleHttpConnectionManager(true));
		GetMethod method = new GetMethod();
		String returnStr = "";
		try {
			URI base = new URI((String) payload.get("url"), false);
			method.setURI(new URI(base, "send", false));
			method.setQueryString(new NameValuePair[] { new NameValuePair("un", (String) payload.get("un")),
					new NameValuePair("pw", (String) payload.get("pw")),
					new NameValuePair("phone", (String) payload.get("mobile")),
					new NameValuePair("rd", (String) payload.get("rd")),
					new NameValuePair("msg", (String) payload.get("message")),
					new NameValuePair("ex", (String) payload.get("ex")), });
			int result = client.executeMethod(method);
			if (result == HttpStatus.SC_OK) {
				InputStream in = method.getResponseBodyAsStream();
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				byte[] buffer = new byte[1024];
				int len = 0;
				while ((len = in.read(buffer)) != -1) {
					baos.write(buffer, 0, len);
				}
				returnStr = URLDecoder.decode(baos.toString(), "UTF-8");
			} else {
				throw new Exception("HTTP ERROR Status: " + method.getStatusCode() + ":" + method.getStatusText());
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		} finally {
			method.releaseConnection();
		}
		return returnStr;
	}

	// 大圣短信
	private String dsSendSms(Map<String, Object> payload, String smsNo) {
		final String APIKEY = Global.getValue("apikey");
		final String SECRETKEY = Global.getValue("secretkey");
		final String APIHOST = Global.getValue("sms_apihost");// 发送地址
		final String channelNo = Global.getValue("sms_channelNo");// 渠道编号
		final String interfaceName = Global.getValue("sms_interfaceName");// 接口名称

		long timestamp = new Date().getTime();
		Header header = new Header(APIKEY, channelNo, interfaceName, timestamp);
		SmsCreditRequest creditRequest = new SmsCreditRequest(APIHOST, header, smsNo);

		creditRequest.setPayload(payload);
		creditRequest.signByKey(SECRETKEY);
		String result = null;
		try {
			result = creditRequest.request();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return result;
	}

	@Override
	public int findUser(String phone) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("loginName", phone);
		User user = userMapper.findSelective(paramMap);
		if (StringUtil.isNotBlank(user)) {
			return 1;
		}
		return 0;
	}


	@Override
	public Page<Sms> list(Map<String, Object> params, int currentPage, int pageSize) {
		PageHelper.startPage(currentPage, pageSize);
		List<Sms> list = smsMapper.listSelective(params);
		if (list != null && list.size() > 0) {
			int flag = 0;
			for (int i = 0; i < list.size(); i++) {
				if ("30".equals(list.get(i).getState())) {
					flag++;
					// getReportByOrderNo(list.get(i).getOrderNo(), list.get(i).getPhone(), "");
				}
			}
			if (flag != 0) {
				// 再次调用数据库查询,还需要加上pageHelper
				PageHelper.startPage(currentPage, pageSize);
				list = smsMapper.listSelective(params);
			}
		}
		return (Page<Sms>) list;
	}

	@SuppressWarnings("unused")
	@Override
	public void getReportByOrderNo(final String orderNo, final String userPhone, final String type) {
		Thread t = new Thread(new Runnable() {
			public void run() {
				Integer code = 201;
				int i = 0;
				while (code == 201 && i < 6) {// 轮询60秒，每10秒查询一次，直到code不等于201
					i++;
					// 获取报告前休眠10秒
					try {
						Thread.sleep(10000);
					} catch (InterruptedException e1) {
						e1.printStackTrace();
					}
					// 获取短信报告
					final String APIHOST = Global.getValue("sms_apihost_report");// 发送地址
					HttpGet request = new HttpGet(APIHOST + "/" + orderNo);
					CloseableHttpClient httpClient = HttpClientBuilder.create().build();
					HttpClients.createDefault();
					HttpResponse httpResponse;
					String result = null;
					try {
						httpResponse = httpClient.execute(request);
						if (httpResponse.getStatusLine().getStatusCode() == 200) {
							HttpEntity httpEntity = httpResponse.getEntity();
							result = EntityUtils.toString(httpEntity);
						}
						httpClient.close();
					} catch (ClientProtocolException e) {
						logger.error(e.getMessage(), e);
					} catch (IOException e) {
						logger.error(e.getMessage(), e);
					}
					JSONObject resultJson = JSONObject.parseObject(result);
					logger.info("短信发送结果" + resultJson);
					int status = 0;
					if (StringUtil.isNotBlank(resultJson)) {
						code = resultJson.getInteger("code");
						logger.info("code:" + code);
						if (code == 200) {
							JSONArray array = JSON.parseArray(StringUtil.isNull(resultJson.get("data")));
							for (Object json : array) {
								JSONObject dataJson = JSONObject.parseObject(json.toString());
								Date reporyTime = dataJson.getDate("reportTime");
								status = dataJson.getIntValue("status");
								String reportMessage = dataJson.getString("reportMessage");
								String phone = dataJson.getString("mobile");
								Map<String, Object> paramMap = new HashMap<>();
								if (status == 1) {
									paramMap.put("orderNo", orderNo);
									paramMap.put("resp", "短信已发送");
									paramMap.put("state", "10");
									smsMapper.updateByOrderNo(paramMap);
									logger.error("发送短信，phone：" + userPhone + "， type：" + type + "，发送成功");
								} else {
									paramMap.put("orderNo", orderNo);
									paramMap.put("resp", "短信发送失败");
									paramMap.put("state", "30");
									smsMapper.updateByOrderNo(paramMap);
									logger.error("发送短信，phone：" + userPhone + "， type：" + type + "，发送失败");
								}

							}
						} else {
							if (code == 201) {
								logger.info("短信报告获取结果：短信报告尚未获取成功");
							}
						}
					}
				}
			}

		});
		t.start();

	}

	@Override
	public boolean checkIsMotherFucker(String phone, String type) {
		String mostTimes = Global.getValue("most_regmessage_sendtimes");
		int mosttimes = Integer.parseInt(mostTimes);
		Map<String, Object> data = new HashMap<>();
		data.put("phone", phone);
		data.put("smsType", type);
		int times = smsMapper.countAllTime(data);
		return times>=mosttimes;
	}

}
