<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
	String invitationCode = request.getParameter("invitationCode");
	String channelCode = request.getParameter("channelCode");
	String inviteUserId = request.getParameter("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,user-scalable=0" />
<meta content="telephone=no" name="format-detection" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="http://res.duandai.com/static/js/jquery.min.js"></script>
<link rel="stylesheet"  href="http://res.duandai.com/static/css/tgy.css?v=201711211819">
<script type="text/javascript">
    function  htmlfont(){
   
    var font_size   =    window.innerWidth*0.05333333333333;
    if( font_size > 34.1333){
        font_size   =34.1333;
        }
    font_size = font_size+'px';
    
    document.getElementsByTagName("html")[0].style.fontSize = font_size;
}
htmlfont();

window.onresize = function(){
htmlfont();

}

        function shownew(i){
            $('#tck span').html(i);
            $('#tck').removeClass('dis-none');
            
            setTimeout(function(){
                $('#tck').addClass('dis-none');
                
                },5000)
                
            }
            
</script>
<script type="text/javascript" src="http://res.duandai.com/static/js/zepto.min.js"></script>
<title>短贷王</title>


</head>
  <body ontouchstart >

    <form action="#" id="form">
    <div class="main">
        <div class="itms">
            <input type="tel" class="In-text" placeholder="请输入手机号" id="phone" name="phone" maxlength="11" value="">
            <%if(invitationCode != null&&!invitationCode.equals("")&&!invitationCode.equals("null")){ %>
            <input id='invitation' name="invitationCode" type="hidden" value="<%=invitationCode%>"/>
            <%} %>
             <%if(channelCode != null&&!channelCode.equals("")&&!channelCode.equals("null")){ %>
            <input id='channelCode' name="channelCode" type="hidden" value="<%=channelCode%>" />
            <%} %>
        </div>
        <div class="itms itms-yzm">
        	<input type="hidden" id="code" name="code" />
            <input type="tel" class="In-text" placeholder="请输入短信验证码" id="vcode" name="vcode">

            <button  fs="true"	id="btn" class="code_btn" type="button">点击获取</button> 

        </div>
        <div class="itms">
            <input type="password" class="In-text" placeholder="设置密码（6-16位数字和字母的组合）" id="password" name="password" maxlength="16" value="">
        </div>
        <div class="itms itms-btn">
            <button class="btn" type="button" id="btn-reg">立即借钱</button>
        </div>
        <div class="itms-xy"><laben><input type="checkbox" checked="true" class="In-checkbox" id="check" value="check">同意</laben><span class="fwxy">《短贷王服务协议》</span></div>
       
        <div class="bottom">投资有风险，投入需谨慎<br>具体到账时间视个人情况而定</div>
    </div>
    </form>

    <div class="popup">
    <div class="header"><div class="left back"><i class="icon icon-back"></i><span class="t">返回</span></div></div>

<div class="content">
            <h3 class="title">短贷王服务协议</h3>
<p>风起银达信息技术（北京）有限公司（以下称为“风起银达”）及其运营的短贷王手机应用（以下简称短贷王或本平台）依据本协议的规定为短贷王用户 （以下简称“用户”或“您”）提供服务。本协议在用户和风起银达之间具有法律效力。短贷王（本协议中的短贷王，在某种语境之下等同于“风起银达”）提醒您认真阅读本协议、充分理解各条款内容后再选择是否接受本协议。除非您接受本协议所有条款，否则无权使用短贷王于本协议下所提供的服务。您一经注册或使用短贷王服务即视为充分理解并完全接受本协议全部条款。</p>

<p class="fw-bold">第一条：用户确认及服务接纳</p>
<p>1.1 注册用户需满足下列条件：</p>
<p>（1）短贷王平台只接受持有中国有效身份证明的20周岁至40周岁具有完全民事行为能力的自然人成为用户。如您不符合资格，请停止注册操作，否则本平台有权随时中止或终止您的用户资格。</br>（2）具备接受平台各项服务，履行相应义务的完全民事权利能力及行为能力。</p>
<p>1.2 用户需接受平台全部协议条款及各项平台规则，方可成为平台注册用户，接受平台提供的各项服务。</p>
<p>1.3 用户确认本协议全部条款并完成注册的，视为用户符合注册条件，能够独立承担因接受平台服务所产生权利义务。</p>
<p>1.4 平台保留在中华人民共和国现行有效之法律、法规范围内接受、拒绝、终止/中止用户接受平台服务之资格。</p>
<p class="fw-bold">第二条 ：用户注册信息</p>
<p>2.1 用户首次通过平台提交个人信息并确认本协议的，即成为平台注册用户。</p>
<p>2.2 用户应自行如实向平台提供注册信息。用户应当确保其提供的注册信息真实、准确、完整、合法有效。如用户提供的注册信息不合法、不真实、不准确、不详尽，用户需承担由此产生的相应责任及后果，平台保留终止注册用户资格的权利。</p>
<p>2.3 用户认可平台收集及储存用户的资料及信息，包含但不限于用户本人提交的资料及信息以及平台自行收集的用户资料及信息。平台收集、储存用户资料及信息的目的在于更加效率及便利地为用户提供平台服务，平台不得将用户资料及信息用于其他目的。</p>
<p>2.4 平台应当采取不低于一般行业惯例对于用户的资料及信息进行保护，但因不可抗力所导致的用户资料及信息泄露（包含但不限于黑客攻击、第三方导致的系统缺陷等），平台不承担相应的责任。</p>
<p>2.5 平台有义务根据行政、司法机关的要求向该等机关提供用户的资料及信息。</p>
<p>2.6 用户应当谨慎地保存、使用其平台账号、密码、手机验证码等信息。用户不得将平台账号向他人透露、借用，否则用户应当承担由此产生的全部后果及责任。</p>
<p class="fw-bold">第三条 平台服务</p>
<p>3.1本平台提供的服务包括但不限于：身份验证、手机号码验证、个人信息及资料审核、账户开立及维护、信用咨询与评估、向出借人提交授信及贷款申请、反馈授信审批结果，贷款信息展示、还款进度查询、还款指令反馈、逾期还款通知及管理等，具体详情以本平台当时提供的服务内容为准。您理解并同意，本平台有权根据您提供的各项信息及本平台独立获得的信息评定您在本平台所拥有的个人信用等级，或决定是否审核通过您向出借人发出的借款申请。</p>
<p>3.2 基于运行和交易安全的需要，本平台可以暂时停止提供、限制或改变本平台服务的部分功能，或提供新的功能。在任何功能减少、增加或者变化时，只要您仍然使用本平台的服务，表示您仍然同意本协议或者变更后的协议。</p>
<p>3.3 您确认，您在本平台上按本平台服务流程所确认的交易状态将成为本平台为您进行相关交易或操作的明确指令。您同意本平台有权按相关指令依据本协议和/或有关文件和规则对相关事项进行处理。</p>
<p>3.4您须对使用用户的用户名和密码所采取的一切行为负责。因此，请您不要向任何第三方披露您或其他用户在本平台的用户名和密码，否则由此造成的损失由您自行承担。</p>
<p>3.5 您注册成功后应妥善保管您的用户名和密码。您确认，无论是您还是您的代理人，用您的用户名和密码登录本平台后在本平台的一切操作行为均代表您的真实意思表示，并由您承担相应的法律后果。</p>
<p>3.6 因下列原因所引起的任何纠纷或损失由您本人负责解决和承担，本平台不承担任何责任：</p>
<p>（1）您向本平台提交的任何信息存在不真实、不完整等情形；</br>
（2）您未能向本平台提交有效申请；</br>
（3）您未及时对交易状态进行修改或确认；</br>
（4）其他非因本平台所产生的原因。</p>
<p class="fw-bold">第四条 用户承诺</p>
<p>4.1 用户应当妥善保管本人的平台账号、密码、绑定的手机号码、手机验证码等信息。对于非因平台过错产生的上述信息泄露所导致的用户损失平台不承担任何责任。</p>
<p>4.2 用户承诺在接受平台服务过程中应当诚实、守信地履行相关义务，否则将承担包含但不限于下列后果：</p>
<p>（1）用户的不良信用信息将被上传至经中国人民银行批准并依法设立的各征信数据机构；</br>
（2）用户将因违约行为承担相应的违约责任；</br>
（3）用户将因违约行为承担相应的诉讼后果。</br>
</p>
<p class="fw-bold">第五条 征信授权</p>
<p>5.1 用户在此不可撤销地授权平台通过依法设立的征信机构了解、咨询、审查用户的个人信息、信用状况、履约能力及其他评定用户资信状况的信息，包含可能存在的用户不良信用信息。</p>
<p>5.2 用户在此不可撤销地授权平台向依法设立的征信机构提供用户接受平台服务所对应的个人信息、借贷信息及后续还款记录等信息。</p>
<p>5.3 用户在此不可撤销地授权平台向依法设立的征信机构提供用户可能产生的不良信用信息。</p>
<p class="fw-bold">第六条 关于电子合同</p>
<p>6.1本协议采用电子文本形式制成，并在平台系统上保留存档。其签订方式符合《中华人民共和国电子签名法》的要求。用户通过平台系统点击确认或以其他方式选择接受本协议，即表示已同意接受本协议的全部内容以及与本协议有关的各项平台规则。</p>
<p>6.2用户应当妥善保管自己的账号、密码等账户信息，不得以账户信息被盗用或其他理由否认已订立的协议的效力或不履行相关义务。</p>
<p class="fw-bold">第七条 责任限制</p>
<p>除非另有明确的书面说明,平台及其所包含的或以其它方式通过平台提供给用户的全部信息、内容、材料、产品（包括软件）和服务，均是在"按现状"和"按现有"的基础上提供的。</p>
<p>如因不可抗力或其它平台无法控制的原因平台系统崩溃或无法正常使用导致无法向用户提供平台服务的，平台不承担任何责任。</p>
<p class="fw-bold">第八条 联系信息更新</p>
<p>用户接受平台服务期间，用户本人姓名、身份证号码、手机号码、银行账户等信息如果发生变更，应当在相关信息发生变更之日起三日内将更新后的信息提供给平台。因用户未能及时提供上述变更信息而带来的损失或额外费用应由用户自行承担。</p>
<p class="fw-bold">第九条 适用法律及争议解决</p>
<p>9.1本协议的签订、履行、终止、解释均适用中华人民共和国法律。</p>
<p>9.2因履行本协议所产生的争议应当通过友好协商解决；如协商不成，则本协议任意一方均可向本协议签订地北京市海淀区有管辖权的人民法院起诉。</p>
<p class="fw-bold">第十条 其他</p>
<p>10.1本协议未尽事项按照平台现有及不时发布的各项规则执行。</p>
<p>10.2如本协议中的任何一条或多条被确认为无效，该无效条款并不影响本协议其他条款的效力。</p>
</div>


    </div>

<!--弹出消息-->
<section id="tck" class="dis-none"><span></span></section>
<!--弹出消息--> 

<!--红包-->
<div class="hb-main" style="display:none;">
    <div class="warp">
        <div class="gb"></div>
        <img src="http://res.duandai.com/static/images/hb.png" class="img">
    </div>
</div>
<!--红包-->

</body>

<script type="text/javascript" src="http://res.duandai.com/static/js/placeholders.js" ></script> 
<script type="text/javascript" src="http://res.duandai.com/static/js/signup.js??v=201711211819" ></script>
<script type="text/javascript" src="http://res.duandai.com/static/js/jquery.md5.js" ></script>
<script type="text/javascript" src="http://res.duandai.com/static/js/config.js" ></script>
<script>
	$(function(){
		// 后台生成验证码（非短信验证码）	
		$.ajax({
			url: '/api/user/getCode.htm',
	        dataType: 'json', 
	        success: function(data) {
				if (data.code == 200) {
					$('#code').val(data.randomCode);
	          	} 
	        },
		});
	
		//表单提交
		$('#reg').click(function(){
			//手机号码
			if(!$('#mobile').val()){
				shownew('请填写手机号码');
				return false;
			}else{
				var re = /^1\d{10}$/
				if (!re.test($('#mobile').val())) {
					shownew('请正确填写手机号码');
					return false;
				}
			} 
	
			//验证码
	 		if(!$('#code').val()){
				shownew('请输入验证码');
				return false;
			}
	
			//密码
			if(!$('#password').val()){
				shownew('密码不能为空');
				return false;
			}else if (!/^[0-9a-zA-Z]{6,16}$/.test($('#password').val())){
				shownew('密码长度为6-16位字母与数字');
				return false;
			}
	
			if(!$("#check[type='checkbox']").is(':checked')){
				shownew('请同意验证码');
				return false;
			}
			
			$('#form').submit();
		})
	
	
		//发送验证码
		$('#sub_btn').click(function(){
			//手机号码
			if($(this).attr('fs')   ==  'true'){
				if(!$('#mobile').val()){
					shownew('请填写手机号码');
					return false;
				}else{
					var re = /^1\d{10}$/
					if (!re.test($('#mobile').val())) {
						shownew('请正确填写手机号码');
						return false;
					}else{
						shownew('验证码已经发送');
						Time    =   '5';
						show_Time()
					}
				}
	                        
			}
		})
	
	
		function show_Time(){ //加时函数
			if(Time == 0){ 
				$('#sub_btn').attr({'fs':'true'})
				$('#sub_btn').text('获取验证码');
			}else{
				$('#sub_btn').text('重新获取('+Time+'秒)');
				Time--;
				setTimeout(show_Time,1000); 
				$('#sub_btn').attr({'fs':'false'})
			}
		};
	    
		
		$('.fwxy').click(function(){
			$('.popup').addClass('active')
		})
		$('.back').click(function(){
			$('.popup').removeClass('active')
		})
		
		
		// 关闭红包弹出层
		$('.gb').click(function(){
			$(".hb-main").attr("style","display:none;");
			location.reload();
		})
	
	})
	        
	window.onload = function(){
		var channelcode = $("#channelCode").val();
		var isWeChat = /MicroMessenger/i.test(navigator.userAgent);//微信登录h5
		if(isWeChat && channelcode != 'sykj1'){
			alert("点击右上角按钮，然后再弹出的菜单中，点击在浏览器中打开，注册后即可安装应用");
		}
	}

</script>
<div style="display:none"><script src="https://s19.cnzz.com/z_stat.php?id=1266568448&web_id=1266568448" language="JavaScript"></script></div>
</html>