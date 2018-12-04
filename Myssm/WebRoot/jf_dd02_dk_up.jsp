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
									<i class="fa fa-table red"></i><span class="break"></span><strong>�ؿ���Ϣ�޸�</strong>
								</h2>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i
										class="fa fa-chevron-up"></i></a>
								</div>
							</div>
							<form id="mydk" action="${path}yhgl/bcupdk.do" method="post">
							 <input type="hidden" name="JFID" value="${dDJ02_D.JFID}">
							 <input type="hidden" name="DDJ02_JFID" value="${dDJ02_D.DDJ02_JFID}">
								<div id="body" class="panel-body">
												<div class="form-group">
												<label class="col-md-3 control-label">�ؿ�����
													<i style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="DH"
														class="form-control" placeholder="������ģ������" value="${dDJ02_D.DH}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">�ؿ�����
													<i style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<select id="select" name="DLX" class="form-control"
														size="1">
														<option value="">��ѡ��</option>
														<jf:forEach var="dklx" items="${listdklx}">
														<jf:if test="${dDJ02_D.DLX==dklx.BM}">
															<option selected="selected" value="${dklx.BM}">${dklx.HZMC}</option>
														</jf:if>
														<jf:if test="${dDJ02_D.DLX!=dklx.BM}">
															<option value="${dklx.BM}">${dklx.HZMC}</option>
														</jf:if>
														</jf:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">�����Ķ��
													<i style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="MJ"
														class="form-control" placeholder="���������" value="${dDJ02_D.MJ}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">ũ����
													<i style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<select id="selectnzw" name="NZW" class="form-control"
														size="1" onchange="zwxz()">
														<option value="">��ѡ��</option>
														<jf:forEach var="zw" items="${listzw}">
														  <jf:if test="${dDJ02_D.NZW==zw.BM}">
															<option selected="selected" value="${zw.BM}">${zw.HZMC}</option>
														  </jf:if>
														  <jf:if test="${dDJ02_D.NZW!=zw.BM}">
															<option value="${zw.BM}">${zw.HZMC}</option>
														  </jf:if>
														</jf:forEach>
													</select>
												</div>
											</div>
											<jf:if test="${dDJ02_D.NZW==99}">
											<div class="form-group" id="zwmc">
												<label class="col-md-3 control-label">ũ��������
													<i style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="NZW_MC"
														class="form-control" placeholder="��������������" value="${dDJ02_D.NZW_MC}">
												</div>
											</div>
											</jf:if>
											<jf:if test="${dDJ02_D.NZW!=99}">
											<div class="form-group" id="zwmc" style="display: none;">
												<label class="col-md-3 control-label">ũ��������
													<i style="color: red">*</i>
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="NZW_MC"
														class="form-control" placeholder="��������������">
												</div>
											</div>
											</jf:if>
											<div class="form-group">
												<label class="col-md-3 control-label">����
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="JD"
														class="form-control" placeholder="�����뾭��" value="${dDJ02_D.JD}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">γ��
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" name="WD"
														class="form-control" placeholder="������γ��" value="${dDJ02_D.WD}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">��ע</label>
												<div class="col-md-9">
													<textarea name="BZ" rows="3" class="form-control"
														placeholder="˵��ʲô������">${dDJ02_D.BZ}</textarea>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">¼����Ա
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" 
														class="form-control"  value="${dDJ02_D.LRRYMC}" readonly="readonly">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-md-3 control-label">¼������
												</label>
												<div class="col-md-9">
													<input type="text" id="text-input" 
														class="form-control"  value="<fmt:formatDate value="${dDJ02_D.LRRQ}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly="readonly">
												</div>
											</div>	
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary">
										<i class="fa fa-check-square"></i> ����
									</button>
									<a href="${path}yhgl/scewm.do?JFID=${dDJ02_D.JFID}&DDJ02_JFID=${dDJ02_D.DDJ02_JFID}" class="btn btn-primary" target="_blank">
										<i class="fa fa-list"></i> ���ɶ�ά��
									</a>
									<a class="btn btn-danger" data-dismiss="modal"
										href="javascript:history.go(-1);"> <i class="fa fa-ban"></i> ����
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
			<label><img src="${path}assets/img/logo/GB.png">Copyright �����ʷ�������Ϣ�������޹�˾</label>
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
		var ys = prompt("������ҳ��:");
		if (isNaN(ys)) {
			alert("����������");
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
				MC : {
					validators : {
						notEmpty : {
							message : '���Ʋ���Ϊ��'
						}
					}
				},
				XZQHMC : {
					validators : {
						notEmpty : {
							message : '������������Ϊ��'
						}
					}
				},
				DZ : {
					validators : {
						notEmpty : {
							message : '��ַ����Ϊ��'
						}
					}
				},
				SR : {
					validators : {
						notEmpty : {
							message : '���ղ���Ϊ�գ�yyyy-mm-dd��'
						},
						date : {
							format : 'YYYY-MM-DD',
							message : '���ڸ�ʽ����ȷ��yyyy-mm-dd��'
						}
					}
				},
				XL : {
					validators : {
						notEmpty : {
							message : '��ѡ��ѧ��'
						}
					}
				},
				JTRK : {
					validators : {
						notEmpty : {
							message : '�������ͥ�˿�'
						},
						regexp : {
							regexp : /^[0-9\.]+$/,
							message : 'ֻ����������'
						}
					}
				},
				RJSR : {
					validators : {
						notEmpty : {
							message : '������벻��Ϊ��'
						},
						regexp : {
							regexp : /^[0-9\.]+$/,
							message : 'ֻ����������'
						}
					}
				},
				YX : {
					validators : {
						emailAddress : {
							message : '�����ʽ����ȷ'
						}
					}
				},
				LX_SJ : {
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
							message : '�ؿ����Ʋ���Ϊ��'
						}
					}
				},
				DLX : {
					validators : {
						notEmpty : {
							message : '��ѡ��ؿ�����'
						}
					}
				},
				NZW : {
					validators : {
						notEmpty : {
							message : '��ѡ��ũ����'
						}
					}
				},
				NZW_MC : {
					validators : {
						notEmpty : {
							message : '��������������'
						}
					}
				},
				MJ : {
					validators : {
						notEmpty : {
							message : '�������Ϊ��'
						},
						regexp : {
							regexp : /^[0-9\.]+$/,
							message : 'ֻ����������'
						}
					}
				},
				JD : {
					validators : {
						stringLength : {
							min : 1,
							max : 9,
							message : '���ܵ���һλ���Ȳ��ܳ�����λ'
						},
						regexp : {
							regexp : /^[0-9\.]+$/,
							message : '��ʽ����ֻ����������С����'
						}
					}
				},
				WD : {
					validators : {
						stringLength : {
							min : 1,
							max : 9,
							message : '���ܵ���һλ���Ȳ��ܳ�����λ'
						},
						regexp : {
							regexp : /^[0-9\.]+$/,
							message : '��ʽ����ֻ����������С����'
						}
					}
				}
			}
		});
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
		autoclose: true,
		language : 'zh-CN',
		todayBtn : true,
		forceParse : false
	});
</script>
</html>