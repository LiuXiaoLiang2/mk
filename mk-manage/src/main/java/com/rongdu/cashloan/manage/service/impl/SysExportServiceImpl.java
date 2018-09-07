package com.rongdu.cashloan.manage.service.impl;

import java.io.FileInputStream;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.rongdu.cashloan.core.common.mapper.BaseMapper;
import com.rongdu.cashloan.core.common.service.impl.BaseServiceImpl;
import com.rongdu.cashloan.core.common.util.StringUtil;
import com.rongdu.cashloan.manage.domain.SysExport;
import com.rongdu.cashloan.manage.mapper.SysExportMapper;
import com.rongdu.cashloan.manage.service.SysExportService;


/**
 * 导出统计表ServiceImpl
 * 
 * @author yinghh
 * @version 1.0.0
 * @date 2017-11-11 23:44:56
 * Copyright 杭州融都科技股份有限公司  cashloan All Rights Reserved
 * 官方网站：www.erongdu.com
 * 未经授权不得进行修改、复制、出售及商业使用
 */
 
@Service("SysExportService")
public class SysExportServiceImpl extends BaseServiceImpl<SysExport, Long> implements SysExportService {
	
    private static final Logger logger = Logger.getLogger(SysExportServiceImpl.class);
   
    @Resource
    private SysExportMapper sysExportMapper;

	@Override
	public BaseMapper<SysExport, Long> getMapper() {
		return sysExportMapper;
	}
	
	
	@Override
	public void exportOverDue(FileInputStream fileInputStream, ServletOutputStream outputStream) {
		
		String overDueSql = "select date_format(create_time,'%Y-%m-%d') '借款审核通过日期',date_format(repay_time,'%Y-%m-%d') '还款日期'"
							+" count(id) '应还款总数',sum(if(state=10,1,0)) '已还款'"
							+" sum(if(state=20,1,0)) '未还款',sum(if(state=20,1,0))/count(id)*100 '未还款占比',"
							+" sum(if(state=10,1,0))/count(id)*100 '已还款占比' ,"
							+" sum(if(penalty_day=0,1,0))/sum(if(state=10,1,0))*100 '不逾期占比' ,"
							+" sum(if(penalty_day>0,1,0)) '逾期件数',"
							+" sum(if(penalty_day>0,1,0))/sum(if(state=10,1,0))*100 '逾期件数占比' ,"
							+" sum(if(penalty_day>=1,1,0)) '逾期D1',sum(if(penalty_day>=1,1,0))/sum(if(state=10,1,0))*100 '逾期D1占比' ,"
							+" sum(if(penalty_day>=2,1,0)) '逾期D2',sum(if(penalty_day>=2,1,0))/sum(if(state=10,1,0))*100 '逾期D2占比' ,"
							+" sum(if(penalty_day>=3,1,0)) '逾期D3',sum(if(penalty_day>=3,1,0))/sum(if(state=10,1,0))*100 '逾期D3占比' ,"
							+" sum(if(penalty_day>=4,1,0)) '逾期D4',sum(if(penalty_day>=4,1,0))/sum(if(state=10,1,0))*100 '逾期D4占比' ,"
							+" sum(if(penalty_day>=5,1,0)) '逾期D5',sum(if(penalty_day>=5,1,0))/sum(if(state=10,1,0))*100 '逾期D5占比' ,"
							+" sum(if(penalty_day>=6,1,0)) '逾期D6',sum(if(penalty_day>=6,1,0))/sum(if(state=10,1,0))*100 '逾期D6占比' ,"
							+" sum(if(penalty_day>=7,1,0)) '逾期D7',sum(if(penalty_day>=7,1,0))/sum(if(state=10,1,0))*100 '逾期D7占比' ,"
							+" sum(if(penalty_day>=10,1,0)) '逾期D10',sum(if(penalty_day>=10,1,0))/sum(if(state=10,1,0))*100 '逾期D10占比' ,"
							+" sum(if(penalty_day>=14,1,0)) '逾期D14',sum(if(penalty_day>=14,1,0))/sum(if(state=10,1,0))*100 '逾期D14占比' ,"
							+" sum(if(penalty_day>=30,1,0)) '逾期D30',sum(if(penalty_day>=30,1,0))/sum(if(state=10,1,0))*100 '逾期D30占比' ,"
							+" sum(if(penalty_day>=60,1,0)) '逾期D60',sum(if(penalty_day>=60,1,0))/sum(if(state=10,1,0))*100 '逾期D60占比' ," 
							+" sum(if(penalty_day>=90,1,0)) '逾期D90',sum(if(penalty_day>=90,1,0))/sum(if(state=10,1,0))*100 '逾期D90占比' "  
							+" from cl_borrow_repay t "
							+" group by date_format(create_time,'%Y-%m-%d'), date_format(repay_time,'%Y-%m-%d') ";
		sysExportMapper.exportOverDue(overDueSql);
	}

	@Override
	public void exportDayData(FileInputStream in, ServletOutputStream out,String date) {
		logger.info("导出数据service");
		try {
			String dateTodayStr = null;
			String dateTomorrowStr = null;
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			if(date == null){
				Date dateToday = new Date();
				Date tranferDate = tranferDate(dateToday);
				dateTodayStr = dateFormat.format(tranferDate);
				Date tomorrowDate = getTomorrowDate(dateToday);
				dateTomorrowStr = dateFormat.format(tomorrowDate);
			} else {
				dateTodayStr = date + " 00:00:00";
				Date dateToday = dateFormat.parse(dateTodayStr);
				Date tomorrowDate = getTomorrowDate(dateToday);
				dateTomorrowStr = dateFormat.format(tomorrowDate);
			}
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("todayTime", dateTodayStr);
			paramMap.put("tomorrowTime", dateTomorrowStr);
			
			
			//**********************查询 各个渠道注册数
			List<Map<String, Object>> registerResult = sysExportMapper.selectDayRegister(paramMap);
			//将数据放到map
			Map<String, Object> registerResultMap = new HashMap<String,Object>();
			for (Map<String, Object> map : registerResult) {
				registerResultMap.put(map.get("code").toString(), map.get("num"));
			}
			
			//**********************查询 用户认证-个人信息填写 申请【用户申请认证数】
			List<Map<String, Object>> applyAuthResult = sysExportMapper.selectDayApplyAuth(paramMap);
			Map<String, Object> applyAuthMap = new HashMap<String,Object>();
			for (Map<String, Object> map : applyAuthResult) {
				applyAuthMap.put(map.get("code").toString(), map.get("num"));
			}
			
			//**********************查询 用户认证完成数
			List<Map<String, Object>> applyAuthOverResult = sysExportMapper.selectDayApplyAuthOver(paramMap);
			Map<String, Object> applyAuthOverMap = new HashMap<String,Object>();
			for (Map<String, Object> map : applyAuthOverResult) {
				applyAuthOverMap.put(map.get("code").toString(), map.get("num"));
			}
			
			//**********************查询 提审数(新贷总数量)
			List<Map<String, Object>> newBorrowResult = sysExportMapper.selectDayNewBorrowTotal(paramMap);
			Map<String, Object> newBorrowMap = new HashMap<String,Object>();
			for (Map<String, Object> map : newBorrowResult) {
				newBorrowMap.put(map.get("code").toString(), map.get("num"));
			}
			
			//**********************查询  新贷(成功放款的)
			List<Map<String, Object>> newMoneyResult = sysExportMapper.selectDayNewMoney(paramMap);
			Map<String, Object> newMoneyMap = new HashMap<String,Object>();
			for (Map<String, Object> map : newMoneyResult) {
				newMoneyMap.put(map.get("code").toString(), map.get("num"));
			}
			
			//**********************查询续贷提审数
			List<Map<String, Object>> refinanceBorrowResult = sysExportMapper.selectDayRefinanceBorrow(paramMap);
			Map<String, Object> refinanceBorrowMap = new HashMap<String,Object>();
			for (Map<String, Object> map : refinanceBorrowResult) {
				refinanceBorrowMap.put(map.get("code").toString(), map.get("num"));
			}
			
			//*********************查询 当日还款当日续贷
			List<Map<String, Object>> returnMoneyAndRefinanceResult = sysExportMapper.selectDayReturnMoneyAndRefinance(paramMap);
			Map<String, Object> returnMoneyAndRefinanceMap = new HashMap<String,Object>();
			for (Map<String, Object> map : returnMoneyAndRefinanceResult) {
				returnMoneyAndRefinanceMap.put(map.get("code").toString(), map.get("num"));
			}
			
			//**********************查询 续贷放款成功
			List<Map<String, Object>> refinanceMoneyResult = sysExportMapper.selectDayRefinanceMoney(paramMap);
			Map<String, Object> refinanceMoneyMap = new HashMap<String,Object>();
			for (Map<String, Object> map : refinanceMoneyResult) {
				refinanceMoneyMap.put(map.get("code").toString(), map.get("num"));
			}
			
			//**********************查询 日活 【这里写查询第一张表,这里有问题,需要根据user的个数,来判断有几张分表】
			List<Map<String, Object>> activeResult = sysExportMapper.selectDayActive(paramMap);
			Map<String, Object> activeMap = new HashMap<String,Object>();
			for (Map<String, Object> map : activeResult) {
				activeMap.put(map.get("code").toString(), map.get("num"));
			}
			
			//**********************查询 总提审数
			List<Map<String, Object>> borrowAllResult = sysExportMapper.selectDayborrowAll(paramMap);
			Map<String, Object> borrowAllMap = new HashMap<String,Object>();
			for (Map<String, Object> map : borrowAllResult) {
				borrowAllMap.put(map.get("code").toString(), map.get("num"));
			}
			
			//*********************查询 总机审通过
			List<Map<String, Object>> jiShenAllResult = sysExportMapper.selectDayJiShenAll(paramMap);
			Map<String, Object> jiShenAllMap = new HashMap<String,Object>();
			for (Map<String, Object> map : jiShenAllResult) {
				jiShenAllMap.put(map.get("code").toString(), map.get("num"));
			}
			
			//*********************查询 总放款件数
			List<Map<String, Object>> moneyCountAllResult = sysExportMapper.selectDayMoneyCountAll(paramMap);
			Map<String, Object> moneyCountAllMap = new HashMap<String,Object>();
			for (Map<String, Object> map : moneyCountAllResult) {
				moneyCountAllMap.put(map.get("code").toString(), map.get("num"));
			}
			
			//*********************查询 总金额
			List<Map<String, Object>> moneyAllResult = sysExportMapper.selectDayMoneyAll(paramMap);
			Map<String, Object> moneyAllMap = new HashMap<String,Object>();
			for (Map<String, Object> map : moneyAllResult) {
				moneyAllMap.put(map.get("code").toString(), map.get("num"));
			}
			
			//*********************查询续贷总金额
			List<Map<String, Object>> xuDaiMoneyAllResult = sysExportMapper.selectXudaiMoneyAll(paramMap);
			Map<String, Object> xudaiMoneyAllMap = new HashMap<String,Object>();
			for (Map<String, Object> map : xuDaiMoneyAllResult) {
				xudaiMoneyAllMap.put(map.get("code").toString(), map.get("num"));
			}
			
			//********************查询还款总笔数和总金额
			List<Map<String, Object>> repayMentAllNumAndMoney = sysExportMapper.selectRepayMentAllNumAndMoney(paramMap);
			logger.info("***********" + repayMentAllNumAndMoney.size());
			Map<String, Object> repayMentNumMap = new HashMap<String,Object>();
			Map<String, Object> repayMentMoneyMap = new HashMap<String,Object>();
			if(repayMentAllNumAndMoney != null && repayMentAllNumAndMoney.size() > 0){
				for (Map<String, Object> map : repayMentAllNumAndMoney) {
					logger.info("--------"+map.get("code").toString());
					logger.info("--------"+map.get("num").toString());
					logger.info("--------"+map.get("money").toString());
					repayMentNumMap.put(map.get("code").toString(), map.get("num"));
					repayMentMoneyMap.put(map.get("code").toString(), map.get("money"));
				}
			}
			
			HSSFWorkbook book = new HSSFWorkbook(in);
			HSSFSheet sheet = book.getSheetAt(0);
			
			//保留两位小数,函数
			DecimalFormat df = new DecimalFormat("######0.00");   
			
			for(int i = 2; i < 200; i++){
				HSSFRow row = sheet.getRow(i);
				//首先获取标志
				row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
				String code = row.getCell(1).getStringCellValue();
				if("test".equals(code)){
					break;
				}
				
				//----------------首先填充日期
				row.getCell(2).setCellValue(dateTodayStr.split(" ")[0]);
				
				//----------------填充注册数
				//从registerResultMap中获取
				if(registerResultMap.get(code) != null){
					String result = registerResultMap.get(code).toString();
					if(StringUtil.isNotBlank(result)){
						row.getCell(3).setCellValue(result);
					}
				}
				
				//----------------填充申请认证数
				//从applyAuthMap中获取
				if(applyAuthMap.get(code) != null){
					String result = applyAuthMap.get(code).toString();
					row.getCell(4).setCellValue(result);
				}
				
				//----------------填充认证率
				//获取注册数
				HSSFCell cell3 = row.getCell(3);
				cell3.setCellType(Cell.CELL_TYPE_STRING);
				String registerNum = cell3.getStringCellValue();
				//获取认证数
				HSSFCell cell4 = row.getCell(4);
				cell4.setCellType(Cell.CELL_TYPE_STRING);
				String applyNum = cell4.getStringCellValue();
				if(StringUtil.isNotBlank(registerNum) && !"0".equals(registerNum) 
						&& StringUtil.isNotBlank(applyNum) && !"0".equals(applyNum)){
					double registerNumDouble = Double.parseDouble(registerNum);
					double applyNumDouble = Double.parseDouble(applyNum);
					String applyPercent = df.format(applyNumDouble/registerNumDouble * 100);
					row.getCell(5).setCellValue(applyPercent + "%");
				}
				
				//----------------填充完件数
				//从applyAuthOverMap中获取
				if(applyAuthOverMap.get(code) != null){
					String result = applyAuthOverMap.get(code).toString();
					row.getCell(6).setCellValue(result);
				}
				
				//---------------填充完件率
				//获取完件数
				HSSFCell cell6 = row.getCell(6);
				cell6.setCellType(Cell.CELL_TYPE_STRING);
				String applyAuthOverNum = cell6.getStringCellValue();
				if(StringUtil.isNotBlank(registerNum) && !"0".equals(registerNum) 
						&& StringUtil.isNotBlank(applyAuthOverNum) && !"0".equals(applyAuthOverNum)){
					double registerNumDouble = Double.parseDouble(registerNum);
					double applyAuthOverNumDouble = Double.parseDouble(applyAuthOverNum);
					String applyOverPercent = df.format(applyAuthOverNumDouble/registerNumDouble * 100);
					row.getCell(7).setCellValue(applyOverPercent + "%");
				}
				
				//---------------填充提审数(新贷总数量)
				//从newBorrowMap中获取
				if(newBorrowMap.get(code) != null){
					String result = newBorrowMap.get(code).toString();
					row.getCell(8).setCellValue(result);
				}
				
				//---------------填充新贷(成功放款的)
				//从newMoneyMap中获取
				if(newMoneyMap.get(code) != null){
					String result = newMoneyMap.get(code).toString();
					row.getCell(9).setCellValue(result);
				}
				
				//--------------填充 新贷 放款/提审
				//获取新贷提审数
				HSSFCell cell8 = row.getCell(8);
				cell8.setCellType(Cell.CELL_TYPE_STRING);
				String newBorrowNum = cell8.getStringCellValue();
				//获取新贷放款成功的
				HSSFCell cell9 = row.getCell(9);
				cell9.setCellType(Cell.CELL_TYPE_STRING);
				String newMoneyNum = cell9.getStringCellValue();
				if(StringUtil.isNotBlank(newBorrowNum) && !"0".equals(newBorrowNum) 
						&& StringUtil.isNotBlank(newMoneyNum) && !"0".equals(newMoneyNum)){
					double newBorrowNumDouble = Double.parseDouble(newBorrowNum);
					double newMoneyNumDouble = Double.parseDouble(newMoneyNum);
					String newMoneyPercent = df.format(newMoneyNumDouble/newBorrowNumDouble * 100);
					row.getCell(10).setCellValue(newMoneyPercent + "%");
				}
				
				//---------------填充 续贷提审数
				//从refinanceBorrowMap中获取
				if(refinanceBorrowMap.get(code) != null){
					String result = refinanceBorrowMap.get(code).toString();
					row.getCell(11).setCellValue(result);
				}
				
				//--------------填充 当日还款当日续贷
				//从returnMoneyAndRefinanceMap中获取
				if(returnMoneyAndRefinanceMap.get(code) != null){
					String result = returnMoneyAndRefinanceMap.get(code).toString();
					row.getCell(12).setCellValue(result);
				}
				
				//-------------填充 续贷放款成功
				//从refinanceMoneyMap中获取
				if(refinanceMoneyMap.get(code) != null){
					String result = refinanceMoneyMap.get(code).toString();
					row.getCell(13).setCellValue(result);
				}
				
				//-------------填充 续贷提审/放款 比例
				HSSFCell cell11 = row.getCell(11);
				cell11.setCellType(Cell.CELL_TYPE_STRING);
				String refinanceBorrowNum = cell11.getStringCellValue();
				HSSFCell cell13 = row.getCell(13);
				cell13.setCellType(Cell.CELL_TYPE_STRING);
				String refinanceMoneyNum = cell13.getStringCellValue();
				if(StringUtil.isNotBlank(refinanceBorrowNum) && !"0".equals(refinanceBorrowNum) 
						&& StringUtil.isNotBlank(refinanceMoneyNum) && !"0".equals(refinanceMoneyNum)){
					double refinanceBorrowNumDouble = Double.parseDouble(refinanceBorrowNum);
					double refinanceMoneyNumDouble = Double.parseDouble(refinanceMoneyNum);
					String newMoneyPercent = df.format(refinanceMoneyNumDouble/refinanceBorrowNumDouble * 100);
					row.getCell(14).setCellValue(newMoneyPercent + "%");
				}
				
				//-------------填充 日活
				//从activeMap中获取
				if(activeMap.get(code) != null){
					String result = activeMap.get(code).toString();
					row.getCell(15).setCellValue(result);
				}
				
				//--------------填充总提审数
				//从borrowAllMap中获取
				if(borrowAllMap.get(code) != null){
					String result = borrowAllMap.get(code).toString();
					row.getCell(16).setCellValue(result);
				}
				
				//-----------填充 提审/日活
				HSSFCell cell15 = row.getCell(15);
				cell15.setCellType(Cell.CELL_TYPE_STRING);
				//日活
				String activeNum = cell15.getStringCellValue();
				HSSFCell cell16 = row.getCell(16);
				cell16.setCellType(Cell.CELL_TYPE_STRING);
				//总提审数
				String borrowAllNum = cell16.getStringCellValue();
				if(StringUtil.isNotBlank(activeNum) && !"0".equals(activeNum) 
						&& StringUtil.isNotBlank(borrowAllNum) && !"0".equals(borrowAllNum)){
					double activeNumDouble = Double.parseDouble(activeNum);
					double borrowAllNumDouble = Double.parseDouble(borrowAllNum);
					String newMoneyPercent = df.format(borrowAllNumDouble/activeNumDouble * 100);
					row.getCell(17).setCellValue(newMoneyPercent + "%");
					
				}
				
				//-------------填充 总机审通过
				//从jiShenAllMap中获取
				if(jiShenAllMap.get(code) != null){
					String result = jiShenAllMap.get(code).toString();
					row.getCell(18).setCellValue(result);
				}
				
				//--------------填充 机审/提审
				//获取总机审数
				HSSFCell cell18 = row.getCell(18);
				cell18.setCellType(Cell.CELL_TYPE_STRING);
				String jiShenAllNum = cell18.getStringCellValue();
				if(StringUtil.isNotBlank(borrowAllNum) && !"0".equals(borrowAllNum) 
						&& StringUtil.isNotBlank(jiShenAllNum) && !"0".equals(jiShenAllNum)){
					double jiShenAllNumDouble = Double.parseDouble(jiShenAllNum);
					double borrowAllNumDouble = Double.parseDouble(borrowAllNum);
					String newMoneyPercent = df.format(jiShenAllNumDouble/borrowAllNumDouble * 100);
					row.getCell(19).setCellValue(newMoneyPercent + "%");
					
				}
				
				//-------------填充 总放款件数
				//从moneyCountAllMap中获取
				if(moneyCountAllMap.get(code) != null){
					String result = moneyCountAllMap.get(code).toString();
					row.getCell(20).setCellValue(result);
				}
				
				//-------------填充 总放款/总提审
				//获取总放款数
				HSSFCell cell20 = row.getCell(20);
				cell20.setCellType(Cell.CELL_TYPE_STRING);
				String moneyCountAllNum = cell20.getStringCellValue();
				if(StringUtil.isNotBlank(borrowAllNum) && !"0".equals(borrowAllNum) 
						&& StringUtil.isNotBlank(moneyCountAllNum) && !"0".equals(moneyCountAllNum)){
					double moneyCountAllNumDouble = Double.parseDouble(moneyCountAllNum);
					double borrowAllNumDouble = Double.parseDouble(borrowAllNum);
					String newMoneyPercent = df.format(moneyCountAllNumDouble/borrowAllNumDouble * 100);
					row.getCell(21).setCellValue(newMoneyPercent + "%");
					
				}
				
				//-------------填充总金额
				//从moneyAllMap中获取
				if(moneyAllMap.get(code) != null){
					String result = moneyAllMap.get(code).toString();
					row.getCell(22).setCellValue(result);
				}
				
				//-------------填充续贷总金额
				//从xudaiMoneyAllMap中获取
				if(xudaiMoneyAllMap.get(code) != null){
					String result = xudaiMoneyAllMap.get(code).toString();
					row.getCell(23).setCellValue(result);
				}
				
				//-------------填充还款总笔数
				//repayMentNumMap.put(map.get("code").toString(), map.get("num"));
				//repayMentMoneyMap.put(map.get("code").toString(), map.get("num"));
				if(repayMentNumMap.get(code) != null){
					String result = repayMentNumMap.get(code).toString();
					row.getCell(24).setCellValue(result);
				}
				
				//-------------填充还款总金额
				if(repayMentMoneyMap.get(code) != null){
					String result = repayMentMoneyMap.get(code).toString();
					row.getCell(25).setCellValue(result);
				}
				
			}
			
			//********************查询  申请 500元7天
			Long borrow500And7Result =sysExportMapper.selectDayBorrow500And7(paramMap);
			
			//********************查询 放款 500元7天
			Long money500And7Result = sysExportMapper.selectDayMoney500And7(paramMap);
			
			//********************查询 申请 500元14天
			Long borrow500And14Result = sysExportMapper.selectDayBorrow500And14(paramMap);
			
			//********************查询 放款 500元14天
			Long money500And14Result = sysExportMapper.selectDayMoney500And14(paramMap);
			
			//********************查询  申请 1000元7天
			Long borrow1000And7Result = sysExportMapper.selectDayBorrow1000And7(paramMap);
			
			//********************查询 放款 1000元1天
			Long money1000And7Result = sysExportMapper.selectDayMoney1000And7(paramMap);
			
			//********************查询  申请 1000元14天
			Long borrow1000And14Result = sysExportMapper.selectDayBorrow1000And14(paramMap);
			
			//********************查询 放款 1000元17天
			Long money1000And14Result = sysExportMapper.selectDayMoney1000And14(paramMap);
			
			//********************查询 放款 总笔数
			Long totalAllMoneyCount = sysExportMapper.selectDayTotalAllMoneyCount(paramMap);
			
			//********************查询 新贷总笔数
			Long newBorrowMoney = sysExportMapper.selectDayNewBorrowMoney(paramMap);
			
			//********************查询 续贷1笔数
			paramMap.put("xudaiStart", 1);
			paramMap.put("xudaiEnd", 2);
			Long XuDaiBorrowMoney1 = sysExportMapper.selectDayXuDaiBorrowMoney(paramMap);
			
			//********************查询 续贷2笔数
			paramMap.put("xudaiStart", 2);
			paramMap.put("xudaiEnd", 3);
			Long XuDaiBorrowMoney2 = sysExportMapper.selectDayXuDaiBorrowMoney(paramMap);
			
			//********************查询 续贷3笔数
			paramMap.put("xudaiStart", 3);
			paramMap.put("xudaiEnd", 4);
			Long XuDaiBorrowMoney3 = sysExportMapper.selectDayXuDaiBorrowMoney(paramMap);
			
			//********************查询 续贷4笔数
			paramMap.put("xudaiStart", 4);
			paramMap.put("xudaiEnd", 5);
			Long XuDaiBorrowMoney4 = sysExportMapper.selectDayXuDaiBorrowMoney(paramMap);
			
			//获取第二个工作薄
			HSSFSheet sheet2 = book.getSheetAt(1);
			for(int i = 2; i < 8; i++){
				HSSFRow row = sheet2.getRow(i);
				if(i == 2){
					//-------------填充日期
					row.getCell(0).setCellValue(dateTodayStr.split(" ")[0]);
					//-------------填充 申请 500元7天
					if(borrow500And7Result != null){
						row.getCell(2).setCellValue(borrow500And7Result);
					}
					//-------------填充 申请 500元14天
					if(borrow500And14Result != null){
						row.getCell(3).setCellValue(borrow500And14Result);
					}
					//-------------填充 申请 1000元7天
					if(borrow1000And7Result != null){
						row.getCell(4).setCellValue(borrow1000And7Result);
					}
					//-------------填充 申请 1000元14天
					if(borrow1000And14Result != null){
						row.getCell(5).setCellValue(borrow1000And14Result);
					}
				}
				if(i == 3){
					//-------------填充 放款 500元7天
					if(money500And7Result != null){
						row.getCell(2).setCellValue(money500And7Result);
					}
					//-------------填充 放款 500元14天
					if(money500And14Result != null){
						row.getCell(3).setCellValue(money500And14Result);
					}
					//-------------填充 放款 1000元7天
					if(money1000And7Result != null){
						row.getCell(4).setCellValue(money1000And7Result);
					}
					//-------------填充 放款 1000元14天
					if(money1000And14Result != null){
						row.getCell(5).setCellValue(money1000And14Result);
					}
				}
				
				if(i == 7){
					//填充日期
					row.getCell(0).setCellValue(dateTodayStr.split(" ")[0]);
					//填充放款总笔数
					if(totalAllMoneyCount != null){
						row.getCell(1).setCellValue(totalAllMoneyCount);
					}
					//填充新贷笔数
					if(newBorrowMoney != null){
						row.getCell(2).setCellValue(newBorrowMoney);
					}
					//填充续贷1笔数
					if(XuDaiBorrowMoney1 != null){
						row.getCell(3).setCellValue(XuDaiBorrowMoney1);
					}
					//填充续贷2笔数
					if(XuDaiBorrowMoney2 != null){
						row.getCell(4).setCellValue(XuDaiBorrowMoney2);
					}
					//填充续贷3笔数
					if(XuDaiBorrowMoney3 != null){
						row.getCell(5).setCellValue(XuDaiBorrowMoney3);
					}
					//填充续贷4笔数
					if(XuDaiBorrowMoney4 != null){
						row.getCell(6).setCellValue(XuDaiBorrowMoney4);
					}
				}
			}
			
			book.write(out);
			//book.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	public Date tranferDate(Date date) {
		SimpleDateFormat d1 = new SimpleDateFormat("yyyy-MM-dd");
		String format = d1.format(date);
		format = format + " 00:00:00";
	
		SimpleDateFormat d2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date parse;
		try {
			parse = d2.parse(format);
			return parse;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//获取明天date
	public Date getTomorrowDate(Date date){
		Calendar calendarEnd = Calendar.getInstance();
		calendarEnd.setTime(date);
		calendarEnd.set(Calendar.DATE, calendarEnd.get(Calendar.DATE) + 1);
		Date repayTimeEnd = calendarEnd.getTime();
		repayTimeEnd = tranferDate(repayTimeEnd);
		return repayTimeEnd;
	}
}