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
	%>
	<div class="container-fluid content" style="margin-top: 50px;">
		<!-- start: Content -->
		<!-- main -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2>
							<i class="fa fa-table red"></i><span class="break"></span><strong>专访组织</strong>
						</h2>
						<div class="panel-actions">
							<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
						</div>
					</div>
					<div class="panel-body">
						<form action="${path}evaluate/selZFZZ.do" class="navbar-form"
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
									<th>名称</th>
									<th>部门</th>
									<th>地址</th>
									<th>电话</th>
									<th>手机</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<jf:forEach var="lis" items="${listddj01}">
									<tr>
										<td>${lis.MC}</td>
										<td>${lis.BMBM}</td>
										<td>${lis.DZ}</td>
										<td>${lis.LX_DH}</td>
										<td>${lis.LX_SJ}</td>
										<td><input name="ckbox" type="checkbox"
											onclick="xzfzr(this,'${lis.JFID}','${lis.MC}')"></td>
									</tr>
								</jf:forEach>
							</tbody>
						</table>
						<div style="text-align: center;">
							<input type="hidden" id="ids">
							<button type="button" style="width: 100px;"
								class="btn btn-success btn-sm" onclick="fh()">
								<i class="fa fa-check"></i> 确定
							</button>
						</div>
						<!-- 分页 -->
						<div style="text-align:center;">
							<ul class="pagination">
								<li><a>共${page.totalPage}页</a></li>
								<li><a
									href="${path}/evaluate/selZFZZ.do?page=1&allSize=${page.allSize}&MC=${MC}&BMBM=${BMBM}"><<</a></li>
								<li><a
									href="${path}/evaluate/selZFZZ.do?page=${page.page-1}&allSize=${page.allSize}&MC=${MC}&BMBM=${BMBM}"><</a></li>
								<li class="active"><a>${page.page}</a></li>
								<li><a
									href="${path}/evaluate/selZFZZ.do?page=${page.page+1}&allSize=${page.allSize}&MC=${MC}&BMBM=${BMBM}">></a></li>
								<li><a
									href="${path}/evaluate/selZFZZ.do?page=${page.totalPage}&allSize=${page.allSize}&MC=${MC}&BMBM=${BMBM}">>></a></li>
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
		<!-- end: Content -->
	</div>
	<!--/container-->



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
	function fh() {
		window.opener.document.getElementById('Str').value = $("#ids").val();
		window.close();
	}
	function xzfzr(obj, id, mc) {
		if (obj.checked) {
			var val = $("#ids").val() + id + "!" + mc + ",";
			$("#ids").attr("value", val);
		} else {
			var ids = $("#ids").val();
			var str = ids.indexOf(id);
			var end = ids.indexOf(",", str);
			var p1 = ids.substring(0, str);
			var p2 = ids.substring(end + 1, ids.length);
			ids = p1 + p2;
			$("#ids").attr("value", ids);
		}
	}
	function xztz(obj, allsize, ml, lj) {
		var ys = prompt("请输入页数:");
		if (isNaN(ys)) {
			alert("请输入数字");
			return false;
		}
		if (ys != null && ys != "") {
			obj.href = ml + "/evaluate/selZFZZ.do?page=" + ys + "&allSize="
					+ allsize + lj;
		}
	}
</script>
</html>