package com.rongdu.cashloan.system.service;

import java.util.List;
import java.util.Map;

import com.rongdu.cashloan.core.common.service.BaseService;
import com.rongdu.cashloan.system.domain.SysUserChannel;

/**
 * 系统渠道用户表Service
 * 
 * @author yinghh
 * @version 1.0.0
 * @date 2017-11-02 15:41:44
 * Copyright 杭州融都科技股份有限公司  cashloan All Rights Reserved
 * 官方网站：www.erongdu.com
 * 未经授权不得进行修改、复制、出售及商业使用
 */
public interface SysUserChannelService extends BaseService<SysUserChannel, Long>{
	
	/**
	 * 根据user_id，返回对象集合
	 */
	public List<SysUserChannel> listSelective(Map<String, Object> paramMap);
	

}
