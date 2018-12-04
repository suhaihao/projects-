<%@ page language="java" pageEncoding="GBK"%>
<%-- use to iframe page --%>
<%
	String title = "北京市植保信息网";
	if (null != request.getParameter("title")) {
		title = request.getParameter("title");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=title %></title>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
	<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
	<!-- <meta http-equiv="X-UA-Compatible"content="IE=9; IE=8; IE=7; IE=EDGE">  -->
	
	<link href="/insect/assets/css/base.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<link href="/insect/assets/css/com.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<link href="/insect/assets/plug/jquery-ui-1.10.4 2/css/custom/jquery-ui-1.10.4.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<script src="/insect/assets/plug/jquery-ui-1.10.4 2/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="/insect/assets/plug/jquery-ui-1.10.4 2/js/jquery-ui-1.10.4.js" type="text/javascript"></script>
	<!-- 
	<link href="http://192.168.1.128:8082/assets/css/base.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<link href="http://192.168.1.128:8082/assets/css/com.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<link href="http://192.168.1.128:8082/assets/plug/jquery-ui-1.10.4 2/css/custom/jquery-ui-1.10.4.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<script src="http://192.168.1.128:8082/assets/plug/jquery-ui-1.10.4 2/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="http://192.168.1.128:8082/assets/plug/jquery-ui-1.10.4 2/js/jquery-ui-1.10.4.js" type="text/javascript"></script>
	 -->
	<script type="text/javascript" src="/insect/javascript/WdatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="/insect/javascript/validate.min.js"></script>
	<script type="text/javascript" src="/insect/javascript/common.js"></script>
</head>
<body>
<div id="container">
