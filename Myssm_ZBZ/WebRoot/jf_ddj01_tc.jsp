<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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
		request.setAttribute("listddj01", request.getAttribute("listddj01"));
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
							<li><i class="fa fa-medkit"></i>专防组织管理</li>
							<li><i class="fa fa-sign-out"></i>退出</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>退出查询</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<form action="${path}tc/sel.do" class="navbar-form"
									style="padding: 0;" method="post">
									<div style="text-align: right;">
										<input type="text" name="MC" class="form-control"
											placeholder="请输入查询名称" value="${MC}">
										<button class="btn btn-info" type="submit">
											<i class="fa fa-search "></i> 查询
										</button>
										<a class="btn btn-success btn-setting" href="#"><i
											class="fa fa-search-plus "></i> 专访组织退出</a>
									</div>
								</form>
								<table
									class="table table-striped table-bordered bootstrap-datatable datatable">
									<thead>
										<tr>
											<th>No.</th>
											<th>退出时间</th>
											<th>专防组织</th>
											<th>录入人员</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<jf:forEach var="ddj01" items="${listddj01}">
											<tr>
												<td>${ddj01.RN}</td>
												<td><fmt:formatDate value="${ddj01.TC_LRRQ}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td>${ddj01.MC}</td>
												<td>${ddj01.TC_LRRY}</td>
												<td><a href="javascript:void(0);" class="btn btn-info "
													onclick="qxtj('${ddj01.JFID}')"> <i
														class="fa fa-search "></i> 查看
												</a></td>
											</tr>
											<form id="qxuser${ddj01.JFID}"
												action="${path}tc/gotolabel.do" method="post">
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
											href="${path}tc/sel.do?page=1&allSize=${page.allSize}&MC=${MC}"><<</a></li>
										<li><a
											href="${path}tc/sel.do?page=${page.page-1}&allSize=${page.allSize}&MC=${MC}"><</a></li>
										<li class="active"><a>${page.page}</a></li>
										<li><a
											href="${path}tc/sel.do?page=${page.page+1}&allSize=${page.allSize}&MC=${MC}">></a></li>
										<li><a
											href="${path}tc/sel.do?page=${page.totalPage}&allSize=${page.allSize}&MC=${MC}">>></a></li>
										<li><a href="javascript:void(0);"
											onclick="xztz(this,'${page.allSize}','${path}','&MC=${MC}')">点击选择跳转</a></li>
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
				<label><img src="${path}assets/img/logo/GB.png">Copyright
					北京际峰天翔信息技术有限公司</label>
			</div>
		</div>
		<!--/container-->

		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">专访组织退出信息</h4>
					</div>
					<form id="myfrom" action="${path}/tc/add.do" method="post"
						class="form-horizontal">
						<input id="Str" type="hidden">
						<div class="modal-body">
							<!-- 表单 -->
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h2>
												<i class="fa fa-indent red"></i><strong>专访组织退出</strong>
											</h2>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="col-md-3 control-label">选择专防组织 <i
													style="color: red">*</i></label>
												<div class="col-md-7">
													<input type="text" id="MC" name="MC"
														class="form-control" placeholder="请选择专访组织" value=""
														readonly="readonly"> <input type="hidden"
														id="JFID" name="JFID" />
												</div>
												<div class="col-md-2">
													<a class="btn btn-info" href="javascript:void(0);"
														onclick="jsryN()"> <i class="fa fa-search"></i>
													</a>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">退出说明<i
													style="color: red">*</i></label>
												<div class="col-md-9">
													<textarea id="textarea-input" name="TC_SM" rows="9"
														class="form-control" placeholder="说点什么。。。"></textarea>
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
							<button type="submit" class="btn btn-sm btn-success">
								<i class="fa fa-dot-circle-o"></i> 专防组织退出
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
	function jsryN() {
		window.showModalDialog("/Myssm_ZBZ/evaluate/selZFZZ.do?XXDBLB=3", 0,
				"dialogWidth=1000px;dialogHeight=700px;");
		var strs = $("#Str").val().split(",");
		$("#JFID").attr("value", strs[0]);
		$("#MC").attr("value", strs[1]);
		$("#Str").val("");
		$('#myfrom').data("bootstrapValidator").updateStatus("DDJ01_MC",
				"NOT_VALIDATED", null);
		$('#myfrom').data("bootstrapValidator").validateField('DDJ01_MC');
	}
	function xztz(obj, allsize, ml, url) {
		var ys = prompt("请输入页数:");
		if (isNaN(ys)) {
			alert("请输入数字");
			return false;
		}
		if (ys != null && ys != "") {
			obj.href = ml + "tc/sel.do?page=" + ys + "&allSize=" + allsize
					+ url;
		}
	}
	function qxtj(id) {
		$("#qxuser" + id).submit();
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
				DDJ01_MC : {
					validators : {
						notEmpty : {
							message : '请选择专访组织'
						}
					}
				},
				TC_SM : {
					validators : {
						notEmpty : {
							message : '退出说明不能为空'
						}
					}
				}
			}
		});
		$("#101").addClass("opened");
		$("#102").css('display', 'block');
	});
</script>
</html>