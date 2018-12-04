<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.ssh.user.model.User"%>
<%@ page import="com.ssh.user.util.EHCache"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jf"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		request.setAttribute("userxq",request.getAttribute("userxq"))  ;
	%>
	<div class="container-fluid content" style="margin-top: 50px;">
		<!-- start: Content -->
		<!-- main -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2>
							<i class="fa fa-table red"></i><span class="break"></span><strong>客户详情</strong>
						</h2>
						<div class="panel-actions">
							<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
						</div>
					</div>
					<div class="panel-body">
						<form action="${path}info/selryxx.do" class="form-horizontal"
							style="padding: 0;" method="post">

							<div class="form-group">
								<label class="col-md-3 control-label">姓名 </label>
								<div class="col-md-9">
									<input type="text" id="text-input" name="JFNAME"
										class="form-control" placeholder="请输入名称"
										value="${userxq.JFNAME}" readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Email</label>
								<div class="col-md-9">
									<input type="email" id="email-input" name="DZXX"
										class="form-control" placeholder="邮箱地址" value="${userxq.DZXX}"
										readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">电话</label>
								<div class="col-md-9">
									<input type="text" id="text-input" name="DH"
										class="form-control" placeholder="请输入电话" value="${userxq.DH}"
										readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">手机</label>
								<div class="col-md-9">
									<input type="text" id="text-input" name="SJ"
										class="form-control" placeholder="请输入手机" value="${userxq.SJ}"
										readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">生日</label>
								<div class="col-md-9">
									<input id="datetimepicker" type="text" name="SR"
										class="form-control" placeholder="请输入生日（yyyy-mm-dd）"
										data-date-format="yyyy-mm-dd"
										value="<fmt:formatDate value="${userxq.SR}" pattern="yyyy-MM-dd"/>"
										onchange="xgsr()" readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">性别</label>
								<div class="col-md-9">
									<jf:if test="${userxq.XB==0}">
										<label class="radio-inline"> <input type="radio"
											id="inline-radio1" name="XB" checked="checked" value="0"
											readonly="readonly"> 男
										</label>
										<label class="radio-inline"> <input type="radio"
											id="inline-radio2" name="XB" value="1" readonly="readonly">
											女
										</label>
									</jf:if>
									<jf:if test="${userxq.XB==1}">
										<label class="radio-inline"> <input type="radio"
											id="inline-radio1" name="XB" value="0" readonly="readonly">
											男
										</label>
										<label class="radio-inline"> <input type="radio"
											id="inline-radio2" name="XB" checked="checked" value="1"
											readonly="readonly"> 女
										</label>
									</jf:if>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">备注</label>
								<div class="col-md-9">
									<textarea id="textarea-input" name="JFREMARK" rows="9"
										class="form-control" placeholder="说点什么。。。" readonly="readonly">${userxq.JFREMARK}</textarea>
								</div>
								<br>
							</div>
							<div class="modal-footer">
								<a class="btn btn-sm btn-danger" data-dismiss="modal"
									href="javascript:void(0);" onclick="window.history.go(-1)">
									<i class="fa fa-ban"></i> 返回
								</a>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!--/col-->
		</div>
		<!-- end: Content -->
	</div>
	<!--/container-->



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
	function xzfzr(id,mc) {
		window.opener.document.getElementById('Str').value=id+","+mc;
		window.close();
	}
	function xztz(obj, allsize, ml,url) {
		var ys = prompt("请输入页数:");
		if (isNaN(ys)) {
			alert("请输入数字");
			return false;
		}
		if(ys!=null&&ys!="")
		{
		obj.href = ml + "/info/selryxx.do?page=" + ys + "&allSize=" + allsize+url;
		}
	}
</script>
</html>