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
    <a href=admin_main.asp><img border=0 src=images/admin_home.gif title="������ҳ"></a> &nbsp;&nbsp;&nbsp;                                                                                  
    <a href=admin_set.asp><img border=0 src=images/admin_setup.gif title="����ѡ������"></a> &nbsp;&nbsp;&nbsp;                                                                                  
    <a href=admin_logout.asp><img border=0 src=images/loginout.gif title="���������һ��Ҫ�������"></a>
   </td></tr>   
   <%
   action=request.QueryString("action")

   
   if action="main" or action = "" then						'������ҳ
   %>

   <tr><td align=center>
   <table width="630" border="1" cellpadding="3" bordercolor="#333333" style="border-collapse: collapse">
	  <form name=bookform action=admin_main.asp method=post>
	   <tr>	
	    <td align=center width=18>ѡ</td>
	    <td align=center width=41 height=15>����</td> 
	    <td align=center width=150>����</td>
	    <td align=center width=155>���ݣ��༭��ظ���</td>
	    <td align=center width=128>����</td>
	    <td align=center width=74>״̬</td>
	   </tr>
       <%
		dim rs,msg_per_page									'�������
		dim sql
		msg_per_page = 10						 			'ÿҳ��ʾ��¼��
		Set rs=Server.CreateObject("ADODB.Recordset")		'����RecordSet ����
		sql="select * from note_comment order by id desc"	'�����ݿ��в�ѯ���м�¼������id ��������

		rs.pagesize = msg_per_page 							'ÿҳ��ʾ��¼��
		rs.open sql,conn,1,3 								'ִ�в�ѯ����

		if rs.eof and rs.bof then							'���ݿ��в����ڼ�¼
			response.write "<tr><td colspan=6 align=center><BR>��ʱû������<BR><BR></td></tr>"
		end if

		if not (rs.eof and rs.bof) then 					'����¼���Ƿ�Ϊ��
			totalrec = RS.RecordCount 						'�ܼ�¼����
			if rs.recordcount mod msg_per_page = 0 then 	'������ҳ��,recordcount:���ݵ��ܼ�¼��
				n = rs.recordcount\msg_per_page 			'n:��ҳ��
			else 
				n = rs.recordcount\msg_per_page+1 			'n:��ҳ��
			end if 

			currentpage = request("page") 					'currentpage:��ǰҳ
			If currentpage <> "" then						'currentpage ֵ����
				currentpage = cint(currentpage)				'cint������currentpage ת��Ϊ����
				if currentpage < 1 then 					'currentpage ֵС��1
					currentpage = 1
				end if 
				if err.number <> 0 then 					'����ĳ�ִ���
					err.clear								'���������Ϣ
					currentpage = 1
				end if
			else											'currentpage ֵΪ��
				currentpage = 1
			End if 
			'��ǰҳ������ҳ��
			if currentpage*msg_per_page > totalrec and not((currentpage-1)*msg_per_page < totalrec)then 
				currentPage=1
			end if
			rs.absolutepage = currentpage 					'absolutepage������ָ��ָ��ĳҳ��ͷ
			rowcount = rs.pagesize		 					'pagesize������ÿһҳ�����ݼ�¼��
			dim i
			dim k

			Do while not rs.eof and rowcount>0				'ѭ����ʾ���еļ�¼
				content=rs("Comment")						'��������
				subject = rs("Subject")						'��������
				reply=rs("reply")							'�ظ�����
				UserName=rs("Name")							'����������
				'ʹ��Response �����write ��������ҳ����ʾ��ѡ���������������������⡢�������ݡ��������ں�����״̬
				Response.write "<tr><td align=center><input type='checkbox' value='"&rs("ID")&"' name=id>"				
				Response.write "</td><td>"&UserName&"</td><td>"
				'Response.write lleft(server.htmlencode(subject),50)
				Response.write subject
				'����������Ա�ظ����Եĳ�������
				Response.write "</td><td><a href='admin_main.asp?action=reply&id="&rs("ID")&"'>"
				'Response.write lleft(server.htmlencode(content),50)
				Response.write content
				Response.write "</a></td><td  align=center>"&rs("Postdate")&"</td><td  align=center>"
				if Isnull(Reply) then						'û�����Իظ�
					response.write "<font color=red>������</font>"
				else										'����Ա�Ѿ��ظ�����
					response.write "�ѻظ�"
				end if
				rowcount=rowcount-1							'��ʾһ����¼�󣬽�ÿҳδ��ʾ�ļ�¼����1
				rs.movenext									'ָ����һ����¼
			loop
		end if

		rs.close											'�ر�RecordSet ����
		set rs=nothing
		%>
		<tr><td colspan=6 width="616"><input type="checkbox" name=chkall onclick="CheckAll(this.form)"> ȫѡ 
			<input type="submit" name="action" value="ɾ��" onclick="{if(confirm('�ò������ɻָ���\n\nȷʵɾ��ѡ�������ԣ�')){this.document.Prodlist.submit();return true;}return false;}"> 	
		</td></tr></form></table>
		</td></tr>
		<tr><td>
		<%
		call listPages()									'����listPages ���̣���ʾ��¼��Ŀ��Ϣ��ҳ����Ϣ
		%>
		</td></tr>
	<%end if
	if request("action")="ɾ��" then						'ɾ������	
		delid=replace(request.form("id"),"'","")					'���Ҫɾ����¼��id��Replace ���̽���õ�id �ַ����е�"'"�ÿ��ַ�""�滻
		call delfeedback()
	end if

	if request("action")="reply" then
		id=request("id")
		call detailfeedback()
	end if	
'end if

'��ҳ
sub listPages() 
	if n <= 1 then exit sub 
%>
��<%=totalrec%>������         
<%if currentpage = 1 then%>
<font color=darkgray>��ҳ ǰҳ</font>        
<%else%>         
<a href="<%=request.ServerVariables("script_name")%>?page=1">        
��ҳ</font></a> <a href="<%=request.ServerVariables("script_name")%>?page=<%=currentpage-1%>">ǰҳ</a>        
<%end if%>        
<%if currentpage = n then%>         
<font color=darkgray >��ҳ ĩҳ</font>        
<%else%>         
<a href="<%=request.ServerVariables("script_name")%>?page=<%=currentpage+1%>">��ҳ</a> <a href="<%=request.ServerVariables("script_name")%>?page=<%=n%>">ĩҳ</a>        
<%end if%>        
  ��<%=currentpage%>ҳ ��<%=n%>ҳ        
<%
end sub

sub delfeedback()											'����ɾ��
	if delid="" or isnull(delid) then						'Ҫɾ���ļ�¼id Ϊ��
		'�������ʾ
		response.write "<script>alert('����ʧ�ܣ�û��ѡ����ʲ������뵥����ȷ�������أ�');</script>"		
		response.redirect "admin_main.asp"					'���ص����Թ������
		response.end

	else													'id ����
		'ִ�����ݿ��е�ɾ��������ɾ�����ݿ���id �е�ֵ��delid�����еļ�¼
		conn.Execute("delete * from note_comment where ID in ("&delid&")")
		'ɾ���ɹ���������ʾ
		response.write "<script>alert('����ɾ���ɹ����뵥����ȷ�������أ�');</script>"		
		response.redirect "admin_main.asp"					'���ص����Թ������
		response.end
	end if
end sub

sub detailfeedback()										'���Իظ�
	if id="" then											'Ҫ�ظ�������id Ϊ��
		'������ʾ
		response.write "<script>alert('�޴����Ա�ţ��뵥����ȷ�������أ�');</script>"
		response.redirect "admin_main.asp"					'���ص����Թ������
		response.end
	end if

	'�޸���������
	if request("send")="ok" then							'�ύ���Իظ�����
		set rs=server.createobject("adodb.recordset")		'����RecordSet ����
		sql = "select * from note_comment where ID="&id		'�����ݿ��в�ѯid �е�ֵΪid �ļ�¼
		rs.open sql,conn,1,3								'ִ�в�ѯ���������������rs ��

		if not (rs.eof and rs.bof) then						'�������������ļ�¼
			rs("comment")=request.form("comments")			'��������
			'�ظ����������ݣ�replace ��������<BR> �滻�ظ������е�vbCRLF �ַ�
			rs("Reply")=replace(request.form("Reply"),vbCRLF,"<BR>")
			rs("ReplyDate") = Now()							'�ظ�ʱ��			
			rs("ReplyName") = Session("user")				'�ظ����ԵĹ���Ա����
			rs.update										'�������ݿ�
		end if
		rs.close											'�ر�RecordSet ����
		'�޸Ļ�ظ��ɹ���������ʾ
		response.write "<script>alert('�����Ѿ��޸Ļ�ظ��ɹ����뵥����ȷ�������أ�');</script>"
		response.redirect "admin_main.asp"					'���ص����Թ������
		response.end
	end if

	'��ʾ��ϸ����
	set rs = server.createobject("adodb.recordset")
	sql = "select * from note_comment where ID="&id
	rs.open sql,conn,1,1

	if rs.eof and rs.bof then 
		response.write "<script>alert('�޴����ԣ��뵥����ȷ�������أ�');</script>"
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
		 <tr><TD align="right" width=20% height=15>������IP��ַ</TD><td><%=rs("IP")%></td></tr>
		 <tr><TD align="right" width=20%>��������</TD><td><%=rs("PostDate")%></td></tr>		 
		 <tr><TD align="right" width=20%>����������</TD><td><%=rs("Name")%>&nbsp;</td></tr>
		<tr><TD align="right" width=20%>��������</TD><td><%=rs("EMail")%>&nbsp;</td></tr>
		<tr><TD align="right" width=20%>������ַ</TD><td><%=rs("url")%>&nbsp;</td></tr>
		<tr><TD align="right" width=20%>������ϵ��ʽ</TD><td><%=rs("communication")%>&nbsp;</td></tr>
		<tr><TD align="right" width=20%>��������</TD><td><%=rs("subject")%>&nbsp;</td></tr>
		 <tr><TD align="right" width=20%>����</TD><td><textarea style="overflow:auto" name="comments" cols="60" rows="8"><%=Comments%></textarea></td></tr>
		 <tr><TD align="right" width=20% valign=top>�ظ�����</TD><td><textarea style="overflow:auto" name="Reply" cols="60" rows="8"><%=reply%></textarea>&nbsp;</td></tr>

		<TR><TD align="right" width=20%>&nbsp;<INPUT TYPE="hidden" name=send value=ok></TD><TD>
		<input type="submit" name="action" value=" �� �� "></TD></TR>
		</form></TABLE></td><tr>

	<%
	End If
	rs.Close
	Set rs = nothing

End Sub
%>
<table width="760" border=0 cellspacing=0 cellpadding=0 bgcolor="#FFFFFF" align=center class="grayline">
<tr><td>��</td></tr>
<tr><td width=30 height=37 background="IMAGES/down.gif"><a href=#top><img src=images/up.gif border=0></a></td>
<td height=37 background="IMAGES/down.gif">&nbsp;<a href="index.html">������ҳ</a></td>                    
<td width=30 height=37 background="IMAGES/down.gif"><a href=admin_login.asp title="�������Ա�"><img src=images/admin.gif border=0></a></td> 
</tr> 
</table> 
</body>
<%
conn.CLose
Set conn = nothing
%>