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
font:40px '华文行楷', Verdana, Arial, Helvetica, sans-serif;
}
h3
{
text-shadow: 8px 8px 8px #993300;
font:20px '微软雅黑', Verdana, Arial, Helvetica, sans-serif;
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
   $type="食物"; 
     else
     if ($type==2) $type="学习用品"; else
     if ($type==3) $type="电子产品"; else
	   $type="其它";
   $owner=$_POST['owner'];
   $name=$_POST['name'];
   $des=$_POST['des'];
   $price=$_POST['price'];
  if(!$type||!$price||!$owner||!$name||!$des)
    { echo "你没有输入完整的信息.<br />" .
      "请退回并重新输入.";
      exit;
    }
?>
<font size=8 color=FF33FF><h2>
<?php
$query = mysql_query("insert into thing2 values(NULL,'$type','$name','$owner','$price','$des')");
  if($query)
{
   echo "<br>";
   echo "亲，您的物品已经我们发布";
   echo "<br>";
   echo "下面的东西是我们精心挑选的哦！你可能会喜欢哈~~~~~~~！";
   echo "<br>";
   echo "<br>";
   echo "<br>";
}
else
  echo "登记失败！请返回重新登记！好事多磨哦~~~~~~~~！";
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
	 echo "主人："."　".$row1['owner']." "."物品："." ".$row1['name']." "."价格："." ".$row1['price']." "."￥"." "."物品描述："." ".$row1['des']." ";
	 echo "<br>";}
   
	 } else
	 {
	 echo "Sorry,还没有和您类似的东西呢！喵~~~~~";
	  echo "<br>";
	  }
	 mysql_close();?>
     <br>
	 <tr>
	 <td colspan="2"><input type="submit" value="查看"></td>
	 </tr>
	 <td><input type="text" name="name2" maxlength="7" size="7"></td>
	 </tr>
	 <tr>
	 <td colspan="2"><input type="submit" value="小伙伴的主页"></td>
	 </tr>
	 
	 
</body>
</h3>
</centre>
</html>