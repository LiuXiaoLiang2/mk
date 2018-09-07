<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,user-scalable=0" />
<meta content="telephone=no" name="format-detection" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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


</head>
  <body ontouchstart >
<div style="height:100%;-webkit-text-size-adjust:100%;margin:0;-webkit-overflow-scrolling:touch;overflow-scrolling:touch;width:100%;overflow-x:hidden;"><div style="max-width:100%"><img src="https://media.duandaibank.com/360report/detail.jpg"></div></div>

</body>

</html>