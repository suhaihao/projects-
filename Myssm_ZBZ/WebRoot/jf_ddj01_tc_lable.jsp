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
<body>
	<%
		request.setAttribute("DDJ01", request.getAttribute("DDJ01"));
		request.setAttribute("lisfw", request.getAttribute("lisfw"));
		request.setAttribute("list_d", request.getAttribute("list_d"));
		request.setAttribute("ids", request.getAttribute("ids"));
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
							<li><i class="fa fa-medkit"></i>ר����֯����</li>
							<li><i class="fa fa-sign-out"></i>�˳�</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>ר����֯�鿴</strong>
								</h2>
								<div class="panel-actions">
									<a href="table.html#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<form id="myfrom" action="${path}info/ind.do" method="post"
								class="form-horizontal">
								<div id="body" class="panel-body">
									<input type="hidden" id="ids" name="ids" value="${ids}">
									<input type="hidden" id="zt" name="zt" value=""> <input
										type="hidden" name="JFID" value="${DDJ01.JFID}">
									<div class="form-group">
										<label class="col-md-3 control-label">LOGO</label>
										<div class="col-md-9">
											<div style="width: 120px;height: 120px;">
												<jf:if test="${not empty DDJ01.LOGO}">
													<img class="img-thumbnail" src="${path}${DDJ01.LOGO}"
														alt="Sample Image">
												</jf:if>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�û��� </label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="YHM"
												class="form-control" readonly="readonly"
												value="${DDJ01.YHM}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�������� </label>
										<div class=" col-md-9">
											<input type="text" id="text-input" name="BMBM"
												class="form-control" value="${DDJ01.BMMC}"
												readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">��λ���� </label>
										<div class=" col-md-9">
											<input type="text" id="text-input" name="MC"
												class="form-control" value="${DDJ01.MC}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�������� </label>
										<div class="col-md-9">
											<input type="text" id="xzqh" name="XZQHMC"
												class="form-control" value="${DDJ01.XZQHMC}"
												placeholder="��ѡ����������" onfocus="this.blur()"
												readonly="readonly">�����ѡ�� <input type="hidden"
												id="xzqhbm" name="XZQH" class="form-control"
												value="${DDJ01.XZQH}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">��ַ</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="DZ"
												class="form-control" value="${DDJ01.DZ}" placeholder="�������ַ"
												readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">GPS����</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="GPS_DJ"
												class="form-control" value="${DDJ01.GPS_DJ}"
												placeholder="�����붫��" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">GPS��γ</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="GPS_BW"
												class="form-control" value="${DDJ01.GPS_BW}"
												placeholder="�����뱱γ" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�绰</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="LX_DH"
												class="form-control" value="${DDJ01.LX_DH}"
												placeholder="������绰" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�ֻ�</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="LX_SJ"
												class="form-control" value="${DDJ01.LX_SJ}"
												placeholder="�������ֻ�" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">��ַ</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="WWW"
												class="form-control" value="${DDJ01.WWW}"
												placeholder="��������ַ" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">����</label>
										<div class="col-md-9">
											<input type="email" id="email-input" name="YX"
												class="form-control" value="${DDJ01.YX}" placeholder="����������"
												readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">���</label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="JJ" rows="3"
												class="form-control" placeholder="˵��ʲô������"
												readonly="readonly">${DDJ01.JJ}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">��ע</label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="BZ" rows="3"
												class="form-control" placeholder="˵��ʲô������"
												readonly="readonly">${DDJ01.BZ}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�Ǽ���Ա</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="LRRY"
												class="form-control" value="${DDJ01.LRRY_MC}"
												readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�Ǽ�����</label>
										<div class="col-md-9">
											<input id="text-input" type="text" name="LRRQ"
												class="form-control"
												value="<fmt:formatDate value="${DDJ01.LRRQ}" pattern="yyyy-MM-dd HH:mm:ss"/>"
												readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">״̬</label>
										<div class="col-md-9">
											<jf:if test="${DDJ01.ZT==0}">
												<input type="text" id="text-input" name="ZT"
													class="form-control" value="�˳�" readonly="readonly">
											</jf:if>
											<jf:if test="${DDJ01.ZT==1}">
												<input type="text" id="text-input" name="ZT"
													class="form-control" value="��ʼ" readonly="readonly">
											</jf:if>
											<jf:if test="${DDJ01.ZT==2}">
												<input type="text" id="text-input" name="ZT"
													class="form-control" value="�ύ" readonly="readonly">
											</jf:if>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">���û���</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="XY_JF"
												class="form-control" value="${DDJ01.XY_JF}"
												readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�Ǽ�</label>
										<div class="col-md-9">
											<jf:if test="${DDJ01.PJ==1}">
												<input type="text" id="text-input" name="PJ"
													class="form-control" value="һ��" readonly="readonly">
											</jf:if>
											<jf:if test="${DDJ01.PJ==2}">
												<input type="text" id="text-input" name="PJ"
													class="form-control" value="����" readonly="readonly">
											</jf:if>
											<jf:if test="${DDJ01.PJ==3}">
												<input type="text" id="text-input" name="PJ"
													class="form-control" value="����" readonly="readonly">
											</jf:if>
											<jf:if test="${DDJ01.PJ==4}">
												<input type="text" id="text-input" name="PJ"
													class="form-control" value="����" readonly="readonly">
											</jf:if>
											<jf:if test="${DDJ01.PJ==5}">
												<input type="text" id="text-input" name="PJ"
													class="form-control" value="����" readonly="readonly">
											</jf:if>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">������</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="XY_PJS"
												class="form-control" value="${DDJ01.XY_PJS}"
												readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�˳�˵��</label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="BZ" rows="3"
												class="form-control" placeholder="˵��ʲô������"
												readonly="readonly">${DDJ01.TC_SM}</textarea>
										</div>
									</div>
									<jf:forEach var="list_d" items="${list_d}">
										<div id="${list_d.FWNRLB}" class="form-group">
											<label class="col-md-3 control-label">��������</label>
											<div class="col-md-7">
												<input type="text" id="text-input" class="form-control"
													value="${list_d.FWNRLBMC}" readonly="readonly"> <input
													type="hidden" id="text-input" name="${list_d.FWNRLB}"
													class="form-control" value="${list_d.FWNRLB}">
											</div>
											<label class="col-md-3 control-label">˵��</label>
											<div class="col-md-9">
												<textarea id="textarea-input" name="sm${list_d.FWNRLB}"
													rows="3" class="form-control" placeholder="˵��ʲô������"
													readonly="readonly">${list_d.SM}</textarea>
											</div>
										</div>
									</jf:forEach>
									<div class="modal-footer">
										<a class="btn btn-primary" type="button"
											onclick="xkryxx('${DDJ01.JFID}')"> <i
											class="fa fa-search "></i> ��Ա��Ϣ
										</a> <a class="btn btn-danger" href="${path}tc/sel.do"> <i
											class="fa fa-reply"></i> ����
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
						<h4 class="modal-title">ѡ�����</h4>
					</div>
					<form id="myfw" action="${path}/yhgl/adddk.do" method="post"
						class="form-horizontal">
						<div class="modal-body">
							<!-- �� -->
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h2>
												<i class="fa fa-indent red"></i><strong>������Ϣ</strong>
											</h2>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="col-md-3 control-label">��������</label>
												<div class="col-md-9">
													<select id="select" name="fw" class="form-control" size="1">
														<option value="0">��ѡ��</option>
														<jf:forEach var="fw" items="${lisfw}">
															<option value="${fw.BM}">${fw.HZMC}</option>
														</jf:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">˵��</label>
												<div class="col-md-9">
													<textarea id="sm" name="JFREMARK" rows="3"
														class="form-control" placeholder="˵��ʲô������"></textarea>
												</div>
											</div>
											<br>
										</div>
									</div>
								</div>
								<!--������-->
							</div>
						</div>
					</form>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-success"
							onclick="xz()">
							<i class="fa fa-dot-circle-o"></i> ȷ��
						</button>
						<button type="reset" class="btn btn-sm btn-danger"
							data-dismiss="modal">
							<i class="fa fa-ban"></i> �ر�
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>

		<div class="modal fade" id="exampleModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">�޸�����</h4>
					</div>
					<form id="elofrom" action="${path}/info/uppassword.do"
						method="post" class="form-horizontal">
						<input type="hidden" name="JFUSERID" value="${DDJ01.YHM}">
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
							<button type="button" class="btn btn-sm btn-success"
								onclick="xgmmtj()">
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
	function xkryxx(DDJ01_JFID) {
		window.showModalDialog("/Myssm_ZBZ/info/selryxx.do?DDJ01_JFID="
				+ DDJ01_JFID, 0, "dialogWidth=1000px;dialogHeight=600px");
	}
	function xgmmtj() {
		var bootstrapValidator = $("#elofrom").data('bootstrapValidator');
		//�ֶ�������֤
		bootstrapValidator.validate();
		if (bootstrapValidator.isValid()) {
			$.ajax({
				type : "post",
				url : "/Myssm_ZBZ/info/uppassword.do",
				data : $('#elofrom').serialize(),
				dataType : "Text",
				async : false,
				error : function(XMLResponse) {
				},
				success : function(data) {
					alert("OK");
					window.location.reload();
				}
			});
		}
	}
	function xgmm() {
		$('#exampleModal').modal('show');
	}
	function sclogo() {
		document.getElementById("myfrom").enctype = "multipart/form-data";
	}
	function sub(zt) {
		$("#zt").attr("value", zt);
		if (zt == 1) {
			alert("����ɹ�");
		} else {
			alert("�ύ�ɹ�");
		}
		document.getElementById("myfrom").submit();
	}
	function bcfw() {
		$("#zt").attr("value", 1);
		document.getElementById("myfrom").submit();
	}
	function xz() {
		if ($("#select option:selected").val() == 0) {
			alert("��ѡ�����");
			return;
		}
		if (document.getElementById($("#select option:selected").val()) != null) {
			alert("�����ظ�ѡ��");
			return;
		}
		var str = "<div id="
				+ $("#select option:selected").val()
				+ " class='form-group'>"
				+ "<label class='col-md-3 control-label'>��������</label>"
				+ "<div class='col-md-7'>"
				+ "<input type='text' id='text-input' class='form-control' value="
				+ $("#select option:selected").text()
				+ ">"
				+ "<input type='hidden' id='text-input' name='"
				+ $("#select option:selected").val()
				+ "' class='form-control' value="
				+ $("#select option:selected").val()
				+ ">"
				+ "</div>"
				+ "<div class='col-md-2'>"
				+ "<a class='btn btn-danger' href='javascript:void(0);' onclick='remevo(\""
				+ $("#select option:selected").val() + "\")'>"
				+ "<i class='fa fa-trash-o '></i>" + "</a>" + "</div>"
				+ "<label class='col-md-3 control-label'>˵��</label>"
				+ "<div class='col-md-9'>"
				+ "<textarea id='textarea-input' name='sm"
				+ $("#select option:selected").val()
				+ "' rows='9' class='form-control' placeholder='˵��ʲô������'>"
				+ $("#sm").val() + "</textarea>" + "</div>" + "</div>";
		var id = document.getElementById("ids").value;
		//���ids
		$("#ids").attr("value", id + $("#select option:selected").val() + ",");
		//�����Ϣ
		$("#body").append(str);
		//�ύ��
		bcfw();
	}
	function remevo(id) {
		if (confirm("��ȷ��Ҫɾ����")) {
			$("#" + id).remove();
			bcfw();
		}
	}
	function tree() {
		var returnValue = window.showModalDialog("/Myssm_ZBZ/tree.jsp", 0,
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
				} else {
					alert("�Բ���ֻ��ѡ��ĩ��");
				}
			}
		} else {
			alert("�Բ���ֻ��ѡ��ĩ��");
		}
	};
	function yzname(obj) {
		var value = obj.value;
		$.ajax({
			type : "post",
			url : "/Myssm/preven/yzname.do",
			data : {
				JFUSERID : value
			},
			dataType : "json",
			async : false,
			error : function(XMLResponse) {
			},
			success : function(data) {
				if (data.data == 1) {
					alert("�û����ظ����������");
					obj.value = "";
				}
			}
		});
	}
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
	function scjs() {
		document.getElementById("myfrom").enctype = "multipart/form-data";
	}

	$(function() {
		$('#myfrom').bootstrapValidator({
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				YX : {
					validators : {
						emailAddress : {
							message : '�����ʽ����ȷ'
						}
					}
				},
				LX_SJ : {
					validators : {
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
				},
				GPS_DJ : {
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
				GPS_BW : {
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
		$("#101").addClass("opened");
		$("#102").css('display', 'block');
	});
</script>
<%
	String msg = (String) request.getAttribute("msg");
	if (msg != null && msg.equals("1")) {
		out.print("<script type='text/javascript'>alert('�ϴ��ļ���������');</script>");
	}
	if (msg != null && msg.equals("2")) {
		out.print("<script type='text/javascript'>alert('�ϴ��ļ����Ͳ�ƥ��');</script>");
	}
%>
</html>