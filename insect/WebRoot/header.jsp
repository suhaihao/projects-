<%@ page language="java" pageEncoding="GBK"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%response.setHeader("X-UA-Compatible","IE=EmulateIE11");%>
<%
	String title = "������ֲ����Ϣ��";
	if (null != request.getParameter("title")) {
		title = request.getParameter("title");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=title %></title>
	<link href="/insect/zTree-zTree_v3-7b4dfb8/css/demo.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="/insect/zTree-zTree_v3-7b4dfb8/css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
	<link href="/insect/assets/css/base.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<link href="/insect/assets/css/layout.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<link href="/insect/assets/css/com.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<link href="/insect/assets/plug/jquery-ui-1.10.4 2/css/custom/jquery-ui-1.10.4.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<link href="/insect/javascript/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
	<!-- 
	<script src="/insect/zTree-zTree_v3-7b4dfb8/js/jquery-1.4.4.min.js" type="text/javascript"></script>
	 -->
	<script src="/insect/assets/plug/jquery-ui-1.10.4 2/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="/insect/assets/plug/jquery-ui-1.10.4 2/js/jquery-ui-1.10.4.js" type="text/javascript"></script>
	<script type="text/javascript" src="/insect/javascript/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="/insect/javascript/validate.min.js"></script>
	<script type="text/javascript" src="/insect/javascript/common.js"></script>
	<script src="/insect/zTree-zTree_v3-7b4dfb8/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
<script src="/insect/zTree-zTree_v3-7b4dfb8/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
</head>
<body>
<div id="container">
    <!-- start header -->
<div id="header">
         <video autoplay="autoplay"  width="100%" loop="loop" height="20%">
            <source src="/insect/images/head.mp4" type="video/mp4" />
         </video>
</div>
<%
String bmmc = ((User) session.getAttribute("user")).getBmmc();
String username=((User) session.getAttribute("user")).getUsername();
String jfuserrid=((User) session.getAttribute("user")).getUserid();
 %>
	<div style="position:absolute;left:70%;text-align: right">
		������λ��<%=bmmc %>	&nbsp;&nbsp;��¼�ˣ�<%=username%>&nbsp;&nbsp;
		<a href="javascript:void(0);" onclick="uppassword()">�޸�����</a>&nbsp;&nbsp;
		<a href="javascript:void(0);" onclick="zx(this)">ע��</a>&nbsp;&nbsp;
		<a href="javascript:void(0);" onclick="clos()">�˳�</a>
   </div>
		<div id="upLayer" style="display:none;position:fixed;width:300px;left:40%;top:40%;border: #D8D8D8 4px solid;background: #F6F6F6;padding-top: 10px;padding-bottom: 10px;">
				<table style="text-align: center; width: 100%;border-collapse:separate; border-spacing:10px;"cellspacing="10">
					<tr>
						<td>
							<align center>
							<span>����������</span>
							</align>
						</td>
					</tr>
					<tr>
						<td>
					        <span>�ɵ����룺</span><input id="old" name="old" type="password" >
					        <br/>
					        <br/>
					        <span>�µ����룺</span><input id="new" name="new" type="password" >
					        <br/>
					        <br/>
					        <span>ȷ�����룺</span><input id="newtwo" name="new" type="password" >
					        <input id="jfuserrid" name="jfuserrid" type="hidden" value="<%=jfuserrid %>">
						</td>
					</tr>
					<tr>
						<td>
							<input style="width: 50px;background:#66ff66;border-color:#66ff66;" type="button" value="ȷ��" onclick="xgmm()">
							&nbsp;&nbsp;
							<input style="width: 50px;background:#66ff66;border-color:#66ff66;" type="button" value="ȡ��" onclick="uppassword()">
						</td>
					</tr>
				</table>
		</div>   
<script type="text/javascript">
function clos()
{
if(confirm("��ȷ���ر���"))
{
window.close();
}
}
function zx(obj)
{
if(confirm("��ȷ��ע����"))
{
obj.href="/insect/outlogin.do?ACT_TYPE=outlogin";
}
}
function uppassword()
{
(document.getElementById("upLayer").style.display=='none')?document.getElementById("upLayer").style.display="":document.getElementById("upLayer").style.display="none";
}

</script>
