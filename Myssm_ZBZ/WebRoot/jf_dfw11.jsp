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
		request.setAttribute("BT", request.getAttribute("BT"));
		request.setAttribute("FL", request.getAttribute("FL"));
		request.setAttribute("listdfw11", request.getAttribute("listdfw11"));
		request.setAttribute("listhxjsfl",
				request.getAttribute("listhxjsfl"));
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
							<li><i class="fa fa-book"></i>知识库</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>知识库</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<form action="${path}hxjs/sel.do" class="navbar-form"
									style="padding: 0;" method="post">
									<div style="text-align: right;">
										<label>分类： </label> <select id="select" name="FL"
											class="form-control" size="1">
											<option value="">请选择</option>
											<jf:forEach var="hxjsfl" items="${listhxjsfl}">
												<jf:if test="${hxjsfl.BM==FL}">
													<option selected="selected" value="${hxjsfl.BM}">${hxjsfl.HZMC}</option>
												</jf:if>
												<jf:if test="${hxjsfl.BM!=FL}">
													<option value="${hxjsfl.BM}">${hxjsfl.HZMC}</option>
												</jf:if>
											</jf:forEach>
										</select> &#12288;&#12288; <input name="BT" type="text"
											class="form-control" placeholder="查询名称" value="${BT}">
										<button class="btn btn-info" type="submit">
											<i class="fa fa-search "></i>
										</button>
										&#12288;&#12288; <a class="btn btn-success btn-setting"
											href="#"><i class="fa fa-search-plus "></i> 添加 </a>
									</div>
								</form>
								<table
									class="table table-striped table-bordered bootstrap-datatable datatable">
									<thead>
										<tr>
											<th>No.</th>
											<th>标题</th>
											<th>分类</th>
											<th>日期</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<jf:forEach var="dfw11" items="${listdfw11}">
											<tr>
												<td>${dfw11.RN}</td>
												<td>${dfw11.BT}</td>
												<td>${dfw11.FLMC}</td>
												<td><fmt:formatDate value="${dfw11.LRRQ}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td><jf:if test="${dfw11.ZT==1}">
														<a class="btn btn-info" href="${path}hxjs/gotolabel.do?id=${dfw11.JFID}"> <i
															class="fa fa-search"></i>查看
														</a>
													</jf:if> <jf:if test="${dfw11.ZT==0}">
														<a class="btn btn-info" href="${path}hxjs/gotoup.do?JFID=${dfw11.JFID}"> <i
															class="fa fa-edit "></i>
														</a>
														<a class="btn btn-danger" href="javascript:void(0);"
															onclick="del(this,'${path}hxjs/del.do?JFID=${dfw11.JFID}')">
															<i class="fa fa-trash-o "></i>
														</a>
													</jf:if></td>
											</tr>
										</jf:forEach>
									</tbody>
								</table>
								<!-- 分页 -->
								<div style="text-align:center;">
									<ul class="pagination">
										<li><a>共${page.totalPage}页</a></li>
										<li><a
											href="${path}/hxjs/sel.do?page=1&allSize=${page.allSize}&BT=${BT}&FL=${FL}"><<</a></li>
										<li><a
											href="${path}/hxjs/sel.do?page=${page.page-1}&allSize=${page.allSize}&BT=${BT}&FL=${FL}"><</a></li>
										<li class="active"><a>${page.page}</a></li>
										<li><a
											href="${path}/hxjs/sel.do?page=${page.page+1}&allSize=${page.allSize}&BT=${BT}&FL=${FL}">></a></li>
										<li><a
											href="${path}/hxjs/sel.do?page=${page.totalPage}&allSize=${page.allSize}&BT=${BT}&FL=${FL}">>></a></li>
										<li><a href="javascript:void(0);"
											onclick="xztz(this,'${page.allSize}','${path}','&BT=${BT}&FL=${FL}')">点击选择跳转</a></li>
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
						<h4 class="modal-title">添加知识库信息</h4>
					</div>
					<form id="myfrom" action="${path}/hxjs/add.do" method="post"
						class="form-horizontal">
						<input type="hidden" name="LRRY" value="${sessionScope.user.JFID}">
						<input type="hidden" id="ZT" name="ZT">
						<div class="modal-body">
							<!-- 表单 -->
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h2>
												<i class="fa fa-indent red"></i><strong>添加知识库</strong>
											</h2>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="col-md-3 control-label">分类 <i
													style="color: red">*</i></label>
												<div class="col-md-9">
													<select id="select" name="FL" class="form-control">
														<option value="">请选择</option>
														<jf:forEach var="hxjsfl" items="${listhxjsfl}">
															<option value="${hxjsfl.BM}">${hxjsfl.HZMC}</option>
														</jf:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">标题 <span
													style="color: red">*</span></label>
												<div class="col-md-9">
													<input type="text" name="BT" class="form-control">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">内容</label>
												<div class="col-md-9">
													<textarea id="textarea-input" name="NR" rows="3"
														class="form-control" placeholder="说点什么。。。"></textarea>
												</div>
											</div>
									<div class="form-group">
										<label class="col-md-3 control-label">增加</label>
										<div class="col-md-9">
											<a class="btn btn-sm btn-success" href="javascript:void(0);"
												onclick="tjfj()"><i class="fa fa-search-plus "></i> 添加附件
											</a> 
										</div>
									</div>
											<div class="form-group">
												<label class="col-md-3 control-label"></label>
												<div id="file" class="col-md-9"></div>
											</div>
										</div>
									</div>
								</div>
								<!--表单结束-->
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-sm btn-success"
								onclick="sun(1)">
								<i class="fa fa-dot-circle-o"></i> 提交
							</button>
							<button type="submit" class="btn btn-sm btn-primary"
								onclick="sun(0)">
								<i class="fa fa-check-squar"></i> 保存
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
	function del(obj, url) {
		if (confirm("你确定要删除吗？")) {
			obj.href=url;
		}
	}
	function sun(zt) {
		$("#ZT").attr('value', zt);
		//window.setInterval(eventFun, 1000);
		//eventFun()
	}
	function eventFun() {
		$.ajax({
			type : "GET",
			url : "/Myssm_ZBZ/hxjs/getfileSize.do",
			dataType : "json",
			async : false,
			error : function(XMLResponse) {
			},
			success : function(data) {

			}
		});
	}
	function sclogo() {
		document.getElementById("myfrom").enctype = "multipart/form-data";
	}
	function tjfj() {
		if ($("#file").html() == "") {
			$("#file")
					.append(
							"<input type='file' id='1' style='padding: 5px;' name='file-input' onchange='sclogo()'><a class='btn btn-sm btn-danger' style='margin-left: 300px;margin-top: -50px;'  href='javascript:void(0);' onclick=\"scfj('1',this)\"> <i class='fa fa-trash-o '></i></a>");
		} else {
			var id = parseInt($("#file input").last().attr("id")) + 1;
			$("#file")
					.append(
							"<input type='file' id='"
									+ id
									+ "' style='padding: 5px;' name='file-input' onchange='sclogo()'><a class='btn btn-sm btn-danger' style='margin-left: 300px;margin-top: -50px;' href='javascript:void(0);' onclick=\"scfj('"+id+"',this)\"> <i class='fa fa-trash-o '></i></a>");
		}
	}
	function scfj(id,obj) {
		if (confirm("是否删除")){
			obj.remove();
			$("#"+id).remove();
	    }
	}
	$(function() {
		$('#myfrom').bootstrapValidator({
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				FL : {
					validators : {
						notEmpty : {
							message : '请选择分类'
						}
					}
				},
				BT : {
					validators : {
						notEmpty : {
							message : '标题不能为空'
						}
					}
				}
			}
		});
		$("#201").addClass("opened");
		$("#202").css('display', 'block');
	});
	function xztz(obj, allsize, ml, url) {
		var ys = prompt("请输入页数:");
		if (isNaN(ys)) {
			alert("请输入数字");
			return false;
		}
		if (ys != null && ys != "") {
			obj.href = ml + "/hxjs/sel.do?page=" + ys + "&allSize=" + allsize
					+ url;
		}
	}
</script>
<%
	String msg = (String) request.getAttribute("msg");
	if (msg != null && msg.equals("1")) {
		out.print("<script type='text/javascript'>alert('上传文件超过限制');</script>");
	}
%>
</html>