<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="jf"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<link rel="shortcut icon" href="${path}/assets/ico/favicon.ico" type="image/x-icon" />

	    <!-- Css files -->
	    <link href="${path}/assets/css/bootstrap.min.css" rel="stylesheet">		
		<link href="${path}/assets/css/jquery.mmenu.css" rel="stylesheet">		
		<link href="${path}/assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="${path}/assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
	    <link href="${path}/assets/css/style.min.css" rel="stylesheet">
		<link href="${path}/assets/css/add-ons.min.css" rel="stylesheet">
	    <link href="${path}/assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet">		
	    <link href="${path}/assets/css/bootstrapValidator.min.css" rel="stylesheet">		

	    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	</head>
</head>

<body>
<%
request.setAttribute("page",request.getAttribute("page"));
request.setAttribute("MC",request.getAttribute("MC"));
request.setAttribute("FL",request.getAttribute("FL"));
request.setAttribute("listddj11",request.getAttribute("listddj11"));
request.setAttribute("lisfzfl",request.getAttribute("lisfzfl"));
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
						<li><i class="fa fa-flask"></i>防治措施库</li>				
					</ol>
				</div>
		</div>
		<!-- main -->
		<div class="row">		
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2><i class="fa fa-table red"></i><span class="break"></span><strong>防治措施库</strong></h2>
							<div class="panel-actions">
								<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
							</div>
						</div>
						<div class="panel-body">
								<form action="${path}fzcs/sel.do" class="navbar-form"
									style="padding: 0;" method="post">
									<div style="text-align: right;">
									    <label >分类： </label>
									    <select id="select" name="FL" class="form-control" size="1">
				                            <option value="">请选择</option>
				                            <jf:forEach var="fzfl" items="${lisfzfl}">
				                            <jf:if test="${fzfl.BM==FL}">
				                            <option selected="selected" value="${fzfl.BM}">${fzfl.HZMC}</option>
				                            </jf:if>
				                            <jf:if test="${fzfl.BM!=FL}">
				                            <option value="${fzfl.BM}">${fzfl.HZMC}</option>
				                            </jf:if>
				                            </jf:forEach>
				                        </select>
									    &#12288;&#12288;
										<input name="MC" type="text" class="form-control"
											placeholder="查询名称" value="${MC}">
										<button class="btn btn-info" type="submit">
											<i class="fa fa-search "></i> 查询
										</button>
										&#12288;&#12288;
										<a class="btn btn-success"
											href="${path}/fzcs/add.do"><i class="fa fa-search-plus "></i>添加 </a>
									</div>
								</form>
								<table class="table table-striped table-bordered bootstrap-datatable datatable">
							  <thead>
								  <tr>
									  <th>No.</th>
									  <th>分类</th>
                                      <th>名称</th>
                                      <th>单价</th>
                                      <th>单位</th>
                                      <th>包装规格</th>
									  <th>状态</th>
									  <th>操作</th>
								  </tr>
							  </thead>   
							  <tbody>
							   <jf:forEach var="ddj11" items="${listddj11}">								
								<tr>
									<td>${ddj11.RN}</td>
									<td>${ddj11.FL}</td>
                                    <td>${ddj11.MC}</td>
									<td>${ddj11.DJ}</td>
                                    <td>${ddj11.DW}</td>
									<td>${ddj11.BZGG}</td>
									<td>
									<jf:if test="${ddj11.ZT==1}">初始</jf:if>
                                    <jf:if test="${ddj11.ZT==2}">提交</jf:if>
									</td>
									<td>
									  <jf:if test="${ddj11.ZT==1}">
										<a class="btn btn-info" href="javascript:void(0);" onclick="tjgx('${ddj11.JFID}')">
											<i class="fa fa-edit "></i>                                            
										</a>
										<a class="btn btn-danger" href="javascript:void(0);" onclick="deluser('${ddj11.JFID}')">
											<i class="fa fa-trash-o "></i> 
										</a>
									  </jf:if>
									  <jf:if test="${ddj11.ZT==2}">
									    <a class="btn btn-info" href="javascript:void(0);" onclick="qxtj('${ddj11.JFID}')">
											<i class="fa fa-search"></i> 查看
										</a>
									  </jf:if>
									</td>
								</tr>
								<form id="qxuser${ddj11.JFID}" action="${path}fzcs/qxck.do" method="post">
								 <input type="hidden" name="id" value="${ddj11.JFID}"/>
								</form>
								<form id="upuser${ddj11.JFID}" action="${path}fzcs/goup.do" method="post">
								 <input type="hidden" name="id" value="${ddj11.JFID}"/>
								</form>
								<form id="deluser${ddj11.JFID}" action="${path}fzcs/del.do" method="post">
								 <input type="hidden" name="id" value="${ddj11.JFID}"/>
								</form>
								</jf:forEach>
							  </tbody>
						  </table>
						  <!-- 分页 -->
						        <jf:if test="${empty MC and empty FL}">
								<div style="text-align:center;">
									<ul class="pagination">
										<li><a>共${page.totalPage}页</a></li>
										<li><a href="${path}/fzcs/sel.do?page=1&allSize=${page.allSize}"><<</a></li>
										<li><a href="${path}/fzcs/sel.do?page=${page.page-1}&allSize=${page.allSize}"><</a></li>
										<li class="active"><a>${page.page}</a></li>
										<li><a href="${path}/fzcs/sel.do?page=${page.page+1}&allSize=${page.allSize}">></a></li>
										<li><a href="${path}/fzcs/sel.do?page=${page.totalPage}&allSize=${page.allSize}">>></a></li>
										<li><a href="javascript:void(0);" onclick="xztz(this,'${page.allSize}','${path}')">点击选择跳转</a></li>
									</ul>
								</div>
						        </jf:if>
						        <jf:if test="${not empty MC or not empty FL}">
								<div style="text-align:center;">
									<ul class="pagination">
										<li><a>共${page.totalPage}页</a></li>
										<li><a href="${path}/fzcs/sel.do?page=1&allSize=${page.allSize}&MC=${MC}&FL=${FL}"><<</a></li>
										<li><a href="${path}/fzcs/sel.do?page=${page.page-1}&allSize=${page.allSize}&MC=${MC}&FL=${FL}"><</a></li>
										<li class="active"><a>${page.page}</a></li>
										<li><a href="${path}/fzcs/sel.do?page=${page.page+1}&allSize=${page.allSize}&MC=${MC}&FL=${FL}">></a></li>
										<li><a href="${path}/fzcs/sel.do?page=${page.totalPage}&allSize=${page.allSize}&MC=${MC}&FL=${FL}">>></a></li>
									</ul>
								</div>
						        </jf:if>
								<!--分页结束 -->
						</div>
					</div>
				</div><!--/col-->
			</div>
		</div>
		<!-- end: Content -->
		<!-- foot -->
			<div id="usage">
			<label><img src="${path}assets/img/logo/GB.png">Copyright 北京际峰天翔信息技术有限公司</label>
	    	</div>
	</div><!--/container-->
		
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
			window.jQuery || document.write("<script src='${path}/assets/js/jquery-2.1.1.min.js'>"+"<"+"/script>");
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
	<script src="${path}/assets/plugins/jquery-ui/js/jquery-ui-1.10.4.min.js"></script>
	<script src="${path}/assets/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script src="${path}/assets/plugins/datatables/js/dataTables.bootstrap.min.js"></script>
	
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
    function yzname(obj)
    {
    	var value=obj.value;
    	$.ajax({
            type:"post",
            url:"/Myssm/preven/yzname.do",
            data:{JFUSERID:value},
            dataType:"json",        
            async: false,
            error:function(XMLResponse){
            	alert("a")
            },
            success: function(data){
            	if(data.data==1)
            	{
            	    alert("用户名重复请从新输入");
            		obj.value="";
            	}
            }
      });
    }
	function xztz(obj,allsize,ml) {
		var ys = prompt("请输入页数:");
		if (isNaN(ys)) {
			alert("请输入数字");
			return false;
		}
		if(ys!=null&&ys!="")
		{
		obj.href=ml+"/fzcs/sel.do?page="+ys+"&allSize="+allsize;
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
						},
						date : {
							format : 'YYYY-MM-DD',
							message : '日期格式不正确（yyyy-mm-dd）'
						}
					}
				}
			}
		});
		$("#201").addClass("opened");
		$("#202").css('display', 'block');
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
		todayBtn : true,
	});
</script>
<%
String msg = (String) request.getAttribute("msgN");
if (msg != null&&!msg.equals("")) {
	out.print("<script type='text/javascript'>alert('"+msg+"');</script>");
}
%>
</html>