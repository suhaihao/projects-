<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.ssh.user.model.User"%>
<%@page import="com.ssh.user.util.EHCache"%>
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
</head>

<body>
	<%
		User user = (User) request.getAttribute("userxq");
		request.setAttribute("userxq", user);
		EHCache eHCache = new EHCache("ehcacheMenu");
		request.setAttribute("listrylb",
				eHCache.getCacheElement("listrylb"));
		request.setAttribute("listxl", eHCache.getCacheElement("listxl"));
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
							<li><i class="fa fa-users"></i>Ա������</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>Ա���޸�</strong>
								</h2>
								<div class="panel-actions">
									<a href="table.html#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<!-- �� -->
								<form id="myfrom" action="${path}/preven/usms.do" method="post"
									class="form-horizontal">
									<input type="hidden" name="JFID" value="${userxq.JFID}">
									<input type="hidden" name="ZPLJ" value="${userxq.ZPLJ}">
									<jf:if test="${not empty userxq.ZPLJ}">
										<div class="form-group">
											<label class="col-md-3 control-label">ͷ��</label>
											<div class="col-md-9">
												<div style="width: 120px;height: 120px;">
													<img class="img-thumbnail" src="${path}${userxq.ZPLJ}">
												</div>
											</div>
										</div>
									</jf:if>
									<jf:if test="${userxq.RYFL!=99}">
										<div class="form-group">
											<label class="col-md-3 control-label">��Ա����</label>
											<div class="col-md-9">
												<select id="select" name="RYFL" class="form-control"
													size="1">
													<jf:forEach var="lb" items="${listrylb}">
														<jf:if test="${lb.BM!=99}">
															<jf:if test="${lb.BM==userxq.RYFL}">
																<option value="${lb.BM}" selected="selected">${lb.HZMC}</option>
															</jf:if>
															<jf:if test="${lb.BM!=userxq.RYFL}">
																<option value="${lb.BM}">${lb.HZMC}</option>
															</jf:if>
														</jf:if>
													</jf:forEach>
												</select>
											</div>
										</div>
									</jf:if>
									<div class="form-group">
										<label class="col-md-3 control-label">���� <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="JFNAME"
												class="form-control" placeholder="����������"
												value="${userxq.JFNAME}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Email</label>
										<div class="col-md-9">
											<input type="email" id="email-input" name="DZXX"
												class="form-control" placeholder="�����ַ"
												value="${userxq.DZXX}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�绰</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="DH"
												class="form-control" placeholder="������绰"
												value="${userxq.DH}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�ֻ�</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="SJ"
												class="form-control" placeholder="�������ֻ�"
												value="${userxq.SJ}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">����</label>
										<div class="col-md-9">
											<input id="datetimepicker" type="text" name="SR"
												class="form-control" placeholder="���������գ�yyyy-mm-dd��"
												data-date-format="yyyy-mm-dd"
												value="<fmt:formatDate value="${userxq.SR}" pattern="yyyy-MM-dd"/>"
												onchange="xgsr()">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">ѧ��</label>
										<div class="col-md-9">
											<select id="select" name="XL" class="form-control" size="1">
												<option value="0">��ѡ��</option>
												<jf:forEach var="xl" items="${listxl}">
													<jf:if test="${xl.BM==userxq.XL}">
														<option value="${xl.BM}" selected="selected">${xl.HZMC}</option>
													</jf:if>
													<jf:if test="${xl.BM!=userxq.XL}">
														<option value="${xl.BM}">${xl.HZMC}</option>
													</jf:if>
												</jf:forEach>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�Ա�</label>
										<div class="col-md-9">
											<jf:if test="${userxq.XB==0}">
												<label class="radio-inline"> <input type="radio"
													id="inline-radio1" name="XB" checked="checked" value="0">
													��
												</label>
												<label class="radio-inline"> <input type="radio"
													id="inline-radio2" name="XB" value="1"> Ů
												</label>
											</jf:if>
											<jf:if test="${userxq.XB==1}">
												<label class="radio-inline"> <input type="radio"
													id="inline-radio1" name="XB" value="0"> ��
												</label>
												<label class="radio-inline"> <input type="radio"
													id="inline-radio2" name="XB" checked="checked" value="1">
													Ů
												</label>
											</jf:if>
										</div>
									</div>
									<div class="form-group" style="display: none;">
										<div class="col-md-9">
											<label class="radio-inline"> <input type="radio"
												id="inline-radio1" name="XXDBLB" checked="checked" value="4">
												����
											</label> <label class="radio-inline"> <input type="radio"
												id="inline-radio2" name="XXDBLB" value="3"> ר����֯
											</label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�Ƿ����</label>
										<div class="col-md-9">
											<jf:if test="${userxq.JFSTATE==0}">
												<label class="radio-inline"> <input type="radio"
													id="inline-radio1" name="JFSTATE" checked="checked"
													value="0"> ����
												</label>
												<label class="radio-inline"> <input type="radio"
													id="inline-radio2" name="JFSTATE" value="1"> ������
												</label>
											</jf:if>
											<jf:if test="${userxq.JFSTATE==1}">
												<label class="radio-inline"> <input type="radio"
													id="inline-radio1" name="JFSTATE" value="0"> ����
												</label>
												<label class="radio-inline"> <input type="radio"
													id="inline-radio2" name="JFSTATE" checked="checked"
													value="1"> ������
												</label>
											</jf:if>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">ǿ���޸�����</label>
										<div class="col-md-9">
											<jf:if test="${userxq.SF_XGPW==0}">
												<label class="radio-inline"> <input type="radio"
													id="inline-radio1" name="SF_XGPW" checked="checked"
													value="0"> ��
												</label>
												<label class="radio-inline"> <input type="radio"
													id="inline-radio2" name="SF_XGPW" value="1"> ��
												</label>
											</jf:if>
											<jf:if test="${userxq.SF_XGPW==1}">
												<label class="radio-inline"> <input type="radio"
													id="inline-radio1" name="SF_XGPW" value="0"> ��
												</label>
												<label class="radio-inline"> <input type="radio"
													id="inline-radio2" name="SF_XGPW" checked="checked"
													value="1"> ��
												</label>
											</jf:if>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�ϴ�ͷ��</label>
										<div class="col-md-9" onchange="scjs()">
											<input type="file" id="file-input" name="file-input">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">��ע</label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="JFREMARK" rows="3"
												class="form-control" placeholder="˵��ʲô������">${userxq.JFREMARK}</textarea>
										</div>
										<br>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-sm btn-success">
											<i class="fa fa-dot-circle-o"></i> �ύ
										</button>
										<a class="btn btn-info btn-sm btn-setting" href="#"
											onclick="xgmm('${userxq.JFID}')"> <i class="fa fa-edit "></i>
											�޸�����
										</a> <a class="btn btn-sm btn-danger" data-dismiss="modal"
											href="javascript:void(0);" onclick="tjgx()"> <i
											class="fa fa-ban"></i> ����
										</a>
									</div>
								</form>
								<!-- ������ -->
								<form id="upuser" action="${path}/preven/sel.do"></form>
							</div>
						</div>
					</div>
					<!--/col-->
				</div>
			</div>
			<!-- end: Content -->
			<!-- foot -->
			<div id="usage">
				<label><img src="${path}assets/img/logo/GB.png">Copyright
					�����ʷ�������Ϣ�������޹�˾</label>
			</div>
		</div>
		<!--/container-->

		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">�޸�����</h4>
					</div>
					<form id="elofrom" action="${path}/preven/uppas.do" method="post"
						class="form-horizontal">
						<input id="JFID" type="hidden" name="JFID" value="">
						<div class="modal-body">
							<!-- �� -->
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h2>
												<i class="fa fa-indent red"></i><strong>�޸�����</strong>
											</h2>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="col-md-3 control-label">���� <i
													style="color: red">*</i>
												</label>
												<div class=" col-md-9">
													<input type="password" id="password-input"
														name="JFPASSWORD" class="form-control" placeholder="����������">
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
	function xgsr() {
		$("#myfrom").data('bootstrapValidator').validateField('SR');
		$("#myfrom").data('bootstrapValidator').updateStatus('SR',
				'NOT_VALIDATED', null).validateField('SR');
	}
	function xgmm(id) {
		$("#JFID").attr("value", id);
	}
	function tjgx() {
		$("#upuser").submit();
	}
	function scjs() {
		document.getElementById("myfrom").enctype = "multipart/form-data";
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
				DZXX : {
					validators : {
						emailAddress : {
							message : '�����ʽ����ȷ'
						}
					}
				},
				SJ : {
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
				},
				JFNAME : {
					validators : {
						notEmpty : {
							message : '��������Ϊ��'
						}
					}
				},
				SR : {
					validators : {
						date : {
							format : 'YYYY-MM-DD',
							message : '���ڸ�ʽ����ȷ��yyyy-mm-dd��'
						}
					}
				}
			}
		});
		$('#elofrom').bootstrapValidator({
			message : 'This value is not valid',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				JFPASSWORD : {
					validators : {
						notEmpty : {
							message : '���벻��Ϊ��'
						}
					}
				},
				confirmPassword : {
					validators : {
						notEmpty : {
							message : '���벻��Ϊ��'
						},
						identical : {
							field : 'JFPASSWORD',
							message : '�����벻һ��'
						}
					}
				}
			}
		});
		$("#901").addClass("opened");
		$("#902").css('display', 'block');
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
	$('#datetimepicker').datetimepicker({
		minView : "month",//����ֻ��ʾ���·�
		autoclose : true,
		language : 'zh-CN',
		todayBtn : true,
		forceParse : false
	});
</script>
<%
	String msg = (String) request.getAttribute("msg");
	if (msg != null && msg.equals("1")) {
		out.print("<script type='text/javascript'>alert('�ϴ��ļ���������');</script>");
	}
	if (msg != null && msg.equals("2")) {
		out.print("<script type='text/javascript'>alert('�ϴ��ļ����Ͳ�ƥ��');</script>");
	}
	if (msg != null && !msg.equals("1") && !msg.equals("2")) {
		out.print("<script type='text/javascript'>alert('" + msg
				+ "');</script>");
	}
%>
</html>