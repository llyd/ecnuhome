<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>登录使用</title>
<style type="text/css">
.STYLE1 {
	font-size: 36px;
	color: #FF9933;
	font-weight: bold;
}
</style>
<script type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function MM_checkBrowser(NSvers,NSpass,NSnoPass,IEvers,IEpass,IEnoPass,OBpass,URL,altURL) { //v5.0
  var newURL='', userAgent=navigator.userAgent, version=0;
  if (userAgent.indexOf('Netscape') != -1) {
  	version = parseFloat(userAgent.substring(userAgent.indexOf('Netscape')+9,userAgent.length));
    if (version >= NSvers) {if (NSpass>0) newURL=(NSpass==1)?URL:altURL;}
    else {if (NSnoPass>0) newURL=(NSnoPass==1)?URL:altURL;}
  } else if (userAgent.indexOf('MSIE') != -1) {
  	version = parseFloat(userAgent.substring(userAgent.indexOf('MSIE')+4,userAgent.length));
    if (version >= IEvers)
     {if (IEpass>0) newURL=(IEpass==1)?URL:altURL;}
    else {if (IEnoPass>0) newURL=(IEnoPass==1)?URL:altURL;}
  } else if (OBpass>0) newURL=(OBpass==1)?URL:altURL;
  if (newURL) { window.location=unescape(newURL); document.MM_returnValue=false; }
}
//-->
</script>
</head>
<form name="form1" id="form1" action="login.php" method="post" >
<body>
<table width="1265" border="0" style="height: 363px; width: 1317px">
  <tr>
    <td colspan="3"><h1>&nbsp;</h1></td>
    <td width="640" rowspan="14"><div id="hpslider" class="flexslider">
      <script type="text/javascript" charset="utf-8">
  jQuery(window).load(function() {
    jQuery('#hpslider').flexslider({
		keyboardNav: false,
		prevText: "&lt;",
		nextText: "&gt;"
	});
  });
    </script>
      <img src="images/face.jpg" alt="1" style="height: 336px; width: 603px; margin-left: 0px;" />
      </div></td>
  </tr>
  
  <tr>
    <td width="130">&nbsp;</td>
    <td colspan="2"><h1 class="auto-style2">
    <span class="STYLE1">ECNU HOME    </span>  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="131" class="auto-style3">&nbsp;</td>
    <td width="202" class="auto-style7">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="auto-style4">&nbsp;</td>
    <td class="auto-style7">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="auto-style4">&nbsp;</td>
    <td class="auto-style7">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="auto-style4">&nbsp;&nbsp;手机号</td>
    <td class="auto-style7"><input regex="^.{1,}$"  placeholder="请输入正确的用户名"required="required" name="Tel" type="text" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="auto-style4">&nbsp;&nbsp; 密码</td>
    <td class="auto-style7"><input regex="^.{6,}$"  placeholder="输入6位及以上密码"required="required" name="password" type="password" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="auto-style4">&nbsp;</td>
    <td class="auto-style7">&nbsp;</td>
  </tr>
  
  <tr>
    <td>&nbsp;&nbsp;&nbsp;</td>
    <td class="auto-style6">      <div align="left">
      <p>&nbsp;</p>
      </div></td>
    </form>
      <div align="center"></div>
	<form name="form2" id="form2" action="register.php">
	<td width="88" class="auto-style5">&nbsp;</td>
    <td width="48">&nbsp;</td>
	</form>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="auto-style3"><input name="submit" type="submit" id="submit" a href="login.php" value="登录" /></td>
    <td class="auto-style7"><span class="auto-style5">
      <input name="register" type = "submit" id="submit" value = "注册" a href="register.php" />
      <a href="register.php">zhuce</a></span></td>
  </tr>
  <tr>
    <td height="47">&nbsp;</td>
    <td class="auto-style3">&nbsp;</td>
    <td class="auto-style7">&nbsp;</td>
  </tr>
  <tr>
    <td height="47">&nbsp;</td>
    <td class="auto-style3">&nbsp;</td>
    <td class="auto-style7">&nbsp;</td>
  </tr>
</table>
</body>
</html>
