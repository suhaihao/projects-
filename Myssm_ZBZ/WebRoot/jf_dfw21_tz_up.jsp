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
		request.setAttribute("retrunval", request.getAttribute("retrunval"));
		request.setAttribute("dFW21", request.getAttribute("dFW21"));
		request.setAttribute("listdfw21_fj",
				request.getAttribute("listdfw21_fj"));
		request.setAttribute("listdfw21_jsr",
				request.getAttribute("listdfw21_jsr"));
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
							<li><i class="fa fa-bullhorn"></i>֪ͨ</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>֪ͨ�޸�</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<form id="myfrom" action="${path}/tz/update.do" method="post"
								class="form-horizontal">
								<div class="panel-body">
									<input name="JFID" type="hidden" value="${dFW21.JFID}">
									<input id="ZT" name="ZT" type="hidden" value="1"> <input
										id="Str" type="hidden"> <input type="hidden"
										id="DDJ01_MCS" name="DDJ01_MCS" /> <input type="hidden"
										id="DDJ01_JFIDS" name="DDJ01_JFIDS" />
									<div class="form-group">
										<label class="col-md-3 control-label">���� <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" name="BT" class="form-control"
												placeholder="���������" value="${dFW21.BT}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">����<i
											style="color: red">*</i></label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="NR" rows="9"
												class="form-control" placeholder="˵��ʲô������">${dFW21.NR}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">������</label>
										<div class="col-md-9">
											<label class="radio-inline"> <jf:if
													test="${dFW21.SF_ALL==1}">
													<input type="radio" id="inline-radio1" name="SF_ALL"
														checked="checked" value="1" onclick="xz(1)"> ȫ��
											</jf:if> <jf:if test="${dFW21.SF_ALL!=1}">
													<input type="radio" id="inline-radio1" name="SF_ALL"
														value="1" onclick="xz(1)"> ȫ��
											</jf:if>
											</label> <label class="radio-inline"> <jf:if
													test="${dFW21.SF_ALL==0}">
													<input type="radio" id="inline-radio2" name="SF_ALL"
														value="0" onclick="xz(0)" checked="checked">
												ѡ��
											</jf:if> <jf:if test="${dFW21.SF_ALL!=0}">
													<input type="radio" id="inline-radio2" name="SF_ALL"
														value="0" onclick="xz(0)">
												ѡ��
											</jf:if>
											</label>
										</div>
									</div>
									<jf:if test="${dFW21.SF_ALL!=0}">
										<div class="form-group" id="zfzz" style="display: none;">
											<label class="col-md-3 control-label">ѡ��ר����֯ <i
												style="color: red">*</i></label>
											<div class="col-md-2">
												<a class="btn btn-info" href="javascript:void(0);"
													onclick="jsryN()"> <i class="fa fa-search"></i>
												</a>
											</div>
										</div>
									</jf:if>
									<jf:if test="${dFW21.SF_ALL==0}">
										<div class="form-group" id="zfzz">
											<label class="col-md-3 control-label">ѡ��ר����֯ <i
												style="color: red">*</i></label>
											<div class="col-md-2">
												<a class="btn btn-info" href="javascript:void(0);"
													onclick="jsryN()"> <i class="fa fa-search"></i>
												</a>
											</div>
										</div>
									</jf:if>
									<div class="form-group">
										<label class="col-md-3 control-label">����</label>
										<div class="col-md-9">
											<a class="btn btn-sm btn-success" href="javascript:void(0);"
												onclick="tjfj()"><i class="fa fa-search-plus "></i> ��Ӹ���
											</a>
										</div>
									</div>
									<jf:forEach var="fw21_fj" items="${listdfw21_fj}">
										<div class="form-group">
											<label class="col-md-3 control-label"></label>
											<div class="col-md-9">
												<jf:if test="${fn:contains(fw21_fj.WJM,'jpg')==true}">
													<a href="${path}${fw21_fj.FJ}">${fw21_fj.WJM}</a>
													<a class="btn btn-sm btn-danger" href="javascript:void(0);"
														onclick="sctjfj(this,'${path}tz/delfj.do?JFID=${fw21_fj.JFID}&DFW21_JFID=${dFW21.JFID}')">
														<i class="fa fa-trash-o "></i>
													</a>
												</jf:if>
												<jf:if test="${fn:contains(fw21_fj.WJM,'png')==true}">
													<a href="${path}${fw21_fj.FJ}">${fw21_fj.WJM}</a>
													<a class="btn btn-sm btn-danger" href="javascript:void(0);"
														onclick="sctjfj(this,'${path}tz/delfj.do?JFID=${fw21_fj.JFID}&DFW21_JFID=${dFW21.JFID}')">
														<i class="fa fa-trash-o "></i>
													</a>
												</jf:if>
												<jf:if
													test="${fn:contains(fw21_fj.WJM,'jpg')!=true and fn:contains(fw21_fj.WJM,'png')!=true}">
													<a
														href="${path}hxjs/downloadfile.do?fileurl=${fw21_fj.FJ}&filename=${fw21_fj.WJM}">${fw21_fj.WJM}</a>
													<a class="btn btn-sm btn-danger" href="javascript:void(0);"
														onclick="sctjfj(this,'${path}tz/delfj.do?JFID=${fw21_fj.JFID}&DFW21_JFID=${dFW21.JFID}')">
														<i class="fa fa-trash-o "></i>
													</a>
												</jf:if>
											</div>
										</div>
									</jf:forEach>
									<div class="form-group">
										<label class="col-md-3 control-label"></label>
										<div id="file" class="col-md-9"></div>
									</div>
									<br>
									<div class="modal-footer">
										<button type="button" class="btn btn-sm btn-success"
											onclick="sub(2)">
											<i class="fa fa-dot-circle-o"></i> �ύ
										</button>
										<button type="button" class="btn btn-sm btn-info"
											onclick="sub(1)">
											<i class="fa fa-dot-circle-o"></i> ����
										</button>
										<a class="btn btn-sm btn-danger" href="${path}tz/sel.do">
											<i class="fa fa-reply"></i> ����
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

		<!-- end: JavaScript-->
</body>
<script type="text/javascript">
	function sctjfj(obj, url) {
		if (confirm("��ȷ��Ҫɾ����")) {
			obj.href = url;
		}
	}
	function xz(xz) {
		if (xz == 1) {
			$("#zfzz").css("display", "none");
		} else {
			$("#zfzz").css("display", "");
		}
	}
	function sub(zt) {
		$("#ZT").val(zt);
		var bootstrapValidator = $("#myfrom").data('bootstrapValidator');
		//�ֶ�������֤
		bootstrapValidator.validate();
		if (bootstrapValidator.isValid()) {
			if ($("input[type='radio']:checked").val() == 1) {
				document.getElementById("myfrom").submit();
			} else {
				if ($("#DDJ01_JFIDS").val() == "") {
					$('#myfrom').data("bootstrapValidator").updateStatus("BT",
							"NOT_VALIDATED", null);
					$('#myfrom').data("bootstrapValidator").updateStatus("NR",
							"NOT_VALIDATED", null);
					alert("��ѡ��ר����֯");
					return false;
				} else {
					document.getElementById("myfrom").submit();
				}
			}
		}
	}
	function xgzfzz(obj) {
		if (obj.value == "") {
			$("#DDJ01_JFID").val("");
		}
	}
	function jsryN() {
		window.showModalDialog("/Myssm_ZBZ/evaluate/selZFZZD.do?XXDBLB=3", 0,
				"dialogWidth=1000px;dialogHeight=700px;");
		var strs = $("#Str").val().split(",");
		var htms = "";
		var size = 0;
		var ids = "";
		var mcs = "";
		for (var i = 0; i < strs.length - 1; i++) {
			var sj = strs[i].split("!");
			if (document.getElementById(sj[0] + "1") == null) {
				mcs += sj[1] + ",";
				ids += sj[0] + ",";
				if (size == 0) {
					htms += "<div id='"+i+"' class='form-group'>";
					if (i == 0) {
						htms += "<label class='col-md-3 control-label'>ר����֯</label>";
					} else {
						htms += "<label class='col-md-3 control-label'>ר����֯</label>";
					}
				}
				htms += "<div id='"+sj[0]+"1' class='col-md-2'>"
						+ "<input type='text' class='form-control' value='"+sj[1]+"' readonly='readonly'>"
						+ "</div>"
						+ "<div id='"+sj[0]+"2' class='col-md-1'>"
						+ "<a class='btn btn-danger' href='javascript:void(0);'"
						+ "onclick='remevo(\"" + sj[0]
						+ "\")'> <i class='fa fa-trash-o '></i>" + "</a>"
						+ "</div>";
				size++;
				if (size == 3) {
					htms += "</div>";
					size = 0;
				}
			} else {
				alert(sj[1] + "���ظ�");
			}
		}
		if (size != 0) {
			htms += "</div>";
		}
		$("#zfzz").after(htms);
		$("#DDJ01_JFIDS").attr("value", $("#DDJ01_JFIDS").val() + ids);
		$("#DDJ01_MCS").attr("value", $("#DDJ01_MCS").val() + mcs);
		$("#Str").val("");
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
						htms += "<label class='col-md-3 control-label' >ר����֯</label>";
					} else {
						htms += "<label class='col-md-3 control-label' ></label>";
					}
				}
				htms += "<div id='"+sj[0]+"1' class='col-md-2'>"
						+ "<input type='text' class='form-control' value='"+sj[1]+"' readonly='readonly'>"
						+ "</div>"
						+ "<div id='"+sj[0]+"2' class='col-md-1'>"
						+ "<a class='btn btn-danger' href='javascript:void(0);'"
						+ "onclick='remevo(\"" + sj[0]
						+ "\")'> <i class='fa fa-trash-o '></i>" + "</a>"
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
		$("#zfzz").after(htms);
		$("#DDJ01_JFIDS").attr("value", $("#DDJ01_JFIDS").val() + ids);
		$("#DDJ01_MCS").attr("value", $("#DDJ01_MCS").val() + mcs);
		$("#Str").val("");
	}
	function remevo(id) {
		var ids = $("#DDJ01_JFIDS").val();
		var idsz = ids.split(id);
		if (idsz[0] == "") {
			ids = idsz[1].substring(1, idsz[1].length);
		} else {
			ids = idsz[0] + idsz[1].substring(1, idsz[1].length);
		}
		$("#DDJ01_JFIDS").attr("value", ids);
		var mcs = $("#DDJ01_MCS").val();
		$("#" + id + "1 input[type='text']").each(function() {
			var mcsz = mcs.split($(this).val());
			if (mcsz[0] == "") {
				mcs = mcsz[1].substring(1, mcsz[1].length);
			} else {
				mcs = mcsz[0] + mcsz[1].substring(1, mcsz[1].length);
			}
		});
		$("#DDJ01_MCS").attr("value", mcs);
		if ($("#" + id + "1").parent().find($("div")).length == 2) {
			$("#" + id + "1").parent().remove();
		} else {
			$("#" + id + "1").remove();
			$("#" + id + "2").remove();
		}
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
	function sclogo() {
		document.getElementById("myfrom").enctype = "multipart/form-data";
	}
	function scfj(id, obj) {
		if (confirm("�Ƿ�ɾ��")) {
			obj.remove();
			$("#" + id).remove();
		}
	}
	function xztz(obj, allsize, ml, url) {
		var ys = prompt("������ҳ��:");
		if (isNaN(ys)) {
			alert("����������");
			return false;
		}
		if (ys != null && ys != "") {
			obj.href = ml + "tz/sel.do?page=" + ys + "&allSize=" + allsize
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
		ryxx('${retrunval}');
		$('#myfrom').bootstrapValidator({
			message : 'This value is not valid',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				BT : {
					validators : {
						notEmpty : {
							message : '���������'
						}
					}
				},
				NR : {
					validators : {
						notEmpty : {
							message : '����������'
						}
					}
				}
			}
		});
		$("#101").addClass("opened");
		$("#102").css('display', 'block');
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
<%
	String msg = (String) request.getAttribute("msg");
	if (msg != null && !msg.equals("")) {
		out.print("<script type='text/javascript'>alert('" + msg
				+ "');</script>");
	}
%>
</html>