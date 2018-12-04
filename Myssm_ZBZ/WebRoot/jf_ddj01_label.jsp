<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.ssh.user.model.User"%>
<%@ page import="com.ssh.user.util.EHCache"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jf"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("path", basePath);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GBK">
<meta name="renderer" content="webkit">
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
<link rel="shortcut icon" href="${path}/assets/ico/favicon.ico"
	type="image/x-icon" />

<!-- Css files -->
<link href="${path}/assets/css/bootstrap.min.css" rel="stylesheet">
<link href="${path}/assets/css/jquery.mmenu.css" rel="stylesheet">
<link href="${path}/assets/css/font-awesome.min.css" rel="stylesheet">
<link
	href="${path}/assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css"
	rel="stylesheet">
<link href="${path}/assets/css/style.min.css" rel="stylesheet">
<link href="${path}/assets/css/add-ons.min.css" rel="stylesheet">
<link href="${path}/assets/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="${path}/assets/css/bootstrapValidator.min.css"
	rel="stylesheet">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>
</head>

<body>
	<%
		request.setAttribute("page", request.getAttribute("page"));
		request.setAttribute("MC", request.getAttribute("MC"));
		request.setAttribute("BMBM", request.getAttribute("BMBM"));
		request.setAttribute("listddj01", request.getAttribute("listddj01"));
		request.setAttribute("listdsys05",
				request.getAttribute("listdsys05"));
	%>
	<!-- start: Header -->
	<jsp:include page="/head.jsp" />
	<!-- end: Header -->
	<div class="container-fluid content">
		<div class="row">

			<!-- start: Main Menu -->
			<jsp:include page="/menu.jsp" />
			<!-- end: Main Menu -->

			<!-- start: Content -->
			<div class="main sidebar-minified">
				<!-- head -->
				<div class="row">
					<div class="col-lg-12">
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i><a href="${path}go/index.do">首页</a></li>
							<li><i class="fa fa-search"></i>查询统计</li>
							<li><i class="fa fa-eye">专防组织名录</i></li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>专防组织名录</strong>
								</h2>
								<div class="panel-actions">
									<a href="table.html#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<form action="${path}label/sel.do" class="navbar-form"
									style="padding: 0;" method="post">
									<div style="text-align: right;">
										<label>部门： </label> <select id="select" name="BMBM"
											class="form-control" size="1">
											<option value="">请选择</option>
											<jf:forEach var="dsys05" items="${listdsys05}">
												<jf:if test="${dsys05.BM==BMBM}">
													<option selected="selected" value="${dsys05.BM}">${dsys05.text}</option>
												</jf:if>
												<jf:if test="${dsys05.BM!=BMBM}">
													<option value="${dsys05.BM}">${dsys05.text}</option>
												</jf:if>
											</jf:forEach>
										</select> &#12288;&#12288;<input name="MC" type="text"
											class="form-control" placeholder="查询名称" value="${MC}">
										<button class="btn btn-info" type="submit">
											<i class="fa fa-search "></i>
										</button>
									</div>
								</form>
								<table
									class="table table-striped table-bordered bootstrap-datatable datatable">
									<thead>
										<tr>
											<th>No.</th>
											<th>用户名</th>
											<th>单位名称</th>
											<th>地址</th>
											<th>手机</th>
											<th>邮箱</th>
											<th>状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<jf:forEach var="ddj01" items="${listddj01}">
											<tr>
												<td>${ddj01.RN}</td>
												<td>${ddj01.YHM}</td>
												<td>${ddj01.MC}</td>
												<td>${ddj01.DZ}</td>
												<td>${ddj01.LX_SJ}</td>
												<td>${ddj01.YX}</td>
												<td><jf:if test="${ddj01.ZT==0}">作废</jf:if> <jf:if
														test="${ddj01.ZT==1}">初始</jf:if> <jf:if
														test="${ddj01.ZT==2}">提交</jf:if></td>
												<td><a class="btn btn-info" href="javascript:void(0);"
													onclick="tjgx('${ddj01.JFID}')"> <i class="fa fa-search-plus"></i>
												</a></td>
											</tr>
											<form id="upuser${ddj01.JFID}" action="${path}label/gotoup.do"
												method="post">
												<input type="hidden" name="JFID" value="${ddj01.JFID}" />
											</form>
										</jf:forEach>
									</tbody>
								</table>
								<!-- 分页 -->
									<div style="text-align:center;">
										<ul class="pagination">
											<li><a>共${page.totalPage}页</a></li>
											<li><a
												href="${path}/label/sel.do?page=1&allSize=${page.allSize}&MC=${MC}&BMBM=${BMBM}"><<</a></li>
											<li><a
												href="${path}/label/sel.do?page=${page.page-1}&allSize=${page.allSize}&MC=${MC}&BMBM=${BMBM}"><</a></li>
											<li class="active"><a>${page.page}</a></li>
											<li><a
												href="${path}/label/sel.do?page=${page.page+1}&allSize=${page.allSize}&MC=${MC}&BMBM=${BMBM}">></a></li>
											<li><a
												href="${path}/label/sel.do?page=${page.totalPage}&allSize=${page.allSize}&MC=${MC}&BMBM=${BMBM}">>></a></li>
											<li><a href="javascript:void(0);"
												onclick="xztz(this,'${page.allSize}','${path}','&MC=${MC}&BMBM=${BMBM}')">点击选择跳转</a></li>
										</ul>
									</div>
								<!--分页结束 -->
							</div>
						</div>
					</div>
					<!--/col-->
				</div>
			</div>
			<!-- end: Content -->
			<div id="usage">
			<label><img src="${path}assets/img/logo/GB.png">Copyright 北京际峰天翔信息技术有限公司</label>
	    	</div>
		</div>
		<!--/container-->


		<div class="clearfix"></div>


		<!-- start: JavaScript-->
		<!--[if !IE]>-->

		<script src="${path}/assets/js/jquery-2.1.1.min.js"></script>

		<!--<![endif]-->

		<!--[if IE]>
	
		<script src="${path}/assets/js/jquery-1.11.1.min.js"></script>
	
	<![endif]-->

		<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery
					|| document
							.write("<script src='${path}/assets/js/jquery-2.1.1.min.js'>"
									+ "<"+"/script>");
		</script>

		<!--<![endif]-->

		<!--[if IE]>
	
		<script type="text/javascript">
	 	window.jQuery || document.write("<script src='${path}/assets/js/jquery-1.11.1.min.js'>"+"<"+"/script>");
		</script>
		
	<![endif]-->
		<script src="${path}/assets/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="${path}/assets/js/bootstrap.min.js"></script>


		<!-- page scripts -->
		<script
			src="${path}/assets/plugins/jquery-ui/js/jquery-ui-1.10.4.min.js"></script>
		<script
			src="${path}/assets/plugins/datatables/js/jquery.dataTables.min.js"></script>
		<script
			src="${path}/assets/plugins/datatables/js/dataTables.bootstrap.min.js"></script>

		<!-- theme scripts -->
		<script src="${path}/assets/js/SmoothScroll.js"></script>
		<script src="${path}/assets/js/jquery.mmenu.min.js"></script>
		<script src="${path}/assets/js/core.min.js"></script>

		<!-- inline scripts related to this page -->
		<script src="${path}/assets/js/pages/table.js"></script>
		<script src="${path}/assets/js/bootstrap-datetimepicker.js"></script>
		<script src="${path}/assets/js/bootstrap-datetimepicker.zh-CN.js"></script>
		<script src="${path}/assets/js/bootstrapValidator.min.js"></script>
		<script src="${path}/assets/js/zh_CN.js"></script>

		<!-- end: JavaScript-->
</body>
<script type="text/javascript">
	function xztz(obj, allsize, ml, url) {
		var ys = prompt("请输入页数:");
		if (isNaN(ys)) {
			alert("请输入数字");
			return false;
		}
		if (ys != null && ys != "") {
			obj.href = ml + "/label/sel.do?page=" + ys + "&allSize=" + allsize
					+ url;
		}
	}
	function tjgx(id) {
		$("#upuser" + id).submit();
	}
	$(function() {
		$("#801").addClass("opened");
		$("#802").css('display', 'block');
	});
</script>
<%
	String msg = (String) request.getAttribute("msg");
	if (msg != null && msg.equals("1")) {
		out.print("<script type='text/javascript'>alert('上传文件超过限制');</script>");
	}
	if (msg != null && msg.equals("2")) {
		out.print("<script type='text/javascript'>alert('上传文件类型不匹配');</script>");
	}
%>
</html>