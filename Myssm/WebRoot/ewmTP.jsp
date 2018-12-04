<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.ssh.user.model.User"%>
<%@ page import="com.ssh.user.util.EHCache"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jf"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("path", basePath);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="GBK">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1.0" />
	<script type="text/javascript">
	  document.addEventListener('DOMContentLoaded',function(){
			document.documentElement.style.fontSize=document.documentElement.clientWidth/19+'px'; 
	  });
	</script>
<style type="text/css">
html {
	color: #000;
	background: #fff;
	font-family: "microsoft yahei";
}

html,body,h1,h2,h3,h4,h5,h6,div,dl,dt,dd,ul,ol,li,p,blockquote,pre,hr,figure,table,caption,th,td,form,fieldset,legend,input,button,textarea,menu
	{
	margin: 0;
	padding: 0;
}

header,footer,section,article,aside,nav,hgroup,address,figure,figcaption,menu,details
	{
	display: block;
}

h1,h2,h3,h4,h5,h6,strong {
	font-weight: normal !important;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

caption,th {
	text-align: left;
	font-weight: normal;
}

html,body,fieldset,img,iframe,abbr {
	border: 0;
}

i,cite,em,var,address,dfn {
	font-style: normal;
}

[hidefocus],summary {
	outline: 0;
}

li {
	list-style: none;
}

h1,h2,h3,h4,h5,h6,small {
	font-size: 100%;
}

sup,sub {
	font-size: 83%;
}

pre,code,kbd,samp {
	font-family: inherit;
}

q:before,q:after {
	content: none;
}

textarea {
	overflow: auto;
	resize: none;
}

label,summary {
	cursor: default;
}

div {
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

a,button {
	cursor: pointer;
}

h1,h2,h3,h4,h5,h6,em,strong,b {
	font-weight: bold;
}

del,ins,u,s,a,a:hover {
	text-decoration: none;
}

body,textarea,input,button,select,keygen,legend {
	color: #333;
	outline: 0;
}

body {
	background: #fff;
}

input[type=button],input[type=submit],input[type=file],button {
	cursor: pointer;
	-webkit-appearance: none;
}

input {
	-webkit-appearance: none;
}

.clear {
	clear: both;
}

header {
	height: 2.2rem;
	width: 100%;
	z-index: 1001;
	background-color: #20c32f;
	font-size: 0.9rem;
	position: fixed;
	top: 0;
	left: 0;
	color: #fff;
	text-align: center;
	line-height: 2.2rem;
}

header h2 {
	font-weight: normal;
}

body {
	width: 100%;
	background: url('http://218.247.232.15:8080/Myssm/assets/images/bg.png')
		no-repeat center 2.2rem;
	background-size: 100% 100%;
}

.wrap {
	height: auto;
	padding: 0 0.5rem;
	overflow-y: scroll;
	z-index: 1000;
}

.wrap_top {
	width: 100%;
	background-color: #fff;
	border-radius: 9px;
	margin-top: 2.7rem;
}

.wrap_top ul {
	padding-bottom: 0.6rem;
}

.wrap_top ul li {
	width: 50%;
	float: left;
	font-size: 0.7rem;
	padding-left: 0.75rem;
	box-sizing: border-box;
	padding-top: 0.8rem;
	line-height: 100%;
}

.con_title {
	width: 100%;
	text-align: center;
	padding-top: 0.8rem;
	padding-bottom: 0.4rem;
}

.con_title img {
	width: 73.34%;
}

.content {
	width: 100%;
	margin-bottom: 0.5rem;
	background-color: #fff;
	border-radius: 9px;
	padding: 0 0.5rem;
	box-sizing: border-box;
}

.con_top {
	border-bottom: 1px solid #ddd;
	width: 100%;
	height: auto;
	position: relative;
	padding-top: 0.5rem;
	padding-bottom: 0.2rem
}

.con_top p {
	width: 100%;
	font-size: 0.7rem;
	line-height: 180%;
}

.con_p1 {
	box-sizing: border-box;
	padding-left: 1.6rem;
}

.con_top img {
	width: 1rem;
	position: absolute;
	left: 0;
	top: 0.7rem;
}

.con_top p em {
	float: left;
	font-size: 0.7rem;
	font-weight: normal;
	color: #000;
	padding-right: 0.6rem;
}

.con_top strong {
	float: left;
	font-size: 0.7rem;
	color: #999;
	padding-right: 0.2rem;
}

.con_top p span {
	float: left;
	font-size: 0.7rem;
}

.con_top p span {
	float: left;
}

.con_top p small {
	color: #999;
	float: left;
	padding-left: 0.7rem;
}

.con_p2 strong,.con_p1 small,.con_p1 span {
	font-size: 0.65rem;
}

.con_center {
	font-size: 0.65rem;
}

.con_center ul {
	
}

.con_center ul li {
	color: #999;
	padding-bottom: 0.3rem;
}

.con_center ul li span {
	color: #333;
}

.con_center ul li strong {
	color: #999;
	padding-bottom: 0.3rem;
}

.con_name {
	
}

.con_center table {
	width: 100%;
	font-size: 0.65rem;
}

.con_center table tr {
	height: 1.15rem;
	line-height: 1.15rem
}

.tab_1 {
	width: 10.75%;
}

.tab_2 {
	width: 49.25%;
}

.con_btn {
	width: 100%;
	text-align: center;
	padding-bottom: 0.5rem;
	padding-top: 0.7rem;
}

.btn {
	font-size: 0.75rem;
	color: #fff;
	background-color: #20c32f;
	border: none;
	width: 94%;
	padding: 0.6rem 0;
	border-radius: 50px;
	box-shadow: #999 0px 0px 5px;
}
</style>
</head>
<script>
</script>

<body style="height: 100%;">
	<%
		request.setAttribute("listdfw01_d_zp",
				request.getAttribute("listdfw01_d_zp"));
		request.setAttribute("YJPZ", request.getAttribute("YJPZ"));
		request.setAttribute("XCZY", request.getAttribute("XCZY"));
		request.setAttribute("FZDX", request.getAttribute("FZDX"));
		request.setAttribute("TSQK", request.getAttribute("TSQK"));
	%>
	<header>
		<h2>作业照片</h2>
	</header>
	<div class="wrap" style="height: 100%;">
		<div class="con_title">
			<img src="${path}assets/images/img1.png" alt="" />
		</div>
			<div class="content">
				<div class="con_center">
					<ul>
						<jf:if test="${YJPZ==1}">
							<li><strong>防治措施：</strong><span><jf:forEach
										var="dfw01_d_zp" items="${listdfw01_d_zp}">
										<jf:if test="${dfw01_d_zp.LB==0}">
											<a href="${path}${dfw01_d_zp.SL_LJ}" target="_blank"><img
												class="img-thumbnail" src="${path}${dfw01_d_zp.SL_LJ}"
												alt="Sample Image" style="width: 50px;height: 50px;"></a>
										</jf:if>
									</jf:forEach></span></li>
						</jf:if>
						<jf:if test="${XCZY==1}">
							<li><strong>现场作业：</strong><span><jf:forEach
										var="dfw01_d_zp" items="${listdfw01_d_zp}">
										<jf:if test="${dfw01_d_zp.LB==1}">
											<a href="${path}${dfw01_d_zp.SL_LJ}" target="_blank"><img
												class="img-thumbnail" src="${path}${dfw01_d_zp.SL_LJ}"
												alt="Sample Image" style="width: 50px;height: 50px;"></a>
										</jf:if>
									</jf:forEach></span></li>
						</jf:if>
						<jf:if test="${FZDX==1}">
							<li><strong>防治对象：</strong><span><jf:forEach
										var="dfw01_d_zp" items="${listdfw01_d_zp}">
										<jf:if test="${dfw01_d_zp.LB==2}">
											<a href="${path}${dfw01_d_zp.SL_LJ}" target="_blank"><img
												class="img-thumbnail" src="${path}${dfw01_d_zp.SL_LJ}"
												alt="Sample Image" style="width: 50px;height: 50px;"></a>
										</jf:if>
									</jf:forEach></span></li>
						</jf:if>
						<jf:if test="${TSQK==1}">
							<li><strong>特殊情况：</strong><span> <jf:forEach
										var="dfw01_d_zp" items="${listdfw01_d_zp}">
										<jf:if test="${dfw01_d_zp.LB==3}">
											<a href="${path}${dfw01_d_zp.SL_LJ}" target="_blank"><img
												class="img-thumbnail" src="${path}${dfw01_d_zp.SL_LJ}"
												alt="Sample Image" style="width: 50px;height: 50px;"></a>
										</jf:if>
									</jf:forEach>
							</span></li>
						</jf:if>
						<li><strong style="color: red;">注意：</strong><span
							style="color: red;">防治措施照片要求：非巡棚必须拍照，照片中应包含本地块服务所需耗材。<br>
								现场作业：必须拍照，照片中需体现作业场景。<br> 防治对象：有症状必须拍照。<br>
								特殊情况：如棚室损坏、局部病虫十分严重等可能引起争议的特殊情况。
						</span></li>
					</ul>
				</div>
			</div>
	</div>
	<script type="text/javascript">
	</script>
</body>
</html>
