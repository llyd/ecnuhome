<?php
include ("conn.php");
session_start(); 
?>
<html>
<center>
<style>
h2
{
text-shadow: 8px 8px 8px #990099;
font:40px '�����п�', Verdana, Arial, Helvetica, sans-serif;
}
h3
{
text-shadow: 8px 8px 8px #993300;
font:20px '΢���ź�', Verdana, Arial, Helvetica, sans-serif;
}
</style>
<head>
      <title>New thing</title>
</head>
<body background ="image/bg.jpg">
<body>
<form action="person2.php" method="post">
<?php
   $type=$_POST['type'];
   if ($type==1)
   $type="ʳ��"; 
     else
     if ($type==2) $type="ѧϰ��Ʒ"; else
     if ($type==3) $type="���Ӳ�Ʒ"; else
	   $type="����";
   $owner=$_POST['owner'];
   $name=$_POST['name'];
   $des=$_POST['des'];
   $price=$_POST['price'];
  if(!$type||!$price||!$owner||!$name||!$des)
    { echo "��û��������������Ϣ.<br />" .
      "���˻ز���������.";
      exit;
    }
?>
<font size=8 color=FF33FF><h2>
<?php
$query = mysql_query("insert into thing2 values(NULL,'$type','$name','$owner','$price','$des')");
  if($query)
{
   echo "<br>";
   echo "�ף�������Ʒ�Ѿ����Ƿ���";
   echo "<br>";
   echo "����Ķ��������Ǿ�����ѡ��Ŷ������ܻ�ϲ����~~~~~~~��";
   echo "<br>";
   echo "<br>";
   echo "<br>";
}
else
  echo "�Ǽ�ʧ�ܣ��뷵�����µǼǣ����¶�ĥŶ~~~~~~~~��";
  $query=mysql_query("select * from thing2 where type like '%$type%'and owner not like '%$owner%'"); 
 ?></h2>
 </font>
 <h3>
 <?php
  $query1=mysql_query("select * from thing2 where type like '%$type%'and owner not like '%$owner%'"); 
  $row8=mysql_fetch_array($query1);
  if ($row8)
  {
   while ($row1=mysql_fetch_array($query))
    {
	 echo "���ˣ�"."��".$row1['owner']." "."��Ʒ��"." ".$row1['name']." "."�۸�"." ".$row1['price']." "."��"." "."��Ʒ������"." ".$row1['des']." ";
	 echo "<br>";}
   
	 } else
	 {
	 echo "Sorry,��û�к������ƵĶ����أ���~~~~~";
	  echo "<br>";
	  }
	 mysql_close();?>
     <br>
	 <tr>
	 <td colspan="2"><input type="submit" value="�鿴"></td>
	 </tr>
	 <td><input type="text" name="name2" maxlength="7" size="7"></td>
	 </tr>
	 <tr>
	 <td colspan="2"><input type="submit" value="С������ҳ"></td>
	 </tr>
	 
	 
</body>
</h3>
</centre>
</html>