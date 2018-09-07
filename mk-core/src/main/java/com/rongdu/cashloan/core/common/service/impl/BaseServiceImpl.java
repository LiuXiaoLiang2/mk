package com.rongdu.cashloan.core.common.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.rongdu.cashloan.core.common.mapper.BaseMapper;
import com.rongdu.cashloan.core.common.service.BaseService;

public abstract class BaseServiceImpl<T, ID extends Serializable> implements BaseService<T, ID> {
	
	@Resource
	private BaseMapper<T, ID> baseMapper;
	
	public int insert(T record) {
		return getMapper().save(record);
	}

	public T getById(ID id) {
		return getMapper().findByPrimary(id);
	}

	public int updateById(T record) {
		return getMapper().update(record);
	}
	
	public int updateSelective(Map<String, Object> paramMap){
		return getMapper().updateSelective(paramMap);
	}

	public abstract BaseMapper<T, ID> getMapper();
	
	/*protected String getLoginName() {
		// 增加用户登录判断
		UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return user.getUsername();
	}*/
	
	public T findSelective(Map<String, Object> paramMap){
		return getMapper().findSelective(paramMap);
	}
	
	public List<T> listSelective(Map<String, Object> paramMap){
		return getMapper().listSelective(paramMap);
	}

}
