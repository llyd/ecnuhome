<!--#include file = "conn.asp"-->
<%
if request.QueryString("act")="login" then				'管理员登陆
	user = Request.Form("username")						'读取从表单传递过来的用户名数据
   	pass = Request.Form("password")						'读取从表单传递过来的密码数据
   	Set NArs=Server.CreateObject("Adodb.RecordSet")		'建立RecordSet 对象
   	'从数据库中查找Admin 列的值为user，pwd 列的值为pass 的记录
    sql="Select * from note_admin where Admin='"&user&"' and pwd='"&pass&"'"
    '执行查询操作，并将结果保存在NArs 中
    NArs.open sql,conn,1,1
    If not(NArs.bof and NArs.eof) Then                  '存在满足条件的记录，则登录成功
    	Session("login") = "ok"							'将Session 变量login 置为ok
    	Session("user") = NArs("Admin")					'将当前登录管理员的用户名赋给Session 变量user 
    	Session("id") = NArs("id")						'将当前登录管理员的id 赋给Session 变量id
    	Response.Redirect "admin_main.asp?action=main"	'页面转到留言管理界面
    Else												'不存在满足条件的记录，给出提示，返回到前一页
    	Response.Write("<script>alert('管理员用户名称或密码输入有误，请检查后重新输入！');history.back()</script>")
    	Response.End
    End If
    NArs.Close											'关闭RecordSet 对象
    Set NArs= nothing
End If
%>

<HTML><HEAD>
<TITLE><%=sitename%></TITLE>
<title>管理员登录</title>
<link rel="stylesheet" href="book.css" type="text/css">
<style type="text/css">
body {
	background-image: url(images/main_bg.jpg);
}
</style>
<script language="VBScript">
function check()							'检查用户名、密码是否输入
	If booklogin.username.value="" Then		'用户名文本域的值为空
		alert("用户名不能为空!")			'给出提示
		booklogin.username.focus()			'将用户名文本域置为输入焦点
		return false
	End If
	If booklogin.password.value="" Then		'密码文本域的值为空
		alert("密码不能为空!")				'给出提示
		booklogin.password.focus()			'将密码文本域置为输入的焦点
		return false
	End If
		return true
End Function			
</script>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</HEAD>
<%
if session("login")<>"ok" then 
%>

<body topmargin="0" leftmargin="0">
<table width="760" border=0 cellspacing=0 cellpadding=0 bgcolor="#FFFFFF" align=center class="grayline">
<tr><td><img border="0" src="images/TOPS.GIF" width=762></td></tr>
</table>

<center>

 <table width="760" border=0 cellspacing=0 cellpadding=0 align=center bgcolor="#FFFFFF" class="grayline">
 <tr><td>
<br>
<form action="admin_login.asp?act=login" method=post name=booklogin onsubmit = "return check()">
<table width="300" border="1" cellpadding="3" bordercolor="#333333" style="border-collapse: collapse;" align=center>
<tr>
	<th colspan = 2>管理员登录</th>
<tr><td align=center>用户名</td><td><input type="text" name="username" value="" title="请填写用户名"></td></tr>
<tr><td align=center>密&nbsp;&nbsp;码</td><td><input type="password" name="password" value="" title="请填写登陆密码"></td></tr>
<tr><td colspan=2 align=center><input type="submit" value="管理登陆"><input type="hidden" name="login" value="check"></td></tr>
</table>
</form>

<table width="760" border=0 cellspacing=0 cellpadding=0 bgcolor="#FFFFFF" align=center class="grayline">
<tr><td>　</td></tr>
<tr><td width=30 height=37 background="IMAGES/down.gif"><a href=#top><img src=images/up.gif border=0></a></td>
<td height=37 background="IMAGES/down.gif">&nbsp;&nbsp;<a href="index.html">返回主页</a></td>       
<td width=30 height=37 background="IMAGES/down.gif"><a href=admin_login.asp title="管理留言本"><img src=images/admin.gif border=0></a></td> 
</tr> 
</table> 
</td></tr>
</table>
</center>
</body>	
<%
End If
%>

</html>















