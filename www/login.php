<?php
session_start();
include ("conn.php");
	
$nametmp=$_POST['email'];
$passtmp=$_POST['password'];
?>
<!doctype html>
<html>
<head>
<meta charset="gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<!--start 登录框的style-->
<style>
a{color: #09d;	text-decoration: none;border: 0;background-color: transparent;}
body,div,q,iframe,form{margin: 0;padding: 0;}
img,fieldset { border: none 0; }
body 
{
word-break: break-all;
word-wrap: break-word;	
line-height:1.5;
background: url(images/loginbg.jpg);
}
body,input,textarea,select,button {	margin: 0;	font-size: 12px;	font-family: Tahoma, SimSun, sans-serif;}
div,p{	font-size:1em;	font-family:inherit;	line-height:inherit;}

#login{
border:1px;
margin-left:40px;
margin-top:110px;
}
#name,#pw{
border:10px;
position:relative;
		 top:-34px;
		 left:88px;
width:145px;
height:22px;
}
#button{
margin-top:0px;
margin-left:-5px;
}
#tishi
{
       position:relative;
	   top:104px;
	   

}
</style>
<!--end 登录框style-->
		<script LANGUAGE="javascript">  
 
</script>  
</head>

<body>
<div id="tishi">
<center><h1>
<?php 
$ii="select * from personal_info where mail='".$nametmp."' and mi='".$passtmp."'";
$query = mysql_query($ii) or die("SQL1语句执行失败");
if($result1 = mysql_fetch_array($query))
{

	$_SESSION['name2'] =$result1['name'];
	echo "登录成功";
	echo "<br>";
        echo "<script>location.href='person.php';</script>"; 
}
else
{
	echo "用户名或密码错误";
	echo "<br>";
	echo "请返回登录页面";
	}


?>

	</h1><center>
	</div>
</body>
</html>