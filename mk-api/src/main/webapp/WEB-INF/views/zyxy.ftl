<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta content="telephone=no" name="format-detection" />
<meta name="apple-mobile-web-app-capable" content="no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet"  href="${webroot}/static/css/biheyue/weui.min.css">
<link rel="stylesheet"  href="${webroot}/static/css/biheyue/jquery-weui.min.css">
<link rel="stylesheet"  href="${webroot}/static/css/biheyue/swiper.min.css">
<link rel="stylesheet"  href="${webroot}/static/css/biheyue/init.css"  >
<link rel="stylesheet"  href="${webroot}/static/css/biheyue/webpp.css"   >
<title>质押协议 - 币链合约_数字资产专业质押平台</title>
</head>
<body ontouchstart >
<header class="header">
  <div class="weui-flex">
    <div class="weui-flex__item header-left"><a class="appicon icon-back" href="javascript:history.go(-1)"></a></div>
    <div class="weui-flex__item header-right"></div>
  </div>
</header>
<section class="page">
  <div class="bg-fff pad-075" style="text-align: center">《数字货币质押贷款合同》
    <div class="fs-07 fc-666" style="text-align: left">
      <p class="mar-top-05">本质押贷款合同(以下简称“本合同”)由以下各方于【币合约】，在北京市海淀区签订并履行：</p>
      <p class="mar-top-05"> </p>
      <p class="mar-top-05">甲方(质押方/质押人/债务人)：${data.userName} </p>
      <p class="mar-top-05">身份证号：${data.userIdNo} </p>
      <p class="mar-top-05">乙方(质押权方/质押权人/债权人)：${data.lenderName}</p>
      <p class="mar-top-05">身份证号：${data.lenderIdNo}  </p>
      <p class="mar-top-05"> </p>
      <p class="mar-top-05">丙方(币链合约/平台)：风起银达信息技术（北京）有限公司 </p>
      <p class="mar-top-05">联系地址：北京市海淀区中关村大街18号11层1123-59 </p>
      <p class="mar-top-05">域名：bheyue.com </p>
      <p class="mar-top-05"> </p>
      <p class="mar-top-05">鉴于： </p>
      <p class="mar-top-05">质押人（以下简称甲方）愿意以其有权处分的虚拟货币作质押。 </p>
      <p class="mar-top-05">质押权人（以下简称乙方）经《币链合约虚拟货币管理平台》（以下简称丙方）核实与评估，在充分了解其权益所属状况及现行价格的基础上，同意接受甲方的虚拟货币质押。 </p>
      <p class="mar-top-05">质押物管理平台（以下简称丙方）拥有成熟互联网技术，接受乙方委托，合法管理甲方所质押虚拟货币。 </p>
      <p class="mar-top-05">甲方将虚拟货币质押给乙方期间，该虚拟货币所含有的物权在丙方处寄存与管理，其提供的虚拟货币寄存唯一识别码受到甲乙双方共同认可。 </p>
      <p class="mar-top-05">甲乙双方本着平等、自愿的原则，同意就下列虚拟货币质押事项订立本合同，共同遵守。 </p>
      <p class="mar-top-05"> </p>
      <p class="mar-top-05">第一条质押贷款 </p>
      <p class="mar-top-05">1.1甲方用作质押的虚拟货币可以获取的丙方唯一识别码为： ${data.account}</p>
      <p class="mar-top-05">1.2甲乙双方确认：债务人为甲方，质押期限自${data.start}至${data.end}。 </p>
      <p class="mar-top-05">1.3经丙方评估，上述虚拟货币价值为人民币${data.coinMoneyDa}（大写），&#165;${data.coinMoneyXiao}（小写），甲乙双方确认：乙方债权标的额（本金）${data.coinMoneyDa}（大写），&#165; ${data.coinMoneyXiao}（小写），质押率为${data.rate}。 </p>
      <p class="mar-top-05">1.4甲乙双方确认：甲方在质押期间，需向乙方缴纳${data.interestDailyRate}的日利率，即质押期间利息总额为人民币${data.interestDa}（大写），&#165;${data.interestXiao}（小写），默认从放款金额中提前扣除；还款时间为${data.end}，还款金额为人民币${data.coinMoneyDa}（大写），&#165;${data.coinMoneyXiao}（小写）。 </p>
      <p class="mar-top-05">1.5甲乙丙三方确认：甲方在质押期间，需向丙方缴纳${data.saveDailyRate}的托管费用，即质押期间管理费用总额为人民币${data.saveFeeDa}（大写），&#165;${data.saveFeeXiao}（小写），默认从放款金额中提前扣除。 </p>
      <p class="mar-top-05">1.6 第二条违约处理 </p>
      <p class="mar-top-05">2.1质押期满后，若甲方拒不还款，将产生逾期费和托管费，则逾期日利率提升至1%，托管费正常按日收取。当本息总额加上逾期利息加上托管费接近质押物市场价格的95%或逾期天数达到15天，且甲方仍无法还款时，乙方有权处理质押物，包括但不限于以当前质押物市场价格出售，或扣除应还的各种费用和本金的等值质押物部分后，将剩余质押物归原路返回给质押人。</p>
      <p class="mar-top-05">2.2若因甲方延迟或拒绝还款造成的管理费用增加，增加部分由乙方承担。 </p>
      <p class="mar-top-05">2.3若双方就逾期还款事宜达成其他协议，则在本合同基础上补充说明。 </p>
      <p class="mar-top-05">第三条双方权利义务 </p>
      <p class="mar-top-05">3.1甲方权利义务 </p>
      <p class="mar-top-05">3.1.1甲方保证上述虚拟货币权属清晰，若发生物权纠纷或债权债务，概由甲方负责清理，并承担民事诉讼责任，由此给乙方造成的经济损失，甲方负责赔偿。 </p>
      <p class="mar-top-05">3.1.2甲方在质押期间对质押的虚拟货币承担价值维护的责任。在质押期间因市场行情造成的质押物价值降低至质押价值75%时，乙方有权要求甲方在“币链合约数字资产管理平台”以其他方式通过补齐，补齐手段包括增加质押物数量和现金补至质押时价格；在甲方收到乙方通知后24小时内、价格降低至质押价值65%时，甲方无法满足上述条件的情况下，乙方有权自行处理质押物品。</p>
      <p class="mar-top-05">3.1.3质押期间，甲方不得擅自转让、买卖，租赁质押物，不得重复设定质押，未经乙方书面同意，发生上述行为均属无效。 </p>
      <p class="mar-top-05">3.2乙方权利义务 </p>
      <p class="mar-top-05">3.2.1乙方保证按合同履行其承担的义务，如因乙方延误造成的经济损失，乙方承担赔偿责任。</p>
      <p class="mar-top-05">第四条支付方式 </p>
      <p class="mar-top-05">4.1甲方收款银行账号： </p>
      <p class="mar-top-05">开户行：${data.userBank} </p>
      <p class="mar-top-05">账号： ${data.userBankNo}</p>
      <p class="mar-top-05">4.2乙方收款银行账号 </p>
      <p class="mar-top-05">开户行：${data.lenderBank} </p>
      <p class="mar-top-05">账号： ${data.lenderBankNo}</p>
      <p class="mar-top-05">4.3乙方发放贷款：乙方于${data.start}将贷款打入乙方账户，共计人民币${data.realAmountDa}（大写），&#165;${data.realAmountXiao}（小写）。其中提前扣除应缴利息人民币${data.interestDa}（大写），&#165;${data.interestXiao}（小写），丙方托管费用人民币${data.saveFeeDa}（大写），&#165;${data.saveFeeXiao}（小写），实际金额人民币为${data.realAmountDa}（大写），&#165;${data.realAmountXiao}（小写） </p>
      <p class="mar-top-05">4.4甲方还贷款：甲方于${data.end}将还款打入乙方账户，本息共计人民币${data.coinMoneyDa}（大写），&#165;${data.coinMoneyXiao}（小写）。 </p>
      <p class="mar-top-05">第五条不可抗力 </p>
      <p class="mar-top-05">5.1本协议所述之不可抗力系指签署本协议时不可预见、双方对其发生不可避免、对其后果无法克服的客观情况。这类客观情况包括但不限于：火灾、水灾、战争、国家政策、政府指令或干预、法律限制。鉴于互联网之特殊性质，不可抗力亦包括下列影响互联网正常运行之情形：电信部门技术调整导致之重大影响，因该方管理不善造成的损失不包含在内；因政府管制而造成之暂时性关闭，因该方之过错导致的管制除外；国际性大规模病毒侵袭。 </p>
      <p class="mar-top-05">5.2声称收到不可抗力事件影响的一方，应尽可能在最短时间内通过书面形式，将不可抗力时间的发生通知另一方，并在该不可抗力事件发生后3日内向另一方提供关于此种不可抗力时间及其持续时间的适当证据及合同不能履行或需要延期履行的书面资料，以及有关机构出具的有法律证明力的书面证明。 </p>
      <p class="mar-top-05">5.3声称不可抗力时间导致其对本合同的履行在客观上成为不可能活不实际的一方，有责任尽一切合理的努力消除或减轻此等不可抗力事件的影响。 </p>
      <p class="mar-top-05">5.4因不可抗力导致本协议项下的义务无法履行或本协议终止，双方均不构成违约。 </p>
      <p class="mar-top-05">第六条保密条款 </p>
      <p class="mar-top-05">6.1甲乙双方对本协议内容，以及就本协议项下合作事项互相交付或所知悉的任何信息、文件或数据应负妥善保管、保密和谨慎使用的义务，在未取得提供方事先书面同意前提下，不得用作本协议外的任何其他用途，不得以任何理由或目的向第三方披露（各自的咨询顾问、代理人除外），法律、法规另有规定除外。 </p>
      <p class="mar-top-05">6.2保密责任条款不因本协议的终止而失效。 </p>
      <p class="mar-top-05">第七条其他约定 </p>
      <p class="mar-top-05">7.1本合同未尽事宜，按照国家、省、市相关规定办理。 </p>
      <p class="mar-top-05">7.2本合同执行过程中若发生争议，甲乙双方应采取协商办法解决或共同向仲裁机构申请调解或仲裁，或向在乙方所属地区人民法院提起诉讼。 </p>
      <p class="mar-top-05">7.3本合同签署即生效，生效期内双方不可自行变更合同主条款；需要变更或解除本合同时，应双方协商一致，达成书面协议，协议未达成钱，本合同仍然有效。 </p>
      <p class="mar-top-05">7.4本合同一式三份，甲乙丙三方各执一份。如甲方需要合同请联系平台客服。 </p>
      <p class="mar-top-05">---------------（本行以下无正文）</p>
    </div>
  </div>
</section>
</body>
</html>