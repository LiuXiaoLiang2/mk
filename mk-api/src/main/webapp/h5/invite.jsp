<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String channelCode = request.getParameter("channelCode");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta content="telephone=no" name="format-detection" />
<meta name="apple-mobile-web-app-capable" content="no">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link rel="stylesheet"  href="/static/tgy/css/tgy.css?v=201805212137">
<link rel="stylesheet"  href="/static/tgy/css/jquery-weui.min.css">
<link rel="stylesheet"  href="/static/tgy/css/weui.min.css">
<script src="/static/js/jquery.min.js"></script>
<script src="/static/tgy/js/jquery-weui.min.js"></script>
<script src="/static/js/signup.js?v=201805221839"></script>

<style type="text/css">
/** 微信登录 */
.weixin-tip{display: none;position: fixed;left:0;top:0;bottom:0;background: rgba(0,0,0,0.8);filter:alpha(opacity=80);height: 100%;width: 100%;z-index: 100;}
.weixin-tip p{text-align: center; margin-top: 10%; padding:0 5%;}
</style>
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
                
                },2000)
                
            }
            
</script>
<script type="text/javascript" src="/static/js/zepto.min.js"></script>
<title>币链合约-数字币质押贷款平台</title>


</head>
  <body ontouchstart >

    <form action="#" id="form">
     <%if(channelCode != null&&!channelCode.equals("")&&!channelCode.equals("null")){ %>
            <input id='channelCode' name="channelCode" type="hidden" value="<%=channelCode%>" />
            <%} %>
    <div class="main">
	<a >
        <div class="itms itms-btn">
            <button class="btn" type="button" id="reg">立即领钱</button>
        </div>
    </a>		
    </div>
    </form>

    <div class="popup">
    <div class="header"><div class="left back"><i class="icon icon-back"></i><span class="t">返回</span></div></div>
    </div>
    <div class="weixin-tip">
	<p>
		<img style="max-width: 100%;"  src="/static/tgy/images/live_weixin.png" alt="微信打开"/>
	</p>
</div>
    <div style="display:none;">
    	<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1273760475'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s19.cnzz.com/z_stat.php%3Fid%3D1273760475' type='text/javascript'%3E%3C/script%3E"));</script>
    </div>


</body>

</html>