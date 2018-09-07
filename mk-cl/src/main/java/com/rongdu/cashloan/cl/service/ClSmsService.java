package com.rongdu.cashloan.cl.service;

import java.util.Map;

import com.github.pagehelper.Page;
import com.rongdu.cashloan.cl.domain.Sms;
import com.rongdu.cashloan.core.common.service.BaseService;

/**
 * 短信记录Service
 * 
 * @author lyang
 * @version 1.0.0
 * @date 2017-03-09 14:48:24 Copyright 杭州融都科技股份有限公司 arc All Rights Reserved
 *       官方网站：www.erongdu.com 未经授权不得进行修改、复制、出售及商业使用
 */
public interface ClSmsService extends BaseService<Sms, Long> {

	/**
	 * 查询与最近一条短信的时间差（秒）
	 * 
	 * @param phone
	 * @param type
	 * @return
	 */
	long findTimeDifference(String phone, String type);

	/**
	 * 根据手机号码、短信验证码类型查询今日可获取次数，防短信轰炸
	 * 
	 * @param phone
	 * @param type
	 * @return
	 */
	int countDayTime(String phone, String type);

	/**
	 * 发送短信
	 * 
	 * @param phone
	 * @param type
	 * @return
	 */
	String sendSms(String phone, String type);

	/**
	 * 验证短信
	 * 
	 * @param phone
	 * @param type
	 * @param code
	 * @param signMsg
	 * @return
	 */
	int verifySms(String phone, String type, String code);

	/**
	 * 查询用户
	 * 
	 * @param phone
	 * @return
	 */
	int findUser(String phone);

	/**
	 * 短信列表查询
	 * 
	 * @param params
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	Page<Sms> list(Map<String, Object> params, int currentPage, int pageSize);

	/**
	 * 获取短信报告结果
	 * 
	 * @param params
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	void getReportByOrderNo(String orderNo, String phone, String type);

	/**
	 * 判断是否为刷短信的
	 * @param phone
	 * @param type
	 * @return
	 */
	boolean checkIsMotherFucker(String phone, String type);
}
