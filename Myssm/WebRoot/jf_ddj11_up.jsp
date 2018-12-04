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
</head>

<body>
	<%
		request.setAttribute("lisfzfl", request.getAttribute("lisfzfl"));
		request.setAttribute("lisdj", request.getAttribute("lisdj"));
		request.setAttribute("listddj11", request.getAttribute("listddj11"));
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
							<li><i class="fa fa-cogs"></i>ϵͳ����</li>
							<li><i class="fa fa-flask"></i>���δ�ʩ</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>���δ�ʩ�޸�</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<!-- �� -->
								<form id="myfrom" action="${path}/fzcs/upxj.do" method="post"
									class="form-horizontal">
									<input type="hidden" name="JFID" value="${listddj11.JFID}">
									<input type="hidden" id="zt" name="ZT" value="">
									<div class="form-group">
										<label class="col-md-3 control-label">����
											<i style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<select id="selectfl" name="FL" class="form-control" size="1"
												onchange="chagesj()">
												<option value="">��ѡ��</option>
												<jf:forEach var="fzfl" items="${lisfzfl}">
													<jf:if test="${fzfl.BM==listddj11.FL}">
														<option selected="selected" value="${fzfl.BM}">${fzfl.HZMC}</option>
													</jf:if>
													<jf:if test="${fzfl.BM!=listddj11.FL}">
														<option value="${fzfl.BM}">${fzfl.HZMC}</option>
													</jf:if>
												</jf:forEach>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">����
											<i style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="MC"
												class="form-control" placeholder="����������"
												onblur="yzname('${listddj11.JFID}',this)"
												value="${listddj11.MC}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">����
											<i style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="DJ"
												class="form-control" placeholder="������۸�"
												value="${listddj11.DJ}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">��λ
											<i style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<select id="selectdw" name="DW" class="form-control" size="1">
												<option value="">��ѡ��</option>
												<jf:forEach var="dj" items="${lisdj}">
													<jf:if test="${dj.BM==listddj11.DW}">
														<option selected="selected" value="${dj.BM}">${dj.HZMC}</option>
													</jf:if>
													<jf:if test="${dj.BM!=listddj11.DW}">
														<option value="${dj.BM}">${dj.HZMC}</option>
													</jf:if>
												</jf:forEach>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">��װ���
											<i style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="BZGG"
												class="form-control" placeholder="�������װ���"
												value="${listddj11.BZGG}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�������� </label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="SCCJ"
												class="form-control" placeholder="��������������" value="${listddj11.SCCJ}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">��ע</label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="BZ" rows="3"
												class="form-control" placeholder="˵��ʲô������">${listddj11.BZ}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�Ǽ���Ա</label>
										<div class="col-md-9">
											<input type="text" id="text-input" class="form-control"
												readonly="readonly" value="${listddj11.LRRYMC}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">�Ǽ�����</label>
										<div class="col-md-9">
											<input type="text" id="text-input" class="form-control"
												readonly="readonly"
												value="<fmt:formatDate value="${listddj11.LRRQ}" pattern="yyyy-MM-dd HH:mm:ss"/>">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label" >״̬</label>
										<div class="col-md-9">
											<jf:if test="${listddj11.ZT==0}">
												<input type="text" id="text-input" class="form-control"
													readonly="readonly" value="����">
											</jf:if>
											<jf:if test="${listddj11.ZT==1}">
												<input type="text" id="text-input" class="form-control"
													readonly="readonly" value="��ʼ">
											</jf:if>
											<jf:if test="${listddj11.ZT==2}">
												<input type="text" id="text-input" class="form-control"
													readonly="readonly" value="�ύ">
											</jf:if>
										</div>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-sm btn-success"
											onclick="sub(2)">
											<i class="fa fa-dot-circle-o"></i> �ύ
										</button>
										<button type="button" class="btn btn-sm btn-primary"
											onclick="sub(1)">
											<i class="fa fa-check-square"></i> ����
										</button>
										<a class="btn btn-sm btn-danger" data-dismiss="modal"
											href="${path}fzcs/sel.do"> <i class="fa fa-ban"></i> ����
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
			<label><img src="${path}assets/img/logo/GB.png">Copyright �����ʷ�������Ϣ�������޹�˾</label>
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
	function chagesj() {
		var val = $("#selectfl option:selected").val()
		$.ajax({
			type : "get",
			url : "/Myssm/fzcs/cxdw.do",
			data : {
				bm : val
			},
			dataType : "json",
			async : false,
			error : function(XMLResponse) {
			},
			success : function(data) {
				$("#selectdw").empty();
				$("#selectdw").append("<option value=''>��ѡ��</option>");
				$.each(data, function(key, city) {
					$("#selectdw").append(
							"<option value="+city+">" + key + "</option>");
				});
			}
		});
	}
	function sub(zt) {
		$("#zt").attr("value", zt);
		if (zt == 1) {
			alert("����ɹ�");
		}
		document.getElementById("myfrom").submit();
	}
	function yzname(id, obj) {
		var val = obj.value;
		$.ajax({
			type : "post",
			url : "/Myssm/fzcs/upyz.do",
			data : {
				id : id,
				mc : val
			},
			dataType : "json",
			async : false,
			error : function(XMLResponse) {
			},
			success : function(data) {
				if (data.data == 1) {
					alert("�����ظ����������");
					obj.value = "";
				}
			}
		});
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
				FL : {
					validators : {
						notEmpty : {
							message : '��ѡ�����'
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
				DJ : {
					validators : {
						notEmpty : {
							message : '���۲���Ϊ��'
						}
					}
				},
				DW : {
					validators : {
						notEmpty : {
							message : '��ѡ��λ'
						}
					}
				},
				BZGG : {
					validators : {
						notEmpty : {
							message : '��װ�����Ϊ��'
						}
					}
				}
			}
		});
		$("#201").addClass("opened");
		$("#202").css('display', 'block');
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