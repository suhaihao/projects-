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
							<li><i class="fa fa-medkit"></i>ר����֯����</li>
							<li><i class="fa fa-ambulance"></i>ר����֯�Ǽ�</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>ר����֯�Ǽ�</strong>
								</h2>
								<div class="panel-actions">
									<a href="table.html#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<form action="${path}info/sel.do" class="navbar-form"
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
										</select> &#12288;&#12288;<input name="MC" type="text"
											class="form-control" placeholder="��ѯ����" value="${MC}">
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
											<th>�û���</th>
											<th>��λ����</th>
											<th>��ַ</th>
											<th>�ֻ�</th>
											<th>����</th>
											<th>״̬</th>
											<th>����</th>
										</tr>
									</thead>
									<tbody>
										<jf:forEach var="ddj01" items="${listddj01}">
											<tr>
												<td>${ddj01.RN}</td>
												<td>${ddj01.YHM}</td>
												<td>${ddj01.MC}</td>
												<td>${ddj01.DZ}</td>
												<td>${ddj01.LX_SJ}</td>
												<td>${ddj01.YX}</td>
												<td><jf:if test="${ddj01.ZT==0}">����</jf:if> <jf:if
														test="${ddj01.ZT==1}">��ʼ</jf:if> <jf:if
														test="${ddj01.ZT==2}">�ύ</jf:if></td>
												<td><a class="btn btn-info" href="javascript:void(0);"
													onclick="tjgx('${ddj01.JFID}')"> <i class="fa fa-edit "></i>
												</a> <a class="btn btn-danger" href="javascript:void(0);"
													onclick="deluser('${ddj01.JFID}')"> <i
														class="fa fa-trash-o "></i>
												</a></td>
											</tr>
											<form id="upuser${ddj01.JFID}" action="${path}info/gotoup.do"
												method="post">
												<input type="hidden" name="JFID" value="${ddj01.JFID}" />
											</form>
											<form id="deluser${ddj01.JFID}" action="${path}info/del.do"
												method="post">
												<input type="hidden" name="JFID" value="${ddj01.JFID}" />
											</form>
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


		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">��ӿͻ���Ϣ</h4>
					</div>
					<form id="myfrom" action="${path}/info/add.do" method="post"
						class="form-horizontal">
						<input type="hidden" name="LRRY" value="${sessionScope.user.JFID}">
						<input type="hidden" name="LRRY_MC" value="${sessionScope.user.JFNAME}">
						<div class="modal-body">
							<!-- �� -->
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h2>
												<i class="fa fa-indent red"></i><strong>��Ա��Ϣ</strong>
											</h2>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="col-md-3 control-label">ѡ���� <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<select id="select" name="BMBM" class="form-control"
														size="1">
														<option value="">��ѡ��</option>
														<jf:forEach var="dsys05" items="${listdsys05}">
															<option value="${dsys05.BM}">${dsys05.text}</option>
														</jf:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">�˻� <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JFUSERID" autocomplete = 'new-password'
														class="form-control" placeholder="�������˻�"
														autofocus="autofocus" onblur="yzname(this)" >
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">���� <i
													style="color: red">*</i>
												</label>
												<div class=" col-md-9">
													<input type="password" id="password-input" autocomplete = 'new-password'
														name="JFPASSWORD" class="form-control" placeholder="����������" >
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">ȷ������ <i
													style="color: red">*</i>
												</label>
												<div class=" col-md-9">
													<input type="password" id="password-input"
														name="confirmPassword" class="form-control"
														placeholder="����������">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">��λ���� <i
													style="color: red">*</i>
												</label>
												<div class=" col-md-9">
													<input type="text" name="JFNAME" class="form-control"
														placeholder="�����뵥λ����">
												</div>
											</div>
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
	function xztz(obj, allsize, ml, url) {
		var ys = prompt("������ҳ��:");
		if (isNaN(ys)) {
			alert("����������");
			return false;
		}
		if (ys != null && ys != "") {
			obj.href = ml + "/info/sel.do?page=" + ys + "&allSize=" + allsize
					+ url;
		}
	}
	function tjgx(id) {
		$("#upuser" + id).submit();
	}
	function deluser(id) {
		if (confirm("��ȷ��Ҫɾ����ɾ��ר����֯��ɾ����֯�µ���Ա�Լ��������ݣ������أ�")) {
			$("#deluser" + id).submit();
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
				JFUSERID : {
					validators : {
						notEmpty : {
							message : '�û�������Ϊ��'
						},
						regexp : {
							regexp : /^[a-zA-Z0-9_\.]+$/,
							message : 'ֻ������������ĸ�»���'
						}
					}
				},
				JFPASSWORD : {
					validators : {
						notEmpty : {
							message : '���벻��Ϊ��'
						},
						regexp : {
							regexp : /^[a-zA-Z0-9_\.]+$/,
							message : 'ֻ������������ĸ�»���'
						}
					}
				},
				confirmPassword : {
					validators : {
						notEmpty : {
							message : '������ȷ������'
						},
						identical : {
							field : 'JFPASSWORD',
							message : '�����벻һ��'
						}
					}
				},
				BMBM : {
					validators : {
						notEmpty : {
							message : '��ѡ����'
						}
					}
				},
				JFNAME : {
					validators : {
						notEmpty : {
							message : '��λ���Ʋ���Ϊ��'
						}
					}
				}
			}
		});
		$("#101").addClass("opened");
		$("#102").css('display', 'block');
	});
	function yzname(obj) {
		var value = obj.value;
		$.ajax({
			type : "post",
			url : "/Myssm_ZBZ/preven/yzname_zfzz.do",
			data : {
				JFUSERID : value
			},
			dataType : "json",
			async : false,
			error : function(XMLResponse) {
			},
			success : function(data) {
				if (data.data == 1) {
					alert("�û����ظ����������");
					obj.value = "";
					$("#myfrom").data("bootstrapValidator").updateStatus("JFUSERID",  "NOT_VALIDATED",  null );
					$.obj.focus();
				}
			}
		});
	}
</script>
<%
	String msg = (String) request.getAttribute("msg");
	if (msg != null && msg.equals("1")) {
		out.print("<script type='text/javascript'>alert('�ϴ��ļ���������');</script>");
	}
	if (msg != null && msg.equals("2")) {
		out.print("<script type='text/javascript'>alert('�ϴ��ļ����Ͳ�ƥ��');</script>");
	}
%>
</html>