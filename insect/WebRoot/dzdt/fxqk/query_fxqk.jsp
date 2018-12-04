<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%@page import="com.jf.util.Function"%>
<%@page import="java.util.Calendar"%>
<%response.setHeader("X-UA-Compatible","IE=EmulateIE11");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>�������</title>
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
var rwsjSize=document.getElementById("rwsj");
rwsjSize.options.length = 0;
var opt="";
var fxb="";
if(bchVal=="D849")
{
opt="<option value=\"3-25\">3��25��</option>"+
    "<option value=\"3-30\">3��30��</option>"+
    "<option value=\"4-5\">4��5��</option>"+
    "<option value=\"4-10\">4��10��</option>"+
    "<option value=\"4-15\">4��15��</option>"+
    "<option value=\"4-20\">4��20��</option>"+
    "<option value=\"4-25\">4��25��</option>"+
    "<option value=\"4-30\">4��30��</option>"+
    "<option value=\"5-5\">5��5��</option>"+
    "<option value=\"5-10\">5��10��</option>"+
    "<option value=\"5-15\">5��15��</option>"+
    "<option value=\"5-20\">5��20��</option>"+
    "<option value=\"5-25\">5��25��</option>"+
    "<option value=\"5-30\">5��30��</option>"+
    "<option value=\"11-5\">11��5��</option>";
fxb="<option value=\"Y09\">�������</option>";
}
else
{
for(var i=1;i<=12;i++)
{
opt+="<option value=\""+i+"-8\">"+i+"��8��</option>"+
    "<option value=\""+i+"-18\">"+i+"��18��</option>"+
    "<option value=\""+i+"-28\">"+i+"��28��</option>";
}
if(bchVal=="D903")
{
fxb="<option value=\"Y13\">������</option>"+
    "<option value=\"Y16\">������</option>";
}
else
{
fxb="<option value=\"Y12\">������</option>"+
    "<option value=\"Y14\">�������</option>";
}
}
rwsjSize.innerHTML=opt;
fxzbSize.innerHTML=fxb;
}
function sjfxt()
{
var fxs=document.getElementsByName("fxfs");
var fxfs="";
for ( var i = 0; i < fxs.length; i++) {
	if(fxs[i].checked)
	{
	fxfs=fxs[i].value;
	break;
	}
}
var bchVal=document.getElementById("bch").options[document.getElementById("bch").selectedIndex].value;
var fxzbVal=document.getElementById("fxzb").options[document.getElementById("fxzb").selectedIndex].value;
var rwsjVal=document.getElementById("rwsj").options[document.getElementById("rwsj").selectedIndex].value;
var ndVal=document.getElementById("nd").value;
window.open("/insect/dzdt/fxqk/fxqk_map.jsp?bchVal="+bchVal+"&fxzbVal="+fxzbVal+"&rwsjVal="+rwsjVal+"&ndVal="+ndVal+"&fxfs="+fxfs,"","");
}
</script>
<body>
<%
 Calendar calendar=Calendar.getInstance();
 int year=calendar.get(Calendar.YEAR);//�õ���
%>
<div id="content">
	<!-- navigation -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div>
						<center><h3><font color="black">�������</font></h3></center>
					</div>
					<div class="mod-bd">
							<table class="w">
								<colgroup>
									<col style="width:48%"></col>
								</colgroup>
								<tr>
								<td style="text-align: right">������ʽ</td>
								<td style="text-align: left;">
								<input name="fxfs" type="radio" value="1" checked="checked">������</input>&nbsp;&nbsp;
								<input name="fxfs" type="radio" value="2">��ֵ</input>&nbsp;&nbsp;
								</td>
								</tr>
								<tr>
								<td style="text-align: right">���溦</td>
								<td style="text-align: left;">
								<select id="bch" onchange="liandong()">
								<option value="D849">����</option>
								<option value="D903">���ѻ�ù��</option>
								<option value="D898">��ʭ</option>
								</select>
								</td>
								</tr>
								<tr>
								<td style="text-align: right">����ָ��</td>
								<td style="text-align: left;">
								<select id="fxzb"></select>
								</td>
								</tr>
								<tr>
								<td style="text-align: right">����ʱ��</td>
								<td style="text-align: left;">
								<select id="rwsj"></select>
								</td>
								</tr>
								<tr>
								<td style="text-align: right">���</td>
								<td style="text-align: left;">
								<input id="nd" name="nd" type="text" value="<%=year %>"/>
								</td>
								</tr>
								<tr>
									<td class="tc p10" colspan="2">
										<input class="btn" type="button" value="ȷ��" onclick="sjfxt()"/>&nbsp;
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
