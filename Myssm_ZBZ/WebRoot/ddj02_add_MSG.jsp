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
		request.setAttribute("listddj02", request.getAttribute("listddj02"));
		request.setAttribute("MC", request.getAttribute("MC"));
		request.setAttribute("dfw02", request.getAttribute("dfw02"));
		request.setAttribute("XZQH", request.getAttribute("XZQH"));
		request.setAttribute("XZQHMC", request.getAttribute("XZQHMC"));
		request.setAttribute("DDJ01_JFID", request.getAttribute("DDJ01_JFID"));
		request.setAttribute("DDJ01_MC", request.getAttribute("DDJ01_MC"));
	%>
	<div class="container-fluid content" style="margin-top: 50px">
		<!-- main -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2>
							<i class="fa fa-table red"></i><span class="break"></span><strong>客户管理</strong>
						</h2>
						<div class="panel-actions">
							<a href="table.html#" class="btn-minimize"><i
								class="fa fa-chevron-up"></i></a>
						</div>
					</div>
					<div class="panel-body">
						<form action="${path}onlin/selNH.do" class="navbar-form"
							style="padding: 0;" method="post">
							<input id="Str" type="hidden">
							<input type="hidden" name="dfw02" value="${dfw02}">
							<input id="DDJ01_JFID" name="DDJ01_JFID" type="hidden" value="${DDJ01_JFID}">
							<div style="text-align: right;">
								<label>专防组织：</label> <input type="text" id="DDJ01_MC"
									name="DDJ01_MC" class="form-control" placeholder="请选择专防组织"
									onchange="xgzfzz(this)" value="${DDJ01_MC}" readonly="readonly">
								<a class="btn btn-info" href="javascript:void(0);"
									onclick="jsry()"> <i class="fa fa-search"></i> 选择组织
								</a> <label>行政区划： </label><input type="text" id="xzqh" name="XZQHMC"
									class="form-control" value="${XZQHMC}" placeholder="请选择行政区划"
									onchange="xg(this)" readonly="readonly">
								<button class="btn btn-info" type="button" onclick="tree()">
									<i class="fa fa-search "></i> 选择区划
								</button>
								<input type="hidden" id="xzqhbm" name="XZQH"
									class="form-control" value="${XZQH}"> <input name="MC"
									type="text" class="form-control" placeholder="查询名称"
									value="${MC}">
								<button class="btn btn-info" type="submit">
									<i class="fa fa-search "></i>
								</button>
							</div>
						</form>
						<table
							class="table table-striped table-bordered bootstrap-datatable datatable">
							<thead>
								<tr>
									<th>用户名</th>
									<th>客户名称</th>
									<th>地址</th>
									<th>手机</th>
									<th>邮箱</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<jf:forEach var="lis" items="${listddj02}">
									<tr>
										<td>${lis.YHM}</td>
										<td>${lis.MC}</td>
										<td>${lis.DZ}</td>
										<td>${lis.YDDH}</td>
										<td>${lis.YX}</td>
										<td><input type="radio" name="redio"
											onclick="xz('${lis.JFID}','${lis.MC}','${lis.ZPLJ}','<%=request.getParameter("dfw02")%>')">
										</td>
									</tr>

								</jf:forEach>
							</tbody>
						</table>
						<!-- 分页 -->
							<div style="text-align:center;">
								<ul class="pagination">
									<li><a>共${page.totalPage}页</a></li>
									<li><a
										href="${path}onlin/selNH.do?page=1&allSize=${page.allSize}&MC=${MC}&dfw02=${dfw02}&XZQH=${XZQH}&XZQHMC=${XZQHMC}&DDJ01_JFID=${DDJ01_JFID}&DDJ01_MC=${DDJ01_MC}"><<</a></li>
									<li><a
										href="${path}onlin/selNH.do?page=${page.page-1}&allSize=${page.allSize}&MC=${MC}&dfw02=${dfw02}&XZQH=${XZQH}&XZQHMC=${XZQHMC}&DDJ01_JFID=${DDJ01_JFID}&DDJ01_MC=${DDJ01_MC}"><</a></li>
									<li class="active"><a>${page.page}</a></li>
									<li><a
										href="${path}onlin/selNH.do?page=${page.page+1}&allSize=${page.allSize}&MC=${MC}&dfw02=${dfw02}&XZQH=${XZQH}&XZQHMC=${XZQHMC}&DDJ01_JFID=${DDJ01_JFID}&DDJ01_MC=${DDJ01_MC}">></a></li>
									<li><a
										href="${path}onlin/selNH.do?page=${page.totalPage}&allSize=${page.allSize}&MC=${MC}&dfw02=${dfw02}&XZQH=${XZQH}&XZQHMC=${XZQHMC}&DDJ01_JFID=${DDJ01_JFID}&DDJ01_MC=${DDJ01_MC}">>></a></li>
									<li><a href="javascript:void(0);"
										onclick="xztz(this,'${page.allSize}','${path}','&MC=${MC}&dfw02=${dfw02}&XZQH=${XZQH}&XZQHMC=${XZQHMC}&DDJ01_JFID=${DDJ01_JFID}&DDJ01_MC=${DDJ01_MC}')">点击选择跳转</a></li>
								</ul>
							</div>
					</div>
				</div>
			</div>
			<!--/col-->
		</div>
		<!-- end: Content -->
	</div>
	<!--/container-->
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
	function jsry() {
		window.showModalDialog("/Myssm_ZBZ/evaluate/selZFZZ.do?XXDBLB=3", 0,
				"dialogWidth=1000px;dialogHeight=700px;");
		var strs = $("#Str").val().split(",");
		$("#DDJ01_JFID").attr("value", strs[0]);
		$("#DDJ01_MC").attr("value", strs[1]);
		$("#Str").val("");
	}
	function xg(obj) {
		if (obj.value == "") {
			$("#xzqhbm").attr("value", "");
		}
	}
	function tree() {
		var returnValue = window.showModalDialog("/Myssm_ZBZ/tree_all.jsp", 0,
				"dialogWidth=500px;dialogHeight=600px");
		var strs = returnValue.split(",");
		$("#xzqh").attr("value", strs[1]);
		$("#xzqhbm").attr("value", strs[0]);
	};
	function xz(jfid, mc, ZPLJ, dfw02) {
		if (dfw02 == 1) {
			window.opener.document.getElementById('Str').value = jfid + ","
					+ mc + "," + ZPLJ;
			window.opener.yhxz();
			window.close();
		} else {
			window.opener.document.getElementById('Str').value = jfid + ","
					+ "农户:" + mc + "," + ZPLJ;
			window.opener.yhxz();
			window.close();
		}
	}
	function xztz(obj, allsize, ml,url) {
		var ys = prompt("请输入页数:");
		if (isNaN(ys)) {
			alert("请输入数字");
			return false;
		}
		if (ys != null && ys != "") {
			obj.href = ml + "/onlin/selNH.do?page=" + ys + "&allSize="
					+ allsize+url;
		}
	}
</script>
</html>