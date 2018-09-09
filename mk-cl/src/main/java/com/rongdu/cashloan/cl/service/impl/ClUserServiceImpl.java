package com.rongdu.cashloan.cl.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.rongdu.cashloan.cl.domain.ClUser;
import com.rongdu.cashloan.cl.mapper.ClUserMapper;
import com.rongdu.cashloan.cl.service.ClUserService;
import com.rongdu.cashloan.core.common.mapper.BaseMapper;
import com.rongdu.cashloan.core.common.service.impl.BaseServiceImpl;


/**
 * 用户表ServiceImpl
 * 
 * @author lxl
 * @version 1.0.0
 * @date 2018-09-09 13:05:46
 * Copyright 杭州融都科技股份有限公司  cashloan All Rights Reserved
 * 官方网站：www.erongdu.com
 * 未经授权不得进行修改、复制、出售及商业使用
 */
 
@Service("clUserService")
public class ClUserServiceImpl extends BaseServiceImpl<ClUser, Long> implements ClUserService {
	
    private static final Logger logger = LoggerFactory.getLogger(ClUserServiceImpl.class);
   
    @Resource
    private ClUserMapper clUserMapper;

	@Override
	public BaseMapper<ClUser, Long> getMapper() {
		return clUserMapper;
	}
	
}