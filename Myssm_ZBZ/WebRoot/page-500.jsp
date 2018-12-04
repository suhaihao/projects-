<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    	<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>蔬菜专防服务管理系统</title>		
		
		<!-- Import google fonts - Heading first/ text second -->
        <!--[if lt IE 9]>
<link href="http://fonts.useso.com/css?family=Open+Sans:400" rel="stylesheet" type="text/css" />
<link href="http://fonts.useso.com/css?family=Open+Sans:700" rel="stylesheet" type="text/css" />
<link href="http://fonts.useso.com/css?family=Droid+Sans:400" rel="stylesheet" type="text/css" />
<link href="http://fonts.useso.com/css?family=Droid+Sans:700" rel="stylesheet" type="text/css" />
<![endif]-->

		<!-- Favicon and touch icons -->
		<link rel="shortcut icon" href="${path}/assets/ico/favicon.ico" type="image/x-icon" />

	    <!-- Css files -->
	    <link href="${path}/assets/css/bootstrap.min.css" rel="stylesheet">		
		<link href="${path}/assets/css/jquery.mmenu.css" rel="stylesheet">			
		<link href="${path}/assets/css/font-awesome.min.css" rel="stylesheet">			  
	    <link href="${path}/assets/css/style.min.css" rel="stylesheet">
		<link href="${path}/assets/css/add-ons.min.css" rel="stylesheet">
		<style>
			footer {
				display: none;
			}
		</style>

	    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	</head>
</head>

<body>
	<div class="container-fluid content">
		<div class="row">
			<div id="content" class="col-sm-12 full">
			
				<div class="row box-error">
				
					<div class="col-lg-12 col-md-12 col-xs-12">
					<div class="text-center">
						<h1>500</h1>
						<h2>服务器出问题了。。。</h2>
						<p>请尝试如下操作</p>
						<a href="javascript: history.go(-1)">
							<button class="btn btn-default"><span class="fa fa-chevron-left"> Go Back</span></button>
						</a>
					</div>
					</div><!--/col-->
				
				</div><!--/row-->
		
			</div><!--/content-->	
				
		</div><!--/row-->
		
	</div><!--/container-->
		
		
	<!-- start: JavaScript-->
	<!--[if !IE]>-->

			<script src="${path}/assets/js/jquery-2.1.1.min.js"></script>

	<!--<![endif]-->

	<!--[if IE]>
	
		<script src="${path}/assets/js/jquery-1.11.1.min.js"></script>
	
	<![endif]-->

	<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='${path}/assets/js/jquery-2.1.1.min.js'>"+"<"+"/script>");
		</script>

	<!--<![endif]-->

	<!--[if IE]>
	
		<script type="text/javascript">
	 	window.jQuery || document.write("<script src='${path}/assets/js/jquery-1.11.1.min.js'>"+"<"+"/script>");
		</script>
		
	<![endif]-->
	<script src="${path}/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="${path}/assets/js/bootstrap.min.js"></script>	
	
		
	<!-- theme scripts -->
	<script src="${path}/assets/js/SmoothScroll.js"></script>
	<script src="${path}/assets/js/jquery.mmenu.min.js"></script>
	<script src="${path}/assets/js/core.min.js"></script>
		
	<!-- end: JavaScript-->
	
</body>
</html>