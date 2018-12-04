<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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
		request.setAttribute("dFW11", request.getAttribute("dFW11"));
		request.setAttribute("listhxjsfl",
				request.getAttribute("listhxjsfl"));
		request.setAttribute("listdfw11_d",
				request.getAttribute("listdfw11_d"));
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
							<li><i class="fa fa-heart"></i>��������</li>
							<li><i class="fa fa-book"></i>֪ʶ��</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>֪ʶ���޸�</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div id="body" class="panel-body">
								<!-- �� -->
								<form id="myfrom" action="${path}/hxjs/update.do" method="post"
									class="form-horizontal">
									<input type="hidden" id="ZT" name="ZT"> <input
										type="hidden" name="JFID" value="${dFW11.JFID}">
									<div class="form-group">
										<label class="col-md-3 control-label">���� </label>
										<div class="col-md-9">
											<select id="select" name="FL" class="form-control" size="1">
												<option value="">��ѡ��</option>
												<jf:forEach var="hxjsfl" items="${listhxjsfl}">
													<jf:if test="${hxjsfl.BM==dFW11.FL}">
														<option selected="selected" value="${hxjsfl.BM}">${hxjsfl.HZMC}</option>
													</jf:if>
													<jf:if test="${hxjsfl.BM!=dFW11.FL}">
														<option value="${hxjsfl.BM}">${hxjsfl.HZMC}</option>
													</jf:if>
												</jf:forEach>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">���� </label>
										<div class="col-md-9">
											<input type="text" name="BT" class="form-control"
												value="${dFW11.BT}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">����</label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="NR" rows="3"
												class="form-control" placeholder="˵��ʲô������">${dFW11.NR}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">����</label>
										<div class="col-md-9"></div>
									</div>
									<jf:forEach var="dfw11_d" items="${listdfw11_d}">
										<div class="form-group">
											<label class="col-md-3 control-label"></label>
											<div class="col-md-9">
												<jf:if test="${fn:contains(dfw11_d.FJ_WJM,'jpg')==true}">
													<a href="${path}${dfw11_d.FJ_LJ}"> ${dfw11_d.FJ_WJM} </a>
													<a class="btn btn-sm btn-danger" href="javascript:void(0);"
														onclick="sctjfj(this,'${path}hxjs/deleteattachment.do?JFID=${dfw11_d.JFID}&DFW11_JFID=${dFW11.JFID}')">
														<i class="fa fa-trash-o "></i>
													</a>
												</jf:if>
												<jf:if test="${fn:contains(dfw11_d.FJ_WJM,'png')==true}">
													<a href="${path}${dfw11_d.FJ_LJ}"> ${dfw11_d.FJ_WJM} </a>
													<a class="btn btn-sm btn-danger" href="javascript:void(0);"
														onclick="sctjfj(this,'${path}hxjs/deleteattachment.do?JFID=${dfw11_d.JFID}&DFW11_JFID=${dFW11.JFID}')">
														<i class="fa fa-trash-o "></i>
													</a>
												</jf:if>
												<jf:if
													test="${fn:contains(dfw11_d.FJ_WJM,'jpg')!=true and fn:contains(dfw11_d.FJ_WJM,'png')!=true}">
													<a
														href="${path}hxjs/downloadfile.do?fileurl=${dfw11_d.FJ_LJ}&filename=${dfw11_d.FJ_WJM}">
														${dfw11_d.FJ_WJM} </a>
													<a class="btn btn-sm btn-danger" href="javascript:void(0);"
														onclick="sctjfj(this,'${path}hxjs/deleteattachment.do?JFID=${dfw11_d.JFID}&DFW11_JFID=${dFW11.JFID}')">
														<i class="fa fa-trash-o "></i>
													</a>
												</jf:if>
											</div>
										</div>
									</jf:forEach>
									<div class="form-group">
										<label class="col-md-3 control-label">����</label>
										<div class="col-md-9">
											<a class="btn btn-sm btn-success" href="javascript:void(0);"
												onclick="tjfj()"><i class="fa fa-search-plus "></i> ��Ӹ���
											</a>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label"></label>
										<div id="file" class="col-md-9"></div>
									</div>
									<div class="modal-footer" style="text-align: center;">
										<button type="submit" class="btn btn-sm btn-success"
											onclick="sun(1)">
											<i class="fa fa-dot-circle-o"></i> �ύ
										</button>
										<button type="submit" class="btn btn-sm btn-primary"
											onclick="sun(0)">
											<i class="fa fa-check-squar"></i> ����
										</button>
										<a class="btn btn-sm btn-danger" href="${path}hxjs/sel.do">
											<i class="fa fa-reply"></i> ����
										</a>
									</div>
								</form>
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
	function sctjfj(obj, url) {
		if (confirm("��ȷ��Ҫɾ����")) {
			obj.href = url;
		}
	}
	function sun(zt) {
		$("#ZT").attr('value', zt);
		//window.setInterval(eventFun, 2000);
	}
	function eventFun() {
		$.ajax({
			type : "GET",
			url : "/Myssm_ZBZ/hxjs/getfileSize.do",
			dataType : "json",
			async : false,
			error : function(XMLResponse) {
			},
			success : function(data) {
			}
		});
	}
	function sclogo() {
		document.getElementById("myfrom").enctype = "multipart/form-data";
	}
	function sub(zt) {
		$("#ZT").attr("value", zt);
	}
	function tjfj() {
		if ($("#file").html() == "") {
			$("#file")
					.append(
							"<input type='file' id='1' style='padding: 5px;' name='file-input' onchange='sclogo()'><a class='btn btn-sm btn-danger' style='margin-left: 300px;margin-top: -50px;'  href='javascript:void(0);' onclick=\"scfj('1',this)\"> <i class='fa fa-trash-o '></i></a>");
		} else {
			var id = parseInt($("#file input").last().attr("id")) + 1;
			$("#file")
					.append(
							"<input type='file' id='"
									+ id
									+ "' style='padding: 5px;' name='file-input' onchange='sclogo()'><a class='btn btn-sm btn-danger' style='margin-left: 300px;margin-top: -50px;' href='javascript:void(0);' onclick=\"scfj('"
									+ id
									+ "',this)\"> <i class='fa fa-trash-o '></i></a>");
		}
	}
	function scfj(id, obj) {
		if (confirm("�Ƿ�ɾ��")) {
			obj.remove();
			$("#" + id).remove();
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
				FL : {
					validators : {
						notEmpty : {
							message : '��ѡ�����'
						}
					}
				},
				BT : {
					validators : {
						notEmpty : {
							message : '���ⲻ��Ϊ��'
						}
					}
				}
			}
		});
		$("#201").addClass("opened");
		$("#202").css('display', 'block');
	});
</script>
<%
	String msg = (String) request.getAttribute("msg");
	if (msg != null && msg.equals("1")) {
		out.print("<script type='text/javascript'>alert('�ϴ��ļ���������');</script>");
	}
%>
</html>