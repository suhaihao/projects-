<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.ssh.user.model.User"%>
<%@page import="com.ssh.user.util.EHCache"%>
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
<html>
<head>
<meta charset="GBK">
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
		request.setAttribute("dsys11", request.getAttribute("dsys11"));
		request.setAttribute("dsys11", request.getAttribute("dsys11"));
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
							<li><i class="fa fa-bug"></i>代码管理</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>代码修改</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<!-- 表单 -->
								<form id="myfrom" action="${path}/dmgl/update.do" method="post"
									class="form-horizontal">
									<input type="hidden" name="JFID" value="${dsys11.JFID}">
									<div class="form-group">
										<label class="col-md-3 control-label">编码<i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="BM"
												class="form-control" placeholder="请输入编码"
												value="${dsys11.BM}" onblur="yzbm(this,'${dsys11.BMLB}')">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">汉字名称 <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="HZMC"
												class="form-control" placeholder="请输入名称"
												value="${dsys11.HZMC}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">标志位一</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="BZ1"
												class="form-control" placeholder="请输入标志位一"
												value="${dsys11.BZ1}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">标志位二</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="BZ2"
												class="form-control" placeholder="请输入标志位二"
												value="${dsys11.BZ2}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">标志位三</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="BZ3"
												class="form-control" placeholder="请输入标志位三"
												value="${dsys11.BZ3}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">标志位四</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="BZ4"
												class="form-control" placeholder="请输入标志位四"
												value="${dsys11.BZ4}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">标志位五</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="BZ5"
												class="form-control" placeholder="请输入标志位五"
												value="${dsys11.BZ5}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">标志位六</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="BZ6"
												class="form-control" placeholder="请输入标志位六"
												value="${dsys11.BZ6}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">备注</label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="BZ" rows="9"
												class="form-control" placeholder="说点什么。。。">${dsys11.BZ}</textarea>
										</div>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-sm btn-success">
											<i class="fa fa-dot-circle-o"></i> 提交
										</button>
										<a class="btn btn-sm btn-danger" data-dismiss="modal"
											href="${path}dmgl/gotodsys11.do?BMLB=${dsys11.BMLB}"> <i
											class="fa fa-ban"></i> 返回
										</a>
									</div>
								</form>
								<!-- 表单结束 -->
								<form id="upuser" action="${path}/preven/sel.do"></form>
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
	function yzbm(obj, bmlb) {
		var value = obj.value;
		$.ajax({
			type : "post",
			url : "/Myssm_ZBZ/dmgl/yzbm.do",
			data : {
				BM : value,
				BMLB : bmlb
			},
			dataType : "json",
			async : false,
			error : function(XMLResponse) {
			},
			success : function(data) {
				if (data.data == 1) {
					alert("用户名重复请从新输入");
					obj.value = "";
					$("#myfrom").data("bootstrapValidator").updateStatus("BM",
							"NOT_VALIDATED", null);
					$.obj.focus();
				}
			}
		});
	}
	$(function() {
		$('#myfrom').bootstrapValidator({
			message : 'This value is not valid',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				BM : {
					validators : {
						notEmpty : {
							message : '编码不能为空'
						},
						regexp : {
							regexp : /^[0-9]+$/,
							message : '只能输入数字'
						}
					}
				},
				HZMC : {
					validators : {
						notEmpty : {
							message : '名称不能为空'
						}
					}
				}
			}
		});
		$("#901").addClass("opened");
		$("#902").css('display', 'block');
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
	if (msg != null && !msg.equals("1") && !msg.equals("2")) {
		out.print("<script type='text/javascript'>alert('" + msg
				+ "');</script>");
	}
%>
</html>