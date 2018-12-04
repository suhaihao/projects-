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
		request.setAttribute("DDJ01_JFID",
				request.getAttribute("DDJ01_JFID"));
		request.setAttribute("DDJ01_MC", request.getAttribute("DDJ01_MC"));
		request.setAttribute("listddj01_jl",
				request.getAttribute("listddj01_jl"));
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
							<li><i class="fa fa-gift"></i>奖励</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>奖励查询</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<form action="${path}jl/sel.do" class="navbar-form"
									style="padding: 0;" method="post">
									<input id="Str" type="hidden"> <input id="DDJ01_JFID"
										name="DDJ01_JFID" type="hidden" value="${DDJ01_JFID}">
									<div style="text-align: right;">
										<label>专防组织：</label> <input type="text" id="DDJ01_MC"
											name="DDJ01_MC" class="form-control" placeholder="请选择专防组织"
											onchange="xgzfzz(this)" value="${DDJ01_MC}"> <a
											class="btn btn-info" href="javascript:void(0);"
											onclick="jsry()"> <i class="fa fa-search"></i> 选择组织
										</a>
										<button class="btn btn-info" type="submit">
											<i class="fa fa-search "></i> 查询
										</button>
										<a class="btn btn-success btn-setting" href="#"><i
											class="fa fa-search-plus "></i> 奖励 </a>
									</div>
								</form>
								<table
									class="table table-striped table-bordered bootstrap-datatable datatable">
									<thead>
										<tr>
											<th>No.</th>
											<th>时间</th>
											<th>专防组织</th>
											<th>奖励</th>
											<th>录入人员</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<jf:forEach var="ddj01_jl" items="${listddj01_jl}">
											<tr>
												<td>${ddj01_jl.RN}</td>
												<td><fmt:formatDate value="${ddj01_jl.LRRQ}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td>${ddj01_jl.DDJ01_MC}</td>
												<td>${ddj01_jl.JL}</td>
												<td>${ddj01_jl.LRRY}</td>
												<jf:if test="${ddj01_jl.ZT==0}">
													<td><a class="btn btn-info" href="javascript:void(0);"
														onclick="tjgx('${ddj01_jl.JFID}')"> <i
															class="fa fa-edit "></i>
													</a> <a class="btn btn-danger" href="javascript:void(0);"
														onclick="deluser('${ddj01_jl.JFID}')"> <i
															class="fa fa-trash-o "></i>
													</a></td>
												</jf:if>
												<jf:if test="${ddj01_jl.ZT==1}">
													<td><a href="javascript:void(0);"
														class="btn btn-info " onclick="qxtj('${ddj01_jl.JFID}')">
															<i class="fa fa-search "></i> 查看
													</a></td>
												</jf:if>
											</tr>
											<form id="qxuser${ddj01_jl.JFID}"
												action="${path}jl/gotolabel.do" method="post">
												<input type="hidden" name="JFID" value="${ddj01_jl.JFID}" />
											</form>
											<form id="upuser${ddj01_jl.JFID}"
												action="${path}jl/gotoup.do" method="post">
												<input type="hidden" name="JFID" value="${ddj01_jl.JFID}" />
											</form>
											<form id="deluser${ddj01_jl.JFID}" action="${path}jl/del.do"
												method="post">
												<input type="hidden" name="JFID" value="${ddj01_jl.JFID}" />
											</form>
										</jf:forEach>
									</tbody>
								</table>
								<!-- 分页 -->
								<div style="text-align:center;">
									<ul class="pagination">
										<li><a>共${page.totalPage}页</a></li>
										<li><a
											href="${path}jl/sel.do?page=1&allSize=${page.allSize}&DDJ01_JFID=${DDJ01_JFID}&DDJ01_MC=${DDJ01_MC}"><<</a></li>
										<li><a
											href="${path}jl/sel.do?page=${page.page-1}&allSize=${page.allSize}&DDJ01_JFID=${DDJ01_JFID}&DDJ01_MC=${DDJ01_MC}"><</a></li>
										<li class="active"><a>${page.page}</a></li>
										<li><a
											href="${path}jl/sel.do?page=${page.page+1}&allSize=${page.allSize}&DDJ01_JFID=${DDJ01_JFID}&DDJ01_MC=${DDJ01_MC}">></a></li>
										<li><a
											href="${path}jl/sel.do?page=${page.totalPage}&allSize=${page.allSize}&DDJ01_JFID=${DDJ01_JFID}&DDJ01_MC=${DDJ01_MC}">>></a></li>
										<li><a href="javascript:void(0);"
											onclick="xztz(this,'${page.allSize}','${path}','&DDJ01_JFID=${DDJ01_JFID}&DDJ01_MC=${DDJ01_MC}')">点击选择跳转</a></li>
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
						<h4 class="modal-title">添加评级信息</h4>
					</div>
					<form id="myfrom" action="${path}/jl/add.do" method="post"
						class="form-horizontal">
						<input id="ZT" name="ZT" type="hidden" value="0">
						<div class="modal-body">
							<!-- 表单 -->
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h2>
												<i class="fa fa-indent red"></i><strong>评级信息</strong>
											</h2>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="col-md-3 control-label">选择专防组织 <i
													style="color: red">*</i></label>
												<div class="col-md-7">
													<input type="text" id="DDJ01_MCN" name="DDJ01_MC"
														class="form-control" placeholder="请选择专访组织" value=""
														readonly="readonly"> <input type="hidden"
														id="DDJ01_JFIDN" name="DDJ01_JFID" />
												</div>
												<div class="col-md-2">
													<a class="btn btn-info" href="javascript:void(0);"
														onclick="jsryN()"> <i class="fa fa-search"></i>
													</a>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">奖励 <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" name="JL"
														class="form-control" placeholder="请输入奖励名称" value="">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">奖励说明</label>
												<div class="col-md-9">
													<textarea id="textarea-input" name="JL_SM" rows="9"
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
							<button type="submit" class="btn btn-sm btn-success"
								onclick="sub(1)">
								<i class="fa fa-dot-circle-o"></i> 提交
							</button>
							<button type="submit" class="btn btn-sm btn-info"
								onclick="sub(0)">
								<i class="fa fa-dot-circle-o"></i> 保存
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
	function sub(zt) {
		$("#ZT").val(zt);
	}
	function xgzfzz(obj) {
		if (obj.value == "") {
			$("#DDJ01_JFID").val("");
		}
	}
	function jsry() {
		window.showModalDialog("/Myssm_ZBZ/evaluate/selZFZZ.do?XXDBLB=3", 0,
				"dialogWidth=1000px;dialogHeight=700px;");
		var strs = $("#Str").val().split(",");
		$("#DDJ01_JFID").attr("value", strs[0]);
		$("#DDJ01_MC").attr("value", strs[1]);
		$("#Str").val("");
	}
	function jsryN() {
		window.showModalDialog("/Myssm_ZBZ/evaluate/selZFZZ.do?XXDBLB=3", 0,
				"dialogWidth=1000px;dialogHeight=700px;");
		var strs = $("#Str").val().split(",");
		$("#DDJ01_JFIDN").attr("value", strs[0]);
		$("#DDJ01_MCN").attr("value", strs[1]);
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
			obj.href = ml + "jl/sel.do?page=" + ys + "&allSize=" + allsize
					+ url;
		}
	}
	function tjgx(id) {
		$("#upuser" + id).submit();
	}
	function qxtj(id) {
		$("#qxuser" + id).submit();
	}
	function deluser(id) {
		if (confirm("你确定要删除吗？")) {
			$("#deluser" + id).submit();
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
				DDJ01_MC : {
					validators : {
						notEmpty : {
							message : '请选择专访组织'
						}
					}
				},
				JL : {
					validators : {
						notEmpty : {
							message : '请输入奖励名称'
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