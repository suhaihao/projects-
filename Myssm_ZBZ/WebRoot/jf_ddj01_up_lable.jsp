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
							<li><i class="fa fa-home"></i><a href="${path}go/index.do">首页</a></li>
							<li><i class="fa fa-search"></i>查询统计</li>
							<li><i class="fa fa-eye">专防组织名录</i></li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>专防组织查看</strong>
								</h2>
								<div class="panel-actions">
									<a href="table.html#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<form id="myfrom" action="${path}info/ind.do" method="post" class="form-horizontal">
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
										<label class="col-md-3 control-label">用户名 </label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="YHM"
												class="form-control" readonly="readonly"
												value="${DDJ01.YHM}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">所属部门 </label>
										<div class=" col-md-9">
											<input type="text" id="text-input" name="BMBM"
												class="form-control" value="${DDJ01.BMMC}"
												readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">单位名称 </label>
										<div class=" col-md-9">
											<input type="text" id="text-input" name="MC"
												class="form-control" value="${DDJ01.MC}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">行政区划 </label>
										<div class="col-md-9">
											<input type="text" id="xzqh" name="XZQHMC"
												class="form-control" value="${DDJ01.XZQHMC}"
												placeholder="请选择行政区划" onfocus="this.blur()" readonly="readonly">（点击选择）
											<input type="hidden" id="xzqhbm" name="XZQH"
												class="form-control" value="${DDJ01.XZQH}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">地址</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="DZ"
												class="form-control" value="${DDJ01.DZ}" placeholder="请输入地址" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">GPS东经</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="GPS_DJ"
												class="form-control" value="${DDJ01.GPS_DJ}"
												placeholder="请输入东经" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">GPS北纬</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="GPS_BW"
												class="form-control" value="${DDJ01.GPS_BW}"
												placeholder="请输入北纬" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">电话</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="LX_DH"
												class="form-control" value="${DDJ01.LX_DH}"
												placeholder="请输入电话" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">手机</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="LX_SJ"
												class="form-control" value="${DDJ01.LX_SJ}"
												placeholder="请输入手机" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">网址</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="WWW"
												class="form-control" value="${DDJ01.WWW}"
												placeholder="请输入网址" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">邮箱</label>
										<div class="col-md-9">
											<input type="email" id="email-input" name="YX"
												class="form-control" value="${DDJ01.YX}" placeholder="请输入邮箱" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">简介</label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="JJ" rows="3"
												class="form-control" placeholder="说点什么。。。" readonly="readonly">${DDJ01.JJ}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">备注</label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="BZ" rows="3"
												class="form-control" placeholder="说点什么。。。" readonly="readonly">${DDJ01.BZ}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">登记人员</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="LRRY"
												class="form-control" value="${DDJ01.LRRY_MC}"
												readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">登记日期</label>
										<div class="col-md-9">
											<input id="text-input" type="text" name="LRRQ"
												class="form-control"
												value="<fmt:formatDate value="${DDJ01.LRRQ}" pattern="yyyy-MM-dd HH:mm:ss"/>"
												readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">状态</label>
										<div class="col-md-9">
											<jf:if test="${DDJ01.ZT==1}">
												<input type="text" id="text-input" name="ZT"
													class="form-control" value="初始" readonly="readonly">
											</jf:if>
											<jf:if test="${DDJ01.ZT==2}">
												<input type="text" id="text-input" name="ZT"
													class="form-control" value="提交" readonly="readonly">
											</jf:if>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">信用积分</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="XY_JF"
												class="form-control" value="${DDJ01.XY_JF}"
												readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">星级</label>
										<div class="col-md-9">
											<jf:if test="${DDJ01.PJ==1}">
												<input type="text" id="text-input" name="PJ"
													class="form-control" value="一星" readonly="readonly">
											</jf:if>
											<jf:if test="${DDJ01.PJ==2}">
												<input type="text" id="text-input" name="PJ"
													class="form-control" value="二星" readonly="readonly">
											</jf:if>
											<jf:if test="${DDJ01.PJ==3}">
												<input type="text" id="text-input" name="PJ"
													class="form-control" value="三星" readonly="readonly">
											</jf:if>
											<jf:if test="${DDJ01.PJ==4}">
												<input type="text" id="text-input" name="PJ"
													class="form-control" value="四星" readonly="readonly">
											</jf:if>
											<jf:if test="${DDJ01.PJ==5}">
												<input type="text" id="text-input" name="PJ"
													class="form-control" value="五星" readonly="readonly">
											</jf:if>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">评论数</label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="XY_PJS"
												class="form-control" value="${DDJ01.XY_PJS}"
												readonly="readonly">
										</div>
									</div>
									<jf:forEach var="list_d" items="${list_d}">
										<div id="${list_d.FWNRLB}" class="form-group">
											<label class="col-md-3 control-label">服务内容</label>
											<div class="col-md-7">
												<input type="text" id="text-input" class="form-control"
													value="${list_d.FWNRLBMC}" readonly="readonly"> <input type="hidden"
													id="text-input" name="${list_d.FWNRLB}"
													class="form-control" value="${list_d.FWNRLB}">
											</div>
											<label class="col-md-3 control-label">说明</label>
											<div class="col-md-9">
												<textarea id="textarea-input" name="sm${list_d.FWNRLB}"
													rows="3" class="form-control" placeholder="说点什么。。。" readonly="readonly">${list_d.SM}</textarea>
											</div>
										</div>
									</jf:forEach>
								</div>
							</form>
							<div class="modal-footer">
								<a class="btn btn-primary" type="button" onclick="xkryxx('${DDJ01.JFID}')">
									<i class="fa fa-search "></i> 人员信息
								</a> <a class="btn btn-danger" href="${path}label/sel.do"> <i
									class="fa fa-reply"></i> 返回
								</a>
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
						<h4 class="modal-title">选择服务</h4>
					</div>
					<form id="myfw" action="${path}/yhgl/adddk.do" method="post"
						class="form-horizontal">
						<div class="modal-body">
							<!-- 表单 -->
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h2>
												<i class="fa fa-indent red"></i><strong>服务信息</strong>
											</h2>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="col-md-3 control-label">服务内容</label>
												<div class="col-md-9">
													<select id="select" name="fw" class="form-control" size="1">
														<option value="0">请选择</option>
														<jf:forEach var="fw" items="${lisfw}">
															<option value="${fw.BM}">${fw.HZMC}</option>
														</jf:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">说明</label>
												<div class="col-md-9">
													<textarea id="sm" name="JFREMARK" rows="3"
														class="form-control" placeholder="说点什么。。。"></textarea>
												</div>
											</div>
											<br>
										</div>
									</div>
								</div>
								<!--表单结束-->
							</div>
						</div>
					</form>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-success"
							onclick="xz()">
							<i class="fa fa-dot-circle-o"></i> 确认
						</button>
						<button type="reset" class="btn btn-sm btn-danger"
							data-dismiss="modal">
							<i class="fa fa-ban"></i> 关闭
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
						<h4 class="modal-title">修改密码</h4>
					</div>
					<form id="elofrom" action="${path}/info/uppassword.do"
						method="post" class="form-horizontal">
						<input type="hidden" name="JFUSERID" value="${DDJ01.YHM}">
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
							<button type="button" class="btn btn-sm btn-success"
								onclick="xgmmtj()">
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
	function xkryxx(DDJ01_JFID) {
	    window.showModalDialog("/Myssm_ZBZ/info/selryxx.do?DDJ01_JFID="+DDJ01_JFID, 0,
		"dialogWidth=1000px;dialogHeight=600px");
	}
	function xgmmtj() {
		var bootstrapValidator = $("#elofrom").data('bootstrapValidator');
		//手动触发验证
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
			alert("保存成功");
		} else {
			alert("提交成功");
		}
		document.getElementById("myfrom").submit();
	}
	function bcfw() {
		$("#zt").attr("value", 1);
		document.getElementById("myfrom").submit();
	}
	function xz() {
		if ($("#select option:selected").val() == 0) {
			alert("请选择服务");
			return;
		}
		if (document.getElementById($("#select option:selected").val()) != null) {
			alert("不能重复选择");
			return;
		}
		var str = "<div id="
				+ $("#select option:selected").val()
				+ " class='form-group'>"
				+ "<label class='col-md-3 control-label'>服务内容</label>"
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
				+ "<label class='col-md-3 control-label'>说明</label>"
				+ "<div class='col-md-9'>"
				+ "<textarea id='textarea-input' name='sm"
				+ $("#select option:selected").val()
				+ "' rows='9' class='form-control' placeholder='说点什么。。。'>"
				+ $("#sm").val() + "</textarea>" + "</div>" + "</div>";
		var id = document.getElementById("ids").value;
		//添加ids
		$("#ids").attr("value", id + $("#select option:selected").val() + ",");
		//添加信息
		$("#body").append(str);
		//提交表单
		bcfw();
	}
	function remevo(id) {
		if (confirm("你确定要删除吗？")) {
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
					alert("对不起只能选择末级");
				}
			}
		} else {
			alert("对不起只能选择末级");
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
					alert("用户名重复请从新输入");
					obj.value = "";
				}
			}
		});
	}
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
							message : '邮箱格式不正确'
						}
					}
				},
				LX_SJ : {
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
				GPS_DJ : {
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
				GPS_BW : {
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
		$("#801").addClass("opened");
		$("#802").css('display', 'block');
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
%>
</html>