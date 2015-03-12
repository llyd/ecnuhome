<!--#include file="conn.asp"-->
<%
if request("send")="ok" then												'用户提交留言

	username=trim(request.form("username"))									'读取表单传递过来的姓名数据，Trim函数去掉字符串的前导和后续空格
	usermail=trim(request.form("usermail"))									'读取表单传递过来的用户邮箱数据
	'用户姓名或留言主题或留言内容没有填写
	if username="" or request.form("Comments")="" or request.form("subject") = "" then
		'给出提示，并返回到前一页
		response.write "<script>alert('填写资料不完整，请检查后重新输入！');history.back();</script>"
		response.end
	end if
	if mailyes=0 then														'邮箱为必填时检查邮箱是否合法
		'填写的邮箱地址中不存在字符"."或"@"，或者邮箱长度小于10 或大于50都是非法邮箱地址
		if Instr(usermail,".")<=0 or Instr(usermail,"@")<=0 or len(usermail)<10 or len(usermail)>50 then
			'给出提示并返回到前一页
			response.write "<script>alert('您输入的电子邮件地址格式不正确，请检查后重新输入！');history.back();</script>"
			response.end
		end if

	end if
	'留言主题长度大于要求的长度
	if len(request.form("subject"))>subjectmaxlength then
		'给出提示并返回到前一页
		response.write "<script>alert('留言主题太长了，请不要超过"&subjectmaxlength&"个字符！');history.back();</script>"
		response.end
	end if

	'留言内容长度大于要求的长度
	if len(request.form("Comments"))>maxlength then
		'给出提示并返回到前一页
		response.write "<script>alert('留言内容太长了，请不要超过"&maxlength&"个字符！');history.back();</script>"
		response.end
	end if
	
	set rs=Server.CreateObject("ADODB.RecordSet")							'将留言保存到数据库中
	
	sql="select * from note_comment"										'从数据库中查询留言记录
	
	rs.open sql,conn,1,3													'执行查询操作，并将结果保存在rs 中

	rs.Addnew																'添加一条记录
	rs("Name")=Request.Form("username")										'姓名
	rs("Comment")=Request.Form("comments")									'留言内容
	rs("Email")=Request.Form("usermail")									'邮箱地址
	rs("url")=Request.Form("url")											'主页
	rs("Communication")=Request.Form("communication")						'其他联系方式
	rs("IP")=Request.serverVariables("REMOTE_ADDR")							'IP 地址
	rs("PostDate") = now()													'留言提交时间
	rs("Subject") = Request.Form("subject")									'留言主题
	rs.Update																'更新数据库
	rs.close																'关闭RecordSet 对象
	set rs=nothing
	'提交成功，给出提示，并返回到留言查看界面
	response.write "<script>alert('留言提交成功，单击“确定”返回留言列表！');location.href='liaotian.asp';</script>"
	response.end
end if
%>



<HTML><HEAD>
<TITLE><%=sitename%></TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="description" content="<%=sitename%>">
<meta name="keywords" content="<%=sitename%>">
<link rel="stylesheet" href="book.css" type="text/css">
<style type="text/css">
body {
	background-image: url(images/main_bg.jpg);
}
</style>
</HEAD>

<body topmargin="0" leftmargin="0">
<table width="760" border=0 cellspacing=0 cellpadding=0 bgcolor="#FFFFFF" align=center class="grayline">
<tr><td><img border="0" src="images/TOPS.GIF" width=758></td></tr>
</table>
<center>

<table width="760" border=0 cellspacing=0 cellpadding=0 align=center bgcolor="#FFFFFF"  class="grayline">
<tr><td align=center height=50>
<img border=0 src=images/write.gif> &nbsp;&nbsp;&nbsp;&nbsp;  <a href=liaotian.asp><img border=0 src=images/read.gif title="我要看留言"></a>
</td></tr>

<tr><td>
<form action=book_write.asp method=post name="book">
<table cellSpacing="1" borderColorDark="#ffffff" cellPadding="4" width="680" align="center" bgColor="#000000" borderColorLight="#000000" border="0">
  <tr bgColor="#ebebeb">
    <td   width="20%" align=right>您的姓名：</td>
    <td ><input type=text name="UserName" size="30" maxlength=16> 
      <font color="#FF0000">*必须填写</font></td>             
  </tr>
  <tr bgColor="#ebebeb">
    <td   width="20%" align=right>留言主题：</td>
    <td ><input type=text name="subject" size="30"  maxlength=50> 
      <font color="#FF0000">*必须填写（<%=subjectmaxlength%>字以内）</font></td>             
  </tr>
  <tr bgColor="#ebebeb">
    <td   width="20%" align=right>您的邮箱：</td>
    <td ><input type=text name="UserMail" size="30"  maxlength=50> 
      <%if mail=0 then%><font color="#FF0000">*必须填写</font><%end if%></td>             
  </tr>
  <tr bgColor="#ebebeb">
    <td   width="20%" align=right>您的网站：</td>
    <td><input type=text value="http://" name="url" size="30"  maxlength=100></td>
  </tr>
  <tr bgColor="#ebebeb">
    <td   width="20%" align=right>其它联系方式：</td>
    <td><input type=text value="" name="communication" size="30"  maxlength=100> （如QQ、MSN等）</td>          
  </tr>
  <tr bgColor="#ebebeb">
    <td   width="20%" align=right>留言内容：<br><font color=red>（<%=maxlength%>字以内）</font></td>
    <td><textarea name="Comments" rows="7" cols="66" style="overflow:auto;"></textarea></td>
   <tr bgColor="#ebebeb">
    <td colSpan="2"><input type="submit" value="提交留言" name="Submit"> 
      <input type="reset" value="重新填写" name="Submit2"><input type=hidden name=send value=ok></td>
  </tr>
</table>
</form>

</table>

<table width="760" border=0 cellspacing=0 cellpadding=0 bgcolor="#FFFFFF" align=center class="grayline">
<tr><td>　</td></tr>
<tr><td width=30 height=37 background="IMAGES/down.gif"><a href=#top><img src=images/up.gif border=0></a></td>
<td height=37 background="IMAGES/down.gif">&nbsp;<a href="index.html">返回主页</a></td>     
<td width=30 height=37 background="IMAGES/down.gif"><a href=admin_login.asp title="管理留言本"><img src=images/admin.gif border=0></a></td> 
</tr> 
</table> 

</center>
</body>
</html>


<%
conn.CLose
Set conn = nothing
%>