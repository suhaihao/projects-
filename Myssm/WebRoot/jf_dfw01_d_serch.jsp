<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jf"%>
<%@ page import="com.ssh.user.model.Dsys11"%>
<%@ page import="com.ssh.user.util.EHCache"%>
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
		EHCache eHCache = new EHCache("ehcacheMenu");
		   List<Dsys11> listsyqx = (List<Dsys11>) eHCache
		.getCacheElement("listsyqx");
		    request.setAttribute("listsyqx", listsyqx);
			request.setAttribute("StarTime", request.getAttribute("StarTime"));
			request.setAttribute("EndTime", request.getAttribute("EndTime"));
			request.setAttribute("DDJ02_D_JFID",
			request.getAttribute("DDJ02_D_JFID"));
			request.setAttribute("DDJ02_D_DH",
			request.getAttribute("DDJ02_D_DH"));
			request.setAttribute("listdfw01_d",
			request.getAttribute("listdfw01_d"));
			request.setAttribute("listzw", request.getAttribute("listzw"));
			request.setAttribute("listdklx", request.getAttribute("listdklx"));
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
							<li><i class="fa fa-location-arrow"></i>����׷��</li>
							<li><i class="fa fa-tint"></i>����׷��</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>����׷��</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<form action="${path}dkzz/sel.do" class="form-inline text-right"
									method="post">
									<input id="Str" type="hidden">
									<div class="form-group">
										<label class="control-label">ʱ�䣺</label>
									</div>
									<div class="form-group">
										<input id="datetimepickerup" name="StarTime" type="text"
											class="form-control" placeholder="��ʼ���ڣ�yyyy-mm-dd��"
											data-date-format="yyyy-mm-dd" value="${StarTime}" style="width: 150px;">
									</div>
									<div class="form-group">
										<input id="datetimepickerdon" name="EndTime" type="text"
											class="form-control" placeholder="�������ڣ�yyyy-mm-dd��"
											data-date-format="yyyy-mm-dd" value="${EndTime}" style="width: 150px;">
									</div>
									<div class="form-group">
										<input type="text" id="DDJ02_D_DH" name="DDJ02_D_DH"
											class="form-control" value="${DDJ02_D_DH}"
											onchange="XG(this)" style="width: 150px;"> <input type="hidden"
											id="DDJ02_D_JFID" name="DDJ02_D_JFID" class="form-control"
											value="${DDJ02_D_JFID}">
									</div>
									<div class="form-group">
										<a href="javascript:void(0);" class="btn btn-info "
											onclick="xzdk()"> <i class="fa fa-search "></i> ѡ��ؿ�
										</a>
									</div>
									<div class="form-group">
										<button class="btn btn-info" type="submit">
											<i class="fa fa-search "></i> ��ѯ
										</button>
									</div>
								</form>
							</div>
							<jf:if test="${not empty listdfw01_d}">
								<form id="mydk" action="" method="post" class="form-horizontal">
									<div class="panel-body">
										<div class="form-group">
											<label class="col-md-2 control-label">����: </label>
											<div class="col-md-2">
												<label class="control-label">${dDJ02.MC}</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label">������ :</label>
											<div class="col-md-2">
												<jf:forEach var="dklx" items="${listdklx}">
													<jf:if test="${dDJ02_D.DLX==dklx.BM}">
														<label class="control-label">${dklx.HZMC}</label>
													</jf:if>
												</jf:forEach>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label">������:</label>
											<div class="col-md-2">
												<label class="control-label">${dDJ02_D.DH}</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label">�����:</label>
											<div class="col-md-2">
												<label class="control-label">${dDJ02_D.MJ}(Ķ)</label>
											</div>
										</div>
										<div
											style="position:absolute;margin-left:400px;margin-top: -160px;">
											<div class="col-md-2">
												<img id="oImg" class="img-rounded" alt="��ά��"
													style="width: 150px;height: 150px;"
													src="${path}yhgl/wcewm.do?path=yhgl/ewmcx.do?DDJ02_D_JFID=${dDJ02_D.JFID}&MC=${dDJ02.MC}&MJ=${dDJ02_D.MJ}&DH=${dDJ02_D.DH}&DLX=${dDJ02_D.DLX}" />
											</div>
										</div>
									</div>
									<jf:forEach var="dfw01_d" items="${listdfw01_d}">
										<div class="panel-body">
											<div class="form-group">
												<label class="col-md-2 control-label">������ ��</label>
												<div class="col-md-3">
													<label class="control-label">${dfw01_d.JFID}-${dfw01_d.DFW01_JFID}</label>
												</div>
												<div class="col-md-3">
													<label class="control-label">${dfw01_d.FWNRLB}</label>
												</div>
												<div class="col-md-3">
													<label class="control-label">${dfw01_d.DDJ01_MC}</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-2 control-label">ʱ�� ��</label>
												<div class="col-md-5">
													<label class="control-label">${dfw01_d.LSRQ}</label>
												</div>
												<label class="col-md-2 control-label">������� :</label>
												<div class="col-md-2">
													<label class="control-label">${dfw01_d.FZMJ}(Ķ)</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-2 control-label">������ ��</label>
												<div class="col-md-9">
													<label class="control-label">${dfw01_d.FZFZR_MC}</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-2 control-label">������Ա�� </label>
												<div class="col-md-9">
													<label class="control-label">${dfw01_d.FZRY_MC}</label>
												</div>
											</div>
											<div class="form-group">
												<jf:if test="${dfw01_d.ZW!=99}">
													<label class="col-md-2 control-label">ũ���� ��</label>
													<div class="col-md-2">
														<jf:forEach var="zw" items="${listzw}">
															<jf:if test="${dfw01_d.ZW==zw.BM}">
																<label class="control-label">${zw.HZMC}</label>
															</jf:if>
														</jf:forEach>
													</div>
												</jf:if>
												<jf:if test="${dfw01_d.ZW==99}">
													<label class="col-md-2 control-label">ũ���</label>
													<div class="col-md-2">
														<label class="control-label">${dfw01_d.ZW_MC}</label>
													</div>
												</jf:if>
												<label class="col-md-2 control-label">���ζ��� </label>
												<div class="col-md-2">
													<label class="control-label">${dfw01_d.FZDX}</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-2 control-label">ʩҩ��е ��</label>
												<div class="col-md-8">
													<label class="control-label"><jf:forEach var="syqx"
															items="${listsyqx}">
															<jf:if test="${dfw01_d.SYQX==syqx.BM}">${syqx.HZMC}</jf:if>
														</jf:forEach></label>
												</div>
											</div>
											<div class="form-group">
												<jf:if test="${dfw01_d.SF_FZ==1}">
													<label class="col-md-2 control-label">����</label>
												</jf:if>
												<jf:if test="${dfw01_d.SF_XP==1}">
													<label class="col-md-2 control-label">Ѳ��</label>
												</jf:if>
											</div>
											<div class="form-group">
												<label class="col-md-2 control-label">˵������ ��</label>
												<div class="col-md-8">
													<label class="control-label">${dfw01_d.SMZT}</label>
												</div>
											</div>
											<jf:if
												test="${dfw01_d.SF_XP==1 and dfw01_d.SF_FZ==1 or dfw01_d.SF_XP==0 and dfw01_d.SF_FZ==1}">
												<div class="form-group" style="text-align: center;">
													<label class="col-md-8">���δ�ʩ��ϸ</label>
												</div>
												<div class="form-group" style="text-align: center;">
													<label class="col-md-2 ">NO.</label> <label
														class="col-md-2 ">���δ�ʩ</label> <label class="col-md-2 ">ʹ����</label>
													<label class="col-md-2 ">��λ</label>
												</div>
												<jf:if test="${not empty dfw01_d.DDJ11_MC1}">
													<div class="form-group" style="text-align: center;">
														<div class="col-md-2">
															<label class="control-label">1</label>
														</div>
														<div class="col-md-2">
															<label class="control-label">${dfw01_d.DDJ11_MC1}</label>
														</div>
														<div class="col-md-2">
															<label class="control-label">${dfw01_d.SYL1}</label>
														</div>
														<div class="col-md-2">
															<label class="control-label">${dfw01_d.DDJ11_DW1MC}</label>
														</div>
													</div>
												</jf:if>
												<jf:if test="${not empty dfw01_d.DDJ11_MC2}">
													<div class="form-group" style="text-align: center;">
														<div class="col-md-2">
															<label class="control-label">2</label>
														</div>
														<div class="col-md-2">
															<label class="control-label">${dfw01_d.DDJ11_MC2}</label>
														</div>
														<div class="col-md-2">
															<label class="control-label">${dfw01_d.SYL2}</label>
														</div>
														<div class="col-md-2">
															<label class="control-label">${dfw01_d.DDJ11_DW2MC}</label>
														</div>
													</div>
												</jf:if>
												<jf:if test="${not empty dfw01_d.DDJ11_MC3}">
													<div class="form-group" style="text-align: center;">
														<div class="col-md-2">
															<label class="control-label">3</label>
														</div>
														<div class="col-md-2">
															<label class="control-label">${dfw01_d.DDJ11_MC3}</label>
														</div>
														<div class="col-md-2">
															<label class="control-label">${dfw01_d.SYL3}</label>
														</div>
														<div class="col-md-2">
															<label class="control-label">${dfw01_d.DDJ11_DW3MC}</label>
														</div>
													</div>
												</jf:if>
												<jf:if test="${not empty dfw01_d.DDJ11_MC4}">
													<div class="form-group" style="text-align: center;">
														<div class="col-md-2">
															<label class="control-label">4</label>
														</div>
														<div class="col-md-2">
															<label class="control-label">${dfw01_d.DDJ11_MC4}</label>
														</div>
														<div class="col-md-2">
															<label class="control-label">${dfw01_d.SYL4}</label>
														</div>
														<div class="col-md-2">
															<label class="control-label">${dfw01_d.DDJ11_DW4MC}</label>
														</div>
													</div>
												</jf:if>
											</jf:if>
											<div class="modal-footer" style="text-align: center;">
												<a
													href="${path}ordergd/ckzp.do?dfw01_d_jfid=${dfw01_d.JFID}"
													class="btn btn-sm btn-info " target="_blank"> <i
													class="fa fa-search "></i> �鿴��ҵ��Ƭ
												</a>
											</div>
										</div>
									</jf:forEach>
								</form>
							</jf:if>
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
	function XG(obj) {
		if (obj.value == "") {
			$("#DDJ02_D_JFID").attr("value", "");
		}
	}
	function xzdk() {
		window.open("/Myssm/dkzz/seldk.do", 0,
				"dialogWidth=800px;dialogHeight=auto;height=auto");
	}
	function dkxz() {
		var strs = $("#Str").val().split(",");
		$("#DDJ02_D_DH").attr("value", strs[1]);
		$("#DDJ02_D_JFID").attr("value", strs[0]);
		$("#Str").val("");
	}
	function xztz(obj, allsize, ml, url) {
		var ys = prompt("������ҳ��:");
		if (isNaN(ys)) {
			alert("����������");
			return false;
		}
		if (ys != null && ys != "") {
			obj.href = ml + "dkzz/sel.do?page=" + ys + "&allSize=" + allsize
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
				},
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
				DH : {
					validators : {
						phone : {
							message : '�绰���벻��ȷ'
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
							message : '��������Ϊ��'
						}
					}
				}
			}
		});
		$("#401").addClass("opened");
		$("#402").css('display', 'block');
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
		todayBtn : true,
	});
	$('#datetimepickerdon').datetimepicker({
		minView : "month",//����ֻ��ʾ���·�
		autoclose : true,
		language : 'zh-CN',
		todayBtn : true,
	});
</script>
</html>