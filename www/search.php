<html>
<head>
<style>
h2
{
text-shadow: 8px 8px 8px #CCCC00;
font:60px '华文行楷', Verdana, Arial, Helvetica, sans-serif;
}
h3
{
text-shadow: 8px 8px 8px #CCCC00;
font:20px '华文行楷', Verdana, Arial, Helvetica, sans-serif;
}
</style>
<?php
echo"<html>"
  . "<head> "
  . "    <title>找一找</title>"
  . "    <SCRIPT language=JavaScript> "
  . "Image0 = new Image(); "
  . "Image0.src = \"image/water.jpg\";"
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
  . "</SCRIPT> "
  . "</head>"
  . "<style type=\"text/css\">"
  . "body"
  . "{"
  . "	background-image:url(image/search_bg.jpg);"
  . "	background-color:#000000;"
  . "}"
  . "</style>"
  . ""
  . "<body>"
  . "    <h1 align=\"center\"><font color=\"#CCC\" size=\"+10\"><h2>"
  . "找一找</h2></font></h1>"
  . "<center>"
  . "	<form action=\"result.php\" method=\"post\"><font color=\"#FFC\" size=\"+2\"><h3>"
  . "	    选择商品类型:</h3></font><br/>"
  . "		<select name=\"searchtype\">"
  . "		    <option value=\"1\">食物</option>"
  . "			<option value=\"2\">学习用品</option>"
  . "			<option value=\"3\">电子产品</option>"
  . "           <option value=\"4\">其它</option>"
  . "		</select>"
  . "		<br/><font color=\"#FFC\" size=\"+2\"><h3>"
  . "		输入搜索内容:</h3></font><br/>"
  . "		<input name=\"searchterm\" type=\"text\" size=\"40\"/>"
  . "		<br/>"
  . "		<input type=\"submit\" name=\"submit\" value=\"搜索\"/>"
  . "	</form>"
  . "    </center>"
  . "    <div align=\"center\">"
  . "<img src=\"image/bike.gif\" width=\"475\" height=\"300\"  alt=\"\"/></div>"
  . "</body>"
  . "</html>"
 ."";
?>

</head>
</html>