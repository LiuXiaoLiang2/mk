package com.rongdu.cashloan.core.common.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * 基类接口定义
 * @author zlh
 * @version 1.0
 * @date 2016年10月24日 上午10:23:20
 * Copyright 杭州融都科技股份有限公司  All Rights Reserved
 * 官方网站：www.erongdu.com
 * 
 * 未经授权不得进行修改、复制、出售及商业使用
 */
public interface BaseService<T, ID extends Serializable> {

	int insert(T record);


	int updateById(T record);
	
	
	int updateSelective(Map<String, Object> paramMap);
	
	
	T getById(ID id);
	
	
	T findSelective(Map<String, Object> paramMap);
	
	
	List<T> listSelective(Map<String, Object> paramMap);
	

}
