<!--#include file="conn.asp"-->
<%
If Request.QueryString("action")="setup" then
	call setup()
Else
	If Session("id")<>"" Then
 		Set rs = server.createobject("ADODB.RecordSet")
 		rs.Open "Select * from note_Admin where id="&Session("id"),conn,1,3

%>     
<HTML><HEAD>
<TITLE><%=sitename%></TITLE>
<link rel="stylesheet" href="book.css" type="text/css">
</HEAD>
<body background=images/bg.gif topmargin="0" leftmargin="0">
<table width="760" border=0 cellspacing=0 cellpadding=0 bgcolor="#FFFFFF" align=center class="grayline">
<tr><td><img border="0" src="images/TOPS.GIF" width=763></td></tr>
</table>

<center>

<table width="760" border=0 cellspacing=0 cellpadding=0 align=center bgcolor="#FFFFFF" class="grayline">
<tr><td align=center height=50>
<a href=admin_main.asp><img border=0 src=images/admin_home.gif title="管理首页"></a> &nbsp;&nbsp;&nbsp;       
<a href=admin_set.asp?action=setup><img border=0 src=images/admin_setup.gif title="管理选项设置"></a> &nbsp;&nbsp;&nbsp;       
<a href=admin_logout.asp?action=loginout><img border=0 src=images/loginout.gif title="管理结束后，一定要点击这里"></a>
</td></tr>
<tr><td align=center>
<br>
                
</td></tr>
<tr><td>
  

</center>
<center>
<table width="594" border="1" cellpadding="3" bordercolor="#333333" style="border-collapse: collapse">
	<form name=book action=admin_set.asp?action=setup method=post>
	<tr><td  width=141 align=right>网站名称 &nbsp; &nbsp; </td><td width="429"><input type=text name=sitename value="<%=sitename%>" maxlength=20></td></tr>        
	<tr><td  width=141 align=right>管理员姓名 &nbsp; &nbsp; </td><td width="429"><input type=text name=admin value="<%=rs("admin")%>" maxlength=16></td></tr>        
	<tr><td  width=141 align=right>管理员密码 &nbsp; &nbsp; </td><td width="429"><input type=password name=pwd value="" maxlength=16> [若不修改密码，请留空]</td></tr>        
	<tr><td  width=141 align=right>留言主题长度 &nbsp; &nbsp; </td><td width="429"><input type=text name=subjectmaxlength value="<%=subjectmaxlength%>" maxlength=3> [留言主题的最多字符数，例如20]</td></tr>        	
	<tr><td  width=141 align=right>留言内容长度 &nbsp; &nbsp; </td><td width="429"><input type=text name=maxlength value="<%=maxlength%>" maxlength=3> [留言内容的最多字符数，例如200]</td></tr>        
	<tr><td  width=141 align=right>每页留言条数 &nbsp; &nbsp; </td><td width="429"><input type=text name=counts value="<%=counts%>" maxlength=2>  [推荐10]</td></tr>        
	<tr><td  width=141 align=right>留言表格间距 &nbsp; &nbsp; </td><td width="429"><input type=text name=distance value="<%=distance%>" maxlength=2> [合适的间距可使版面更美观，推荐10]</td></tr>        
	<tr><td  width=141 align=right>管理员回复提示 &nbsp; &nbsp; </td><td width="429"><input type=text name=isreply value="<%=rs("isreply")%>" maxlength=10> [例如：“客服回复”]</td></tr>        
	<tr><td  width=141 align=right>管理员回复颜色 &nbsp; &nbsp; </td><td width="429"><input type=text name=replycolor value="<%=rs("replycolor")%>" maxlength=10> [可使用英文单词或16进制数，如：red、#CCFF00”]</td></tr>        
	<tr><td colspan=2 width="580"><INPUT name="save" TYPE="hidden" value="ok"><INPUT TYPE="submit" value="保存设置"></td></tr>
	</form>
</table>
  </center>
</td></tr>
</table> 
<table width="760" border=0 cellspacing=0 cellpadding=0 bgcolor="#FFFFFF" align=center class="grayline">
<tr><td>　</td></tr>
<tr><td width=30 height=37 background="IMAGES/down.gif"><a href=#top><img src=images/up.gif border=0></a></td>
<td height=37 background="IMAGES/down.gif">&nbsp;&nbsp;<a href="index.html">返回主页</a></td>          
<td width=30 height=37 background="IMAGES/down.gif"><a href=admin_login.asp title="管理留言本"><img src=images/admin.gif border=0></a></td> 
</tr> 
</table> 
</body>

</html>
<%
		rs.close
		set rs=nothing

	Else
		response.write "<script>alert('当前没有登录用户');history.back();</script>"
		response.end
	End If

End if

Sub setup()
	if request("save")="ok" then							'保存设置
		Set NArs=Server.CreateObject("ADODB.Recordset")		'创建RecordSet 对象
		'从数据库note_admin中查询id 列的值为Session("id") 的记录，并保存在NArs 中
		NArs.open "select * from note_admin where id="&Session("id"),conn,1,3														
		Set WBrs = Server.CreateObject("ADODB.RecordSet")	'创建RecordSet 对象
		'从数据库web 中查询所有记录，并保存在WBrs 中
		WBrs.Open "Select * from web",conn,1,3

		'资料填写不完整
		if trim(request.form("sitename"))="" or trim(request.form("admin"))="" or trim(request.form("maxlength"))="" or trim(request.form("counts"))="" or trim(request.form("replycolor"))="" or trim(request.form("isreply"))="" or trim(request.form("distance"))="" then
			'给出提示，并返回到前一页
			response.write "<script>alert('资料填写不完整或有错误，请检查后重新提交。');history.back();</script>"
			response.end
		end if
		'输入的留言主题最大长度、留言内容最大长度、每页留言数和表格间距不是数字
		if (not isNumeric(request.form("subjectmaxlength"))) or (not isNumeric(request.form("maxlength"))) or (not isNumeric(request.form("counts"))) or (not isNumeric(request.form("distance"))) then
			'给出提示，并返回到前一页
			response.write "<script>alert('资料填写不完整或有错误，请检查后重新提交。');history.back();</script>"
			response.end
		end if


		WBrs("sitename")=Request.Form("sitename")									'站点名称
		NArs("admin")=Request.Form("admin")											'管理员姓名
		if trim(request("password"))<>"" then 	
			NArs("pwd")=trim(Request.Form("pwd"))									'密码
		End If
		WBrs("SubjectMaxLength") = Request.Form("subjectmaxlength")					'留言主题最大长度
		WBrs("maxlength")=Request.Form("maxlength")									'留言内容最大长度
		WBrs("counts")=Request.Form("counts")										'每页留言数
		WBrs("mail")=Request.Form("mail")											'是否必填邮箱
		NArs("isreply")=trim(Request.Form("isreply"))								'回复提示
		NArs("replycolor")=trim(Request.Form("replycolor"))							'回复颜色
		WBrs("distance")=Request.Form("distance")									'表格间距
		NArs.update																	'更新数据库
		WBrs.update																	'更新数据库
		
		NArs.Close																	'关闭RecordSet 对象
		Set NArs = nothing
		WBrs.Close																	'关闭RecordSet 对象
		Set WBrs = nothing
		'保存成功，给出提示，并返回到管理选项界面
		response.write "<script>alert('您提交的设置已保存。');location.href='admin_set.asp';</script>"
		response.end
	End If	
End Sub

conn.CLose																			'关闭数据库连接
Set conn = nothing
%>