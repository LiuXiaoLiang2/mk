package com.rongdu.cashloan.cl.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户表实体
 * 
 * @author lxl
 * @version 1.0.0
 * @date 2018-09-09 13:05:46
 * Copyright 杭州融都科技股份有限公司  cashloan All Rights Reserved
 * 官方网站：www.erongdu.com
 * 未经授权不得进行修改、复制、出售及商业使用
 */
 public class ClUser implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
    * 主键Id
    */
    private Long id;

    /**
    * 
    */
    private String uuid;

    /**
    * 登录名
    */
    private String loginName;

    /**
    * 登录密码
    */
    private String loginPwd;

    /**
    * 上次登录密码修改时间
    */
    private Date loginpwdModifyTime;

    /**
    * 注册时间
    */
    private Date registTime;

    /**
    * 注册客户端
    */
    private String registerClient;

    /**
    * 邀请码
    */
    private String invitationCode;

    /**
    * 渠道
    */
    private Long channelId;

    /**
    * 代理等级 ，1一级，2二级，3普通用户
    */
    private String level;

    /**
    * 登录时间
    */
    private Date loginTime;


    /**
    * 获取主键Id
    *
    * @return id
    */
    public Long getId(){
        return id;
    }

    /**
    * 设置主键Id
    * 
    * @param 要设置的主键Id
    */
    public void setId(Long id){
        this.id = id;
    }

    /**
    * 获取
    *
    * @return 
    */
    public String getUuid(){
        return uuid;
    }

    /**
    * 设置
    * 
    * @param uuid 要设置的
    */
    public void setUuid(String uuid){
        this.uuid = uuid;
    }

    /**
    * 获取登录名
    *
    * @return 登录名
    */
    public String getLoginName(){
        return loginName;
    }

    /**
    * 设置登录名
    * 
    * @param loginName 要设置的登录名
    */
    public void setLoginName(String loginName){
        this.loginName = loginName;
    }

    /**
    * 获取登录密码
    *
    * @return 登录密码
    */
    public String getLoginPwd(){
        return loginPwd;
    }

    /**
    * 设置登录密码
    * 
    * @param loginPwd 要设置的登录密码
    */
    public void setLoginPwd(String loginPwd){
        this.loginPwd = loginPwd;
    }

    /**
    * 获取上次登录密码修改时间
    *
    * @return 上次登录密码修改时间
    */
    public Date getLoginpwdModifyTime(){
        return loginpwdModifyTime;
    }

    /**
    * 设置上次登录密码修改时间
    * 
    * @param loginpwdModifyTime 要设置的上次登录密码修改时间
    */
    public void setLoginpwdModifyTime(Date loginpwdModifyTime){
        this.loginpwdModifyTime = loginpwdModifyTime;
    }

    /**
    * 获取注册时间
    *
    * @return 注册时间
    */
    public Date getRegistTime(){
        return registTime;
    }

    /**
    * 设置注册时间
    * 
    * @param registTime 要设置的注册时间
    */
    public void setRegistTime(Date registTime){
        this.registTime = registTime;
    }

    /**
    * 获取注册客户端
    *
    * @return 注册客户端
    */
    public String getRegisterClient(){
        return registerClient;
    }

    /**
    * 设置注册客户端
    * 
    * @param registerClient 要设置的注册客户端
    */
    public void setRegisterClient(String registerClient){
        this.registerClient = registerClient;
    }

    /**
    * 获取邀请码
    *
    * @return 邀请码
    */
    public String getInvitationCode(){
        return invitationCode;
    }

    /**
    * 设置邀请码
    * 
    * @param invitationCode 要设置的邀请码
    */
    public void setInvitationCode(String invitationCode){
        this.invitationCode = invitationCode;
    }

    /**
    * 获取渠道
    *
    * @return 渠道
    */
    public Long getChannelId(){
        return channelId;
    }

    /**
    * 设置渠道
    * 
    * @param channelId 要设置的渠道
    */
    public void setChannelId(Long channelId){
        this.channelId = channelId;
    }

    /**
    * 获取代理等级 ，1一级，2二级，3普通用户
    *
    * @return 代理等级 ，1一级，2二级，3普通用户
    */
    public String getLevel(){
        return level;
    }

    /**
    * 设置代理等级 ，1一级，2二级，3普通用户
    * 
    * @param level 要设置的代理等级 ，1一级，2二级，3普通用户
    */
    public void setLevel(String level){
        this.level = level;
    }

    /**
    * 获取登录时间
    *
    * @return 登录时间
    */
    public Date getLoginTime(){
        return loginTime;
    }

    /**
    * 设置登录时间
    * 
    * @param loginTime 要设置的登录时间
    */
    public void setLoginTime(Date loginTime){
        this.loginTime = loginTime;
    }

}