<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%@page import="com.jf.util.Function"%>
<%@page import="java.util.Calendar"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%response.setHeader("X-UA-Compatible","IE=EmulateIE11");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>动态演示</title>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
	<link href="/insect/assets/css/base.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<link href="/insect/assets/css/layout.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<link href="/insect/assets/css/com.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<link href="/insect/assets/plug/jquery-ui-1.10.4 2/css/custom/jquery-ui-1.10.4.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<script src="/insect/assets/plug/jquery-ui-1.10.4 2/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="/insect/assets/plug/jquery-ui-1.10.4 2/js/jquery-ui-1.10.4.js" type="text/javascript"></script>
	<script type="text/javascript" src="/insect/javascript/validate.min.js"></script>
	<script type="text/javascript" src="/insect/javascript/common.js"></script>
</head>
<style type="text/css">
.w th{
text-align: right;
width: 45%;
padding-top: 5px;
padding-bottom: 5px;
}
.w td {
	padding-left: 15px;
	padding-top: 5px;
	padding-bottom: 5px;
}
</style>
<script type="text/javascript">
window.onload=function()
{
liandong();
}
function liandong()
{
var bchVal=document.getElementById("bch").options[document.getElementById("bch").selectedIndex].value;
var fxzbSize=document.getElementById("fxzb");
fxzbSize.options.length = 0; 
var rwsj=document.getElementById("rwsj");
rwsj.options.length = 0; 
var rwsjbegin=document.getElementById("rwsjbegin");
rwsjbegin.options.length = 0; 
var rwsjend=document.getElementById("rwsjend");
rwsjend.options.length = 0; 
var opt="";
var fxb="";
if(bchVal=="D849")
{
opt="<option value=\"3-25\">3月25日</option>"+
    "<option value=\"3-30\">3月30日</option>"+
    "<option value=\"4-5\">4月5日</option>"+
    "<option value=\"4-10\">4月10日</option>"+
    "<option value=\"4-15\">4月15日</option>"+
    "<option value=\"4-20\">4月20日</option>"+
    "<option value=\"4-25\">4月25日</option>"+
    "<option value=\"4-30\">4月30日</option>"+
    "<option value=\"5-5\">5月5日</option>"+
    "<option value=\"5-10\">5月10日</option>"+
    "<option value=\"5-15\">5月15日</option>"+
    "<option value=\"5-20\">5月20日</option>"+
    "<option value=\"5-25\">5月25日</option>"+
    "<option value=\"5-30\">5月30日</option>"+
    "<option value=\"11-5\">11月5日</option>";
fxb="<option value=\"Y09\">百株虫量</option>";
}
else
{
for(var i=1;i<=12;i++)
{
opt+="<option value=\""+i+"-8\">"+i+"月8日</option>"+
    "<option value=\""+i+"-18\">"+i+"月18日</option>"+
    "<option value=\""+i+"-28\">"+i+"月28日</option>";
}
if(bchVal=="D903")
{
fxb="<option value=\"Y13\">病株率</option>"+
    "<option value=\"Y16\">病果率</option>";
}
else
{
fxb="<option value=\"Y12\">虫株率</option>"+
    "<option value=\"Y14\">百株虫量</option>";
}
}
fxzbSize.innerHTML=fxb;
rwsj.innerHTML=opt;
rwsjbegin.innerHTML=opt;
rwsjend.innerHTML=opt;
}
function sjfxt()
{
var fxs=document.getElementsByName("fxfs");
var yss=document.getElementsByName("ysfs");
var fxfs="";
for ( var i = 0; i < fxs.length; i++) {
	if(fxs[i].checked)
	{
	fxfs=fxs[i].value;
	break;
	}
}
for ( var i = 0; i < yss.length; i++) {
	if(yss[i].checked)
	{
	yss=yss[i].value;
	break;
	}
}
var bchVal=document.getElementById("bch").options[document.getElementById("bch").selectedIndex].value;
var fxzbVal=document.getElementById("fxzb").options[document.getElementById("fxzb").selectedIndex].value;
var rwsjVal="";
var sjd="";
if(yss==1)
{
 rwsjVal=document.getElementById("nd").value;
 var begin=document.getElementById("rwsjbegin").selectedIndex
 var end=document.getElementById("rwsjend").selectedIndex
 for ( var i = begin; i <=end; i++) {
	sjd+=document.getElementById("rwsjbegin").options[i].value+","
 }
}
else
{
 rwsjVal=document.getElementById("rwsj").options[document.getElementById("rwsj").selectedIndex].value;
 sjd=document.getElementById("ndbegin").value+","+document.getElementById("ndend").value+",";
}
window.open("/insect/dzdt/dtys/dtys_mapmeun.jsp?bchVal="+bchVal+"&fxzbVal="+fxzbVal+"&rwsjVal="+rwsjVal+"&sjd="+sjd+"&yss="+yss+"&fxfs="+fxfs,"","");
}
function cheage(obj)
{
if(obj.value==1)
{
document.getElementById("gdnd").style.display="";
document.getElementById("gdsj").style.display="none";
}
else
{
document.getElementById("gdnd").style.display="none";
document.getElementById("gdsj").style.display="";
}
}
</script>
<body>
<%
 Calendar calendar=Calendar.getInstance();
 int year=calendar.get(Calendar.YEAR);//得到年
%>
<div id="content">
	<!-- navigation -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div>
						<center><h3><font color="black">动态演示</font></h3></center>
					</div>
					<div class="mod-bd">
							<table class="w">
								<colgroup>
									<col style="width:48%"></col>
								</colgroup>
								<tr>
								<td style="text-align: right;">分析方式</td>
								<td style="text-align: left;">
								<input name="fxfs" type="radio" value="1" checked="checked">发生点</input>&nbsp;&nbsp;
								<input name="fxfs" type="radio" value="2">插值</input>&nbsp;&nbsp;
								</td>
								</tr>
								<tr>
								<td style="text-align: right;">病虫害</td>
								<td style="text-align: left;">
								<select id="bch" onchange="liandong()">
								<option value="D849">麦蚜</option>
								<option value="D903">番茄灰霉病</option>
								<option value="D898">粉虱</option>
								</select>
								</td>
								</tr>
								<tr>
								<td style="text-align: right;">分析指标</td>
								<td style="text-align: left;">
								<select id="fxzb"></select>
								</td>
								</tr>
								<tr>
								<td style="text-align: right;">演示方式</td>
								<td style="text-align: left;">
								<input name="ysfs" type="radio" value="1" checked="checked" onclick="cheage(this)">固定年度</input>&nbsp;&nbsp;
								<input name="ysfs" type="radio" value="2" onclick="cheage(this)">固定时间</input>&nbsp;&nbsp;
								</td>
								</tr>
								<tr id="gdnd">
								<td style="text-align: right;">固定年度</td>
								<td style="text-align: left;">
								<input id="nd" name="nd" type="text" value="<%=year %>"/>
								<select id="rwsjbegin"></select>至								
								<select id="rwsjend"></select>								
								</td>
								</tr>
								<tr id="gdsj" style="display: none;">
								<td style="text-align: right;">固定时间</td>
								<td style="text-align: left;">
								<select id="rwsj"></select>								
								<input id="ndbegin" name="ndbegin" type="text" value="<%=year-1 %>"/>至
								<input id="ndend"  name="ndend" type="text" value="<%=year %>"/>
								</td>
								</tr>
								<tr>
									<td class="tc p10" colspan="2">
										<input class="btn" type="button" value="确定" onclick="sjfxt()"/>&nbsp;
									</td>
								</tr>
							</table>
					</div>
				</div>
        	</div>
    	</div>
	</div>
</div>
</body>
</html>
