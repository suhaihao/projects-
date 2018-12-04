<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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
		request.setAttribute("listnr", request.getAttribute("listnr"));
		request.setAttribute("SZ_MC", request.getAttribute("SZ_MC"));
		request.setAttribute("DF_MC", request.getAttribute("DF_MC"));
		request.setAttribute("SZ_TX_LJ", request.getAttribute("SZ_TX_LJ"));
		request.setAttribute("DF_TX_LJ", request.getAttribute("DF_TX_LJ"));
		request.setAttribute("DF_LB", request.getAttribute("DF_LB"));
		request.setAttribute("DF_JFID", request.getAttribute("DF_JFID"));
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
							<li><i class="fa fa-heart"></i>技术服务</li>
							<li><i class="fa fa-comments"></i>在线指导</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-life-bouy red"></i><span class="break"></span><strong>在线指导</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body no-padding">
								<jf:forEach var="nr" items="${listnr}">
									<div class="panel-footer">
										<jf:if test="${nr.FX==1}">
											<div class="media">
												<a class="pull-left" href="javascript:void(0)">
												    <jf:if
														test="${not empty DF_TX_LJ}">
														<img class="media-object img-rounded"
															src="${path}${DF_TX_LJ}"
															style="width:40px;height: 40px;">
													</jf:if>
												    <jf:if
														test="${empty DF_TX_LJ}">
														<img class="media-object img-rounded"
															src="${path}assets/img/head/1.png"
															style="width:40px;height: 40px;">
													</jf:if>
												</a>
												<div class="media-body">
													<div class="pull-right small">${nr.FS_RQ}</div>
													<a href="javascript:void(0)" class="pull-left">
														<div class="media-heading">
															<strong>${DF_MC}:</strong>
														</div>
													</a>
													<jf:if test="${not empty nr.NR}">
														<p>${nr.NR}</p>
													</jf:if>
													<jf:if test="${not empty nr.TB_DZ}">
														<a href="${path}${nr.TB_DZ}" target="_blank"><img
															class="media-object pull-left img-rounded"
															src="${path}${nr.TB_DZ}"
															style="width:100px;height: 100px;"></a>
													</jf:if>
												</div>
											</div>
										</jf:if>
										<jf:if test="${nr.FX==0}">
											<div class="media">
												<a class="pull-right" href="javascript:void(0)">
												    <jf:if
														test="${not empty SZ_TX_LJ}">
														<img class="media-object img-rounded"
															src="${path}${SZ_TX_LJ}"
															style="width:40px;height: 40px;">
													</jf:if>
													<jf:if
														test="${empty SZ_TX_LJ}">
														<img class="media-object img-rounded"
															src="${path}assets/img/head/1.png"
															style="width:40px;height: 40px;">
													</jf:if>
												</a>
												<div class="media-body">
													<div class="pull-left small">${nr.FS_RQ}</div>
													<a href="javascript:void(0)" class="pull-right">
														<div class="media-heading">
															<strong>:${SZ_MC}</strong>
														</div>
													</a>
													<div class="pull-right">
														<jf:if test="${not empty nr.NR}">
															<p>${nr.NR}</p>
														</jf:if>
														<jf:if test="${not empty nr.TB_DZ}">
															<a href="${path}${nr.TB_DZ}" target="_blank"><img
																class="media-object pull-right img-rounded"
																src="${path}${nr.TB_DZ}"
																style="width:100px;height: 100px;"></a>
														</jf:if>
													</div>
												</div>
											</div>
										</jf:if>
									</div>
								</jf:forEach>
								<div class="panel-body">
									<form id="myfrom" class="form-horizontal"
										action="${path}onlin/msginfoadd.do" method="post"
										enctype="application/x-www-form-urlencoded">
										<div class="form-group">
											<input id="NR" name="NR" type="text" class="form-control"
												placeholder="说点什么。。。。">
										</div>
										<div id="TB_MC" class="form-group" style="display: none;">
											<input type="file" id="fileinput" name="fileinput"
												onchange="xgfrom()" style="border: 0px;">
										</div>
										<input type="hidden" name="DF_LB" value="${DF_LB}"> <input
											type="hidden" name="DF_JFID" value="${DF_JFID}"> <input
											type="hidden" name="DF_MC" value="${DF_MC}"> <input
											type="hidden" name="DF_TX_LJ" value="${DF_TX_LJ}">
										<div style="text-align: right;margin-top: 5px;">
											<a class="btn btn-sm btn-info" href="javascript:void(0);"
												onclick="sctp()"> <i class="fa fa-rotate-left"></i> 图片/文本
											</a>
											<button type="submit" class="btn btn-sm btn-success">
												<i class="fa fa-dot-circle-o"></i> 发送
											</button>
											<a href="${path}onlin/sel.do" type="reset"
												class="btn btn-sm btn-danger" data-dismiss="modal"> <i
												class="fa fa-ban"></i> 关闭
											</a>
										</div>
									</form>
								</div>
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
	function xgfrom() {
		$("#myfrom").attr("enctype", "multipart/form-data");
	}
	function jsry(userlb, userid) {
		if ($("#RYFL option:selected").val() == 6) {
			var returnvl = window.showModalDialog("/Myssm/onlin/selNH.do", 0,
					"dialogWidth=800px;dialogHeight=auto;height=auto");
			var strs = returnvl.split(",");
			$("#DF_JFID").attr("value", strs[0]);
			$("#DF_MC").attr("value", strs[1]);
			$("#DF_LB").attr("value", "6");
			$("#DF_TX_LJ").attr("value", strs[2]);
		}
		if ($("#RYFL option:selected").val() == 4
				|| $("#RYFL option:selected").val() == 3) {
			if (userlb == $("#RYFL option:selected").val()) {
				var returnvl = window.showModalDialog(
						"/Myssm/onlin/selZFZZandRY.do?XXDBLB=" + userlb
								+ "&JFID=" + userid, 0,
						"dialogWidth=800px;dialogHeight=auto;height=auto");
				var strs = returnvl.split(",");
				$("#DF_JFID").attr("value", strs[0]);
				$("#DF_MC").attr("value", strs[1]);
				$("#DF_LB").attr("value", strs[2]);
				$("#DF_TX_LJ").attr("value", strs[3]);
			} else {
				var returnvl = window.showModalDialog(
						"/Myssm/onlin/selZFZZandRY.do?XXDBLB="
								+ $("#RYFL option:selected").val(), 0,
						"dialogWidth=800px;dialogHeight=auto;height=auto");
				var strs = returnvl.split(",");
				$("#DF_JFID").attr("value", strs[0]);
				$("#DF_MC").attr("value", strs[1]);
				$("#DF_LB").attr("value", strs[2]);
				$("#DF_TX_LJ").attr("value", strs[3]);
			}
		}
	}
	function sctp() {
		var display = $("#NR").css('display');
		if (display == 'none') {
			$("#NR").css('display', '');
			$("#TB_MC").css('display', 'none');
		} else {
			$("#NR").css('display', 'none');
			$("#TB_MC").css('display', '');
		}
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
				NR : {
					validators : {
						notEmpty : {
							message : '内容不能为空'
						}
					}
				},
				fileinput : {
					validators : {
						notEmpty : {
							message : '请选择图片'
						}
					}
				}
			}
		});
		$("#301").addClass("opened");
		$("#302").css('display', 'block');
	});
	function xztz(obj, allsize, ml) {
		var ys = prompt("请输入页数:");
		if (isNaN(ys)) {
			alert("请输入数字");
			return false;
		}
		if (ys != null && ys != "") {
			obj.href = ml + "/onlin/sel.do?page=" + ys + "&allSize=" + allsize;
		}
	}
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