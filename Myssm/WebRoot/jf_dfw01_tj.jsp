<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.ssh.user.model.User"%>
<%@ page import="com.ssh.user.util.EHCache"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jf"%>
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
		request.setAttribute("FZFZR_MC", request.getAttribute("FZFZR_MC"));
		request.setAttribute("FZFZR", request.getAttribute("FZFZR"));
		request.setAttribute("DDJ02_MC", request.getAttribute("DDJ02_MC"));
		request.setAttribute("DDJ02_JFID",
				request.getAttribute("DDJ02_JFID"));
		request.setAttribute("StarTime", request.getAttribute("StarTime"));
		request.setAttribute("EndTime", request.getAttribute("EndTime"));
		request.setAttribute("DDJ03_JFID",
				request.getAttribute("DDJ03_JFID"));
		request.setAttribute("XZQH", request.getAttribute("XZQH"));
		request.setAttribute("XZQHMC", request.getAttribute("XZQHMC"));
		request.setAttribute("FWNRLB", request.getAttribute("FWNRLB"));
		request.setAttribute("bt", request.getAttribute("bt"));
		request.setAttribute("jzbt", request.getAttribute("jzbt"));
		request.setAttribute("ids", request.getAttribute("ids"));
		request.setAttribute("idsfh", request.getAttribute("idsfh"));
		request.setAttribute("listfwtj", request.getAttribute("listfwtj"));
		request.setAttribute("fWTJ", request.getAttribute("fWTJ"));
		request.setAttribute("listFWNRLB",
				request.getAttribute("listFWNRLB"));
		request.setAttribute("listddj03", request.getAttribute("listddj03"));
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
							<li><i class="fa fa-heart"></i>服务统计</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>服务统计</strong>
								</h2>
								<div class="panel-actions">
									<a href="" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<form id="tjfrom" action="${path}fwtj/sel.do"
									class="form-horizontal" method="post">
									<input type="hidden" id="Str"> <input type="hidden"
										id="bt" name="bt"> <input type="hidden" id="sel"
										name="sel"> <input type="hidden" id="ids" name="ids">
									<input type="hidden" id="group" name="group">
									<div class="form-group">
										<label class="col-md-2 control-label">负责人</label>
										<div class="col-md-3">
											<input type="text" id="FZFZR_MC" name="FZFZR_MC"
												class="form-control" value="${FZFZR_MC}"
												onchange="fzrgb(this)"> <input type="hidden"
												name="FZFZR" id="FZFZR" value="${FZFZR}" />
										</div>
										<div class="col-md-1">
											<a href="javascript:void(0);" class="btn btn-info "
												onclick="fzfzr()"> <i class="fa fa-search "></i>
											</a>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">客户</label>
										<div class="col-md-3">
											<input type="text" id="DDJ02_MC" name="DDJ02_MC"
												class="form-control" value="${DDJ02_MC}"
												onchange="yhgb(this)"> <input type="hidden"
												name="DDJ02_JFID" id="DDJ02_JFID" value="${DDJ02_JFID}" />
										</div>
										<div class="col-md-1">
											<a href="javascript:void(0);" class="btn btn-info "
												onclick="xzyh()"> <i class="fa fa-search "></i>
											</a>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">时间</label>
										<div class="col-md-3">
											<input id="datetimepickerup" name="StarTime" type="text"
												class="form-control" placeholder="起始日期（yyyy-mm-dd）"
												data-date-format="yyyy-mm-dd" value="${StarTime}">
										</div>
										<label class="col-md-1" style="text-align: center;">至</label>
										<div class="col-md-3">
											<input id="datetimepickerdon" name="EndTime" type="text"
												class="form-control" placeholder="结束日期（yyyy-mm-dd）"
												data-date-format="yyyy-mm-dd" value="${EndTime}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">项目</label>
										<div class="col-md-3">
											<select id="selectDDJ03_JFID" name="DDJ03_JFID"
												class="form-control" size="1" onchange="chagesj()">
												<option value="">请选择</option>
												<jf:forEach var="ddj03" items="${listddj03}">
													<jf:if test="${DDJ03_JFID==ddj03.JFID}">
														<option selected="selected" value="${ddj03.JFID}">${ddj03.XMMC}</option>
													</jf:if>
													<jf:if test="${DDJ03_JFID!=ddj03.JFID}">
														<option value="${ddj03.JFID}">${ddj03.XMMC}</option>
													</jf:if>
												</jf:forEach>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">行政区划</label>
										<div class="col-md-3">
											<input type="text" id="xzqh" name="XZQHMC"
												class="form-control" placeholder="请选择行政区划" onclick="tree()"
												value="${XZQHMC}" onchange="xg(this)"><input
												type="hidden" id="xzqhbm" name="XZQH" class="form-control"
												value="${XZQH}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">服务内容</label>
										<div class="col-md-3">
											<select id="selectFWNRLB" name="FWNRLB" class="form-control"
												size="1" onchange="chagesj()">
												<option value="">请选择</option>
												<jf:forEach var="FWNRLBs" items="${listFWNRLB}">
													<jf:if test="${FWNRLB==FWNRLBs.BM}">
														<option selected="selected" value="${FWNRLBs.BM}">${FWNRLBs.HZMC}</option>
													</jf:if>
													<jf:if test="${FWNRLB!=FWNRLBs.BM}">
														<option value="${FWNRLBs.BM}">${FWNRLBs.HZMC}</option>
													</jf:if>
												</jf:forEach>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3" style="text-align: center;">可选统计方式(双击选择)</label>
										<label class="col-md-1" style="text-align: center;"></label> <label
											class="col-md-3" style="text-align: center;">已选统计方式(双击取消)</label>
									</div>
									<div class="form-group">
										<div class="col-md-3">
											<select id="multiple-select1" name="multiple-select1"
												class="form-control" size="5" multiple=""
												ondblclick="seldbclick(1)">
												<option id="n" value="TO_CHAR(A.WCRQ,'yyyy')">年</option>
												<option id="nj" value="TO_CHAR(A.WCRQ,'yyyy-Q')">年季</option>
												<option id="ny" value="TO_CHAR(A.WCRQ,'yyyy-mm')">年月</option>
												<option id="r" value="TO_CHAR(A.WCRQ,'yyyy-mm-dd')">日</option>
												<option id="jd" value="TO_CHAR(A.WCRQ,'Q')">季度</option>
												<option id="yf" value="TO_CHAR(A.WCRQ,'mm')">月份</option>
												<option id="fwnr"
													value="A.FWNRLB,F_GET_MC('FWNRLB',A.FWNRLB)">服务内容</option>
												<option id="xm"
													value="A.DDJ03_JFID,F_GET_MC('BTXM',A.DDJ03_JFID)">项目</option>
												<option id="fzfzrmc" value="A.FZFZR,A.FZFZR_MC">防治负责人</option>
												<option id="ss"
													value="SUBSTR(c.XZQH,1,5) ssbm,f_get_mc('FBDQ',SUBSTR(c.XZQH,1,5))">省市</option>
												<option id="qx"
													value="SUBSTR(c.XZQH,1,7) qxbm,f_get_mc('FBDQ',SUBSTR(c.XZQH,1,7))">区县</option>
												<option id="xz"
													value="SUBSTR(c.XZQH,1,9) xzbm,f_get_mc('FBDQ',SUBSTR(c.XZQH,1,9))">乡镇</option>
												<option id="yh" value="A.DDJ02_JFID,A.DDJ02_MC">客户</option>
											</select>
										</div>
										<div class="col-md-1" style="text-align: center;">
											<i class="fa fa-arrow-right"></i> <i
												class="fa fa-arrow-right"></i> 
										</div>
										<div class="col-md-3">
											<select id="multiple-select2" name="multiple-select2"
												class="form-control" size="5" multiple=""
												ondblclick="seldbclick(2)">
											</select>
										</div>
									</div>
									<div style="text-align:center;">
										<button class="btn btn-info" type="button" onclick="TJ()"
											style="margin-top: 5px;">
											<i class="fa fa-search "></i> 统计
										</button>
									</div>
								</form>
								<table
									class="table table-striped table-bordered bootstrap-datatable datatable">
									<thead>
										<tr>
											<jf:if test="${fn:length(bt)>=1}">
												<th rowspan="1" colspan="${fn:length(bt)}">统计方式</th>
											</jf:if>
											<jf:if test="${fn:length(bt)<1}">
												<th rowspan="2">统计方式</th>
											</jf:if>
											<th rowspan="2">防治面积(亩)</th>
											<th rowspan="2">收费金额</th>
											<th rowspan="2">亩均收费金额</th>
											<th rowspan="2">亩均作业工时</th>
											<th rowspan="2">亩均实际工时(*人数)</th>
											<th colspan="5" style="text-align: center;">防治措施使用量</th>
											<th rowspan="2">合计成本</th>
											<th rowspan="2">亩均成本</th>
											<th rowspan="2">亩均净成本</th>
										</tr>
										<tr>
											<jf:if test="${fn:length(bt)>=1}">
												<jf:forEach var="bt" items="${bt}">
													<th>${bt}</th>
												</jf:forEach>
											</jf:if>
											<th>生物农药</th>
											<th>化学农药</th>
											<th>理化诱控</th>
											<th>有益昆虫</th>
											<th>其他</th>
										</tr>
									</thead>
									<tbody>
										<jf:forEach var="fwtj" items="${listfwtj}">
											<tr>
												<jf:if test="${fn:length(bt)<1}">
													<td>暂无</td>
												</jf:if>
												<jf:if test="${fn:length(bt)>=1}">
													<jf:forEach var="id" items="${ids}">
														<jf:if test="${id=='n'}">
															<th><a
																href="${path}fwtj/djtj.do?idsfh=${idsfh}&FZFZR=${FZFZR}&DDJ02_JFID=${DDJ02_JFID}&StarTime=${StarTime}&EndTime=${EndTime}&FWNRLB=${FWNRLB}&vals=${fwtj.n},!${fwtj.nj},!${fwtj.ny},!${fwtj.r},!${fwtj.jd},!${fwtj.yf},!${fwtj.FWNRLB},!${fwtj.DDJ03_JFID},!${fwtj.FZFZR},!${fwtj.ssbm},!${fwtj.qxbm},!${fwtj.xzbm},!${fwtj.DDJ02_JFID},!">${fwtj.n}</a></th>
														</jf:if>
														<jf:if test="${id=='nj'}">
															<th><a
																href="${path}fwtj/djtj.do?idsfh=${idsfh}&FZFZR=${FZFZR}&DDJ02_JFID=${DDJ02_JFID}&StarTime=${StarTime}&EndTime=${EndTime}&FWNRLB=${FWNRLB}&vals=${fwtj.n},!${fwtj.nj},!${fwtj.ny},!${fwtj.r},!${fwtj.jd},!${fwtj.yf},!${fwtj.FWNRLB},!${fwtj.DDJ03_JFID},!${fwtj.FZFZR},!${fwtj.ssbm},!${fwtj.qxbm},!${fwtj.xzbm},!${fwtj.DDJ02_JFID},!">${fwtj.nj}</a></th>
														</jf:if>
														<jf:if test="${id=='ny'}">
															<th><a
																href="${path}fwtj/djtj.do?idsfh=${idsfh}&FZFZR=${FZFZR}&DDJ02_JFID=${DDJ02_JFID}&StarTime=${StarTime}&EndTime=${EndTime}&FWNRLB=${FWNRLB}&vals=${fwtj.n},!${fwtj.nj},!${fwtj.ny},!${fwtj.r},!${fwtj.jd},!${fwtj.yf},!${fwtj.FWNRLB},!${fwtj.DDJ03_JFID},!${fwtj.FZFZR},!${fwtj.ssbm},!${fwtj.qxbm},!${fwtj.xzbm},!${fwtj.DDJ02_JFID},!">${fwtj.ny}</a></th>
														</jf:if>
														<jf:if test="${id=='r'}">
															<th><a
																href="${path}fwtj/djtj.do?idsfh=${idsfh}&FZFZR=${FZFZR}&DDJ02_JFID=${DDJ02_JFID}&StarTime=${StarTime}&EndTime=${EndTime}&FWNRLB=${FWNRLB}&vals=${fwtj.n},!${fwtj.nj},!${fwtj.ny},!${fwtj.r},!${fwtj.jd},!${fwtj.yf},!${fwtj.FWNRLB},!${fwtj.DDJ03_JFID},!${fwtj.FZFZR},!${fwtj.ssbm},!${fwtj.qxbm},!${fwtj.xzbm},!${fwtj.DDJ02_JFID},!">${fwtj.r}</a></th>
														</jf:if>
														<jf:if test="${id=='jd'}">
															<th><a
																href="${path}fwtj/djtj.do?idsfh=${idsfh}&FZFZR=${FZFZR}&DDJ02_JFID=${DDJ02_JFID}&StarTime=${StarTime}&EndTime=${EndTime}&FWNRLB=${FWNRLB}&vals=${fwtj.n},!${fwtj.nj},!${fwtj.ny},!${fwtj.r},!${fwtj.jd},!${fwtj.yf},!${fwtj.FWNRLB},!${fwtj.DDJ03_JFID},!${fwtj.FZFZR},!${fwtj.ssbm},!${fwtj.qxbm},!${fwtj.xzbm},!${fwtj.DDJ02_JFID},!">${fwtj.jd}</a></th>
														</jf:if>
														<jf:if test="${id=='yf'}">
															<th><a
																href="${path}fwtj/djtj.do?idsfh=${idsfh}&FZFZR=${FZFZR}&DDJ02_JFID=${DDJ02_JFID}&StarTime=${StarTime}&EndTime=${EndTime}&FWNRLB=${FWNRLB}&vals=${fwtj.n},!${fwtj.nj},!${fwtj.ny},!${fwtj.r},!${fwtj.jd},!${fwtj.yf},!${fwtj.FWNRLB},!${fwtj.DDJ03_JFID},!${fwtj.FZFZR},!${fwtj.ssbm},!${fwtj.qxbm},!${fwtj.xzbm},!${fwtj.DDJ02_JFID},!">${fwtj.yf}</a></th>
														</jf:if>
														<jf:if test="${id=='fwnr'}">
															<th><a
																href="${path}fwtj/djtj.do?idsfh=${idsfh}&FZFZR=${FZFZR}&DDJ02_JFID=${DDJ02_JFID}&StarTime=${StarTime}&EndTime=${EndTime}&FWNRLB=${FWNRLB}&vals=${fwtj.n},!${fwtj.nj},!${fwtj.ny},!${fwtj.r},!${fwtj.jd},!${fwtj.yf},!${fwtj.FWNRLB},!${fwtj.DDJ03_JFID},!${fwtj.FZFZR},!${fwtj.ssbm},!${fwtj.qxbm},!${fwtj.xzbm},!${fwtj.DDJ02_JFID},!">${fwtj.fwnr}</a></th>
														</jf:if>
														<jf:if test="${id=='xm'}">
															<th><a
																href="${path}fwtj/djtj.do?idsfh=${idsfh}&FZFZR=${FZFZR}&DDJ02_JFID=${DDJ02_JFID}&StarTime=${StarTime}&EndTime=${EndTime}&FWNRLB=${FWNRLB}&vals=${fwtj.n},!${fwtj.nj},!${fwtj.ny},!${fwtj.r},!${fwtj.jd},!${fwtj.yf},!${fwtj.FWNRLB},!${fwtj.DDJ03_JFID},!${fwtj.FZFZR},!${fwtj.ssbm},!${fwtj.qxbm},!${fwtj.xzbm},!${fwtj.DDJ02_JFID},!">${fwtj.xm}</a></th>
														</jf:if>
														<jf:if test="${id=='fzfzrmc'}">
															<th><a
																href="${path}fwtj/djtj.do?idsfh=${idsfh}&FZFZR=${FZFZR}&DDJ02_JFID=${DDJ02_JFID}&StarTime=${StarTime}&EndTime=${EndTime}&FWNRLB=${FWNRLB}&vals=${fwtj.n},!${fwtj.nj},!${fwtj.ny},!${fwtj.r},!${fwtj.jd},!${fwtj.yf},!${fwtj.FWNRLB},!${fwtj.DDJ03_JFID},!${fwtj.FZFZR},!${fwtj.ssbm},!${fwtj.qxbm},!${fwtj.xzbm},!${fwtj.DDJ02_JFID},!">${fwtj.fzfzrmc}</a></th>
														</jf:if>
														<jf:if test="${id=='ss'}">
															<th><a
																href="${path}fwtj/djtj.do?idsfh=${idsfh}&FZFZR=${FZFZR}&DDJ02_JFID=${DDJ02_JFID}&StarTime=${StarTime}&EndTime=${EndTime}&FWNRLB=${FWNRLB}&vals=${fwtj.n},!${fwtj.nj},!${fwtj.ny},!${fwtj.r},!${fwtj.jd},!${fwtj.yf},!${fwtj.FWNRLB},!${fwtj.DDJ03_JFID},!${fwtj.FZFZR},!${fwtj.ssbm},!${fwtj.qxbm},!${fwtj.xzbm},!${fwtj.DDJ02_JFID},!">${fwtj.ss}</a></th>
														</jf:if>
														<jf:if test="${id=='qx'}">
															<th><a
																href="${path}fwtj/djtj.do?idsfh=${idsfh}&FZFZR=${FZFZR}&DDJ02_JFID=${DDJ02_JFID}&StarTime=${StarTime}&EndTime=${EndTime}&FWNRLB=${FWNRLB}&vals=${fwtj.n},!${fwtj.nj},!${fwtj.ny},!${fwtj.r},!${fwtj.jd},!${fwtj.yf},!${fwtj.FWNRLB},!${fwtj.DDJ03_JFID},!${fwtj.FZFZR},!${fwtj.ssbm},!${fwtj.qxbm},!${fwtj.xzbm},!${fwtj.DDJ02_JFID},!">${fwtj.qx}</a></th>
														</jf:if>
														<jf:if test="${id=='xz'}">
															<th><a
																href="${path}fwtj/djtj.do?idsfh=${idsfh}&FZFZR=${FZFZR}&DDJ02_JFID=${DDJ02_JFID}&StarTime=${StarTime}&EndTime=${EndTime}&FWNRLB=${FWNRLB}&vals=${fwtj.n},!${fwtj.nj},!${fwtj.ny},!${fwtj.r},!${fwtj.jd},!${fwtj.yf},!${fwtj.FWNRLB},!${fwtj.DDJ03_JFID},!${fwtj.FZFZR},!${fwtj.ssbm},!${fwtj.qxbm},!${fwtj.xzbm},!${fwtj.DDJ02_JFID},!">${fwtj.xz}</a></th>
														</jf:if>
														<jf:if test="${id=='yh'}">
															<th><a
																href="${path}fwtj/djtj.do?idsfh=${idsfh}&FZFZR=${FZFZR}&DDJ02_JFID=${DDJ02_JFID}&StarTime=${StarTime}&EndTime=${EndTime}&FWNRLB=${FWNRLB}&vals=${fwtj.n},!${fwtj.nj},!${fwtj.ny},!${fwtj.r},!${fwtj.jd},!${fwtj.yf},!${fwtj.FWNRLB},!${fwtj.DDJ03_JFID},!${fwtj.FZFZR},!${fwtj.ssbm},!${fwtj.qxbm},!${fwtj.xzbm},!${fwtj.DDJ02_JFID},!">${fwtj.yh}</a></th>
														</jf:if>
													</jf:forEach>
												</jf:if>
												<td>${fwtj.fzmj}</td>
												<td>${fwtj.sfje}</td>
												<td>${fwtj.mjje}</td>
												<td>${fwtj.mjgs}</td>
												<td>${fwtj.mjsjgs}</td>
												<td>${fwtj.swny}</td>
												<td>${fwtj.hxny}</td>
												<td>${fwtj.lhyk}</td>
												<td>${fwtj.yykc}</td>
												<td>${fwtj.qt}</td>
												<td>${fwtj.hjcb}</td>
												<td>${fwtj.mjcb}</td>
												<td>${fwtj.mjjcb}</td>
											</tr>
										</jf:forEach>
										<jf:if test="${fn:length(bt)>=1}">
											<tr>
												<td colspan="${fn:length(bt)}">合计</td>
												<td>${fWTJ.fzmj}</td>
												<td>${fWTJ.sfje}</td>
												<td>${fWTJ.mjje}</td>
												<td>${fWTJ.mjgs}</td>
												<td>${fWTJ.mjsjgs}</td>
												<td>${fWTJ.swny}</td>
												<td>${fWTJ.hxny}</td>
												<td>${fWTJ.lhyk}</td>
												<td>${fWTJ.yykc}</td>
												<td>${fWTJ.qt}</td>
												<td>${fWTJ.hjcb}</td>
												<td>${fWTJ.mjcb}</td>
												<td>${fWTJ.mjjcb}</td>
											</tr>
										</jf:if>
									</tbody>
								</table>
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
	function jzbt(bts) {
		if (bts != "") {
			var strs = bts.split("!");
			for (var int = 0; int < strs.length - 1; int++) {
				$("#multiple-select1 option").each(
						function() {
							var txt = $(this).text();
							if (strs[int] == txt) {
								var val = $(this).val();
								var id = $(this).attr("id");
								$("#multiple-select2").append(
										"<option id='"+id+"' value=\""+val+"\">"
												+ txt + "</option>");
								$(this).remove();
							}
						});
			}
		}
	}
	function fzrgb(obj) {
		if (obj.value == "") {
			$("#FZFZR").attr("value", "");
		}
	}
	function yhgb(obj) {
		if (obj.value == "") {
			$("#DDJ02_JFID").attr("value", "");
		}
	}
	function TJ() {
		var bt = "";
		var sel = "";
		var group = "";
		var ids = "";
		$("#multiple-select2 option").each(function() {
			var txt = $(this).text();
			var val = $(this).val();
			var id = $(this).attr("id");
			bt += txt + "!";
			sel += val + " " + id + ",";
			group += val + ",";
			ids += id + ",";
		});
		group = group.substr(0, group.length - 1);
		bt = bt.substr(0, group.length - 1);
		ids = ids.substr(0, group.length - 1);
		$("#bt").attr("value", bt);
		$("#sel").attr("value", sel);
		$("#group").attr("value", group);
		$("#ids").attr("value", ids);
		document.getElementById("tjfrom").submit();
	}
	function seldbclick(xz) {
		if (xz == 1) {
			var selectText = $("#multiple-select1").find("option:selected")
					.text();
			var selectValue = $("#multiple-select1").val();
			var id = $("#multiple-select1 option:selected").attr("id");
			if (selectText != "") {
				$("#multiple-select2").append(
						"<option id='"+id+"' value=\""+selectValue+"\">"
								+ selectText + "</option>");
				var checkIndex = $("#multiple-select1").get(0).selectedIndex;
				var obj = document.getElementById("multiple-select1");
				obj.options.remove(checkIndex);
			}
		} else {
			var selectText = $("#multiple-select2").find("option:selected")
					.text();
			var selectValue = $("#multiple-select2").val();
			var id = $("#multiple-select2 option:selected").attr("id");
			if (selectText != "") {
				$("#multiple-select1").append(
						"<option id='"+id+"' value=\""+selectValue+"\">"
								+ selectText + "</option>");
				var checkIndex = $("#multiple-select2").get(0).selectedIndex;
				var obj = document.getElementById("multiple-select2");
				obj.options.remove(checkIndex);
			}
		}
	}
	function xzyh() {
		window.showModalDialog("/Myssm/order/user.do", 0,
				"dialogWidth=800px;dialogHeight=auto;height=auto");
		var strs = $("#Str").val().split(",");
		$("#Str").attr("value", "");
		$("#DDJ02_MC").attr("value", strs[1]);
		$("#DDJ02_JFID").attr("value", strs[0]);
		$("#Str").val("");
	}
	function fzfzr() {
		window.showModalDialog("/Myssm/order/fzfzr.do", 0,
				"dialogWidth=800px;dialogHeight=auto;height=auto");
		var strs = $("#Str").val().split(",");
		$("#Str").attr("value", "");
		$("#FZFZR_MC").attr("value", strs[1]);
		$("#FZFZR").attr("value", strs[0]);
		$("#Str").val("");
	}
	function xg(obj) {
		if (obj.value == "") {
			$("#xzqhbm").attr("value", "");
		}
	}
	function tree() {
		var returnValue = window.showModalDialog("/Myssm/tree_all.jsp", 0,
				"dialogWidth=500px;dialogHeight=600px");
		var strs = returnValue.split(",");
		$("#xzqh").attr("value", strs[1]);
		$("#xzqhbm").attr("value", strs[0]);

	};
	function xztz(obj, allsize, ml) {
		var ys = prompt("请输入页数:");
		if (isNaN(ys)) {
			alert("请输入数字");
			return false;
		}
		if (ys != null && ys != "") {
			obj.href = ml + "/searchnh/sel.do?page=" + ys + "&allSize="
					+ allsize;
		}
	}
	function tjgx(id) {
		$("#upuser" + id).submit();
	}
	function deluser(id) {
		if (confirm("你确定要删除吗？")) {
			$("#deluser" + id).submit();
		}
	}
	$(function() {
		$('#elofrom').bootstrapValidator({
			message : 'This value is not valid',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				YHM : {
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
		$("#801").addClass("opened");
		$("#802").css('display', 'block');
		jzbt('${jzbt}');
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
</html>