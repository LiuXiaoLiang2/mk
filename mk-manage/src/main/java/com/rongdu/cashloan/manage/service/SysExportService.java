package com.rongdu.cashloan.manage.service;

import java.io.FileInputStream;

import javax.servlet.ServletOutputStream;

import com.rongdu.cashloan.core.common.service.BaseService;
import com.rongdu.cashloan.manage.domain.SysExport;

/**
 * 导出统计表Service
 * 
 * @author yinghh
 * @version 1.0.0
 * @date 2017-11-11 23:44:56
 * Copyright 杭州融都科技股份有限公司  cashloan All Rights Reserved
 * 官方网站：www.erongdu.com
 * 未经授权不得进行修改、复制、出售及商业使用
 */
public interface SysExportService extends BaseService<SysExport, Long>{
	/**
	 * 下载逾期excel
	 * @param fileInputStream
	 * @param outputStream
	 */
	void exportOverDue(FileInputStream fileInputStream, ServletOutputStream outputStream);

	/**
	 * 下载每天数据
	 * @param fileInputStream
	 * @param outputStream
	 * @param date 
	 */
	void exportDayData(FileInputStream fileInputStream, ServletOutputStream outputStream, String date);
}
