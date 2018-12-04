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
<body>
	<%
		request.setAttribute("listFWNRLB",
				request.getAttribute("listFWNRLB"));
		request.setAttribute("listddj03", request.getAttribute("listddj03"));
		request.setAttribute("DDJ02_JFID",
				request.getAttribute("DDJ02_JFID"));
		request.setAttribute("DDJ02_MC", request.getAttribute("DDJ02_MC"));
		request.setAttribute("DDJ02_DZ", request.getAttribute("DDJ02_DZ"));
		request.setAttribute("DDJ02_YDDH",
				request.getAttribute("DDJ02_YDDH"));
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
							<li><i class="fa fa-cogs"></i>派单管理管理</li>
							<li><i class="fa fa-flask"></i>派单添加</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>派单添加</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div id="body" class="panel-body">
								<!-- 表单 -->
								<form id="myfrom" action="${path}order/addinfo.do" method="post"
									class="form-horizontal">
									<input id="DDJ02_JFID" name="DDJ02_JFID" type="hidden"
										value="${DDJ02_JFID}"> <input id="FZFZR" name="FZFZR"
										type="hidden"> <input id="FZRY" name="FZRY"
										type="hidden"> <input id="FZRY_MC" name="FZRY_MC"
										type="hidden"> <input id="ZT" name="ZT" type="hidden"
										value="1"> <input id="Str" type="hidden" value="">
									<div class="form-group">
										<label class="col-md-3 control-label">服务内容
											<i style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<select id="selectFWNRLB" name="FWNRLB" class="form-control"
												size="1" onchange="chagesj()">
												<option value="">请选择</option>
												<jf:forEach var="FWNRLB" items="${listFWNRLB}">
													<option value="${FWNRLB.BM}">${FWNRLB.HZMC}</option>
												</jf:forEach>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">项目
										</label>
										<div class="col-md-9">
											<select id="selectDDJ03_JFID" name="DDJ03_JFID"
												class="form-control" size="1" onchange="chagesj()">
												<option value="">请选择</option>
												<jf:forEach var="ddj03" items="${listddj03}">
													<option value="${ddj03.JFID}">${ddj03.XMMC}</option>
												</jf:forEach>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">客户名称
											<i style="color: red">*</i>
										</label>
										<div class="col-md-7">
											<input type="text" id="DDJ02_MC" name="DDJ02_MC"
												class="form-control" readonly="readonly" value="${DDJ02_MC}">
										</div>
										<div class="col-md-2">
											<a href="javascript:void(0);" class="btn btn-info "
												onclick="xzyh()"> <i class="fa fa-search "></i> 选择客户
											</a>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">地址
											<i style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="DDJ02_DZ" name="DDJ02_DZ"
												class="form-control" value="${DDJ02_DZ}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">手机
											<i style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="DDJ02_YDDH" name="DDJ02_YDDH"
												class="form-control" value="${DDJ02_YDDH}"
												readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">计划作业时间
											<i style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input id="datetimepicker" type="text" name="JHSJ"
												class="form-control" placeholder="请输入计划防治时间（yyyy-mm-dd HH:mm）"
												onchange="xgsr()">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">防治负责人
											<i style="color: red">*</i>
										</label>
										<div class="col-md-7">
											<input type="text" id="FZFZR_MC" name="FZFZR_MC"
												class="form-control" readonly="readonly" value="">
										</div>
										<div class="col-md-2">
											<a href="javascript:void(0);" class="btn btn-info "
												onclick="fzfzr()"> <i class="fa fa-search "></i> 选择负责人
											</a>
										</div>
									</div>
									<div id="xzry" class="form-group">
										<label class="col-md-3 control-label">防治负责人员 </label>
										<div class="col-md-2">
											<a href="javascript:void(0);" class="btn btn-info "
												onclick="fzry()"> <i class="fa fa-search "></i> 选择人员
											</a>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">派单说明</label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="PDSM" rows="3"
												class="form-control" placeholder="（派单前地块病虫发生及用药、防虫网等防治情况）"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label" >备注</label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="BZ" rows="3"
												class="form-control" placeholder="说点什么。。。"></textarea>
										</div>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-sm btn-primary">
											<i class="fa fa-check-square"></i> 保存
										</button>
										<a class="btn btn-sm btn-danger" data-dismiss="modal"
											href="javascript:history.go(-1);"> <i class="fa fa-ban"></i> 返回
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
			<label><img src="${path}assets/img/logo/GB.png">Copyright 北京际峰天翔信息技术有限公司</label>
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
	function xgsr() {
		$("#myfrom").data('bootstrapValidator').validateField('JHSJ');
		$("#myfrom").data('bootstrapValidator').updateStatus('JHSJ',
				'NOT_VALIDATED', null).validateField('JHSJ');
	}
	function remevo(id) {
		var ids = $("#FZRY").val();
		var idsz = ids.split(id);
		if (idsz[0] == "") {
			ids = idsz[1].substring(1, idsz[1].length);
		} else {
			ids = idsz[0] + idsz[1].substring(1, idsz[1].length);
		}
		$("#FZRY").attr("value", ids);
		var mcs = $("#FZRY_MC").val();
		$("#" + id + "1 input[type='text']").each(function() {
			var mcsz = mcs.split($(this).val());
			if (mcsz[0] == "") {
				mcs = mcsz[1].substring(1, mcsz[1].length);
			} else {
				mcs = mcsz[0] + mcsz[1].substring(1, mcsz[1].length);
			}
		});
		$("#FZRY_MC").attr("value", mcs);
		if ($("#" + id + "1").parent().find($("div")).length == 2) {
			$("#" + id + "1").parent().remove();
		} else {
			$("#" + id + "1").remove();
			$("#" + id + "2").remove();
		}
	}
	function xzyh() {
		window.showModalDialog("/Myssm/order/user.do", 0,
				"dialogWidth=800px;dialogHeight=auto;height=auto");
		var strs = $("#Str").val().split(",");
		$("#DDJ02_JFID").attr("value", strs[0]);
		$("#DDJ02_MC").attr("value", strs[1]);
		$("#DDJ02_DZ").attr("value", strs[3]);
		$("#DDJ02_YDDH").attr("value", strs[2]);
		$("#Str").val("");
	}
	function fzfzr() {
		window.showModalDialog("/Myssm/order/fzfzr.do", 0,
				"dialogWidth=800px;dialogHeight=auto;height=auto");
		var strs = $("#Str").val().split(",");
		$("#FZFZR").attr("value", strs[0]);
		$("#FZFZR_MC").attr("value", strs[1]);
		$("#Str").val("");
	}
	function fzry() {
		window.showModalDialog("/Myssm/order/fzry.do", 0,
				"dialogWidth=800px;dialogHeight=auto;height=auto");
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
						htms += "<label class='col-md-3 control-label'>人员名单</label>";
					} else {
						htms += "<label class='col-md-3 control-label'>人员名单</label>";
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
		$("#xzry").after(htms);
		$("#FZRY").attr("value", $("#FZRY").val() + ids);
		$("#FZRY_MC").attr("value", $("#FZRY_MC").val() + mcs);
		$("#Str").val("");
	}
	$(function() {
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
							message : '请选择服务内容'
						}
					}
				},
				DDJ02_MC : {
					validators : {
						notEmpty : {
							message : '请选择客户'
						}
					}
				},
				JHSJ : {
					validators : {
						notEmpty : {
							message : '计划防治时间不能为空（yyyy-mm-dd HH:mm）'
						},
						date : {
							format : 'YYYY-MM-DD HH:mm',
							message : '日期格式不正确（yyyy-mm-dd HH:mm）'
						}
					}
				},
				FZFZR_MC : {
					validators : {
						notEmpty : {
							message : '请选择负责人'
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
	$('#datetimepicker').datetimepicker({
		autoclose : true,
		language : 'zh-CN',
		todayBtn : true,
		forceParse : false
	});
</script>
</html>