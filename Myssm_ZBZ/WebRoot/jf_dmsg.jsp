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
		request.setAttribute("listdmsg", request.getAttribute("listdmsg"));
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
								<ul class="comments-list">
									<jf:forEach var="dmsg" items="${listdmsg}">
										<li><a
											href="${path}onlin/msginfo.do?list=${dmsg.list}&SZ_LB=${dmsg.SZ_LB}&SZ_JFID=${dmsg.SZ_JFID}&SZ_MC=${dmsg.SZ_MC}&SZ_TX_LJ=${dmsg.SZ_TX_LJ}&DF_LB=${dmsg.DF_LB}&DF_JFID=${dmsg.DF_JFID}&DF_MC=${dmsg.DF_MC}&DF_TX_LJ=${dmsg.DF_TX_LJ}"><img
												class="avatar" alt="Lucas"
												src="${path}${dmsg.DF_TX_LJ}"> </a> <a
											href="${path}onlin/msginfo.do?list=${dmsg.list}&SZ_LB=${dmsg.SZ_LB}&SZ_JFID=${dmsg.SZ_JFID}&SZ_MC=${dmsg.SZ_MC}&SZ_TX_LJ=${dmsg.SZ_TX_LJ}&DF_LB=${dmsg.DF_LB}&DF_JFID=${dmsg.DF_JFID}&DF_MC=${dmsg.DF_MC}&DF_TX_LJ=${dmsg.DF_TX_LJ}">
												<div>
													<strong>${dmsg.DF_MC}</strong>
													<jf:if test="${dmsg.FX==0}">
													<i class="fa fa-arrow-right"></i>
													</jf:if> 
													<jf:if test="${dmsg.FX==1}">
													<i class="fa fa-arrow-left"></i>
													</jf:if> 
													 ${dmsg.NR}
												</div>
												<div class="date">${dmsg.FS_RQ}
													<div class="dropdown pull-right">
														<label class="fa fa-comments black" data-toggle="dropdown"
															href="javascript:void(0);"></label>
													</div>
												</div>
												<div class="like-comment">
													<jf:if test="${dmsg.JLS_WEB!=0}">
														<label><span class="label label-danger">${dmsg.JLS_WEB}</span></label>
														<small> 新消息</small>
													</jf:if>
													<jf:if test="${dmsg.JLS_WEB==0}">
														<label></label>
														<small></small>
													</jf:if>
												</div>
										</a></li>
									</jf:forEach>
								</ul>
								<div style="text-align: right;">
									<a class="btn btn-success btn-setting" href="#"><i
										class="fa fa-envelope-o"></i> 发送消息</a>
								</div>
								<!-- 分页 -->
								<div style="text-align:center;">
									<ul class="pagination">
										<li><a>共${page.totalPage}页</a></li>
										<li><a
											href="${path}/onlin/sel.do?page=1&allSize=${page.allSize}"><<</a></li>
										<li><a
											href="${path}/onlin/sel.do?page=${page.page-1}&allSize=${page.allSize}"><</a></li>
										<li class="active"><a>${page.page}</a></li>
										<li><a
											href="${path}/onlin/sel.do?page=${page.page+1}&allSize=${page.allSize}">></a></li>
										<li><a
											href="${path}/onlin/sel.do?page=${page.totalPage}&allSize=${page.allSize}">>></a></li>
										<li><a href="javascript:void(0);"
											onclick="xztz(this,'${page.allSize}','${path}')">点击选择跳转</a></li>
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


		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">在线指导</h4>
					</div>
					<form id="myfrom" action="${path}/onlin/addmsg.do" method="post"
						class="form-horizontal"
						enctype="application/x-www-form-urlencoded">
						<input id="Str" type="hidden" value=""> <input
							type="hidden" id="DF_LB" name="DF_LB" value=""> <input
							type="hidden" id="DF_JFID" name="DF_JFID" value=""> <input
							type="hidden" id="DF_TX_LJ" name="DF_TX_LJ" value=""> 
						<div class="modal-body">
							<!-- 表单 -->
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h2>
												<i class="fa fa-indent red"></i><strong>在线指导</strong>
											</h2>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="col-md-3 control-label">接收人员类别</label>
												<div class="col-md-9">
													<select id="RYFL" name="RYFL" class="form-control">
														<option value="0">植保站</option>
														<option value="1">植保站人员</option>
														<option value="3">专访组织</option>
														<option value="4">专访组织人员</option>
														<option selected="selected" value="6">农户</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">接收人员</label>
												<div class="col-md-7">
													<input type="text" id="DF_MC" name="DF_MC"
														class="form-control" placeholder="请选择接收人员" value=""
														readonly="readonly">
												</div>
												<div class="col-md-2">
													<a class="btn btn-info" href="javascript:void(0);"
														onclick="jsry('${sessionScope.user.XXDBLB}','${sessionScope.user.JFID}')">
														<i class="fa fa-search"></i>
													</a>
												</div>
											</div>
											<div id="NR" class="form-group">
												<label class="col-md-3 control-label">内容</label>
												<div class="col-md-9">
													<textarea id="textarea-input" name="NR" rows="3"
														class="form-control" placeholder="说点什么。。。"></textarea>
												</div>
											</div>
											<div id="TB_MC" class="form-group" style="display: none;">
												<label class="col-md-3 control-label">上传图片</label>
												<div class="col-md-9">
													<input type="file" id="file-input" name="fileinput"
														onchange="xgfrom()">
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--表单结束-->
							</div>
						</div>
						<div class="modal-footer">
							<a class="btn btn-sm btn-info" href="javascript:void(0);"
								onclick="sctp()"> <i class="fa fa-rotate-left"></i> 图片/文本
							</a>
							<button type="submit" class="btn btn-sm btn-success">
								<i class="fa fa-dot-circle-o"></i> 发送
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
	function xgfrom() {
		$("#myfrom").attr("enctype", "multipart/form-data");
	}
	function jsry(userlb, userid) {
		if ($("#RYFL option:selected").val() == 6) {
			window.showModalDialog("/Myssm_ZBZ/onlin/selNH.do", 0,
					"dialogWidth=1000px;dialogHeight=700px;");
			var strs = $("#Str").val().split(",");
			$("#DF_JFID").attr("value", strs[0]);
			$("#DF_MC").attr("value", strs[1]);
			$("#DF_LB").attr("value", "6");
			$("#DF_TX_LJ").attr("value", strs[2]);
			$("#Str").val("");
		}
		if ($("#RYFL option:selected").val() == 3) {
			window.showModalDialog("/Myssm_ZBZ/onlin/selZFZZ.do?XXDBLB="
					+ $("#RYFL option:selected").val() + "&JFID=" + userid, 0,
					"dialogWidth=1000px;dialogHeight=700px;");
			var strs = $("#Str").val().split(",");
			$("#DF_JFID").attr("value", strs[0]);
			$("#DF_MC").attr("value", strs[1]);
			$("#DF_LB").attr("value", strs[2]);
			$("#DF_TX_LJ").attr("value", strs[3]);
			$("#Str").val("");
		}
		if ($("#RYFL option:selected").val() == 4) {
			window.showModalDialog("/Myssm_ZBZ/onlin/selZFZZandRY.do?XXDBLB="
					+ $("#RYFL option:selected").val() + "&JFID=" + userid, 0,
					"dialogWidth=1000px;dialogHeight=700px;");
			var strs = $("#Str").val().split(",");
			$("#DF_JFID").attr("value", strs[0]);
			$("#DF_MC").attr("value", strs[1]);
			$("#DF_LB").attr("value", strs[2]);
			$("#DF_TX_LJ").attr("value", strs[3]);
			$("#Str").val("");
		}
		if ($("#RYFL option:selected").val() == 1) {
			window.showModalDialog("/Myssm_ZBZ/onlin/selZBZandRY.do?XXDBLB="
					+ $("#RYFL option:selected").val(), 0,
					"dialogWidth=1000px;dialogHeight=700px;");
			var strs = $("#Str").val().split(",");
			$("#DF_JFID").attr("value", strs[0]);
			$("#DF_MC").attr("value", strs[1]);
			$("#DF_LB").attr("value", strs[2]);
			$("#DF_TX_LJ").attr("value", strs[3]);
			$("#Str").val("");
		}
		if ($("#RYFL option:selected").val() == 0) {
			window.showModalDialog("/Myssm_ZBZ/onlin/selZBZandRY.do?XXDBLB="
					+ $("#RYFL option:selected").val(), 0,
					"dialogWidth=1000px;dialogHeight=400px;");
			var strs = $("#Str").val().split(",");
			$("#DF_JFID").attr("value", strs[0]);
			$("#DF_MC").attr("value", strs[1]);
			$("#DF_LB").attr("value", strs[2]);
			$("#DF_TX_LJ").attr("value", strs[3]);
			$("#Str").val("");
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
				DF_MC : {
					validators : {
						notEmpty : {
							message : '请选择人员'
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
		$("#201").addClass("opened");
		$("#202").css('display', 'block');
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