/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : mk

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2018-09-10 06:49:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for arc_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `arc_sys_config`;
CREATE TABLE `arc_sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `type` tinyint(3) DEFAULT '10' COMMENT '类型',
  `name` varchar(30) DEFAULT '' COMMENT '参数名称',
  `code` varchar(50) DEFAULT '' COMMENT '编号',
  `value` varchar(2048) DEFAULT '' COMMENT '参数对应的值',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态  0不启用  1启用',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注说明',
  `creator` int(11) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of arc_sys_config
-- ----------------------------
INSERT INTO `arc_sys_config` VALUES ('1', '10', '应用环境（非技术人员勿动）', 'app_environment', 'dev', '1', 'dev/prod', '1');
INSERT INTO `arc_sys_config` VALUES ('2', '10', 'api服务域名', 'server_host', 'http://120.55.40.208:8180', '1', '第三方接口回调用', '1');
INSERT INTO `arc_sys_config` VALUES ('3', '10', 'manage服务域名', 'manage_host', 'http://120.55.40.208:8181', '1', '管理后台域名', '1');
INSERT INTO `arc_sys_config` VALUES ('4', '10', '移动端密钥', 'app_key', '52356CA1F8FACE8341409FBA9E872C5F', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('5', '10', '版本控制', 'check_version', '1.1.4', '1', '安卓version版本号', '1');
INSERT INTO `arc_sys_config` VALUES ('6', '10', '规则引擎配置表', 'rule_tables', 'cl_user_base_info,cl_user_equipment_info,cl_operator_req_log,cl_rc_fireeyes_black_log,cl_rc_dhb_risk_blacklist,cl_operator_basic,cl_tongdun_bodyguard_req_log,cl_paipaixin_req_log,cl_rc_agentr_blacklist_log,cl_three_elements_log,arc_user_rule,cl_tianjiscore360_req_log,cl_operator360_basic_info,cl_operator360_risk_analysis,cl_rc_dhb_risk_blacklist,cl_anti_fraud_log,cl_user_card_credit_log', '1', '规则引擎配置表', '1');
INSERT INTO `arc_sys_config` VALUES ('7', '10', '是否启用砍头息', 'behead_fee', '10', '1', '10 - 启用 20 - 关闭', '1');
INSERT INTO `arc_sys_config` VALUES ('8', '10', 'app是否开启定位', 'is_location', '10', '1', '10开启 20关闭', '1');
INSERT INTO `arc_sys_config` VALUES ('9', '20', '当日最大注册用户数', 'day_register_max', '1000000', '1', '当日最大注册用户数', '1');
INSERT INTO `arc_sys_config` VALUES ('10', '20', '当日放款上限', 'loan_ceiling', '10000', '1', '当日放款上限', '1');
INSERT INTO `arc_sys_config` VALUES ('11', '20', '注册时给予额度', 'init_credit', '1000', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('12', '20', '借款天数', 'borrow_day', '21', '1', '借款天数', '1');
INSERT INTO `arc_sys_config` VALUES ('13', '20', '借款额度', 'borrow_credit', '1000', '1', '借款额度', '1');
INSERT INTO `arc_sys_config` VALUES ('14', '20', '综合费用', 'fee', '0.2', '1', '商品费用', '1');
INSERT INTO `arc_sys_config` VALUES ('15', '20', '服务费', 'service_fee', '0', '0', '综合费用的75%', '1');
INSERT INTO `arc_sys_config` VALUES ('16', '20', '信息认证费', 'info_auth_fee', '0', '0', '综合费用的20%', '1');
INSERT INTO `arc_sys_config` VALUES ('17', '20', '借款利息', 'interest', '0.001', '1', '综合费用的5%', '1');
INSERT INTO `arc_sys_config` VALUES ('18', '20', '逾期利率', 'penalty_fee', '3-0.01', '1', '格式说明：借款天数-对应逾期利率', '1');
INSERT INTO `arc_sys_config` VALUES ('19', '20', '逾期罚金上限', 'penalty_amout_max', '0.82', '1', '超过本金一定比例后不再计算罚金', '1');
INSERT INTO `arc_sys_config` VALUES ('20', '20', '平台名称', 'title', '短贷王', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('21', '20', '平台电话', 'phone', '400-666-5910', '1', '400-666-5910', '1');
INSERT INTO `arc_sys_config` VALUES ('22', '20', '手机号码号段', 'phone_number_segment', '134,135,136,137,138,139,147,150,151,152,157,158,159,178,182,183,184,187,188,130,131,132,145,155,156,171,175,176,185,186,133,149,153,173,177,180,181,189,170', '1', '用于校验手机号码格式', '1');
INSERT INTO `arc_sys_config` VALUES ('23', '20', '借款失败后再次借款间隔（天）', 'again_borrow', '30', '1', '', '1');
INSERT INTO `arc_sys_config` VALUES ('24', '20', '平台收款账户信息-收款人', 'repay_collection_info_name', '风起银达信息技术（北京）有限公司', '1', '用于还款登记', '1');
INSERT INTO `arc_sys_config` VALUES ('25', '20', '平台收款账户信息-收款行', 'repay_collection_info_bank', '上海浦东发展银行股份有限公司北京清华园支行', '1', '用于还款登记', '1');
INSERT INTO `arc_sys_config` VALUES ('26', '20', '平台收款账户信息-银行卡', 'repay_collection_info_bank_card', '91310078801300000090', '1', '用于还款登记', '1');
INSERT INTO `arc_sys_config` VALUES ('27', '20', '平台收款账户信息-支付宝账号', 'repay_collection_info_alipay_account', 'hk@duandai.com 或 huankuan@shunfd.com', '1', '用于还款登记', '1');
INSERT INTO `arc_sys_config` VALUES ('28', '20', '记为坏账天数', 'bad_debt_day', '60', '1', '逾期多少天自动标记为坏账', '1');
INSERT INTO `arc_sys_config` VALUES ('29', '20', '代扣最大次数', 'do_repayment_max', '10', '1', '单笔还款计划代扣最大次数', '1');
INSERT INTO `arc_sys_config` VALUES ('30', '20', '是否代扣今天的待还', 'do_repayment_today', '20', '1', '10代扣，20不代扣', '1');
INSERT INTO `arc_sys_config` VALUES ('31', '20', '一级代理分润率', 'level_one', '20.00', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('32', '20', '普通用户分润率', 'level_three', '5.00', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('33', '20', '奖金发放下限', 'amount_grant_min', '100', '1', '达到一定额度才给予发放奖金', '1');
INSERT INTO `arc_sys_config` VALUES ('34', '20', '认证必填项总数', 'auth_total', '7', '1', ' ', '1');
INSERT INTO `arc_sys_config` VALUES ('35', '20', '人证识别比对合格率', 'idCard_credit_pass_rate', '0.6', '1', '用于个人信息中的人证识别', '1');
INSERT INTO `arc_sys_config` VALUES ('36', '20', '单日每人证识别最大次数', 'idCardCredit_day_most_times', '4', '1', '单日每人提交人脸识别最大次数', '1');
INSERT INTO `arc_sys_config` VALUES ('37', '20', '单日每人运营商认证最大次数', 'operatorCredit_day_most_times', '3', '1', '单日每人进行运营商认证的最大次数', '1');
INSERT INTO `arc_sys_config` VALUES ('38', '20', 'sdk识别每日可调用次数', 'sdk_time', '{\"faceTime\":\"3\",\"ocrTime\":\"6\"}', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('39', '20', '芝麻信用配置', 'zhima_auth', '10', '1', '10-去除 20-选填 30-必填', '1');
INSERT INTO `arc_sys_config` VALUES ('40', '20', '引流开关', 'divert_able', '10', '1', '10 - 开 20 - 关', '1');
INSERT INTO `arc_sys_config` VALUES ('41', '20', '引流地址', 'divert_url', 'http://wnd.mxtxing.com/ddw_extend.html', '1', 'APP引流地址', '1');
INSERT INTO `arc_sys_config` VALUES ('42', '20', '复借是否请求浅橙开关', 'reborrow_qiancheng_switch', '2', '1', '1 开 2 关', '1');
INSERT INTO `arc_sys_config` VALUES ('43', '20', '逾期等级天数', 'penalty_day_level', '30,60', '1', '逾期等级天数，M1 30天以下，M2 60天以下， M3 60天以上', '1');
INSERT INTO `arc_sys_config` VALUES ('44', '30', '注册协议', 'protocol_register', '/h5/protocol_register.jsp', '1', '注册协议', '1');
INSERT INTO `arc_sys_config` VALUES ('45', '30', '借款协议', 'protocol_borrow', '/h5/protocol_borrow.jsp', '1', '借款协议', '1');
INSERT INTO `arc_sys_config` VALUES ('46', '40', '还款帮助', 'h5_repay_help', '/h5/repay_help.jsp', '1', '还款帮助', '1');
INSERT INTO `arc_sys_config` VALUES ('47', '40', '还款方式', 'h5_repay_type', '/h5/repay_type.jsp', '1', '还款方式', '1');
INSERT INTO `arc_sys_config` VALUES ('48', '40', '关于我们', 'h5_about_us', '/h5/aboutUs.jsp', '1', '关于我们的', '1');
INSERT INTO `arc_sys_config` VALUES ('49', '40', '帮助中心', 'h5_help', '/h5/help.jsp', '1', '帮助中心', '1');
INSERT INTO `arc_sys_config` VALUES ('50', '40', '邀请页面', 'h5_invite', '/h5/index.jsp', '1', '邀请页面', '1');
INSERT INTO `arc_sys_config` VALUES ('51', '40', '邀请规则页面', 'h5_invite_rule', '/h5/invite_rule.jsp', '1', '邀请规则页面', '1');
INSERT INTO `arc_sys_config` VALUES ('52', '50', '绑卡备注', 'remark_bank_card', '备注\r\n1.借款通过申请后，我们将会将你的所借款项发放到该张银行卡；\r\n2.若申请重新绑卡，则新卡将激活为收款银行卡；\r\n3.未完成借款期间不允许更换银行卡。\r\n', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('53', '50', '邀请-我的奖金备注', 'remark_profit_amount', '系统会在每月10日将上月9日至本月10日的奖金汇款至您绑定的银行卡，请注意查收。', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('54', '50', '邀请用户备注', 'remark_invite', '1分钟认证，20分钟到账，无抵押，纯信用贷。时下最流行的移动贷款APP。国内首批利用大数据、人工智能实现风控审批的信贷服务平台。\r\n', '1', '邀请用户内容', '1');
INSERT INTO `arc_sys_config` VALUES ('55', '60', '短信通道', 'sms_passageway', '30', '1', '10大圣  20创蓝   30畅卓', '1');
INSERT INTO `arc_sys_config` VALUES ('56', '60', '创蓝短信通道参数', 'cl_sms_value', '{\"url\":\"http://sms.253.com/msg/send\",\"un\":\"N2116381\",\"pw\":\"BvpRkn869\",\"rd\":\"1\",\"ex\":\"\"}', '1', '创蓝短信需要的变量', '1');
INSERT INTO `arc_sys_config` VALUES ('57', '60', '发送短信APIHOST', 'sms_apihost', 'https://api.dsdatas.com/sms/api/getSmsParameSend', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('58', '60', '发送短信渠道编号', 'sms_channelNo', 'CH1945487800', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('59', '60', '发送短信接口名称', 'sms_interfaceName', 'movekSimpleInfo', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('60', '60', '短信验证码过期时间', 'sms_time_limit', '5', '1', '单位：分钟', '1');
INSERT INTO `arc_sys_config` VALUES ('61', '60', '短信获取倒计时', 'sms_countdown', '60', '1', '倒计时60秒', '1');
INSERT INTO `arc_sys_config` VALUES ('62', '60', '单日每类短信验证码允许获取的最大次数', 'sms_day_most_times', '{\"verifyTime\": 10,\"register\": 5,\"findReg\":5,\"findPay\": 5,\"bindCard\": 5}', '1', '单日每类短信验证码允许获取的最大次数', '1');
INSERT INTO `arc_sys_config` VALUES ('63', '60', '短信批量接口APIHOST', 'sms_apihost_batch', 'https://api.dsdatas.com/sms/api/getSmsParameSend', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('64', '60', '短信批量接口名称', 'sms_interfaceName_batch', 'movekSmsSend', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('65', '60', '获取短信报告结果', 'sms_apihost_report', 'https://api.dsdatas.com/smsSend/getReportByOrderNo', '1', '获取短信报告结果', '1');
INSERT INTO `arc_sys_config` VALUES ('66', '70', '大圣数据APIKEY', 'apikey', 'f21f56d4a9e0da760715e618f581d497', '1', '调用大圣数据接口用', '1');
INSERT INTO `arc_sys_config` VALUES ('67', '70', '大圣数据SECRETKEY', 'secretkey', '85d00e6c3aea6deddcd140f7ca25eee64f876373aee3e6b0d0f32e279f838fad', '1', '调用大圣数据接口用', '1');
INSERT INTO `arc_sys_config` VALUES ('68', '70', '商汤2.0/linkface OCR地址识别地址', 'linkface_idOcr', 'https://api.dsdatas.com/linkface/idOcr', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('69', '70', '商汤2.0/linkface 人证对比地址', 'linkface_liVerification', 'https://api.dsdatas.com/linkface/liVerification', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('70', '70', '运营商认证提供方', 'operator_type', '10', '1', '10 上树运营商,20 上树运营商2,30 同盾', '1');
INSERT INTO `arc_sys_config` VALUES ('71', '70', '运营商认证_商户号', 'operator_channelNo', 'CH0673607634', '1', '上数运营商验证用的商户号', '1');
INSERT INTO `arc_sys_config` VALUES ('72', '70', '运营商认证_接口', 'operator_interfaceName', 'buildAuthCollItemListUrl', '1', '上数运营商验证用的接口名', '1');
INSERT INTO `arc_sys_config` VALUES ('73', '70', '运营商认证_接口地址', 'operator_apihost', 'https://api.dsdatas.com/credit/api/v1.5/query', '1', '上数运营商验证用的域名', '1');
INSERT INTO `arc_sys_config` VALUES ('74', '70', '公积金认证_接口地址', 'acc_fund_apihost', 'https://api.dsdatas.com/credit/api/v1.5/query', '1', '上数公积金验证用的域名', '1');
INSERT INTO `arc_sys_config` VALUES ('75', '70', '天行银行卡四要素', 'tx_bankCard_four', 'https://api.dsdatas.com/credit/api/v1/query', '1', '天行银行卡四要素接口', '1');
INSERT INTO `arc_sys_config` VALUES ('76', '70', '四要素认证接口', 'four_elements_interfaceName', 'txbankCardFourCheckFourQuery', '1', '四要素认证接口', '1');
INSERT INTO `arc_sys_config` VALUES ('77', '80', '支付是否开启', 'lianlian_switch', '1', '1', '1开2关', '1');
INSERT INTO `arc_sys_config` VALUES ('78', '80', '连连支付商户号', 'lianlian_business_no', '201709200000938047', '1', '调用第三方支付接口用', '1');
INSERT INTO `arc_sys_config` VALUES ('79', '80', '连连支付公钥', 'lianlian_public_key', 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCSS/DiwdCf/aZsxxcacDnooGph3d2JOj5GXWi+q3gznZauZjkNP8SKl3J2liP0O6rU/Y/29+IUe+GTMhMOFJuZm1htAtKiu5ekW0GlBMWxf4FPkYlQkPE0FtaoMP3gYfh+OwI+fIRrpW3ySn3mScnc6Z700nU/VYrRkfcSCbSnRwIDAQAB', '1', '调用第三方支付接口用', '1');
INSERT INTO `arc_sys_config` VALUES ('80', '80', '连连支付私钥', 'lianlian_private_key', 'MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMLymr9qnSxEDw5pKqmVku41Z14d+Y2c1nKKZ21l+0/wWR8YoBSrW4w00I716xv+mm6STC3pHIhUv1LB5Y/39QxQwOI6iY/WrEYfr0MRKWVTkKLhdnE04AGTkx3ban6bRQ3mED1Qr5RXuVnW/3/V2L1wlRXSB2RZo21B4vDnMbV5AgMBAAECgYBjGjmYvXYRHrgYt1W8yBDdj8BwlARc/TH3IGzbrFBJnwFvUXFvkH0FlYPAaTuQC6ouM6kOXcbnd02boH425fJn4Pj7s7AgLZt2XRbAvmz6171eEiGb7b3lTULYFTrzK8bEimczCaFPuUTZS0WR/y1DPNLemvxkWypzIbiuqzmqAQJBAOmdyoYZFawCGFl8C/4x+bmTmRoF4p2hkgKZtKSgiDRoDcdbFealhQenhSNmKYhoqfmxNRbUFO1q41u5Uh9uo+kCQQDVoFYnuzpoK5PYHE2AlqdYw9r41blZezVMH+HSSijB069eFlR/Xg0EuzpYMupCgGDXckg0fgjTWWiUd7+DzVsRAkBIoh6Ngs8SI7SeXcr8xVz3LcS0KpBCojFbTZ60cJTodlGSYed1RpENyC/Eycav+pqeX1I6PsYi6tC1e/DkhOnBAkEAyoH56iQUVBerSRxbY+BstzrC40xHLkob1hQLEDv4svUmsvxcEXlowelyf5WUeIIWS2YsiIZJe4CwIL37sMgE4QJAHNmruXqpNKjmYjVX+WPV+KYRieXminP851nIOGXploTYyAjeyS2C7yVCF+7iy7Hg7YUdWQQSXqa+cg9JCbQKTQ==', '1', '调用第三方支付接口用', '1');
INSERT INTO `arc_sys_config` VALUES ('81', '80', '连连对账SFTP配置', 'lianlian_sftp', '{\"host\":\"hz-sftp1.lianlianpay.com\",\"port\":\"\",\"user\":\"\",\"passwd\":\"\",\"path\":\"\"}', '1', '连连对账SFTP配置', '1');
INSERT INTO `arc_sys_config` VALUES ('82', '80', '芝麻应用标识', 'zhima_app_id', '300000587', '1', '反欺诈和行业关注名单用', '1');
INSERT INTO `arc_sys_config` VALUES ('83', '80', '芝麻公钥', 'zhima_public_key', 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDrqXpX8Syo0qVd9KnZ+g1iR32p9s+BtpbBtbiAuZQ6ug2U8bheoES503ZV9ajNKlONV8Kyh0fc7msn0vwib4LCqqdeDIn+fqqxowxO3xt0R7koP88Bp2i4MLv25ilBU6Z2lNQzFE1r7FE4FztbbRlVgjEfvXtI+zH3AmJycTtzawIDAQAB', '1', '反欺诈和行业关注名单用', '1');
INSERT INTO `arc_sys_config` VALUES ('84', '80', '商家私钥', 'zhima_private_key', 'MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAMkrYyqBwU/ElQuHsRiH2b/BSQC9XnLeDnWFAOebeEhTGzk1x2kLJgPt7VcfyM57mundnRssG97upnfRCOaVGYsv75VKZrfYvRacAs4kkUzGIrt0xqAMgEMxSUXTYI+ce0TRl6AhyhB5CbaNqxXmxvjs9IUTF2X7oY8tezbsAZVLAgMBAAECgYEAiraWLItIRr6gn1CzdtzF8wlOU2pApCgmBDbwBsQXTpevn+VLWU1Mq0z2aSsLhgWJLlWXrVLe7PvWYawL3SNWdoAx7PsHDDDZ/g5He8raCmZh6jId6ReAaDtVKRZkySWvdTLAHEoEsfQgr77PlfHUaY/kZ6J40R3rWamZbHmZy3ECQQDq/gE8LIiqgTlZJnqjmBZscMAK0soH20d7sDS2EDxVV86JBE3bwDr3NZo1UqNwaHlxeFEk+upOYOlNWwD83A+nAkEA2ydSJ739a4oDWdQ8d9euD2RHMDbp6raL0PxfFA7UW3MeK1wGf4sqWjcoZES0wdX5w8JQsR6gdf5ndv05MP6hvQJBANmKd547I/GkW3C6fIICA5Az+LSMWtdXGh/ZCZMaCKCA/wQ85c7vcCb2imGetQsUzIhM9+GiH1KbyJ8CBjIPjrUCQByIuRytkxJubNNEW/8qmOIuJ0qyy7AgxoGWana9G48wpOv2Vm5C22fVqK+tdm+KgbOoWENHfpL+ZdBLVif3720CQQCQZ3ebuhs7/GjC6B8s+UAyM2+dY+ccY3Ol24gG56rIUMGcm2QLIfYjOVbl+I2IesDtSRm/63SzZiykUi1QhvbO', '1', '反欺诈和行业关注名单用，其实是商家私钥，code值主要是为了不冲突。。', '1');
INSERT INTO `arc_sys_config` VALUES ('85', '80', '同盾是否请求测试环境', 'tongdun_url_state', '1', '1', '同盾是否请求测试环境   1正式环境  0测试环境', '1');
INSERT INTO `arc_sys_config` VALUES ('86', '80', '同盾运营商认证授权地址', 'operator_identify_url', '', '1', '同盾运营商认证授权地址', '1');
INSERT INTO `arc_sys_config` VALUES ('87', '80', '同盾商户秘钥', 'tongdun_operator_partner_key', '', '1', '同盾商户秘钥', '1');
INSERT INTO `arc_sys_config` VALUES ('88', '80', '同盾商户标识', 'tongdun_operator_partner_code', '', '1', '同盾商户标识', '1');
INSERT INTO `arc_sys_config` VALUES ('89', '80', '同盾运营商信息查询接口', 'tongdun_operator_query_url', 'https://api.shujumohe.com/octopus/task.unify.query/v3', '1', '同盾运营商信息查询接口', '1');
INSERT INTO `arc_sys_config` VALUES ('90', '80', 'e签宝签署账号标识', 'account_id', '32EB904AA168438A9D0F480AC939511E', '1', '', '1');
INSERT INTO `arc_sys_config` VALUES ('91', '80', 'e签宝企业机构名称', 'organ_name', '****科技有限公司', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('92', '80', 'e签宝组织机构代号', 'organ_code', '****', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('93', '80', 'e签宝组织机构类型', 'reg_type', 'MERGE', '1', '企业注册类型，NORMAL（组织机构代码）、MERGE（社会信用代码）、REGCODE（工商注册号）', '1');
INSERT INTO `arc_sys_config` VALUES ('94', '80', 'e签宝部署服务器域名', 'tech_host', 'http://10.10.2.124:8080', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('95', '80', 'e签宝签署id', 'project_id', '****', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('96', '80', 'e签宝签署秘钥', 'project_secret', '****', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('97', '80', 'e签宝开放平台地址', 'itsm_api_url', 'http://121.43.159.210:8080/tgmonitor/rest/app!getAPIInfo2', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('99', '20', '费用集合', 'fee_map', '服务费-0.75,信息认证费-0.2,借款利息-0.05', '1', '费用集合', '1');
INSERT INTO `arc_sys_config` VALUES ('100', '70', '人证识别接口类别', 'verify_type', '30', '1', '10-face++,20-小视,30-商汤', '1');
INSERT INTO `arc_sys_config` VALUES ('101', '20', '四要素认证开关', 'four_elements_switch', '20', '1', '四要素认证开关', '1');
INSERT INTO `arc_sys_config` VALUES ('102', '20', '单日每人四要素认证最大次数', 'four_elements_verity_most_time', '5', '1', '单日每人四要素认证最大次数', '1');
INSERT INTO `arc_sys_config` VALUES ('106', '70', '天行查询渠道号', 'tx_channelNo', 'CH0844282371', '1', null, '1');
INSERT INTO `arc_sys_config` VALUES ('108', '10', '安卓APP包下载地址', 'app_android_downloadurl', 'http://down.duandai.com/android/duandai_1.1.4_fqyd.apk', '1', null, '8');
INSERT INTO `arc_sys_config` VALUES ('109', '60', '畅卓短信appid', 'sms_changzhuo_appid', '98a993', '1', null, '8');
INSERT INTO `arc_sys_config` VALUES ('110', '60', '畅卓短信appkey', 'sms_changzhuo_appkey', 'fu8cka5n7g', '1', null, '8');
INSERT INTO `arc_sys_config` VALUES ('111', '60', '畅卓短信接口地址', 'sms_changzhuo_apihost', 'http://api.chanzor.com/send', '1', null, '8');
INSERT INTO `arc_sys_config` VALUES ('112', '10', 'IOS版本控制', 'check_ios_version', '1.0.0', '1', '苹果version版本号', '8');
INSERT INTO `arc_sys_config` VALUES ('113', '60', '每个手机号最多发送注册验证码次数', 'most_regmessage_sendtimes', '5', '1', null, '8');
INSERT INTO `arc_sys_config` VALUES ('114', '60', '华信短信发送url', 'sms_huaxin_send_url', 'https://dx.ipyy.net/ensms.ashx', '1', null, '8');
INSERT INTO `arc_sys_config` VALUES ('115', '60', '华信短信商户id', 'sms_huaxin_uerId', '53970', '1', null, '8');
INSERT INTO `arc_sys_config` VALUES ('116', '60', '华信短信账号id', 'sms_huaxin_userName', 'AB00359', '1', null, '8');
INSERT INTO `arc_sys_config` VALUES ('117', '60', '华信短信密码', 'sms_huaxin_password', 'AB0035945', '1', null, '8');
INSERT INTO `arc_sys_config` VALUES ('118', '60', '极光app推送url', 'jiguang_push_url', 'https://api.jpush.cn', '1', null, '8');
INSERT INTO `arc_sys_config` VALUES ('119', '60', '极光推送appkey', 'jiguang_push_app_key', 'f005fa274903b512cd111542', '1', null, '8');
INSERT INTO `arc_sys_config` VALUES ('120', '60', '极光推送密钥', 'jiguang_push_master_secret', '0a4acf55640a36c6552703d6', '1', null, '8');
INSERT INTO `arc_sys_config` VALUES ('121', '20', '苹果App需要的公司名称', 'ios_company_name', '风起银达信息技术（北京）有限公司', '1', null, '8');
INSERT INTO `arc_sys_config` VALUES ('122', '20', '芝麻分值', 'zhima_score', '700', '0', '芝麻分分值大于参数值，直接放款', '8');
INSERT INTO `arc_sys_config` VALUES ('123', '60', '极光推送：逾期天数配置', 'push_over_due_config', '1,2,3,4,5,6,7', '1', '参数值：数字之间用英文逗号隔开,逾期几天后发送消息', '8');
INSERT INTO `arc_sys_config` VALUES ('124', '60', '催告，催收短信渠道', 'sms_repay_channle_flag', '20', '1', '10：云融短信渠道\n20：陈紫推荐渠道\n30：未来无线渠道', '8');
INSERT INTO `arc_sys_config` VALUES ('125', '60', '云融发送短信url', 'sms_yunrong_send_url', 'http://101.201.238.246/MessageTransferWebAppJs/servlet/messageTransferServiceServletByJson', '1', null, '8');
INSERT INTO `arc_sys_config` VALUES ('126', '60', '云融短信用户名', 'sms_yunrong_userName', 'qianhaihy', '1', null, '8');
INSERT INTO `arc_sys_config` VALUES ('127', '60', '云融短信密码', 'sms_yunrong_password', '888888', '1', null, '8');
INSERT INTO `arc_sys_config` VALUES ('128', '60', '逾期短信天数配置', 'sms_over_due_config', '1', '1', '参数值：数字之间用英文逗号隔开,逾期几天后发送消息', '14');
INSERT INTO `arc_sys_config` VALUES ('129', '60', '陈紫推荐渠道url', 'sms_chenzi_send_url', 'http://116.62.64.214/msg/HttpBatchSendSM', '1', null, '14');
INSERT INTO `arc_sys_config` VALUES ('133', '60', '陈紫推荐渠道user_name', 'sms_chenzi_userName', 'ydxx88', '1', null, '14');
INSERT INTO `arc_sys_config` VALUES ('134', '60', '陈紫推荐渠道pass_word', 'sms_chenzi_password', 'L4j3D6YZ', '1', null, '14');
INSERT INTO `arc_sys_config` VALUES ('135', '60', '未来无线url', 'sms_weilaiwuxian_send_url', 'http://43.243.130.33:8860/sendSms', '1', null, '14');
INSERT INTO `arc_sys_config` VALUES ('136', '60', '未来无线userName', 'sms_weilaiwuxian_userName', '500213', '1', null, '14');
INSERT INTO `arc_sys_config` VALUES ('137', '60', '未来无线密码', 'sms_weilaiwuxian_password', 'WJAYQJNN67', '1', null, '14');
INSERT INTO `arc_sys_config` VALUES ('138', '20', '满足一定条件，是否获取第三方征信数据开关', 'third_data_get_switch', '1', '1', '1：开启 0：不开启，申请就获取第三方征信数据', '8');
INSERT INTO `arc_sys_config` VALUES ('139', '20', '是否获取申请借款用户第三方征信数据 - 芝麻分参数', 'third_data_get_switch_zhima', '750', '1', 'third_data_get_switch为1时有意义，需要规则配合', '8');
INSERT INTO `arc_sys_config` VALUES ('140', '20', '放款审核', 'manual_loan', '20', '1', '10:放款审核；20:放款不审核', '8');
INSERT INTO `arc_sys_config` VALUES ('141', '20', '视为复贷时间间隔', 'borrow_again_interval', '48', '1', '还款后几个小时内再次申请借款算复贷，禁用任何情况的再次申请借款都不算复贷', '8');
INSERT INTO `arc_sys_config` VALUES ('142', '80', '##默认编码格式##', 'char.set', 'UTF-8', '1', null, null);
INSERT INTO `arc_sys_config` VALUES ('143', '80', '宝付商户私钥路径', 'pfx.name', 'fqydnaofu171143.pfx', '1', null, null);
INSERT INTO `arc_sys_config` VALUES ('144', '80', '宝付商户私钥密码', 'pfx.pwd', '171143', '1', null, null);
INSERT INTO `arc_sys_config` VALUES ('145', '80', '宝付公钥路径', 'cer.name', 'baofu.cer', '1', null, null);
INSERT INTO `arc_sys_config` VALUES ('146', '80', '宝付商户号', 'member.id', '1214478', '1', null, null);
INSERT INTO `arc_sys_config` VALUES ('147', '80', '宝付终端号', 'terminal.id', '40031', '1', null, null);
INSERT INTO `arc_sys_config` VALUES ('148', '80', '数据类型', 'data.type', 'json', '1', null, null);
INSERT INTO `arc_sys_config` VALUES ('149', '80', '接口版本号', 'version', '4.0.0.0', '1', null, null);
INSERT INTO `arc_sys_config` VALUES ('150', '80', '交易类型', 'txn.type', '0431', '1', null, null);
INSERT INTO `arc_sys_config` VALUES ('151', '80', '接口地址', 'post.url', 'https://public.baofoo.com/cutpayment/api/backTransRequest', '1', null, null);
INSERT INTO `arc_sys_config` VALUES ('152', '20', '短贷王服务器IP地址', 'duandai_ip', '124.193.181.82', '1', '用于判断是否是短贷王的服务器访问黑名单接口', '8');
INSERT INTO `arc_sys_config` VALUES ('153', '20', '邮箱发送人', 'email_to', 'liuxiaoliang@duandai.com', '1', null, null);
INSERT INTO `arc_sys_config` VALUES ('154', '20', '常用联系人', 'top_contact_limit', '20', '1', null, null);

-- ----------------------------
-- Table structure for arc_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `arc_sys_dict`;
CREATE TABLE `arc_sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `type_code` varchar(64) DEFAULT NULL COMMENT '类型编码',
  `type_name` varchar(32) DEFAULT NULL COMMENT '类型名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(30) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `type_code` (`type_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='数据字典表';

-- ----------------------------
-- Records of arc_sys_dict
-- ----------------------------
INSERT INTO `arc_sys_dict` VALUES ('2', 'PRODUCT_TYPE', '借款类型', '20', '借款类型');
INSERT INTO `arc_sys_dict` VALUES ('6', 'RANK_TYPE', '授信等级', '10', '授信等级');
INSERT INTO `arc_sys_dict` VALUES ('7', 'CREDIT_TYPE', '额度类型', '30', '额度类型');
INSERT INTO `arc_sys_dict` VALUES ('8', 'CONTACT_RELATION', '联系人关系类型', '40', '联系人关系类型');
INSERT INTO `arc_sys_dict` VALUES ('9', 'EDUCATIONAL_STATE', '教育程度', '36', '教育程度');
INSERT INTO `arc_sys_dict` VALUES ('10', 'MARITAL_STATE', '婚姻状况', '28', '婚姻状况');
INSERT INTO `arc_sys_dict` VALUES ('11', 'LIVE_TIME', '居住时长', '27', '居住时长');
INSERT INTO `arc_sys_dict` VALUES ('12', 'WORK_TIME', '工作时长', '26', '工作时长');
INSERT INTO `arc_sys_dict` VALUES ('13', 'SALARY_RANGE', '月薪范围', '25', '月薪范围');
INSERT INTO `arc_sys_dict` VALUES ('14', 'BANK_TYPE', '银行代码', '24', '银行代码');
INSERT INTO `arc_sys_dict` VALUES ('15', 'SYSTEM_TYPE', '系统参数类别', '41', '系统参数类别');
INSERT INTO `arc_sys_dict` VALUES ('16', 'URGE_WAY', '催收方式', '42', '催收方式');
INSERT INTO `arc_sys_dict` VALUES ('18', 'URGE_STATE', '催收状态', '43', '催收状态');
INSERT INTO `arc_sys_dict` VALUES ('20', 'THIRD_DATA_SCENE', '借款场景', '45', '借款场景');
INSERT INTO `arc_sys_dict` VALUES ('21', 'KINSFOLK_RELATION', '直系联系人', '46', '直系联系人');

-- ----------------------------
-- Table structure for arc_sys_dict_detail
-- ----------------------------
DROP TABLE IF EXISTS `arc_sys_dict_detail`;
CREATE TABLE `arc_sys_dict_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `item_code` varchar(64) DEFAULT NULL COMMENT '参数编码',
  `item_value` varchar(32) DEFAULT NULL COMMENT '参数值',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级ID',
  `state` varchar(2) NOT NULL DEFAULT '10' COMMENT '状态  10 有效 20 无效',
  PRIMARY KEY (`id`),
  KEY `item_code` (`item_code`) USING BTREE,
  KEY `parent_id_index` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COMMENT='字典表数据明细';

-- ----------------------------
-- Records of arc_sys_dict_detail
-- ----------------------------
INSERT INTO `arc_sys_dict_detail` VALUES ('1', '01', '现金贷', '2', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('2', '01', 'A', '6', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('3', '02', 'B', '6', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('4', '03', 'C', '6', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('5', '01', '房贷额度', '7', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('6', '02', '车贷额度', '7', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('10', '01', '配偶', '46', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('11', '02', '子女', '46', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('12', '03', '父亲', '46', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('13', '04', '母亲', '46', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('14', '05', '同学', '8', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('15', '01', '初中及小学以下', '9', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('16', '02', '中专/职高/高中', '9', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('17', '03', '高职/大专', '9', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('18', '04', '本科', '9', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('19', '05', '硕士', '9', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('20', '06', '博士', '9', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('21', '07', '博士后', '9', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('22', '01', '未婚', '10', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('23', '02', '已婚', '10', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('24', '03', '离异', '10', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('25', '04', '丧偶', '10', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('26', '01', '半年以内', '11', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('27', '02', '半年到一年', '11', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('28', '03', '一年以上', '11', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('29', '01', '一年以下', '12', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('30', '02', '一年至三年', '12', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('31', '03', '三年至五年', '12', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('32', '04', '五年以上', '12', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('33', '01', '5千以下', '13', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('34', '02', '5千至1万', '13', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('35', '03', '1万至2万', '13', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('36', '04', '2万以上', '13', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('37', '01', '中国工商银行', '14', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('38', '02', '中国农业银行', '14', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('39', '03', '中国银行', '14', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('40', '04', '中国建设银行', '14', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('41', '05', '交通银行', '14', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('42', '06', '中信银行', '14', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('43', '07', '光大银行', '14', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('44', '08', '华夏银行', '14', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('45', '09', '民生银行', '14', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('46', '10', '广发银行', '14', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('47', '11', '平安银行', '14', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('48', '12', '招商银行', '14', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('49', '30', '协议参数', '15', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('50', '20', '业务参数', '15', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('51', '10', '系统关键参数', '15', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('52', '06', '亲戚', '8', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('53', '40', 'H5参数', '15', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('54', '70', '大圣', '15', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('55', '80', '第三方', '15', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('56', '50', '备注参数', '15', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('57', '60', '短信参数', '15', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('58', '10', '电话', '16', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('59', '20', '邮件', '16', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('60', '30', '短信', '16', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('61', '40', '现场沟通', '16', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('62', '50', '其他', '16', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('66', '20', '催收中', '18', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('67', '30', '承诺还款', '18', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('68', '40', '催收成功', '18', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('69', '50', '坏账', '18', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('70', 'father', '父亲', '21', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('75', 'mother', '母亲', '21', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('76', 'son', '儿子', '21', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('77', 'daughter', '女儿', '21', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('78', 'brother', '兄弟', '21', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('79', 'sister', '姐妹', '21', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('80', 'spouse', '配偶', '21', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('81', 'coworker', '同事', '8', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('82', 'friend', '朋友', '8', '10');
INSERT INTO `arc_sys_dict_detail` VALUES ('83', 'others', '其他', '8', '10');

-- ----------------------------
-- Table structure for arc_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `arc_sys_menu`;
CREATE TABLE `arc_sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sys_type` tinyint(3) DEFAULT '0' COMMENT '类型  0公用',
  `name` varchar(128) DEFAULT '' COMMENT '菜单名称',
  `parent_id` int(11) unsigned DEFAULT NULL COMMENT '父级ID',
  `href` varchar(512) DEFAULT '' COMMENT '链接地址',
  `icon_cls` varchar(512) DEFAULT '' COMMENT '图标',
  `sort` int(11) unsigned zerofill DEFAULT '00000000000' COMMENT '排序',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `add_user` varchar(128) DEFAULT '' COMMENT '添加者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` varchar(128) DEFAULT '' COMMENT '修改者',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  `is_delete` tinyint(2) DEFAULT NULL COMMENT '是否删除 ：0不删除，1删除',
  `scriptid` varchar(255) DEFAULT NULL COMMENT '脚本名称',
  `controller_name` varchar(255) DEFAULT NULL COMMENT '控制器名字',
  `leaf` tinyint(1) DEFAULT NULL COMMENT '是否为子节点  1 true 0 false',
  `level` tinyint(2) unsigned zerofill DEFAULT NULL COMMENT '树状层数据',
  `scriptid_old` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of arc_sys_menu
-- ----------------------------
INSERT INTO `arc_sys_menu` VALUES ('1', '0', '工作台', '0', '', 'icon-yonghuxinxi', '00000000001', null, '', '2017-01-01 00:00:00', '', '工作台', '0', 'ShowWorkbench', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('2', '0', '用户管理', '0', '', 'icon-yonghuxinxi', '00000000002', null, '', '2017-08-31 15:32:01', '', '用户信息', '0', 'UserInformation', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('3', '0', '代理商管理', '0', '', 'icon-dailishang', '00000000003', null, '', '2017-01-01 00:00:00', '', '代理商管理-管理员', '0', 'AgentManage', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('4', '0', '一级代理商管理', '0', '', 'icon-dailishang', '00000000004', null, '', '2017-01-01 00:00:00', '', '代理商管理-代理商', '0', 'AgentBranchManage', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('5', '0', '征信引擎', '0', '', 'icon-tongji', '00000000005', null, '', '2017-09-07 10:10:08', '', '征信数据获取', '0', 'ThirdPartyInquiry', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('6', '0', '规则引擎', '0', '', 'icon-guizeshuoming', '00000000006', null, '', '2017-01-01 00:00:00', '', null, '0', null, null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('7', '0', '风控管理', '0', '', 'icon-zhuanyefengkong', '00000000007', null, '', '2017-01-01 00:00:00', '', '风控管理', '0', 'RiskControlManage', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('8', '0', '借款管理', '0', '', 'icon-jiekuanjilu', '00000000008', null, '', '2017-01-01 00:00:00', '', '借款管理', '0', '', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('9', '0', '支付管理', '0', '', 'icon-qian', '00000000009', null, '', '2017-01-01 00:00:00', '', '打款管理', '0', null, null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('10', '0', '还款管理', '0', '', 'icon-qian', '00000000010', null, '', '2017-01-01 00:00:00', '', '还款管理', '0', 'RepaymentManage', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('11', '0', '贷后管理', '0', '', 'icon-qian', '00000000011', null, '', '2017-01-01 00:00:00', '', '贷后管理', '0', null, null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('12', '0', '催收人员管理', '0', '', 'icon-renyuan', '00000000012', null, '', '2017-01-01 00:00:00', '', '催收人员管理', '0', 'CollectionPersonnelManage', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('13', '0', '催收订单管理', '0', '', 'icon-dingdan', '00000000013', null, '', '2017-01-01 00:00:00', '', '催收订单管理', '0', 'CollectionOrderListManage', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('14', '0', '我的催收订单', '0', '', 'icon-wodedingdan', '00000000014', null, '', '2017-01-01 00:00:00', '', '我的催收订单管理', '0', 'MyCollectionOrderManage', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('15', '0', '催收预警', '0', '', 'icon-yujingxiaoxi', '00000000015', null, '', '2017-01-01 00:00:00', '', '催收预警', '0', null, null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('16', '0', '催收统计', '0', '', 'icon-tongji', '00000000016', null, '', '2017-01-01 00:00:00', '', '催收统计管理', '0', null, null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('17', '0', '风控数据', '0', '', 'icon-zhuanyefengkong', '00000000017', null, '', '2017-01-01 00:00:00', '', '风控数据', '0', 'WindControlData', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('18', '0', '运营数据', '0', '', 'icon-tongji', '00000000018', null, '', '2017-01-01 00:00:00', '', ' 运营数据', '0', 'OperationalData', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('19', '0', '统计管理', '0', '', 'icon-tongji', '00000000019', null, '', '2017-01-01 00:00:00', '', ' 统计管理', '0', 'StatisticalManagement', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('20', '0', '系统管理', '0', null, 'icon-xitongguanli', '00000000020', '2017-01-01 00:00:00', null, '2017-01-01 00:00:00', null, '1', '0', 'sysManage', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('21', '0', '消息管理', '0', '', 'icon-tongji', '00000000021', null, '', '2017-08-30 17:37:47', '', '消息管理', '0', 'newsManage', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('22', '0', '定时任务', '0', '', 'icon-tongji', '00000000022', null, '', '2017-08-30 17:37:13', '', '定时任务', '0', 'TimedTask', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('23', '0', '广告管理', '0', '', 'icon-zhuanyefengkong', '00000000023', null, '', '2017-01-01 00:00:00', '', '广告管理', '0', 'AdverManage', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('24', '0', '渠道管理', '0', '', 'icon-tongji', '00000000024', null, '', '2017-08-30 17:37:35', '', '渠道管理', '0', 'PipelineManage', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('25', '0', '用户信息', '2', '', null, '00000000001', null, '', '2017-01-01 00:00:00', '', '用户基本信息', '0', 'UserBasicInformation', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('26', '0', '用户认证信息', '2', '', null, '00000000002', null, '', '2017-01-01 00:00:00', '', '用户认证信息', '0', 'UserAuthenticationList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('27', '0', '用户通讯录', '2', '', null, '00000000003', null, '', null, '', null, null, 'UserAddressBook', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('28', '0', '用户反馈列表', '2', '', null, '00000000004', null, '', null, '', '用户反馈列表', '0', 'UserFeedback', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('29', '0', '黑/白名单管理', '2', '', null, '00000000005', null, '', null, '', '黑/白名单管理', '0', 'BlackCustomerList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('30', '0', '用户代理等级', '3', '', null, '00000000001', null, '', '2017-01-01 00:00:00', '', '用户代理等级', '0', 'OrdinaryUserList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('31', '0', '代理商列表', '3', '', null, '00000000002', null, '', '2017-01-01 00:00:00', '', '代理商列表', '0', 'AgentList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('32', '0', '奖励资金账户', '3', '', null, '00000000003', null, '', '2017-01-01 00:00:00', '', '奖励资金账户', '0', 'CashCheck', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('33', '0', '奖励获得记录', '3', '', null, '00000000004', null, '', '2017-01-01 00:00:00', '', '奖励获得记录', '0', 'ShareDetail', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('34', '0', '奖励打款记录', '3', '', null, '00000000005', null, '', '2017-01-01 00:00:00', '', '奖励打款记录', '0', 'CashRecord', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('35', '0', '代理商管理', '4', '', null, '00000000001', null, '', null, '', '代理商管理', '0', 'AgentModuleAdminBranch', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('36', '0', '奖励资金账户', '4', '', null, '00000000002', null, '', '2017-01-01 00:00:00', '', '奖励资金账户', '0', 'CashCheckBranch', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('37', '0', '奖励获得记录', '4', '', null, '00000000003', null, '', '2017-01-01 00:00:00', '', '奖励获得记录', '0', 'ShareDetailBranch', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('38', '0', '奖励打款记录', '4', '', null, '00000000004', null, '', '2017-01-01 00:00:00', '', '奖励打款记录', '0', 'CashRecordBranch', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('39', '0', '第三方征信', '5', '', null, '00000000001', null, '', '2017-09-07 10:10:24', '', '第三方征信', '0', 'ThirdPartyInquiry', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('40', '0', '数据获取机制', '5', '', null, '00000000002', null, '', '2017-09-07 10:10:55', '', '数据获取机制', '0', 'ScenePortManage', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('41', '0', '表字段维护', '6', '', null, '00000000001', null, '', '2017-01-01 00:00:00', '', null, '0', 'FormFieldsToAdd', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('42', '0', '规则配置', '6', '', 'icon', '00000000002', null, '', '2017-01-01 00:00:00', '', 'ds', '0', 'ruleEngine', null, '1', '02', null);
INSERT INTO `arc_sys_menu` VALUES ('43', '0', '规则类型绑定', '6', '', null, '00000000003', null, '', '2017-01-01 00:00:00', '', '规则类型绑定', '0', 'BorrowingRulesManagement', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('44', '0', '规则匹配记录', '6', '', null, '00000000004', null, '', '2017-01-01 00:00:00', '', null, '1', 'RulesMatchResults', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('45', '0', '待机审订单', '7', '', null, '00000000001', null, '', '2017-01-01 00:00:00', '', '待机审订单列表', '0', 'StandbyReviewList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('46', '0', '机审通过订单', '7', '', null, '00000000002', null, '', null, '', '机审通过订单', '0', 'MachinePassList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('47', '0', '机审拒绝订单', '7', '', null, '00000000003', null, '', null, '', '机审拒绝订单列表', '0', 'RejectedOrderList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('48', '0', '浅橙贷前审核记录', '7', '', null, '00000000004', null, '', null, '', '浅橙贷前审核记录', '0', 'MachineRequestRecord', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('49', '0', '人工复审', '7', '', null, '00000000005', null, '', null, '', '人工复审', '0', 'LoanApplicationManage', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('50', '0', '发布借款', '8', '', null, '00000000001', null, '', '2017-01-01 00:00:00', '', null, '1', 'TargetRelease', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('51', '0', '借款订单', '8', '', null, '00000000002', null, '', '2017-01-01 00:00:00', '', ' 用户借款管理', '0', 'LoanInformation', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('52', '0', '借款进度', '8', '', null, '00000000003', null, '', '2017-01-01 00:00:00', '', '借款进度', '0', 'LoanSchedule', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('53', '0', '放款订单', '8', '', null, '00000000004', null, '', null, '', '放款列表', '0', 'LoanList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('54', '0', '支付记录', '9', '', null, '00000000001', null, '', '2017-01-01 00:00:00', '', '支付记录', '0', 'remitList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('55', '0', '支付审核', '9', '', null, '00000000002', null, '', '2017-01-01 00:00:00', '', '放款支付审核', '0', 'remitCheck', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('56', '0', '支付对账记录', '9', '', null, '00000000003', null, '', '2017-01-01 00:00:00', '', '支付对账记录', '0', 'CheckManagement', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('57', '0', '还款计划', '10', '', null, '00000000001', null, '', '2017-01-01 00:00:00', '', '还款计划列表', '0', 'RepaymentPlanList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('58', '0', '还款记录', '10', '', null, '00000000002', null, '', '2017-01-01 00:00:00', '', '还款记录', '0', 'PaymentHistory', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('59', '0', '代扣支付记录', '10', '', null, '00000000003', null, '', '2017-01-01 00:00:00', '', '代扣支付记录', '0', 'DeductionsList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('60', '0', '支付宝还款记录', '10', '', null, '00000000004', null, '', '2017-01-01 00:00:00', '', '支付宝还款记录列表', '0', 'AlipayPaymentList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('61', '0', '银行卡还款记录', '10', '', null, '00000000005', null, '', '2017-01-01 00:00:00', '', '银行卡还款记录列表', '0', 'BankCardPaymentList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('62', '0', '已还款订单', '11', '', null, '00000000001', null, '', '2017-01-01 00:00:00', '', '已还款列表', '0', 'RepaymentList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('63', '0', '已逾期订单', '11', '', null, '00000000002', null, '', '2017-01-01 00:00:00', '', '已逾期列表', '0', 'OverdueList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('64', '0', '已坏账订单', '11', '', null, '00000000003', null, '', null, '', '已坏账订单', '0', 'BadDebtsList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('65', '0', '催收员', '12', '', null, '00000000001', null, '', '2017-01-01 00:00:00', '', '催收员列表', '0', 'CollectionPersonnelList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('66', '0', '催收总订单', '13', '', null, '00000000001', null, '', null, '', '催收总订单列表', '0', 'CollectionTotalOrderList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('67', '0', '待催收订单', '13', '', null, '00000000002', null, '', null, '', '待催收记录列表', '0', 'CollectionRecordList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('68', '0', '催收反馈', '13', '', null, '00000000003', null, '', '2017-01-01 00:00:00', '', '催收反馈', '0', 'CollectionFeedback', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('69', '0', '我的订单', '14', '', null, '00000000001', null, '', null, '', '我的订单', '0', 'MyOrder', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('70', '0', '待催收订单', '14', '', null, '00000000002', null, '', null, '', '待催收列表', '0', 'WaitCollectionList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('71', '0', '催收中订单', '14', '', null, '00000000003', null, '', null, '', '催收中列表', '0', 'CollectionInList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('72', '0', '承诺还款订单', '14', '', null, '00000000004', null, '', null, '', '承诺还款列表', '0', 'CommitmentRepaymentList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('73', '0', '催收成功订单', '14', '', null, '00000000005', null, '', null, '', '催收成功列表', '0', 'CollectionSuccessList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('74', '0', '催收反馈', '14', '', null, '00000000006', null, '', null, '', '催收反馈', '0', 'CollectionFeedbackManage', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('75', '0', '未还款已出催', '15', '', null, '00000000001', null, '', null, '', '未还款已出催', '0', 'NoRepaymentPutForward', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('76', '0', '未分配催收员', '15', '', null, '00000000002', null, '', null, '', '未分配催收员', '0', 'UnallocatedCollection', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('77', '0', '催回率统计', '16', '', null, '00000000001', null, '', null, '', '催回率统计', '0', 'RecoveryRateStatistics', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('78', '0', '催收订单统计', '16', '', null, '00000000002', null, '', null, '', '催收订单统计', '0', 'CollectionOrderStatistics', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('79', '0', '催收员每日统计', '16', '', null, '00000000003', null, '', null, '', '催收员每日统计', '0', 'CollectionDailyStatistics', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('80', '0', '每日通过率', '17', '', null, '00000000001', null, '', null, '', '每日通过率', '0', 'DailyPassRate', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('81', '0', '平台数据日报', '17', '', null, '00000000002', null, '', null, '', '平台数据日报', '0', 'PlatformDataDaily', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('82', '0', '每日还款分析', '18', '', null, '00000000001', null, '', null, '', '每日还款分析', '0', 'DailyRepaymentAnalysis', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('83', '0', '每月还款分析', '18', '', null, '00000000002', null, '', null, '', ' 每月还款分析', '0', 'MonthlyRepaymentAnalysis', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('84', '0', '每月逾期分析', '18', '', null, '00000000003', null, '', '2017-01-01 00:00:00', '', '每月逾期分析', '0', 'Monthly', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('85', '0', '每日未还本金', '19', '', null, '00000000001', null, '', null, '', '每日未还本金', '0', 'DailyPrincipal', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('86', '0', '每日放款收支数据', '19', '', null, '00000000002', null, '', null, '', ' 每日放款收支数据', '0', 'DailylLoanData', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('87', '0', '用户管理', '20', null, 'icon-yonghuguanli', '00000000001', null, null, '2017-01-01 00:00:00', null, '1', '0', 'sysUserManage', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('88', '0', '角色管理', '20', null, 'icon-jiaoseguanli', '00000000002', null, null, '2017-01-01 00:00:00', null, '1', '0', 'sysRoleManage', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('89', '0', '菜单管理', '20', null, 'icon-caidanguanli', '00000000003', null, null, '2017-01-01 00:00:00', null, '1', '0', 'sysMenuManage', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('90', '0', '字典管理', '20', null, 'icon-zidianguanli', '00000000004', null, null, '2017-01-01 00:00:00', null, '1', '0', 'sysDicManage', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('91', '0', '系统参数设置', '20', '', null, '00000000005', null, '', null, '', null, '0', 'SystemParameterSettings', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('92', '0', 'Druid监控', '20', '', null, '00000000006', null, '', '2017-01-01 00:00:00', '', 'Druid监控', '0', 'Druid', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('93', '0', '短信记录', '21', '', null, '00000000001', null, '', null, '', '短信记录', '0', 'NoteMessage', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('94', '0', '短信模板', '21', '', null, '00000000002', null, '', null, '', '短信模板', '0', 'NoteMould', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('95', '0', '任务列表', '22', '', null, '00000000001', null, '', '2017-01-01 00:00:00', '', '定时任务列表', '0', 'TimedTaskList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('96', '0', '执行记录', '22', '', null, '00000000002', null, '', '2017-01-01 00:00:00', '', '定时任务执行记录', '0', 'TimedTaskLog', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('97', '0', '广告信息', '23', '', '', '00000000001', '2017-01-01 00:00:00', '', '2017-01-01 00:00:00', '', '广告信息', '0', 'AdverManageList', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('98', '0', '渠道信息统计', '24', '', null, '00000000001', null, '', null, '', '渠道信息统计', '0', 'ChannelInformationStatistics', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('130', '0', 'test', '0', '', null, '00000000010', null, '', null, '', 'test', '0', 'test', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('131', '0', 'test1', '130', '', null, '00000000011', null, '', '2017-08-31 16:27:53', '', 'test11', '0', 'test1', null, null, null, null);
INSERT INTO `arc_sys_menu` VALUES ('132', '0', '渠道管理', '24', '', null, '00000000020', null, '', null, '', '用户渠道管理', '0', 'ChannelManage', null, null, null, null);

-- ----------------------------
-- Table structure for arc_sys_perm
-- ----------------------------
DROP TABLE IF EXISTS `arc_sys_perm`;
CREATE TABLE `arc_sys_perm` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(128) NOT NULL COMMENT '编码',
  `name` varchar(512) DEFAULT '' COMMENT '权限名称',
  `perm_level` int(2) NOT NULL DEFAULT '1' COMMENT '权限级别 1-系统级别 2-普通级别',
  `remark` varchar(128) DEFAULT '' COMMENT '权限备注',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `add_user` varchar(11) NOT NULL DEFAULT '' COMMENT '添加人',
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of arc_sys_perm
-- ----------------------------
INSERT INTO `arc_sys_perm` VALUES ('65', 'modules:manage:system:user:save', '新增用户', '1', '用户管理', '2016-12-05 14:25:30', 'system', '3');
INSERT INTO `arc_sys_perm` VALUES ('66', 'modules:manage:system:user:update', '用户修改', '1', '用户管理', '2016-12-05 14:49:03', 'system', '3');
INSERT INTO `arc_sys_perm` VALUES ('67', 'modules:manage:system:roleMenu:fetch', '分配修改权限', '1', '分配修改权限', '2016-12-05 14:59:51', 'system', '4');
INSERT INTO `arc_sys_perm` VALUES ('68', 'modules:manage:system:role:save', '新增修改角色', '1', '角色管理', '2016-12-05 15:02:26', 'system', '4');
INSERT INTO `arc_sys_perm` VALUES ('69', 'modules:manage:system:role:delete', '删除角色', '1', '角色管理', '2016-12-05 15:03:21', 'system', '4');
INSERT INTO `arc_sys_perm` VALUES ('76', 'modules:manage:system:menu:update', '新增修改菜单', '1', '菜单管理', '2016-12-05 15:41:18', 'system', '2');
INSERT INTO `arc_sys_perm` VALUES ('77', 'modules:manage:system:user:lis', '用户管理', '1', '用户管理', '2016-12-05 15:47:46', 'system', '3');
INSERT INTO `arc_sys_perm` VALUES ('78', 'modules:manage:system:dict:page', '字典查询', '1', '字典管理', '2016-12-05 15:49:17', 'system', '7');
INSERT INTO `arc_sys_perm` VALUES ('79', 'modules:manage:system:dict:detail:find', '字典详情', '1', '字典管理', '2016-12-05 15:50:25', 'system', '7');
INSERT INTO `arc_sys_perm` VALUES ('80', 'modules:manage:system:dict:save', '新增修改字典', '1', '字典管理', '2016-12-05 15:51:31', 'system', '7');
INSERT INTO `arc_sys_perm` VALUES ('81', 'modules:manage:system:dict:detail:save', '新增修改字典详情', '1', '字典管理', '2016-12-05 15:52:20', 'system', '7');
INSERT INTO `arc_sys_perm` VALUES ('82', 'modules:manage:system:dict:delete', '删除字典', '1', '字典管理', '2016-12-05 15:52:57', 'system', '7');
INSERT INTO `arc_sys_perm` VALUES ('83', 'modules:manage:system:dict:detail:delete', '删除字典详情', '1', '字典管理', '2016-12-05 15:53:34', 'system', '7');
INSERT INTO `arc_sys_perm` VALUES ('90', 'modules:manage:system:config:save', '新增修改系统参数', '1', '系统参数设置', '2016-12-05 17:10:25', 'system', '11050');
INSERT INTO `arc_sys_perm` VALUES ('91', 'modules:manage:system:config:list', '查询系统参数', '1', '系统参数设置', '2016-12-05 17:11:04', 'system', '11050');
INSERT INTO `arc_sys_perm` VALUES ('92', 'modules:manage:system:config:delete', '删除系统参数', '1', '系统参数设置', '2016-12-05 17:12:00', 'system', '11050');
INSERT INTO `arc_sys_perm` VALUES ('97', 'modules:manage:system:menu:find', '加载出原有菜单数据', '1', '加载出原有菜单数据', '2016-12-05 21:39:37', 'system', '4');
INSERT INTO `arc_sys_perm` VALUES ('98', 'modules:manage:system:menu:save', '修改用户权限', '1', '修改用户权限', '2016-12-05 21:41:36', 'system', '4');
INSERT INTO `arc_sys_perm` VALUES ('99', 'modules:manage:system:perm:find', '查询所有菜单', '1', '查询所有菜单', '2016-12-05 21:41:36', 'system', '4');
INSERT INTO `arc_sys_perm` VALUES ('100', 'modules:system:sconfig:westone', '获取用户某个菜单面板项集合', '1', '获取用户某个菜单面板项集合', '2016-12-05 21:41:36', 'system', '4');
INSERT INTO `arc_sys_perm` VALUES ('101', 'modules:system:sconfig:tree', '获取菜单树状图', '1', '获取菜单树状图', '2016-12-05 21:47:36', 'system', '4');
INSERT INTO `arc_sys_perm` VALUES ('102', 'modules:manage:system:menu:findMenuTrees', '配置菜单', '1', '配置菜单', '2016-12-05 21:50:16', 'system', '4');
INSERT INTO `arc_sys_perm` VALUES ('103', 'menu:delete', '删除菜单', '1', '删除菜单', '2016-12-05 21:50:16', 'system', '4');
INSERT INTO `arc_sys_perm` VALUES ('104', 'modules:system:sconfig:rolemenu', '分配菜单', '1', '分配菜单', '2016-12-05 21:50:16', 'system', '4');
INSERT INTO `arc_sys_perm` VALUES ('105', 'modules:manage:system:menu:combo:find', '菜单下拉框', '1', '菜单下拉框', '2016-12-05 21:50:16', 'system', '4');
INSERT INTO `arc_sys_perm` VALUES ('106', 'modules:system:modifyPassword', '修改密码', '1', '修改密码', '2016-12-05 14:25:30', 'system', '3');
INSERT INTO `arc_sys_perm` VALUES ('107', 'modules:system:getcustomerservicestafflist', '获取客服专员', '1', '获取客服专员', '2016-12-05 15:47:46', 'system', '3');
INSERT INTO `arc_sys_perm` VALUES ('108', 'modules:manage:system:user:info:find', '查询用户', '1', '查询用户', '2016-12-05 15:47:46', 'system', '3');
INSERT INTO `arc_sys_perm` VALUES ('109', 'modules:manage:system:dict:cache:list', '缓存字典使用    ', '1', '缓存字典使用    ', '2016-12-05 15:53:34', 'system', '7');

-- ----------------------------
-- Table structure for arc_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `arc_sys_role`;
CREATE TABLE `arc_sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(128) DEFAULT '' COMMENT '角色名',
  `nid` varchar(64) DEFAULT '' COMMENT '角色唯一标示',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `add_user` varchar(128) DEFAULT '' COMMENT '添加者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` varchar(128) DEFAULT '' COMMENT '修改者',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  `is_delete` tinyint(4) DEFAULT NULL COMMENT '是否删除：0不删除，1删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nid_index` (`nid`) USING BTREE,
  KEY `primary_key` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of arc_sys_role
-- ----------------------------
INSERT INTO `arc_sys_role` VALUES ('1', '系统管理员', 'system', '2016-05-06 00:59:00', 'system', '2016-05-06 12:00:00', 'system', '超级管理员', '0');
INSERT INTO `arc_sys_role` VALUES ('2', '催收管理员', 'collector', '2017-10-09 17:20:40', 'system', '2017-10-09 17:20:40', 'system', '催收+客服', '0');
INSERT INTO `arc_sys_role` VALUES ('3', '风控管理员', 'riskControlPersonnel', '2017-10-09 17:24:27', 'system', '2017-10-09 17:24:27', 'system', '风控管理', '0');
INSERT INTO `arc_sys_role` VALUES ('4', '运营管理员', 'operator', '2017-10-09 17:28:04', 'system', '2017-10-09 17:28:04', 'system', '运营管理', '0');
INSERT INTO `arc_sys_role` VALUES ('5', '人工审管理员', 'user', '2017-10-09 17:28:31', 'system', '2017-10-09 17:28:31', 'system', '用户+信审管理', '0');
INSERT INTO `arc_sys_role` VALUES ('6', '系统配置管理员', 'configure', '2017-10-09 17:31:13', 'system', '2017-10-09 17:31:13', 'system', '系统配置', '0');
INSERT INTO `arc_sys_role` VALUES ('7', '规则管理员', 'rule', '2017-10-09 17:33:15', 'system', '2017-10-09 17:33:15', 'system', '规则配置', '0');
INSERT INTO `arc_sys_role` VALUES ('8', '结算管理员', 'settlement', '2017-10-16 08:12:07', 'system', '2017-10-16 08:12:07', 'system', '放款、还款、结算', '0');
INSERT INTO `arc_sys_role` VALUES ('9', '角色管理', 'role', '2017-10-16 08:14:45', 'system', '2017-10-16 08:14:45', 'system', '后台角色、用户授权', '0');
INSERT INTO `arc_sys_role` VALUES ('10', '催收专员', 'collectionSpecialist', '2017-11-02 10:31:43', 'nongzili', '2017-11-02 10:31:43', 'nongzili', '催收员', '0');
INSERT INTO `arc_sys_role` VALUES ('11', '联盟管理员', 'cps', '2017-11-06 18:37:53', 'nongzili', '2017-11-06 18:37:53', 'nongzili', 'CPS联盟管理员', '0');
INSERT INTO `arc_sys_role` VALUES ('12', '后台管理', 'sysmanage', '2017-11-20 16:25:49', 'nongzili', '2017-11-20 16:25:49', 'nongzili', '', '0');

-- ----------------------------
-- Table structure for arc_sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `arc_sys_role_menu`;
CREATE TABLE `arc_sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` int(11) NOT NULL COMMENT '角色主键',
  `menu_id` int(11) NOT NULL COMMENT '菜单主键',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_id` (`role_id`,`menu_id`) USING BTREE,
  KEY `role_id_index` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2585 DEFAULT CHARSET=utf8 COMMENT='角色菜单表';

-- ----------------------------
-- Records of arc_sys_role_menu
-- ----------------------------
INSERT INTO `arc_sys_role_menu` VALUES ('2377', '1', '1');
INSERT INTO `arc_sys_role_menu` VALUES ('2382', '1', '2');
INSERT INTO `arc_sys_role_menu` VALUES ('2388', '1', '3');
INSERT INTO `arc_sys_role_menu` VALUES ('2393', '1', '4');
INSERT INTO `arc_sys_role_menu` VALUES ('2397', '1', '8');
INSERT INTO `arc_sys_role_menu` VALUES ('2401', '1', '9');
INSERT INTO `arc_sys_role_menu` VALUES ('2407', '1', '10');
INSERT INTO `arc_sys_role_menu` VALUES ('2411', '1', '11');
INSERT INTO `arc_sys_role_menu` VALUES ('2413', '1', '12');
INSERT INTO `arc_sys_role_menu` VALUES ('2417', '1', '13');
INSERT INTO `arc_sys_role_menu` VALUES ('2424', '1', '14');
INSERT INTO `arc_sys_role_menu` VALUES ('2427', '1', '15');
INSERT INTO `arc_sys_role_menu` VALUES ('2431', '1', '16');
INSERT INTO `arc_sys_role_menu` VALUES ('2434', '1', '17');
INSERT INTO `arc_sys_role_menu` VALUES ('2438', '1', '18');
INSERT INTO `arc_sys_role_menu` VALUES ('2441', '1', '19');
INSERT INTO `arc_sys_role_menu` VALUES ('2443', '1', '23');
INSERT INTO `arc_sys_role_menu` VALUES ('2446', '1', '24');
INSERT INTO `arc_sys_role_menu` VALUES ('2378', '1', '25');
INSERT INTO `arc_sys_role_menu` VALUES ('2379', '1', '26');
INSERT INTO `arc_sys_role_menu` VALUES ('2380', '1', '28');
INSERT INTO `arc_sys_role_menu` VALUES ('2381', '1', '29');
INSERT INTO `arc_sys_role_menu` VALUES ('2383', '1', '30');
INSERT INTO `arc_sys_role_menu` VALUES ('2384', '1', '31');
INSERT INTO `arc_sys_role_menu` VALUES ('2385', '1', '32');
INSERT INTO `arc_sys_role_menu` VALUES ('2386', '1', '33');
INSERT INTO `arc_sys_role_menu` VALUES ('2387', '1', '34');
INSERT INTO `arc_sys_role_menu` VALUES ('2389', '1', '35');
INSERT INTO `arc_sys_role_menu` VALUES ('2390', '1', '36');
INSERT INTO `arc_sys_role_menu` VALUES ('2391', '1', '37');
INSERT INTO `arc_sys_role_menu` VALUES ('2392', '1', '38');
INSERT INTO `arc_sys_role_menu` VALUES ('2394', '1', '51');
INSERT INTO `arc_sys_role_menu` VALUES ('2395', '1', '52');
INSERT INTO `arc_sys_role_menu` VALUES ('2396', '1', '53');
INSERT INTO `arc_sys_role_menu` VALUES ('2398', '1', '54');
INSERT INTO `arc_sys_role_menu` VALUES ('2399', '1', '55');
INSERT INTO `arc_sys_role_menu` VALUES ('2400', '1', '56');
INSERT INTO `arc_sys_role_menu` VALUES ('2402', '1', '57');
INSERT INTO `arc_sys_role_menu` VALUES ('2403', '1', '58');
INSERT INTO `arc_sys_role_menu` VALUES ('2404', '1', '59');
INSERT INTO `arc_sys_role_menu` VALUES ('2405', '1', '60');
INSERT INTO `arc_sys_role_menu` VALUES ('2406', '1', '61');
INSERT INTO `arc_sys_role_menu` VALUES ('2408', '1', '62');
INSERT INTO `arc_sys_role_menu` VALUES ('2409', '1', '63');
INSERT INTO `arc_sys_role_menu` VALUES ('2410', '1', '64');
INSERT INTO `arc_sys_role_menu` VALUES ('2412', '1', '65');
INSERT INTO `arc_sys_role_menu` VALUES ('2414', '1', '66');
INSERT INTO `arc_sys_role_menu` VALUES ('2415', '1', '67');
INSERT INTO `arc_sys_role_menu` VALUES ('2416', '1', '68');
INSERT INTO `arc_sys_role_menu` VALUES ('2418', '1', '69');
INSERT INTO `arc_sys_role_menu` VALUES ('2419', '1', '70');
INSERT INTO `arc_sys_role_menu` VALUES ('2420', '1', '71');
INSERT INTO `arc_sys_role_menu` VALUES ('2421', '1', '72');
INSERT INTO `arc_sys_role_menu` VALUES ('2422', '1', '73');
INSERT INTO `arc_sys_role_menu` VALUES ('2423', '1', '74');
INSERT INTO `arc_sys_role_menu` VALUES ('2425', '1', '75');
INSERT INTO `arc_sys_role_menu` VALUES ('2426', '1', '76');
INSERT INTO `arc_sys_role_menu` VALUES ('2428', '1', '77');
INSERT INTO `arc_sys_role_menu` VALUES ('2429', '1', '78');
INSERT INTO `arc_sys_role_menu` VALUES ('2430', '1', '79');
INSERT INTO `arc_sys_role_menu` VALUES ('2432', '1', '80');
INSERT INTO `arc_sys_role_menu` VALUES ('2433', '1', '81');
INSERT INTO `arc_sys_role_menu` VALUES ('2435', '1', '82');
INSERT INTO `arc_sys_role_menu` VALUES ('2436', '1', '83');
INSERT INTO `arc_sys_role_menu` VALUES ('2437', '1', '84');
INSERT INTO `arc_sys_role_menu` VALUES ('2439', '1', '85');
INSERT INTO `arc_sys_role_menu` VALUES ('2440', '1', '86');
INSERT INTO `arc_sys_role_menu` VALUES ('2442', '1', '97');
INSERT INTO `arc_sys_role_menu` VALUES ('2444', '1', '98');
INSERT INTO `arc_sys_role_menu` VALUES ('2445', '1', '132');
INSERT INTO `arc_sys_role_menu` VALUES ('2254', '2', '1');
INSERT INTO `arc_sys_role_menu` VALUES ('2259', '2', '2');
INSERT INTO `arc_sys_role_menu` VALUES ('2267', '2', '8');
INSERT INTO `arc_sys_role_menu` VALUES ('2273', '2', '10');
INSERT INTO `arc_sys_role_menu` VALUES ('2277', '2', '11');
INSERT INTO `arc_sys_role_menu` VALUES ('2279', '2', '12');
INSERT INTO `arc_sys_role_menu` VALUES ('2283', '2', '13');
INSERT INTO `arc_sys_role_menu` VALUES ('2290', '2', '14');
INSERT INTO `arc_sys_role_menu` VALUES ('2293', '2', '15');
INSERT INTO `arc_sys_role_menu` VALUES ('2297', '2', '16');
INSERT INTO `arc_sys_role_menu` VALUES ('2255', '2', '25');
INSERT INTO `arc_sys_role_menu` VALUES ('2256', '2', '26');
INSERT INTO `arc_sys_role_menu` VALUES ('2257', '2', '28');
INSERT INTO `arc_sys_role_menu` VALUES ('2258', '2', '29');
INSERT INTO `arc_sys_role_menu` VALUES ('2260', '2', '45');
INSERT INTO `arc_sys_role_menu` VALUES ('2261', '2', '46');
INSERT INTO `arc_sys_role_menu` VALUES ('2262', '2', '47');
INSERT INTO `arc_sys_role_menu` VALUES ('2263', '2', '49');
INSERT INTO `arc_sys_role_menu` VALUES ('2264', '2', '51');
INSERT INTO `arc_sys_role_menu` VALUES ('2265', '2', '52');
INSERT INTO `arc_sys_role_menu` VALUES ('2266', '2', '53');
INSERT INTO `arc_sys_role_menu` VALUES ('2268', '2', '57');
INSERT INTO `arc_sys_role_menu` VALUES ('2269', '2', '58');
INSERT INTO `arc_sys_role_menu` VALUES ('2270', '2', '59');
INSERT INTO `arc_sys_role_menu` VALUES ('2271', '2', '60');
INSERT INTO `arc_sys_role_menu` VALUES ('2272', '2', '61');
INSERT INTO `arc_sys_role_menu` VALUES ('2274', '2', '62');
INSERT INTO `arc_sys_role_menu` VALUES ('2275', '2', '63');
INSERT INTO `arc_sys_role_menu` VALUES ('2276', '2', '64');
INSERT INTO `arc_sys_role_menu` VALUES ('2278', '2', '65');
INSERT INTO `arc_sys_role_menu` VALUES ('2280', '2', '66');
INSERT INTO `arc_sys_role_menu` VALUES ('2281', '2', '67');
INSERT INTO `arc_sys_role_menu` VALUES ('2282', '2', '68');
INSERT INTO `arc_sys_role_menu` VALUES ('2284', '2', '69');
INSERT INTO `arc_sys_role_menu` VALUES ('2285', '2', '70');
INSERT INTO `arc_sys_role_menu` VALUES ('2286', '2', '71');
INSERT INTO `arc_sys_role_menu` VALUES ('2287', '2', '72');
INSERT INTO `arc_sys_role_menu` VALUES ('2288', '2', '73');
INSERT INTO `arc_sys_role_menu` VALUES ('2289', '2', '74');
INSERT INTO `arc_sys_role_menu` VALUES ('2291', '2', '75');
INSERT INTO `arc_sys_role_menu` VALUES ('2292', '2', '76');
INSERT INTO `arc_sys_role_menu` VALUES ('2294', '2', '77');
INSERT INTO `arc_sys_role_menu` VALUES ('2295', '2', '78');
INSERT INTO `arc_sys_role_menu` VALUES ('2296', '2', '79');
INSERT INTO `arc_sys_role_menu` VALUES ('2363', '3', '1');
INSERT INTO `arc_sys_role_menu` VALUES ('2373', '3', '10');
INSERT INTO `arc_sys_role_menu` VALUES ('2376', '3', '17');
INSERT INTO `arc_sys_role_menu` VALUES ('2364', '3', '45');
INSERT INTO `arc_sys_role_menu` VALUES ('2365', '3', '46');
INSERT INTO `arc_sys_role_menu` VALUES ('2366', '3', '47');
INSERT INTO `arc_sys_role_menu` VALUES ('2367', '3', '49');
INSERT INTO `arc_sys_role_menu` VALUES ('2368', '3', '57');
INSERT INTO `arc_sys_role_menu` VALUES ('2369', '3', '58');
INSERT INTO `arc_sys_role_menu` VALUES ('2370', '3', '59');
INSERT INTO `arc_sys_role_menu` VALUES ('2371', '3', '60');
INSERT INTO `arc_sys_role_menu` VALUES ('2372', '3', '61');
INSERT INTO `arc_sys_role_menu` VALUES ('2374', '3', '80');
INSERT INTO `arc_sys_role_menu` VALUES ('2375', '3', '81');
INSERT INTO `arc_sys_role_menu` VALUES ('2193', '4', '1');
INSERT INTO `arc_sys_role_menu` VALUES ('2198', '4', '2');
INSERT INTO `arc_sys_role_menu` VALUES ('2204', '4', '3');
INSERT INTO `arc_sys_role_menu` VALUES ('2209', '4', '4');
INSERT INTO `arc_sys_role_menu` VALUES ('2217', '4', '8');
INSERT INTO `arc_sys_role_menu` VALUES ('2221', '4', '9');
INSERT INTO `arc_sys_role_menu` VALUES ('2227', '4', '10');
INSERT INTO `arc_sys_role_menu` VALUES ('2231', '4', '11');
INSERT INTO `arc_sys_role_menu` VALUES ('2234', '4', '17');
INSERT INTO `arc_sys_role_menu` VALUES ('2238', '4', '18');
INSERT INTO `arc_sys_role_menu` VALUES ('2241', '4', '19');
INSERT INTO `arc_sys_role_menu` VALUES ('2243', '4', '23');
INSERT INTO `arc_sys_role_menu` VALUES ('2246', '4', '24');
INSERT INTO `arc_sys_role_menu` VALUES ('2194', '4', '25');
INSERT INTO `arc_sys_role_menu` VALUES ('2195', '4', '26');
INSERT INTO `arc_sys_role_menu` VALUES ('2196', '4', '28');
INSERT INTO `arc_sys_role_menu` VALUES ('2197', '4', '29');
INSERT INTO `arc_sys_role_menu` VALUES ('2199', '4', '30');
INSERT INTO `arc_sys_role_menu` VALUES ('2200', '4', '31');
INSERT INTO `arc_sys_role_menu` VALUES ('2201', '4', '32');
INSERT INTO `arc_sys_role_menu` VALUES ('2202', '4', '33');
INSERT INTO `arc_sys_role_menu` VALUES ('2203', '4', '34');
INSERT INTO `arc_sys_role_menu` VALUES ('2205', '4', '35');
INSERT INTO `arc_sys_role_menu` VALUES ('2206', '4', '36');
INSERT INTO `arc_sys_role_menu` VALUES ('2207', '4', '37');
INSERT INTO `arc_sys_role_menu` VALUES ('2208', '4', '38');
INSERT INTO `arc_sys_role_menu` VALUES ('2210', '4', '45');
INSERT INTO `arc_sys_role_menu` VALUES ('2211', '4', '46');
INSERT INTO `arc_sys_role_menu` VALUES ('2212', '4', '47');
INSERT INTO `arc_sys_role_menu` VALUES ('2213', '4', '49');
INSERT INTO `arc_sys_role_menu` VALUES ('2214', '4', '51');
INSERT INTO `arc_sys_role_menu` VALUES ('2215', '4', '52');
INSERT INTO `arc_sys_role_menu` VALUES ('2216', '4', '53');
INSERT INTO `arc_sys_role_menu` VALUES ('2218', '4', '54');
INSERT INTO `arc_sys_role_menu` VALUES ('2219', '4', '55');
INSERT INTO `arc_sys_role_menu` VALUES ('2220', '4', '56');
INSERT INTO `arc_sys_role_menu` VALUES ('2222', '4', '57');
INSERT INTO `arc_sys_role_menu` VALUES ('2223', '4', '58');
INSERT INTO `arc_sys_role_menu` VALUES ('2224', '4', '59');
INSERT INTO `arc_sys_role_menu` VALUES ('2225', '4', '60');
INSERT INTO `arc_sys_role_menu` VALUES ('2226', '4', '61');
INSERT INTO `arc_sys_role_menu` VALUES ('2228', '4', '62');
INSERT INTO `arc_sys_role_menu` VALUES ('2229', '4', '63');
INSERT INTO `arc_sys_role_menu` VALUES ('2230', '4', '64');
INSERT INTO `arc_sys_role_menu` VALUES ('2232', '4', '80');
INSERT INTO `arc_sys_role_menu` VALUES ('2233', '4', '81');
INSERT INTO `arc_sys_role_menu` VALUES ('2235', '4', '82');
INSERT INTO `arc_sys_role_menu` VALUES ('2236', '4', '83');
INSERT INTO `arc_sys_role_menu` VALUES ('2237', '4', '84');
INSERT INTO `arc_sys_role_menu` VALUES ('2239', '4', '85');
INSERT INTO `arc_sys_role_menu` VALUES ('2240', '4', '86');
INSERT INTO `arc_sys_role_menu` VALUES ('2242', '4', '97');
INSERT INTO `arc_sys_role_menu` VALUES ('2244', '4', '98');
INSERT INTO `arc_sys_role_menu` VALUES ('2245', '4', '132');
INSERT INTO `arc_sys_role_menu` VALUES ('2186', '5', '2');
INSERT INTO `arc_sys_role_menu` VALUES ('2192', '5', '7');
INSERT INTO `arc_sys_role_menu` VALUES ('2182', '5', '25');
INSERT INTO `arc_sys_role_menu` VALUES ('2183', '5', '26');
INSERT INTO `arc_sys_role_menu` VALUES ('2184', '5', '28');
INSERT INTO `arc_sys_role_menu` VALUES ('2185', '5', '29');
INSERT INTO `arc_sys_role_menu` VALUES ('2187', '5', '45');
INSERT INTO `arc_sys_role_menu` VALUES ('2188', '5', '46');
INSERT INTO `arc_sys_role_menu` VALUES ('2189', '5', '47');
INSERT INTO `arc_sys_role_menu` VALUES ('2190', '5', '48');
INSERT INTO `arc_sys_role_menu` VALUES ('2191', '5', '49');
INSERT INTO `arc_sys_role_menu` VALUES ('1799', '6', '5');
INSERT INTO `arc_sys_role_menu` VALUES ('1803', '6', '6');
INSERT INTO `arc_sys_role_menu` VALUES ('1809', '6', '21');
INSERT INTO `arc_sys_role_menu` VALUES ('1812', '6', '22');
INSERT INTO `arc_sys_role_menu` VALUES ('1797', '6', '39');
INSERT INTO `arc_sys_role_menu` VALUES ('1798', '6', '40');
INSERT INTO `arc_sys_role_menu` VALUES ('1800', '6', '41');
INSERT INTO `arc_sys_role_menu` VALUES ('1801', '6', '42');
INSERT INTO `arc_sys_role_menu` VALUES ('1802', '6', '43');
INSERT INTO `arc_sys_role_menu` VALUES ('1804', '6', '90');
INSERT INTO `arc_sys_role_menu` VALUES ('1805', '6', '91');
INSERT INTO `arc_sys_role_menu` VALUES ('1806', '6', '92');
INSERT INTO `arc_sys_role_menu` VALUES ('1807', '6', '93');
INSERT INTO `arc_sys_role_menu` VALUES ('1808', '6', '94');
INSERT INTO `arc_sys_role_menu` VALUES ('1810', '6', '95');
INSERT INTO `arc_sys_role_menu` VALUES ('1811', '6', '96');
INSERT INTO `arc_sys_role_menu` VALUES ('2143', '7', '1');
INSERT INTO `arc_sys_role_menu` VALUES ('2146', '7', '5');
INSERT INTO `arc_sys_role_menu` VALUES ('2150', '7', '6');
INSERT INTO `arc_sys_role_menu` VALUES ('2156', '7', '7');
INSERT INTO `arc_sys_role_menu` VALUES ('2159', '7', '17');
INSERT INTO `arc_sys_role_menu` VALUES ('2144', '7', '39');
INSERT INTO `arc_sys_role_menu` VALUES ('2145', '7', '40');
INSERT INTO `arc_sys_role_menu` VALUES ('2147', '7', '41');
INSERT INTO `arc_sys_role_menu` VALUES ('2148', '7', '42');
INSERT INTO `arc_sys_role_menu` VALUES ('2149', '7', '43');
INSERT INTO `arc_sys_role_menu` VALUES ('2151', '7', '45');
INSERT INTO `arc_sys_role_menu` VALUES ('2152', '7', '46');
INSERT INTO `arc_sys_role_menu` VALUES ('2153', '7', '47');
INSERT INTO `arc_sys_role_menu` VALUES ('2154', '7', '48');
INSERT INTO `arc_sys_role_menu` VALUES ('2155', '7', '49');
INSERT INTO `arc_sys_role_menu` VALUES ('2157', '7', '80');
INSERT INTO `arc_sys_role_menu` VALUES ('2158', '7', '81');
INSERT INTO `arc_sys_role_menu` VALUES ('2160', '8', '1');
INSERT INTO `arc_sys_role_menu` VALUES ('2164', '8', '8');
INSERT INTO `arc_sys_role_menu` VALUES ('2168', '8', '9');
INSERT INTO `arc_sys_role_menu` VALUES ('2174', '8', '10');
INSERT INTO `arc_sys_role_menu` VALUES ('2178', '8', '18');
INSERT INTO `arc_sys_role_menu` VALUES ('2181', '8', '19');
INSERT INTO `arc_sys_role_menu` VALUES ('2161', '8', '51');
INSERT INTO `arc_sys_role_menu` VALUES ('2162', '8', '52');
INSERT INTO `arc_sys_role_menu` VALUES ('2163', '8', '53');
INSERT INTO `arc_sys_role_menu` VALUES ('2165', '8', '54');
INSERT INTO `arc_sys_role_menu` VALUES ('2166', '8', '55');
INSERT INTO `arc_sys_role_menu` VALUES ('2167', '8', '56');
INSERT INTO `arc_sys_role_menu` VALUES ('2169', '8', '57');
INSERT INTO `arc_sys_role_menu` VALUES ('2170', '8', '58');
INSERT INTO `arc_sys_role_menu` VALUES ('2171', '8', '59');
INSERT INTO `arc_sys_role_menu` VALUES ('2172', '8', '60');
INSERT INTO `arc_sys_role_menu` VALUES ('2173', '8', '61');
INSERT INTO `arc_sys_role_menu` VALUES ('2175', '8', '82');
INSERT INTO `arc_sys_role_menu` VALUES ('2176', '8', '83');
INSERT INTO `arc_sys_role_menu` VALUES ('2177', '8', '84');
INSERT INTO `arc_sys_role_menu` VALUES ('2179', '8', '85');
INSERT INTO `arc_sys_role_menu` VALUES ('2180', '8', '86');
INSERT INTO `arc_sys_role_menu` VALUES ('1791', '9', '87');
INSERT INTO `arc_sys_role_menu` VALUES ('1792', '9', '88');
INSERT INTO `arc_sys_role_menu` VALUES ('1793', '9', '89');
INSERT INTO `arc_sys_role_menu` VALUES ('2583', '10', '14');
INSERT INTO `arc_sys_role_menu` VALUES ('2570', '10', '25');
INSERT INTO `arc_sys_role_menu` VALUES ('2571', '10', '28');
INSERT INTO `arc_sys_role_menu` VALUES ('2572', '10', '57');
INSERT INTO `arc_sys_role_menu` VALUES ('2573', '10', '58');
INSERT INTO `arc_sys_role_menu` VALUES ('2574', '10', '62');
INSERT INTO `arc_sys_role_menu` VALUES ('2575', '10', '63');
INSERT INTO `arc_sys_role_menu` VALUES ('2576', '10', '66');
INSERT INTO `arc_sys_role_menu` VALUES ('2577', '10', '69');
INSERT INTO `arc_sys_role_menu` VALUES ('2578', '10', '70');
INSERT INTO `arc_sys_role_menu` VALUES ('2579', '10', '71');
INSERT INTO `arc_sys_role_menu` VALUES ('2580', '10', '72');
INSERT INTO `arc_sys_role_menu` VALUES ('2581', '10', '73');
INSERT INTO `arc_sys_role_menu` VALUES ('2582', '10', '74');
INSERT INTO `arc_sys_role_menu` VALUES ('2584', '10', '79');
INSERT INTO `arc_sys_role_menu` VALUES ('2454', '11', '1');
INSERT INTO `arc_sys_role_menu` VALUES ('2455', '11', '51');
INSERT INTO `arc_sys_role_menu` VALUES ('2456', '11', '62');
INSERT INTO `arc_sys_role_menu` VALUES ('2508', '12', '1');
INSERT INTO `arc_sys_role_menu` VALUES ('2516', '12', '8');
INSERT INTO `arc_sys_role_menu` VALUES ('2520', '12', '11');
INSERT INTO `arc_sys_role_menu` VALUES ('2523', '12', '17');
INSERT INTO `arc_sys_role_menu` VALUES ('2527', '12', '18');
INSERT INTO `arc_sys_role_menu` VALUES ('2530', '12', '19');
INSERT INTO `arc_sys_role_menu` VALUES ('2509', '12', '25');
INSERT INTO `arc_sys_role_menu` VALUES ('2510', '12', '26');
INSERT INTO `arc_sys_role_menu` VALUES ('2511', '12', '46');
INSERT INTO `arc_sys_role_menu` VALUES ('2512', '12', '47');
INSERT INTO `arc_sys_role_menu` VALUES ('2513', '12', '51');
INSERT INTO `arc_sys_role_menu` VALUES ('2514', '12', '52');
INSERT INTO `arc_sys_role_menu` VALUES ('2515', '12', '53');
INSERT INTO `arc_sys_role_menu` VALUES ('2517', '12', '62');
INSERT INTO `arc_sys_role_menu` VALUES ('2518', '12', '63');
INSERT INTO `arc_sys_role_menu` VALUES ('2519', '12', '64');
INSERT INTO `arc_sys_role_menu` VALUES ('2521', '12', '80');
INSERT INTO `arc_sys_role_menu` VALUES ('2522', '12', '81');
INSERT INTO `arc_sys_role_menu` VALUES ('2524', '12', '82');
INSERT INTO `arc_sys_role_menu` VALUES ('2525', '12', '83');
INSERT INTO `arc_sys_role_menu` VALUES ('2526', '12', '84');
INSERT INTO `arc_sys_role_menu` VALUES ('2528', '12', '85');
INSERT INTO `arc_sys_role_menu` VALUES ('2529', '12', '86');

-- ----------------------------
-- Table structure for arc_sys_role_perm
-- ----------------------------
DROP TABLE IF EXISTS `arc_sys_role_perm`;
CREATE TABLE `arc_sys_role_perm` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `perm_id` int(11) NOT NULL COMMENT '权限ID',
  `add_user` varchar(11) NOT NULL DEFAULT '' COMMENT '添加人',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
-- Records of arc_sys_role_perm
-- ----------------------------

-- ----------------------------
-- Table structure for arc_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `arc_sys_user`;
CREATE TABLE `arc_sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `name` varchar(128) DEFAULT '' COMMENT '姓名',
  `user_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '账号',
  `password` varchar(128) DEFAULT '' COMMENT '密码',
  `job_num` varchar(128) DEFAULT '' COMMENT '工号',
  `company_id` char(64) DEFAULT NULL COMMENT '公司',
  `office_id` char(64) DEFAULT NULL COMMENT '部门',
  `office_over` varchar(1024) DEFAULT NULL COMMENT '管辖机构',
  `position` int(3) unsigned zerofill DEFAULT '000' COMMENT '职位',
  `email` varchar(256) DEFAULT '' COMMENT '邮箱',
  `phone` varchar(128) DEFAULT '' COMMENT '电话',
  `mobile` varchar(128) DEFAULT '' COMMENT '手机',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态：0正常 1禁用',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登陆IP',
  `login_time` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `add_user` varchar(128) DEFAULT '' COMMENT '添加者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` varchar(128) DEFAULT '' COMMENT '修改者',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `userNameIndex` (`user_name`) USING BTREE,
  KEY `officeIdIndex` (`office_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of arc_sys_user
-- ----------------------------
INSERT INTO `arc_sys_user` VALUES ('1', '管理员', 'system', 'uq4b4hsnoscnxekudj5mb74sllliyfkbqqadbdy', '1', '', '', '', null, null, null, null, '1', null, null, null, null, '2017-10-16 18:55:08', 'system', null);
INSERT INTO `arc_sys_user` VALUES ('2', '李响', 'lx', '4ef7uzrzbe5efw2oqdjoutlrlb5b677x357bfskv45d5wjn2rxfa', '001', null, null, null, null, 'lx@duandai.com', '13811225170', '13811225170', '0', null, null, '2017-10-10 17:36:17', '管理员', '2017-10-16 08:20:52', 'nongzili', null);
INSERT INTO `arc_sys_user` VALUES ('3', '农自立', 'nongzili', 'zgcwblxhy4rsx4exzxkpj2layua2sxi7auiea7a', '002', null, null, null, null, 'nongzili@duandai.com', null, null, '0', null, null, '2017-10-15 13:53:16', '管理员', '2017-10-18 15:57:00', 'nongzili', null);
INSERT INTO `arc_sys_user` VALUES ('4', '赵晓东', 'zhaoxiaodong', 'og73lqqfwmsymlgaffxjffaczya2sxi7auiea7a', '003', null, null, null, null, 'zhaoxiaodong@duandai.com', null, null, '0', null, null, '2017-10-15 13:53:43', '管理员', '2018-01-04 16:53:09', 'system', null);
INSERT INTO `arc_sys_user` VALUES ('5', '续楠', 'xunan', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '004', null, null, null, null, 'xunan@duandai.com', null, null, '0', null, null, '2017-10-15 13:55:49', '管理员', '2017-10-16 08:21:12', '管理员', null);
INSERT INTO `arc_sys_user` VALUES ('6', '赵乔', 'zhaoqiao', 'f3iz6uo5hj3edekudj5mb74sllliyfkbqqadbdy', '005', null, null, null, null, 'zhaoqiao@duandai.com', null, null, '0', null, null, '2017-10-15 13:56:29', '管理员', '2017-10-16 08:21:16', 'zhaoqiao', null);
INSERT INTO `arc_sys_user` VALUES ('7', '沈庆洁', 'shenqingjie', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '006', null, null, null, null, 'shenqingjie@duandai.com', null, null, '0', null, null, '2017-10-16 07:59:38', '管理员', '2017-10-16 08:52:54', 'nongzili', null);
INSERT INTO `arc_sys_user` VALUES ('8', '陆雨', 'luyu', 'jdzx43j2fdeilekudj5mb74sllliyfkbqqadbdy', '007', null, null, null, null, 'luyu@duandai.com', null, null, '0', null, null, '2017-10-16 08:00:33', '管理员', '2017-10-16 08:52:49', 'nongzili', null);
INSERT INTO `arc_sys_user` VALUES ('9', '腾禄东', 'tengludong', 'fuenvxp6teayg5znim3ih4iycqr5mtzqifs25ha', '008', null, null, null, null, 'tengludong@duandai.com', null, null, '0', null, null, '2017-10-16 08:01:13', '管理员', '2017-10-16 08:52:45', '管理员', null);
INSERT INTO `arc_sys_user` VALUES ('10', '刘云帆', 'liuyunfan', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '009', null, null, null, null, null, null, null, '1', null, null, '2017-10-16 08:02:33', '管理员', '2018-01-17 11:20:19', '管理员', null);
INSERT INTO `arc_sys_user` VALUES ('11', '祁文广', 'qiguangwen', 'gghlv7ccpfr6dd4mbkf3ykv7hle6hvpkru6z3v2v4k43ps7uqhea', '010', null, null, null, null, null, null, null, '0', null, null, '2017-10-16 08:24:33', '管理员', '2017-10-16 08:53:00', 'nongzili', null);
INSERT INTO `arc_sys_user` VALUES ('12', '魏嘉慧', 'weijiahui', 'sh2cyblmj74atj3raj4wfv4wgde6hvpkru6z3v2v4k43ps7uqhea', '011', null, null, null, null, null, null, null, '0', null, null, '2017-10-16 08:25:28', '管理员', '2017-10-16 08:53:04', 'nongzili', null);
INSERT INTO `arc_sys_user` VALUES ('13', '周博', 'zhoubo', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '012', null, null, null, null, null, null, null, '0', null, null, '2017-10-16 08:39:11', '管理员', '2017-10-16 08:53:08', 'nongzili', null);
INSERT INTO `arc_sys_user` VALUES ('14', '刘晓亮', 'liuxiaoliang', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '013', null, null, null, null, 'liuxiaoliang@duandai.com', null, null, '0', null, null, '2017-10-16 08:57:01', '管理员', '2017-10-16 08:59:40', 'nongzili', null);
INSERT INTO `arc_sys_user` VALUES ('15', '何烨鹏', 'heyepeng', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '014', null, null, null, null, null, null, null, '0', null, null, '2017-10-16 08:58:44', '管理员', '2017-10-16 08:59:36', 'nongzili', null);
INSERT INTO `arc_sys_user` VALUES ('16', '炎炎', 'yanyan', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '015', null, null, null, null, null, null, null, '0', null, null, '2017-10-18 15:55:44', '农自立', '2017-10-18 15:55:44', 'nongzili', null);
INSERT INTO `arc_sys_user` VALUES ('17', '芮雪洋', 'ruixueyang', '2l23sjugsvokk5znim3ih4iycqr5mtzqifs25ha', '016', null, null, null, null, null, null, null, '0', null, null, '2017-10-30 13:03:29', '赵乔', '2017-10-30 13:03:29', 'zhaoqiao', null);
INSERT INTO `arc_sys_user` VALUES ('18', '陈沉', 'cc', 'fvqwsnpqizitcmwwafuetp7bguoatcchlw7uzna', '017', null, null, null, null, null, null, null, '0', null, null, '2017-10-30 16:35:17', '农自立', '2017-11-02 10:23:12', 'nongzili', null);
INSERT INTO `arc_sys_user` VALUES ('19', '鲜芳', 'xianfang', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '018', null, null, null, null, null, null, null, '0', null, null, '2017-11-02 16:50:58', '赵乔', '2017-11-02 16:50:58', 'nongzili', null);
INSERT INTO `arc_sys_user` VALUES ('20', '测试', 'ceshi', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '999', null, null, null, null, null, null, null, '0', null, null, '2017-11-06 18:43:58', '农自立', '2017-11-06 18:43:58', 'nongzili', null);
INSERT INTO `arc_sys_user` VALUES ('21', '融翔科技', 'rxkj2017', 'zgpqr7k2a3mcbekudj5mb74sllliyfkbqqadbdy', '100', null, null, null, null, null, null, null, '0', null, null, '2017-11-07 10:38:32', '农自立', '2017-11-07 10:38:50', '农自立', null);
INSERT INTO `arc_sys_user` VALUES ('22', '冰峰', 'bingfeng', '3z3nfe2w2e3fehjx7c4uiq2ju7h5ca2vvnsmqti', '101', null, null, null, null, null, null, null, '0', null, null, '2017-11-07 15:39:54', '农自立', '2017-11-07 15:45:20', '农自立', null);
INSERT INTO `arc_sys_user` VALUES ('23', '摩柏', 'mobai1', 'dle37cj7vcqhelgaffxjffaczya2sxi7auiea7a', '102', null, null, null, null, null, null, null, '0', null, null, '2017-11-07 15:40:17', '农自立', '2017-11-07 15:45:26', '农自立', null);
INSERT INTO `arc_sys_user` VALUES ('24', '琳哒', 'linda', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '019', null, null, null, null, null, null, null, '0', null, null, '2017-11-08 10:46:02', '赵乔', '2017-11-08 10:46:02', 'zhaoqiao', null);
INSERT INTO `arc_sys_user` VALUES ('25', '手优科技', 'sykj2017', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '103', null, null, null, null, null, null, null, '0', null, null, '2017-11-09 15:38:54', '赵乔', '2017-11-09 15:49:28', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('26', '赵力霏', 'zhaolifei', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '020', null, null, null, null, null, null, null, '0', null, null, '2017-11-09 15:38:52', '赵乔', '2017-11-09 15:38:52', 'zhaoqiao', null);
INSERT INTO `arc_sys_user` VALUES ('27', '白玲玉', 'bailingyu', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '021', null, null, null, null, null, null, null, '1', null, null, '2017-11-20 10:15:43', '赵乔', '2017-11-29 17:27:29', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('28', '邵彦鑫', 'shaoyanxin', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '022', null, null, null, null, null, null, null, '0', null, null, '2017-11-20 10:16:23', '赵乔', '2017-11-20 10:16:23', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('29', '张海方', 'zhf', '3xlwxa3rziiyysp6nus4x7gxe4a2sxi7auiea7a', '023', null, null, null, null, null, null, null, '0', null, null, '2017-11-20 16:23:44', '农自立', '2017-11-20 16:24:01', 'nongzili', null);
INSERT INTO `arc_sys_user` VALUES ('30', '建元', 'jianyuan', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '023', null, null, null, null, null, null, null, '0', null, null, '2017-11-23 10:01:50', '赵乔', '2018-02-05 17:20:55', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('31', '鹏蔚', 'pengwei', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '024', null, null, null, null, null, null, null, '1', null, null, '2017-11-23 10:02:29', '赵乔', '2018-01-08 16:09:58', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('32', '孙耀强', 'sunyaoqiang', 'tj6ytadolb5tbhdv43q4edvphaa2sxi7auiea7a', '025', null, null, null, null, null, null, null, '1', null, null, '2017-11-25 10:23:37', '赵乔', '2018-01-08 16:09:48', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('33', '张晓跃', 'zhangxiaoyue', 'efr7czpl32sulekudj5mb74sllliyfkbqqadbdy', '026', null, null, null, null, null, null, null, '1', null, null, '2017-11-27 10:23:50', '赵乔', '2017-12-04 18:47:01', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('34', '凡东旭', 'fandongxu', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '027', null, null, null, null, null, null, null, '0', null, null, '2017-11-29 10:47:54', '赵乔', '2017-11-29 10:47:54', 'zhaoqiao', null);
INSERT INTO `arc_sys_user` VALUES ('35', '徐晓强', 'xuxiaoqiang', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '028', null, null, null, null, null, null, null, '0', null, null, '2017-11-29 10:48:30', '赵乔', '2017-11-29 10:48:30', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('36', '冯印恒', 'fengyinheng', 'rx3fniel2kury6q7p73567qszfk6or63ew5i3sq', '029', null, null, null, null, null, null, null, '0', null, null, '2017-11-29 10:49:13', '赵乔', '2017-11-29 10:49:13', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('37', '冯鹏霖', 'fengpenglin', '7akka5p2rfu2lspd2xvi2pm525k6fonxzp2idsa', '030', null, null, null, null, null, null, null, '0', null, null, '2017-11-29 10:49:55', '赵乔', '2017-11-29 10:49:55', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('38', '焦阳', 'jiaoyang', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '031', null, null, null, null, null, null, null, '0', null, null, '2017-11-30 10:21:42', '赵乔', '2017-11-30 10:21:42', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('39', '卢勇', 'luyong', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '032', null, null, null, null, null, null, null, '0', null, null, '2017-12-01 10:28:06', '赵乔', '2017-12-01 10:28:06', 'zhaoqiao', null);
INSERT INTO `arc_sys_user` VALUES ('40', '裴晓光', 'peixiaoguang', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '033', null, null, null, null, null, null, null, '1', null, null, '2017-12-01 10:28:34', '赵乔', '2018-01-08 16:10:01', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('41', '王安龙', 'wanganlong', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '034', null, null, null, null, null, null, null, '0', null, null, '2017-12-01 10:29:06', '赵乔', '2017-12-01 10:29:06', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('42', '闫志强', 'itw_yanzq', '7lloiwjvhdobg5kkyct2asdonua2sxi7auiea7a', '035', null, null, null, null, null, null, null, '1', null, null, '2017-12-01 18:58:56', '赵乔', '2017-12-20 11:35:11', 'nongzili', null);
INSERT INTO `arc_sys_user` VALUES ('43', '张建伟', 'zhangjianwei', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '036', null, null, null, null, null, null, null, '1', null, null, '2017-12-11 10:24:14', '赵乔', '2018-01-22 10:16:39', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('44', '曲文海', 'quwenhai', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '037', null, null, null, null, null, null, null, '0', null, null, '2017-12-14 10:44:36', '赵乔', '2017-12-14 10:44:36', 'nongzili', null);
INSERT INTO `arc_sys_user` VALUES ('45', '李岩', 'liyan', 'z64zyqo7nxshnosipueeobs7p4a2sxi7auiea7a', '038', null, null, null, null, null, null, null, '1', null, null, '2017-12-14 10:46:14', '赵乔', '2018-01-25 11:25:20', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('46', '龚成', 'gongcheng', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '039', null, null, null, null, null, null, null, '0', null, null, '2017-12-14 10:47:08', '赵乔', '2017-12-14 10:47:08', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('47', '唐健博', 'tangjianbo', 'fsct6uu4bikdml4pkrmudyivu53s2qzwqpyrqfbd2zhtaqlfv2oa', '040', null, null, null, null, null, null, null, '1', null, null, '2017-12-14 10:47:34', '赵乔', '2018-01-25 11:25:16', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('48', '刘佳宁', 'liujianing', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '041', null, null, null, null, null, null, null, '1', null, null, '2017-12-14 10:48:04', '赵乔', '2018-01-17 11:20:02', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('49', '孙一文', 'sunyiwen', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '042', null, null, null, null, null, null, null, '0', null, null, '2017-12-14 10:48:23', '赵乔', '2017-12-14 10:48:23', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('50', '郑欣宇', 'zhengxinyu', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '043', null, null, null, null, null, null, null, '0', null, null, '2017-12-14 10:48:57', '赵乔', '2017-12-14 10:48:57', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('51', '刘哲铭', 'liuzheming', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '044', null, null, null, null, null, null, null, '1', null, null, '2017-12-14 10:49:26', '赵乔', '2018-01-17 11:19:43', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('52', '王鹏', 'wangpeng', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '045', null, null, null, null, null, null, null, '0', null, null, '2017-12-14 13:28:04', '赵乔', '2017-12-14 13:28:04', 'zhaoqiao', null);
INSERT INTO `arc_sys_user` VALUES ('53', '刘晓英', 'liuxiaoying', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '046', null, null, null, null, null, null, null, '0', null, null, '2017-12-18 10:44:42', '赵乔', '2017-12-18 10:44:42', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('54', '何钊', 'hezhao', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '047', null, null, null, null, null, null, null, '0', null, null, '2018-01-02 15:27:33', '赵乔', '2018-01-02 15:27:33', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('55', '刘思雅', 'liusiya', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '048', null, null, null, null, null, null, null, '0', null, null, '2018-01-02 15:28:10', '赵乔', '2018-01-02 15:28:10', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('56', '谢承旭', 'xiechengxu', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '049', null, null, null, null, null, null, null, '0', null, null, '2018-01-02 15:28:49', '赵乔', '2018-01-02 15:28:49', '赵乔', null);
INSERT INTO `arc_sys_user` VALUES ('57', '王铁征', 'wangtiezheng', 'fpdfjj4dle2bs5znim3ih4iycqr5mtzqifs25ha', '050', null, null, null, null, null, null, null, '0', null, null, '2018-01-25 11:30:34', '赵乔', '2018-01-25 11:30:34', '赵乔', null);

-- ----------------------------
-- Table structure for arc_sys_user_channel
-- ----------------------------
DROP TABLE IF EXISTS `arc_sys_user_channel`;
CREATE TABLE `arc_sys_user_channel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户标志',
  `channel_id` bigint(20) DEFAULT NULL COMMENT '渠道标志',
  `state` varchar(255) DEFAULT NULL COMMENT '10 ： 启用，20：禁止',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统渠道用户表';

-- ----------------------------
-- Records of arc_sys_user_channel
-- ----------------------------

-- ----------------------------
-- Table structure for arc_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `arc_sys_user_role`;
CREATE TABLE `arc_sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) NOT NULL COMMENT '角色主键',
  `user_id` int(11) NOT NULL COMMENT '用户主键',
  `level` tinyint(1) unsigned zerofill DEFAULT NULL COMMENT '级别',
  PRIMARY KEY (`id`),
  KEY `role_id_index` (`role_id`) USING BTREE,
  KEY `user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of arc_sys_user_role
-- ----------------------------
INSERT INTO `arc_sys_user_role` VALUES ('1', '1', '1', null);
INSERT INTO `arc_sys_user_role` VALUES ('8', '4', '5', null);
INSERT INTO `arc_sys_user_role` VALUES ('13', '1', '9', null);
INSERT INTO `arc_sys_user_role` VALUES ('14', '5', '10', null);
INSERT INTO `arc_sys_user_role` VALUES ('26', '8', '4', null);
INSERT INTO `arc_sys_user_role` VALUES ('89', '8', '16', null);
INSERT INTO `arc_sys_user_role` VALUES ('90', '2', '16', null);
INSERT INTO `arc_sys_user_role` VALUES ('113', '1', '8', null);
INSERT INTO `arc_sys_user_role` VALUES ('114', '6', '8', null);
INSERT INTO `arc_sys_user_role` VALUES ('115', '3', '8', null);
INSERT INTO `arc_sys_user_role` VALUES ('116', '1', '14', null);
INSERT INTO `arc_sys_user_role` VALUES ('117', '6', '14', null);
INSERT INTO `arc_sys_user_role` VALUES ('118', '3', '14', null);
INSERT INTO `arc_sys_user_role` VALUES ('196', '1', '15', null);
INSERT INTO `arc_sys_user_role` VALUES ('199', '1', '13', null);
INSERT INTO `arc_sys_user_role` VALUES ('202', '4', '12', null);
INSERT INTO `arc_sys_user_role` VALUES ('203', '5', '12', null);
INSERT INTO `arc_sys_user_role` VALUES ('204', '8', '12', null);
INSERT INTO `arc_sys_user_role` VALUES ('205', '2', '12', null);
INSERT INTO `arc_sys_user_role` VALUES ('206', '1', '11', null);
INSERT INTO `arc_sys_user_role` VALUES ('207', '3', '11', null);
INSERT INTO `arc_sys_user_role` VALUES ('208', '7', '11', null);
INSERT INTO `arc_sys_user_role` VALUES ('209', '4', '2', null);
INSERT INTO `arc_sys_user_role` VALUES ('262', '11', '20', null);
INSERT INTO `arc_sys_user_role` VALUES ('263', '11', '21', null);
INSERT INTO `arc_sys_user_role` VALUES ('264', '11', '22', null);
INSERT INTO `arc_sys_user_role` VALUES ('265', '11', '23', null);
INSERT INTO `arc_sys_user_role` VALUES ('291', '11', '25', null);
INSERT INTO `arc_sys_user_role` VALUES ('295', '8', '26', null);
INSERT INTO `arc_sys_user_role` VALUES ('296', '4', '26', null);
INSERT INTO `arc_sys_user_role` VALUES ('297', '1', '24', null);
INSERT INTO `arc_sys_user_role` VALUES ('298', '3', '24', null);
INSERT INTO `arc_sys_user_role` VALUES ('299', '7', '24', null);
INSERT INTO `arc_sys_user_role` VALUES ('300', '2', '24', null);
INSERT INTO `arc_sys_user_role` VALUES ('307', '5', '7', null);
INSERT INTO `arc_sys_user_role` VALUES ('308', '2', '7', null);
INSERT INTO `arc_sys_user_role` VALUES ('309', '8', '7', null);
INSERT INTO `arc_sys_user_role` VALUES ('310', '10', '7', null);
INSERT INTO `arc_sys_user_role` VALUES ('315', '4', '19', null);
INSERT INTO `arc_sys_user_role` VALUES ('316', '8', '19', null);
INSERT INTO `arc_sys_user_role` VALUES ('317', '3', '19', null);
INSERT INTO `arc_sys_user_role` VALUES ('324', '10', '27', null);
INSERT INTO `arc_sys_user_role` VALUES ('325', '10', '28', null);
INSERT INTO `arc_sys_user_role` VALUES ('327', '12', '29', null);
INSERT INTO `arc_sys_user_role` VALUES ('328', '4', '3', null);
INSERT INTO `arc_sys_user_role` VALUES ('329', '2', '3', null);
INSERT INTO `arc_sys_user_role` VALUES ('330', '8', '3', null);
INSERT INTO `arc_sys_user_role` VALUES ('331', '1', '3', null);
INSERT INTO `arc_sys_user_role` VALUES ('332', '7', '3', null);
INSERT INTO `arc_sys_user_role` VALUES ('333', '5', '3', null);
INSERT INTO `arc_sys_user_role` VALUES ('334', '6', '3', null);
INSERT INTO `arc_sys_user_role` VALUES ('335', '9', '3', null);
INSERT INTO `arc_sys_user_role` VALUES ('336', '10', '3', null);
INSERT INTO `arc_sys_user_role` VALUES ('337', '3', '3', null);
INSERT INTO `arc_sys_user_role` VALUES ('338', '12', '3', null);
INSERT INTO `arc_sys_user_role` VALUES ('339', '10', '30', null);
INSERT INTO `arc_sys_user_role` VALUES ('340', '10', '31', null);
INSERT INTO `arc_sys_user_role` VALUES ('341', '10', '32', null);
INSERT INTO `arc_sys_user_role` VALUES ('342', '2', '32', null);
INSERT INTO `arc_sys_user_role` VALUES ('343', '4', '33', null);
INSERT INTO `arc_sys_user_role` VALUES ('344', '8', '33', null);
INSERT INTO `arc_sys_user_role` VALUES ('346', '10', '35', null);
INSERT INTO `arc_sys_user_role` VALUES ('347', '10', '36', null);
INSERT INTO `arc_sys_user_role` VALUES ('348', '10', '37', null);
INSERT INTO `arc_sys_user_role` VALUES ('349', '10', '34', null);
INSERT INTO `arc_sys_user_role` VALUES ('350', '10', '38', null);
INSERT INTO `arc_sys_user_role` VALUES ('352', '10', '40', null);
INSERT INTO `arc_sys_user_role` VALUES ('353', '10', '41', null);
INSERT INTO `arc_sys_user_role` VALUES ('357', '10', '43', null);
INSERT INTO `arc_sys_user_role` VALUES ('372', '10', '45', null);
INSERT INTO `arc_sys_user_role` VALUES ('373', '10', '46', null);
INSERT INTO `arc_sys_user_role` VALUES ('374', '10', '47', null);
INSERT INTO `arc_sys_user_role` VALUES ('375', '10', '48', null);
INSERT INTO `arc_sys_user_role` VALUES ('376', '10', '49', null);
INSERT INTO `arc_sys_user_role` VALUES ('377', '10', '50', null);
INSERT INTO `arc_sys_user_role` VALUES ('378', '10', '51', null);
INSERT INTO `arc_sys_user_role` VALUES ('379', '10', '39', null);
INSERT INTO `arc_sys_user_role` VALUES ('380', '2', '39', null);
INSERT INTO `arc_sys_user_role` VALUES ('381', '10', '17', null);
INSERT INTO `arc_sys_user_role` VALUES ('382', '2', '17', null);
INSERT INTO `arc_sys_user_role` VALUES ('384', '8', '52', null);
INSERT INTO `arc_sys_user_role` VALUES ('385', '4', '52', null);
INSERT INTO `arc_sys_user_role` VALUES ('386', '10', '53', null);
INSERT INTO `arc_sys_user_role` VALUES ('387', '3', '18', null);
INSERT INTO `arc_sys_user_role` VALUES ('388', '7', '18', null);
INSERT INTO `arc_sys_user_role` VALUES ('389', '1', '18', null);
INSERT INTO `arc_sys_user_role` VALUES ('390', '2', '18', null);
INSERT INTO `arc_sys_user_role` VALUES ('391', '10', '18', null);
INSERT INTO `arc_sys_user_role` VALUES ('392', '9', '44', null);
INSERT INTO `arc_sys_user_role` VALUES ('393', '4', '44', null);
INSERT INTO `arc_sys_user_role` VALUES ('394', '7', '44', null);
INSERT INTO `arc_sys_user_role` VALUES ('395', '8', '44', null);
INSERT INTO `arc_sys_user_role` VALUES ('396', '1', '44', null);
INSERT INTO `arc_sys_user_role` VALUES ('397', '12', '44', null);
INSERT INTO `arc_sys_user_role` VALUES ('398', '2', '44', null);
INSERT INTO `arc_sys_user_role` VALUES ('399', '5', '44', null);
INSERT INTO `arc_sys_user_role` VALUES ('400', '3', '44', null);
INSERT INTO `arc_sys_user_role` VALUES ('401', '11', '44', null);
INSERT INTO `arc_sys_user_role` VALUES ('402', '10', '44', null);
INSERT INTO `arc_sys_user_role` VALUES ('403', '1', '42', null);
INSERT INTO `arc_sys_user_role` VALUES ('404', '3', '42', null);
INSERT INTO `arc_sys_user_role` VALUES ('405', '2', '6', null);
INSERT INTO `arc_sys_user_role` VALUES ('406', '3', '6', null);
INSERT INTO `arc_sys_user_role` VALUES ('407', '9', '6', null);
INSERT INTO `arc_sys_user_role` VALUES ('408', '4', '6', null);
INSERT INTO `arc_sys_user_role` VALUES ('409', '10', '54', null);
INSERT INTO `arc_sys_user_role` VALUES ('410', '10', '55', null);
INSERT INTO `arc_sys_user_role` VALUES ('411', '10', '56', null);
INSERT INTO `arc_sys_user_role` VALUES ('412', '10', '57', null);

-- ----------------------------
-- Table structure for cl_app_session
-- ----------------------------
DROP TABLE IF EXISTS `cl_app_session`;
CREATE TABLE `cl_app_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token` char(36) DEFAULT NULL COMMENT 'token值',
  `refresh_token` char(36) DEFAULT NULL COMMENT '刷新指令',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `expire_time` datetime DEFAULT NULL COMMENT '有效期',
  `last_access_time` datetime DEFAULT NULL COMMENT '最后访问时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `session` varchar(2000) DEFAULT NULL COMMENT 'session',
  `err_data` varchar(255) DEFAULT NULL COMMENT '错误提示',
  `login_type` tinyint(2) DEFAULT NULL COMMENT '登录类别',
  `login_id` int(11) DEFAULT NULL COMMENT '登录id',
  PRIMARY KEY (`id`),
  KEY `token` (`token`) USING BTREE,
  KEY `fresh_token` (`refresh_token`) USING BTREE,
  KEY `customer_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='app登录信息表';

-- ----------------------------
-- Records of cl_app_session
-- ----------------------------

-- ----------------------------
-- Table structure for cl_channel
-- ----------------------------
DROP TABLE IF EXISTS `cl_channel`;
CREATE TABLE `cl_channel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `code` varchar(16) NOT NULL DEFAULT '' COMMENT '渠道代码',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '渠道名称',
  `linker` varchar(16) DEFAULT '' COMMENT '联系人',
  `phone` varchar(16) DEFAULT '' COMMENT '联系电话',
  `type` varchar(2) DEFAULT '' COMMENT '渠道类型  (备用)',
  `state` varchar(2) NOT NULL DEFAULT '' COMMENT '状态 10：启用20：禁用',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='渠道信息表';

-- ----------------------------
-- Records of cl_channel
-- ----------------------------

-- ----------------------------
-- Table structure for cl_channel_app
-- ----------------------------
DROP TABLE IF EXISTS `cl_channel_app`;
CREATE TABLE `cl_channel_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `channel_id` bigint(20) NOT NULL COMMENT '渠道id',
  `app_type` varchar(16) DEFAULT '' COMMENT '应用类型',
  `latest_version` varchar(16) DEFAULT '' COMMENT '最新版本',
  `min_version` varchar(16) DEFAULT '' COMMENT '最低支持版本',
  `download_url` varchar(64) DEFAULT '' COMMENT '下载地址',
  `state` varchar(2) DEFAULT '' COMMENT '状态 10启用，20禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='app版本信息';

-- ----------------------------
-- Records of cl_channel_app
-- ----------------------------

-- ----------------------------
-- Table structure for cl_quartz_info
-- ----------------------------
DROP TABLE IF EXISTS `cl_quartz_info`;
CREATE TABLE `cl_quartz_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '定时任务名称',
  `code` varchar(64) NOT NULL DEFAULT '' COMMENT '定时任务code标识',
  `cycle` varchar(32) NOT NULL DEFAULT '' COMMENT '定时任务执行周期',
  `class_name` varchar(64) NOT NULL DEFAULT '' COMMENT '定时任务执行类',
  `succeed` int(11) NOT NULL DEFAULT '0' COMMENT '成功执行次数',
  `fail` int(11) NOT NULL DEFAULT '0' COMMENT '失败执行次数',
  `state` varchar(2) NOT NULL DEFAULT '' COMMENT '是否启用 10-启用 20-禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='定时任务信息表';

-- ----------------------------
-- Records of cl_quartz_info
-- ----------------------------
INSERT INTO `cl_quartz_info` VALUES ('1', '计算逾期任务', 'doLate', '0 30 3 * * ?', 'com.rongdu.cashloan.manage.job.QuartzLate', '2365', '0', '10', '2017-03-15 16:22:04');
INSERT INTO `cl_quartz_info` VALUES ('2', '定时扣款还款', 'doRepayment', '0 30 1 * * ?', 'com.rongdu.cashloan.manage.job.QuartzRepayment', '331', '2', '10', '2017-03-21 18:50:45');
INSERT INTO `cl_quartz_info` VALUES ('3', '定时分润付款', 'doProfit', '0 30 1 0 10 ? ', 'com.rongdu.cashloan.manage.job.QuartzProfit', '0', '0', '20', '2017-03-27 14:53:27');
INSERT INTO `cl_quartz_info` VALUES ('4', '还款信息通知', 'repayment_sms_push', '0 0 8 * * ?', 'com.rongdu.cashloan.manage.job.QuartzRepaymentSmsAndPush', '0', '0', '10', '2017-11-02 12:48:36');
INSERT INTO `cl_quartz_info` VALUES ('5', '逾期信息通知', 'repayment_over_due', '0 20 8 * * ?', 'com.rongdu.cashloan.manage.job.QuartzRepaymentOverDue', '0', '0', '10', '2017-11-18 18:52:56');

-- ----------------------------
-- Table structure for cl_quartz_log
-- ----------------------------
DROP TABLE IF EXISTS `cl_quartz_log`;
CREATE TABLE `cl_quartz_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `quartz_id` bigint(20) DEFAULT '0' COMMENT '定时任务id',
  `start_time` datetime DEFAULT NULL COMMENT '启动时间',
  `time` int(11) DEFAULT '0' COMMENT '任务用时',
  `result` varchar(2) DEFAULT '20' COMMENT '执行是否成功 10-成功 20-失败',
  `remark` varchar(128) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `quartz_id` (`quartz_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务执行记录表';

-- ----------------------------
-- Records of cl_quartz_log
-- ----------------------------

-- ----------------------------
-- Table structure for cl_user
-- ----------------------------
DROP TABLE IF EXISTS `cl_user`;
CREATE TABLE `cl_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid` varchar(40) DEFAULT NULL,
  `login_name` varchar(30) DEFAULT NULL COMMENT '登录名',
  `login_pwd` varchar(50) DEFAULT NULL COMMENT '登录密码',
  `loginpwd_modify_time` datetime DEFAULT NULL COMMENT '上次登录密码修改时间',
  `regist_time` datetime DEFAULT NULL COMMENT '注册时间',
  `register_client` varchar(10) DEFAULT NULL COMMENT '注册客户端',
  `invitation_code` varchar(10) DEFAULT NULL COMMENT '邀请码',
  `channel_id` bigint(20) DEFAULT NULL COMMENT '渠道',
  `level` varchar(2) DEFAULT '' COMMENT '代理等级 ，1一级，2二级，3普通用户',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`) USING BTREE,
  UNIQUE KEY `Invitation code` (`invitation_code`) USING BTREE,
  KEY `channel_id` (`channel_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of cl_user
-- ----------------------------

-- ----------------------------
-- Table structure for cl_user_apply_log
-- ----------------------------
DROP TABLE IF EXISTS `cl_user_apply_log`;
CREATE TABLE `cl_user_apply_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户姓名',
  `channel_id` bigint(20) DEFAULT NULL COMMENT '渠道id',
  `channel_name` varchar(255) DEFAULT NULL COMMENT '渠道名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户申请记录表';

-- ----------------------------
-- Records of cl_user_apply_log
-- ----------------------------

-- ----------------------------
-- Table structure for cl_user_base_info
-- ----------------------------
DROP TABLE IF EXISTS `cl_user_base_info`;
CREATE TABLE `cl_user_base_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '客户表 外键',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `real_name` varchar(30) DEFAULT NULL COMMENT '真实姓名',
  `age` int(11) DEFAULT '0' COMMENT '年龄 ',
  `sex` varchar(30) DEFAULT '' COMMENT '性别',
  `national` varchar(30) DEFAULT '' COMMENT '民族',
  `id_no` varchar(18) DEFAULT '' COMMENT '证件号码',
  `phone_idno_md5` varchar(50) DEFAULT NULL COMMENT '手机号+身份证号拼接生成的md5',
  `id_addr` varchar(255) DEFAULT '' COMMENT '身份证地址',
  `living_img` text COMMENT '自拍(人脸识别照片)',
  `ocr_img` text COMMENT '身份证头像',
  `front_img` text COMMENT '身份证正面',
  `back_img` text COMMENT '身份证反面',
  `education` varchar(30) DEFAULT '' COMMENT '学历',
  `marry_state` varchar(30) DEFAULT '' COMMENT '婚姻状况',
  `company_name` varchar(50) DEFAULT '' COMMENT '公司名称',
  `company_phone` varchar(32) DEFAULT '' COMMENT '公司电话',
  `company_addr` varchar(255) DEFAULT '' COMMENT '公司地址',
  `company_detail_addr` varchar(64) DEFAULT '' COMMENT '公司详细地址',
  `company_coordinate` varchar(100) DEFAULT '' COMMENT '公司坐标(经度,纬度)',
  `salary` varchar(30) DEFAULT '' COMMENT '月薪范围',
  `working_years` varchar(30) DEFAULT '' COMMENT '工作年限',
  `working_img` varchar(512) DEFAULT '' COMMENT '工作照片',
  `live_time` varchar(30) DEFAULT '' COMMENT '居住时长',
  `live_addr` varchar(255) DEFAULT '' COMMENT '居住地址',
  `live_detail_addr` varchar(255) DEFAULT '' COMMENT '居住详细地址',
  `live_coordinate` varchar(100) DEFAULT '' COMMENT '居住地坐标，(经度,纬度)',
  `phone_server_pwd` varchar(30) DEFAULT '' COMMENT '运营商服务密码',
  `register_addr` varchar(255) DEFAULT '' COMMENT '注册地址',
  `register_coordinate` varchar(100) DEFAULT '' COMMENT '注册地坐标，(经度,纬度)',
  `state` varchar(30) DEFAULT '20' COMMENT '是否黑名单   10是 20否',
  `black_reason` varchar(255) DEFAULT '' COMMENT '拉黑原因',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `marital` varchar(20) DEFAULT '' COMMENT '婚姻状况',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `phone` (`phone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户详情表';

-- ----------------------------
-- Records of cl_user_base_info
-- ----------------------------

-- ----------------------------
-- Table structure for cl_user_black_info
-- ----------------------------
DROP TABLE IF EXISTS `cl_user_black_info`;
CREATE TABLE `cl_user_black_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `real_name` varchar(20) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `id_no` varchar(18) NOT NULL DEFAULT '' COMMENT '身份证号',
  `phone` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `type` varchar(2) NOT NULL DEFAULT '10' COMMENT '类型：10 黑名单 20 白名单',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='黑名单信息';

-- ----------------------------
-- Records of cl_user_black_info
-- ----------------------------

-- ----------------------------
-- Table structure for cl_user_invite
-- ----------------------------
DROP TABLE IF EXISTS `cl_user_invite`;
CREATE TABLE `cl_user_invite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `invite_time` datetime DEFAULT NULL COMMENT '邀请时间',
  `invite_id` bigint(20) DEFAULT NULL COMMENT '被邀请人id',
  `invite_name` varchar(32) DEFAULT '' COMMENT '被邀请人名称',
  `user_id` bigint(20) DEFAULT NULL COMMENT '邀请人id',
  `user_name` varchar(32) DEFAULT '' COMMENT '邀请人名称',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邀请记录表';

-- ----------------------------
-- Records of cl_user_invite
-- ----------------------------

-- ----------------------------
-- Table structure for sys_export
-- ----------------------------
DROP TABLE IF EXISTS `sys_export`;
CREATE TABLE `sys_export` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_user_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='刘晓亮导出专用表';

-- ----------------------------
-- Records of sys_export
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_operation_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_operation_record`;
CREATE TABLE `sys_user_operation_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sys_user_id` bigint(20) DEFAULT NULL COMMENT '系统操作人员ID',
  `sys_user_name` varchar(255) DEFAULT NULL,
  `borrow_id` bigint(20) DEFAULT NULL COMMENT '借款ID',
  `sys_user_remark` varchar(255) DEFAULT NULL COMMENT '系统操作人员操作描述',
  `sys_user_result` varchar(255) DEFAULT NULL COMMENT '系统操作人员提交结果',
  `sys_user_operation_source` varchar(255) DEFAULT NULL COMMENT '系统人员操作来源',
  `sys_user_prepare1` varchar(255) DEFAULT NULL COMMENT '预留字段1',
  `sys_user_prepare2` varchar(255) DEFAULT NULL COMMENT '预留字段2',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统人员操作记录表';

-- ----------------------------
-- Records of sys_user_operation_record
-- ----------------------------
