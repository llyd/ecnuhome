<!--#include file = "conn.asp"-->
<%
'function lleft(content,lef)
'	for le=1 to len(content)
'		if asc(mid(content,le,1))<0 then
'			lef=lef-2
'		else
'			lef=lef-1
'		end if
'		if lef<=0 then exit for
'	next
'	lleft=left(content,le)
'end function
%>
<HTML>
 <HEAD>
  <TITLE><%=sitename%></TITLE>
  <link rel="stylesheet" href="book.css" type="text/css">
  <script language="JavaScript">
	function CheckAll(form)               									
	{
  		for (var i=0;i<form.elements.length;i++)  							
    	{
   	 		var e = form.elements[i];											
        	if (e.name != 'chkall')       e.checked = form.chkall.checked; 		
   		}
  	}
  </script>
   </HEAD>
 <body background=images/bg.gif topmargin="0" leftmargin="0">
 <center>
  <table width="760" border=0 cellspacing=0 cellpadding=0 bgcolor="#FFFFFF" align=center class="grayline">
   <tr><td><img border="0" src="images/TOPS.GIF" width=760></td></tr>
  </table>  
  </center>
  <table width="760" border=0 cellspacing=0 cellpadding=0 align=center bgcolor="#FFFFFF" class="grayline">
<tr><td align=center height=50>
    <a href=admin_main.asp><img border=0 src=images/admin_home.gif title="管理首页"></a> &nbsp;&nbsp;&nbsp;                                                                                  
    <a href=admin_set.asp><img border=0 src=images/admin_setup.gif title="管理选项设置"></a> &nbsp;&nbsp;&nbsp;                                                                                  
    <a href=admin_logout.asp><img border=0 src=images/loginout.gif title="管理结束后，一定要点击这里"></a>
   </td></tr>   
   <%
   action=request.QueryString("action")

   
   if action="main" or action = "" then						'管理首页
   %>

   <tr><td align=center>
   <table width="630" border="1" cellpadding="3" bordercolor="#333333" style="border-collapse: collapse">
	  <form name=bookform action=admin_main.asp method=post>
	   <tr>	
	    <td align=center width=18>选</td>
	    <td align=center width=41 height=15>姓名</td> 
	    <td align=center width=150>主题</td>
	    <td align=center width=155>内容（编辑与回复）</td>
	    <td align=center width=128>日期</td>
	    <td align=center width=74>状态</td>
	   </tr>
       <%
		dim rs,msg_per_page									'定义变量
		dim sql
		msg_per_page = 10						 			'每页显示记录数
		Set rs=Server.CreateObject("ADODB.Recordset")		'创建RecordSet 对象
		sql="select * from note_comment order by id desc"	'从数据库中查询所有记录并按照id 降序排列

		rs.pagesize = msg_per_page 							'每页显示记录数
		rs.open sql,conn,1,3 								'执行查询操作

		if rs.eof and rs.bof then							'数据库中不存在记录
			response.write "<tr><td colspan=6 align=center><BR>暂时没有留言<BR><BR></td></tr>"
		end if

		if not (rs.eof and rs.bof) then 					'检测记录集是否为空
			totalrec = RS.RecordCount 						'总记录条数
			if rs.recordcount mod msg_per_page = 0 then 	'计算总页数,recordcount:数据的总记录数
				n = rs.recordcount\msg_per_page 			'n:总页数
			else 
				n = rs.recordcount\msg_per_page+1 			'n:总页数
			end if 

			currentpage = request("page") 					'currentpage:当前页
			If currentpage <> "" then						'currentpage 值存在
				currentpage = cint(currentpage)				'cint函数将currentpage 转换为整数
				if currentpage < 1 then 					'currentpage 值小于1
					currentpage = 1
				end if 
				if err.number <> 0 then 					'产生某种错误
					err.clear								'清除错误信息
					currentpage = 1
				end if
			else											'currentpage 值为空
				currentpage = 1
			End if 
			'当前页大于总页数
			if currentpage*msg_per_page > totalrec and not((currentpage-1)*msg_per_page < totalrec)then 
				currentPage=1
			end if
			rs.absolutepage = currentpage 					'absolutepage：设置指针指向某页开头
			rowcount = rs.pagesize		 					'pagesize：设置每一页的数据记录数
			dim i
			dim k

			Do while not rs.eof and rowcount>0				'循环显示所有的记录
				content=rs("Comment")						'留言内容
				subject = rs("Subject")						'留言主题
				reply=rs("reply")							'回复内容
				UserName=rs("Name")							'留言者姓名
				'使用Response 对象的write 方法在网页上显示复选框、留言者姓名、留言主题、留言内容、留言日期和留言状态
				Response.write "<tr><td align=center><input type='checkbox' value='"&rs("ID")&"' name=id>"				
				Response.write "</td><td>"&UserName&"</td><td>"
				'Response.write lleft(server.htmlencode(subject),50)
				Response.write subject
				'建立到管理员回复留言的超级链接
				Response.write "</td><td><a href='admin_main.asp?action=reply&id="&rs("ID")&"'>"
				'Response.write lleft(server.htmlencode(content),50)
				Response.write content
				Response.write "</a></td><td  align=center>"&rs("Postdate")&"</td><td  align=center>"
				if Isnull(Reply) then						'没有留言回复
					response.write "<font color=red>新留言</font>"
				else										'管理员已经回复留言
					response.write "已回复"
				end if
				rowcount=rowcount-1							'显示一条记录后，将每页未显示的记录数减1
				rs.movenext									'指向下一条记录
			loop
		end if

		rs.close											'关闭RecordSet 对象
		set rs=nothing
		%>
		<tr><td colspan=6 width="616"><input type="checkbox" name=chkall onclick="CheckAll(this.form)"> 全选 
			<input type="submit" name="action" value="删除" onclick="{if(confirm('该操作不可恢复！\n\n确实删除选定的留言？')){this.document.Prodlist.submit();return true;}return false;}"> 	
		</td></tr></form></table>
		</td></tr>
		<tr><td>
		<%
		call listPages()									'调用listPages 过程，显示记录数目信息、页数信息
		%>
		</td></tr>
	<%end if
	if request("action")="删除" then						'删除操作	
		delid=replace(request.form("id"),"'","")					'获得要删除记录的id，Replace 过程将获得的id 字符串中的"'"用空字符""替换
		call delfeedback()
	end if

	if request("action")="reply" then
		id=request("id")
		call detailfeedback()
	end if	
'end if

'分页
sub listPages() 
	if n <= 1 then exit sub 
%>
共<%=totalrec%>条留言         
<%if currentpage = 1 then%>
<font color=darkgray>首页 前页</font>        
<%else%>         
<a href="<%=request.ServerVariables("script_name")%>?page=1">        
首页</font></a> <a href="<%=request.ServerVariables("script_name")%>?page=<%=currentpage-1%>">前页</a>        
<%end if%>        
<%if currentpage = n then%>         
<font color=darkgray >下页 末页</font>        
<%else%>         
<a href="<%=request.ServerVariables("script_name")%>?page=<%=currentpage+1%>">下页</a> <a href="<%=request.ServerVariables("script_name")%>?page=<%=n%>">末页</a>        
<%end if%>        
  第<%=currentpage%>页 共<%=n%>页        
<%
end sub

sub delfeedback()											'留言删除
	if delid="" or isnull(delid) then						'要删除的记录id 为空
		'则给出提示
		response.write "<script>alert('操作失败，没有选择合适参数，请单击“确定”返回！');</script>"		
		response.redirect "admin_main.asp"					'返回到留言管理界面
		response.end

	else													'id 存在
		'执行数据库中的删除操作，删除数据库中id 列的值在delid数组中的记录
		conn.Execute("delete * from note_comment where ID in ("&delid&")")
		'删除成功，给出提示
		response.write "<script>alert('留言删除成功，请单击“确定”返回！');</script>"		
		response.redirect "admin_main.asp"					'返回到留言管理界面
		response.end
	end if
end sub

sub detailfeedback()										'留言回复
	if id="" then											'要回复的留言id 为空
		'给出提示
		response.write "<script>alert('无此留言编号，请单击“确定”返回！');</script>"
		response.redirect "admin_main.asp"					'返回到留言管理界面
		response.end
	end if

	'修改留言资料
	if request("send")="ok" then							'提交留言回复内容
		set rs=server.createobject("adodb.recordset")		'创建RecordSet 对象
		sql = "select * from note_comment where ID="&id		'从数据库中查询id 列的值为id 的记录
		rs.open sql,conn,1,3								'执行查询，并将结果保存在rs 中

		if not (rs.eof and rs.bof) then						'存在满足条件的记录
			rs("comment")=request.form("comments")			'留言内容
			'回复的留言内容，replace 函数是用<BR> 替换回复内容中的vbCRLF 字符
			rs("Reply")=replace(request.form("Reply"),vbCRLF,"<BR>")
			rs("ReplyDate") = Now()							'回复时间			
			rs("ReplyName") = Session("user")				'回复留言的管理员姓名
			rs.update										'更新数据库
		end if
		rs.close											'关闭RecordSet 对象
		'修改或回复成功，给出提示
		response.write "<script>alert('留言已经修改或回复成功，请单击“确定”返回！');</script>"
		response.redirect "admin_main.asp"					'返回到留言管理界面
		response.end
	end if

	'显示详细资料
	set rs = server.createobject("adodb.recordset")
	sql = "select * from note_comment where ID="&id
	rs.open sql,conn,1,1

	if rs.eof and rs.bof then 
		response.write "<script>alert('无此留言，请单击“确定”返回！');</script>"
		response.redirect "admin_main.asp"
		response.end
	end if

	if not (rs.eof and rs.bof) then 
		Comments=replace(rs("Comment"),"<BR>",vbCRLF)
		if rs("reply")<>"" then 
			reply=replace(rs("Reply"),"<BR>",vbCRLF) 
		else 
			reply=""  
		end if
		%>
		<tr><td align = center>
   <table width="600" border="1" cellpadding="3" bordercolor="#333333" style="border-collapse: collapse;">
		 <form name="reply" method="post" action='admin_main.asp?action=reply&id=<%=id%>'>
		 <tr><TD align="right" width=20% height=15>留言者IP地址</TD><td><%=rs("IP")%></td></tr>
		 <tr><TD align="right" width=20%>留言日期</TD><td><%=rs("PostDate")%></td></tr>		 
		 <tr><TD align="right" width=20%>留言人姓名</TD><td><%=rs("Name")%>&nbsp;</td></tr>
		<tr><TD align="right" width=20%>留言邮箱</TD><td><%=rs("EMail")%>&nbsp;</td></tr>
		<tr><TD align="right" width=20%>留言网址</TD><td><%=rs("url")%>&nbsp;</td></tr>
		<tr><TD align="right" width=20%>其它联系方式</TD><td><%=rs("communication")%>&nbsp;</td></tr>
		<tr><TD align="right" width=20%>留言主题</TD><td><%=rs("subject")%>&nbsp;</td></tr>
		 <tr><TD align="right" width=20%>内容</TD><td><textarea style="overflow:auto" name="comments" cols="60" rows="8"><%=Comments%></textarea></td></tr>
		 <tr><TD align="right" width=20% valign=top>回复内容</TD><td><textarea style="overflow:auto" name="Reply" cols="60" rows="8"><%=reply%></textarea>&nbsp;</td></tr>

		<TR><TD align="right" width=20%>&nbsp;<INPUT TYPE="hidden" name=send value=ok></TD><TD>
		<input type="submit" name="action" value=" 提 交 "></TD></TR>
		</form></TABLE></td><tr>

	<%
	End If
	rs.Close
	Set rs = nothing

End Sub
%>
<table width="760" border=0 cellspacing=0 cellpadding=0 bgcolor="#FFFFFF" align=center class="grayline">
<tr><td>　</td></tr>
<tr><td width=30 height=37 background="IMAGES/down.gif"><a href=#top><img src=images/up.gif border=0></a></td>
<td height=37 background="IMAGES/down.gif">&nbsp;<a href="index.html">返回主页</a></td>                    
<td width=30 height=37 background="IMAGES/down.gif"><a href=admin_login.asp title="管理留言本"><img src=images/admin.gif border=0></a></td> 
</tr> 
</table> 
</body>
<%
conn.CLose
Set conn = nothing
%>