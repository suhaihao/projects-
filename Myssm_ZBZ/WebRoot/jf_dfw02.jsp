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
		request.setAttribute("StarTime", request.getAttribute("StarTime"));
		request.setAttribute("EndTime", request.getAttribute("EndTime"));
		request.setAttribute("DDJ01_JFID",
				request.getAttribute("DDJ01_JFID"));
		request.setAttribute("DDJ02_JFID",
				request.getAttribute("DDJ02_JFID"));
		request.setAttribute("PJJG", request.getAttribute("PJJG"));
		request.setAttribute("DDJ01_MC", request.getAttribute("DDJ01_MC"));
		request.setAttribute("DDJ02_JFIDMC",
				request.getAttribute("DDJ02_JFIDMC"));
		request.setAttribute("listdfw02", request.getAttribute("listdfw02"));
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
							<li><i class="fa fa-location-arrow"></i>����׷����Ч��</li>
							<li><i class="fa fa-thumbs-up"></i>����Ч����ѯ</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>����Ч����ѯ</strong>
								</h2>
								<div class="panel-actions">
									<a href="" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<form action="${path}evaluate/sel.do" method="post"
									class="form-horizontal">
									<input id="DDJ01_JFID" name="DDJ01_JFID" type="hidden"
										value="${DDJ01_JFID}"> <input id="DDJ02_JFID"
										name="DDJ02_JFID" type="hidden" value="${DDJ02_JFID}">
									<input id="Str" type="hidden">
									<div class="form-group">
										<label class="col-md-2 control-label">ʱ��</label>
										<div class="col-md-3">
											<input id="datetimepickerup" name="StarTime" type="text"
												class="form-control" placeholder="��ʼ���ڣ�yyyy-mm-dd��"
												data-date-format="yyyy-mm-dd" value="${StarTime}">
										</div>
										<div class="col-md-1"
											style="text-align: center;padding: 0;width: 65px;">��</div>
										<div class="col-md-3">
											<input id="datetimepickerdon" name="EndTime" type="text"
												class="form-control" placeholder="�������ڣ�yyyy-mm-dd��"
												data-date-format="yyyy-mm-dd" value="${EndTime}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">ר����֯:</label>
										<div class="col-md-6">
											<input type="text" id="DDJ01_MC" name="DDJ01_MC"
												class="form-control" placeholder="��ѡ��ר����֯"
												onchange="xgzfzz(this)" value="${DDJ01_MC}" readonly="readonly">
										</div>
										<div class="col-md-1">
											<a class="btn btn-info" href="javascript:void(0);"
												onclick="jsry()"> <i class="fa fa-search"></i>
											</a>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">�ͻ�����</label>
										<div class="col-md-6">
											<input type="text" id="DDJ02_JFIDMC" name="DDJ02_JFIDMC"
												class="form-control" placeholder="��ѡ��ͻ�"
												onchange="yhxg(this)" value="${DDJ02_JFIDMC}" readonly="readonly">
										</div>
										<div class="col-md-1">
											<a class="btn btn-info" href="javascript:void(0);"
												onclick="szyh()"> <i class="fa fa-search"></i>
											</a>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">���۽��</label>
										<div class="col-md-7">
											<label class="radio-inline"> <jf:if test="${PJJG==0}">
													<input type="radio" id="inline-radio1" name="PJJG"
														value="0" checked="checked"> ȫ��
											</jf:if> <jf:if test="${PJJG!=0}">
													<input type="radio" id="inline-radio1" name="PJJG"
														value="0"> ȫ��
											</jf:if>
											</label> <label class="radio-inline"> <jf:if
													test="${PJJG==4}">
													<input type="radio" id="inline-radio1" name="PJJG"
														value="4" checked="checked"> �ǳ�����
											</jf:if> <jf:if test="${PJJG!=4}">
													<input type="radio" id="inline-radio1" name="PJJG"
														value="4"> �ǳ�����
											</jf:if>
											</label> <label class="radio-inline"> <jf:if
													test="${PJJG==3}">
													<input type="radio" id="inline-radio1" name="PJJG"
														value="3" checked="checked"> ����
											</jf:if> <jf:if test="${PJJG!=3}">
													<input type="radio" id="inline-radio1" name="PJJG"
														value="3"> ����
											</jf:if>
											</label> <label class="radio-inline"> <jf:if
													test="${PJJG==2}">
													<input type="radio" id="inline-radio1" name="PJJG"
														value="2" checked="checked"> ��������
											</jf:if> <jf:if test="${PJJG!=2}">
													<input type="radio" id="inline-radio1" name="PJJG"
														value="2"> ��������
											</jf:if>
											</label> <label class="radio-inline"> <jf:if
													test="${PJJG==1}">
													<input type="radio" id="inline-radio1" name="PJJG"
														value="1" checked="checked"> ������
											</jf:if> <jf:if test="${PJJG!=1}">
													<input type="radio" id="inline-radio1" name="PJJG"
														value="1"> ������
											</jf:if>
											</label>
										</div>
									</div>
									<div class="form-group" style="text-align: center;">
										<div class="col-md-12">
											<button class="btn btn-info" type="submit">
												<i class="fa fa-search "></i> ��ѯ
											</button>
										</div>
									</div>
								</form>
								<table
									class="table table-striped table-bordered bootstrap-datatable datatable">
									<thead>
										<tr>
											<th>No.</th>
											<th>ר����֯</th>
											<th>�ͻ�����</th>
											<th>���۽��</th>
											<th>��������</th>
											<th>����ʱ��</th>
										</tr>
									</thead>
									<tbody>
										<jf:forEach var="dfw02" items="${listdfw02}">
											<tr>
												<td>${dfw02.RN}</td>
												<td>${dfw02.DDJ01_MC}</td>
												<td>${dfw02.DDJ02_JFID}</td>
												<td><jf:if test="${dfw02.PJJG==4}">�ǳ�����</jf:if> <jf:if
														test="${dfw02.PJJG==3}">����</jf:if> <jf:if
														test="${dfw02.PJJG==2}">��������</jf:if> <jf:if
														test="${dfw02.PJJG==1}">������</jf:if></td>
												<td>${dfw02.PJSM}</td>
												<td><fmt:formatDate value="${dfw02.PJRQ}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
											</tr>
										</jf:forEach>
									</tbody>
								</table>
								<!-- ��ҳ -->
								<div style="text-align:center;">
									<ul class="pagination">
										<li><a>��${page.totalPage}ҳ</a></li>
										<li><a
											href="${path}/info/sel.do?page=1&allSize=${page.allSize}&MC=${MC}&BMBM=${BMBM}"><<</a></li>
										<li><a
											href="${path}/info/sel.do?page=${page.page-1}&allSize=${page.allSize}&MC=${MC}&BMBM=${BMBM}"><</a></li>
										<li class="active"><a>${page.page}</a></li>
										<li><a
											href="${path}/info/sel.do?page=${page.page+1}&allSize=${page.allSize}&MC=${MC}&BMBM=${BMBM}">></a></li>
										<li><a
											href="${path}/info/sel.do?page=${page.totalPage}&allSize=${page.allSize}&MC=${MC}&BMBM=${BMBM}">>></a></li>
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
			</div>
			<!-- end: Content -->
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
	function szyh() {
		window.open("/Myssm_ZBZ/onlin/selNH.do?dfw02=1", 0,
				"dialogWidth=1000px;dialogHeight=700px;");
	}
	function yhxz()
	{
		var strs = $("#Str").val().split(",");
		$("#DDJ02_JFID").attr("value", strs[0]);
		$("#DDJ02_JFIDMC").attr("value", strs[1]);
		$("#Str").val("");
	}
	function jsry() {
		window.showModalDialog("/Myssm_ZBZ/evaluate/selZFZZ.do?XXDBLB=3", 0,
				"dialogWidth=1000px;dialogHeight=700px;");
		var strs = $("#Str").val().split(",");
		$("#DDJ01_JFID").attr("value", strs[0]);
		$("#DDJ01_MC").attr("value", strs[1]);
		$("#Str").val("");
	}
	function xgzfzz(obj) {
		if (obj.value == "") {
			$("#DDJ01_JFID").attr("value", "");
		}
	}
	function yhxg(obj) {
		if (obj.value == "") {
			$("#DDJ02_JFID").attr("value", "");
		}
	}
	function xztz(obj, allsize, ml) {
		var ys = prompt("������ҳ��:");
		if (isNaN(ys)) {
			alert("����������");
			return false;
		}
		if (ys != null && ys != "") {
			obj.href = ml + "/info/sel.do?page=" + ys + "&allSize="
					+ allsize;
		}
	}
	$(function() {
		$("#301").addClass("opened");
		$("#302").css('display', 'block');
	});
	$.fn.datetimepicker.dates['zh-CN'] = {
		days : [ "������", "����һ", "���ڶ�", "������", "������", "������", "������", "������" ],
		daysShort : [ "����", "��һ", "�ܶ�", "����", "����", "����", "����", "����" ],
		daysMin : [ "��", "һ", "��", "��", "��", "��", "��", "��" ],
		months : [ "һ��", "����", "����", "����", "����", "����", "����", "����", "����", "ʮ��",
				"ʮһ��", "ʮ����" ],
		monthsShort : [ "һ��", "����", "����", "����", "����", "����", "����", "����", "����",
				"ʮ��", "11��", "12��" ],
		today : "����",
		suffix : [],
		meridiem : [ "����", "����" ]
	};
	$('#datetimepickerup').datetimepicker({
		minView : "month",//����ֻ��ʾ���·�
		autoclose : true,
		language : 'zh-CN',
		todayBtn : true
	});
	$('#datetimepickerdon').datetimepicker({
		minView : "month",//����ֻ��ʾ���·�
		autoclose : true,
		language : 'zh-CN',
		todayBtn : true
	});
</script>
</html>