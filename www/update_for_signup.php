<?php
session_start(); 
include ("conn.php");
$mail= $_POST['email'];
$password=$_POST['password'];
$repassword = $_POST['repassword'];
$name=$_POST['name'];
$tel = $_POST['tel'];
$sext = $_POST['radio'];
if ($sext==1)
   $sext="男"; else
$sext="女";
$select=$_POST['select'];
$select3=$_POST['select3'];
$textfield=$_POST['textfield'];
  
if($password==$repassword)
{
$query = mysql_query("insert into personal_info	values(NULL,'$password','$name','$sext','$select','$mail','$tel','$textfield','$select3')");
}
else
	echo "两次密码输入不匹配";


if($query)
{
   echo "注册成功";
   echo "<br>";
   echo "页面将自动跳转";
   $_SESSION['name2'] = $name;
   echo "<script>location.href='person.php';</script>";   

}
else
  echo "注册失败，请重新注册";
mysql_close();
?>