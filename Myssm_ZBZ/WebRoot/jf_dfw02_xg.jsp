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
<link href="${path}/assets/css/bootstrap-treeview.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>
</head>

<body>
	<%
		request.setAttribute("StarTime", request.getAttribute("StarTime"));
		request.setAttribute("EndTime", request.getAttribute("EndTime"));
		request.setAttribute("BMBM", request.getAttribute("BMBM"));
		request.setAttribute("TJFS", request.getAttribute("TJFS"));
		request.setAttribute("listdw02", request.getAttribute("listdw02"));
		request.setAttribute("hj", request.getAttribute("hj"));
		request.setAttribute("listdsys05",
				request.getAttribute("listdsys05"));
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
							<li><i class="fa fa-thumbs-up"></i>����Ч��ͳ��</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>����Ч��ͳ��</strong>
								</h2>
								<div class="panel-actions">
									<a href="" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<form action="${path}fwxgtj/sel.do" method="post"
									class="form-horizontal">
									<input id="Str" type="hidden">
									<div class="form-group">
										<label class="col-md-2 control-label">ʱ��</label>
										<div class="col-md-3">
											<input id="datetimepickerup" name="StarTime" type="text"
												class="form-control" placeholder="��ʼ���ڣ�yyyy-mm-dd��"
												data-date-format="yyyy-mm-dd" value="${StarTime}">
										</div>
										<div class="col-md-1"
											style="text-align: center;padding: 0;">��</div>
										<div class="col-md-3">
											<input id="datetimepickerdon" name="EndTime" type="text"
												class="form-control" placeholder="�������ڣ�yyyy-mm-dd��"
												data-date-format="yyyy-mm-dd" value="${EndTime}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">��������:</label>
										<div class="col-md-7">
											<select id="select" name="BMBM" class="form-control" size="1">
												<option value="">��ѡ��</option>
												<jf:forEach var="dsys05" items="${listdsys05}">
													<jf:if test="${BMBM==dsys05.BM}">
														<option value="${dsys05.BM}" selected="selected">${dsys05.text}</option>
													</jf:if>
													<jf:if test="${BMBM!=dsys05.BM}">
														<option value="${dsys05.BM}">${dsys05.text}</option>
													</jf:if>
												</jf:forEach>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">ͳ�Ʒ�ʽ</label>
										<div class="col-md-7">
											<label class="radio-inline"> <jf:if
													test="${TJFS=='1'}">
													<input type="radio" id="inline-radio1" name="TJFS"
														value="1" checked="checked"> ר����֯
											</jf:if> <jf:if test="${TJFS!='1'}">
													<input type="radio" id="inline-radio1" name="TJFS"
														value="1"> ר����֯
											</jf:if>
											</label> <label class="radio-inline"> <jf:if
													test="${TJFS=='2'}">
													<input type="radio" id="inline-radio1" name="TJFS"
														value="2" checked="checked"> ��������
											</jf:if> <jf:if test="${TJFS!='2'}">
													<input type="radio" id="inline-radio1" name="TJFS"
														value="2"> ��������
											</jf:if>
											</label> <label class="radio-inline"> <jf:if
													test="${TJFS=='3'}">
													<input type="radio" id="inline-radio1" name="TJFS"
														value="3" checked="checked"> ũ��
											</jf:if> <jf:if test="${TJFS!='3'}">
													<input type="radio" id="inline-radio1" name="TJFS"
														value="3"> ũ��
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
											<th rowspan="2" style="vertical-align: inherit;">No.</th>
											<th rowspan="2" style="vertical-align: inherit;">��Ŀ</th>
											<th colspan="2">������</th>
											<th colspan="2">����</th>
											<th colspan="2">��������</th>
											<th colspan="2">������</th>
											<th rowspan="2" style="vertical-align: inherit;">�ϼ�</th>
										</tr>
										<tr>
											<th>��</th>
											<th>%</th>
											<th>��</th>
											<th>%</th>
											<th>��</th>
											<th>%</th>
											<th>��</th>
											<th>%</th>
										</tr>
									</thead>
									<tbody>
										<jf:forEach var="dfw02" items="${listdw02}">
											<tr>
												<td style="text-align: center;">${dfw02.RN}</td>
												<td style="text-align: center;">${dfw02.xm}</td>
												<td style="text-align: center;">${dfw02.hmy}</td>
												<td style="text-align: center;">${dfw02.hmybl}</td>
												<td style="text-align: center;">${dfw02.my}</td>
												<td style="text-align: center;">${dfw02.mybl}</td>
												<td style="text-align: center;">${dfw02.jbmy}</td>
												<td style="text-align: center;">${dfw02.jbmybl}</td>
												<td style="text-align: center;">${dfw02.bmy}</td>
												<td style="text-align: center;">${dfw02.bmybl}</td>
												<td style="text-align: center;">${dfw02.hj}</td>
											</tr>
										</jf:forEach>
										<tr>
											<td colspan="2" style="text-align: center;">�ϼ�</td>
											<td style="text-align: center;">${hj.hmy}</td>
											<td style="text-align: center;">${hj.hmybl}</td>
											<td style="text-align: center;">${hj.my}</td>
											<td style="text-align: center;">${hj.mybl}</td>
											<td style="text-align: center;">${hj.jbmy}</td>
											<td style="text-align: center;">${hj.jbmybl}</td>
											<td style="text-align: center;">${hj.bmy}</td>
											<td style="text-align: center;">${hj.bmybl}</td>
											<td style="text-align: center;">${hj.hj}</td>
										</tr>
									</tbody>
								</table>
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
		<script src="${path}/assets/js/bootstrap-treeview.js"></script>

		<!-- end: JavaScript-->
</body>
<script type="text/javascript">
	function xgssbm(obj) {
		if (obj.value == "") {
			$("#BMBM").val("");
		}
	}
	function tree() {
		var returnValue = window.showModalDialog("/Myssm_ZBZ/tree_all.jsp", 0,
				"dialogWidth=500px;dialogHeight=600px");
		var strs = returnValue.split(",");
		$("#BMBM").attr("value", strs[0]);
		$("#BMBMMC").attr("value", strs[1]);

	};
	function szyh() {
		window.showModalDialog("/Myssm_ZBZ/onlin/selNH.do?dfw02=1", 0,
				"dialogWidth=1000px;dialogHeight=700px;");
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
			obj.href = ml + "/info/sel.do?page=" + ys + "&allSize=" + allsize;
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