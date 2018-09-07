package com.rongdu.cashloan.api.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rongdu.cashloan.cl.service.ClSmsService;
import com.rongdu.cashloan.core.common.context.Constant;
import com.rongdu.cashloan.core.common.context.Global;
import com.rongdu.cashloan.core.common.util.ServletUtils;
import com.rongdu.cashloan.core.common.util.StringUtil;
import com.rongdu.cashloan.core.common.web.controller.BaseController;
import com.rongdu.cashloan.core.domain.UserBaseInfo;
import com.rongdu.cashloan.core.service.CloanUserService;
import com.rongdu.cashloan.core.service.UserBaseInfoService;

import tool.util.DateUtil;

 /**
 * 短信记录Controller
 * 
 */
@Scope("prototype")
@Controller
public class SmsController extends BaseController {
	
	public static final Logger logger = LoggerFactory.getLogger(SmsController.class);

	@Resource
	private ClSmsService clSmsService;
	@Resource
	private CloanUserService cloanUserService;
	@Resource
	private UserBaseInfoService userBaseInfoService;
	
	/**
	 * 探测短信验证码是否可获取
	 * @param phone
	 * @param type
	 * @throws Exception
	 */
	@RequestMapping(value = "/api/user/probeSms.htm")
	public void probeSms(@RequestParam(value="phone") String phone, @RequestParam(value="type") String type) throws Exception {
		Map<String,Object> result = new HashMap<String,Object>();
		Map<String,Object> data = new HashMap<String,Object>();
		if(StringUtil.isBlank(phone) || StringUtil.isBlank(type)){
			data.put("message", "参数不能为空");
			result.put(Constant.RESPONSE_DATA, data);
			result.put(Constant.RESPONSE_CODE, Constant.FAIL_CODE_VALUE);
			result.put(Constant.RESPONSE_CODE_MSG, "探测失败");
		} else if(!StringUtil.isPhone(phone)){
			data.put("message", "手机号码格式有误");
			result.put(Constant.RESPONSE_DATA, data);
			result.put(Constant.RESPONSE_CODE, Constant.FAIL_CODE_VALUE);
			result.put(Constant.RESPONSE_CODE_MSG, "探测失败");
		} else {
			long countDown = clSmsService.findTimeDifference(phone, type);
			data.put("countDown", countDown);
			if (countDown == 0) {
				data.put("state", 10);
			} else {
				data.put("state", 20);
			}
			result.put(Constant.RESPONSE_DATA, data);
			result.put(Constant.RESPONSE_CODE, Constant.SUCCEED_CODE_VALUE);
			result.put(Constant.RESPONSE_CODE_MSG, "探测成功");
		}
		ServletUtils.writeToResponse(response,result);
	}
	 
	/**
	 * 获取短信验证码
	 * @param phone
	 * @param type
	 * @throws Exception
	 */
	@RequestMapping(value = "/api/user/sendSms.htm")
	public void sendSms(@RequestParam(value="phone") String phone, 
			@RequestParam(value="type") String type) throws Exception {
		Map<String,Object> resultMap = new HashMap<String,Object>();
		Map<String,Object> data = new HashMap<String,Object>();
		String message = this.check(phone, type);
		if (StringUtil.isBlank(message)) {
			long countDown = clSmsService.findTimeDifference(phone, type);
			if (countDown != 0) {
				data.put("countDown", countDown);
				data.put("state", "20");
				message = "获取短信验证码过于频繁，请稍后再试";
				logger.info("发送短信，phone：" + phone + "， type：" + type + "，发送前的校验结果message：" + message);
			} else {
				if(!userBaseInfoService.isBlacklist(phone)){
					logger.info("发送短信，phone：" + phone + "， type：" + type + "，准备发送");
					String orderNo = clSmsService.sendSms(phone, type);
					if (StringUtil.isNotBlank(orderNo)) {
						String sms_passageway = Global.getValue("sms_passageway");
						if("10".equals(sms_passageway)){  // 大圣
							clSmsService.getReportByOrderNo(orderNo, phone, type);
						}
						
						data.put("state", "10");
						resultMap.put(Constant.RESPONSE_DATA, data);
						resultMap.put(Constant.RESPONSE_CODE, Constant.SUCCEED_CODE_VALUE);
						resultMap.put(Constant.RESPONSE_CODE_MSG, "已发送，请注意查收");
					} else {
						resultMap.put(Constant.RESPONSE_CODE, Constant.FAIL_CODE_VALUE);
						resultMap.put(Constant.RESPONSE_CODE_MSG, "发送失败");
					}
				}else{
					data.put("state", "20");
					message = "由于验证码输入次数过多，您已被加入黑名单，请联系客服解决";
					logger.info("发送短信，phone：" + phone + "， type：" + type + "，发送前的校验结果message：" + message);
				}
				
			}
		}
		if (StringUtil.isNotBlank(message)) {
			logger.info("发送短信，phone：" + phone + "， type：" + type + "，发送前的校验结果message：" + message);
			data.put("state", "20");
			data.put("message", message);
			resultMap.put(Constant.RESPONSE_DATA, data);
			resultMap.put(Constant.RESPONSE_CODE, Constant.SUCCEED_CODE_VALUE);
			resultMap.put(Constant.RESPONSE_CODE_MSG, "发送失败");
		}
		
		
		ServletUtils.writeToResponse(response,resultMap);
	}
	
	/**
	 * 短信验证
	 * @param phone
	 * @param code
	 * @throws Exception
	 */
	@RequestMapping(value = "/api/user/verifySms.htm")
	public void verifyMsg(
			@RequestParam(value="phone") String phone,
			@RequestParam(value="type") String type,
			@RequestParam(value="vcode") String code
			) throws Exception {
		int msg = clSmsService.verifySms(phone, type, code);
		Map<String,Object> result = new HashMap<String,Object>();
		Map<String,Object> data = new HashMap<String,Object>();
		if (msg == 1) {
			data.put("state", "10");
			result.put(Constant.RESPONSE_DATA, data);
			result.put(Constant.RESPONSE_CODE, Constant.SUCCEED_CODE_VALUE);
			result.put(Constant.RESPONSE_CODE_MSG, "验证成功");
		} else if(msg == -1){
			data.put("message", "验证码已过期");
			data.put("state", "20");
			result.put(Constant.RESPONSE_DATA, data);
			result.put(Constant.RESPONSE_CODE, Constant.SUCCEED_CODE_VALUE);
			result.put(Constant.RESPONSE_CODE_MSG, "验证失败");
		} else {
			data.put("message", "手机号码或验证码错误");
			data.put("state", "20");
			result.put(Constant.RESPONSE_DATA, data);
			result.put(Constant.RESPONSE_CODE, Constant.SUCCEED_CODE_VALUE);
			result.put(Constant.RESPONSE_CODE_MSG, "验证失败");
		}
		ServletUtils.writeToResponse(response,result);
	}
	
	/**
	 * 网页注册发送短信
	 */
	@RequestMapping(value = "/api/user/h5SendSms.htm")
	public void h5SendSms(){
		String code = request.getParameter("code");
		String phone = request.getParameter("phone");
		String type = request.getParameter("type");
		
		HttpSession session = request.getSession();
	    String randomCode = (String) session.getAttribute("randomCode");
	    
		long countDown = 0;
		Map<String,Object> resultMap = new HashMap<String,Object>();
		String result = null;
			
		result = this.check(phone, type);
		
		if(code == null || !code.equals(randomCode)){
			result = "noCode";
	    }
		
		if (result == null) {
			if (type.equals("register")) {
				countDown = clSmsService.findTimeDifference(phone, type);
				if (countDown != 0) {
					result = "获取短信验证码过于频繁，请稍后再试";
				} else {
					logger.info("H5页面发送注册短信，phone："+phone);
					String orderNo = clSmsService.sendSms(phone, type);
					if (StringUtil.isNotBlank(orderNo)) {
						String sms_passageway = Global.getValue("sms_passageway");
						if("10".equals(sms_passageway)){  // 大圣
							clSmsService.getReportByOrderNo(orderNo, phone, type);
						}
						
						resultMap.put(Constant.RESPONSE_CODE, Constant.SUCCEED_CODE_VALUE);
						resultMap.put(Constant.RESPONSE_CODE_MSG, "已发送，请注意查收");
						
						session.removeAttribute("randomCode");
					} else {
						resultMap.put(Constant.RESPONSE_CODE, Constant.FAIL_CODE_VALUE);
						resultMap.put(Constant.RESPONSE_CODE_MSG, "发送失败");
					}
				}
			} else {
				result = "短信类型错误";
			}
		}else{
			if ("10".equals(result)) {
				resultMap.put(Constant.RESPONSE_CODE, Constant.SUCCEED_CODE_VALUE);
				resultMap.put(Constant.RESPONSE_CODE_MSG, "短信发送成功");
			} else if("该手机号已经注册".equals(result)) {
				resultMap.put(Constant.RESPONSE_CODE, 1000);
				resultMap.put(Constant.RESPONSE_CODE_MSG, result);
				resultMap.put("url", Global.getValue("app_android_downloadurl"));
			} else if("noCode".equals(result)) {
				resultMap.put(Constant.RESPONSE_CODE, Constant.FAIL_CODE_VALUE);
				resultMap.put(Constant.RESPONSE_CODE_MSG, "获取短信验证码失败");
			}else {
				resultMap.put(Constant.RESPONSE_CODE, Constant.FAIL_CODE_VALUE);
				resultMap.put(Constant.RESPONSE_CODE_MSG, result);
			}
		}
        resultMap.put("countDown", countDown);
		ServletUtils.writeToResponse(response,resultMap);
	}
	
	private String check(String phone,String type){
		String message = null;
		if(StringUtil.isBlank(phone) || StringUtil.isBlank(type)){
			message = "参数不能为空";
		} else if(!StringUtil.isPhone(phone)){
			message = "手机号码格式有误";
		} else {
			if(StringUtil.equals("register", type)){
				// 当日最大注册用户数
				long todayCount = cloanUserService.todayCount();
	            String dayRegisterMax_ = Global.getValue("day_register_max");
	            if(StringUtil.isNotBlank(dayRegisterMax_)){
	            	int dayRegisterMax = Integer.parseInt(dayRegisterMax_);
	            	if(dayRegisterMax > 0 && todayCount >= dayRegisterMax){
						message = "今天注册人数已达到上限";
	            	}
	            }
	            
				if (clSmsService.findUser(phone)>0) {
					message = "该手机号已经注册";
				}
			}
			
			if (StringUtil.equals("findReg", type)) {
				if (clSmsService.findUser(phone)<1) {
					message = "该手机号不存在";
				}
			}
			 
			if (message==null&&clSmsService.countDayTime(phone, type) <= 0) {
				message = "获取短信验证码过于频繁，请明日再试";
			}
			
			/*if(message == null && clSmsService.checkIsMotherFucker(phone, type)){
				message = "获取短信验证码过于频繁，请明日再试";
			}*/
			
		}	
		return message;
	}	
	
	
	/**
	 * 获取验证码（非短信验证码）
	 */
	@RequestMapping(value = "/api/user/getCode.htm")
	public void getCode(){
		Map<String,Object> resultMap = new HashMap<String,Object>();
		// 生成随机数  
        Random random = new Random();
		int codeCount = 4;
		int num = 0;
		// randomCode记录随机产生的验证码  
        StringBuffer randomCode = new StringBuffer();  
        // 随机产生codeCount个字符的验证码。  
        for (int i = 0; i < codeCount; i++) {  
        	num = random.nextInt(255);  
            randomCode.append(num);  
        }  
        // 将四位数字的验证码保存到Session中。  
        String code = randomCode.toString();
        
        HttpSession session = request.getSession();
	    session.setAttribute("randomCode", code);
	    session.setMaxInactiveInterval(3*60);
	    
        resultMap.put(Constant.RESPONSE_CODE, 200);
        resultMap.put("randomCode", code);
        
        ServletUtils.writeToResponse(response,resultMap);
	}
	
	/**
	 * 获取app的版本号
	 * 2018-04-20
	 */
	@RequestMapping(value = "/user/appVersion.htm")
	public void appVersion(){
		Map<String ,Object> data = new HashMap<String,Object>();
		 String version = Global.getValue("check_version");
		 logger.info("当前app版本号："+version);
		 data.put("version", version);
		 ServletUtils.writeToResponse(response,data);
	}
	
	/**
	 * 获取app下载地址
	 * 2018-05-22
	 */
	@RequestMapping(value = "/user/downloadUrl.htm")
	public void downloadUrl(){
		Map<String,Object> map = new HashMap<String,Object>();
		String url = Global.getValue("app_android_downloadurl");
		logger.info("当前app下载地址：" + url);
		map.put("url", url);
		ServletUtils.writeToResponse(response,map);
	}
}
