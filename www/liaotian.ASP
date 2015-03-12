<!--#include file="conn.asp"-->
<HTML><HEAD>
<TITLE><%=sitename%></TITLE>
<link rel="stylesheet" href="book.css" type="text/css">
<style type="text/css">
body {
	background-image: url(images/main_bg.jpg);
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</HEAD>

 
<body topmargin="0" leftmargin="0">
<table width="766" border=0 cellspacing=0 cellpadding=0 bgcolor="#FFFFFF" align=center class="grayline">
<tr><td width="764"><img border="0" src="images/TOPS.GIF" width=763></td></tr>
</table>
<center> 
<table width="760" border=0 cellspacing=0 cellpadding=0 align=center bgcolor="#FFFFFF" class="grayline">  
	<tr>
		<td align=center height=25 colspan="2" width="680">  
			<a href=book_write.asp><img border=0 src=images/write.gif title="我要写留言"></a> &nbsp;&nbsp;&nbsp;&nbsp;    
			<a href=liaotian.asp><img border=0 src=images/read.gif title="留言本首页"></a>  
		</td>
	</tr>  
	<tr>
	<td>
	<%  	
	set rs=Server.CreateObject("ADODB.RecordSet")		'创建RecordSet 对象 	
	rs.open "select * from note_comment order by id desc",conn,1,3  		'从数据库中读取留言，并保存在rs 中
	if rs.eof and rs.bof then 							'不存在留言记录
		response.redirect "book_write.asp"  			'转到撰写留言页面
	else 												'存在记录
		if counts=0 or counts="" then counts=10			'每页留言条数  
		rs.pageSize = counts							'每页记录数
		allpages = rs.pageCount							'总页数
		page = Request("page")							'从浏览器取得当前页    
		If not isNumeric(page) then page=1  			'page不是数字
		if isEmpty(page) or Cint(page) < 1 then			'page 为空或小于1
			page = 1  
		elseif Cint(page) >= allPages then  			'page 值大于总页数
			page = allPages   
	  	end if  	
	  	rs.AbsolutePage = page							'转到某页头部  
	 	Do While Not rs.eof  
			UserName=rs("Name")							'用户名  
			Comments=rs("Comment")						'内容  
			Reply=rs("Reply")							'回复  
			Usermail=rs("Email")						'邮件  
			url=rs("Url")								'主页  
			replyname = rs("ReplyName")					'回复人姓名
			I=I+1										'序号  
			'留言序号
			temp=RS.RecordCount-(page-1)*rs.pageSize-I+1   
	%>  
<table cellSpacing="1" cellPadding="3" width="680" align="center" bgColor="#000000" border="0">
  <tr>
	<td vAlign="top" width="25%" bgColor="#f7f7f7" rowSpan="2" align=center>
	<table border=0 width=80%><tr><td align=center></td></tr>
	<tr><td>[NO.<%=temp%>]<br>
	姓名：<%=UserName%><br>
	来自：<%=left(rs("ip"),(len(rs("ip"))-1))+"*"%><br>
	邮件：<a href=mailto:<%=Usermail%>><img src=images/mail.gif border=0></a><br>
	主页：<a href="<%=URL%>" target='_blank'><img src=images/home.gif border=0></a><br><br>
	<%=rs("Postdate")%></td></tr>
	</table>
	</td>
	<td width="75%" height="20" bgColor="#ffffff">主题：<font color=blue><%=rs("subject")%></font> </td>    
  </tr>
  <tr>
	<td vAlign="top" bgColor="#ebebeb" width='75%' height=120 onMouseOver="bgColor='#FFffff'" onMouseOut="bgColor='#ebebeb'">
	<%=Comments%>
	<br><br>
	<%if rs("Reply")<>"" then
		Set RCrs = Server.CreateObject("ADODB.RecordSet")
		RCrs.Open "Select * from note_Admin where Admin="&replyname,conn,1,3
	%>
	<table cellSpacing="1" cellPadding="3" width="90%" align="center" bgColor="darkgray" border="0">
	  <tr><td vAlign="top" bgColor="#f7f7f7">	
	<font color=<%=RCrs("replycolor")%>><%=RCrs("isreply")%>：<br><%=Reply%></font>
	</td></tr></table><br>
	<%
		RCrs.Close
		Set RCrs = nothing
	end if%>
	</td>
  </tr>
</table>
<table cellSpacing="0" cellPadding="0" width="680" align="center" bgColor="#FFFFFF" border="0" height = "<%=distance%>">
<TR><TD height=8> </TD></TR></TABLE>
	<%  
			counts = counts - 1  							'每页显示条数减1
			rs.movenext  									'指向下一条记录
			if rs.eof then exit do  						'已经到底最后一条记录则跳出
	  	loop  												'结束循环
	'End If
	%>  
</td></tr>
<tr><td height=50 valign=top align = center>  
<%  
'显示总留言条数
response.write "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;总计留言"&RS.RecordCount&"条 "  
if page = 1 then  											'到达第一页
	response.write "<font color=darkgray>首页 前页</font>"  
else  														'不是第一页
	'request.ServerVariable("script_name") 获得程序的虚拟路径
	response.write "<a href="&request.ServerVariables("script_name")&"?page=1>首页</a><a href="&request.ServerVariables("script_name")&"?page="&page-1&">前页</a>"  
end if  
if page = allpages then  									'到达最后一页
	response.write "<font color=darkgray> 下页 末页</font>"  
else  														'不是最后一页
	'建立超级链接
	response.write " <a href="&request.ServerVariables("script_name")&"?page="&page+1&">下页</a> <a href="&request.ServerVariables("script_name")&"?page="&allpages&">末页</a>"  
end if  
'显示留言当前的页数信息
response.write " 第"&page&"页 共"&allpages&"页 "  
%>  
  
</td></tr>  
</table>
<table width="760" border=0 cellspacing=0 cellpadding=0 bgcolor="#FFFFFF" align=center class="grayline">
<tr><td>　</td></tr>
<tr><td width=30 height=37 background="IMAGES/down.gif"><a href=#top><img src=images/up.gif border=0></a></td>
<td width="653" height=37 background="IMAGES/down.gif">&nbsp;<a href="index.html">返回主页</a></td>          
<td width=75 height=37 background="IMAGES/down.gif"><a href="admin_login.asp">管理员管理</a></td> 
</tr> 
</table> 

</center>  
</body>
</html>
<%
End If
conn.CLose													'关闭数据库
Set conn = nothing
%>