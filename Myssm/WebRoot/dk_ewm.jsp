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
		request.setAttribute("dDJ02_D", request.getAttribute("dDJ02_D"));
		request.setAttribute("dDJ02", request.getAttribute("dDJ02"));
		request.setAttribute("listdklx", request.getAttribute("listdklx"));
	%>
	<div class="container-fluid content" style="margin-top: 50px;">
		<!-- start: Content -->
		<!-- main -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2>
							<i class="fa fa-table red"></i><span class="break"></span><strong>二维码</strong>
						</h2>
						<div class="panel-actions">
							<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
						</div>
					</div>
					<div class="panel-body">
						<form id="mydk" action="${path}/ordergd/updkinfo.do" method="post"
							class="form-horizontal">
								<!--startprint-->
							<div class="form-group" >
							<label class="col-md-1 control-label"></label>
							<div class="col-md-5">
							<img class="text-logo" style="width: 100px;height: 100px;" src="${path}assets/img/logo/1.png"><span style="font-size: 20px;font-weight: bold;">北京市蔬菜病虫害专业化防控综合服务系统</span>
							</div>
							</div>
							<div class="form-group">
								<label class="col-md-1 control-label">主人 </label>
								<div class="col-md-2">
									<input type="text" id="text-input" name="DH"
										class="form-control" value="${dDJ02.MC}" readonly="readonly">
								</div>
								<label class="col-md-1 control-label">地面积 </label>
								<div class="col-md-2">
									<input type="text" id="text-input" name="DH"
										class="form-control" value="${dDJ02_D.MJ}" readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-1 control-label">地名称 </label>
								<div class="col-md-2">
									<input type="text" id="text-input" name="DH"
										class="form-control" value="${dDJ02_D.DH}" readonly="readonly">
								</div>
								<label class="col-md-1 control-label">地类型 </label>
								<div class="col-md-2">
									<jf:forEach var="dklx" items="${listdklx}">
										<jf:if test="${dDJ02_D.DLX==dklx.BM}">
											<input type="text" id="text-input" name="DH"
												class="form-control" value="${dklx.HZMC}"
												readonly="readonly">
										</jf:if>
									</jf:forEach>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-1 control-label">二维码 </label>
								<div class="col-md-2">
									<img id="oImg" class="img-rounded" alt="二维码" src="${path}yhgl/wcewm.do?path=yhgl/ewmcx.do?DDJ02_D_JFID=${dDJ02_D.JFID}&MC=${dDJ02.MC}&MJ=${dDJ02_D.MJ}&DH=${dDJ02_D.DH}&DLX=${dDJ02_D.DLX}" />
								</div>
							</div>
								<!--endprint-->
						</form>
						<div class="modal-footer" style="text-align: center;">
									<button type="submit" class="btn btn-primary" onclick="doPrint()">
										<i class="fa fa-print"></i> 打印
									</button>
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
    bdhtml=window.document.body.innerHTML;
    sprnstr="<!--startprint-->"; //开始打印标识字符串有17个字符
    eprnstr="<!--endprint-->"; //结束打印标识字符串
    prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17); //从开始打印标识之后的内容
    prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr)); //截取开始标识和结束标识之间的内容
    window.document.body.innerHTML=prnhtml; //把需要打印的指定内容赋给body.innerHTML
    $("#oImg").css({"width":window.screen.width/2,"height":window.screen.height/2});
    window.print(); //调用浏览器的打印功能打印指定区域
    window.document.body.innerHTML=bdhtml; // 最后还原页面
}
	function xzfzr(JFID,DH,DLX,MJ,NZW,NZW_MC) {
		window.opener.document.getElementById('Str').value=JFID+","+DH+","+DLX+","+MJ+","+NZW+","+NZW_MC;
		window.close();
	}
	function xztz(obj, allsize, ml,ddj02_jfid) {
		var ys = prompt("请输入页数:");
		if (isNaN(ys)) {
			alert("请输入数字");
			return false;
		}
		if(ys!=null&&ys!="")
		{
		obj.href = ml + "/order/seldk.do?page=" + ys + "&allSize=" + allsize+"&DDJ02_JFID="+ddj02_jfid;
		}
	}
</script>
</html>