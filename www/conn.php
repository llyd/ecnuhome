<?php 
@mysql_connect("localhost", "root")				//选择数据库之前需要先连接数据库服务器
or die("数据库服务器连接失败");
@mysql_select_db("youyi")					//选择数据库mydb
or die("数据库不存在或不可用");
$query1=@mysql_query("set names 'UTF8'");
$query2=@mysql_query("set names 'gb2312'");
?>