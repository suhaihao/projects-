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
							<li><i class="fa fa-heart"></i>����֧��</li>
							<li><i class="fa fa-bolt"></i>���ļ����鿴</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>���ļ����鿴</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div id="body" class="panel-body">
								<!-- ���� -->
								<form id="myfrom" action="${path}/order/upinfo.do" method="post"
									class="form-horizontal">
									<div class="form-group">
										<label class="col-md-3 control-label">���� </label>
										<div class="col-md-9">
											<jf:forEach var="hxjsfl" items="${listhxjsfl}">
												<jf:if test="${dFW11.FL==hxjsfl.BM}">
													<input type="text" class="form-control" readonly="readonly"
														value="${hxjsfl.HZMC}">
												</jf:if>
											</jf:forEach>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">���� </label>
										<div class="col-md-9">
											<input type="text" class="form-control" readonly="readonly"
												value="${dFW11.BT}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">����</label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="BZ" rows="3"
												class="form-control" placeholder="˵��ʲô������"
												readonly="readonly">${dFW11.NR}</textarea>
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
													<a href="${path}${dfw11_d.FJ_LJ}" target="_blank">${dfw11_d.FJ_WJM}</a>
												</jf:if>
												<jf:if test="${fn:contains(dfw11_d.FJ_WJM,'png')==true}">
													<a href="${path}${dfw11_d.FJ_LJ}" target="_blank">${dfw11_d.FJ_WJM}</a>
												</jf:if>
												<jf:if
													test="${fn:contains(dfw11_d.FJ_WJM,'jpg')!=true and fn:contains(dfw11_d.FJ_WJM,'png')!=true}">
													<a
														href="${path}hxjs/downloadfile.do?fileurl=${dfw11_d.FJ_LJ}&filename=${dfw11_d.FJ_WJM}"
														target="_blank">${dfw11_d.FJ_WJM}</a>
												</jf:if>
											</div>
										</div>
									</jf:forEach>
									<div class="modal-footer" style="text-align: center;">
										<a class="btn btn-danger" href="javascript:history.go(-1)">
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
	function sub(zt) {
		$("#ZT").attr("value", zt);
	}
	function delzj(obj, JFID, path, SFJE, fatherJFID) {
		if (confirm("��ȷ��Ҫɾ����")) {
			obj.href = path + "order/deldk.do?JFID=" + JFID + "&fatherSFJE="
					+ SFJE + "&fatherJFID=" + fatherJFID;
		}
	}
	function tjdk() {
		if ($("#DDJ02_D_DH").val() == "") {
			alert("��ѡ��ؿ�");
			return false;
		}
		if ($("#FZMJ").val() == "") {
			alert("������������");
			return false;
		} else {
			if (isNaN($("#FZMJ").val())) {
				alert("����������");
				return false;
			}
		}
		if ($("#DDJ11_MC1").val() == "" && $("#DDJ11_MC2").val() == ""
				&& $("#DDJ11_MC3").val() == "" && $("#DDJ11_MC4").val() == "") {
			alert("ũҵ��ʩ1����2��������ʩ1����2����ѡһ��");
			return false;
		}
		if ($("#DDJ11_MC1").val() != "") {
			if ($("#SYL1").val() == "") {
				alert("������ũҩ1��ʹ����");
				return false;
			} else {
				if (isNaN($("#SYL1").val())) {
					alert("����������");
					return false;
				}
			}
		}
		if ($("#DDJ11_MC2").val() != "") {
			if ($("#SYL2").val() == "") {
				alert("������ũҩ2��ʹ����");
				return false;
			} else {
				if (isNaN($("#SYL2").val())) {
					alert("����������");
					return false;
				}
			}
		}
		if ($("#DDJ11_MC3").val() != "") {
			if ($("#SYL3").val() == "") {
				alert("������������ʩ1��ʹ����");
				return false;
			} else {
				if (isNaN($("#SYL3").val())) {
					alert("����������");
					return false;
				}
			}
		}
		if ($("#DDJ11_MC4").val() != "") {
			if ($("#SYL4").val() == "") {
				alert("������������ʩ2��ʹ����");
				return false;
			} else {
				if (isNaN($("#SYL4").val())) {
					alert("����������");
					return false;
				}
			}
		}
		if (isNaN($("#SFJE").val())) {
			alert("����������");
			return false;
		}
		if ($("#SYL1").val() != "") {
			if ($("#DDJ11_MC1").val() == "") {
				alert("��ѡ��ũҩ��ʩ1");
				return false;
			}
		}
		if ($("#SYL2").val() != "") {
			if ($("#DDJ11_MC2").val() == "") {
				alert("��ѡ��ũҩ��ʩ2");
				return false;
			}
		}
		if ($("#SYL3").val() != "") {
			if ($("#DDJ11_MC3").val() == "") {
				alert("��ѡ��������ʩ1");
				return false;
			}
		}
		if ($("#SYL4").val() != "") {
			if ($("#DDJ11_MC4").val() == "") {
				alert("��ѡ��������ʩ2");
				return false;
			}
		}
		$("#mydk").submit();
	}
	function qtcs(id) {
		var returnvl = window.showModalDialog("/Myssm/order/selfzqtcs.do", 0,
				"dialogWidth=800px;dialogHeight=auto;height=auto");
		var strs = returnvl.split(",");
		$("#DDJ11_JFID" + id).attr("value", strs[0]);
		$("#DDJ11_MC" + id).attr("value", strs[1]);
		$("#DDJ11_FL" + id).attr("value", strs[2]);
		$("#DDJ11_DW" + id).attr("value", strs[3]);
		$("#DDJ11_DJ" + id).attr("value", strs[4]);
		$("#DDJ11_BZGG" + id).attr("value", strs[5]);
		$("#NY" + id).html(strs[6]);
	}
	function nycs12(id) {
		var returnvl = window.showModalDialog("/Myssm/order/selfzcs.do", 0,
				"dialogWidth=800px;dialogHeight=auto;height=auto");
		var strs = returnvl.split(",");
		$("#DDJ11_JFID" + id).attr("value", strs[0]);
		$("#DDJ11_MC" + id).attr("value", strs[1]);
		$("#DDJ11_FL" + id).attr("value", strs[2]);
		$("#DDJ11_DW" + id).attr("value", strs[3]);
		$("#DDJ11_DJ" + id).attr("value", strs[4]);
		$("#DDJ11_BZGG" + id).attr("value", strs[5]);
		$("#NY" + id).html(strs[6]);
	}
	function pdxz() {
		var valfz = $('input:radio[name="SF_FZ"]:checked').val();
		var valxp = $('input:radio[name="SF_XP"]:checked').val();
		if (valfz == 0 && valxp == 0) {
			alert("����ѡ��һ��");
			$('input:radio[name=SF_FZ]')[0].checked = true;
		}
		if (valfz == 0 && valxp == 1) {
			$("#cs").css("display", "none");
		} else {
			$("#cs").css("display", "");
		}
	}
	function pd() {
		var nowmj = $("#FZMJ").val();
		var maxmj = $("#DDJ02_D_MJ").val();
		if (maxmj == "") {
			alert("����ѡ��ؿ�");
			$("#FZMJ").attr("value", "");
			return;
		}
		if (parseInt(nowmj) > parseInt(maxmj)) {
			alert("���ܴ��ڵؿ����" + maxmj);
			$("#FZMJ").attr("value", "");
		}
	}
	function zwxz() {
		if ($("#ZW option:selected").val() == 99) {
			$("#zwmc").css('display', 'block');
		} else {
			$("#zwmc").css('display', 'none');
		}
	}
	function remevo(id) {
		$("#" + id + "1").remove();
		$("#" + id + "2").remove();
		var ids = $("#FZRY").val();
		var str = ids.indexOf(id);
		var end = ids.indexOf(",", str);
		var p1 = ids.substring(0, str);
		var p2 = ids.substring(end + 1, ids.length);
		ids = p1 + p2;
		$("#FZRY").attr("value", ids);
		var mcs = $("#FZRY_MC").val();
		var strmc = mcs.indexOf(id);
		var endmc = mcs.indexOf(",", strmc);
		var p1mc = mcs.substring(0, strmc);
		var p2mc = mcs.substring(endmc + 1, mcs.length);
		mcs = p1mc + p2mc;
		$("#FZRY_MC").attr("value", mcs);
	}
	function xzyh() {
		var returnvl = window.showModalDialog("/Myssm/order/user.do", 0,
				"dialogWidth=800px;dialogHeight=auto;height=auto");
		if (returnvl != null) {
			$("#tj").css("display", 'none')
			$("#zjdk").css("display", 'none')
		}
		var strs = returnvl.split(",");
		$("#DDJ02_JFID").attr("value", strs[0]);
		$("#DDJ02_MC").attr("value", strs[1]);
		$("#DDJ02_DZ").attr("value", strs[3]);
		$("#DDJ02_YDDH").attr("value", strs[2]);
		alert("ѡ���Ŀͻ���ɾ���ѽ��õĵؿ�");
	}
	function xzdk(ddj02_jfid) {
		var returnvl = window.showModalDialog(
				"/Myssm/order/seldk.do?DDJ02_JFID=" + ddj02_jfid, 0,
				"dialogWidth=800px;dialogHeight=auto;height=auto");
		var strs = returnvl.split(",");
		$("#DDJ02_D_JFID").attr("value", strs[0]);
		$("#DDJ02_D_DH").attr("value", strs[1]);
		$("#DDJ02_D_DLX").val(strs[2]);
		$("#DDJ02_D_MJ").attr("value", strs[3]);
		$("#ZW").val(strs[4]);
		if (strs[4] == 99) {
			$("#zwmc").css('display', 'block');
		} else {
			$("#zwmc").css('display', 'none');
		}
		$("#ZW_MC").attr("value", strs[5]);
	}
	function fzfzr() {
		var returnvl = window.showModalDialog("/Myssm/order/fzfzr.do", 0,
				"dialogWidth=800px;dialogHeight=auto;height=auto");
		var strs = returnvl.split(",");
		$("#FZFZR").attr("value", strs[0]);
		$("#FZFZR_MC").attr("value", strs[1]);
	}
	function fzry() {
		var returnvl = window.showModalDialog("/Myssm/order/fzry.do", 0,
				"dialogWidth=800px;dialogHeight=auto;height=auto");
		var strs = returnvl.split(",");
		var htms = "";
		var size = 0;
		var ids = "";
		var mcs = "";
		for (var i = 0; i < strs.length - 1; i++) {
			var sj = strs[i].split("!");
			ids += sj[0] + ",";
			mcs += sj[1] + ",";
			if (document.getElementById(sj[0] + "1") == null) {
				if (size == 0) {
					htms += "<div id='"+i+"' class='form-group'>";
					if (i == 0) {
						htms += "<label class='col-md-3 control-label' >��Ա����</label>";
					} else {
						htms += "<label class='col-md-3 control-label' ></label>";
					}
				}
				htms += "<div id='"+sj[0]+"1' class='col-md-2'>"
						+ "<input class='form-control' value='"+sj[1]+"' readonly='readonly'>"
						+ "</div>" + "<div id='"+sj[0]+"2' class='col-md-1'>"
						+ "</div>";
				size++;
				if (size == 3) {
					htms += "</div>";
					size = 0;
				}
			}
		}
		if (size != 0) {
			htms += "</div>";
		}
		$("#xzry").after(htms);
		$("#FZRY").attr("value", $("#FZRY").val() + ids);
		$("#FZRY_MC").attr("value", $("#FZRY_MC").val() + mcs);
	}
	function ryxx(returnvl) {
		var strs = returnvl.split(",");
		var htms = "";
		var size = 0;
		var ids = "";
		var mcs = "";
		for (var i = 0; i < strs.length - 1; i++) {
			var sj = strs[i].split("!");
			ids += sj[0] + ",";
			mcs += sj[1] + ",";
			if (document.getElementById(sj[0] + "1") == null) {
				if (size == 0) {
					htms += "<div id='"+i+"' class='form-group'>";
					if (i == 0) {
						htms += "<label class='col-md-3 control-label' >��Ա����</label>";
					} else {
						htms += "<label class='col-md-3 control-label' ></label>";
					}
				}
				htms += "<div id='"+sj[0]+"1' class='col-md-2'>"
						+ "<input class='form-control' value='"+sj[1]+"' readonly='readonly'>"
						+ "</div>"
				size++;
				if (size == 3) {
					htms += "</div>";
					size = 0;
				}
			}
		}
		if (size != 0) {
			htms += "</div>";
		}
		$("#xzry").after(htms);
	}
	$(function() {
		ryxx('${retrunval}');
		$('#myfrom').bootstrapValidator({
			message : 'This value is not valid',
			excluded : [ ':disabled' ],
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				FWNRLB : {
					validators : {
						notEmpty : {
							message : '��ѡ���������'
						}
					}
				},
				DDJ03_JFID : {
					validators : {
						notEmpty : {
							message : '��ѡ����Ŀ'
						}
					}
				},
				DDJ02_MC : {
					validators : {
						notEmpty : {
							message : '��ѡ��ͻ�'
						}
					}
				},
				JHSJ : {
					validators : {
						notEmpty : {
							message : '�ƻ�����ʱ�䲻��Ϊ��'
						},
						date : {
							format : 'YYYY-MM-DD',
							message : '��ʽ����ȷ'
						}
					}
				},
				FZFZR_MC : {
					validators : {
						notEmpty : {
							message : '��ѡ������'
						}
					}
				}
			}
		});
		$("#201").addClass("opened");
		$("#202").css('display', 'block');
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
	});
</script>
</html>