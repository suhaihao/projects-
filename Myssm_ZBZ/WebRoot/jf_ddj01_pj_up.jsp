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
<body>
	<%
		request.setAttribute("dDJ01_PJ", request.getAttribute("dDJ01_PJ"));
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
							<li><i class="fa fa-star"></i>����</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>�����޸�</strong>
								</h2>
							</div>
							<form id="myfrom" action="${path}pj/update.do" method="post"
								class="form-horizontal">
								<div id="body" class="panel-body">
									<input type="hidden" id="JFID" name="JFID"
										value="${dDJ01_PJ.JFID}"> <input type="hidden" id="ZT"
										name="ZT" value=""> <input type="hidden" id="Str"
										value="">
									<div class="form-group">
										<label class="col-md-3 control-label">ѡ��ר����֯ <i
											style="color: red">*</i></label>
										<div class="col-md-7">
											<input type="text" id="DDJ01_MCN" name="DDJ01_MC"
												class="form-control" placeholder="��ѡ��ר����֯"
												value="${dDJ01_PJ.DDJ01_MC}" readonly="readonly"> <input
												type="hidden" id="DDJ01_JFIDN" name="DDJ01_JFID"
												value="${dDJ01_PJ.DDJ01_JFID}" />
										</div>
										<div class="col-md-2">
											<a class="btn btn-info" href="javascript:void(0);"
												onclick="jsryN()"> <i class="fa fa-search"></i>
											</a>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">���� <i
											style="color: red">*</i></label>
										<div class="col-md-9">
											<select id="select" name="PJ" class="form-control" size="1">
												<option value="">��ѡ��</option>
												<jf:if test="${dDJ01_PJ.PJ==1}">
													<option value="1" selected="selected">һ��</option>
												</jf:if>
												<jf:if test="${dDJ01_PJ.PJ!=1}">
													<option value="1">һ��</option>
												</jf:if>
												<jf:if test="${dDJ01_PJ.PJ==2}">
													<option value="2" selected="selected">����</option>
												</jf:if>
												<jf:if test="${dDJ01_PJ.PJ!=2}">
													<option value="2">����</option>
												</jf:if>
												<jf:if test="${dDJ01_PJ.PJ==3}">
													<option value="3" selected="selected">����</option>
												</jf:if>
												<jf:if test="${dDJ01_PJ.PJ!=3}">
													<option value="3">����</option>
												</jf:if>
												<jf:if test="${dDJ01_PJ.PJ==4}">
													<option value="4" selected="selected">����</option>
												</jf:if>
												<jf:if test="${dDJ01_PJ.PJ!=4}">
													<option value="4">����</option>
												</jf:if>
												<jf:if test="${dDJ01_PJ.PJ==5}">
													<option value="5" selected="selected">����</option>
												</jf:if>
												<jf:if test="${dDJ01_PJ.PJ!=5}">
													<option value="5">����</option>
												</jf:if>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">����˵��</label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="PJ_SM" rows="9"
												class="form-control" placeholder="˵��ʲô������">${dDJ01_PJ.PJ_SM}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">¼����Ա</label>
										<div class="col-md-9">
											<input type="text" class="form-control"
												value="${dDJ01_PJ.LRRY}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">¼������</label>
										<div class="col-md-9">
											<input type="text" class="form-control"
												value="<fmt:formatDate value="${dDJ01_PJ.LRRQ}" pattern="yyyy-MM-dd HH:mm:ss" />"
												readonly="readonly">
										</div>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-success" onclick="sub(1)">
											<i class="fa fa-dot-circle-o"></i> �ύ
										</button>
										<button type="submit" class="btn btn-primary" onclick="sub(0)">
											<i class="fa fa-check-square"></i> ����
										</button>
										<a class="btn btn-danger" href="${path}pj/sel.do"> <i
											class="fa fa-reply"></i> ����
										</a>
									</div>
								</div>
							</form>
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
	function sub(zt) {
		$("#ZT").val(zt);
	}
	function xgzfzz(obj) {
		if (obj.value == "") {
			$("#DDJ01_JFID").val("");
		}
	}
	function jsryN() {
		window.showModalDialog("/Myssm_ZBZ/evaluate/selZFZZ.do?XXDBLB=3", 0,
				"dialogWidth=1000px;dialogHeight=700px;");
		var strs = $("#Str").val().split(",");
		$("#DDJ01_JFIDN").attr("value", strs[0]);
		$("#DDJ01_MCN").attr("value", strs[1]);
		$("#Str").val("");
		$('#myfrom').data("bootstrapValidator").updateStatus("DDJ01_MC",
				"NOT_VALIDATED", null);
		$('#myfrom').data("bootstrapValidator").validateField('DDJ01_MC');
	}
	function xztz(obj, allsize, ml, url) {
		var ys = prompt("������ҳ��:");
		if (isNaN(ys)) {
			alert("����������");
			return false;
		}
		if (ys != null && ys != "") {
			obj.href = ml + "pj/sel.do?page=" + ys + "&allSize=" + allsize
					+ url;
		}
	}
	function tjgx(id) {
		$("#upuser" + id).submit();
	}
	function qxtj(id) {
		$("#qxuser" + id).submit();
	}
	function deluser(id) {
		if (confirm("��ȷ��Ҫɾ����")) {
			$("#deluser" + id).submit();
		}
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
				DDJ01_MC : {
					validators : {
						notEmpty : {
							message : '��ѡ��ר����֯'
						}
					}
				},
				PJ : {
					validators : {
						notEmpty : {
							message : '���������'
						}
					}
				}
			}
		});
		$("#101").addClass("opened");
		$("#102").css('display', 'block');
	});
</script>
</html>