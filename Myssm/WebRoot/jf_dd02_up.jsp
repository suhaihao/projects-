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
		request.setAttribute("dDJ02_DDJ01",
				request.getAttribute("dDJ02_DDJ01"));
		request.setAttribute("listdklx", request.getAttribute("listdklx"));
		request.setAttribute("listzw", request.getAttribute("listzw"));
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
							<li><i class="fa fa-male"></i>客户修改</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>客户修改</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<form id="myfrom" action="${path}yhgl/xgnhxx.do" method="post">
								<input type="hidden" id="JFID" name="JFID" value="${dDJ02.JFID}">
								<div id="body" class="panel-body">
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
												value="${dDJ02.MC}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">行政区划 <i
											style="color: red">*</i>
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
										<label class="col-md-3 control-label">地址 <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="DZ"
												class="form-control" placeholder="请输入地址" value="${dDJ02.DZ}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">手机 <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="YDDH"
												class="form-control" value="${dDJ02.YDDH}">
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
													onclick="choce(this)"> 个人
												</label>
												<label class="radio-inline"> <input type="radio"
													id="inline-radio2" name="YHLB" value="0"
													onclick="choce(this)"> 单位
												</label>
											</jf:if>
											<jf:if test="${dDJ02.YHLB==0}">
												<label class="radio-inline"> <input type="radio"
													id="inline-radio1" name="YHLB" value="1"
													onclick="choce(this)"> 个人
												</label>
												<label class="radio-inline"> <input type="radio"
													id="inline-radio2" name="YHLB" value="0" checked="checked"
													onclick="choce(this)"> 单位
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
															id="inline-radio1" name="XB" value="1" checked="checked">
															男
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XB" value="0"> 女
														</label>
													</div>
												</jf:if>
												<jf:if test="${dDJ02.XB==0}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XB" value="1"> 男
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XB" value="0" checked="checked">
															女
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
														class="form-control" placeholder="请输入生日（yyyy-mm-dd）"
														data-date-format="yyyy-mm-dd"
														value="<fmt:formatDate value="${dDJ02.SR}" pattern="yyyy-MM-dd"/>"
														onchange="xgsr()">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">学历 <i
													style="color: red">*</i>
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
												<label class="col-md-3 control-label">家庭人口 <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JTRK"
														class="form-control" placeholder="请输入家庭人口"
														value="${dDJ02.JTRK}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">人均年收入(元) <i
													style="color: red">*</i>
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
												<label class="col-md-3 control-label">性别 </label>
												<jf:if test="${dDJ02.XB==1}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XBN" value="1" checked="checked">
															男
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XBN" value="0"> 女
														</label>
													</div>
												</jf:if>
												<jf:if test="${dDJ02.XB==0}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XBN" value="1"> 男
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XBN" value="0" checked="checked">
															女
														</label>
													</div>
												</jf:if>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">生日 </label>
												<div class="col-md-9">
													<input id="datetimepickertwo" type="text" name="SRN"
														class="form-control" placeholder="请输入生日（yyyy-mm-dd）"
														data-date-format="yyyy-mm-dd"
														value="<fmt:formatDate value="${dDJ02.SR}" pattern="yyyy-MM-dd"/>">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">学历 </label>
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
												<label class="col-md-3 control-label">家庭人口 </label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JTRKN"
														class="form-control" placeholder="请输入家庭人口"
														value="${dDJ02.JTRK}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">人均年收入(元) </label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="RJSRN"
														class="form-control" placeholder="请输入人均年收入"
														value="${dDJ02.RJSR}">
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
															id="inline-radio1" name="XBN" value="1" checked="checked">
															男
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XBN" value="0"> 女
														</label>
													</div>
												</jf:if>
												<jf:if test="${dDJ02.XB==0}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XBN" value="1"> 男
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XBN" value="0" checked="checked">
															女
														</label>
													</div>
												</jf:if>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">生日 </label>
												<div class="col-md-9">
													<input id="datetimepickertwo" type="text" name="SRN"
														class="form-control" placeholder="请输入生日（yyyy-mm-dd）"
														data-date-format="yyyy-mm-dd"
														value="<fmt:formatDate value="${dDJ02.SR}" pattern="yyyy-MM-dd"/>">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">学历 </label>
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
												<label class="col-md-3 control-label">家庭人口 </label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JTRKN"
														class="form-control" placeholder="请输入家庭人口"
														value="${dDJ02.JTRK}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">人均年收入(元) </label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="RJSRN"
														class="form-control" placeholder="请输入人均年收入"
														value="${dDJ02.RJSR}">
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
															id="inline-radio1" name="XB" value="1" checked="checked">
															男
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XB" value="0"> 女
														</label>
													</div>
												</jf:if>
												<jf:if test="${dDJ02.XB==0}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XB" value="1"> 男
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XB" value="0" checked="checked">
															女
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
														class="form-control" placeholder="请输入生日（yyyy-mm-dd）"
														data-date-format="yyyy-mm-dd"
														value="<fmt:formatDate value="${dDJ02.SR}" pattern="yyyy-MM-dd"/>"
														onchange="xgsr()">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">学历 <i
													style="color: red">*</i>
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
												<label class="col-md-3 control-label">家庭人口 <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JTRK"
														class="form-control" placeholder="请输入家庭人口"
														value="${dDJ02.JTRK}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">人均年收入(元) <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="RJSR"
														class="form-control" placeholder="请输入人均年收入"
														value="${dDJ02.RJSR}">
												</div>
											</div>
										</div>
									</jf:if>
									<div class="form-group">
										<label class="col-md-3 control-label">邮箱 </label>
										<div class="col-md-9">
											<input type="email" id="text-input" name="YX"
												class="form-control" placeholder="请输入邮箱" value="${dDJ02.YX}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">生产面积(亩) </label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="SCMJ"
												class="form-control" placeholder="请输生产面积"
												value="${dDJ02.SCMJ}">
										</div>
									</div>
									<!-- 
									<div class="form-group">
										<label class="col-md-3 control-label">服务内容 </label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="FWNR"
												class="form-control" placeholder="请输服务内容"
												value="${dDJ02_DDJ01.FWNR}">
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
										<label class="col-md-1 control-label">操作</label>
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
													href="${path}yhgl/updk.do?id=${ddj02_d.JFID}"> <i
													class="fa fa-edit"></i></a> <a class="btn btn-danger"
													href="javascript:void(0);"
													onclick="remevo(this,'${path}','${ddj02_d.JFID}','${dDJ02.JFID}')">
													<i class="fa fa-trash-o "></i>
												</a>
											</div>
										</div>
									</jf:forEach>
								</div>
								<div class="modal-footer">
									<a class="btn btn-primary btn-setting" href="#"> <i
										class="fa fa-edit "></i> 增加地块
									</a> <a class="btn btn-primary " href="#"
										onclick="xgmm('${dDJ02.JFID}')"> <i class="fa fa-edit "></i>
										修改密码
									</a> <a class="btn btn-primary "
										href="${path}order/gotoadd.do?DDJ02_JFID=${dDJ02.JFID}&DDJ02_MC=${dDJ02.MC}&DDJ02_DZ=${dDJ02.DZ}&DDJ02_YDDH=${dDJ02.YDDH}">
										<i class="fa fa-file-text"></i> 派单
									</a>
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
				<label><img src="${path}assets/img/logo/GB.png">Copyright
					北京际峰天翔信息技术有限公司</label>
			</div>
		</div>
		<!--/container-->

		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">地块管理</h4>
					</div>
					<form id="mydk" action="${path}/yhgl/adddk.do" method="post"
						class="form-horizontal">
						<input type="hidden" name="DDJ02_JFID" value="${dDJ02.JFID}">
						<div class="modal-body">
							<!-- 表单 -->
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h2>
												<i class="fa fa-indent red"></i><strong>选择地块</strong>
											</h2>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="col-md-3 control-label">地块名称 <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="DH"
														class="form-control" placeholder="请输入模块名称">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">地块类型 <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<select id="select" name="DLX" class="form-control"
														size="1">
														<option value="">请选择</option>
														<jf:forEach var="dklx" items="${listdklx}">
															<option value="${dklx.BM}">${dklx.HZMC}</option>
														</jf:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">面积（亩） <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="MJ"
														class="form-control" placeholder="请输入面积">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">农作物 <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<select id="selectnzw" name="NZW" class="form-control"
														size="1" onchange="zwxz()">
														<option value="">请选择</option>
														<jf:forEach var="zw" items="${listzw}">
															<option value="${zw.BM}">${zw.HZMC}</option>
														</jf:forEach>
													</select>
												</div>
											</div>
											<div class="form-group" id="zwmc" style="display: none;">
												<label class="col-md-3 control-label">农作物名称 <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="NZW_MC"
														class="form-control" placeholder="请输入作物名称">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">经度 </label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JD"
														class="form-control" placeholder="请输入经度">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">纬度 </label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="WD"
														class="form-control" placeholder="请输入纬度">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">备注</label>
												<div class="col-md-9">
													<textarea name="BZ" rows="3" class="form-control"
														placeholder="说点什么。。。"></textarea>
												</div>
											</div>
											<br>
										</div>
									</div>
								</div>
								<!--表单结束-->
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-sm btn-success">
								<i class="fa fa-dot-circle-o"></i> 确认
							</button>
							<button type="reset" class="btn btn-sm btn-danger"
								data-dismiss="modal">
								<i class="fa fa-ban"></i> 关闭
							</button>
						</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<div class="modal fade" id="exampleModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">修改密码</h4>
					</div>
					<form id="elofrom" action="${path}/yhgl/upmm.do" method="post"
						class="form-horizontal">
						<input id="JFIDMM" type="hidden" name="JFID" value="">
						<div class="modal-body">
							<!-- 表单 -->
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h2>
												<i class="fa fa-indent red"></i><strong>修改密码</strong>
											</h2>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="col-md-3 control-label">密码 <i
													style="color: red">*</i>
												</label>
												<div class=" col-md-9">
													<input type="password" id="password-input"
														name="JFPASSWORD" class="form-control" placeholder="请输入密码">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">确认密码 <i
													style="color: red">*</i>
												</label>
												<div class=" col-md-9">
													<input type="password" id="password-input"
														name="confirmPassword" class="form-control"
														placeholder="请输入密码">
												</div>
											</div>
											<br>
										</div>
									</div>
								</div>
								<!--表单结束-->
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-sm btn-success">
								<i class="fa fa-dot-circle-o"></i> 提交
							</button>
							<button type="reset" class="btn btn-sm btn-danger"
								data-dismiss="modal">
								<i class="fa fa-ban"></i> 关闭
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
		<script src="${path}/assets/js/bootstrap-treeview.js"></script>

		<!-- end: JavaScript-->
</body>
<script type="text/javascript">
	function xgsr() {
		$("#myfrom").data('bootstrapValidator').validateField('SR');
		$("#myfrom").data('bootstrapValidator').updateStatus('SR',
				'NOT_VALIDATED', null).validateField('SR');
	}
	function remevo(obj, src, id, upid) {
		if (confirm("你确定要删除吗？")) {
			obj.href = src + "yhgl/deldk.do?id=" + id + "&upid=" + upid;
		}
	}
	function xgmm(id) {
		$("#JFIDMM").attr("value", id);
		$("#exampleModal").modal("show");
	}
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
					trigger : 'blur',
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
				YDDH : {
					validators : {
						notEmpty : {
							message : '请输入手机号'
						},
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
		$('#mydk').bootstrapValidator({
			message : 'This value is not valid',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				DH : {
					validators : {
						notEmpty : {
							message : '地块名称不能为空'
						}
					}
				},
				DLX : {
					validators : {
						notEmpty : {
							message : '请选择地块类型'
						}
					}
				},
				NZW : {
					validators : {
						notEmpty : {
							message : '请选择农作物'
						}
					}
				},
				NZW_MC : {
					validators : {
						notEmpty : {
							message : '请输入作物名称'
						}
					}
				},
				MJ : {
					validators : {
						notEmpty : {
							message : '面积不能为空'
						},
						regexp : {
							regexp : /^[0-9\.]+$/,
							message : '只能输入数字'
						}
					}
				},
				JD : {
					validators : {
						stringLength : {
							min : 1,
							max : 9,
							message : '不能低于一位长度不能超过九位'
						},
						regexp : {
							regexp : /^[0-9\.]+$/,
							message : '格式错误只能输入数字小数点'
						}
					}
				},
				WD : {
					validators : {
						stringLength : {
							min : 1,
							max : 9,
							message : '不能低于一位长度不能超过九位'
						},
						regexp : {
							regexp : /^[0-9\.]+$/,
							message : '格式错误只能输入数字小数点'
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
							message : '密码不能为空'
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
		autoclose : true,
		language : 'zh-CN',
		format: 'yyyy-mm-dd',
		todayBtn : true,
		forceParse : false
	});
	$('#datetimepickertwo').datetimepicker({
		minView : "month",//设置只显示到月份
		autoclose : true,
		language : 'zh-CN',
		todayBtn : true,
	});
</script>
</html>