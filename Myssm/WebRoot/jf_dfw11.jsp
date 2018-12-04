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
<title>�߲�ר���������ϵͳ</title>

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
							<li><i class="fa fa-home"></i><a href="${path}go/index.do">��ҳ</a></li>
							<li><i class="fa fa-heart"></i>����֧��</li>
							<li><i class="fa fa-bolt"></i>���ļ���</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>���ļ���</strong>
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
										<label >���ࣺ </label> <select id="select" name="FL"
											class="form-control" size="1">
											<option value="">��ѡ��</option>
											<jf:forEach var="hxjsfl" items="${listhxjsfl}">
												<jf:if test="${hxjsfl.BM==FL}">
													<option selected="selected" value="${hxjsfl.BM}">${hxjsfl.HZMC}</option>
												</jf:if>
												<jf:if test="${hxjsfl.BM!=FL}">
													<option value="${hxjsfl.BM}">${hxjsfl.HZMC}</option>
												</jf:if>
											</jf:forEach>
										</select> &#12288;&#12288; <input name="BT" type="text"
											class="form-control" placeholder="��ѯ����" value="${BT}">
										<button class="btn btn-info" type="submit">
											<i class="fa fa-search "></i> ��ѯ
										</button>
									</div>
								</form>
								<table
									class="table table-striped table-bordered bootstrap-datatable datatable">
									<thead>
										<tr>
											<th>No.</th>
											<th>����</th>
											<th>����</th>
											<th>����</th>
											<th>����</th>
										</tr>
									</thead>
									<tbody>
										<jf:forEach var="dfw11" items="${listdfw11}">
											<tr>
												<td>${dfw11.RN}</td>
												<td>${dfw11.BT}</td>
												<td>${dfw11.FLMC}</td>
												<td>${dfw11.LRRQ}</td>
												<td>
												<a class="btn btn-info" href="javascript:void(0);"
													onclick="tjgx('${dfw11.JFID}')"> <i class="fa fa-search"></i>
												</a></td>
											</tr>
											<form id="upuser${dfw11.JFID}" action="${path}hxjs/gotolabel.do"
												method="post">
												<input type="hidden" name="id" value="${dfw11.JFID}" />
											</form>
										</jf:forEach>
									</tbody>
								</table>
								<!-- ��ҳ -->
								<jf:if test="${empty MC and empty FL}">
									<div style="text-align:center;">
										<ul class="pagination">
											<li><a>��${page.totalPage}ҳ</a></li>
											<li><a
												href="${path}/hxjs/sel.do?page=1&allSize=${page.allSize}"><<</a></li>
											<li><a
												href="${path}/hxjs/sel.do?page=${page.page-1}&allSize=${page.allSize}"><</a></li>
											<li class="active"><a>${page.page}</a></li>
											<li><a
												href="${path}/hxjs/sel.do?page=${page.page+1}&allSize=${page.allSize}">></a></li>
											<li><a
												href="${path}/hxjs/sel.do?page=${page.totalPage}&allSize=${page.allSize}">>></a></li>
											<li><a href="javascript:void(0);"
												onclick="xztz(this,'${page.allSize}','${path}')">���ѡ����ת</a></li>
										</ul>
									</div>
								</jf:if>
								<jf:if test="${not empty MC or not empty FL}">
									<div style="text-align:center;">
										<ul class="pagination">
											<li><a>��${page.totalPage}ҳ</a></li>
											<li><a
												href="${path}/hxjs/sel.do?page=1&allSize=${page.allSize}&BT=${BT}&FL=${FL}"><<</a></li>
											<li><a
												href="${path}/hxjs/sel.do?page=${page.page-1}&allSize=${page.allSize}&BT=${BT}&FL=${FL}"><</a></li>
											<li class="active"><a>${page.page}</a></li>
											<li><a
												href="${path}/hxjs/sel.do?page=${page.page+1}&allSize=${page.allSize}&BT=${BT}&FL=${FL}">></a></li>
											<li><a
												href="${path}/hxjs/sel.do?page=${page.totalPage}&allSize=${page.allSize}&BT=${BT}&FL=${FL}">>></a></li>
										</ul>
									</div>
								</jf:if>
								<!--��ҳ���� -->
							</div>
						</div>
					</div>
					<!--/col-->
				</div>
			</div>
			<!-- end: Content -->
			<!-- foot -->
			<div id="usage">
			<label><img src="${path}assets/img/logo/GB.png">Copyright �����ʷ�������Ϣ�������޹�˾</label>
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
	$(function() {
		$("#301").addClass("opened");
		$("#302").css('display', 'block');
	});
	function xztz(obj, allsize, ml) {
		var ys = prompt("������ҳ��:");
		if (isNaN(ys)) {
			alert("����������");
			return false;
		}
		if(ys!=null&&ys!="")
		{
		obj.href = ml + "/hxjs/sel.do?page=" + ys + "&allSize=" + allsize;
		}
	}
	function tjgx(id) {
		$("#upuser" + id).submit();
	}
</script>
</html>