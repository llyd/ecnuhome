<html>
<center>
<form action=newthing.php>
<?php

echo"<!doctype html>"
  . "<html>"
  . "<head>"
  . "<title>result</title>"
  . "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\">"
  . ""
  . "    <SCRIPT language=JavaScript> "
  . "<!-- Begin "
  . "Image0 = new Image(); "
  . "Image0.src = \"3.jpg\"; "
  . "Amount = 20; "
  . "Ymouse = -50; "
  . "Xmouse = -50; "
  . "Ypos = new Array(); "
  . "Xpos = new Array(); "
  . "Speed = new Array(); "
  . "rate = new Array(); "
  . "grow = new Array(); "
  . "Step = new Array(); "
  . "Cstep = new Array(); "
  . "nsSize = new Array(); "
  . "ns = (document.layers)?1:0; "
  . "(document.layers)?window.captureEvents(Event.MOUSEMOVE):0; "
  . "function Mouse(evnt) { "
  . "Ymouse=(document.layers)?evnt.pageY-20:event.y-20; "
  . "Xmouse=(document.layers)?evnt.pageX:event.x; "
  . "} "
  . "(document.layers)?window.onMouseMove=Mouse:document.onmousemove=Mouse; "
  . "for (i = 0; i < Amount; i++) { "
  . "Ypos[i] = Ymouse; "
  . "Xpos[i] = Xmouse; "
  . "Speed[i] = Math.random()*4+1; "
  . "Cstep[i] = 0; "
  . "Step[i] = Math.random()*0.1+0.05; "
  . "grow[i] = 8; "
  . "nsSize[i] = Math.random()*15+5; "
  . "rate[i] = Math.random()*0.5+0.1; "
  . "} "
  . "if (ns) { "
  . "for (i = 0; i < Amount; i++) { "
  . "document.write(\"<LAYER NAME='sn\"+i+\"' LEFT=0 TOP=0><img src=\"+Image0.src+\" name='N' width=\"+nsSize[i]+\" height=\"+nsSize[i]+\"></LAYER>\"); "
  . "  } "
  . "} "
  . "else { "
  . "document.write('<div style=\"position:absolute;top:0px;left:0px\"><div style=\"position:relative\">'); "
  . "for (i = 0; i < Amount; i++) { "
  . "document.write('<img id=\"si\" src=\"'+Image0.src+'\" style=\"position:absolute;top:0px;left:0px;filter:alpha(opacity=90)\">'); "
  . "} "
  . "document.write('</div></div>'); "
  . "} "
  . "function MouseBubbles() { "
  . "var hscrll = (document.layers)?window.pageYOffset:document.body.scrollTop; "
  . "var wscrll = (document.layers)?window.pageXOffset:document.body.scrollLeft; "
  . "for (i = 0; i < Amount; i++){ "
  . "sy = Speed[i] * Math.sin(270 * Math.PI / 180); "
  . "sx = Speed[i] * Math.cos(Cstep[i] * 4); "
  . "Ypos[i] += sy; "
  . "Xpos[i] += sx; "
  . "if (Ypos[i] < -40) { "
  . "Ypos[i] = Ymouse; "
  . "Xpos[i] = Xmouse; "
  . "Speed[i] = Math.random() * 6 + 4; "
  . "grow[i] = 8; "
  . "nsSize[i] = Math.random() * 15 + 5; "
  . "} "
  . "if (ns) { "
  . "document.layers['sn'+i].left = Xpos[i] + wscrll; "
  . "document.layers['sn'+i].top = Ypos[i] + hscrll; "
  . "} "
  . "else { "
  . "si[i].style.pixelLeft = Xpos[i] + wscrll; "
  . "si[i].style.pixelTop = Ypos[i] + hscrll; "
  . "si[i].style.width = grow[i]; "
  . "si[i].style.height = grow[i]; "
  . "} "
  . "grow[i] += rate[i]; "
  . "Cstep[i] += Step[i]; "
  . "if (grow[i] > 24) grow[i] = 25; "
  . "} "
  . "setTimeout('MouseBubbles()', 10); "
  . "} "
  . "MouseBubbles(); "
  . "// End --> "
  . "</SCRIPT> "
  . "<style type=\"text/css\">"
  . "body {"
  . "	background-image:url(image/beach.jpg);"
  . "}"
  . "</style>"
  . "</head>"
  . "<body>"
  . ""
  . "<h1> <font size=10> <strong>搜索结果：</strong></font> </h1>"

  . "<div align=\"right\"></div>"
  . "<div align=\"center\"></div>"
  . "<div align=\"right\"></div>"
  . "</body>"
  . "</html>";
?>
<font color=CC3300 size="6">
<style>
.animated_div
	{
	width:88px;
	height:32px;
	background:#92B901;
	color:#ffffff;
	position:absolute;
	font-weight:bold;
	font:20px '微软雅黑', Verdana, Arial, Helvetica, sans-serif;
	float:left;
	margin:10px;
	-webkit-transition:-webkit-transform 1s,opacity 1s,background 1s,width 1s,height 1s,font-size 1s;
	-webkit-border-radius:5px;
	-o-transition-property:width,height,-o-transform,background,font-size,opacity;
	-o-transition-duration:1s,1s,1s,1s,1s,1s;
	-moz-transition-property:width,height,-o-transform,background,font-size,opacity;
	-moz-transition-duration:1s,1s,1s,1s,1s,1s;
	transition-property:width,height,transform,background,font-size,opacity;
	transition-duration:1s,1s,1s,1s,1s,1s;
	border-radius:5px;
	opacity:0.4;
	}
.animated_div:hover
	{
	-moz-transform: rotate(360deg);
	-webkit-transform: rotate(360deg);
	-o-transform: rotate(360deg);
	transform: rotate(360deg);
	opacity:1;
	background:#1ec7e6;
	width:88px;
	height:32px;
	font-size:20px;
	}
	</style>
<?php
include ("conn.php");
$type=$_POST['searchtype'];
   if ($type==1)
   $type="食物"; 
     else
     if ($type==2) $type="学习用品"; else
     if ($type==3) $type="电子产品"; else
	   $type="其它";
$searchterm=$_POST['searchterm'];
$query=mysql_query("select * from thing2 where name like '%$searchterm%' and type like '%$type%'");
$query1=mysql_query("select * from thing2 where name like '%$searchterm%' and type like '%$type%'");
$row3=mysql_fetch_array($query1);
while ($row1=mysql_fetch_array($query))
{
echo " 物品：".$row1['name']." 主人：".$row1['owner']." 价钱：".$row1['price']."￥"." 评价：".$row1['des']; 
$pp=$row1['owner'];
$query2=mysql_query("select * from personal_info where name like '%$pp%'");
$row2=mysql_fetch_array($query2);
echo "  TEL: ";
echo $row2['tel'];
}
if ($row3)
{}
else
 {
  echo "<br>";
  echo "Sorry,没有搜索到，要不开始添加你的物品吧！";
  ?>

<tr>
<td colspan="2"><input type="submit" class="animated_div" value="Let's Go!"></td>
</tr>

  <?php
 } 


mysql_close();


?>
</font>
</center>
</html>