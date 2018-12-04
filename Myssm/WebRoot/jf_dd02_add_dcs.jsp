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
		request.setAttribute("dDJ02", request.getAttribute("dDJ02"));
		request.setAttribute("listxl", request.getAttribute("listxl"));
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
							<li><i class="fa fa-male"></i>客户添加</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>客户添加</strong>
								</h2>
								<div class="panel-actions">
									<a href="table.html#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<form id="myfrom" action="${path}yhgl/addnh.do" method="post">
								<input type="hidden" name="JFID" value="${dDJ02.JFID}">
								<div id="body" class="panel-body">
									<div class="form-group">
										<label class="col-md-3 control-label">用户名
											<i style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="YHM"
												class="form-control" readonly="readonly"
												value="${dDJ02.YHM}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">名称
											<i style="color: red">*</i>
										</label>
										<div class=" col-md-9">
											<input type="text" id="text-input" name="MC"
												class="form-control" placeholder="请再次输入密码"
												value="${dDJ02.MC}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">行政区划
											<i style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="xzqh" name="XZQHMC"
												class="form-control" placeholder="请选择行政区划" onclick="tree()"
												value="${dDJ02.XZQHMC}" onfocus="this.blur()">（点击选择）
											<input type="hidden" id="xzqhbm" name="XZQH"
												class="form-control" value="${dDJ02.XZQH}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">地址
											<i style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="DZ"
												class="form-control" placeholder="请输入地址" value="${dDJ02.DZ}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">手机
											<i style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="YDDH"
												class="form-control" value="${dDJ02.YHM}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">人员类别
											<i style="color: red">*</i>
										</label>
										<jf:if test="${dDJ02.YHLB==1}">
											<div class="col-md-9">
												<label class="radio-inline"> <input
													type="radio" id="inline-radio1" name="YHLB" value="1"
													checked="checked" onclick="choce(this)"> 个人
												</label> <label class="radio-inline"> <input
													type="radio" id="inline-radio2" name="YHLB" value="0"
													onclick="choce(this)"> 单位
												</label>
											</div>
										</jf:if>
										<jf:if test="${dDJ02.YHLB==0}">
											<div class="col-md-9">
												<label class="radio-inline"> <input
													type="radio" id="inline-radio1" name="YHLB" value="1"
													onclick="choce(this)"> 个人
												</label> <label class="radio-inline"> <input
													type="radio" id="inline-radio2" name="YHLB" value="0"
													checked="checked" onclick="choce(this)"> 单位
												</label>
											</div>
										</jf:if>
									</div>
									<jf:if test="${dDJ02.YHLB==1}">
										<div id="bl">
											<div class="form-group">
												<label class="col-md-3 control-label">性别
													<i style="color: red">*</i>
												</label>
												<jf:if test="${dDJ02.XB==1}">
													<div class="col-md-9">
														<label class="radio-inline"> <input
															type="radio" id="inline-radio1" name="XB" value="1"
															checked="checked"> 男
														</label> <label class="radio-inline">
															<input type="radio" id="inline-radio2" name="XB"
															value="0"> 女
														</label>
													</div>
												</jf:if>
												<jf:if test="${dDJ02.XB==0}">
													<div class="col-md-9">
														<label class="radio-inline"> <input
															type="radio" id="inline-radio1" name="XB" value="1">
															男
														</label> <label class="radio-inline">
															<input type="radio" id="inline-radio2" name="XB"
															value="0" checked="checked"> 女
														</label>
													</div>
												</jf:if>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">生日
													<i style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input id="datetimepicker" type="text" name="SR"
														class="form-control" placeholder="请输入生日（yyyy-mm-dd）"
														data-date-format="yyyy-mm-dd"
														value="<fmt:formatDate value="${dDJ02.SR}" pattern="yyyy-MM-dd"/>"
														onchange="xgsr()">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">学历
													<i style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<select id="selectxl" name="XL" class="form-control"
														size="1">
														<option value="">请选择</option>
														<jf:forEach var="xl" items="${listxl}">
															<jf:if test="${dDJ02.XL==xl.BM}">
																<option selected="selected" value="${xl.BM}">${xl.HZMC}</option>
															</jf:if>
															<jf:if test="${dDJ02.XL!=xl.BM}">
																<option value="${xl.BM}">${xl.HZMC}</option>
															</jf:if>
														</jf:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">家庭人口
													<i style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JTRK"
														class="form-control" placeholder="请输入家庭人口"
														value="${dDJ02.JTRK}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">人均年收入(元)
													<i style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="RJSR"
														class="form-control" placeholder="请输入人均年收入"
														value="${dDJ02.RJSR}">
												</div>
											</div>
										</div>
										<div id="bbl" style="display: none;">
											<div class="form-group">
												<label class="col-md-3 control-label" >性别
												</label>
												<jf:if test="${dDJ02.XB==1}">
													<div class="col-md-9">
														<label class="radio-inline"> <input
															type="radio" id="inline-radio1" name="XBN" value="1"
															checked="checked"> 男
														</label> <label class="radio-inline">
															<input type="radio" id="inline-radio2" name="XBN"
															value="0"> 女
														</label>
													</div>
												</jf:if>
												<jf:if test="${dDJ02.XB==0}">
													<div class="col-md-9">
														<label class="radio-inline"> <input
															type="radio" id="inline-radio1" name="XBN" value="1">
															男
														</label> <label class="radio-inline">
															<input type="radio" id="inline-radio2" name="XBN"
															value="0" checked="checked"> 女
														</label>
													</div>
												</jf:if>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">生日
												</label>
												<div class="col-md-9">
													<input id="datetimepicker" type="text" name="SRN"
														class="form-control" placeholder="请输入生日（yyyy-mm-dd）"
														data-date-format="yyyy-mm-dd"
														value="<fmt:formatDate value="${dDJ02.SR}" pattern="yyyy-MM-dd"/>">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">学历
												</label>
												<div class="col-md-9">
													<select id="selectxl" name="XLN" class="form-control"
														size="1">
														<option value="">请选择</option>
														<jf:forEach var="xl" items="${listxl}">
															<jf:if test="${dDJ02.XL==xl.BM}">
																<option selected="selected" value="${xl.BM}">${xl.HZMC}</option>
															</jf:if>
															<jf:if test="${dDJ02.XL!=xl.BM}">
																<option value="${xl.BM}">${xl.HZMC}</option>
															</jf:if>
														</jf:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">家庭人口
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JTRKN"
														class="form-control" placeholder="请输入家庭人口"
														value="${dDJ02.JTRK}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">人均年收入(元)
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="RJSRN"
														class="form-control" placeholder="请输入人均年收入"
														value="${dDJ02.RJSR}">
												</div>
											</div>
										</div>
									</jf:if>
									<jf:if test="${dDJ02.YHLB==0}">
										<div id="bl" style="display: none;">
											<div class="form-group">
												<label class="col-md-3 control-label">性别
													<i style="color: red">*</i>
												</label>
												<jf:if test="${dDJ02.XB==1}">
													<div class="col-md-9">
														<label class="radio-inline"> <input
															type="radio" id="inline-radio1" name="XB" value="1"
															checked="checked"> 男
														</label> <label class="radio-inline">
															<input type="radio" id="inline-radio2" name="XB"
															value="0"> 女
														</label>
													</div>
												</jf:if>
												<jf:if test="${dDJ02.XB==0}">
													<div class="col-md-9">
														<label class="radio-inline"> <input
															type="radio" id="inline-radio1" name="XB" value="1">
															男
														</label> <label class="radio-inline">
															<input type="radio" id="inline-radio2" name="XB"
															value="0" checked="checked"> 女
														</label>
													</div>
												</jf:if>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">生日
													<i style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input id="datetimepicker" type="text" name="SR"
														class="form-control" placeholder="请输入生日 （yyyy-mm-dd）"
														data-date-format="yyyy-mm-dd"
														value="<fmt:formatDate value="${dDJ02.SR}" pattern="yyyy-MM-dd"/>"
														onchange="xgsr()">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">学历
													<i style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<select id="selectxl" name="XL" class="form-control"
														size="1">
														<option value="">请选择</option>
														<jf:forEach var="xl" items="${listxl}">
															<jf:if test="${dDJ02.XL==xl.BM}">
																<option selected="selected" value="${xl.BM}">${xl.HZMC}</option>
															</jf:if>
															<jf:if test="${dDJ02.XL!=xl.BM}">
																<option value="${xl.BM}">${xl.HZMC}</option>
															</jf:if>
														</jf:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">家庭人口
													<i style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JTRK"
														class="form-control" placeholder="请输入家庭人口"
														value="${dDJ02.JTRK}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">人均年收入(元)
													<i style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="RJSR"
														class="form-control" placeholder="请输入人均年收入"
														value="${dDJ02.RJSR}">
												</div>
											</div>
										</div>
										<div id="bbl">
											<div class="form-group">
												<label class="col-md-3 control-label">性别
												</label>
												<jf:if test="${dDJ02.XB==1}">
													<div class="col-md-9">
														<label class="radio-inline"> <input
															type="radio" id="inline-radio1" name="XBN" value="1"
															checked="checked"> 男
														</label> <label class="radio-inline">
															<input type="radio" id="inline-radio2" name="XBN"
															value="0"> 女
														</label>
													</div>
												</jf:if>
												<jf:if test="${dDJ02.XB==0}">
													<div class="col-md-9">
														<label class="radio-inline"> <input
															type="radio" id="inline-radio1" name="XBN" value="1">
															男
														</label> <label class="radio-inline">
															<input type="radio" id="inline-radio2" name="XBN"
															value="0" checked="checked"> 女
														</label>
													</div>
												</jf:if>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">生日
												</label>
												<div class="col-md-9">
													<input id="datetimepicker" type="text" name="SRN"
														class="form-control" placeholder="请输入生日（yyyy-mm-dd）"
														data-date-format="yyyy-mm-dd"
														value="<fmt:formatDate value="${dDJ02.SR}" pattern="yyyy-MM-dd"/>">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">学历
												</label>
												<div class="col-md-9">
													<select id="selectxl" name="XLN" class="form-control"
														size="1">
														<option value="">请选择</option>
														<jf:forEach var="xl" items="${listxl}">
															<jf:if test="${dDJ02.XL==xl.BM}">
																<option selected="selected" value="${xl.BM}">${xl.HZMC}</option>
															</jf:if>
															<jf:if test="${dDJ02.XL!=xl.BM}">
																<option value="${xl.BM}">${xl.HZMC}</option>
															</jf:if>
														</jf:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">家庭人口
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JTRKN"
														class="form-control" placeholder="请输入家庭人口"
														value="${dDJ02.JTRK}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">人均年收入(元)
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="RJSRN"
														class="form-control" placeholder="请输入人均年收入"
														value="${dDJ02.RJSR}">
												</div>
											</div>
										</div>
									</jf:if>
									<div class="form-group">
										<label class="col-md-3 control-label">邮箱
										</label>
										<div class="col-md-9">
											<input type="email" id="text-input" name="YX"
												class="form-control" placeholder="请输入邮箱" value="${dDJ02.YX}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">生产面积(亩)
										</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="SCMJ"
												class="form-control" placeholder="请输生产面积"
												value="${dDJ02.SCMJ}">
										</div>
									</div>
									<!-- 
									<div class="form-group">
										<label class="col-md-3 control-label">服务内容
										</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="FWNR"
												class="form-control" placeholder="请输服务面积"
												value="${dDJ02.FWNR}">
										</div>
									</div>
									 -->
									<div class="form-group">
										<label class="col-md-3 control-label">备注</label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="BZ" rows="3"
												class="form-control" placeholder="说点什么。。。">${dDJ02.BZ}</textarea>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary">
										<i class="fa fa-check-square"></i> 保存
									</button>
									<a class="btn btn-danger" data-dismiss="modal"
										href="${path}yhgl/sel.do"> <i class="fa fa-ban"></i> 返回
									</a>
								</div>
							</form>
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
		<script src="${path}/assets/js/bootstrap-treeview.js"></script>

		<!-- end: JavaScript-->
</body>
<script type="text/javascript">
	function xgsr() {
		$("#myfrom").data('bootstrapValidator').validateField('SR');
		$("#myfrom").data('bootstrapValidator').updateStatus('SR',
				'NOT_VALIDATED', null).validateField('SR');
	}
	function choce(obj) {
		if (obj.value == 1) {
			$("#bl").css('display', 'block');
			$("#bbl").css('display', 'none');
		} else {
			$("#bl").css('display', 'none');
			$("#bbl").css('display', 'block');
		}
	}
	function tree() {
		var returnValue = window.showModalDialog("/Myssm/tree.jsp", 0,
				"dialogWidth=500px;dialogHeight=600px");
		var strs = returnValue.split(",");
		if (strs[0].length == 9 || strs[0].length == 11) {
			if (strs[0].length == 11) {
				$("#xzqh").attr("value", strs[1]);
				$("#xzqhbm").attr("value", strs[0]);
			} else {
				if (strs[0].substring(0, 5) != 15613) {
					$("#xzqh").attr("value", strs[1]);
					$("#xzqhbm").attr("value", strs[0]);
					$("#myfrom").data('bootstrapValidator').validateField(
							'XZQHMC');
					$("#myfrom").data('bootstrapValidator').updateStatus(
							'XZQHMC', 'NOT_VALIDATED', null).validateField(
							'XZQHMC');
				} else {
					alert("对不起只能选择末级");
				}
			}
		} else {
			alert("对不起只能选择末级");
		}
	};

	function xztz(obj, allsize, ml) {
		var ys = prompt("请输入页数:");
		if (isNaN(ys)) {
			alert("请输入数字");
			return false;
		}
		if (ys != null && ys != "") {
			obj.href = ml + "/info/sel.do?page=" + ys + "&allSize=" + allsize;
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
				JFPASSWORD : {
					validators : {
						notEmpty : {
							message : '密码不能为空'
						},
						regexp : {
							regexp : /^[a-zA-Z0-9_\.]+$/,
							message : '只能输入数字字母下划线'
						}
					}
				},
				confirmPassword : {
					validators : {
						notEmpty : {
							message : '密码不能为空'
						},
						identical : {
							field : 'JFPASSWORD',
							message : '和密码不一致'
						}
					}
				},
				MC : {
					validators : {
						notEmpty : {
							message : '名称不能为空'
						}
					}
				},
				XZQHMC : {
					validators : {
						notEmpty : {
							message : '行政区划不能为空'
						}
					}
				},
				DZ : {
					validators : {
						notEmpty : {
							message : '地址不能为空'
						}
					}
				},
				SR : {
					validators : {
						notEmpty : {
							message : '生日不能为空（yyyy-mm-dd）'
						},
						date : {
							format : 'YYYY-MM-DD',
							message : '日期格式不正确（yyyy-mm-dd）'
						}
					}
				},
				XL : {
					validators : {
						notEmpty : {
							message : '请选择学历'
						}
					}
				},
				JTRK : {
					validators : {
						notEmpty : {
							message : '请输入家庭人口'
						},
						regexp : {
							regexp : /^[0-9\.]+$/,
							message : '只能输入数字'
						}
					}
				},
				RJSR : {
					validators : {
						notEmpty : {
							message : '年均收入不能为空'
						},
						regexp : {
							regexp : /^[0-9\.]+$/,
							message : '只能输入数字'
						}
					}
				},
				YX : {
					validators : {
						emailAddress : {
							message : '邮箱格式不正确'
						}
					}
				},
				LX_SJ : {
					validators : {
						stringLength : {
							min : 11,
							max : 11,
							message : '请输入11位手机号码'
						},
						regexp : {
							regexp : /^1[3|5|8]{1}[0-9]{9}$/,
							message : '请输入正确的手机号码'
						}
					}
				}
			}
		});
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
		minView : "month",//设置只显示到月份
		language : 'zh-CN',
		autoclose : true,
		todayBtn : true,
		forceParse : false
	});
</script>
</html>