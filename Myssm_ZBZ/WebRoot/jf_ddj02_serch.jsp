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
		request.setAttribute("listddj02", request.getAttribute("listddj02"));
		request.setAttribute("MC", request.getAttribute("MC"));
		request.setAttribute("XZQH", request.getAttribute("XZQH"));
		request.setAttribute("XZQHMC", request.getAttribute("XZQHMC"));
		request.setAttribute("DDJ01_MC", request.getAttribute("DDJ01_MC"));
		request.setAttribute("DDJ01_JFID",
				request.getAttribute("DDJ01_JFID"));
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
							<li><i class="fa fa-search"></i>��ѯͳ��</li>
							<li><i class="fa fa-male"></i>�ͻ���¼</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>�ͻ���ѯ</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<form action="${path}searchnh/sel.do"
									class="form-inline text-right" method="post">
									<input id="Str" type="hidden"> <input id="DDJ01_JFID"
										name="DDJ01_JFID" type="hidden" value="${DDJ01_JFID}">
									<div class="form-group">
										<input type="text" id="DDJ01_MC" name="DDJ01_MC"
											class="form-control" placeholder="��ѡ��ר����֯"
											onchange="xgzfzz(this)" value="${DDJ01_MC}"
											readonly="readonly" style="width: 100px;">
									</div>
									<div class="form-group">
										<a class="btn btn-info" href="javascript:void(0);"
											onclick="jsry()"> <i class="fa fa-search"></i> ѡ��ר����֯
										</a>
									</div>
									<div class="form-group">
										<input type="text" id="xzqh" name="XZQHMC"
											class="form-control" placeholder="��ѡ����������" value="${XZQHMC}"
											readonly="readonly" style="width: 100px;"> <input type="hidden" id="xzqhbm"
											name="XZQH" class="form-control" value="${XZQH}">
									</div>
									<div class="form-group">
										<a class="btn btn-info" href="javascript:void(0);"
											onclick="tree()"> <i class="fa fa-search"></i> ѡ����������
										</a>
									</div>
									<div class="form-group">
										<input name="MC" type="text" class="form-control"
											placeholder="��ѯ����" value="${MC}" style="width: 100px;">
									</div>
									<div class="form-group">
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
											<th>�û���</th>
											<th>�ͻ�����</th>
											<th>��ַ</th>
											<th>�ֻ�</th>
											<th>�������</th>
											<th>״̬</th>
											<th>����</th>
										</tr>
									</thead>
									<tbody>
										<jf:forEach var="lis" items="${listddj02}">
											<tr>
												<td>${lis.RN}</td>
												<td>${lis.YHM}</td>
												<td>${lis.MC}</td>
												<td>${lis.DZ}</td>
												<td>${lis.YDDH}</td>
												<td>${lis.SCMJ}</td>
												<jf:if test="${lis.ZT==0}">
													<td>����</td>
												</jf:if>
												<jf:if test="${lis.ZT==1}">
													<td>��ʼ</td>
												</jf:if>
												<jf:if test="${lis.ZT==2}">
													<td>�ύ</td>
												</jf:if>
												<td><a class="btn btn-info" href="javascript:void(0);"
													onclick="tjgx('${lis.JFID}')"> <i class="fa fa-search "></i>
												</a>
											</tr>
											<form id="upuser${lis.JFID}"
												action="${path}searchnh/gotolabel.do" method="post">
												<input type="hidden" name="id" value="${lis.JFID}" />
											</form>
										</jf:forEach>
									</tbody>
								</table>
								<!-- ��ҳ -->
								<jf:if test="${empty MC}">
									<div style="text-align:center;">
										<ul class="pagination">
											<li><a>��${page.totalPage}ҳ</a></li>
											<li><a
												href="${path}/searchnh/sel.do?page=1&allSize=${page.allSize}&MC=${MC}&XZQH=${XZQH}&XZQHMC=${XZQHMC}"><<</a></li>
											<li><a
												href="${path}/searchnh/sel.do?page=${page.page-1}&allSize=${page.allSize}&MC=${MC}&XZQH=${XZQH}&XZQHMC=${XZQHMC}"><</a></li>
											<li class="active"><a>${page.page}</a></li>
											<li><a
												href="${path}/searchnh/sel.do?page=${page.page+1}&allSize=${page.allSize}&MC=${MC}&XZQH=${XZQH}&XZQHMC=${XZQHMC}">></a></li>
											<li><a
												href="${path}/searchnh/sel.do?page=${page.totalPage}&allSize=${page.allSize}&MC=${MC}&XZQH=${XZQH}&XZQHMC=${XZQHMC}">>></a></li>
											<li><a href="javascript:void(0);"
												onclick="xztz(this,'${page.allSize}','${path}','&MC=${MC}&XZQH=${XZQH}&XZQHMC=${XZQHMC}')">���ѡ����ת</a></li>
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
			<div id="usage">
				<label><img src="${path}assets/img/logo/GB.png">Copyright
					�����ʷ�������Ϣ�������޹�˾</label>
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
	function xztz(obj, allsize, ml, url) {
		var ys = prompt("������ҳ��:");
		if (isNaN(ys)) {
			alert("����������");
			return false;
		}
		if (ys != null && ys != "") {
			obj.href = ml + "/searchnh/sel.do?page=" + ys + "&allSize="
					+ allsize + url;
		}
	}
	function tjgx(id) {
		$("#upuser" + id).submit();
	}
	function deluser(id) {
		if (confirm("��ȷ��Ҫɾ����")) {
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
							message : '������11λ�ֻ�����'
						},
						regexp : {
							regexp : /^1[3|5|8]{1}[0-9]{9}$/,
							message : '��������ȷ���ֻ�����'
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