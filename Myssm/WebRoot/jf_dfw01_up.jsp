<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jf"%>
<%@ page import="com.ssh.user.util.EHCache"%>
<%@ page import="com.ssh.user.model.Dsys11"%>
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
<body>
	<%
		EHCache eHCache = new EHCache("ehcacheMenu");
		   List<Dsys11> listsyqx = (List<Dsys11>) eHCache
		.getCacheElement("listsyqx");
		    request.setAttribute("listsyqx", listsyqx);
			request.setAttribute("dFW01", request.getAttribute("dFW01"));
			request.setAttribute("retrunval", request.getAttribute("retrunval"));
			request.setAttribute("listFWNRLB",
			request.getAttribute("listFWNRLB"));
			request.setAttribute("listddj03", request.getAttribute("listddj03"));
			request.setAttribute("listdfw01_d",
			request.getAttribute("listdfw01_d"));
			request.setAttribute("fw01_d", request.getAttribute("fw01_d"));
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
							<li><i class="fa fa-cogs"></i>�ɵ��������</li>
							<li><i class="fa fa-flask"></i>�ɵ��޸�</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>�ɵ��޸�</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div id="body" class="panel-body">
								<!-- �� -->
								<form id="myfrom" action="${path}/order/upinfo.do" method="post"
									class="form-horizontal">
									<input id="ZT" name="ZT" type="hidden"> <input id="Str"
										type="hidden"> <input id="DDJ02_JFID"
										name="DDJ02_JFID" type="hidden" value="${dFW01.DDJ02_JFID}">
									<input name="OLDDDJ02_JFID" type="hidden"
										value="${dFW01.DDJ02_JFID}"> <input id="FZFZR"
										name="FZFZR" type="hidden" value="${dFW01.FZFZR}"> <input
										id="FZRY" name="FZRY" type="hidden" value="${dFW01.FZRY}">
									<input id="FZRY_MC" name="FZRY_MC" type="hidden"
										value="${dFW01.FZRY_MC}">
									<div class="form-group">
										<label class="col-md-3 control-label">���� <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="JFID" name="JFID" class="form-control"
												readonly="readonly" value="${dFW01.JFID}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�������� <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<select id="selectFWNRLB" name="FWNRLB" class="form-control"
												size="1">
												<option value="">��ѡ��</option>
												<jf:forEach var="FWNRLB" items="${listFWNRLB}">
													<jf:if test="${dFW01.FWNRLB==FWNRLB.BM}">
														<option selected="selected" value="${FWNRLB.BM}">${FWNRLB.HZMC}</option>
													</jf:if>
													<jf:if test="${dFW01.FWNRLB!=FWNRLB.BM}">
														<option value="${FWNRLB.BM}">${FWNRLB.HZMC}</option>
													</jf:if>
												</jf:forEach>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">��Ŀ </label>
										<div class="col-md-9">
											<select id="selectDDJ03_JFID" name="DDJ03_JFID"
												class="form-control" size="1">
												<option value="">��ѡ��</option>
												<jf:forEach var="ddj03" items="${listddj03}">
													<jf:if test="${dFW01.DDJ03_JFID==ddj03.JFID}">
														<option selected="selected" value="${ddj03.JFID}">${ddj03.XMMC}</option>
													</jf:if>
													<jf:if test="${dFW01.DDJ03_JFID!=ddj03.JFID}">
														<option value="${ddj03.JFID}">${ddj03.XMMC}</option>
													</jf:if>
												</jf:forEach>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�ͻ����� <i
											style="color: red">*</i>
										</label>
										<div class="col-md-7">
											<input type="text" id="DDJ02_MC" name="DDJ02_MC"
												class="form-control" readonly="readonly"
												value="${dFW01.DDJ02_MC}">
										</div>
										<div class="col-md-2">
											<a href="javascript:void(0);" class="btn btn-info "
												onclick="xzyh()"> <i class="fa fa-search "></i> ѡ��ͻ�
											</a>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">��ַ <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="DDJ02_DZ" name="DDJ02_DZ"
												class="form-control" readonly="readonly"
												value="${dFW01.DDJ02_DZ}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�ֻ� <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="DDJ02_YDDH" name="DDJ02_YDDH"
												class="form-control" readonly="readonly"
												value="${dFW01.DDJ02_YDDH}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�ƻ���ҵʱ�� <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input id="datetimepicker" type="text" id="text-input"
												name="JHSJ" class="form-control"
												placeholder="������ƻ�����ʱ�䣨yyyy-mm-dd HH:mm��"
												value="${dFW01.JHSJ}" onchange="xgsr()">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">���θ����� <i
											style="color: red">*</i>
										</label>
										<div class="col-md-7">
											<input type="text" id="FZFZR_MC" name="FZFZR_MC"
												class="form-control" readonly="readonly"
												value="${dFW01.FZFZR_MC}">
										</div>
										<div class="col-md-2">
											<a href="javascript:void(0);" class="btn btn-info "
												onclick="fzfzr()"> <i class="fa fa-search "></i> ѡ������
											</a>
										</div>
									</div>
									<div id="xzry" class="form-group">
										<label class="col-md-3 control-label">���θ�����Ա </label>
										<div class="col-md-2">
											<a href="javascript:void(0);" class="btn btn-info "
												onclick="fzry()"> <i class="fa fa-search "></i> ѡ����Ա
											</a>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�շѽ��</label>
										<div class="col-md-9">
											<input type="text" name="SFJE" class="form-control"
												readonly="readonly" value="${dFW01.SFJE}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�ɵ�˵��</label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="PDSM" rows="3"
												class="form-control" placeholder="���ɵ�ǰ�ؿ鲡�淢������ҩ���������ȷ��������">${dFW01.PDSM}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">��ע</label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="BZ" rows="3"
												class="form-control" placeholder="˵��ʲô������">${dFW01.BZ}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�ɵ���Ա </label>
										<div class="col-md-9">
											<input type="text" class="form-control" readonly="readonly"
												value="${dFW01.PDRY_MC}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�ɵ����� </label>
										<div class="col-md-9">
											<input type="text" class="form-control" readonly="readonly"
												value="<fmt:formatDate value="${dFW01.PDRQ}" pattern="yyyy-MM-dd HH:mm:ss"/>">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label"
											style="text-align: center;">�ؿ�����</label> <label
											class="col-md-2 control-label" style="text-align: center;">�ؿ�����</label>
										<label class="col-md-2 control-label"
											style="text-align: center;">�������</label> <label
											class="col-md-2 control-label" style="text-align: center;">����</label>
										<label class="col-md-2 control-label"
											style="text-align: center;">���ζ���</label> <label
											style="text-align: center;" class="col-md-2 control-label">����</label>
									</div>
									<jf:forEach var="listdfw01_d" items="${listdfw01_d}">
										<div class="form-group" style="text-align: center;">
											<div class="col-md-2">
												<input type="text" class="form-control" readonly="readonly"
													value="${listdfw01_d.DDJ02_D_DH}">
											</div>
											<div class="col-md-2">
												<jf:forEach var="dklx" items="${listdklx}">
													<jf:if test="${listdfw01_d.DDJ02_D_DLX==dklx.BM}">
														<input type="text" class="form-control"
															readonly="readonly" value="${dklx.HZMC}">
													</jf:if>
												</jf:forEach>
											</div>
											<div class="col-md-2">
												<input type="text" class="form-control" readonly="readonly"
													value="${listdfw01_d.FZMJ}">
											</div>
											<div class="col-md-2">
												<jf:forEach var="zw" items="${listzw}">
													<jf:if test="${listdfw01_d.ZW==zw.BM}">
														<jf:if test="${zw.BM!=99}">
															<input type="text" class="form-control"
																readonly="readonly" value="${zw.HZMC}">
														</jf:if>
														<jf:if test="${zw.BM==99}">
															<input type="text" class="form-control"
																readonly="readonly" value="${listdfw01_d.ZW_MC}">
														</jf:if>
													</jf:if>
												</jf:forEach>
											</div>
											<div class="col-md-2">
												<input type="text" class="form-control" readonly="readonly"
													value="${listdfw01_d.FZDX}">
											</div>
											<div class="col-md-2">
												<a class="btn btn-info"
													href="${path}order/gotodkup.do?JFID=${listdfw01_d.JFID}&SFJE=${dFW01.SFJE}&DDJ02_JFID=${dFW01.DDJ02_JFID}&FWNRLB=${dFW01.FWNRLB}">
													<i class="fa fa-edit"></i>
												</a> <a class="btn btn-danger" href="javascript:void(0);"
													onclick="delzj(this,'${listdfw01_d.JFID}','${path}','${dFW01.SFJE}','${dFW01.JFID}')">
													<i class="fa fa-trash-o "></i>
												</a>
											</div>
										</div>
									</jf:forEach>
									<div class="modal-footer">
										<a id="zjdk" class="btn btn-sm btn-primary btn-setting"
											href="#"> <i class="fa fa-edit "></i> ���ӵؿ�
										</a>
										<jf:if test="${fn:length(listdfw01_d)>=1}">
											<button id="tj" type="submit" class="btn btn-sm btn-success"
												onclick="sub(2)">
												<i class="fa fa-dot-circle-o"></i> �ύ
											</button>
										</jf:if>
										<button type="submit" class="btn btn-sm btn-primary">
											<i class="fa fa-check-square"></i> ����
										</button>
										<a class="btn btn-sm btn-danger" data-dismiss="modal"
											href="${path}order/sel.do"> <i class="fa fa-ban"></i> ����
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
					<form id="mydk" action="${path}/order/adddk.do" method="post"
						class="form-horizontal">
						<input type="hidden" name="FatherMonney" value="${dFW01.SFJE}">
						<input type="hidden" name="DFW01_JFID" value="${dFW01.JFID}">
						<input type="hidden" id="DDJ02_D_JFID" name="DDJ02_D_JFID"
							value="${fw01_d.DDJ02_D_JFID}"> <input type="hidden"
							id="DDJ02_D_MJ" name="DDJ02_D_MJ" value="${fw01_d.DDJ02_D_MJ}">
						<input type="hidden" id="DDJ11_JFID1" name="DDJ11_JFID1"
							value="${fw01_d.DDJ11_JFID1}"> <input type="hidden"
							id="DDJ11_JFID2" name="DDJ11_JFID2" value="${fw01_d.DDJ11_JFID2}">
						<input type="hidden" id="DDJ11_JFID3" name="DDJ11_JFID3"
							value="${fw01_d.DDJ11_JFID3}"> <input type="hidden"
							id="DDJ11_JFID4" name="DDJ11_JFID4" value="${fw01_d.DDJ11_JFID4}">
						<input type="hidden" id="DDJ11_FL1" name="DDJ11_FL1"
							value="${fw01_d.DDJ11_FL1}"> <input type="hidden"
							id="DDJ11_FL2" name="DDJ11_FL2" value="${fw01_d.DDJ11_FL2}">
						<input type="hidden" id="DDJ11_FL3" name="DDJ11_FL3"
							value="${fw01_d.DDJ11_FL3}"> <input type="hidden"
							id="DDJ11_FL4" name="DDJ11_FL4" value="${fw01_d.DDJ11_FL4}">
						<input type="hidden" id="DDJ11_DW1" name="DDJ11_DW1"
							value="${fw01_d.DDJ11_DW1}"> <input type="hidden"
							id="DDJ11_DW2" name="DDJ11_DW2" value="${fw01_d.DDJ11_DW2}">
						<input type="hidden" id="DDJ11_DW3" name="DDJ11_DW3"
							value="${fw01_d.DDJ11_DW3}"> <input type="hidden"
							id="DDJ11_DW4" name="DDJ11_DW4" value="${fw01_d.DDJ11_DW4}">
						<input type="hidden" id="DDJ11_DJ1" name="DDJ11_DJ1"
							value="${fw01_d.DDJ11_DJ1}"> <input type="hidden"
							id="DDJ11_DJ2" name="DDJ11_DJ2" value="${fw01_d.DDJ11_DJ2}">
						<input type="hidden" id="DDJ11_DJ3" name="DDJ11_DJ3"
							value="${fw01_d.DDJ11_DJ3}"> <input type="hidden"
							id="DDJ11_DJ4" name="DDJ11_DJ4" value="${fw01_d.DDJ11_DJ4}">
						<input type="hidden" id="DDJ11_BZGG1" name="DDJ11_BZGG1"
							value="${fw01_d.DDJ11_BZGG1}"> <input type="hidden"
							id="DDJ11_BZGG2" name="DDJ11_BZGG2" value="${fw01_d.DDJ11_BZGG2}">
						<input type="hidden" id="DDJ11_BZGG3" name="DDJ11_BZGG3"
							value="${fw01_d.DDJ11_BZGG3}"> <input type="hidden"
							id="DDJ11_BZGG4" name="DDJ11_BZGG4" value="${fw01_d.DDJ11_BZGG4}">
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
												<div class="col-md-7">
													<input type="text" id="DDJ02_D_DH" name="DDJ02_D_DH"
														class="form-control" readonly="readonly"
														value="${fw01_d.DDJ02_D_DH}">
												</div>
												<div class="col-md-2">
													<a href="javascript:void(0);" class="btn btn-sm btn-info "
														onclick="xzdk('${dFW01.DDJ02_JFID}')"> <i
														class="fa fa-search "></i> ѡ��ؿ�
													</a>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">�ؿ����� <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<select id="DDJ02_D_DLX" name="DDJ02_D_DLX"
														class="form-control" size="1"
														onfocus="this.defaultIndex=this.selectedIndex;"
														onchange="this.selectedIndex=this.defaultIndex;">
														<option value="">��ѡ��</option>
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
												<label class="col-md-3 control-label">�������(Ķ)<i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="FZMJ" name="FZMJ"
														class="form-control" placeholder="������������" onblur="pd()"
														value="${fw01_d.FZMJ}" autofocus="autofocus">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">ũ���� <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<select id="ZW" name="ZW" class="form-control" size="1"
														onchange="zwxz()">
														<option value="">��ѡ��</option>
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
													<label class="col-md-3 control-label">ũ�������� <i
														style="color: red">*</i>
													</label>
													<div class="col-md-9">
														<input type="text" id="ZW_MC" name="ZW_MC"
															class="form-control" placeholder="��������������"
															value="${fw01_d.ZW_MC}">
													</div>
												</div>
											</jf:if>
											<jf:if test="${fw01_d.ZW!=99}">
												<div class="form-group" id="zwmc" style="display: none;">
													<label class="col-md-3 control-label">ũ�������� <i
														style="color: red">*</i>
													</label>
													<div class="col-md-9">
														<input type="text" id="ZW_MC" name="ZW_MC"
															class="form-control" placeholder="��������������"
															value="${fw01_d.ZW_MC}">
													</div>
												</div>
											</jf:if>
											<div class="form-group">
												<label class="col-md-3 control-label">���ζ��� </label>
												<div class="col-md-9">
													<input type="text" id="FZDX" name="FZDX"
														class="form-control" placeholder="��������ζ���"
														value="${fw01_d.FZDX}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">ʩҩ��е </label>
												<div class="col-md-9">
													<select id="SYQX" name="SYQX" class="form-control" size="1">
														<option value="">��ѡ��</option>
														<jf:forEach var="syqx" items="${listsyqx}">
															<jf:if test="${fw01_d.SYQX==syqx.BM}">
																<option selected="selected" value="${syqx.BM}">${syqx.HZMC}
																</option>
															</jf:if>
															<jf:if test="${fw01_d.SYQX!=syqx.BM}">
																<option value="${syqx.BM}">${syqx.HZMC}</option>
															</jf:if>
														</jf:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">�շѽ��(Ԫ) </label>
												<div class="col-md-9">
													<input type="text" id="SFJE" name="SFJE"
														class="form-control" placeholder="�������շѽ��(Ԫ)"
														value="${fw01_d.SFJE}">
												</div>
											</div>
											<jf:if test="${dFW01.FWNRLB==01}">
												<div class="form-group">
													<label class="col-md-3 control-label">�Ƿ���� </label>
													<div class="col-md-9">
														<jf:if test="${empty fw01_d.SF_FZ}">
															<label class="radio-inline"> <input type="radio"
																id="inline-radio1" name="SF_FZ" value="1"
																checked="checked" onclick="pdxz()"> ��
															</label>
															<label class="radio-inline"> <input type="radio"
																id="inline-radio2" name="SF_FZ" value="0"
																onclick="pdxz()"> ��
															</label>
														</jf:if>
														<jf:if test="${fw01_d.SF_FZ==1}">
															<label class="radio-inline"> <input type="radio"
																id="inline-radio1" name="SF_FZ" value="1"
																checked="checked" onclick="pdxz()"> ��
															</label>
															<label class="radio-inline"> <input type="radio"
																id="inline-radio2" name="SF_FZ" value="0"
																onclick="pdxz()"> ��
															</label>
														</jf:if>
														<jf:if test="${fw01_d.SF_FZ==0}">
															<label class="radio-inline"> <input type="radio"
																id="inline-radio1" name="SF_FZ" value="1"
																onclick="pdxz()"> ��
															</label>
															<label class="radio-inline"> <input type="radio"
																id="inline-radio2" name="SF_FZ" checked="checked"
																value="0" onclick="pdxz()"> ��
															</label>
														</jf:if>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">�Ƿ�Ѳ��(��) </label>
													<div class="col-md-9">
														<jf:if test="${empty fw01_d.SF_XP}">
															<label class="radio-inline"> <input type="radio"
																id="inline-radio1" name="SF_XP" value="1"
																onclick="pdxz()"> ��
															</label>
															<label class="radio-inline"> <input type="radio"
																id="inline-radio2" name="SF_XP" checked="checked"
																value="0" onclick="pdxz()"> ��
															</label>
														</jf:if>
														<jf:if test="${fw01_d.SF_XP==1}">
															<label class="radio-inline"> <input type="radio"
																id="inline-radio1" name="SF_XP" value="1"
																checked="checked" onclick="pdxz()"> ��
															</label>
															<label class="radio-inline"> <input type="radio"
																id="inline-radio2" name="SF_XP" value="0"
																onclick="pdxz()"> ��
															</label>
														</jf:if>
														<jf:if test="${fw01_d.SF_XP==0}">
															<label class="radio-inline"> <input type="radio"
																id="inline-radio1" name="SF_XP" value="1"
																onclick="pdxz()"> ��
															</label>
															<label class="radio-inline"> <input type="radio"
																id="inline-radio2" name="SF_XP" value="0"
																checked="checked" onclick="pdxz()"> ��
															</label>
														</jf:if>
													</div>
												</div>
											</jf:if>
											<div id="cs">
												<div class="form-group">
													<label class="col-md-3 control-label">ũҩ��ʩ1 </label>
													<div class="col-md-6">
														<input type="text" id="DDJ11_MC1" name="DDJ11_MC1"
															class="form-control" value="${fw01_d.DDJ11_MC1}"
															onchange="sccs(this,1)">
													</div>
													<div class="col-md-2">
														<a href="javascript:void(0);" class="btn btn-sm btn-info "
															onclick="nycs12(1)"> <i class="fa fa-search "></i>
															ũҩ��ʩ1
														</a>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">ʹ����</label>
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
													<label id="NY1" class="col-md-2 control-label"
														style="text-align: left;">${fw01_d.DDJ11_DW1MC}</label>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">ũҩ��ʩ2 </label>
													<div class="col-md-6">
														<input type="text" id="DDJ11_MC2" name="DDJ11_MC2"
															class="form-control" value="${fw01_d.DDJ11_MC2}"
															onchange="sccs(this,2)">
													</div>
													<div class="col-md-2">
														<a href="javascript:void(0);" class="btn btn-sm btn-info "
															onclick="nycs12(2)"> <i class="fa fa-search "></i>
															ũҩ��ʩ2
														</a>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">ʹ����</label>
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
													<label id="NY2" class="col-md-2 control-label"
														style="text-align: left;">${fw01_d.DDJ11_DW2MC}</label>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">������ʩ1 </label>
													<div class="col-md-6">
														<input type="text" id="DDJ11_MC3" name="DDJ11_MC3"
															class="form-control" value="${fw01_d.DDJ11_MC3}"
															onchange="sccs(this,3)">
													</div>
													<div class="col-md-2">
														<a href="javascript:void(0);" class="btn btn-sm btn-info "
															onclick="qtcs(3)"> <i class="fa fa-search "></i>
															������ʩ1
														</a>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">ʹ����</label>
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
													<label id="NY3" class="col-md-2 control-label"
														style="text-align: left;">${fw01_d.DDJ11_DW3MC}</label>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">������ʩ2 </label>
													<div class="col-md-6">
														<input type="text" id="DDJ11_MC4" name="DDJ11_MC4"
															class="form-control" value="${fw01_d.DDJ11_MC4}"
															onchange="sccs(this,4)">
													</div>
													<div class="col-md-2">
														<a href="javascript:void(0);" class="btn btn-sm btn-info "
															onclick="qtcs(4)"> <i class="fa fa-search "></i>
															������ʩ2
														</a>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">ʹ����</label>
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
													<label id="NY4" class="col-md-2 control-label"
														style="text-align: left;">${fw01_d.DDJ11_DW4MC}</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">˵��������</label>
												<div class="col-md-9">
													<textarea name="SMZT" rows="3" class="form-control"
														placeholder="˵��ʲô������">${fw01_d.SMZT}</textarea>
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
							<button type="button" class="btn btn-sm btn-success"
								onclick="tjdk()">
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
	function xgsr() {
		$("#myfrom").data('bootstrapValidator').validateField('JHSJ');
		$("#myfrom").data('bootstrapValidator').updateStatus('JHSJ',
				'NOT_VALIDATED', null).validateField('JHSJ');
	}
	function sub(zt) {
		$("#ZT").attr("value", zt);
	}
	function delzj(obj, JFID, path, SFJE, fatherJFID) {
		if (confirm("��ȷ��Ҫɾ����")) {
			obj.href = path + "order/deldk.do?JFID=" + JFID + "&fatherSFJE="
					+ SFJE + "&fatherJFID=" + fatherJFID;
		}
	}
	function tjdk() {
		if ($("#DDJ02_D_DH").val() == "") {
			alert("��ѡ��ؿ�");
			return false;
		}
		if ($("#FZMJ").val() == "") {
			alert("������������");
			return false;
		} else {
			if (isNaN($("#FZMJ").val())) {
				alert("�����������������");
				return false;
			}
		}
		var display = $('#cs').css('display');
		if (display != 'none') {
			if ($("#DDJ11_MC1").val() == "" && $("#DDJ11_MC2").val() == ""
					&& $("#DDJ11_MC3").val() == ""
					&& $("#DDJ11_MC4").val() == "") {
				alert("ũҵ��ʩ1����2��������ʩ1����2����ѡһ��");
				return false;
			}
		}
		if ($("#DDJ11_MC1").val() != "") {
			if ($("#SYL1").val() == "") {
				alert("������ũҩ1��ʹ����");
				return false;
			} else {
				if (isNaN($("#SYL1").val())) {
					alert("ũҩ1����������");
					return false;
				}
			}
		}
		if ($("#DDJ11_MC2").val() != "") {
			if ($("#SYL2").val() == "") {
				alert("������ũҩ2��ʹ����");
				return false;
			} else {
				if (isNaN($("#SYL2").val())) {
					alert("ũҩ2����������");
					return false;
				}
			}
		}
		if ($("#DDJ11_MC3").val() != "") {
			if ($("#SYL3").val() == "") {
				alert("������������ʩ1��ʹ����");
				return false;
			} else {
				if (isNaN($("#SYL3").val())) {
					alert("������ʩ1����������");
					return false;
				}
			}
		}
		if ($("#DDJ11_MC4").val() != "") {
			if ($("#SYL4").val() == "") {
				alert("������������ʩ2��ʹ����");
				return false;
			} else {
				if (isNaN($("#SYL4").val())) {
					alert("������ʩ2����������");
					return false;
				}
			}
		}
		if ($("#SYL1").val() != "") {
			if ($("#DDJ11_MC1").val() == "") {
				alert("��ѡ��ũҩ��ʩ1");
				return false;
			}
		}
		if ($("#SYL2").val() != "") {
			if ($("#DDJ11_MC2").val() == "") {
				alert("��ѡ��ũҩ��ʩ2");
				return false;
			}
		}
		if ($("#SYL3").val() != "") {
			if ($("#DDJ11_MC3").val() == "") {
				alert("��ѡ��������ʩ1");
				return false;
			}
		}
		if ($("#SYL4").val() != "") {
			if ($("#DDJ11_MC4").val() == "") {
				alert("��ѡ��������ʩ2");
				return false;
			}
		}
		if (isNaN($("#SFJE").val())) {
			alert("�շѽ������������");
			return false;
		}
		$("#mydk").submit();
	}
	function qtcs(id) {
		window.showModalDialog("/Myssm/order/selfzqtcs.do", 0,
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
		window.showModalDialog("/Myssm/order/selfzcs.do", 0,
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
			alert("����ѡ��һ��");
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
	function pd() {
		var nowmj = $("#FZMJ").val();
		var maxmj = $("#DDJ02_D_MJ").val();
		if (maxmj == "") {
			alert("����ѡ��ؿ�");
			$("#FZMJ").attr("value", "");
			return;
		}
		if (parseInt(nowmj) > parseInt(maxmj)) {
			alert("���ܴ��ڵؿ����" + maxmj);
			$("#FZMJ").attr("value", "");
		}
	}
	function zwxz() {
		if ($("#ZW option:selected").val() == 99) {
			$("#zwmc").css('display', 'block');
		} else {
			$("#zwmc").css('display', 'none');
		}
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
		var returnvl = $("#Str").val();
		if (returnvl != null) {
			$("#tj").css("display", 'none')
			$("#zjdk").css("display", 'none')
		}
		var strs = returnvl.split(",");
		$("#DDJ02_JFID").attr("value", strs[0]);
		$("#DDJ02_MC").attr("value", strs[1]);
		$("#DDJ02_DZ").attr("value", strs[3]);
		$("#DDJ02_YDDH").attr("value", strs[2]);
		alert("ѡ���Ŀͻ���ɾ���ѽ��õĵؿ�");
	}
	function xzdk(ddj02_jfid) {
		window.showModalDialog(
				"/Myssm/order/seldk.do?DDJ02_JFID=" + ddj02_jfid, 0,
				"dialogWidth=800px;dialogHeight=auto;height=auto");
		var strs = $("#Str").val().split(",");
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
						htms += "<label class='col-md-3 control-label'>��Ա����</label>";
					} else {
						htms += "<label class='col-md-3 control-label'>��Ա����</label>";
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
		$("#xzry").after(htms);
		$("#FZRY").attr("value", $("#FZRY").val() + ids);
		$("#FZRY_MC").attr("value", $("#FZRY_MC").val() + mcs);
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
						htms += "<label class='col-md-3 control-label' >��Ա����</label>";
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
		$("#xzry").after(htms);
	}
	$(function() {
		ryxx('${retrunval}');
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
							message : '��ѡ���������'
						}
					}
				},
				DDJ02_MC : {
					validators : {
						notEmpty : {
							message : '��ѡ��ͻ�'
						}
					}
				},
				JHSJ : {
					validators : {
						notEmpty : {
							message : '�ƻ�����ʱ�䲻��Ϊ�գ�yyyy-mm-dd HH:mm��'
						},
						date : {
							format : 'YYYY-MM-DD HH:mm',
							message : '���ڸ�ʽ����ȷ��yyyy-mm-dd HH:mm��'
						}
					}
				},
				FZFZR_MC : {
					validators : {
						notEmpty : {
							message : '��ѡ������'
						}
					}
				}
			}
		});
		$("#201").addClass("opened");
		$("#202").css('display', 'block');
		pdxz();
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
		autoclose : true,
		language : 'zh-CN',
		todayBtn : true,
		forceParse : false
	});
</script>
<%
	String msg = (String) request.getAttribute("msgN");
	if (msg != null && !msg.equals("")) {
		out.print("<script type='text/javascript'>alert('" + msg
				+ "');</script>");
	}
%>
</html>