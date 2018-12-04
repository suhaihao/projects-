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
		request.setAttribute("listdsys11",
				request.getAttribute("listdsys11"));
		request.setAttribute("HZMC", request.getAttribute("HZMC"));
		request.setAttribute("BMLB", request.getAttribute("BMLB"));
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
							<li><i class="fa fa-cogs"></i>ϵͳ����</li>
							<li><i class="fa fa-bug"></i>�������</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>�������</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<form action="${path}dmgl/gotodsys11.do" class="navbar-form"
									style="padding: 0;" method="post">
									<div style="text-align: right;">
										<input name="BMLB" value="${BMLB}" type="hidden"> <input
											name="HZMC" type="text" class="form-control"
											placeholder="��ѯ����" value="${HZMC}">
										<button class="btn btn-info" type="submit">
											<i class="fa fa-search "></i>
										</button>
										&#12288;&#12288; <a class="btn btn-success btn-setting"
											href="#"><i class="fa fa-search-plus "></i> ��� </a>
									</div>
								</form>
								<table
									class="table table-striped table-bordered bootstrap-datatable datatable">
									<thead>
										<tr>
											<th>No.</th>
											<th>�������</th>
											<th>����</th>
											<th>����</th>
											<th>��־һ</th>
											<th>��־��</th>
											<th>��־��</th>
											<th>��־��</th>
											<th>��־��</th>
											<th>��־��</th>
											<th>����</th>
										</tr>
									</thead>
									<tbody>
										<jf:forEach var="dsys11" items="${listdsys11}">
											<tr>
												<td>${dsys11.RN}</td>
												<td>${dsys11.BMLB}</td>
												<td>${dsys11.BM}</td>
												<td>${dsys11.HZMC}</td>
												<td>${dsys11.BZ1}</td>
												<td>${dsys11.BZ2}</td>
												<td>${dsys11.BZ3}</td>
												<td>${dsys11.BZ4}</td>
												<td>${dsys11.BZ5}</td>
												<td>${dsys11.BZ6}</td>
												<td><a href="${path}dmgl/gotoup.do?JFID=${dsys11.JFID}"
													class="btn btn-info"> <i class="fa fa-edit"></i>
												</a> <a href="javascript:void(0);" class="btn btn-danger"
													onclick="del(this,'${path}dmgl/delete.do?JFID=${dsys11.JFID}&BMLB=${BMLB}')">
														<i class="fa fa-trash-o"></i>
												</a></td>
											</tr>
										</jf:forEach>
									</tbody>
								</table>
								<div style="text-align:center;">
									<ul class="pagination">
										<li><a>��${page.totalPage}ҳ</a></li>
										<li><a
											href="${path}/dmgl/gotodsys11.do?page=1&allSize=${page.allSize}&HZMC=${HZMC}&BMLB=${BMLB}"><<</a></li>
										<li><a
											href="${path}/dmgl/gotodsys11.do?page=${page.page-1}&allSize=${page.allSize}&HZMC=${HZMC}&BMLB=${BMLB}"><</a></li>
										<li class="active"><a>${page.page}</a></li>
										<li><a
											href="${path}/dmgl/gotodsys11.do?page=${page.page+1}&allSize=${page.allSize}&HZMC=${HZMC}&BMLB=${BMLB}">></a></li>
										<li><a
											href="${path}/dmgl/gotodsys11.do?page=${page.totalPage}&allSize=${page.allSize}&HZMC=${HZMC}&BMLB=${BMLB}">>></a></li>
										<li><a href="javascript:void(0);"
											onclick="xztz(this,'${page.allSize}','${path}','&HZMC=${HZMC}&BMLB=${BMLB}')">���ѡ����ת</a></li>
									</ul>
								</div>
								<div style="text-align:center;">
									<a class="btn btn-danger" href="${path}dmgl/sel.do"> <i
										class="fa fa-reply"></i> ����
									</a>
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

		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">�������</h4>
					</div>
					<form id="myfrom" action="${path}/dmgl/add.do" method="post"
						class="form-horizontal">
						<input name="BMLB" value="${BMLB}" type="hidden">
						<div class="modal-body">
							<!-- �� -->
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h2>
												<i class="fa fa-indent red"></i><strong>�������</strong>
											</h2>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="col-md-3 control-label">����<i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="BM"
														class="form-control" placeholder="���������"
														onblur="yzbm(this,'${BMLB}')">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">�������� <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="HZMC"
														class="form-control" placeholder="����������">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">��־λһ</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="BZ1"
														class="form-control" placeholder="�������־λһ">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">��־λ��</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="BZ2"
														class="form-control" placeholder="�������־λ��">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">��־λ��</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="BZ3"
														class="form-control" placeholder="�������־λ��">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">��־λ��</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="BZ4"
														class="form-control" placeholder="�������־λ��">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">��־λ��</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="BZ5"
														class="form-control" placeholder="�������־λ��">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">��־λ��</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="BZ6"
														class="form-control" placeholder="�������־λ��">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">��ע</label>
												<div class="col-md-9">
													<textarea id="textarea-input" name="BZ" rows="9"
														class="form-control" placeholder="˵��ʲô������"></textarea>
												</div>
											</div>
											<br>
										</div>
									</div>
								</div>
								<!--������-->
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-sm btn-success">
								<i class="fa fa-dot-circle-o"></i> �ύ
							</button>
							<button type="reset" class="btn btn-sm btn-danger"
								data-dismiss="modal">
								<i class="fa fa-ban"></i> �ر�
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
	function del(obj,url) {
		if (confirm("��ȷ��Ҫɾ����")) {
			obj.href=url;
		}
	}
	function yzbm(obj, bmlb) {
		var value = obj.value;
		$.ajax({
			type : "post",
			url : "/Myssm_ZBZ/dmgl/yzbm.do",
			data : {
				BM : value,
				BMLB : bmlb
			},
			dataType : "json",
			async : false,
			error : function(XMLResponse) {
			},
			success : function(data) {
				if (data.data == 1) {
					alert("�û����ظ����������");
					obj.value = "";
					$("#myfrom").data("bootstrapValidator").updateStatus("BM",
							"NOT_VALIDATED", null);
					$.obj.focus();
				}
			}
		});
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
				BM : {
					validators : {
						notEmpty : {
							message : '���벻��Ϊ��'
						},
						regexp : {
							regexp : /^[0-9]+$/,
							message : 'ֻ����������'
						}
					}
				},
				HZMC : {
					validators : {
						notEmpty : {
							message : '���Ʋ���Ϊ��'
						}
					}
				}
			}
		});
		$("#901").addClass("opened");
		$("#902").css('display', 'block');
	});
	function xztz(obj, allsize, ml, url) {
		var ys = prompt("������ҳ��:");
		if (isNaN(ys)) {
			alert("����������");
			return false;
		}
		if (ys != null && ys != "") {
			obj.href = ml + "/dmgl/gotodsys11.do?page=" + ys + "&allSize="
					+ allsize + url;
		}
	}
</script>
</html>