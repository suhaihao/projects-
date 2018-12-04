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
							<i class="fa fa-table red"></i><span class="break"></span><strong>ר����֯</strong>
						</h2>
						<div class="panel-actions">
							<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
						</div>
					</div>
					<div class="panel-body">
						<form action="${path}evaluate/selZFZZ.do" class="navbar-form"
							style="padding: 0;" method="post">
							<div style="text-align: right;">
								<label>���ţ� </label> <select id="select" name="BMBM"
											class="form-control" size="1">
											<option value="">��ѡ��</option>
											<jf:forEach var="dsys05" items="${listdsys05}">
												<jf:if test="${dsys05.BM==BMBM}">
													<option selected="selected" value="${dsys05.BM}">${dsys05.text}</option>
												</jf:if>
												<jf:if test="${dsys05.BM!=BMBM}">
													<option value="${dsys05.BM}">${dsys05.text}</option>
												</jf:if>
											</jf:forEach>
										</select> &#12288;&#12288;<input name="MC" type="text" class="form-control"
									placeholder="��ѯ����" value="${MC}">
								<button class="btn btn-info" type="submit">
									<i class="fa fa-search "></i>
								</button>
							</div>
						</form>
						<table
							class="table table-striped table-bordered bootstrap-datatable datatable">
							<thead>
								<tr>
									<th>����</th>
									<th>����</th>
									<th>��ַ</th>
									<th>�绰</th>
									<th>�ֻ�</th>
									<th>����</th>
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
										<td><input name="redio" type="radio"
											onclick="xzfzr('${lis.JFID}','${lis.MC}')"></td>
									</tr>
								</jf:forEach>
							</tbody>
						</table>
						<!-- ��ҳ -->
						<div style="text-align:center;">
							<ul class="pagination">
								<li><a>��${page.totalPage}ҳ</a></li>
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
									onclick="xztz(this,'${page.allSize}','${path}','&MC=${MC}&BMBM=${BMBM}')">���ѡ����ת</a></li>
							</ul>
						</div>
						<!--��ҳ���� -->
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
	function xzfzr(id, mc) {
		window.opener.document.getElementById('Str').value = id + "," + mc
		window.close();
	}
	function xztz(obj, allsize, ml, lj) {
		var ys = prompt("������ҳ��:");
		if (isNaN(ys)) {
			alert("����������");
			return false;
		}
		if (ys != null && ys != "") {
			obj.href = ml + "/evaluate/selZFZZ.do?page=" + ys + "&allSize="
					+ allsize + lj;
		}
	}
</script>
</html>