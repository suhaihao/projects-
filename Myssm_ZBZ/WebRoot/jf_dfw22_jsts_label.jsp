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
<title>蔬菜专防服务管理系统</title>

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
		request.setAttribute("retrunvalckwj",
				request.getAttribute("retrunvalckwj"));
		request.setAttribute("retrunval", request.getAttribute("retrunval"));
		request.setAttribute("dFW22", request.getAttribute("dFW22"));
		request.setAttribute("listdfw22_fj",
				request.getAttribute("listdfw22_fj"));
		request.setAttribute("listdfw22_jsr",
				request.getAttribute("listdfw22_jsr"));
		request.setAttribute("listdfw22_ckwj",
				request.getAttribute("listdfw22_ckwj"));
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
							<li><i class="fa fa-home"></i><a href="${path}go/index.do">首页</a></li>
							<li><i class="fa fa-heart"></i>技术服务</li>
							<li><i class="fa fa-wrench"></i>技术推送</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>技术推送修改</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<form id="myfrom" action="${path}/jsts/update.do" method="post"
								class="form-horizontal">
								<div class="panel-body">
									<div class="form-group">
										<label class="col-md-3 control-label">标题 <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" name="BT" class="form-control"
												placeholder="请输入标题" value="${dFW22.BT}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">内容<i
											style="color: red">*</i></label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="NR" rows="9"
												class="form-control" placeholder="说点什么。。。"
												readonly="readonly">${dFW22.NR}</textarea>
										</div>
									</div>
									<div class="form-group" id="zsk">
										<label class="col-md-3 control-label"></label>
										<div class="col-md-2"></div>
									</div>
									<div class="form-group" id="zfzz">
										<label class="col-md-3 control-label"></label>
										<div class="col-md-2"></div>
									</div>
									<jf:forEach var="fw22_fj" items="${listdfw22_fj}">
										<div class="form-group">
											<label class="col-md-3 control-label"></label>
											<div class="col-md-9">
												<jf:if test="${fn:contains(fw22_fj.WJM,'jpg')==true}">
													<a href="${path}${fw22_fj.FJ}" target="_blank">${fw22_fj.WJM}</a>
												</jf:if>
												<jf:if test="${fn:contains(fw22_fj.WJM,'png')==true}">
													<a href="${path}${fw22_fj.FJ}" target="_blank">${fw22_fj.WJM}</a>
												</jf:if>
												<jf:if
													test="${fn:contains(fw22_fj.WJM,'jpg')!=true and fn:contains(fw22_fj.WJM,'png')!=true}">
													<a
														href="${path}hxjs/downloadfile.do?fileurl=${fw22_fj.FJ}&filename=${fw22_fj.WJM}">${fw22_fj.WJM}</a>
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
										<a class="btn btn-sm btn-danger" href="${path}jsts/sel.do">
											<i class="fa fa-reply"></i> 返回
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
					北京际峰天翔信息技术有限公司</label>
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
		if (confirm("你确定要删除吗？")) {
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
		//手动触发验证
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
					alert("请选择专防组织");
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
	function zsk() {
		window.showModalDialog("/Myssm_ZBZ/jsts/selzsk.do?XXDBLB=3", 0,
				"dialogWidth=1000px;dialogHeight=700px;");
		var strs = $("#Str").val().split(",");
		var htms = "";
		var size = 0;
		var ids = "";
		var mcs = "";
		for (var i = 0; i < strs.length - 1; i++) {
			var sj = strs[i].split("!");
			if (document.getElementById(sj[0] + "1_zsk") == null) {
				mcs += sj[1] + ",";
				ids += sj[0] + ",";
				if (size == 0) {
					htms += "<div id='"+i+"_zsk' class='form-group'>";
					if (i == 0) {
						htms += "<label class='col-md-3 control-label'>参考文件</label>";
					} else {
						htms += "<label class='col-md-3 control-label'>参考文件</label>";
					}
				}
				htms += "<div id='"+sj[0]+"1_zsk' class='col-md-2'>"
						+ "<input type='text' class='form-control' value='"+sj[1]+"' readonly='readonly'>"
						+ "</div>"
						+ "<div id='"+sj[0]+"2_zsk' class='col-md-1'>"
						+ "<a class='btn btn-danger' href='javascript:void(0);'"
						+ "onclick='remevo_zsk(\"" + sj[0]
						+ "\")'> <i class='fa fa-trash-o '></i>" + "</a>"
						+ "</div>";
				size++;
				if (size == 3) {
					htms += "</div>";
					size = 0;
				}
			} else {
				alert(sj[1] + "已重复");
			}
		}
		if (size != 0) {
			htms += "</div>";
		}
		$("#zsk").after(htms);
		$("#DFW11_JFIDS").attr("value", $("#DFW11_JFIDS").val() + ids);
		$("#DFW11_MCS").attr("value", $("#DFW11_MCS").val() + mcs);
		$("#Str").val("");
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
						htms += "<label class='col-md-3 control-label'>专防组织</label>";
					} else {
						htms += "<label class='col-md-3 control-label'>专防组织</label>";
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
				alert(sj[1] + "已重复");
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
						htms += "<label class='col-md-3 control-label' >专防组织</label>";
					} else {
						htms += "<label class='col-md-3 control-label' ></label>";
					}
				}
				htms += "<div id='"+sj[0]+"1' class='col-md-2'>"
						+ "<input type='text' class='form-control' value='"+sj[1]+"' readonly='readonly'>"
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
		$("#zfzz").after(htms);
		$("#DDJ01_JFIDS").attr("value", $("#DDJ01_JFIDS").val() + ids);
		$("#DDJ01_MCS").attr("value", $("#DDJ01_MCS").val() + mcs);
		$("#Str").val("");
	}
	function ryxxckwj(retrunvalckwj, url) {
		var strs = retrunvalckwj.split(",");
		var htms = "";
		var size = 0;
		var ids = "";
		var mcs = "";
		for (var i = 0; i < strs.length - 1; i++) {
			var sj = strs[i].split("!");
			ids += sj[0] + ",";
			mcs += sj[1] + ",";
			if (document.getElementById(sj[0] + "1_zsk") == null) {
				if (size == 0) {
					htms += "<div id='"+i+"_zsk' class='form-group'>";
					if (i == 0) {
						htms += "<label class='col-md-3 control-label'>参考文件</label>";
					} else {
						htms += "<label class='col-md-3 control-label'>参考文件</label>";
					}
				}
				htms += "<div id='"+sj[0]+"1_zsk' class='col-md-2'>"
						+ "<a href='" + url + "hxjs/gotolabel.do?id=" + sj[0]
						+ "' >" + sj[1] + "</a>"
						//+ "<input type='text' class='form-control' value='"+sj[1]+"' readonly='readonly'>"
						+ "</div>"
						+ "<div id='"+sj[0]+"2_zsk' class='col-md-1'>"
						+ "</div>";
				size++;
				if (size == 3) {
					htms += "</div>";
					size = 0;
				}
			} else {
				alert(sj[1] + "已重复");
			}
		}
		if (size != 0) {
			htms += "</div>";
		}
		$("#zsk").after(htms);
		$("#DFW11_JFIDS").attr("value", $("#DFW11_JFIDS").val() + ids);
		$("#DFW11_MCS").attr("value", $("#DFW11_MCS").val() + mcs);
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
	function remevo_zsk(id) {
		var ids = $("#DFW11_JFIDS").val();
		var idsz = ids.split(id);
		if (idsz[0] == "") {
			ids = idsz[1].substring(1, idsz[1].length);
		} else {
			ids = idsz[0] + idsz[1].substring(1, idsz[1].length);
		}
		$("#DFW11_JFIDS").attr("value", ids);
		var mcs = $("#DFW11_MCS").val();
		$("#" + id + "1_zsk input[type='text']").each(function() {
			var mcsz = mcs.split($(this).val());
			if (mcsz[0] == "") {
				mcs = mcsz[1].substring(1, mcsz[1].length);
			} else {
				mcs = mcsz[0] + mcsz[1].substring(1, mcsz[1].length);
			}
		});
		$("#DFW11_MCS").attr("value", mcs);
		if ($("#" + id + "1_zsk").parent().find($("div")).length == 2) {
			$("#" + id + "1_zsk").parent().remove();
		} else {
			$("#" + id + "1_zsk").remove();
			$("#" + id + "2_zsk").remove();
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
		if (confirm("是否删除")) {
			obj.remove();
			$("#" + id).remove();
		}
	}
	function xztz(obj, allsize, ml, url) {
		var ys = prompt("请输入页数:");
		if (isNaN(ys)) {
			alert("请输入数字");
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
		if (confirm("你确定要删除吗？")) {
			$("#deluser" + id).submit();
		}
	}
	$(function() {
		ryxx('${retrunval}');
		ryxxckwj('${retrunvalckwj}', '${path}');
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
							message : '请输入标题'
						}
					}
				},
				NR : {
					validators : {
						notEmpty : {
							message : '请输入内容'
						}
					}
				}
			}
		});
		$("#201").addClass("opened");
		$("#202").css('display', 'block');
	});
	$.fn.datetimepicker.dates['zh-CN'] = {
		days : [ "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日" ],
		daysShort : [ "周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日" ],
		daysMin : [ "日", "一", "二", "三", "四", "五", "六", "日" ],
		months : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月",
				"十一月", "十二月" ],
		monthsShort : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月",
				"十月", "11月", "12月" ],
		today : "今天",
		suffix : [],
		meridiem : [ "上午", "下午" ]
	};
	$('#datetimepickerup').datetimepicker({
		minView : "month",//设置只显示到月份
		autoclose : true,
		language : 'zh-CN',
		todayBtn : true,
	});
	$('#datetimepickerdon').datetimepicker({
		minView : "month",//设置只显示到月份
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