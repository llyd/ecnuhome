<%
'退出管理，返回留言首页
Session("login") = ""						'清除Session 变量login中的值
Session("id") = ""							'清除Session 变量id中的值
Session("user") = ""						'清除Session 变量user中的值
Response.Redirect ("liaotian.asp")				'页面转到留言查看界面
%>
