<!--#include file="conn.asp"-->
<%
if request("send")="ok" then												'�û��ύ����

	username=trim(request.form("username"))									'��ȡ�����ݹ������������ݣ�Trim����ȥ���ַ�����ǰ���ͺ����ո�
	usermail=trim(request.form("usermail"))									'��ȡ�����ݹ������û���������
	'�û������������������������û����д
	if username="" or request.form("Comments")="" or request.form("subject") = "" then
		'������ʾ�������ص�ǰһҳ
		response.write "<script>alert('��д���ϲ�������������������룡');history.back();</script>"
		response.end
	end if
	if mailyes=0 then														'����Ϊ����ʱ��������Ƿ�Ϸ�
		'��д�������ַ�в������ַ�"."��"@"���������䳤��С��10 �����50���ǷǷ������ַ
		if Instr(usermail,".")<=0 or Instr(usermail,"@")<=0 or len(usermail)<10 or len(usermail)>50 then
			'������ʾ�����ص�ǰһҳ
			response.write "<script>alert('������ĵ����ʼ���ַ��ʽ����ȷ��������������룡');history.back();</script>"
			response.end
		end if

	end if
	'�������ⳤ�ȴ���Ҫ��ĳ���
	if len(request.form("subject"))>subjectmaxlength then
		'������ʾ�����ص�ǰһҳ
		response.write "<script>alert('��������̫���ˣ��벻Ҫ����"&subjectmaxlength&"���ַ���');history.back();</script>"
		response.end
	end if

	'�������ݳ��ȴ���Ҫ��ĳ���
	if len(request.form("Comments"))>maxlength then
		'������ʾ�����ص�ǰһҳ
		response.write "<script>alert('��������̫���ˣ��벻Ҫ����"&maxlength&"���ַ���');history.back();</script>"
		response.end
	end if
	
	set rs=Server.CreateObject("ADODB.RecordSet")							'�����Ա��浽���ݿ���
	
	sql="select * from note_comment"										'�����ݿ��в�ѯ���Լ�¼
	
	rs.open sql,conn,1,3													'ִ�в�ѯ�������������������rs ��

	rs.Addnew																'���һ����¼
	rs("Name")=Request.Form("username")										'����
	rs("Comment")=Request.Form("comments")									'��������
	rs("Email")=Request.Form("usermail")									'�����ַ
	rs("url")=Request.Form("url")											'��ҳ
	rs("Communication")=Request.Form("communication")						'������ϵ��ʽ
	rs("IP")=Request.serverVariables("REMOTE_ADDR")							'IP ��ַ
	rs("PostDate") = now()													'�����ύʱ��
	rs("Subject") = Request.Form("subject")									'��������
	rs.Update																'�������ݿ�
	rs.close																'�ر�RecordSet ����
	set rs=nothing
	'�ύ�ɹ���������ʾ�������ص����Բ鿴����
	response.write "<script>alert('�����ύ�ɹ���������ȷ�������������б�');location.href='liaotian.asp';</script>"
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
<img border=0 src=images/write.gif> &nbsp;&nbsp;&nbsp;&nbsp;  <a href=liaotian.asp><img border=0 src=images/read.gif title="��Ҫ������"></a>
</td></tr>

<tr><td>
<form action=book_write.asp method=post name="book">
<table cellSpacing="1" borderColorDark="#ffffff" cellPadding="4" width="680" align="center" bgColor="#000000" borderColorLight="#000000" border="0">
  <tr bgColor="#ebebeb">
    <td   width="20%" align=right>����������</td>
    <td ><input type=text name="UserName" size="30" maxlength=16> 
      <font color="#FF0000">*������д</font></td>             
  </tr>
  <tr bgColor="#ebebeb">
    <td   width="20%" align=right>�������⣺</td>
    <td ><input type=text name="subject" size="30"  maxlength=50> 
      <font color="#FF0000">*������д��<%=subjectmaxlength%>�����ڣ�</font></td>             
  </tr>
  <tr bgColor="#ebebeb">
    <td   width="20%" align=right>�������䣺</td>
    <td ><input type=text name="UserMail" size="30"  maxlength=50> 
      <%if mail=0 then%><font color="#FF0000">*������д</font><%end if%></td>             
  </tr>
  <tr bgColor="#ebebeb">
    <td   width="20%" align=right>������վ��</td>
    <td><input type=text value="http://" name="url" size="30"  maxlength=100></td>
  </tr>
  <tr bgColor="#ebebeb">
    <td   width="20%" align=right>������ϵ��ʽ��</td>
    <td><input type=text value="" name="communication" size="30"  maxlength=100> ����QQ��MSN�ȣ�</td>          
  </tr>
  <tr bgColor="#ebebeb">
    <td   width="20%" align=right>�������ݣ�<br><font color=red>��<%=maxlength%>�����ڣ�</font></td>
    <td><textarea name="Comments" rows="7" cols="66" style="overflow:auto;"></textarea></td>
   <tr bgColor="#ebebeb">
    <td colSpan="2"><input type="submit" value="�ύ����" name="Submit"> 
      <input type="reset" value="������д" name="Submit2"><input type=hidden name=send value=ok></td>
  </tr>
</table>
</form>

</table>

<table width="760" border=0 cellspacing=0 cellpadding=0 bgcolor="#FFFFFF" align=center class="grayline">
<tr><td>��</td></tr>
<tr><td width=30 height=37 background="IMAGES/down.gif"><a href=#top><img src=images/up.gif border=0></a></td>
<td height=37 background="IMAGES/down.gif">&nbsp;<a href="index.html">������ҳ</a></td>     
<td width=30 height=37 background="IMAGES/down.gif"><a href=admin_login.asp title="�������Ա�"><img src=images/admin.gif border=0></a></td> 
</tr> 
</table> 

</center>
</body>
</html>


<%
conn.CLose
Set conn = nothing
%>