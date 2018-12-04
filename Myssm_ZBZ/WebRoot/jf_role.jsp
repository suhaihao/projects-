<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.ssh.user.model.Dsys02_zfzz"%>
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
		request.setAttribute("lisrole", request.getAttribute("lisrole"));
		request.setAttribute("listAllmenu",
				request.getAttribute("listAllmenu"));
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
							<li><i class="fa fa-cogs"></i>系统管理</li>
							<li><i class="fa fa-user"></i>角色管理</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>角色管理</strong>
								</h2>
								<div class="panel-actions">
									<a href="table.html#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<form action="${path}yhgl/sel.do" class="navbar-form"
									style="padding: 0;" method="post">
									<div style="text-align: right;">
										<a class="btn btn-success" href="${path}jf_role_add.jsp"><i
											class="fa fa-search-plus "></i> 添加角色 </a>
									</div>
								</form>
								<table
									class="table table-striped table-bordered bootstrap-datatable datatable">
									<thead>
										<tr>
											<th>编码</th>
											<th>类别</th>
											<th>角色名称</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<jf:forEach var="rol" items="${lisrole}">
											<tr>
												<td>${rol.ROLE_BM}</td>
												<td>${rol.ROLE_BMLB}</td>
												<td>${rol.ROLE_NAME}</td>
												<td><a class="btn btn-success btn-setting" href="#"
													onclick="fz('${rol.JFID}')"> <i
														class="fa fa-search-plus "></i> 权限
												</a> <a class="btn btn-info" href="${path}role/gotoup.do?JFID=${rol.JFID}"> <i class="fa fa-edit "></i>
														修改
												</a></td>
											</tr>
										</jf:forEach>
									</tbody>
								</table>
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

		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">选择角色权限</h4>
					</div>
					<form id="myfrom" action="${path}/role/addqx.do" method="post"
						class="form-horizontal">
						<input id="ids" name="ids" type="hidden"> <input
							id="father" name="father" type="hidden">
						<div class="modal-body">
							<!-- 表单 -->
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h2>
												<i class="fa fa-indent red"></i><strong>选择权限</strong>
											</h2>
										</div>
										<div class="panel-body">

											<div class="form-group">
												<label class="col-md-3 control-label">模块选择</label>
												<div class="col-md-9">
													<jf:forEach var="menu" items="${listAllmenu}">
														<div class="checkbox">
															<label for="${menu.ITEM_ID}"> <jf:if
																	test="${fn:length(menu.ITEM_ID)==4}">
																	<input style="margin-left: 3px;" type="checkbox"
																		id="${menu.ITEM_ID}" name="checkboxs"
																		value="${menu.JFID}"
																		onclick="chakclick('${menu.ITEM_ID}',this)">
															${menu.ITEM_NAME}
															</jf:if> <jf:if test="${fn:length(menu.ITEM_ID)==2}">
																	<input type="checkbox" id="${menu.ITEM_ID}"
																		name="checkboxs" value="${menu.JFID}"
																		onclick="chakclick('${menu.ITEM_ID}',this)">
															${menu.ITEM_NAME}
															</jf:if>
															</label>
														</div>
													</jf:forEach>
												</div>
											</div>
											<br>
										</div>
									</div>
								</div>
								<!--表单结束-->
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-sm btn-success"
								onclick="subfrom()">
								<i class="fa fa-dot-circle-o"></i> 提交
							</button>
							<button type="reset" class="btn btn-sm btn-danger"
								data-dismiss="modal">
								<i class="fa fa-ban"></i> 关闭
							</button>
						</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

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
	$(function() {
		$("#901").addClass("opened");
		$("#902").css('display', 'block');
	});
	function fz(id) {
		var cks = $('input[name="checkboxs"]');
		$.ajax({
			type : "post",
			url : "/Myssm_ZBZ/role/selqx.do",
			data : {
				id : id
			},
			dataType : "text",
			async : false,
			error : function(XMLResponse) {
			},
			success : function(data) {
				$(cks).each(function() {
					$("#" + this.id).attr("checked", null);
				});
				if (data != null && data != "") {
					var valsz = data.split(",");
					for (var i = 0; i < valsz.length - 1; i++) {
						$(cks).each(function() {
							if (this.value == valsz[i]) {
								$("#" + this.id).attr("checked", "checked");
							}
						});
					}
				}
			}
		});
		$("#father").attr("value", id);
	}
	function chakclick(id, obj) {
		var cks = $('input[name="checkboxs"]');
		$(cks).each(
				function() {
					if (this.id != id) {
						if (this.id.substring(0, 2) == id) {
							if (obj.checked) {
								$("#" + this.id).attr("checked", "checked");
							} else {
								$("#" + this.id).attr("checked", null);
							}
						}
						;
					}
					if (id.length != 2) {
						$("#" + id.substring(0, id.length - 2)).attr("checked",
								"checked");
					}
				});
	}
	function subfrom() {
		var ids = "";
		var cks = $('input[name="checkboxs"]');
		$(cks).each(function() {
			if (this.checked) {
				ids = ids + this.value + ",";
			}
		});
		$("#ids").attr("value", ids);
		alert("保存成功");
		$("#myfrom").submit();
	}
</script>
</html>