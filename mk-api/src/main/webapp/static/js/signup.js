$(function() {
	var u = navigator.userAgent;
	var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
	var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
	var downloadAndroidHost = "http://down.bheyue.com/android/";
	var downloadIosHost = "http://down.bheyue.com/ios/";
	var rarName = "eth";
	var rarPostfix = ".apk";
	var winHeight = $(window).height();
	function is_weixin() {
	    var ua = navigator.userAgent.toLowerCase();
	    if (ua.match(/MicroMessenger/i) == "micromessenger") {
	        return true;
	    } else {
	        return false;
	    }
	}
	
	var cvalue = function(val){
		if(val == null || val == "" || val=="null"){
			val= "guanwang";
		}
		return val;
	};
	var ccode = cvalue($("#channelCode").val());
	
	var appVersion = '/user/appVersion.htm';//获取app版本号
	
	
	//点击下载
	$('#reg').on('click',function(){
		if(isAndroid){
			var isWeixin = is_weixin();
			if(isWeixin){
				_czc.push(["_trackEvent","h5推广","点击下载","微信"]);
				$(".weixin-tip").css("height",winHeight);
		        $(".weixin-tip").show();
			}else{
				$.ajax({
					url : appVersion,
					dataType : 'JSON',
					success : function(data){
						if(data != null){
							_czc.push(["_trackEvent","h5推广","点击下载","android下载"]);
							window.location.href =  downloadAndroidHost+rarName+"_"+data.version+"_"+ccode+rarPostfix;
						}
					}
				});
			}
		}else if(isiOS){
			_czc.push(["_trackEvent","h5推广","点击下载","ios用户"]);
			alert("iOS客户端 敬请期待");
		}
	})
});