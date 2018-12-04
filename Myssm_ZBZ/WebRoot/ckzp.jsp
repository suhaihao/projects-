<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.ssh.user.model.DDJ02_D"%>
<%@ page import="com.ssh.user.util.EHCache"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jf"%>
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

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>
</head>

<body>
	<%
		request.setAttribute("listdfw01_d_zp",
				request.getAttribute("listdfw01_d_zp"));
		request.setAttribute("YJPZ", request.getAttribute("YJPZ"));
		request.setAttribute("XCZY", request.getAttribute("XCZY"));
		request.setAttribute("FZDX", request.getAttribute("FZDX"));
		request.setAttribute("TSQK", request.getAttribute("TSQK"));
	%>
	<div class="container-fluid content" style="margin-top: 50px;">
		<!-- start: Content -->
		<!-- main -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2>
							<i class="fa fa-table red"></i><span class="break"></span><strong>地块相关照片</strong>
						</h2>
						<div class="panel-actions">
							<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
						</div>
					</div>
					<div class="panel-body">
						<form id="mydk" action="${path}/ordergd/updkinfo.do" method="post"
							class="form-horizontal">
							<!--startprint-->
							<jf:if test="${YJPZ==1}">
								<div class="form-group">
									<label class="col-md-3 control-label">药剂配置 </label>
									<jf:forEach var="dfw01_d_zp" items="${listdfw01_d_zp}">
										<jf:if test="${dfw01_d_zp.LB==0}">
											<div style="margin-bottom:10px" class="col-md-3">
												<a href="${path}${dfw01_d_zp.SL_LJ}" target="_blank"><img
													class="img-thumbnail" src="${path}${dfw01_d_zp.SL_LJ}"
													alt="Sample Image"></a>
											</div>
										</jf:if>
									</jf:forEach>
								</div>
							</jf:if>
							<jf:if test="${XCZY==1}">
								<div class="form-group">
									<label class="col-md-3 control-label">现场作业 </label>
									<jf:forEach var="dfw01_d_zp" items="${listdfw01_d_zp}">
										<jf:if test="${dfw01_d_zp.LB==1}">
											<div style="margin-bottom:10px" class="col-md-3">
												<a href="${path}${dfw01_d_zp.SL_LJ}" target="_blank"><img
													class="img-thumbnail" src="${path}${dfw01_d_zp.SL_LJ}"
													alt="Sample Image"></a>
											</div>
										</jf:if>
									</jf:forEach>
								</div>
							</jf:if>
							<jf:if test="${FZDX==1}">
								<div class="form-group">
									<label class="col-md-3 control-label">防治对象 </label>
									<jf:forEach var="dfw01_d_zp" items="${listdfw01_d_zp}">
										<jf:if test="${dfw01_d_zp.LB==2}">
											<div style="margin-bottom:10px" class="col-md-3">
												<a href="${path}${dfw01_d_zp.SL_LJ}" target="_blank"><img
													class="img-thumbnail" src="${path}${dfw01_d_zp.SL_LJ}"
													alt="Sample Image"></a>
											</div>
										</jf:if>
									</jf:forEach>
								</div>
							</jf:if>
							<jf:if test="${TSQK==1}">
								<div class="form-group">
									<label class="col-md-3 control-label">特殊情况 </label>
									<jf:forEach var="dfw01_d_zp" items="${listdfw01_d_zp}">
										<jf:if test="${dfw01_d_zp.LB==3}">
											<div style="margin-bottom:10px" class="col-md-3">
												<a href="${path}${dfw01_d_zp.SL_LJ}" target="_blank"><img
													class="img-thumbnail" src="${path}${dfw01_d_zp.SL_LJ}"
													alt="Sample Image"></a>
											</div>
										</jf:if>
									</jf:forEach>
								</div>
							</jf:if>
							<div class="form-group" style="color: red;">
								<label class="col-md-3 control-label">注意： </label>
								<div style="margin-bottom:10px" class="col-md-6">
									<span>防治措施照片要求：非巡棚必须拍照，照片中应包含本地块服务所需耗材。<br>
										现场作业：必须拍照，照片中需体现作业场景。<br> 防治对象：有症状必须拍照。<br>
										特殊情况：如棚室损坏、局部病虫十分严重等可能引起争议的特殊情况。
									</span>
								</div>
							</div>
							<!--endprint-->
						</form>
						<div class="modal-footer" style="text-align: center;">
							<a type="reset" class="btn btn-sm btn-danger"
								data-dismiss="modal"
								href="javascript:window.opener=null;window.open('','_self');window.close();">
								<i class="fa fa-ban"></i> 关闭
							</a>
						</div>
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
	function doPrint() {
		bdhtml = window.document.body.innerHTML;
		sprnstr = "<!--startprint-->"; //开始打印标识字符串有17个字符
		eprnstr = "<!--endprint-->"; //结束打印标识字符串
		prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 17); //从开始打印标识之后的内容
		prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr)); //截取开始标识和结束标识之间的内容
		window.document.body.innerHTML = prnhtml; //把需要打印的指定内容赋给body.innerHTML
		$("#oImg").css({
			"width" : window.screen.width / 2,
			"height" : window.screen.height / 2
		});
		window.print(); //调用浏览器的打印功能打印指定区域
		window.document.body.innerHTML = bdhtml; // 最后还原页面
	}
	function xzfzr(JFID, DH, DLX, MJ, NZW, NZW_MC) {
		window.opener.document.getElementById('Str').value = JFID + "," + DH
				+ "," + DLX + "," + MJ + "," + NZW + "," + NZW_MC;
		window.close();
	}
	function xztz(obj, allsize, ml, ddj02_jfid) {
		var ys = prompt("请输入页数:");
		if (isNaN(ys)) {
			alert("请输入数字");
			return false;
		}
		if (ys != null && ys != "") {
			obj.href = ml + "/order/seldk.do?page=" + ys + "&allSize="
					+ allsize + "&DDJ02_JFID=" + ddj02_jfid;
		}
	}
</script>
</html>