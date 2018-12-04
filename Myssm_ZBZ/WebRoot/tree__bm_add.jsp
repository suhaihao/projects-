<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.ssh.user.util.EHCache"%>
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
<%
	EHCache eHCache = new EHCache("ehcacheMenu_zbz");
	String bm = (String) eHCache.getCacheElement("bm");
%>
<body>
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
						<h3 class="page-header">
							<i class="fa fa-sitemap"></i>���Ź���
						</h3>
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i><a href="${path}go/index.do">��ҳ</a></li>
							<li><i class="fa fa-cogs"></i>ϵͳ����</li>
							<li><i class="fa fa-sitemap"></i>���Ź���</li>
						</ol>
					</div>
				</div>
				<!-- main -->
				<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-4">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h2>
										<i class="fa fa-sitemap red"></i><span class="break"></span><strong>������</strong>
									</h2>
									<div class="panel-actions">
										<a href="#" class="btn-minimize"><i
											class="fa fa-chevron-up"></i></a>
									</div>
								</div>
								<div class="panel-body">
									<div id="treeview1"></div>
								</div>
							</div>
						</div>
						<div class="col-lg-8">
							<div class="panel panel-default ">
								<div class="panel-heading">
									<h2>
										<i class="fa fa-sitemap red"></i><span class="break"></span><strong>�༭��</strong>
									</h2>
									<div class="panel-actions">
										<a href="#" class="btn-minimize"><i
											class="fa fa-chevron-up"></i></a>
									</div>
								</div>
								<!--�༭����Ȩ�� start-->
								<div class="panel-body">
									<form id="myfrom" action="${path}/tree/up.do" method="post"
										class="form-horizontal">
										<input type="hidden" name="JFID" id="JFID">
										<div class="form-group">
											<label class="col-md-3 control-label">�������� <span
												style="color: red">*</span></label>
											<div class="col-md-9">
												<input type="text" id="text" name="Text"
													class="form-control" placeholder="�����벿������">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">���ż��� <span
												style="color: red">*</span></label>
											<div class="col-md-9">
												<input type="text" id="BMJC" name="BMJC"
													class="form-control" placeholder="���ż���(ũҵ��1��������2���Դ�����)"
													readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">�Ƿ�ĩ�� <span
												style="color: red">*</span></label>
											<div class="col-md-9">
												<input type="text" id="SF_MJ" name="SF_MJ"
													class="form-control" placeholder="�������Ƿ�ĩ��0��1��"
													readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">��������ĸ</label>
											<div class="col-md-9">
												<input type="text" id="DH_FIRST" name="DH_FIRST"
													class="form-control" placeholder="�����벿������ĸ">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">��ϵ�绰</label>
											<div class="col-md-9">
												<input type="text" id="DH" name="DH" class="form-control"
													placeholder="��������ϵ�绰">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">������</label>
											<div class="col-md-9">
												<input type="text" id="FZR" name="FZR" class="form-control"
													placeholder="�����븺����">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">�ʱ�</label>
											<div class="col-md-9">
												<input type="text" id="YB" name="YB" class="form-control"
													placeholder="�������ʱ�">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">��ַ</label>
											<div class="col-md-9">
												<input type="text" id="DZ" name="DZ" class="form-control"
													placeholder="�������ַ">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">����ȫ��</label>
											<div class="col-md-9">
												<input type="text" id="QC" name="QC" class="form-control"
													placeholder="���������ȫ��">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">ְ������</label>
											<div class="col-md-9">
												<textarea id="BMZZ" name="BMZZ" rows="3"
													class="form-control" placeholder="˵��ʲô������"></textarea>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">��ע</label>
											<div class="col-md-9">
												<textarea id="BZ" name="BZ" rows="3" class="form-control"
													placeholder="˵��ʲô������"></textarea>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-sm btn btn-info"
												onclick="xg()">
												<i class="fa fa-edit"></i> �޸Ľڵ�
											</button>
											<button type="button"
												class="btn btn-sm btn-success btn-setting">
												<i class="fa fa-search-plus"></i> ����½ڵ�
											</button>
											<!-- 
											<button type="reset" class="btn btn-sm btn-danger"
												data-dismiss="modal">
												<i class="fa fa-ban"></i> ɾ��
											</button>
											 -->
										</div>
									</form>
								</div>
								<!--�༭����Ȩ�� end-->
							</div>
						</div>
					</div>
					<div style="display: none;" id="treeviewVal">
						<%=bm%>
					</div>
				</div>
				<!--/col-->
			</div>
		</div>
		<!-- end: Content -->
	</div>
	<!--/container-->

	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">��Ӳ���</h4>
				</div>
				<form id="elofrom2" action="${path}/tree/add.do" method="post"
					class="form-horizontal">
					<div class="modal-body">
						<!-- �� -->
						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h2>
											<i class="fa fa-indent red"></i><strong>��Ӳ���</strong>
										</h2>
									</div>
									<div class="panel-body">
										<div class="form-group">
											<label class="col-md-3 control-label">�ϼ�����ID<span
												style="color: red">*</span></label>
											<div class="col-md-9">
												<input type="text" id="PARENT_ID" name="PARENT_ID"
													class="form-control" readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">�������� <span
												style="color: red">*</span></label>
											<div class="col-md-9">
												<input type="text" name="Text" class="form-control"
													placeholder="�����벿������">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">���ż��� <span
												style="color: red">*</span></label>
											<div class="col-md-9">
												<input type="text" id="BMJCADD" name="BMJC"
													class="form-control" placeholder="���ż���(ũҵ��1��������2���Դ�����)"
													readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">�Ƿ�ĩ�� <span
												style="color: red">*</span></label>
											<div class="col-md-9">
												<input type="text" name="SF_MJ" class="form-control"
													placeholder="�������Ƿ�ĩ��0��1��">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">��������ĸ</label>
											<div class="col-md-9">
												<input type="text" name="DH_FIRST" class="form-control"
													placeholder="�����벿������ĸ">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">��ϵ�绰</label>
											<div class="col-md-9">
												<input type="text" name="DH" class="form-control"
													placeholder="��������ϵ�绰">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">������</label>
											<div class="col-md-9">
												<input type="text" name="FZR" class="form-control"
													placeholder="�����븺����">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">�ʱ�</label>
											<div class="col-md-9">
												<input type="text" name="YB" class="form-control"
													placeholder="�������ʱ�">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">��ַ</label>
											<div class="col-md-9">
												<input type="text" name="DZ" class="form-control"
													placeholder="�������ַ">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">����ȫ��</label>
											<div class="col-md-9">
												<input type="text" name="QC" class="form-control"
													placeholder="���������ȫ��">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">ְ������</label>
											<div class="col-md-9">
												<textarea name="BMZZ" rows="3" class="form-control"
													placeholder="˵��ʲô������"></textarea>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">��ע</label>
											<div class="col-md-9">
												<textarea name="BZ" rows="3" class="form-control"
													placeholder="˵��ʲô������"></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--������-->
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-success"
							onclick="tj()">
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
	<script src="${path}/assets/js/bootstrap-treeview.js"></script>

	<!-- end: JavaScript-->
</body>
<script type="text/javascript">
	function xg() {
		var bootstrapValidator = $("#myfrom").data('bootstrapValidator');
		//�ֶ�������֤
		bootstrapValidator.validate();
		if (bootstrapValidator.isValid()) {
			$.ajax({
				type : "post",
				url : "/Myssm_ZBZ/tree/up.do",
				data : $('#myfrom').serialize(),
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
	function tj() {
		if (document.getElementById("SF_MJ").value == "0") {
			var bootstrapValidator = $("#elofrom2").data('bootstrapValidator');
			//�ֶ�������֤
			bootstrapValidator.validate();
			if (bootstrapValidator.isValid()) {
				$.ajax({
					type : "post",
					url : "/Myssm_ZBZ/tree/add.do",
					data : $('#elofrom2').serialize(),
					dataType : "Text",
					async : false,
					error : function(XMLResponse) {
					},
					success : function(data) {
						alert(data);
						window.location.reload();
					}
				});
			}
		} else {
			if (document.getElementById("SF_MJ").value == "") {
				alert("��ѡ���ϼ�");
			} else {
				alert("�Ѿ�Ϊĩ�������������");
			}
		}
	}
	$(function() {
		$('#treeview1').treeview(
				{
					data : $("#treeviewVal").html(),
					levels : 1,
					color : "#428bca",
					onNodeSelected : function(event, node) {
						$("#elofrom2").data('bootstrapValidator')
								.validateField('PARENT_ID');
						$("#elofrom2").data('bootstrapValidator').updateStatus(
								'PARENT_ID', 'NOT_VALIDATED', null)
								.validateField('PARENT_ID');
						$("#elofrom2").data('bootstrapValidator')
								.validateField('BMJC');
						$("#elofrom2").data('bootstrapValidator').updateStatus(
								'BMJC', 'NOT_VALIDATED', null).validateField(
								'BMJC');
						$.ajax({
							type : "post",
							url : "/Myssm_ZBZ/tree/sel.do",
							data : {
								bmbm : node.BM
							},
							dataType : "json",
							async : false,
							error : function(XMLResponse) {
							},
							success : function(data) {
								$.each(data, function(idx, item) {
									if (idx == 'BMZZ' || idx == 'BZ') {
										$("#" + idx).val(item);
									} else {
										$("#" + idx).attr('value', item);
									}
								});
								$("#PARENT_ID").val($("#JFID").val());
								$("#BMJCADD").val(
										parseInt($("#BMJC").val()) + 1);
							}
						});
					}
				});
		$('#myfrom').bootstrapValidator({
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				Text : {
					validators : {
						notEmpty : {
							message : '�������Ʋ���Ϊ��'
						}
					}
				},
				BMJC : {
					validators : {
						notEmpty : {
							message : '���β���Ϊ��'
						},
						regexp : {
							regexp : /^[0-9_\.]+$/,
							message : 'ֻ����������'
						}
					}
				},
				SF_MJ : {
					validators : {
						notEmpty : {
							message : '�Ƿ�ĩ������Ϊ��'
						},
						stringLength : {
							min : 1,
							max : 1,
							message : 'ֻ������һλ'
						},
						regexp : {
							regexp : /^[0-1_\.]+$/,
							message : 'ֻ������0����1'
						}
					}
				},
				DH_FIRST : {
					validators : {
						regexp : {
							regexp : /^[A-Z_\.]+$/,
							message : 'ֻ�������д��ĸ'
						}
					}
				},
				DH : {
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
		$('#elofrom2').bootstrapValidator({
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				PARENT_ID : {
					validators : {
						notEmpty : {
							message : '��ѡ���ϼ�����'
						}
					}
				},
				Text : {
					validators : {
						notEmpty : {
							message : '�������Ʋ���Ϊ��'
						}
					}
				},
				BMJC : {
					validators : {
						notEmpty : {
							message : '���β���Ϊ��'
						},
						regexp : {
							regexp : /^[0-9_\.]+$/,
							message : 'ֻ����������'
						}
					}
				},
				SF_MJ : {
					validators : {
						notEmpty : {
							message : '�Ƿ�ĩ������Ϊ��'
						},
						stringLength : {
							min : 1,
							max : 1,
							message : 'ֻ������һλ'
						},
						regexp : {
							regexp : /^[0-1_\.]+$/,
							message : 'ֻ������0����1'
						}
					}
				},
				DH_FIRST : {
					validators : {
						regexp : {
							regexp : /^[A-Z_\.]+$/,
							message : 'ֻ�������д��ĸ'
						}
					}
				},
				DH : {
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
</script>
</html>