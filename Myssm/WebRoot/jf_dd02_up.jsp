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
							<li><i class="fa fa-home"></i><a href="${path}go/index.do">��ҳ</a></li>
							<li><i class="fa fa-male"></i>�ͻ��޸�</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>�ͻ��޸�</strong>
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
										<label class="col-md-3 control-label">�û��� <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="YHM"
												class="form-control" readonly="readonly"
												value="${dDJ02.YHM}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">���� <i
											style="color: red">*</i>
										</label>
										<div class=" col-md-9">
											<input type="text" id="text-input" name="MC"
												class="form-control" placeholder="���ٴ���������"
												value="${dDJ02.MC}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�������� <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="xzqh" name="XZQHMC"
												class="form-control" placeholder="��ѡ����������" onclick="tree()"
												value="${dDJ02.XZQHMC}" onfocus="this.blur()">�����ѡ��
											<input type="hidden" id="xzqhbm" name="XZQH"
												class="form-control" value="${dDJ02.XZQH}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">��ַ <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="DZ"
												class="form-control" placeholder="�������ַ" value="${dDJ02.DZ}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�ֻ� <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="YDDH"
												class="form-control" value="${dDJ02.YDDH}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">��Ա��� <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<jf:if test="${dDJ02.YHLB==1}">
												<label class="radio-inline"> <input type="radio"
													id="inline-radio1" name="YHLB" value="1" checked="checked"
													onclick="choce(this)"> ����
												</label>
												<label class="radio-inline"> <input type="radio"
													id="inline-radio2" name="YHLB" value="0"
													onclick="choce(this)"> ��λ
												</label>
											</jf:if>
											<jf:if test="${dDJ02.YHLB==0}">
												<label class="radio-inline"> <input type="radio"
													id="inline-radio1" name="YHLB" value="1"
													onclick="choce(this)"> ����
												</label>
												<label class="radio-inline"> <input type="radio"
													id="inline-radio2" name="YHLB" value="0" checked="checked"
													onclick="choce(this)"> ��λ
												</label>
											</jf:if>
										</div>
									</div>
									<jf:if test="${dDJ02.YHLB==1}">
										<div id="bl">
											<div class="form-group">
												<label class="col-md-3 control-label">�Ա� <i
													style="color: red">*</i>
												</label>
												<jf:if test="${dDJ02.XB==1}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XB" value="1" checked="checked">
															��
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XB" value="0"> Ů
														</label>
													</div>
												</jf:if>
												<jf:if test="${dDJ02.XB==0}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XB" value="1"> ��
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XB" value="0" checked="checked">
															Ů
														</label>
													</div>
												</jf:if>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">���� <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input id="datetimepicker" type="text" name="SR"
														class="form-control" placeholder="���������գ�yyyy-mm-dd��"
														data-date-format="yyyy-mm-dd"
														value="<fmt:formatDate value="${dDJ02.SR}" pattern="yyyy-MM-dd"/>"
														onchange="xgsr()">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">ѧ�� <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<select id="selectxl" name="XL" class="form-control"
														size="1">
														<option value="">��ѡ��</option>
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
												<label class="col-md-3 control-label">��ͥ�˿� <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JTRK"
														class="form-control" placeholder="�������ͥ�˿�"
														value="${dDJ02.JTRK}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">�˾�������(Ԫ) <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="RJSR"
														class="form-control" placeholder="�������˾�������"
														value="${dDJ02.RJSR}">
												</div>
											</div>
										</div>
										<div id="bbl" style="display: none;">
											<div class="form-group">
												<label class="col-md-3 control-label">�Ա� </label>
												<jf:if test="${dDJ02.XB==1}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XBN" value="1" checked="checked">
															��
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XBN" value="0"> Ů
														</label>
													</div>
												</jf:if>
												<jf:if test="${dDJ02.XB==0}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XBN" value="1"> ��
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XBN" value="0" checked="checked">
															Ů
														</label>
													</div>
												</jf:if>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">���� </label>
												<div class="col-md-9">
													<input id="datetimepickertwo" type="text" name="SRN"
														class="form-control" placeholder="���������գ�yyyy-mm-dd��"
														data-date-format="yyyy-mm-dd"
														value="<fmt:formatDate value="${dDJ02.SR}" pattern="yyyy-MM-dd"/>">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">ѧ�� </label>
												<div class="col-md-9">
													<select id="selectxl" name="XLN" class="form-control"
														size="1">
														<option value="">��ѡ��</option>
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
												<label class="col-md-3 control-label">��ͥ�˿� </label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JTRKN"
														class="form-control" placeholder="�������ͥ�˿�"
														value="${dDJ02.JTRK}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">�˾�������(Ԫ) </label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="RJSRN"
														class="form-control" placeholder="�������˾�������"
														value="${dDJ02.RJSR}">
												</div>
											</div>
										</div>
									</jf:if>
									<jf:if test="${dDJ02.YHLB==0}">
										<div id="bbl">
											<div class="form-group">
												<label class="col-md-3 control-label">�Ա� </label>
												<jf:if test="${dDJ02.XB==1}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XBN" value="1" checked="checked">
															��
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XBN" value="0"> Ů
														</label>
													</div>
												</jf:if>
												<jf:if test="${dDJ02.XB==0}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XBN" value="1"> ��
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XBN" value="0" checked="checked">
															Ů
														</label>
													</div>
												</jf:if>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">���� </label>
												<div class="col-md-9">
													<input id="datetimepickertwo" type="text" name="SRN"
														class="form-control" placeholder="���������գ�yyyy-mm-dd��"
														data-date-format="yyyy-mm-dd"
														value="<fmt:formatDate value="${dDJ02.SR}" pattern="yyyy-MM-dd"/>">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">ѧ�� </label>
												<div class="col-md-9">
													<select id="selectxl" name="XLN" class="form-control"
														size="1">
														<option value="">��ѡ��</option>
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
												<label class="col-md-3 control-label">��ͥ�˿� </label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JTRKN"
														class="form-control" placeholder="�������ͥ�˿�"
														value="${dDJ02.JTRK}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">�˾�������(Ԫ) </label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="RJSRN"
														class="form-control" placeholder="�������˾�������"
														value="${dDJ02.RJSR}">
												</div>
											</div>
										</div>
										<div id="bl" style="display: none;">
											<div class="form-group">
												<label class="col-md-3 control-label">�Ա� <i
													style="color: red">*</i>
												</label>
												<jf:if test="${dDJ02.XB==1}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XB" value="1" checked="checked">
															��
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XB" value="0"> Ů
														</label>
													</div>
												</jf:if>
												<jf:if test="${dDJ02.XB==0}">
													<div class="col-md-9">
														<label class="radio-inline"> <input type="radio"
															id="inline-radio1" name="XB" value="1"> ��
														</label> <label class="radio-inline"> <input type="radio"
															id="inline-radio2" name="XB" value="0" checked="checked">
															Ů
														</label>
													</div>
												</jf:if>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">���� <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input id="datetimepicker" type="text" name="SR"
														class="form-control" placeholder="���������գ�yyyy-mm-dd��"
														data-date-format="yyyy-mm-dd"
														value="<fmt:formatDate value="${dDJ02.SR}" pattern="yyyy-MM-dd"/>"
														onchange="xgsr()">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">ѧ�� <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<select id="selectxl" name="XL" class="form-control"
														size="1">
														<option value="">��ѡ��</option>
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
												<label class="col-md-3 control-label">��ͥ�˿� <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JTRK"
														class="form-control" placeholder="�������ͥ�˿�"
														value="${dDJ02.JTRK}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">�˾�������(Ԫ) <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="RJSR"
														class="form-control" placeholder="�������˾�������"
														value="${dDJ02.RJSR}">
												</div>
											</div>
										</div>
									</jf:if>
									<div class="form-group">
										<label class="col-md-3 control-label">���� </label>
										<div class="col-md-9">
											<input type="email" id="text-input" name="YX"
												class="form-control" placeholder="����������" value="${dDJ02.YX}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�������(Ķ) </label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="SCMJ"
												class="form-control" placeholder="�����������"
												value="${dDJ02.SCMJ}">
										</div>
									</div>
									<!-- 
									<div class="form-group">
										<label class="col-md-3 control-label">�������� </label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="FWNR"
												class="form-control" placeholder="�����������"
												value="${dDJ02_DDJ01.FWNR}">
										</div>
									</div>
									 -->
									<div class="form-group">
										<label class="col-md-3 control-label">��ע</label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="BZ" rows="3"
												class="form-control" placeholder="˵��ʲô������">${dDJ02.BZ}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�Ǽ���Ա</label>
										<div class="col-md-9">
											<input type="text" id="text-input" class="form-control"
												value="${dDJ02.LRRY_MC}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�Ǽ�����</label>
										<div class="col-md-9">
											<input type="text" id="text-input" class="form-control"
												value="<fmt:formatDate value="${dDJ02.LRRQ}" pattern="yyyy-MM-dd HH:mm:ss"/>"
												readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-12 control-label" style="text-align: center;">�ؿ���Ϣ</label>
									</div>
									<!-- �ؿ���Ϣ -->
									<div class="form-group">
										<label class="col-md-2 control-label" style="text-align: center;">�ؿ�����</label>
										<label class="col-md-2 control-label" style="text-align: center;">�ؿ�����</label>
										<label class="col-md-1 control-label" style="text-align: center;">���</label>
										<label class="col-md-2 control-label" style="text-align: center;">����</label>
										<label class="col-md-2 control-label" style="text-align: center;">����</label>
										<label class="col-md-2 control-label" style="text-align: center;">γ��</label>
										<label class="col-md-1 control-label">����</label>
									</div>
									<!-- ��ӵؿ���Ϣ -->
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
												<jf:if test="${ddj02_d.NZW ne '����'}">
													<input type="text" id="text-input" class="form-control"
														value="${ddj02_d.NZW}" readonly="readonly">
												</jf:if>
												<jf:if test="${ddj02_d.NZW eq '����'}">
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
										class="fa fa-edit "></i> ���ӵؿ�
									</a> <a class="btn btn-primary " href="#"
										onclick="xgmm('${dDJ02.JFID}')"> <i class="fa fa-edit "></i>
										�޸�����
									</a> <a class="btn btn-primary "
										href="${path}order/gotoadd.do?DDJ02_JFID=${dDJ02.JFID}&DDJ02_MC=${dDJ02.MC}&DDJ02_DZ=${dDJ02.DZ}&DDJ02_YDDH=${dDJ02.YDDH}">
										<i class="fa fa-file-text"></i> �ɵ�
									</a>
									<button type="submit" class="btn btn-primary">
										<i class="fa fa-check-square"></i> ����
									</button>
									<a class="btn btn-danger" data-dismiss="modal"
										href="${path}yhgl/sel.do"> <i class="fa fa-ban"></i> ����
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
					�����ʷ�������Ϣ�������޹�˾</label>
			</div>
		</div>
		<!--/container-->

		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">�ؿ����</h4>
					</div>
					<form id="mydk" action="${path}/yhgl/adddk.do" method="post"
						class="form-horizontal">
						<input type="hidden" name="DDJ02_JFID" value="${dDJ02.JFID}">
						<div class="modal-body">
							<!-- �� -->
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h2>
												<i class="fa fa-indent red"></i><strong>ѡ��ؿ�</strong>
											</h2>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="col-md-3 control-label">�ؿ����� <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="DH"
														class="form-control" placeholder="������ģ������">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">�ؿ����� <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<select id="select" name="DLX" class="form-control"
														size="1">
														<option value="">��ѡ��</option>
														<jf:forEach var="dklx" items="${listdklx}">
															<option value="${dklx.BM}">${dklx.HZMC}</option>
														</jf:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">�����Ķ�� <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="MJ"
														class="form-control" placeholder="���������">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">ũ���� <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<select id="selectnzw" name="NZW" class="form-control"
														size="1" onchange="zwxz()">
														<option value="">��ѡ��</option>
														<jf:forEach var="zw" items="${listzw}">
															<option value="${zw.BM}">${zw.HZMC}</option>
														</jf:forEach>
													</select>
												</div>
											</div>
											<div class="form-group" id="zwmc" style="display: none;">
												<label class="col-md-3 control-label">ũ�������� <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="NZW_MC"
														class="form-control" placeholder="��������������">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">���� </label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JD"
														class="form-control" placeholder="�����뾭��">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">γ�� </label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="WD"
														class="form-control" placeholder="������γ��">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">��ע</label>
												<div class="col-md-9">
													<textarea name="BZ" rows="3" class="form-control"
														placeholder="˵��ʲô������"></textarea>
												</div>
											</div>
											<br>
										</div>
									</div>
								</div>
								<!--������-->
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-sm btn-success">
								<i class="fa fa-dot-circle-o"></i> ȷ��
							</button>
							<button type="reset" class="btn btn-sm btn-danger"
								data-dismiss="modal">
								<i class="fa fa-ban"></i> �ر�
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
						<h4 class="modal-title">�޸�����</h4>
					</div>
					<form id="elofrom" action="${path}/yhgl/upmm.do" method="post"
						class="form-horizontal">
						<input id="JFIDMM" type="hidden" name="JFID" value="">
						<div class="modal-body">
							<!-- �� -->
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h2>
												<i class="fa fa-indent red"></i><strong>�޸�����</strong>
											</h2>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="col-md-3 control-label">���� <i
													style="color: red">*</i>
												</label>
												<div class=" col-md-9">
													<input type="password" id="password-input"
														name="JFPASSWORD" class="form-control" placeholder="����������">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">ȷ������ <i
													style="color: red">*</i>
												</label>
												<div class=" col-md-9">
													<input type="password" id="password-input"
														name="confirmPassword" class="form-control"
														placeholder="����������">
												</div>
											</div>
											<br>
										</div>
									</div>
								</div>
								<!--������-->
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-sm btn-success">
								<i class="fa fa-dot-circle-o"></i> �ύ
							</button>
							<button type="reset" class="btn btn-sm btn-danger"
								data-dismiss="modal">
								<i class="fa fa-ban"></i> �ر�
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
		if (confirm("��ȷ��Ҫɾ����")) {
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
					alert("�Բ���ֻ��ѡ��ĩ��");
				}
			}
		} else {
			alert("�Բ���ֻ��ѡ��ĩ��");
		}
	};

	function xztz(obj, allsize, ml) {
		var ys = prompt("������ҳ��:");
		if (isNaN(ys)) {
			alert("����������");
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
							message : '���벻��Ϊ��'
						},
						regexp : {
							regexp : /^[a-zA-Z0-9_\.]+$/,
							message : 'ֻ������������ĸ�»���'
						}
					}
				},
				confirmPassword : {
					validators : {
						notEmpty : {
							message : '���벻��Ϊ��'
						},
						identical : {
							field : 'JFPASSWORD',
							message : '�����벻һ��'
						}
					}
				},
				MC : {
					validators : {
						notEmpty : {
							message : '���Ʋ���Ϊ��'
						}
					}
				},
				XZQHMC : {
					validators : {
						notEmpty : {
							message : '������������Ϊ��'
						}
					}
				},
				DZ : {
					validators : {
						notEmpty : {
							message : '��ַ����Ϊ��'
						}
					}
				},
				SR : {
					trigger : 'blur',
					validators : {
						notEmpty : {
							message : '���ղ���Ϊ�գ�yyyy-mm-dd��'
						},
						date : {
							format : 'YYYY-MM-DD',
							message : '���ڸ�ʽ����ȷ��yyyy-mm-dd��'
						}
					}
				},
				XL : {
					validators : {
						notEmpty : {
							message : '��ѡ��ѧ��'
						}
					}
				},
				JTRK : {
					validators : {
						notEmpty : {
							message : '�������ͥ�˿�'
						},
						regexp : {
							regexp : /^[0-9\.]+$/,
							message : 'ֻ����������'
						}
					}
				},
				RJSR : {
					validators : {
						notEmpty : {
							message : '������벻��Ϊ��'
						},
						regexp : {
							regexp : /^[0-9\.]+$/,
							message : 'ֻ����������'
						}
					}
				},
				YX : {
					validators : {
						emailAddress : {
							message : '�����ʽ����ȷ'
						}
					}
				},
				YDDH : {
					validators : {
						notEmpty : {
							message : '�������ֻ���'
						},
						stringLength : {
							min : 11,
							max : 11,
							message : '������11λ�ֻ�����'
						},
						regexp : {
							regexp : /^1[3|5|8]{1}[0-9]{9}$/,
							message : '��������ȷ���ֻ�����'
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
							message : '�ؿ����Ʋ���Ϊ��'
						}
					}
				},
				DLX : {
					validators : {
						notEmpty : {
							message : '��ѡ��ؿ�����'
						}
					}
				},
				NZW : {
					validators : {
						notEmpty : {
							message : '��ѡ��ũ����'
						}
					}
				},
				NZW_MC : {
					validators : {
						notEmpty : {
							message : '��������������'
						}
					}
				},
				MJ : {
					validators : {
						notEmpty : {
							message : '�������Ϊ��'
						},
						regexp : {
							regexp : /^[0-9\.]+$/,
							message : 'ֻ����������'
						}
					}
				},
				JD : {
					validators : {
						stringLength : {
							min : 1,
							max : 9,
							message : '���ܵ���һλ���Ȳ��ܳ�����λ'
						},
						regexp : {
							regexp : /^[0-9\.]+$/,
							message : '��ʽ����ֻ����������С����'
						}
					}
				},
				WD : {
					validators : {
						stringLength : {
							min : 1,
							max : 9,
							message : '���ܵ���һλ���Ȳ��ܳ�����λ'
						},
						regexp : {
							regexp : /^[0-9\.]+$/,
							message : '��ʽ����ֻ����������С����'
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
							message : '���벻��Ϊ��'
						}
					}
				},
				confirmPassword : {
					validators : {
						notEmpty : {
							message : '���벻��Ϊ��'
						},
						identical : {
							field : 'JFPASSWORD',
							message : '�����벻һ��'
						}
					}
				}
			}
		});
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
		format: 'yyyy-mm-dd',
		todayBtn : true,
		forceParse : false
	});
	$('#datetimepickertwo').datetimepicker({
		minView : "month",//����ֻ��ʾ���·�
		autoclose : true,
		language : 'zh-CN',
		todayBtn : true,
	});
</script>
</html>