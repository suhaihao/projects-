<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("path", basePath);
%>
<!DOCTYPE html>
<html class="no-js">

<head>

<meta charset="utf-8">
<title>蔬菜专防服务管理系统</title>
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="${path}/assets/ico/favicon.ico"
	type="image/x-icon" />
<!-- CSS -->
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" media="screen"
	href="${path}/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="${path}/assets/css/reset.css">
<link rel="stylesheet" href="${path}/assets/css/supersized.css">
<link rel="stylesheet" href="${path}/assets/css/style.css">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

</head>
<style>
/* Reset CSS */
.left { float:left; }
.right { float:right; }
.alignleft { float: left; margin-right: 15px; }
.alignright { float: right; margin-left: 15px; }
.clearfix:after,
form:after {
	content: ".";
	display: block;
	height: 0;
	clear: both;
	visibility: hidden;
}
.container { margin: 25px auto; position: relative; width: 900px; }
#content {
	background: #f9f9f9;
	background: -moz-linear-gradient(top,  rgba(248,248,248,1) 0%, rgba(249,249,249,1) 100%);
	background: -webkit-linear-gradient(top,  rgba(248,248,248,1) 0%,rgba(249,249,249,1) 100%);
	background: -o-linear-gradient(top,  rgba(248,248,248,1) 0%,rgba(249,249,249,1) 100%);
	background: -ms-linear-gradient(top,  rgba(248,248,248,1) 0%,rgba(249,249,249,1) 100%);
	background: linear-gradient(top,  rgba(248,248,248,1) 0%,rgba(249,249,249,1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f8f8f8', endColorstr='#f9f9f9',GradientType=0 );
	-webkit-box-shadow: 0 1px 0 #fff inset;
	-moz-box-shadow: 0 1px 0 #fff inset;
	-ms-box-shadow: 0 1px 0 #fff inset;
	-o-box-shadow: 0 1px 0 #fff inset;
	box-shadow: 0 1px 0 #fff inset;
	border: 1px solid #c4c6ca;
	margin: 0 auto;
	padding: 25px 0 0;
	position: relative;
	text-align: center;
	text-shadow: 0 1px 0 #fff;
	width: 400px;
}
#content h1 {
	color: #7E7E7E;
	font: bold 25px Helvetica, Arial, sans-serif;
	letter-spacing: -0.05em;
	line-height: 20px;
	margin: 10px 0 30px;
}
#content h1:before,
#content h1:after {
	content: "";
	height: 1px;
	position: absolute;
	top: 10px;
	width: 27%;
}
#content h1:after {
	background: rgb(126,126,126);
	background: -moz-linear-gradient(left,  rgba(126,126,126,1) 0%, rgba(255,255,255,1) 100%);
	background: -webkit-linear-gradient(left,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
	background: -o-linear-gradient(left,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
	background: -ms-linear-gradient(left,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
	background: linear-gradient(left,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
    right: 0;
}
#content h1:before {
	background: rgb(126,126,126);
	background: -moz-linear-gradient(right,  rgba(126,126,126,1) 0%, rgba(255,255,255,1) 100%);
	background: -webkit-linear-gradient(right,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
	background: -o-linear-gradient(right,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
	background: -ms-linear-gradient(right,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
	background: linear-gradient(right,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
    left: 0;
}
#content:after,
#content:before {
	background: #f9f9f9;
	background: -moz-linear-gradient(top,  rgba(248,248,248,1) 0%, rgba(249,249,249,1) 100%);
	background: -webkit-linear-gradient(top,  rgba(248,248,248,1) 0%,rgba(249,249,249,1) 100%);
	background: -o-linear-gradient(top,  rgba(248,248,248,1) 0%,rgba(249,249,249,1) 100%);
	background: -ms-linear-gradient(top,  rgba(248,248,248,1) 0%,rgba(249,249,249,1) 100%);
	background: linear-gradient(top,  rgba(248,248,248,1) 0%,rgba(249,249,249,1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f8f8f8', endColorstr='#f9f9f9',GradientType=0 );
	border: 1px solid #c4c6ca;
	content: "";
	display: block;
	height: 100%;
	left: -1px;
	position: absolute;
	width: 100%;
}
#content:after {
	-webkit-transform: rotate(2deg);
	-moz-transform: rotate(2deg);
	-ms-transform: rotate(2deg);
	-o-transform: rotate(2deg);
	transform: rotate(2deg);
	top: 0;
	z-index: -1;
}
#content:before {
	-webkit-transform: rotate(-3deg);
	-moz-transform: rotate(-3deg);
	-ms-transform: rotate(-3deg);
	-o-transform: rotate(-3deg);
	transform: rotate(-3deg);
	top: 0;
	z-index: -2;
}
#content form { margin: 0 20px; position: relative }
#content form input[type="text"],
#content form input[type="password"] {
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	-ms-border-radius: 3px;
	-o-border-radius: 3px;
	border-radius: 3px;
	transition: all 0.5s ease;
	background: #eae7e7 url(http://cssdeck.com/uploads/media/items/8/8bcLQqF.png) no-repeat;
	border: 1px solid #c8c8c8;
	color: #777;
	font: 13px Helvetica, Arial, sans-serif;
	margin: 0 0 10px;
	padding: 10px 0px 10px 40px;
	width: 80%;
}
.yzm{
-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	-ms-border-radius: 3px;
	-o-border-radius: 3px;
	border-radius: 3px;
	-webkit-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
	-moz-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
	-ms-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
	-o-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
	box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-ms-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
	border: 1px solid #c8c8c8;
	color: #777;
	width: 80%;
}
#username { background-position: 10px 10px !important }
#password { background-position: 10px -53px !important }
</style>
<body>
	<div class="container">
		<div id="alert-user" class="alert alert-danger hidden" role="alert">
			<strong>错误：</strong>用户名密码错误！
		</div>
		<div id="alert-yzm" class="alert alert-danger hidden" role="alert">
			<strong>错误：</strong>验证码错误！
		</div>
		<div id="alert-cs" class="alert alert-danger hidden" role="alert">
			<strong>错误：</strong>登陆超时
		</div>
		<section id="content" style="margin-top: 150px;">
		<form id="fmbd" action="${path}shiro/login.do" method="post">
		<h1>Login</h1>
			<input id="username" type="text" name="username" class="username" placeholder="用户名" autocomplete="off">
			<input id="password" type="password" name="password" class="password" placeholder="密码 " style="padding-top: 0;padding-bottom: 0;" autocomplete="off"> 
			<input style="color:#777;width: 25%;vertical-align: middle;margin-top: -5px;" type="search" name="yzm" class="yzm" placeholder="验证码" autocomplete="off">
			<img class="img-rounded" style="height: 42px;width:165px;vertical-align: middle;padding: 0;margin-top: -5px;" alt=""  onclick="this.src=this.src+'?'+(new Date()).getTime()"src="${path}code/new.do" />
			<button id="btn" type="button" style="margin-top: 5px;width: 80%;margin-bottom: 10px;">登陆</button>
			<div class="error">
				<span>+</span>
			</div>
		</form>
		</section>
		
	</div>
	<div>
	<img class="img-rounded" src="${path}assets/file/nh.png" />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<img class="img-rounded" src="${path}assets/file/zfzz.png" />
	</div>
	<!-- Javascript -->
	<script src="${path}/assets/js/jquery-1.8.2.min.js"></script>
	<script src="${path}/assets/js/supersized.3.2.7.min.js"></script>
	<script src="${path}/assets/js/scripts.js"></script>
</body>
<script type="text/javascript">
<%
String ms=(String)request.getAttribute("msg");
String ms1=(String)request.getSession().getServletContext().getAttribute("msg");
String ms2=(String)request.getSession().getServletContext().getAttribute("msg");
String ms3=(String)request.getSession().getServletContext().getAttribute("msg");
if(ms!=null&&ms.equals("1")||ms2!=null&&ms2.equals("1"))
{
%>	
        	$("#alert-user").attr("class","alert alert-danger");
        	setTimeout(function () {
        	$("#alert-user").attr("class","alert alert-danger hidden");
            }, 3000);
<%
request.getSession().getServletContext().removeAttribute("msg");
}
if(ms2!=null&&ms2.equals("2"))
{
%>	
        	$("#alert-yzm").attr("class","alert alert-danger");
        	setTimeout(function () {
            $("#alert-yzm").attr("class","alert alert-danger hidden");
            }, 3000);
<%
request.getSession().getServletContext().removeAttribute("msg");
}
if(ms3!=null&&ms3.equals("3"))
{
%>	
        	$("#alert-cs").attr("class","alert alert-danger");
        	setTimeout(function () {
            $("#alert-cs").attr("class","alert alert-danger hidden");
            }, 3000);
<%
request.getSession().getServletContext().removeAttribute("msg");
}
%>

	function chengecode(obj) {
		obj.src = obj.src + "?" + Math.random();
	}
	jQuery(function($) {

		$.supersized({

			// Functionality
			slide_interval : 4000, // Length between transitions
			transition : 1, // 0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
			transition_speed : 1000, // Speed of transition
			performance : 1, // 0-Normal, 1-Hybrid speed/quality, 2-Optimizes image quality, 3-Optimizes transition speed // (Only works for Firefox/IE, not Webkit)

			// Size & Position
			min_width : 0, // Min width allowed (in pixels)
			min_height : 0, // Min height allowed (in pixels)
			vertical_center : 1, // Vertically center background
			horizontal_center : 1, // Horizontally center background
			fit_always : 0, // Image will never exceed browser width or height (Ignores min. dimensions)
			fit_portrait : 1, // Portrait images will not exceed browser height
			fit_landscape : 0, // Landscape images will not exceed browser width
			autoplay:false,
			// Components
			slide_links : 'blank', // Individual links for each slide (Options: false, 'num', 'name', 'blank')
			slides : [ // Slideshow Images
			{
				image : '${path}/assets/img/backgrounds/1.jpg'
			}, {
				image : '${path}/assets/img/backgrounds/2.jpg'
			}, {
				image : '${path}/assets/img/backgrounds/3.jpg'
			} ]

		});

	});
</script>
</html>

