package com.rongdu.cashloan.core.common.util.generator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Create {
	
	public static final Logger logger = LoggerFactory.getLogger(Create.class);
	public static void main(String[] args) {
		Create ot=new Create();
		ot.test();
	}
	
	public void test(){

		// 数据库连接信息
		String url = "jdbc:mysql://rm-bp1ic5o0ma8580gaoo.mysql.rds.aliyuncs.com:3306/coinpledgetestdb?useUnicode=true&characterEncoding=utf8";
		String MysqlUser = "fqydtestuser";
		String mysqlPassword = "YTD82CqgTq08ahN";
		
		// 数据库及数据表名称
		String database = "coinpledgetestdb";
		String table = "virtual_coin";
		
		// 配置作者及Domain说明
		String classAuthor = "luyu";
		String functionName = "虚拟币表";
 
		// 公共包路径 (例如 BaseDao、 BaseService、 BaseServiceImpl)
		String commonName ="com.rongdu.cashloan.core.common";
		
		String packageName ="com.rongdu.cashloan.rc";
		String moduleName = "simpleCount";

		//Mapper文件存储地址  默认在resources中
		String batisName = "config/mappers";
		String db="mysql";
		
		//类名前缀
		String classNamePrefix = "virtualCoin";

		try {
			MybatisGenerate.generateCode(db,url, MysqlUser, mysqlPassword, database, table,commonName,packageName,batisName,moduleName,classAuthor,functionName,classNamePrefix);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
	}

}
