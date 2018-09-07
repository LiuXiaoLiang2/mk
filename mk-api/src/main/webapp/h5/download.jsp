<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 7]> <html lang="en" class="ie7"> <![endif]-->  
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<html lang="en">
<head>
	<title>短贷王APP下载</title>
	<meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="短贷王APP下载">
    <meta name="description" content="短贷王APP下载">
    <meta property="og:type" content="webpage">
    <meta property="og:url" content="http://www.duandai.com">
    <meta property="og:title" content="短贷王APP下载">
    <meta property="og:description" content="短贷王APP下载">
    <meta name="apple-mobile-web-app-title" content="短贷王APP下载">
    
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no minimal-ui">

    
    <link rel="shortcut icon" href="http://res.duandai.com/static/images/favicon.ico" />
    <link rel="stylesheet" href="http://res.duandai.com/static/css/header_include.min.css">

</head>	

<body>

<div class="top" style="display: none">
	<div class=" toptip" >
		点击右上角按钮，然后在弹出的菜单中，点击在<span id="llq">浏览器</span>打开，即可安装
	</div>
</div>

<!--=== Breadcrumbs ===-->
<div class="row-fluid breadcrumbs margin-bottom-20">
    <div class="container">
        <h1 class="pull-left">短贷王</h1>
        <ul class="pull-right breadcrumb">
			<li>版本：1.1.2</li>
            <li>大小：22.95 MB</li>
			<li>2017-11-20</li>
        </ul>
    </div>
</div>

<div class="container content"> 	
	<div class="view row">
		<div class="span12" style="text-align:center;">
			<a href="javascript:void(0);" onclick="javascript:install();"><img src="http://res.duandai.com/static/images/120.png" class="appicon" /></a>
			<div>
			</div>
        </div>
	</div>

    <div id="" class="view row" style="margin-top:30px;">    
		<div class="span12 margin-bottom-20" style="text-align:center;">
			<div class="spinner">
				<div class="loading"></div>
				<a href="javascript:void(0);" id="down_load"  class="btn-u btn-u-lg" > <i class="fa fa-download"></i> 点击安装</a>
			</div>
		</div>
		<div class="span12" style="text-align:center;">
			<!-- 
			<span class="label label-info">适用于iOS设备</span>
			<span class="label label-danger">内测版</span>  
			-->
		</div>
	</div>

    <hr class="devider devider-dotted">

	<!-- 
	<div id="" class="view row margin-bottom-30">    
		<div class="span12" style="text-align:center;">
           	 或者用手机扫描二维码安装            <br />
            <br />
            <img src="img/nIUC.png" style="width:156px; height:156px;" />
        </div>
    </div>
    -->
	<!-- 
	<hr class="devider devider-dotted" />
	<div class="col-md-6 col-md-offset-3">
		<div class="panel panel-sea margin-bottom-40">
			<div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-angle-double-right"></i>历史版本</h3>
            </div>
            <table class="table table-striped table-hover app_view_history">
				<tbody id="otherAppList">
					<input type="hidden" id="pageNum" value="1">
					<tr appkey="8d0f91f4a38314606071854606b9c692" class="history_row">
						<td class="text-center" style="min-width:120px;">1.1.2</td>
                        <td class="text-center" style="min-width:100px;">2017-11-20</td>
                    </tr>
				</tbody>
            </table>
        </div>
    </div>
     -->
</div>
<div class="copyright" >
	<div class="container" style="z-index:-1;">
		<div class="row">
			<div class="col-lg-8  col-xs-12 col-md-6 col-sm-6 text-left" style="z-index:0;">
				由 <a href="/">短贷王</a> 提供
				<!--｜<a href="/" target="_blank">免责声明</a>｜
                <a data-toggle="modal" id="reportClick" style="cursor: pointer;">举报</a>
                -->
            </div>
			<!--
            <div class="col-lg-4  col-xs-12 col-md-6 col-sm-6 text-right" style="z-index:0;">
                <a href="#"><img src="img/language_chinese.png"> 中文</a>
                &nbsp;&nbsp;&nbsp;<a href="#"><img src="img/language_english.png"> English</a>
            </div>
			-->
		</div>
    </div>
</div>
<div id="reportAppModal"></div>
<div id="loginTelModalDiv"></div>


<script src="http://res.duandai.com/static/js/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	var ua = window.navigator.userAgent.toLowerCase(); 
    var isWx = ua.match(/MicroMessenger/i) == 'micromessenger'
    var u = navigator.userAgent, app = navigator.appVersion;
    var isAndroid = u.indexOf('Android') > -1 
    var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端

    if(isiOS){ 
        $('#llq').text('Safari');
    }

    if(isWx){ 
        $('.top').slideDown();
    }

    $('#down_load').on('click',function(){
        if(isWx){
            alert($('.toptip').text())
            return false;
        }
        if(isAndroid){
            // alert('您的手机是Android系统');
            window.location.href = "http://down.duandai.com/android/duandai_1.1.2_fqyd.apk";
            return false;
        }
        if(isiOS){
        	alert('请关注微信公众号：DuanDai  申请提取，5分钟到帐');
        }
    })

})

</script>
<div style="display:none"><script src="https://s19.cnzz.com/z_stat.php?id=1266568448&web_id=1266568448" language="JavaScript"></script></div>
</body>
</html>
