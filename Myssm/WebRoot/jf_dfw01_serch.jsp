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
		request.setAttribute("DFW22_JFID",
				request.getAttribute("DFW22_JFID"));
		request.setAttribute("DFW21_JFID",
				request.getAttribute("DFW21_JFID"));
		request.setAttribute("page", request.getAttribute("page"));
		request.setAttribute("StarTime", request.getAttribute("StarTime"));
		request.setAttribute("EndTime", request.getAttribute("EndTime"));
		request.setAttribute("DDJ02_MC", request.getAttribute("DDJ02_MC"));
		request.setAttribute("FZFZR_MC", request.getAttribute("FZFZR_MC"));
		request.setAttribute("lisdfw01", request.getAttribute("lisdfw01"));
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
							<li><i class="fa fa-paste"></i>工单明细</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>工单明细</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<form action="${path}gdcx/sel.do" class="form-inline text-right"
									method="post">
									<input id="Str" type="hidden">
									<div class="form-group">
										<label class="control-label">时间：</label>
									</div>
									<div class="form-group">
										<input id="datetimepickerup" name="StarTime" type="text"
											class="form-control" placeholder="起始日期（yyyy-mm-dd）"
											data-date-format="yyyy-mm-dd" value="${StarTime}" style="width: 100px;">
									</div>
									<div class="form-group">
										<input id="datetimepickerdon" name="EndTime" type="text"
											class="form-control" placeholder="结束日期（yyyy-mm-dd）"
											data-date-format="yyyy-mm-dd" value="${EndTime}" style="width: 100px;">
									</div>
									<div class="form-group">
										<input type="text" id="FZFZR_MC" name="FZFZR_MC"
											class="form-control" value="${FZFZR_MC}" style="width: 100px;">
									</div>
									<div class="form-group">
										<a href="javascript:void(0);" class="btn btn-info "
											onclick="fzfzr()"> <i class="fa fa-search "></i> 选择负责人
										</a>
									</div>
									<div class="form-group">
										<input type="text" id="DDJ02_MC" name="DDJ02_MC"
											class="form-control" value="${DDJ02_MC}" style="width: 100px;">
									</div>
									<div class="form-group">
										<a href="javascript:void(0);" class="btn btn-info "
											onclick="xzyh()"> <i class="fa fa-search "></i> 选择客户
										</a>
									</div>
									<div class="form-group">
										<button class="btn btn-info" type="submit">
											<i class="fa fa-search "></i> 查询
										</button>
									</div>
								</form>
								<table
									class="table table-striped table-bordered bootstrap-datatable datatable">
									<thead>
										<tr>
											<th>No.</th>
											<th>单号</th>
											<th>客户名称</th>
											<th>地址</th>
											<th>防治负责人</th>
											<th>派单时间</th>
											<th>完工时间</th>
											<th>状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<jf:forEach var="dfw01" items="${lisdfw01}">
											<tr>
												<td>${dfw01.RN}</td>
												<td>${dfw01.JFID}</td>
												<td>${dfw01.DDJ02_MC}</td>
												<td>${dfw01.DDJ02_DZ}</td>
												<td>${dfw01.FZFZR_MC}</td>
												<td><fmt:formatDate value="${dfw01.PDRQ}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td><fmt:formatDate value="${dfw01.WCRQ}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td><jf:if test="${dfw01.ZT==3}">完工</jf:if></td>
												<td><jf:if test="${dfw01.ZT==3}">
														<a href="javascript:void(0);" class="btn btn-info "
															onclick="qxtj('${dfw01.JFID}')"> <i
															class="fa fa-search "></i> 查看
														</a>
													</jf:if></td>
											</tr>
											<form id="qxuser${dfw01.JFID}"
												action="${path}gdcx/gotolabel.do" method="post">
												<input type="hidden" name="id" value="${dfw01.JFID}" />
											</form>
										</jf:forEach>
									</tbody>
								</table>
								<!-- 分页 -->
								<div style="text-align:center;">
									<ul class="pagination">
										<li><a>共${page.totalPage}页</a></li>
										<li><a
											href="${path}gdcx/sel.do?page=1&allSize=${page.allSize}&StarTime=${StarTime}&EndTime=${EndTime}&DDJ02_MC=${DDJ02_MC}&FZFZR_MC=${FZFZR_MC}"><<</a></li>
										<li><a
											href="${path}gdcx/sel.do?page=${page.page-1}&allSize=${page.allSize}&StarTime=${StarTime}&EndTime=${EndTime}&DDJ02_MC=${DDJ02_MC}&FZFZR_MC=${FZFZR_MC}"><</a></li>
										<li class="active"><a>${page.page}</a></li>
										<li><a
											href="${path}gdcx/sel.do?page=${page.page+1}&allSize=${page.allSize}&StarTime=${StarTime}&EndTime=${EndTime}&DDJ02_MC=${DDJ02_MC}&FZFZR_MC=${FZFZR_MC}">></a></li>
										<li><a
											href="${path}gdcx/sel.do?page=${page.totalPage}&allSize=${page.allSize}&StarTime=${StarTime}&EndTime=${EndTime}&DDJ02_MC=${DDJ02_MC}&FZFZR_MC=${FZFZR_MC}">>></a></li>
										<li><a href="javascript:void(0);"
											onclick="xztz(this,'${page.allSize}','${path}','&StarTime=${StarTime}&EndTime=${EndTime}&DDJ02_MC=${DDJ02_MC}&FZFZR_MC=${FZFZR_MC}')">点击选择跳转</a></li>
									</ul>
								</div>
								<!--分页结束 -->
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
					北京际峰天翔信息技术有限公司</label>
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
	function openwindow(jfid) {
		if (jfid != "") {
			window.open("/Myssm/tz/gotolabeldl.do?JFID=" + jfid + "&ZT=0", 0,
					"dialogWidth=800px;dialogHeight=auto;height=auto");
		}
	}
	function openwindowjsts(jfid) {
		if (jfid != "") {
			window.open("/Myssm/jsts/gotolabeldl.do?JFID=" + jfid + "&ZT=0", 0,
					"dialogWidth=800px;dialogHeight=auto;height=auto");
		}
	}
	function fzfzr() {
		window.showModalDialog("/Myssm/order/fzfzr.do", 0,
				"dialogWidth=800px;dialogHeight=auto;height=auto");
		var strs = $("#Str").val().split(",");
		$("#Str").attr("value", "");
		$("#FZFZR_MC").attr("value", strs[1]);
		$("#Str").val("");
	}
	function xzyh() {
		window.showModalDialog("/Myssm/order/user.do", 0,
				"dialogWidth=800px;dialogHeight=auto;height=auto");
		var strs = $("#Str").val().split(",");
		$("#Str").attr("value", "");
		$("#DDJ02_MC").attr("value", strs[1]);
		$("#Str").val("");
	}
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
	function xztz(obj, allsize, ml, url) {
		var ys = prompt("请输入页数:");
		if (isNaN(ys)) {
			alert("请输入数字");
			return false;
		}
		if (ys != null && ys != "") {
			obj.href = ml + "gdcx/sel.do?page=" + ys + "&allSize=" + allsize
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
		if (confirm("你确定要删除吗？")) {
			$("#deluser" + id).submit();
		}
	}
	function scjs() {
		document.getElementById("myfrom").enctype = "multipart/form-data";
	}

	$(function() {
		openwindow('${DFW21_JFID}');
		openwindowjsts('${DFW22_JFID}');
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
							message : '用户名不能为空'
						},
						regexp : {
							regexp : /^[a-zA-Z0-9_\.]+$/,
							message : '只能输入数字字母下划线'
						}
					}
				},
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
				},
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
				DH : {
					validators : {
						phone : {
							message : '电话号码不正确'
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
				SR : {
					validators : {
						date : {
							format : 'YYYY-MM-DD',
							message : '姓名不能为空'
						}
					}
				}
			}
		});
		$("#801").addClass("opened");
		$("#802").css('display', 'block');
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
	$('#datetimepickerup').datetimepicker({
		minView : "month",//设置只显示到月份
		autoclose : true,
		language : 'zh-CN',
		todayBtn : true,
	});
	$('#datetimepickerdon').datetimepicker({
		minView : "month",//设置只显示到月份
		autoclose : true,
		language : 'zh-CN',
		todayBtn : true,
	});
</script>
</html>