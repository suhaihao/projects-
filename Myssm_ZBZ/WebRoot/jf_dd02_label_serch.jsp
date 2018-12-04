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
<body>
	<%
		request.setAttribute("dDJ02", request.getAttribute("dDJ02"));
		request.setAttribute("listxl", request.getAttribute("listxl"));
		request.setAttribute("dDJ02_DDJ01",
				request.getAttribute("dDJ02_DDJ01"));
		request.setAttribute("listdklx", request.getAttribute("listdklx"));
		request.setAttribute("listzw", request.getAttribute("listzw"));
		request.setAttribute("listddj02_ddj01", request.getAttribute("listddj02_ddj01"));
		request.setAttribute("listddj02_d",
				request.getAttribute("listddj02_d"));
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
							<li><i class="fa fa-search"></i>查询统计</li>
							<li><i class="fa fa-male"></i>客户名录</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>客户查询</strong>
								</h2>
								<div class="panel-actions">
									<a href="" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<form id="myfrom" action="${path}yhgl/xgnhxx.do" method="post"
									class="form-horizontal">
									<input type="hidden" id="JFID" name="JFID"
										value="${dDJ02.JFID}">
									<div class="form-group">
										<label class="col-md-3 control-label">用户名 <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="YHM"
												class="form-control" readonly="readonly"
												value="${dDJ02.YHM}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">名称 <i
											style="color: red">*</i>
										</label>
										<div class=" col-md-9">
											<input type="text" id="text-input" name="MC"
												class="form-control" placeholder="请再次输入密码"
												value="${dDJ02.MC}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">行政区划 <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="xzqh" name="XZQHMC"
												class="form-control" onclick="tree()"
												value="${dDJ02.XZQHMC}" readonly="readonly"><input
												type="hidden" id="xzqhbm" name="XZQH" class="form-control"
												value="${dDJ02.XZQH}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">地址 <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="DZ"
												class="form-control" value="${dDJ02.DZ}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">手机 <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="YDDH"
												class="form-control" value="${dDJ02.YDDH}"
												readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">人员类别 <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<jf:if test="${dDJ02.YHLB==1}">
												<label class="radio-inline"> <input type="radio"
													id="inline-radio1" name="YHLB" value="1" checked="checked"
													onclick="choce(this)" disabled="disabled"> 个人
												</label>
												<label class="radio-inline"> <input type="radio"
													id="inline-radio2" name="YHLB" value="0"
													onclick="choce(this)" disabled="disabled"> 单位
												</label>
											</jf:if>
											<jf:if test="${dDJ02.YHLB==0}">
												<label class="radio-inline"> <input type="radio"
													id="inline-radio1" name="YHLB" value="1"
													onclick="choce(this)" disabled="disabled"> 个人
												</label>
												<label class="radio-inline"> <input type="radio"
													id="inline-radio2" name="YHLB" value="0" checked="checked"
													onclick="choce(this)" disabled="disabled"> 单位
												</label>
											</jf:if>
										</div>
									</div>
									<jf:if test="${dDJ02.YHLB==1}">
										<div id="bl">
											<div class="form-group">
												<label class="col-md-3 control-label">性别 <i
													style="color: red">*</i>
												</label>
												<jf:if test="${dDJ02.XB==1}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XB" value="1" checked="checked"
															disabled="disabled"> 男
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XB" value="0"
															disabled="disabled"> 女
														</label>
													</div>
												</jf:if>
												<jf:if test="${dDJ02.XB==0}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XB" value="1"
															disabled="disabled"> 男
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XB" value="0" checked="checked"
															disabled="disabled"> 女
														</label>
													</div>
												</jf:if>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">生日 <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input id="datetimepicker" type="text" name="SR"
														class="form-control" data-date-format="yyyy-mm-dd"
														value="<fmt:formatDate value="${dDJ02.SR}" pattern="yyyy-MM-dd"/>"
														readonly="readonly">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">学历 <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<jf:forEach var="xl" items="${listxl}">
														<jf:if test="${dDJ02.XL==xl.BM}">
															<input type="text" class="form-control"
																value="${xl.HZMC}" readonly="readonly">
														</jf:if>
													</jf:forEach>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">家庭人口 <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JTRK"
														class="form-control" value="${dDJ02.JTRK}"
														readonly="readonly">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">人均年收入(元) <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="RJSR"
														class="form-control" value="${dDJ02.RJSR}"
														readonly="readonly">
												</div>
											</div>
										</div>
										<div id="bbl" style="display: none;">
											<div class="form-group">
												<label class="col-md-3 control-label">性别 </label>
												<jf:if test="${dDJ02.XB==1}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XBN" value="1" checked="checked"
															disabled="disabled"> 男
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XBN" value="0"
															disabled="disabled"> 女
														</label>
													</div>
												</jf:if>
												<jf:if test="${dDJ02.XB==0}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XBN" value="1"
															disabled="disabled"> 男
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XBN" value="0" checked="checked"
															disabled="disabled"> 女
														</label>
													</div>
												</jf:if>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">生日 </label>
												<div class="col-md-9">
													<input id="datetimepickertwo" type="text" name="SRN"
														class="form-control" data-date-format="yyyy-mm-dd"
														value="<fmt:formatDate value="${dDJ02.SR}" pattern="yyyy-MM-dd"/>"
														readonly="readonly">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">学历 </label>
												<div class="col-md-9">
													<jf:forEach var="xl" items="${listxl}">
														<jf:if test="${dDJ02.XL==xl.BM}">
															<input type="text" class="form-control"
																value="${xl.HZMC}" readonly="readonly">
														</jf:if>
													</jf:forEach>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">家庭人口 </label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JTRKN"
														class="form-control" value="${dDJ02.JTRK}"
														readonly="readonly">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">人均年收入(元) </label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="RJSRN"
														class="form-control" value="${dDJ02.RJSR}"
														readonly="readonly">
												</div>
											</div>
										</div>
									</jf:if>
									<jf:if test="${dDJ02.YHLB==0}">
										<div id="bbl">
											<div class="form-group">
												<label class="col-md-3 control-label">性别 </label>
												<jf:if test="${dDJ02.XB==1}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XBN" value="1" checked="checked"
															disabled="disabled"> 男
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XBN" value="0"
															disabled="disabled"> 女
														</label>
													</div>
												</jf:if>
												<jf:if test="${dDJ02.XB==0}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XBN" value="1"
															disabled="disabled"> 男
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XBN" value="0" checked="checked"
															disabled="disabled"> 女
														</label>
													</div>
												</jf:if>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">生日 </label>
												<div class="col-md-9">
													<input id="datetimepickertwo" type="text" name="SRN"
														class="form-control" data-date-format="yyyy-mm-dd"
														value="<fmt:formatDate value="${dDJ02.SR}" pattern="yyyy-MM-dd"/>"
														readonly="readonly">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">学历 </label>
												<div class="col-md-9">
													<jf:forEach var="xl" items="${listxl}">
														<jf:if test="${dDJ02.XL==xl.BM}">
															<input type="text" class="form-control"
																value="${xl.HZMC}" readonly="readonly">
														</jf:if>
													</jf:forEach>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">家庭人口 </label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JTRKN"
														class="form-control" value="${dDJ02.JTRK}"
														readonly="readonly">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">人均年收入(元) </label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="RJSRN"
														class="form-control" value="${dDJ02.RJSR}"
														readonly="readonly">
												</div>
											</div>
										</div>
										<div id="bl" style="display: none;">
											<div class="form-group">
												<label class="col-md-3 control-label">性别 <i
													style="color: red">*</i>
												</label>
												<jf:if test="${dDJ02.XB==1}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XB" value="1" checked="checked"
															disabled="disabled"> 男
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XB" value="0"
															disabled="disabled"> 女
														</label>
													</div>
												</jf:if>
												<jf:if test="${dDJ02.XB==0}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XB" value="1"
															disabled="disabled"> 男
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XB" value="0" checked="checked"
															disabled="disabled"> 女
														</label>
													</div>
												</jf:if>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">生日 <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input id="datetimepicker" type="text" name="SR"
														class="form-control" data-date-format="yyyy-mm-dd"
														value="<fmt:formatDate value="${dDJ02.SR}" pattern="yyyy-MM-dd"/>"
														readonly="readonly">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">学历 <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<jf:forEach var="xl" items="${listxl}">
														<jf:if test="${dDJ02.XL==xl.BM}">
															<input type="text" class="form-control"
																value="${xl.HZMC}" readonly="readonly">
														</jf:if>
													</jf:forEach>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">家庭人口 <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JTRK"
														class="form-control" value="${dDJ02.JTRK}"
														readonly="readonly">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">人均年收入(元) <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="RJSR"
														class="form-control" value="${dDJ02.RJSR}"
														readonly="readonly">
												</div>
											</div>
										</div>
									</jf:if>
									<div class="form-group">
										<label class="col-md-3 control-label">邮箱 </label>
										<div class="col-md-9">
											<input type="email" id="text-input" name="YX"
												class="form-control" value="${dDJ02.YX}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">生产面积(亩) </label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="SCMJ"
												class="form-control" value="${dDJ02.SCMJ}"
												readonly="readonly">
										</div>
									</div>
									<jf:forEach var="ddj02_ddj01" items="${listddj02_ddj01}">
										<div class="form-group">
											<label class="col-md-3 control-label">服务内容 </label>
											<div class="col-md-9">
												<input type="text" id="text-input" name="FWNR"
													class="form-control" value="${ddj02_ddj01.DDJ01_JFID}:${ddj02_ddj01.FWNR}"
													readonly="readonly">
											</div>
										</div>
									</jf:forEach>
									<div class="form-group">
										<label class="col-md-3 control-label">备注</label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="BZ" rows="3"
												class="form-control" readonly="readonly">${dDJ02.BZ}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">登记人员</label>
										<div class="col-md-9">
											<input type="text" id="text-input" class="form-control"
												value="${dDJ02.LRRY_MC}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">登记日期</label>
										<div class="col-md-9">
											<input type="text" id="text-input" class="form-control"
												value="<fmt:formatDate value="${dDJ02.LRRQ}" pattern="yyyy-MM-dd HH:mm:ss"/>"
												readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-12 control-label" style="text-align: center;">地块信息</label>
									</div>
									<!-- 地块信息 -->
									<div class="form-group">
										<label class="col-md-2 control-label" style="text-align: center;">地块名称</label>
										<label class="col-md-2 control-label" style="text-align: center;">地块类型</label>
										<label class="col-md-1 control-label" style="text-align: center;">面积</label>
										<label class="col-md-2 control-label" style="text-align: center;">作物</label>
										<label class="col-md-2 control-label" style="text-align: center;">经度</label>
										<label class="col-md-2 control-label" style="text-align: center;">纬度</label>
										<label class="col-md-1 control-label" style="text-align: left;">操作</label>
									</div>
									<!-- 添加地块信息 -->
									<jf:forEach var="ddj02_d" items="${listddj02_d}">
										<div class="form-group">
											<div class="col-md-2">
												<input type="text" id="text-input" class="form-control"
													value="${ddj02_d.DH}" readonly="readonly">
											</div>
											<div class="col-md-2">
												<input type="text" id="text-input" class="form-control"
													value="${ddj02_d.DLX}" readonly="readonly">
											</div>
											<div class="col-md-1">
												<input type="text" id="text-input" class="form-control"
													value="${ddj02_d.MJ}" readonly="readonly">
											</div>
											<div class="col-md-2">
												<jf:if test="${ddj02_d.NZW ne '其他'}">
													<input type="text" id="text-input" class="form-control"
														value="${ddj02_d.NZW}" readonly="readonly">
												</jf:if>
												<jf:if test="${ddj02_d.NZW eq '其他'}">
													<input type="text" id="text-input" class="form-control"
														value="${ddj02_d.NZW_MC}" readonly="readonly">
												</jf:if>
											</div>
											<div class="col-md-2">
												<input type="text" id="text-input" class="form-control"
													value="${ddj02_d.JD}" readonly="readonly">
											</div>
											<div class="col-md-2">
												<input type="text" id="text-input" class="form-control"
													value="${ddj02_d.WD}" readonly="readonly">
											</div>
											<div class="col-md">
												<a class="btn btn-info"
													href="${path}searchnh/gotodklabel.do?id=${ddj02_d.JFID}">
													<i class="fa fa-search "></i>
												</a>
											</div>
										</div>
									</jf:forEach>
									<div class="modal-footer">
										<a class="btn btn-danger" data-dismiss="modal"
											href="javascript:history.go(-1);"> <i class="fa fa-ban"></i>
											返回
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
	function zwxz() {
		if ($("#selectnzw option:selected").val() == 99) {
			$("#zwmc").css('display', 'block');
		} else {
			$("#zwmc").css('display', 'none');
		}
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
	$(function() {
		$("#801").addClass("opened");
		$("#802").css('display', 'block');
	});
	
</script>
</html>