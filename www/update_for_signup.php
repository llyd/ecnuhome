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
   $sext="��"; else
$sext="Ů";
$select=$_POST['select'];
$select3=$_POST['select3'];
$textfield=$_POST['textfield'];
  
if($password==$repassword)
{
$query = mysql_query("insert into personal_info	values(NULL,'$password','$name','$sext','$select','$mail','$tel','$textfield','$select3')");
}
else
	echo "�����������벻ƥ��";


if($query)
{
   echo "ע��ɹ�";
   echo "<br>";
   echo "ҳ�潫�Զ���ת";
   $_SESSION['name2'] = $name;
   echo "<script>location.href='person.php';</script>";   

}
else
  echo "ע��ʧ�ܣ�������ע��";
mysql_close();
?>