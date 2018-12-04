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
			request.setAttribute("fw01_d", request.getAttribute("fw01_d"));
			request.setAttribute("listdklx", request.getAttribute("listdklx"));
			request.setAttribute("listzw", request.getAttribute("listzw"));
			request.setAttribute("SFJE", request.getAttribute("SFJE"));
			request.setAttribute("DDJ02_JFID",
			request.getAttribute("DDJ02_JFID"));
			request.setAttribute("FWNRLB", request.getAttribute("FWNRLB"));
			request.setAttribute("listdfw01_d_zp",
			request.getAttribute("listdfw01_d_zp"));
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
							<input type="hidden" name="JFID" value="${fw01_d.JFID}">
							<input id="Str" type="hidden"> <input type="hidden"
								name="DFW01_JFID" value="${fw01_d.DFW01_JFID}"> <input
								type="hidden" name="FatherMonney" value="${SFJE}"> <input
								type="hidden" name="OldMonney" value="${fw01_d.SFJE}"> <input
								type="hidden" id="DDJ02_D_JFID" name="DDJ02_D_JFID"
								value="${fw01_d.DDJ02_D_JFID}"> <input type="hidden"
								id="DDJ02_D_MJ" name="DDJ02_D_MJ" value="${fw01_d.DDJ02_D_MJ}">
							<input type="hidden" id="DDJ11_JFID1" name="DDJ11_JFID1"
								value="${fw01_d.DDJ11_JFID1}"> <input type="hidden"
								id="DDJ11_JFID2" name="DDJ11_JFID2"
								value="${fw01_d.DDJ11_JFID2}"> <input type="hidden"
								id="DDJ11_JFID3" name="DDJ11_JFID3"
								value="${fw01_d.DDJ11_JFID3}"> <input type="hidden"
								id="DDJ11_JFID4" name="DDJ11_JFID4"
								value="${fw01_d.DDJ11_JFID4}"> <input type="hidden"
								id="DDJ11_FL1" name="DDJ11_FL1" value="${fw01_d.DDJ11_FL1}">
							<input type="hidden" id="DDJ11_FL2" name="DDJ11_FL2"
								value="${fw01_d.DDJ11_FL2}"> <input type="hidden"
								id="DDJ11_FL3" name="DDJ11_FL3" value="${fw01_d.DDJ11_FL3}">
							<input type="hidden" id="DDJ11_FL4" name="DDJ11_FL4"
								value="${fw01_d.DDJ11_FL4}"> <input type="hidden"
								id="DDJ11_DW1" name="DDJ11_DW1" value="${fw01_d.DDJ11_DW1}">
							<input type="hidden" id="DDJ11_DW2" name="DDJ11_DW2"
								value="${fw01_d.DDJ11_DW2}"> <input type="hidden"
								id="DDJ11_DW3" name="DDJ11_DW3" value="${fw01_d.DDJ11_DW3}">
							<input type="hidden" id="DDJ11_DW4" name="DDJ11_DW4"
								value="${fw01_d.DDJ11_DW4}"> <input type="hidden"
								id="DDJ11_DJ1" name="DDJ11_DJ1" value="${fw01_d.DDJ11_DJ1}">
							<input type="hidden" id="DDJ11_DJ2" name="DDJ11_DJ2"
								value="${fw01_d.DDJ11_DJ2}"> <input type="hidden"
								id="DDJ11_DJ3" name="DDJ11_DJ3" value="${fw01_d.DDJ11_DJ3}">
							<input type="hidden" id="DDJ11_DJ4" name="DDJ11_DJ4"
								value="${fw01_d.DDJ11_DJ4}"> <input type="hidden"
								id="DDJ11_BZGG1" name="DDJ11_BZGG1"
								value="${fw01_d.DDJ11_BZGG1}"> <input type="hidden"
								id="DDJ11_BZGG2" name="DDJ11_BZGG2"
								value="${fw01_d.DDJ11_BZGG2}"> <input type="hidden"
								id="DDJ11_BZGG3" name="DDJ11_BZGG3"
								value="${fw01_d.DDJ11_BZGG3}"> <input type="hidden"
								id="DDJ11_BZGG4" name="DDJ11_BZGG4"
								value="${fw01_d.DDJ11_BZGG4}">
							<div class="modal-body">
								<!-- 表单 -->
								<div class="row">
									<div class="col-md-12">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h2>
													<i class="fa fa-indent red"></i><strong>地块修改</strong>
												</h2>
											</div>
											<div class="panel-body">
												<div class="form-group">
													<label class="col-md-3 control-label">地块名称 <i
														style="color: red">*</i>
													</label>
													<div class="col-md-9">
														<input type="text" id="DDJ02_D_DH" name="DDJ02_D_DH"
															class="form-control" value="${fw01_d.DDJ02_D_DH}">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">地块类型 <i
														style="color: red">*</i>
													</label>
													<div class="col-md-9">
														<select id="DDJ02_D_DLX" name="DDJ02_D_DLX"
															class="form-control" size="1"
															onfocus="this.defaultIndex=this.selectedIndex;"
															onchange="this.selectedIndex=this.defaultIndex;">
															<option value="">请选择</option>
															<jf:forEach var="dklx" items="${listdklx}">
																<jf:if test="${fw01_d.DDJ02_D_DLX==dklx.BM}">
																	<option selected="selected" value="${dklx.BM}">${dklx.HZMC}</option>
																</jf:if>
																<jf:if test="${fw01_d.DDJ02_D_DLX!=dklx.BM}">
																	<option value="${dklx.BM}">${dklx.HZMC}</option>
																</jf:if>
															</jf:forEach>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">防治面积(亩)<i
														style="color: red">*</i>
													</label>
													<div class="col-md-9">
														<input type="text" id="FZMJ" name="FZMJ"
															class="form-control" placeholder="请输入防治面积" onblur="pd()"
															value="${fw01_d.FZMJ}">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">农作物 <i
														style="color: red">*</i>
													</label>
													<div class="col-md-9">
														<select id="ZW" name="ZW" class="form-control" size="1"
															onchange="zwxz()">
															<option value="">请选择</option>
															<jf:forEach var="zw" items="${listzw}">
																<jf:if test="${fw01_d.ZW==zw.BM}">
																	<option selected="selected" value="${zw.BM}">${zw.HZMC}</option>
																</jf:if>
																<jf:if test="${fw01_d.ZW!=zw.BM}">
																	<option value="${zw.BM}">${zw.HZMC}</option>
																</jf:if>
															</jf:forEach>
														</select>
													</div>
												</div>
												<jf:if test="${fw01_d.ZW==99}">
													<div class="form-group" id="zwmc">
														<label class="col-md-3 control-label">农作物名称 <i
															style="color: red">*</i>
														</label>
														<div class="col-md-9">
															<input type="text" id="ZW_MC" name="ZW_MC"
																class="form-control" placeholder="请输入作物名称"
																value="${fw01_d.ZW_MC}">
														</div>
													</div>
												</jf:if>
												<jf:if test="${fw01_d.ZW!=99}">
													<div class="form-group" id="zwmc" style="display: none;">
														<label class="col-md-3 control-label">农作物名称 <i
															style="color: red">*</i>
														</label>
														<div class="col-md-9">
															<input type="text" id="ZW_MC" name="ZW_MC"
																class="form-control" placeholder="请输入作物名称"
																value="${fw01_d.ZW_MC}">
														</div>
													</div>
												</jf:if>
												<div class="form-group">
													<label class="col-md-3 control-label">防治对象 </label>
													<div class="col-md-9">
														<input type="text" id="FZDX" name="FZDX"
															class="form-control" placeholder="请输入防治对象"
															value="${fw01_d.FZDX}">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">施药器械 </label>
													<div class="col-md-9">
														<select id="SYQX" name="SYQX" class="form-control"
															size="1">
															<option value="">请选择</option>
															<jf:forEach var="syqx" items="${listsyqx}">
																<jf:if test="${fw01_d.SYQX==syqx.BM}">
																	<option selected="selected" value="${syqx.BM}">${syqx.HZMC}</option>
																</jf:if>
																<jf:if test="${fw01_d.SYQX!=syqx.BM}">
																	<option value="${syqx.BM}">${syqx.HZMC}</option>
																</jf:if>
															</jf:forEach>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">收费金额(元) </label>
													<div class="col-md-9">
														<input type="text" id="SFJE" name="SFJE"
															class="form-control" placeholder="请输入收费金额(元)"
															value="${fw01_d.SFJE}">
													</div>
												</div>
												<jf:if test="${FWNRLB==01}">
													<div class="form-group">
														<label class="col-md-3 control-label">是否防治 </label>
														<div class="col-md-9">
															<jf:if test="${empty fw01_d.SF_FZ}">
																<label class="radio-inline"> <input type="radio"
																	id="inline-radio1" name="SF_FZ" value="1"
																	checked="checked" onclick="pdxz()"> 是
																</label>
																<label class="radio-inline"> <input type="radio"
																	id="inline-radio2" name="SF_FZ" value="0"
																	onclick="pdxz()"> 否
																</label>
															</jf:if>
															<jf:if test="${fw01_d.SF_FZ==1}">
																<label class="radio-inline"> <input type="radio"
																	id="inline-radio1" name="SF_FZ" value="1"
																	checked="checked" onclick="pdxz()"> 是
																</label>
																<label class="radio-inline"> <input type="radio"
																	id="inline-radio2" name="SF_FZ" value="0"
																	onclick="pdxz()"> 否
																</label>
															</jf:if>
															<jf:if test="${fw01_d.SF_FZ==0}">
																<label class="radio-inline"> <input type="radio"
																	id="inline-radio1" name="SF_FZ" value="1"
																	onclick="pdxz()"> 是
																</label>
																<label class="radio-inline"> <input type="radio"
																	id="inline-radio2" name="SF_FZ" checked="checked"
																	value="0" onclick="pdxz()"> 否
																</label>
															</jf:if>
														</div>
													</div>
													<div class="form-group">
														<label class="col-md-3 control-label">是否巡棚(地) </label>
														<div class="col-md-9">
															<jf:if test="${empty fw01_d.SF_XP}">
																<label class="radio-inline"> <input type="radio"
																	id="inline-radio1" name="SF_XP" value="1"
																	onclick="pdxz()"> 是
																</label>
																<label class="radio-inline"> <input type="radio"
																	id="inline-radio2" name="SF_XP" checked="checked"
																	value="0" onclick="pdxz()"> 否
																</label>
															</jf:if>
															<jf:if test="${fw01_d.SF_XP==1}">
																<label class="radio-inline"> <input type="radio"
																	id="inline-radio1" name="SF_XP" value="1"
																	checked="checked" onclick="pdxz()"> 是
																</label>
																<label class="radio-inline"> <input type="radio"
																	id="inline-radio2" name="SF_XP" value="0"
																	onclick="pdxz()"> 否
																</label>
															</jf:if>
															<jf:if test="${fw01_d.SF_XP==0}">
																<label class="radio-inline"> <input type="radio"
																	id="inline-radio1" name="SF_XP" value="1"
																	onclick="pdxz()"> 是
																</label>
																<label class="radio-inline"> <input type="radio"
																	id="inline-radio2" name="SF_XP" value="0"
																	checked="checked" onclick="pdxz()"> 否
																</label>
															</jf:if>
														</div>
													</div>
												</jf:if>
												<div id="cs">
													<div class="form-group">
														<label class="col-md-3 control-label">农药措施1 </label>
														<div class="col-md-6">
															<input type="text" id="DDJ11_MC1" name="DDJ11_MC1"
																class="form-control" value="${fw01_d.DDJ11_MC1}"
																onchange="sccs(this,1)">
														</div>
														<div class="col-md-2">
															<a href="javascript:void(0);"
																class="btn btn-sm btn-info " onclick="nycs12(1)"> <i
																class="fa fa-search "></i> 农药措施1
															</a> <a class="btn btn-danger" href="javascript:void(0);"
																onclick="del('1')"> <i class="fa fa-trash-o "></i>
															</a>
														</div>
													</div>
													<div class="form-group">
														<label class="col-md-3 control-label">使用量</label>
														<div class="col-md-6">
															<jf:if test="${fw01_d.SYL1!=0.0}">
																<input type="text" id="SYL1" name="SYL1"
																	class="form-control" value="${fw01_d.SYL1}">
															</jf:if>
															<jf:if test="${fw01_d.SYL1==0.0}">
																<input type="text" id="SYL1" name="SYL1"
																	class="form-control" value="">
															</jf:if>
														</div>
														<label id="NY1" class="col-md-1 control-label">
															${fw01_d.DDJ11_DW1MC} </label>
													</div>
													<div class="form-group">
														<label class="col-md-3 control-label">农药措施2 </label>
														<div class="col-md-6">
															<input type="text" id="DDJ11_MC2" name="DDJ11_MC2"
																class="form-control" value="${fw01_d.DDJ11_MC2}"
																onchange="sccs(this,2)">
														</div>
														<div class="col-md-2">
															<a href="javascript:void(0);"
																class="btn btn-sm btn-info " onclick="nycs12(2)"> <i
																class="fa fa-search "></i> 农药措施2
															</a> <a class="btn btn-danger" href="javascript:void(0);"
																onclick="del('2')"> <i class="fa fa-trash-o "></i>
															</a>
														</div>
													</div>
													<div class="form-group">
														<label class="col-md-3 control-label">使用量</label>
														<div class="col-md-6">
															<jf:if test="${fw01_d.SYL2!=0.0}">
																<input type="text" id="SYL2" name="SYL2"
																	class="form-control" value="${fw01_d.SYL2}">
															</jf:if>
															<jf:if test="${fw01_d.SYL2==0.0}">
																<input type="text" id="SYL2" name="SYL2"
																	class="form-control" value="">
															</jf:if>
														</div>
														<label id="NY2" class="col-md-1 control-label">
															${fw01_d.DDJ11_DW2MC} </label>
													</div>
													<div class="form-group">
														<label class="col-md-3 control-label">其他措施1 </label>
														<div class="col-md-6">
															<input type="text" id="DDJ11_MC3" name="DDJ11_MC3"
																class="form-control" value="${fw01_d.DDJ11_MC3}"
																onchange="sccs(this,3)">
														</div>
														<div class="col-md-2">
															<a href="javascript:void(0);"
																class="btn btn-sm btn-info " onclick="qtcs(3)"> <i
																class="fa fa-search "></i> 其他措施1
															</a> <a class="btn btn-danger" href="javascript:void(0);"
																onclick="del('3')"> <i class="fa fa-trash-o "></i>
															</a>
														</div>
													</div>
													<div class="form-group">
														<label class="col-md-3 control-label">使用量</label>
														<div class="col-md-6">
															<jf:if test="${fw01_d.SYL3!=0.0}">
																<input type="text" id="SYL3" name="SYL3"
																	class="form-control" value="${fw01_d.SYL3}">
															</jf:if>
															<jf:if test="${fw01_d.SYL3==0.0}">
																<input type="text" id="SYL3" name="SYL3"
																	class="form-control" value="">
															</jf:if>
														</div>
														<label id="NY3" class="col-md-1 control-label">
															${fw01_d.DDJ11_DW3MC} </label>
													</div>
													<div class="form-group">
														<label class="col-md-3 control-label">其他措施2 </label>
														<div class="col-md-6">
															<input type="text" id="DDJ11_MC4" name="DDJ11_MC4"
																class="form-control" value="${fw01_d.DDJ11_MC4}"
																onchange="sccs(this,4)">
														</div>
														<div class="col-md-2">
															<a href="javascript:void(0);"
																class="btn btn-sm btn-info " onclick="qtcs(4)"> <i
																class="fa fa-search "></i> 其他措施2
															</a> <a class="btn btn-danger" href="javascript:void(0);"
																onclick="del('4')"> <i class="fa fa-trash-o "></i>
															</a>
														</div>
													</div>
													<div class="form-group">
														<label class="col-md-3 control-label">使用量</label>
														<div class="col-md-6">
															<jf:if test="${fw01_d.SYL4!=0.0}">
																<input type="text" id="SYL4" name="SYL4"
																	class="form-control" value="${fw01_d.SYL4}">
															</jf:if>
															<jf:if test="${fw01_d.SYL4==0.0}">
																<input type="text" id="SYL4" name="SYL4"
																	class="form-control" value="">
															</jf:if>
														</div>
														<label id="NY4" class="col-md-1 control-label">
															${fw01_d.DDJ11_DW4MC} </label>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">工作时间</label>
													<div class="col-md-3" style="width: 200px;">
														<input type="text" class="form-control"
															value="<fmt:formatDate value="${fw01_d.KSSJ}" pattern="yyyy-MM-dd HH:mm:ss"/>"
															readonly="readonly">
													</div>
													<label class="col-md-1" style="width: 50px;">至</label>
													<div class="col-md-3" style="width: 200px;">
														<input type="text" class="form-control"
															value="<fmt:formatDate value="${fw01_d.JSSJ}" pattern="yyyy-MM-dd HH:mm:ss"/>"
															readonly="readonly">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">说明及嘱托</label>
													<div class="col-md-9">
														<textarea name="SMZT" rows="3" class="form-control"
															placeholder="说点什么。。。">${fw01_d.SMZT}</textarea>
													</div>
												</div>
												<div class="form-group">
													<jf:forEach var="dfw01_d_zp" items="${listdfw01_d_zp}">
														<div style="margin-bottom:10px" class="col-md-3">
															<div class="thumbnail">
																<a href="${path}${dfw01_d_zp.SL_LJ}" target="_blank"><img
																	class="img-thumbnail" src="${path}${dfw01_d_zp.SL_LJ}"
																	alt="Sample Image"></a>
																<div class="caption">
																	<jf:if test="${dfw01_d_zp.LB==0}">
																		<h3>防治措施</h3>
																	</jf:if>
																	<jf:if test="${dfw01_d_zp.LB==1}">
																		<h3>现场作业</h3>
																	</jf:if>
																	<jf:if test="${dfw01_d_zp.LB==2}">
																		<h3>防治对象</h3>
																	</jf:if>
																	<jf:if test="${dfw01_d_zp.LB==3}">
																		<h3>特殊情况</h3>
																	</jf:if>
																	<p>
																		<jf:if test="${fn:length(listdfw01_d_zp)>1}">
																			<a class="btn btn-sm btn-danger"
																				href="javascript:void(0);"
																				onclick="sczp(this,'${path}','${dfw01_d_zp.JFID}','${fw01_d.JFID}','${SFJE}','${DDJ02_JFID}','${FWNRLB}')">
																				<i class="fa fa-trash-o "></i> 删除
																			</a>
																		</jf:if>
																	</p>
																</div>
															</div>
														</div>
													</jf:forEach>
												</div>
												<div class="modal-footer">
													<jf:if test="${fn:length(listdfw01_d_zp)>=1}">
														<a href="javascript:void(0);"
															class="btn btn-sm btn-success"
															onclick="bdtj('${path}ordergd/dkgc.do')"> <i
															class="fa fa-dot-circle-o"></i> 完工确认
														</a>
													</jf:if>
													<button type="button" class="btn btn-sm btn-primary"
														onclick="tjdk()">
														<i class="fa fa-check-square"></i> 保存
													</button>
													<a
														href="${path}searchnh/gotodfzcx.do?DDJ02_D_JFID=${fw01_d.DDJ02_D_JFID}"
														class="btn btn-sm btn-primary" type="button"> <i
														class="fa fa-search "></i> 防治查询
													</a> <a class="btn btn-sm btn-danger"
														href="javascript:void(0);"
														onclick="sfzf(this,'${path}','${fw01_d.JFID}')"> <i
														class="fa fa-trash-o "></i> 作废
													</a> <a href="${path}ordergd/gotoup.do?id=${fw01_d.DFW01_JFID}"
														class="btn btn-sm btn-danger" data-dismiss="modal"> <i
														class="fa fa-ban"></i> 返回
													</a>
												</div>
												<br>
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
	function sccs(obj, id) {
		if (obj.value == "") {
			$("#Str").val("");
			$("#DDJ11_JFID" + id).val("");
			$("#DDJ11_MC" + id).val("");
			$("#DDJ11_FL" + id).val("");
			$("#DDJ11_DW" + id).val("");
			$("#DDJ11_DJ" + id).val("");
			$("#SYL" + id).val("");
			$("#NY" + id).html("");
			$("#DDJ11_BZGG" + id).val("");
		}
	}
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
		$("#Str").val("");
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
		} else {
			if (isNaN($("#FZMJ").val())) {
				alert("防治面积请输入数字");
				return false;
			}
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
					alert("农药1请输入数字");
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
					alert("农药2请输入数字");
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
					alert("其他措施1请输入数字");
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
					alert("其他措施2请输入数字");
					return false;
				}
			}
		}
		if (isNaN($("#SFJE").val())) {
			alert("收费金额请输入数字");
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
		var strs = $("#Str").val().split(",");
		$("#DDJ11_JFID" + id).attr("value", strs[0]);
		$("#DDJ11_MC" + id).attr("value", strs[1]);
		$("#DDJ11_FL" + id).attr("value", strs[2]);
		$("#DDJ11_DW" + id).attr("value", strs[3]);
		$("#DDJ11_DJ" + id).attr("value", strs[4]);
		$("#DDJ11_BZGG" + id).attr("value", strs[5]);
		$("#NY" + id).html(strs[6]);
		$("#Str").val("");
	}
	function nycs12(id) {
		window.showModalDialog("/Myssm/ordergd/selfzcs.do", 0,
				"dialogWidth=800px;dialogHeight=auto;height=auto");
		var strs = $("#Str").val().split(",");
		$("#DDJ11_JFID" + id).attr("value", strs[0]);
		$("#DDJ11_MC" + id).attr("value", strs[1]);
		$("#DDJ11_FL" + id).attr("value", strs[2]);
		$("#DDJ11_DW" + id).attr("value", strs[3]);
		$("#DDJ11_DJ" + id).attr("value", strs[4]);
		$("#DDJ11_BZGG" + id).attr("value", strs[5]);
		$("#NY" + id).html(strs[6]);
		$("#Str").val("");
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