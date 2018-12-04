<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.ssh.user.model.User"%>
<%@ page import="com.ssh.user.util.EHCache"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jf"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%  
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
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

<body>
	<%
request.setAttribute("page",request.getAttribute("page"))  ;
request.setAttribute("listddj02",request.getAttribute("listddj02"))  ;
request.setAttribute("MC",request.getAttribute("MC"))  ;
%>
	<div class="container-fluid content" style="margin-top: 50px">
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>�ͻ�����</strong>
								</h2>
								<div class="panel-actions">
									<a href="table.html#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<form action="${path}order/user.do" class="navbar-form"
									style="padding: 0;" method="post">
									<div style="text-align: right;">
										<input name="MC" type="text" class="form-control"
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
											<th>�û���</th>
											<th>�ͻ�����</th>
											<th>��ַ</th>
											<th>�ֻ�</th>
											<th>����</th>
											<th>����</th>
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
													onclick="xz('${lis.JFID}','${lis.MC}','${lis.YDDH}','${lis.DZ}')">
												</td>
											</tr>

										</jf:forEach>
									</tbody>
								</table>
								<!-- ��ҳ -->
								<jf:if test="${empty MC}">
									<div style="text-align:center;">
										<ul class="pagination">
											<li><a>��${page.totalPage}ҳ</a></li>
											<li><a
												href="${path}order/user.do?page=1&allSize=${page.allSize}"><<</a></li>
											<li><a
												href="${path}order/user.do?page=${page.page-1}&allSize=${page.allSize}"><</a></li>
											<li class="active"><a>${page.page}</a></li>
											<li><a
												href="${path}order/user.do?page=${page.page+1}&allSize=${page.allSize}">></a></li>
											<li><a
												href="${path}order/user.do?page=${page.totalPage}&allSize=${page.allSize}">>></a></li>
											<li><a href="javascript:void(0);"
												onclick="xztz(this,'${page.allSize}','${path}')">���ѡ����ת</a></li>
										</ul>
									</div>
								</jf:if>
								<jf:if test="${not empty MC}">
									<div style="text-align:center;">
										<ul class="pagination">
											<li><a>��${page.totalPage}ҳ</a></li>
											<li><a
												href="${path}order/user.do?page=1&allSize=${page.allSize}&MC=${MC}"><<</a></li>
											<li><a
												href="${path}order/user.do?page=${page.page-1}&allSize=${page.allSize}&MC=${MC}"><</a></li>
											<li class="active"><a>${page.page}</a></li>
											<li><a
												href="${path}order/user.do?page=${page.page+1}&allSize=${page.allSize}&MC=${MC}">></a></li>
											<li><a
												href="${path}order/user.do?page=${page.totalPage}&allSize=${page.allSize}&MC=${MC}">>></a></li>
										</ul>
									</div>
								</jf:if>
								<!--��ҳ���� -->
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
			window.jQuery || document.write("<script src='${path}/assets/js/jquery-2.1.1.min.js'>"+"<"+"/script>");
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
function xz(jfid,mc,dj,dz)
{
	window.opener.document.getElementById('Str').value=jfid+","+mc+","+dj+","+dz;
	window.close();
}
function xztz(obj, allsize, ml) {
	var ys = prompt("������ҳ��:");
	if (isNaN(ys)) {
		alert("����������");
		return false;
	}
	if(ys!=null&&ys!="")
	{
	obj.href = ml + "/order/user.do?page=" + ys + "&allSize=" + allsize;
	}
}
</script>
</html>