package com.rongdu.cashloan.core.mapper;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rongdu.cashloan.core.common.mapper.BaseMapper;
import com.rongdu.cashloan.core.common.mapper.RDBatisDao;
import com.rongdu.cashloan.core.domain.User;
import com.rongdu.cashloan.core.model.CloanUserModel;
import com.rongdu.cashloan.core.model.UserConnactModel;
import com.rongdu.cashloan.core.model.UserVoiceModel;

/**
 * 用户管理Dao
 * 
 * @author lyang
 * @version 1.0.0
 * @date 2016-12-08 15:13:39
 * Copyright 杭州融都科技股份有限公司  arc All Rights Reserved
 * 官方网站：www.erongdu.com
 * 
 * 未经授权不得进行修改、复制、出售及商业使用
 */
@RDBatisDao
public interface UserMapper extends BaseMapper<User,Long> {

	/**
	 * 分页查询返回CreditModel
	 * @param searchMap
	 * @return
	 */
	//List<CreditModel> page(Map<String,Object> searchMap);
	
	
	List<CloanUserModel> listModel(Map<String, Object> params);

	CloanUserModel getModel(Long id);

	List<Map<String, Object>> queryAllDic();

	/**
	 * 手机号查询id
	 * @param phone
	 * @return
	 */
	User findByLoginName(String phone);

	/**
	 * 修改等级
	 * @param user
	 * @return
	 */
	int updateLevel(User user);

	/**
	 * 查询用户等级
	 * @param map
	 * @return
	 */
	List<User> findUserLevel(Map<String, Object> map);

	/**
	 * 据uuid 修改用户信息
	 * 
	 * @param paramMap
	 * @return
	 */
	int updateByUuid(Map<String, Object> paramMap);
	
	/**
	 * 今日注册用户数
	 * @return
	 */
	long todayCount();
	/**
	 * 查找基本用户信息
	 * @return
	 */
	HashMap<String , Object> findUserMesByuPhone(String phone);
	/**
	 * 客户通讯录查询
	 * @return
	 */
	List<UserConnactModel>  findUserConnactByid(@Param("tableName") String tablename,@Param("id") String id);
	/**
	 * 客户通话记录查询
	 * @return
	 */
	List<UserVoiceModel>  findUserVoicesByid(@Param("tableName") String tablename,@Param("id") String id);
}
