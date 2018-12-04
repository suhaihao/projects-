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

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>
</head>

<body>
	<%
		request.setAttribute("page", request.getAttribute("page"));
		request.setAttribute("StarTime", request.getAttribute("StarTime"));
		request.setAttribute("EndTime", request.getAttribute("EndTime"));
		request.setAttribute("BT", request.getAttribute("BT"));
		request.setAttribute("ZT", request.getAttribute("ZT"));
		request.setAttribute("listdfw23", request.getAttribute("listdfw23"));
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
							<li><i class="fa fa-heart"></i>����֧��</li>
							<li><i class="fa fa-comments-o"></i>������ѯ</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>������ѯ</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<form action="${path}jszx/sel.do" class="form-inline text-right"
									method="post">
									<div class="form-group">
										<label class="control-label">ʱ�䣺</label>
									</div>
									<div class="form-group">
										<input id="datetimepickerup" name="StarTime" type="text"
											class="form-control" placeholder="��ʼ����"
											data-date-format="yyyy-mm-dd" value="${StarTime}" style="width: 100px;">
									</div>
									<div class="form-group">
										<input id="datetimepickerdon" name="EndTime" type="text"
											class="form-control" placeholder="��������"
											data-date-format="yyyy-mm-dd" value="${EndTime}" style="width: 100px;">
									</div>
									<div class="form-group">
										<label class="control-label">���⣺</label>
									</div>
									<div class="form-group">
										<input name="BT" type="text" class="form-control"
											value="${BT}" placeholder="���������" style="width: 100px;">
									</div>
									<div class="form-group">
										<label class="control-label">״̬��</label>
									</div>
									<div class="form-group" style="margin-top: 5px;">
										<select name="ZT" class="form-control" size="1">
											<option value="">��ѡ��</option>
											<jf:if test="${ZT==2}">
												<option value="2" selected="selected">δ���</option>
											</jf:if>
											<jf:if test="${ZT!=2}">
												<option value="2">δ���</option>
											</jf:if>
											<jf:if test="${ZT==3}">
												<option value="3" selected="selected">�ѽ��</option>
											</jf:if>
											<jf:if test="${ZT!=3}">
												<option value="3">�ѽ��</option>
											</jf:if>
										</select>
									</div>
									<div class="form-group">
										<button class="btn btn-info" type="submit">
											<i class="fa fa-search "></i> ��ѯ
										</button>
									</div>
									<div class="form-group">
										<a class="btn btn-success btn-setting" href="#"><i
											class="fa fa-search-plus "></i> ������ѯ </a>
									</div>
								</form>
								<table
									class="table table-striped table-bordered bootstrap-datatable datatable">
									<thead>
										<tr>
											<th>No.</th>
											<th>��ѯʱ��</th>
											<th>����</th>
											<th>״̬</th>
											<th>���ʱ��</th>
											<th>����</th>
										</tr>
									</thead>
									<tbody>
										<jf:forEach var="dfw23" items="${listdfw23}">
											<tr>
												<td>${dfw23.RN}</td>
												<td><fmt:formatDate value="${dfw23.LRRQ}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td>${dfw23.BT}</td>
												<td><jf:if test="${dfw23.ZT==1}">��ʼ</jf:if> <jf:if
														test="${dfw23.ZT==2}">δ���</jf:if> <jf:if
														test="${dfw23.ZT==3}">�ѽ��</jf:if></td>
												<td><fmt:formatDate value="${dfw23.JDRQ}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<jf:if test="${dfw23.ZT==1}">
													<td><a class="btn btn-info" href="javascript:void(0);"
														onclick="tjgx('${dfw23.JFID}')"> <i
															class="fa fa-edit "></i>
													</a> <a class="btn btn-danger" href="javascript:void(0);"
														onclick="deluser('${dfw23.JFID}')"> <i
															class="fa fa-trash-o "></i>
													</a></td>
												</jf:if>
												<jf:if test="${dfw23.ZT==2}">
													<td><a href="javascript:void(0);"
														class="btn btn-info " onclick="qxtj('${dfw23.JFID}')">
															<i class="fa fa-search "></i> �鿴
													</a></td>
												</jf:if>
												<jf:if test="${dfw23.ZT==3}">
													<td><a href="javascript:void(0);"
														class="btn btn-info " onclick="qxtj('${dfw23.JFID}')">
															<i class="fa fa-search "></i> �鿴
													</a></td>
												</jf:if>
											</tr>
											<form id="qxuser${dfw23.JFID}"
												action="${path}jszx/gotolabel.do" method="post">
												<input type="hidden" name="JFID" value="${dfw23.JFID}" />
											</form>
											<form id="upuser${dfw23.JFID}" action="${path}jszx/gotoup.do"
												method="post">
												<input type="hidden" name="JFID" value="${dfw23.JFID}" />
											</form>
											<form id="deluser${dfw23.JFID}" action="${path}jszx/del.do"
												method="post">
												<input type="hidden" name="JFID" value="${dfw23.JFID}" />
											</form>
										</jf:forEach>
									</tbody>
								</table>
								<!-- ��ҳ -->
								<div style="text-align:center;">
									<ul class="pagination">
										<li><a>��${page.totalPage}ҳ</a></li>
										<li><a
											href="${path}jszx/sel.do?page=1&allSize=${page.allSize}&StarTime=${StarTime}&EndTime=${EndTime}&BT=${BT}&ZT=${ZT}"><<</a></li>
										<li><a
											href="${path}jszx/sel.do?page=${page.page-1}&allSize=${page.allSize}&StarTime=${StarTime}&EndTime=${EndTime}&BT=${BT}&ZT=${ZT}"><</a></li>
										<li class="active"><a>${page.page}</a></li>
										<li><a
											href="${path}jszx/sel.do?page=${page.page+1}&allSize=${page.allSize}&StarTime=${StarTime}&EndTime=${EndTime}&BT=${BT}&ZT=${ZT}">></a></li>
										<li><a
											href="${path}jszx/sel.do?page=${page.totalPage}&allSize=${page.allSize}&StarTime=${StarTime}&EndTime=${EndTime}&BT=${BT}&ZT=${ZT}">>></a></li>
										<li><a href="javascript:void(0);"
											onclick="xztz(this,'${page.allSize}','${path}','&StarTime=${StarTime}&EndTime=${EndTime}&BT=${BT}&ZT=${ZT}')">���ѡ����ת</a></li>
									</ul>
								</div>
								<!--��ҳ���� -->
							</div>
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
						<h4 class="modal-title">��Ӽ�����ѯ</h4>
					</div>
					<form id="myfrom" action="${path}/jszx/add.do" method="post"
						class="form-horizontal">
						<input id="ZT" name="ZT" type="hidden" value="1">
						<div class="modal-body">
							<!-- �� -->
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h2>
												<i class="fa fa-indent red"></i><strong>������ѯ��Ϣ</strong>
											</h2>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="col-md-3 control-label">���� <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" name="BT" class="form-control"
														placeholder="���������" value="">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">����<i
													style="color: red">*</i></label>
												<div class="col-md-9">
													<textarea id="textarea-input" name="NR" rows="9"
														class="form-control" placeholder="˵��ʲô������"></textarea>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">����</label>
												<div class="col-md-9">
													<a class="btn btn-sm btn-success"
														href="javascript:void(0);" onclick="tjfj()"><i
														class="fa fa-search-plus "></i> ��Ӹ��� </a>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label"></label>
												<div id="file" class="col-md-9"></div>
											</div>
											<br>
										</div>
									</div>
								</div>
								<!--������-->
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-sm btn-success"
								onclick="sub(2)">
								<i class="fa fa-dot-circle-o"></i> �ύ
							</button>
							<button type="submit" class="btn btn-sm btn-info"
								onclick="sub(1)">
								<i class="fa fa-dot-circle-o"></i> ����
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
	function sub(zt) {
		$("#ZT").val(zt);
	}
	function tjfj() {
		if ($("#file").html() == "") {
			$("#file")
					.append(
							"<input type='file' id='1' style='padding: 5px;' name='file-input' onchange='sclogo()'><a class='btn btn-sm btn-danger' style='margin-left: 300px;margin-top: -50px;'  href='javascript:void(0);' onclick=\"scfj('1',this)\"> <i class='fa fa-trash-o '></i></a>");
		} else {
			var id = parseInt($("#file input").last().attr("id")) + 1;
			$("#file")
					.append(
							"<input type='file' id='"
									+ id
									+ "' style='padding: 5px;' name='file-input' onchange='sclogo()'><a class='btn btn-sm btn-danger' style='margin-left: 300px;margin-top: -50px;' href='javascript:void(0);' onclick=\"scfj('"
									+ id
									+ "',this)\"> <i class='fa fa-trash-o '></i></a>");
		}
	}
	function sclogo() {
		document.getElementById("myfrom").enctype = "multipart/form-data";
	}
	function scfj(id, obj) {
		if (confirm("�Ƿ�ɾ��")) {
			obj.remove();
			$("#" + id).remove();
		}
	}
	function xztz(obj, allsize, ml, url) {
		var ys = prompt("������ҳ��:");
		if (isNaN(ys)) {
			alert("����������");
			return false;
		}
		if (ys != null && ys != "") {
			obj.href = ml + "jszx/sel.do?page=" + ys + "&allSize=" + allsize
					+ url;
		}
	}
	function tjgx(id) {
		$("#upuser" + id).submit();
	}
	function qxtj(id) {
		$("#qxuser" + id).submit();
	}
	function deluser(id) {
		if (confirm("��ȷ��Ҫɾ����")) {
			$("#deluser" + id).submit();
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
				BT : {
					validators : {
						notEmpty : {
							message : '���������'
						}
					}
				},
				NR : {
					validators : {
						notEmpty : {
							message : '����������'
						}
					}
				}
			}
		});
		$("#301").addClass("opened");
		$("#302").css('display', 'block');
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
	$('#datetimepickerup').datetimepicker({
		minView : "month",//����ֻ��ʾ���·�
		autoclose : true,
		language : 'zh-CN',
		todayBtn : true,
	});
	$('#datetimepickerdon').datetimepicker({
		minView : "month",//����ֻ��ʾ���·�
		autoclose : true,
		language : 'zh-CN',
		todayBtn : true,
	});
</script>
<%
	String msg = (String) request.getAttribute("msg");
	if (msg != null && !msg.equals("")) {
		out.print("<script type='text/javascript'>alert('" + msg
				+ "');</script>");
	}
%>
</html>