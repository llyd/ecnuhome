<?php 
@mysql_connect("localhost", "root")				//ѡ�����ݿ�֮ǰ��Ҫ���������ݿ������
or die("���ݿ����������ʧ��");
@mysql_select_db("youyi")					//ѡ�����ݿ�mydb
or die("���ݿⲻ���ڻ򲻿���");
$query1=@mysql_query("set names 'UTF8'");
$query2=@mysql_query("set names 'gb2312'");
?>