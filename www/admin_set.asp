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
<a href=admin_main.asp><img border=0 src=images/admin_home.gif title="������ҳ"></a> &nbsp;&nbsp;&nbsp;       
<a href=admin_set.asp?action=setup><img border=0 src=images/admin_setup.gif title="����ѡ������"></a> &nbsp;&nbsp;&nbsp;       
<a href=admin_logout.asp?action=loginout><img border=0 src=images/loginout.gif title="���������һ��Ҫ�������"></a>
</td></tr>
<tr><td align=center>
<br>
                
</td></tr>
<tr><td>
  

</center>
<center>
<table width="594" border="1" cellpadding="3" bordercolor="#333333" style="border-collapse: collapse">
	<form name=book action=admin_set.asp?action=setup method=post>
	<tr><td  width=141 align=right>��վ���� &nbsp; &nbsp; </td><td width="429"><input type=text name=sitename value="<%=sitename%>" maxlength=20></td></tr>        
	<tr><td  width=141 align=right>����Ա���� &nbsp; &nbsp; </td><td width="429"><input type=text name=admin value="<%=rs("admin")%>" maxlength=16></td></tr>        
	<tr><td  width=141 align=right>����Ա���� &nbsp; &nbsp; </td><td width="429"><input type=password name=pwd value="" maxlength=16> [�����޸����룬������]</td></tr>        
	<tr><td  width=141 align=right>�������ⳤ�� &nbsp; &nbsp; </td><td width="429"><input type=text name=subjectmaxlength value="<%=subjectmaxlength%>" maxlength=3> [�������������ַ���������20]</td></tr>        	
	<tr><td  width=141 align=right>�������ݳ��� &nbsp; &nbsp; </td><td width="429"><input type=text name=maxlength value="<%=maxlength%>" maxlength=3> [�������ݵ�����ַ���������200]</td></tr>        
	<tr><td  width=141 align=right>ÿҳ�������� &nbsp; &nbsp; </td><td width="429"><input type=text name=counts value="<%=counts%>" maxlength=2>  [�Ƽ�10]</td></tr>        
	<tr><td  width=141 align=right>���Ա���� &nbsp; &nbsp; </td><td width="429"><input type=text name=distance value="<%=distance%>" maxlength=2> [���ʵļ���ʹ��������ۣ��Ƽ�10]</td></tr>        
	<tr><td  width=141 align=right>����Ա�ظ���ʾ &nbsp; &nbsp; </td><td width="429"><input type=text name=isreply value="<%=rs("isreply")%>" maxlength=10> [���磺���ͷ��ظ���]</td></tr>        
	<tr><td  width=141 align=right>����Ա�ظ���ɫ &nbsp; &nbsp; </td><td width="429"><input type=text name=replycolor value="<%=rs("replycolor")%>" maxlength=10> [��ʹ��Ӣ�ĵ��ʻ�16���������磺red��#CCFF00��]</td></tr>        
	<tr><td colspan=2 width="580"><INPUT name="save" TYPE="hidden" value="ok"><INPUT TYPE="submit" value="��������"></td></tr>
	</form>
</table>
  </center>
</td></tr>
</table> 
<table width="760" border=0 cellspacing=0 cellpadding=0 bgcolor="#FFFFFF" align=center class="grayline">
<tr><td>��</td></tr>
<tr><td width=30 height=37 background="IMAGES/down.gif"><a href=#top><img src=images/up.gif border=0></a></td>
<td height=37 background="IMAGES/down.gif">&nbsp;&nbsp;<a href="index.html">������ҳ</a></td>          
<td width=30 height=37 background="IMAGES/down.gif"><a href=admin_login.asp title="�������Ա�"><img src=images/admin.gif border=0></a></td> 
</tr> 
</table> 
</body>

</html>
<%
		rs.close
		set rs=nothing

	Else
		response.write "<script>alert('��ǰû�е�¼�û�');history.back();</script>"
		response.end
	End If

End if

Sub setup()
	if request("save")="ok" then							'��������
		Set NArs=Server.CreateObject("ADODB.Recordset")		'����RecordSet ����
		'�����ݿ�note_admin�в�ѯid �е�ֵΪSession("id") �ļ�¼����������NArs ��
		NArs.open "select * from note_admin where id="&Session("id"),conn,1,3														
		Set WBrs = Server.CreateObject("ADODB.RecordSet")	'����RecordSet ����
		'�����ݿ�web �в�ѯ���м�¼����������WBrs ��
		WBrs.Open "Select * from web",conn,1,3

		'������д������
		if trim(request.form("sitename"))="" or trim(request.form("admin"))="" or trim(request.form("maxlength"))="" or trim(request.form("counts"))="" or trim(request.form("replycolor"))="" or trim(request.form("isreply"))="" or trim(request.form("distance"))="" then
			'������ʾ�������ص�ǰһҳ
			response.write "<script>alert('������д���������д�������������ύ��');history.back();</script>"
			response.end
		end if
		'���������������󳤶ȡ�����������󳤶ȡ�ÿҳ�������ͱ���಻������
		if (not isNumeric(request.form("subjectmaxlength"))) or (not isNumeric(request.form("maxlength"))) or (not isNumeric(request.form("counts"))) or (not isNumeric(request.form("distance"))) then
			'������ʾ�������ص�ǰһҳ
			response.write "<script>alert('������д���������д�������������ύ��');history.back();</script>"
			response.end
		end if


		WBrs("sitename")=Request.Form("sitename")									'վ������
		NArs("admin")=Request.Form("admin")											'����Ա����
		if trim(request("password"))<>"" then 	
			NArs("pwd")=trim(Request.Form("pwd"))									'����
		End If
		WBrs("SubjectMaxLength") = Request.Form("subjectmaxlength")					'����������󳤶�
		WBrs("maxlength")=Request.Form("maxlength")									'����������󳤶�
		WBrs("counts")=Request.Form("counts")										'ÿҳ������
		WBrs("mail")=Request.Form("mail")											'�Ƿ��������
		NArs("isreply")=trim(Request.Form("isreply"))								'�ظ���ʾ
		NArs("replycolor")=trim(Request.Form("replycolor"))							'�ظ���ɫ
		WBrs("distance")=Request.Form("distance")									'�����
		NArs.update																	'�������ݿ�
		WBrs.update																	'�������ݿ�
		
		NArs.Close																	'�ر�RecordSet ����
		Set NArs = nothing
		WBrs.Close																	'�ر�RecordSet ����
		Set WBrs = nothing
		'����ɹ���������ʾ�������ص�����ѡ�����
		response.write "<script>alert('���ύ�������ѱ��档');location.href='admin_set.asp';</script>"
		response.end
	End If	
End Sub

conn.CLose																			'�ر����ݿ�����
Set conn = nothing
%>