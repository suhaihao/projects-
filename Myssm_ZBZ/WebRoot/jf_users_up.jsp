<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.ssh.user.model.User"%>
<%@page import="com.ssh.user.util.EHCache"%>
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
		User user = (User) request.getAttribute("userxq");
		request.setAttribute("userxq", user);
		EHCache eHCache = new EHCache("ehcacheMenu_zbz");
		request.setAttribute("listrylb",
				eHCache.getCacheElement("listrylb"));
		request.setAttribute("listxl", eHCache.getCacheElement("listxl"));
		request.setAttribute("lisrole", request.getAttribute("lisrole"));
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
							<li><i class="fa fa-home"></i><a href="${path}go/index.do">首页</a></li>
							<li><i class="fa fa-cogs"></i>系统管理</li>
							<li><i class="fa fa-users"></i>人员管理</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>人员修改</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<!-- 表单 -->
								<form id="myfrom" action="${path}/preven/usms.do" method="post"
									class="form-horizontal">
									<input type="hidden" name="JFID" value="${userxq.JFID}">
									<input type="hidden" name="ZPLJ" value="${userxq.ZPLJ}">
									<jf:if test="${not empty userxq.ZPLJ}">
										<div class="form-group">
											<label class="col-md-3 control-label">头像</label>
											<div class="col-md-9">
												<div style="width: 120px;height: 120px;">
													<img class="img-thumbnail" src="${path}${userxq.ZPLJ}">
												</div>
											</div>
										</div>
									</jf:if>
									<jf:if test="${userxq.RYFL!=99}">
										<input type="hidden" id="JFDSYS05_CODE" name="JFDSYS05_CODE"
											value="${userxq.JFDSYS05_CODE}">
										<div class="form-group">
											<label class="col-md-3 control-label">人员分类 <i
												style="color: red">*</i></label>
											<div class="col-md-9">
												<select id="select" name="RYFL" class="form-control"
													size="1">
													<jf:forEach var="lb" items="${listrylb}">
														<jf:if test="${lb.BM!=99}">
															<jf:if test="${lb.BM==userxq.RYFL}">
																<option value="${lb.BM}" selected="selected">${lb.HZMC}</option>
															</jf:if>
															<jf:if test="${lb.BM!=userxq.RYFL}">
																<option value="${lb.BM}">${lb.HZMC}</option>
															</jf:if>
														</jf:if>
													</jf:forEach>
												</select>
											</div>
										</div>
									</jf:if>
									<div class="form-group">
										<label class="col-md-3 control-label">姓名 <i
											style="color: red">*</i>
										</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="JFNAME"
												class="form-control" placeholder="请输入名称"
												value="${userxq.JFNAME}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">选择部门 <i
											style="color: red">*</i>
										</label>
										<div class=" col-md-7">
											<input type="text" id="JFDSYS05_CODEMC"
												name="JFDSYS05_CODEMC" class="form-control"
												placeholder="请选择部门" onfocus="this.blur()"
												value="${userxq.JFDSYS05_CODEMC}">
										</div>
										<div class=" col-md-2">
											<button class="btn btn-info" type="button"
												onclick="tree_bm()">
												<i class="fa fa-search "></i>
											</button>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Email</label>
										<div class="col-md-9">
											<input type="email" id="email-input" name="DZXX"
												class="form-control" placeholder="邮箱地址"
												value="${userxq.DZXX}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">电话</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="DH"
												class="form-control" placeholder="请输入电话"
												value="${userxq.DH}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">手机</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="SJ"
												class="form-control" placeholder="请输入手机"
												value="${userxq.SJ}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">生日</label>
										<div class="col-md-9">
											<input id="datetimepicker" type="text" name="SR"
												class="form-control" placeholder="请输入生日（yyyy-mm-dd）"
												data-date-format="yyyy-mm-dd"
												value="<fmt:formatDate value="${userxq.SR}" pattern="yyyy-MM-dd"/>"
												onchange="xgsr()">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">学历</label>
										<div class="col-md-9">
											<select id="select" name="XL" class="form-control" size="1">
												<option value="0">请选择</option>
												<jf:forEach var="xl" items="${listxl}">
													<jf:if test="${xl.BM==userxq.XL}">
														<option value="${xl.BM}" selected="selected">${xl.HZMC}</option>
													</jf:if>
													<jf:if test="${xl.BM!=userxq.XL}">
														<option value="${xl.BM}">${xl.HZMC}</option>
													</jf:if>
												</jf:forEach>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">性别</label>
										<div class="col-md-9">
											<jf:if test="${userxq.XB==0}">
												<label class="radio-inline"> <input type="radio"
													id="inline-radio1" name="XB" checked="checked" value="0">
													男
												</label>
												<label class="radio-inline"> <input type="radio"
													id="inline-radio2" name="XB" value="1"> 女
												</label>
											</jf:if>
											<jf:if test="${userxq.XB==1}">
												<label class="radio-inline"> <input type="radio"
													id="inline-radio1" name="XB" value="0"> 男
												</label>
												<label class="radio-inline"> <input type="radio"
													id="inline-radio2" name="XB" checked="checked" value="1">
													女
												</label>
											</jf:if>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">是否可用</label>
										<div class="col-md-9">
											<jf:if test="${userxq.JFSTATE==0}">
												<label class="radio-inline"> <input type="radio"
													id="inline-radio1" name="JFSTATE" checked="checked"
													value="0"> 可用
												</label>
												<label class="radio-inline"> <input type="radio"
													id="inline-radio2" name="JFSTATE" value="1"> 不可用
												</label>
											</jf:if>
											<jf:if test="${userxq.JFSTATE==1}">
												<label class="radio-inline"> <input type="radio"
													id="inline-radio1" name="JFSTATE" value="0"> 可用
												</label>
												<label class="radio-inline"> <input type="radio"
													id="inline-radio2" name="JFSTATE" checked="checked"
													value="1"> 不可用
												</label>
											</jf:if>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">强制修改密码</label>
										<div class="col-md-9">
											<jf:if test="${userxq.SF_XGPW==0}">
												<label class="radio-inline"> <input type="radio"
													id="inline-radio1" name="SF_XGPW" checked="checked"
													value="0"> 否
												</label>
												<label class="radio-inline"> <input type="radio"
													id="inline-radio2" name="SF_XGPW" value="1"> 是
												</label>
											</jf:if>
											<jf:if test="${userxq.SF_XGPW==1}">
												<label class="radio-inline"> <input type="radio"
													id="inline-radio1" name="SF_XGPW" value="0"> 否
												</label>
												<label class="radio-inline"> <input type="radio"
													id="inline-radio2" name="SF_XGPW" checked="checked"
													value="1"> 是
												</label>
											</jf:if>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">上传头像</label>
										<div class="col-md-9" onchange="scjs()">
											<input type="file" id="file-input" name="file-input">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">备注</label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="JFREMARK" rows="9"
												class="form-control" placeholder="说点什么。。。">${userxq.JFREMARK}</textarea>
										</div>
										<br>
									</div>
									<div class="modal-footer">
										<button class="btn btn-sm btn-info" type="button"
											onclick="juese()">
											<i class="fa fa-search "></i> 选择角色
										</button>
										<a class="btn btn-info btn-sm btn-setting" href="#"
											onclick="xgmm('${userxq.JFID}')"> <i class="fa fa-edit "></i>
											修改密码
										</a>
										<button type="submit" class="btn btn-sm btn-success">
											<i class="fa fa-dot-circle-o"></i> 提交
										</button>
										<a class="btn btn-sm btn-danger" data-dismiss="modal"
											href="javascript:void(0);" onclick="tjgx()"> <i
											class="fa fa-ban"></i> 返回
										</a>
									</div>
								</form>
								<!-- 表单结束 -->
								<form id="upuser" action="${path}/preven/sel.do"></form>
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

		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">修改密码</h4>
					</div>
					<form id="elofrom" action="${path}/preven/uppas.do" method="post"
						class="form-horizontal">
						<input id="JFID" type="hidden" name="JFID" value="">
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
		<div class="modal fade" id="myModal2">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">角色选择</h4>
					</div>
					<form id="elofrom2" action="${path}/preven/addjs.do" method="post"
						class="form-horizontal">
						<input id="JFID" type="hidden" name="JFID" value="${userxq.JFID}">
						<input id="ids" type="hidden" name="ids" value="">
						<div class="modal-body">
							<!-- 表单 -->
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h2>
												<i class="fa fa-indent red"></i><strong>角色选择</strong>
											</h2>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="col-md-3 control-label">模块选择</label>
												<div class="col-md-9">
													<jf:forEach var="role" items="${lisrole}">
														<div class="checkbox">
															<label for="${role.JFID}"> <input type="checkbox"
																id="${role.JFID}" name="checkboxs" value="${role.JFID}">
																${role.ROLE_NAME}
															</label>
														</div>
													</jf:forEach>
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
							<button type="button" class="btn btn-sm btn-success"
								onclick="tjjs()">
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

		<!-- end: JavaScript-->
</body>
<script type="text/javascript">
	function bl(ids) {
		var cks = $('input[name="checkboxs"]');
		var valsz = ids.split(",");
		for (var i = 0; i < valsz.length; i++) {
			$(cks).each(function() {
				if (this.value == valsz[i]) {
					$("#" + this.id).attr("checked", "checked");
				}
			});
		}
	}
	function tjjs() {
		var ids = "";
		var cks = $('input[name="checkboxs"]');
		$(cks).each(function() {
			if (this.checked) {
				ids = ids + this.id + ",";
			}
		});
		$("#ids").attr("value", ids);
		alert("保存成功");
		$("#elofrom2").submit();
	}
	function juese() {
		$("#myModal2").modal();
	}
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
	function xgsr() {
		$("#myfrom").data('bootstrapValidator').validateField('SR');
		$("#myfrom").data('bootstrapValidator').updateStatus('SR',
				'NOT_VALIDATED', null).validateField('SR');
	}
	function xgmm(id) {
		$("#JFID").attr("value", id);
	}
	function tjgx() {
		$("#upuser").submit();
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
				DZXX : {
					validators : {
						emailAddress : {
							message : '邮箱格式不正确'
						}
					}
				},
				SJ : {
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
				},
				JFNAME : {
					validators : {
						notEmpty : {
							message : '姓名不能为空'
						}
					}
				},
				JFDSYS05_CODEMC : {
					validators : {
						notEmpty : {
							message : '请选择部门'
						}
					}
				},
				SR : {
					validators : {
						date : {
							format : 'YYYY-MM-DD',
							message : '日期格式不正确（yyyy-mm-dd）'
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
		$("#901").addClass("opened");
		$("#902").css('display', 'block');
		bl('${ids}');
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
		todayBtn : true,
		forceParse : false
	});
</script>
<%
	String msg = (String) request.getAttribute("msg");
	if (msg != null && msg.equals("1")) {
		out.print("<script type='text/javascript'>alert('上传文件超过限制');</script>");
	}
	if (msg != null && msg.equals("2")) {
		out.print("<script type='text/javascript'>alert('上传文件类型不匹配');</script>");
	}
	if (msg != null && !msg.equals("1") && !msg.equals("2")) {
		out.print("<script type='text/javascript'>alert('" + msg
				+ "');</script>");
	}
%>
</html>