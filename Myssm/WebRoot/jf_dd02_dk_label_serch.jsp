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
</head>
<style>
.col-md-3 {
	text-align: center;
}

.col-md-9 {
	padding-top: 2px;
	padding-bottom: 2px;
}
</style>
<body>
	<%
		request.setAttribute("listdklx", request.getAttribute("listdklx"));
		request.setAttribute("listzw", request.getAttribute("listzw"));
		request.setAttribute("dDJ02_D", request.getAttribute("dDJ02_D"));
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
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2>
									<i class="fa fa-table red"></i><span class="break"></span><strong>地块信息查看</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<form id="mydk" action="${path}yhgl/bcupdk.do" method="post" class="form-horizontal">
								<input type="hidden" name="JFID" value="${dDJ02_D.JFID}">
								<input type="hidden" name="DDJ02_JFID"
									value="${dDJ02_D.DDJ02_JFID}">
								<div id="body" class="panel-body">
									<div class="form-group">
										<label class="col-md-3 control-label">地块名称 <i
											style="color: red">*</i>
										</label>
										<div class="col-md-6">
											<input type="text" id="text-input" name="DH"
												class="form-control" placeholder="请输入模块名称"
												value="${dDJ02_D.DH}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">地块类型 <i
											style="color: red">*</i>
										</label>
										<div class="col-md-6">
											<jf:forEach var="dklx" items="${listdklx}">
												<jf:if test="${dDJ02_D.DLX==dklx.BM}">
													<input type="text" class="form-control"
														value="${dklx.HZMC}" readonly="readonly">
												</jf:if>
											</jf:forEach>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">面积（亩） <i
											style="color: red">*</i>
										</label>
										<div class="col-md-6">
											<input type="text" id="text-input" name="MJ"
												class="form-control" placeholder="请输入面积"
												value="${dDJ02_D.MJ}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">农作物 <i
											style="color: red">*</i>
										</label>
										<div class="col-md-6">
											<jf:forEach var="zw" items="${listzw}">
												<jf:if test="${dDJ02_D.NZW==zw.BM}">
													<input type="text" class="form-control" value="${zw.HZMC}"
														readonly="readonly">
												</jf:if>
											</jf:forEach>
										</div>
									</div>
									<div style="position:absolute;margin-left:75%;margin-top: -180px;">
										<div>
											<img id="oImg" class="img-rounded" alt="二维码"
												style="width: 150px;height: 150px;"
												src="${path}yhgl/wcewm.do?path=yhgl/ewmcx.do?DDJ02_D_JFID=${dDJ02_D.JFID}&MC=${dDJ02.MC}&MJ=${dDJ02_D.MJ}&DH=${dDJ02_D.DH}&DLX=${dDJ02_D.DLX}" />
										</div>
									</div>
									<jf:if test="${dDJ02_D.NZW==99}">
										<div class="form-group" id="zwmc">
											<label class="col-md-3 control-label">农作物名称 <i
												style="color: red">*</i>
											</label>
											<div class="col-md-9">
												<input type="text" id="text-input" name="NZW_MC"
													class="form-control" placeholder="请输入作物名称"
													value="${dDJ02_D.NZW_MC}" readonly="readonly">
											</div>
										</div>
									</jf:if>
									<jf:if test="${dDJ02_D.NZW!=99}">
										<div class="form-group" id="zwmc" style="display: none;">
											<label class="col-md-3 control-label">农作物名称 <i
												style="color: red">*</i>
											</label>
											<div class="col-md-9">
												<input type="text" id="text-input" name="NZW_MC"
													class="form-control" readonly="readonly">
											</div>
										</div>
									</jf:if>
									<div class="form-group">
										<label class="col-md-3 control-label">经度 </label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="JD"
												class="form-control" placeholder="请输入经度"
												value="${dDJ02_D.JD}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">纬度 </label>
										<div class="col-md-9">
											<input type="text" id="text-input" name="WD"
												class="form-control" placeholder="请输入纬度"
												value="${dDJ02_D.WD}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">备注</label>
										<div class="col-md-9">
											<textarea name="BZ" rows="3" class="form-control"
												readonly="readonly">${dDJ02_D.BZ}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">录入人员 </label>
										<div class="col-md-9">
											<input type="text" id="text-input" class="form-control"
												value="${dDJ02_D.LRRYMC}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">录入日期 </label>
										<div class="col-md-9">
											<input type="text" id="text-input" class="form-control"
												value="<fmt:formatDate value="${dDJ02_D.LRRQ}" pattern="yyyy-MM-dd HH:mm:ss"/>"
												readonly="readonly">
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<a class="btn btn-info"
										href="${path}searchnh/gotodfzcx.do?DDJ02_D_JFID=${dDJ02_D.JFID}">
										<i class="fa fa-search "></i> 防治查询
									</a> <a class="btn btn-danger" data-dismiss="modal"
										href="javascript:history.go(-1);"> <i class="fa fa-ban"></i>
										返回
									</a>
								</div>
							</form>
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
		<script src="${path}/assets/js/bootstrap-treeview.js"></script>

		<!-- end: JavaScript-->
</body>
<script type="text/javascript">
function zwxz()
{
	if($("#selectnzw option:selected").val()==99)
	{
		$("#zwmc").css('display', 'block');
	}
	else
	{
		$("#zwmc").css('display', 'none');
	}
}
	function choce(obj) {
		if (obj.value == 1) {
			$("#bl").css('display', 'block');
			$("#bbl").css('display', 'none');
		} else {
			$("#bl").css('display', 'none');
			$("#bbl").css('display', 'block');
		}
	}

	function xztz(obj, allsize, ml) {
		var ys = prompt("请输入页数:");
		if (isNaN(ys)) {
			alert("请输入数字");
			return false;
		}
		if(ys!=null&&ys!="")
		{
		obj.href = ml + "/info/sel.do?page=" + ys + "&allSize=" + allsize;
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
				JFPASSWORD : {
					validators : {
						notEmpty : {
							message : '密码不能为空'
						},
						regexp : {
							regexp : /^[a-zA-Z0-9_\.]+$/,
							message : '只能输入数字字母下划线'
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
				MC : {
					validators : {
						notEmpty : {
							message : '名称不能为空'
						}
					}
				},
				XZQHMC : {
					validators : {
						notEmpty : {
							message : '行政区划不能为空'
						}
					}
				},
				DZ : {
					validators : {
						notEmpty : {
							message : '地址不能为空'
						}
					}
				},
				SR : {
					validators : {
						notEmpty : {
							message : '生日不能为空（yyyy-mm-dd）'
						}
					}
				},
				XL : {
					validators : {
						notEmpty : {
							message : '请选择学历'
						}
					}
				},
				JTRK : {
					validators : {
						notEmpty : {
							message : '请输入家庭人口'
						},
						regexp : {
							regexp : /^[0-9\.]+$/,
							message : '只能输入数字'
						}
					}
				},
				RJSR : {
					validators : {
						notEmpty : {
							message : '年均收入不能为空'
						},
						regexp : {
							regexp : /^[0-9\.]+$/,
							message : '只能输入数字'
						}
					}
				},
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
				}
			}
		});
		$('#mydk').bootstrapValidator({
			message : 'This value is not valid',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				DH : {
					validators : {
						notEmpty : {
							message : '地块名称不能为空'
						}
					}
				},
				DLX : {
					validators : {
						notEmpty : {
							message : '请选择地块类型'
						}
					}
				},
				NZW : {
					validators : {
						notEmpty : {
							message : '请选择农作物'
						}
					}
				},
				NZW_MC : {
					validators : {
						notEmpty : {
							message : '请输入作物名称'
						}
					}
				},
				MJ : {
					validators : {
						notEmpty : {
							message : '面积不能为空'
						},
						regexp : {
							regexp : /^[0-9\.]+$/,
							message : '只能输入数字'
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
	$('#datetimepicker').datetimepicker({
		minView : "month",//设置只显示到月份
		autoclose: true,
		language : 'zh-CN',
	});
	$('#datetimepickertwo').datetimepicker({
		minView : "month",//设置只显示到月份
		autoclose: true,
		language : 'zh-CN',
	});
</script>
</html>