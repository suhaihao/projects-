<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.ssh.user.model.User"%>
<%@ page import="com.ssh.user.model.Dsys11"%>
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
<link href="${path}/assets/css/bootstrap-treeview.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>
</head>
<style>
.col-md-3 {
	text-align: center;
}

.col-md-9 {
	padding-top: 2px;
	padding-bottom: 2px;
}
</style>
<body>
	<%
		EHCache eHCache = new EHCache("ehcacheMenu");
			   List<Dsys11> listsyqx = (List<Dsys11>) eHCache
			.getCacheElement("listsyqx");
			    request.setAttribute("listsyqx", listsyqx);
		request.setAttribute("listdfw01_d",
		request.getAttribute("listdfw01_d"));
		request.setAttribute("listdklx", request.getAttribute("listdklx"));
		request.setAttribute("listzw", request.getAttribute("listzw"));
		request.setAttribute("dDJ02_D", request.getAttribute("dDJ02_D"));
		request.setAttribute("dDJ02", request.getAttribute("dDJ02"));
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
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<form id="mydk" action="${path}/ordergd/updkinfo.do" method="post"
							class="form-horizontal">
							<div class="modal-body">
								<!-- 表单 -->
								<div class="row">
									<div class="col-md-12">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h2>
													<i class="fa fa-indent red"></i><strong>防治查询</strong>
												</h2>
											</div>
											<div class="panel-body">
												<div class="form-group">
													<label class="col-md-2 control-label">地主: </label>
													<div class="col-md-2">
														<label class="control-label">${dDJ02.MC}</label>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-2 control-label">地类型 :</label>
													<div class="col-md-2">
														<jf:forEach var="dklx" items="${listdklx}">
															<jf:if test="${dDJ02_D.DLX==dklx.BM}">
																<label class="control-label">${dklx.HZMC}</label>
															</jf:if>
														</jf:forEach>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-2 control-label">地名称:</label>
													<div class="col-md-2">
														<label class="control-label">${dDJ02_D.DH}</label>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-2 control-label">地面积:</label>
													<div class="col-md-2">
														<label class="control-label">${dDJ02_D.MJ}(亩)</label>
													</div>
												</div>
												<div
													style="position:absolute;margin-left:300px;margin-top: -160px;">
													<div class="col-md-2">
														<img id="oImg" class="img-rounded" alt="二维码"
															style="width: 150px;height: 150px;"
															src="${path}yhgl/wcewm.do?path=yhgl/ewmcx.do?DDJ02_D_JFID=${dDJ02_D.JFID}&MC=${dDJ02.MC}&MJ=${dDJ02_D.MJ}&DH=${dDJ02_D.DH}&DLX=${dDJ02_D.DLX}" />
													</div>
												</div>
											</div>
											<jf:forEach var="dfw01_d" items="${listdfw01_d}">
												<div class="panel-body">
													<div class="form-group">
														<label class="col-md-2 control-label">订单号 ：</label>
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
														<label class="col-md-2 control-label">时间 ：</label>
														<div class="col-md-5">
															<label class="control-label">${dfw01_d.LSRQ}</label>
														</div>
														<label class="col-md-2 control-label">防治面积 :</label>
														<div class="col-md-2">
															<label class="control-label">${dfw01_d.FZMJ}(亩)</label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-md-2 control-label">负责人 ：</label>
														<div class="col-md-9">
															<label class="control-label">${dfw01_d.FZFZR_MC}</label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-md-2 control-label">防治人员： </label>
														<div class="col-md-9">
															<label class="control-label">${dfw01_d.FZRY_MC}</label>
														</div>
													</div>
													<div class="form-group">
														<jf:if test="${dfw01_d.ZW!=99}">
															<label class="col-md-2 control-label">农作物 ：</label>
															<div class="col-md-2">
																<jf:forEach var="zw" items="${listzw}">
																	<jf:if test="${dfw01_d.ZW==zw.BM}">
																		<label class="control-label">${zw.HZMC}</label>
																	</jf:if>
																</jf:forEach>
															</div>
														</jf:if>
														<jf:if test="${dfw01_d.ZW==99}">
															<label class="col-md-2 control-label">农作物：</label>
															<div class="col-md-2">
																<label class="control-label">${dfw01_d.ZW_MC}</label>
															</div>
														</jf:if>
														<label class="col-md-2 control-label">防治对象： </label>
														<div class="col-md-2">
															<label class="control-label">${dfw01_d.FZDX}</label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-md-2 control-label">施药器械 ：</label>
														<div class="col-md-2">
															<label class="control-label"> <jf:forEach
																	var="syqx" items="${listsyqx}">
																	<jf:if test="${dfw01_d.SYQX==syqx.BM}">${syqx.HZMC}</jf:if>
																</jf:forEach>
															</label>
														</div>
													</div>
													<div class="form-group">
														<jf:if test="${dfw01_d.SF_FZ==1}">
															<label class="col-md-2 control-label">防治</label>
														</jf:if>
														<jf:if test="${dfw01_d.SF_XP==1}">
															<label class="col-md-2 control-label">巡棚</label>
														</jf:if>
													</div>
													<div class="form-group">
														<label class="col-md-2 control-label">说明嘱托 ：</label>
														<div class="col-md-8">
															<label class="control-label">${dfw01_d.SMZT}</label>
														</div>
													</div>
													<jf:if
														test="${dfw01_d.SF_XP==1 and dfw01_d.SF_FZ==1 or dfw01_d.SF_XP==0 and dfw01_d.SF_FZ==1}">
														<div class="form-group" style="text-align: center;">
															<label class="col-md-8">防治措施明细</label>
														</div>
														<div class="form-group" style="text-align: center;">
															<label class="col-md-2 ">NO.</label> <label
																class="col-md-2 ">防治措施</label> <label class="col-md-2 ">使用量</label>
															<label class="col-md-2 ">单位</label>
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
															class="fa fa-search "></i> 查看作业照片
														</a>
													</div>
												</div>
											</jf:forEach>
											<div class="modal-footer">
												<a href="javascript:history.go(-1);"
													class="btn btn-sm btn-danger" data-dismiss="modal"> <i
													class="fa fa-ban"></i> 返回
												</a>
											</div>
										</div>
									</div>
									<!--表单结束-->
								</div>
							</div>
						</form>
					</div>
					<!--/col-->
				</div>
			</div>
			<!-- end: Content -->
			<!-- foot -->
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
		<script src="${path}/assets/js/bootstrap-treeview.js"></script>

		<!-- end: JavaScript-->
</body>
<script type="text/javascript">
	function bdtj(url) {
		$('#mydk').attr("action", url).submit();
	}
	function sczp(obj, path, JFID, JFIDdk, SFJE, DDJ02_JFID, FWNRLB) {
		if (confirm("你确定要删除吗？")) {
			obj.href = path + "ordergd/deldkzp.do?JFID=" + JFID + "&JFIDdk="
					+ JFIDdk + "&SFJE=" + SFJE + "&DDJ02_JFID=" + DDJ02_JFID
					+ "&FWNRLB=" + FWNRLB;
		}
	}
	function sfzf(obj, path, jfid) {
		if (confirm("你确定要删除吗？")) {
			obj.href = path + "ordergd/dkzf.do?JFID=" + jfid;
		}
	}
	function del(id) {
		$("#DDJ11_JFID" + id).attr("value", "");
		$("#DDJ11_MC" + id).attr("value", "");
		$("#DDJ11_FL" + id).attr("value", "");
		$("#DDJ11_DW" + id).attr("value", "");
		$("#DDJ11_DJ" + id).attr("value", "");
		$("#SYL" + id).attr("value", "");
		$("#DDJ11_BZGG" + id).attr("value", "");
		$("#NY" + id).html("");
	}
	function tjdk() {
		if ($("#DDJ02_D_DH").val() == "") {
			alert("请选择地块");
			return false;
		}
		if ($("#FZMJ").val() == "") {
			alert("请输入防治面积");
			return false;
		}
		var display = $('#cs').css('display');
		if (display != 'none') {
			if ($("#DDJ11_MC1").val() == "" && $("#DDJ11_MC2").val() == ""
					&& $("#DDJ11_MC3").val() == ""
					&& $("#DDJ11_MC4").val() == "") {
				alert("农业措施1或者2，其他措施1或者2最少选一个");
				return false;
			}
		}
		if ($("#DDJ11_MC1").val() != "") {
			if ($("#SYL1").val() == "") {
				alert("请输入农药1的使用量");
				return false;
			} else {
				if (isNaN($("#SYL1").val())) {
					alert("请输入数字");
					return false;
				}
			}
		}
		if ($("#DDJ11_MC2").val() != "") {
			if ($("#SYL2").val() == "") {
				alert("请输入农药2的使用量");
				return false;
			} else {
				if (isNaN($("#SYL2").val())) {
					alert("请输入数字");
					return false;
				}
			}
		}
		if ($("#DDJ11_MC3").val() != "") {
			if ($("#SYL3").val() == "") {
				alert("请输入其他措施1的使用量");
				return false;
			} else {
				if (isNaN($("#SYL3").val())) {
					alert("请输入数字");
					return false;
				}
			}
		}
		if ($("#DDJ11_MC4").val() != "") {
			if ($("#SYL4").val() == "") {
				alert("请输入其他措施2的使用量");
				return false;
			} else {
				if (isNaN($("#SYL4").val())) {
					alert("请输入数字");
					return false;
				}
			}
		}
		if (isNaN($("#SFJE").val())) {
			alert("请输入数字");
			return false;
		}
		if ($("#SYL1").val() != "") {
			if ($("#DDJ11_MC1").val() == "") {
				alert("请选择农药措施1");
				return false;
			}
		}
		if ($("#SYL2").val() != "") {
			if ($("#DDJ11_MC2").val() == "") {
				alert("请选择农药措施2");
				return false;
			}
		}
		if ($("#SYL3").val() != "") {
			if ($("#DDJ11_MC3").val() == "") {
				alert("请选择其他措施1");
				return false;
			}
		}
		if ($("#SYL4").val() != "") {
			if ($("#DDJ11_MC4").val() == "") {
				alert("请选择其他措施2");
				return false;
			}
		}
		$("#mydk").submit();
	}
	function qtcs(id) {
		var returnvl = window.showModalDialog("/Myssm/ordergd/selfzqtcs.do", 0,
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
		var returnvl = window.showModalDialog("/Myssm/ordergd/selfzcs.do", 0,
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
			alert("必须选择一个");
			$('input:radio[name=SF_FZ]')[0].checked = true;
		}
		if (valfz == 0 && valxp == 1) {
			$("#cs").css("display", "none");
		} else {
			$("#cs").css("display", "");
		}
		if (valfz == 0 && valxp == 1) {
			$("#DDJ11_JFID1").attr("value", "");
			$("#DDJ11_MC1").attr("value", "");
			$("#DDJ11_FL1").attr("value", "");
			$("#DDJ11_DW1").attr("value", "");
			$("#DDJ11_DJ1").attr("value", "");
			$("#SYL1").attr("value", "");
			$("#DDJ11_BZGG1").attr("value", "");
			$("#NY1").html("");
			$("#DDJ11_JFID2").attr("value", "");
			$("#DDJ11_MC2").attr("value", "");
			$("#DDJ11_FL2").attr("value", "");
			$("#DDJ11_DW2").attr("value", "");
			$("#DDJ11_DJ2").attr("value", "");
			$("#SYL2").attr("value", "");
			$("#DDJ11_BZGG2").attr("value", "");
			$("#NY2").html("");
			$("#DDJ11_JFID3").attr("value", "");
			$("#DDJ11_MC3").attr("value", "");
			$("#DDJ11_FL3").attr("value", "");
			$("#DDJ11_DW3").attr("value", "");
			$("#DDJ11_DJ3").attr("value", "");
			$("#SYL3").attr("value", "");
			$("#DDJ11_BZGG3").attr("value", "");
			$("#NY3").html("");
			$("#DDJ11_JFID4").attr("value", "");
			$("#DDJ11_MC4").attr("value", "");
			$("#DDJ11_FL4").attr("value", "");
			$("#DDJ11_DW4").attr("value", "");
			$("#DDJ11_DJ4").attr("value", "");
			$("#SYL4").attr("value", "");
			$("#DDJ11_BZGG4").attr("value", "");
			$("#NY4").html("");
		}
	}
	function xzdk(ddj02_jfid) {
		var returnvl = window.showModalDialog(
				"/Myssm/ordergd/seldk.do?DDJ02_JFID=" + ddj02_jfid, 0,
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
	function zwxz() {
		if ($("#ZW option:selected").val() == 99) {
			$("#zwmc").css('display', 'block');
		} else {
			$("#zwmc").css('display', 'none');
		}
	}
	$(function() {
		$("#201").addClass("opened");
		$("#202").css('display', 'block');
		pdxz();
	});
</script>
</html>
<%
	String msg = (String) request.getAttribute("msgN");
	if (msg != null && !msg.equals("")) {
		out.print("<script type='text/javascript'>alert('" + msg
				+ "');</script>");
	}
%>