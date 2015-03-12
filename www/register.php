<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>注册界面</title>
<style type="text/css">
<!--
a:link {
	color: #00FF00;
}
a:visited {
	color: #CC3399;
}
a:hover {
	color: #FF0000;
}
a:active {
	color: #0099CC;
}
body {
	background-image: url();
	background-repeat: no-repeat;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 1100px;
	margin-bottom: 350px;
	background-color: #FFFFFF;
}
#Layer1 {
	position:absolute;
	width:200px;
	height:115px;
	z-index:1;
}
.STYLE1 {font-family: Verdana, Arial, Helvetica, sans-serif}
    .auto-style2 {
        font-size: medium;
    }
    .auto-style3 {
        width: 97px;
    }
    .auto-style4 {
        width: 97px;
        text-align: right;
    }
    .auto-style5 {
        text-align: center;
        width: 363px;
    }
    .auto-style6 {
        width: 97px;
        text-align: center;
    }
    .auto-style7 {
        width: 363px;
    }
.STYLE2 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 36px;
	color: #FF9933;
}
-->
</style>
<script type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</head>
<form name="form1" id="form1" action="update_for_signup.php" method="post" onSubmit="return check()">
<body>
<table width="1316" border="0" style="height: 363px; width: 1317px">
  <tr>
    <td colspan="3"><h1>&nbsp;</h1></td>
    <td width="649" rowspan="13"><div id="hpslider" class="flexslider">
      <script type="text/javascript" charset="utf-8">
  jQuery(window).load(function() {
    jQuery('#hpslider').flexslider({
		keyboardNav: false,
		prevText: "&lt;",
		nextText: "&gt;"
	});
  });
    </script>
      <img src="images/face.jpg" alt="1" width="560" style="height: 336px; width: 603px; margin-left: 0px;" />
      </div></td>
  </tr>
  
  <tr>
    <td width="85">&nbsp;</td>
    <td colspan="2" class="STYLE2"><div align="left">ECNU HOME  </div>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="97" class="auto-style3"><p>&nbsp;</p>    </td>
    <td width="363" class="auto-style7">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="auto-style4">&nbsp;&nbsp; <span class="STYLE1">昵称</span></td>
    <td class="auto-style7"><input regex="^.{1,}$"  placeholder="请输入正确的用户名"required="required" name="user" type="text" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="auto-style4">&nbsp;&nbsp; 密码</td>
    <td class="auto-style7"><input regex="^.{6,}$"  placeholder="输入6位及以上密码"required="required" name="password" type="password" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="auto-style4">确认密码</td>
    <td class="auto-style7"><input regex="^.{6,}$" placeholder="重新输入上边的密码"required="required" name="repassword" type="password" />    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="auto-style4">真实姓名</td>
    <td class="auto-style7"><input regex="^.{1,}$" placeholder="请填写真实姓名" required="required" name="name" type="text" />    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="auto-style4">&nbsp; 手机号</td>
    <td class="auto-style7"><input regex="^.{11}$" placeholder="请输入正确的手机号" required="required" name="tel" type="text" />    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="auto-style4">&nbsp;邮箱</td>
    <td class="auto-style7"><input regex="^.{11}$" placeholder="请输入正确的邮箱" required="required" name="tel" type="text" />
    </td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;</td>
    <td class="auto-style6"><input name="submit" type="submit" id="submit" value="注册" /></td>
	<td class="auto-style5"> <input name="reset" type = "reset" value = "重置"></td>
    <td width="54">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="auto-style3">&nbsp;</td>
    <td class="auto-style7">&nbsp;</td>
  </tr>
  <tr>
    <td height="47">&nbsp;</td>
    <td class="auto-style3">&nbsp;</td>
    <td class="auto-style7">&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>
