<!--#include file = "conn.asp"-->
<%
if request.QueryString("act")="login" then				'����Ա��½
	user = Request.Form("username")						'��ȡ�ӱ����ݹ������û�������
   	pass = Request.Form("password")						'��ȡ�ӱ����ݹ�������������
   	Set NArs=Server.CreateObject("Adodb.RecordSet")		'����RecordSet ����
   	'�����ݿ��в���Admin �е�ֵΪuser��pwd �е�ֵΪpass �ļ�¼
    sql="Select * from note_admin where Admin='"&user&"' and pwd='"&pass&"'"
    'ִ�в�ѯ�������������������NArs ��
    NArs.open sql,conn,1,1
    If not(NArs.bof and NArs.eof) Then                  '�������������ļ�¼�����¼�ɹ�
    	Session("login") = "ok"							'��Session ����login ��Ϊok
    	Session("user") = NArs("Admin")					'����ǰ��¼����Ա���û�������Session ����user 
    	Session("id") = NArs("id")						'����ǰ��¼����Ա��id ����Session ����id
    	Response.Redirect "admin_main.asp?action=main"	'ҳ��ת�����Թ������
    Else												'���������������ļ�¼��������ʾ�����ص�ǰһҳ
    	Response.Write("<script>alert('����Ա�û����ƻ�������������������������룡');history.back()</script>")
    	Response.End
    End If
    NArs.Close											'�ر�RecordSet ����
    Set NArs= nothing
End If
%>

<HTML><HEAD>
<TITLE><%=sitename%></TITLE>
<title>����Ա��¼</title>
<link rel="stylesheet" href="book.css" type="text/css">
<style type="text/css">
body {
	background-image: url(images/main_bg.jpg);
}
</style>
<script language="VBScript">
function check()							'����û����������Ƿ�����
	If booklogin.username.value="" Then		'�û����ı����ֵΪ��
		alert("�û�������Ϊ��!")			'������ʾ
		booklogin.username.focus()			'���û����ı�����Ϊ���뽹��
		return false
	End If
	If booklogin.password.value="" Then		'�����ı����ֵΪ��
		alert("���벻��Ϊ��!")				'������ʾ
		booklogin.password.focus()			'�������ı�����Ϊ����Ľ���
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
	<th colspan = 2>����Ա��¼</th>
<tr><td align=center>�û���</td><td><input type="text" name="username" value="" title="����д�û���"></td></tr>
<tr><td align=center>��&nbsp;&nbsp;��</td><td><input type="password" name="password" value="" title="����д��½����"></td></tr>
<tr><td colspan=2 align=center><input type="submit" value="�����½"><input type="hidden" name="login" value="check"></td></tr>
</table>
</form>

<table width="760" border=0 cellspacing=0 cellpadding=0 bgcolor="#FFFFFF" align=center class="grayline">
<tr><td>��</td></tr>
<tr><td width=30 height=37 background="IMAGES/down.gif"><a href=#top><img src=images/up.gif border=0></a></td>
<td height=37 background="IMAGES/down.gif">&nbsp;&nbsp;<a href="index.html">������ҳ</a></td>       
<td width=30 height=37 background="IMAGES/down.gif"><a href=admin_login.asp title="�������Ա�"><img src=images/admin.gif border=0></a></td> 
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















