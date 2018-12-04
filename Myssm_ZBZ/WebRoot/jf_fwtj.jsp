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
		request.setAttribute("listdfw01", request.getAttribute("listdfw01"));
		request.setAttribute("idsfh", request.getAttribute("idsfh"));
		request.setAttribute("FZFZR", request.getAttribute("FZFZR"));
		request.setAttribute("DDJ02_JFID",
				request.getAttribute("DDJ02_JFID"));
		request.setAttribute("StarTime", request.getAttribute("StarTime"));
		request.setAttribute("EndTime", request.getAttribute("EndTime"));
		request.setAttribute("FWNRLB", request.getAttribute("FWNRLB"));
		request.setAttribute("vals", request.getAttribute("vals"));
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
							<li><i class="fa fa-heart"></i>服务统计</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>服务统计</strong>
								</h2>
								<div class="panel-actions">
									<a href="table.html#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<table
									class="table table-striped table-bordered bootstrap-datatable datatable">
									<thead>
										<tr>
											<th>单号</th>
											<th>专访组织</th>
											<th>服务内容</th>
											<th>用户名</th>
											<th>防治面积</th>
											<th>收费金额</th>
											<th>派单时间</th>
											<th>完工时间</th>
										</tr>
									</thead>
									<tbody>
										<jf:forEach var="dfw01" items="${listdfw01}">
											<tr>
												<td><a href="${path}gdcx/gotolabel.do?id=${dfw01.JFID}">${dfw01.JFID}</a></td>
												<td>${dfw01.DDJ01_MC}</td>
												<td>${dfw01.FWNRLB}</td>
												<td>${dfw01.DDJ02_MC}</td>
												<td>${dfw01.FZMJ}</td>
												<td>${dfw01.SFJE}</td>
												<td><fmt:formatDate value="${dfw01.PDRQ}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td><fmt:formatDate value="${dfw01.WCRQ}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
											</tr>
										</jf:forEach>
									</tbody>
								</table>
								<!-- 分页 -->
								<div style="text-align:center;">
									<ul class="pagination">
										<li><a>共${page.totalPage}页</a></li>
										<li><a
											href="${path}/fwtj/djtj.do?page=1&allSize=${page.allSize}&idsfh=${idsfh}&FZFZR=${FZFZR}&DDJ02_JFID=${DDJ02_JFID}&StarTime=${StarTime}&EndTime=${EndTime}&FWNRLB=${FWNRLB}&vals=${vals}"><<</a></li>
										<li><a
											href="${path}/fwtj/djtj.do?page=${page.page-1}&allSize=${page.allSize}&idsfh=${idsfh}&FZFZR=${FZFZR}&DDJ02_JFID=${DDJ02_JFID}&StarTime=${StarTime}&EndTime=${EndTime}&FWNRLB=${FWNRLB}&vals=${vals}"><</a></li>
										<li class="active"><a>${page.page}</a></li>
										<li><a
											href="${path}/fwtj/djtj.do?page=${page.page+1}&allSize=${page.allSize}&idsfh=${idsfh}&FZFZR=${FZFZR}&DDJ02_JFID=${DDJ02_JFID}&StarTime=${StarTime}&EndTime=${EndTime}&FWNRLB=${FWNRLB}&vals=${vals}">></a></li>
										<li><a
											href="${path}/fwtj/djtj.do?page=${page.totalPage}&allSize=${page.allSize}&idsfh=${idsfh}&FZFZR=${FZFZR}&DDJ02_JFID=${DDJ02_JFID}&StarTime=${StarTime}&EndTime=${EndTime}&FWNRLB=${FWNRLB}&vals=${vals}">>></a></li>
										<li><a href="javascript:void(0);"
											onclick="xztz(this,'${page.allSize}','${path}','&idsfh=${idsfh}&FZFZR=${FZFZR}&DDJ02_JFID=${DDJ02_JFID}&StarTime=${StarTime}&EndTime=${EndTime}&FWNRLB=${FWNRLB}&vals=${vals}')">点击选择跳转</a></li>
									</ul>
								</div>
								<!--分页结束 -->
								<div style="text-align:center;">
									<a class="btn btn-sm btn-danger" data-dismiss="modal"
										href="javascript:history.go(-1);"> <i class="fa fa-ban"></i>
										返回
									</a>
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

		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">输入手机号</h4>
					</div>
					<form id="elofrom" action="${path}yhgl/cxtz.do" method="post"
						class="form-horizontal">
						<input id="JFID" type="hidden" name="JFID" value="">
						<div class="modal-body">
							<!-- 表单 -->
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h2>
												<i class="fa fa-indent red"></i><strong>请输入手机号</strong>
											</h2>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="col-md-3 control-label" >手机号
													<i style="color: red">*</i>
												</label>
												<div class=" col-md-9">
													<input type="text" id="password-input" name="YHM"
														class="form-control" placeholder="请输入手机号"
														autofocus="autofocus">
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
								<i class="fa fa-dot-circle-o"></i> 确定
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
	function xztz(obj, allsize, ml, url) {
		var ys = prompt("请输入页数:");
		if (isNaN(ys)) {
			alert("请输入数字");
			return false;
		}
		if (ys != null && ys != "") {
			obj.href = ml + "/fwtj/djtj.do?page=" + ys + "&allSize=" + allsize
					+ url;
		}
	}
	function tjgx(id) {
		$("#upuser" + id).submit();
	}
	function deluser(id) {
		if (confirm("你确定要删除吗？")) {
			$("#deluser" + id).submit();
		}
	}
	$(function() {
		$('#elofrom').bootstrapValidator({
			message : 'This value is not valid',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				YHM : {
					validators : {
						stringLength : {
							min : 11,
							max : 11,
							message : '请输入11位手机号码'
						},
						regexp : {
							regexp : /^1[3|5|8]{1}[0-9]{9}$/,
							message : '请输入正确的手机号码'
						}
					}
				}
			}
		});
		$("#801").addClass("opened");
		$("#802").css('display', 'block');
	});
</script>
</html>