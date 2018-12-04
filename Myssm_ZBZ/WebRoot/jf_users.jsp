<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.ssh.user.model.User"%>
<%@ page import="com.ssh.user.util.EHCache"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jf"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
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
		request.setAttribute("page",request.getAttribute("page"))  ;
			request.setAttribute("JFNAME",request.getAttribute("JFNAME"))  ;
			List<User> listUser=(List<User>)request.getAttribute("listUser");
			request.setAttribute("list",listUser);
			EHCache eHCaches = new EHCache("ehcacheMenu_zbz");
			request.setAttribute("listrylb",eHCaches.getCacheElement("listrylb"));
			request.setAttribute("listxl",eHCaches.getCacheElement("listxl"));
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
							<li><i class="fa fa-users"></i>��Ա����</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>��Ա����</strong>
								</h2>
								<div class="panel-actions">
									<a href="table.html#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<form action="${path}preven/sel.do" class="navbar-form"
									style="padding: 0;" method="post">
									<div style="text-align: right;">
										<input name="JFNAME" type="text" class="form-control"
											placeholder="��ѯ����" value="${JFNAME}">
										<button class="btn btn-info" type="submit">
											<i class="fa fa-search "></i>
										</button>
										&#12288;&#12288; <a class="btn btn-success btn-setting"
											href="#"><i class="fa fa-search-plus "></i> ��� </a>
									</div>
								</form>
								<table
									class="table table-striped table-bordered bootstrap-datatable datatable">
									<thead>
										<tr>
											<th>No.</th>
											<th>�ͻ�ID</th>
											<th>����</th>
											<th>�Ա�</th>
											<th>����</th>
											<th>�ֻ�</th>
											<th>����</th>
											<th>����</th>
											<th>״̬</th>
											<th>����</th>
										</tr>
									</thead>
									<tbody>
										<jf:forEach var="lis" items="${list}">
											<tr>
												<td>${lis.RN}</td>
												<td>${lis.JFUSERID}</td>
												<td>${lis.JFNAME}</td>
												<td><jf:if test="${lis.XB==0}">
                                                                                                               ��
                                    </jf:if> <jf:if test="${lis.XB==1}">
                                                                                                              Ů 
                                    </jf:if></td>
												<td>${lis.JFDSYS05_CODEMC}</td>
												<td>${lis.SJ}</td>
												<td>${lis.DZXX}</td>
												<td>${lis.RYFL}</td>
												<td><jf:if test="${lis.JFSTATE==0}">
                                                                                                               ����
                                    </jf:if> <jf:if test="${lis.JFSTATE==1}">
                                                                                                              ������ 
                                    </jf:if></td>
												<td><a class="btn btn-info" href="javascript:void(0);"
													onclick="tjgx('${lis.JFID}')"> <i class="fa fa-edit "></i>
												</a> <a class="btn btn-danger" href="javascript:void(0);"
													onclick="deluser('${lis.JFID}')"> <i
														class="fa fa-trash-o "></i>
												</a></td>
											</tr>
											<form id="upuser${lis.JFID}" action="${path}preven/up.do"
												method="post">
												<input type="hidden" name="id" value="${lis.JFID}" />
											</form>
											<form id="deluser${lis.JFID}" action="${path}preven/del.do"
												method="post">
												<input type="hidden" name="id" value="${lis.JFID}" />
											</form>
										</jf:forEach>
									</tbody>
								</table>
								<!-- ��ҳ -->
								<jf:if test="${empty JFNAME}">
									<div style="text-align:center;">
										<ul class="pagination">
											<li><a>��${page.totalPage}ҳ</a></li>
											<li><a
												href="${path}/preven/sel.do?page=1&allSize=${page.allSize}"><<</a></li>
											<li><a
												href="${path}/preven/sel.do?page=${page.page-1}&allSize=${page.allSize}"><</a></li>
											<li class="active"><a>${page.page}</a></li>
											<li><a
												href="${path}/preven/sel.do?page=${page.page+1}&allSize=${page.allSize}">></a></li>
											<li><a
												href="${path}/preven/sel.do?page=${page.totalPage}&allSize=${page.allSize}">>></a></li>
											<li><a href="javascript:void(0);"
												onclick="xztz(this,'${page.allSize}','${path}')">���ѡ����ת</a></li>
										</ul>
									</div>
								</jf:if>
								<jf:if test="${not empty JFNAME}">
									<div style="text-align:center;">
										<ul class="pagination">
											<li><a>��${page.totalPage}ҳ</a></li>
											<li><a
												href="${path}/preven/sel.do?page=1&allSize=${page.allSize}&JFNAME=${JFNAME}"><<</a></li>
											<li><a
												href="${path}/preven/sel.do?page=${page.page-1}&allSize=${page.allSize}&JFNAME=${JFNAME}"><</a></li>
											<li class="active"><a>${page.page}</a></li>
											<li><a
												href="${path}/preven/sel.do?page=${page.page+1}&allSize=${page.allSize}&JFNAME=${JFNAME}">></a></li>
											<li><a
												href="${path}/preven/sel.do?page=${page.totalPage}&allSize=${page.allSize}&JFNAME=${JFNAME}">>></a></li>
										</ul>
									</div>
								</jf:if>
								<!--��ҳ���� -->
							</div>
						</div>
					</div>
					<!--/col-->
				</div>
			</div>
			<!-- end: Content -->
			<div id="usage">
			<label><img src="${path}assets/img/logo/GB.png">Copyright �����ʷ�������Ϣ�������޹�˾</label>
	    	</div>
		</div>
		<!--/container-->


		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">��ӿͻ���Ϣ</h4>
					</div>
					<form id="myfrom" action="${path}/preven/add.do" method="post"
						class="form-horizontal">
						<input type="hidden" name="LRRY" value="${sessionScope.user.JFID}">
						<input type="hidden" id="JFDSYS05_CODE" name="JFDSYS05_CODE"
							value="">
						<div class="modal-body">
							<!-- �� -->
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h2>
												<i class="fa fa-indent red"></i><strong>��Ա��Ϣ</strong>
											</h2>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="col-md-3 control-label">��Ա����</label>
												<div class="col-md-9">
													<select id="select" name="RYFL" class="form-control"
														size="1">
														<jf:forEach var="lb" items="${listrylb}">
															<jf:if test="${lb.BM!=99}">
																<option value="${lb.BM}">${lb.HZMC}</option>
															</jf:if>
														</jf:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">�˻� <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JFUSERID" autocomplete = 'new-password'
														class="form-control" placeholder="�������˻�"
														autofocus="autofocus" onblur="yzname(this)">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">���� <i
													style="color: red">*</i>
												</label>
												<div class=" col-md-9">
													<input type="password" id="password-input" autocomplete = 'new-password'
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
											<div class="form-group">
												<label class="col-md-3 control-label">ѡ���� <i
													style="color: red">*</i>
												</label>
												<div class=" col-md-7">
													<input type="text" id="JFDSYS05_CODEMC"
														name="JFDSYS05_CODEMC" class="form-control"
														placeholder="��ѡ����" onfocus="this.blur()">
												</div>
												<div class=" col-md-2">
													<button class="btn btn-info" type="button"
														onclick="tree_bm()">
														<i class="fa fa-search "></i>
													</button>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">���� <i
													style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JFNAME"
														class="form-control" placeholder="����������">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">Email</label>
												<div class="col-md-9">
													<input type="email" id="email-input" name="DZXX"
														class="form-control" placeholder="�����ַ">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">�绰</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="DH"
														class="form-control" placeholder="������绰">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">�ֻ�</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="SJ"
														class="form-control" placeholder="�������ֻ�">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">����</label>
												<div class="col-md-9">
													<input id="datetimepicker" type="text" name="SR"
														class="form-control" placeholder="���������գ�yyyy-mm-dd��"
														data-date-format="yyyy-mm-dd">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">ѧ��</label>
												<div class="col-md-9">
													<select id="select" name="XL" class="form-control" size="1">
														<option value="0">��ѡ��</option>
														<jf:forEach var="xl" items="${listxl}">
															<option value="${xl.BM}">${xl.HZMC}</option>
														</jf:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">�Ա�</label>
												<div class="col-md-9">
													<label class="radio-inline"> <input type="radio"
														id="inline-radio1" name="XB" checked="checked" value="0">
														��
													</label> <label class="radio-inline"> <input type="radio"
														id="inline-radio2" name="XB" value="1"> Ů
													</label>
												</div>
											</div>
											<div class="form-group" style="display: none;">
												<label class="col-md-3 control-label">��Ϣ�������</label>
												<div class="col-md-9">
													<label class="radio-inline"> <input type="radio"
														id="inline-radio1" name="XXDBLB" checked="checked"
														value="1"> ����
													</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">�ϴ�ͷ��</label>
												<div class="col-md-9">
													<input type="file" id="file-input" name="file-input"
														onchange="scjs()">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">��ע</label>
												<div class="col-md-9">
													<textarea id="textarea-input" name="JFREMARK" rows="9"
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

		<!-- end: JavaScript-->
</body>
<script type="text/javascript">
	function tree_bm() {
		var returnValue = window.showModalDialog("/Myssm_ZBZ/tree_bm.jsp", 0,
				"dialogWidth=500px;dialogHeight=600px");
		var strs = returnValue.split(",");
		$("#JFDSYS05_CODE").attr('value', strs[0]);
		$("#JFDSYS05_CODEMC").attr('value', strs[1]);
		$("#myfrom").data('bootstrapValidator')
				.validateField('JFDSYS05_CODEMC');
		$("#myfrom").data('bootstrapValidator').updateStatus('JFDSYS05_CODEMC',
				'NOT_VALIDATED', null).validateField('JFDSYS05_CODEMC');
	}
	function yzname(obj) {
		var value = obj.value;
		$.ajax({
			type : "post",
			url : "/Myssm_ZBZ/preven/yzname.do",
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
					$("#myfrom").data("bootstrapValidator").updateStatus("JFUSERID",  "NOT_VALIDATED",  null );
					$.obj.focus();
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
			obj.href = ml + "/preven/sel.do?page=" + ys + "&allSize=" + allsize;
		}
	}
	function tjgx(id) {
		$("#upuser" + id).submit();
	}
	function deluser(id) {
		if (confirm("��ȷ��Ҫɾ����")) {
			$("#deluser" + id).submit();
		}
	}
	function scjs() {
		document.getElementById("myfrom").enctype = "multipart/form-data";
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
				JFUSERID : {
					validators : {
						notEmpty : {
							message : '�û�������Ϊ��'
						},
						regexp : {
							regexp : /^[a-zA-Z0-9_\.]+$/,
							message : 'ֻ������������ĸ�»���'
						}
					}
				},
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
				JFDSYS05_CODEMC : {
					validators : {
						notEmpty : {
							message : '���Ų���Ϊ��'
						}
					}
				},
				DZXX : {
					validators : {
						emailAddress : {
							message : '�����ʽ����ȷ'
						}
					}
				},
				SJ : {
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
				JFNAME : {
					validators : {
						notEmpty : {
							message : '��������Ϊ��'
						}
					}
				},
				SR : {
					validators : {
						date : {
							format : 'YYYY-MM-DD',
							message : '��ʽ����ȷ'
						}
					}
				}
			}
		});
		$("#901").addClass("opened");
		$("#902").css('display', 'block');
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
		todayBtn : true,
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