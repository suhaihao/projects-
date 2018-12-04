<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jf"%>
<link href="${path}/assets/css/bootstrapValidator.min.css"
	rel="stylesheet">
<meta charset="GBK">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<div class="navbar" role="navigation">
	<div class="container-fluid">
		<ul class="nav navbar-nav navbar-actions navbar-left">
			<li class="visible-md visible-lg"><a href="#"
				id="main-menu-toggle"><i class="fa fa-th-large"></i></a></li>
			<li class="visible-xs visible-sm"><a href="#" id="sidebar-menu"><i
					class="fa fa-navicon"></i></a></li>
		</ul>
		<label
			style="color: black;font-family: 'LiSu';font-size:2vw;text-align: center;width: auto;">蔬菜专防服务管理系统━专防组织</label>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown visible-md visible-lg"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"> <jf:if
						test="${not empty sessionScope.user.ZPLJ}">
						<img class="user-avatar" src="${path}${sessionScope.user.ZPLJ}">
					</jf:if> ${sessionScope.user.JFNAME}
			</a></li>
			<li class="dropdown visible-md visible-lg"><a
				href="javascript:void(0);" onclick="xgmm()" class="dropdown-toggle"
				data-toggle="dropdown"><i class="fa fa-asterisk"></i></a></li>
			<li><a href="${path}/shiro/logout.do"><i
					class="fa fa-power-off"></i></a></li>
		</ul>
	</div>
</div>
<!-- 修改密码Model -->
<div class="modal fade" id="UserUpModel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">修改当前用户密码</h4>
			</div>
			<form id="UserUpPasswordfrom" action="${path}/yhgl/upmm.do"
				method="post" class="form-horizontal">
				<div class="modal-body">
					<!-- 表单 -->
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h2>
										<i class="fa fa-indent red"></i><strong>修改当前用户密码</strong>
									</h2>
								</div>
								<div class="panel-body">
									<div class="form-group">
										<label class="col-md-3 control-label">旧密码 <i
											style="color: red">*</i>
										</label>
										<div class=" col-md-9">
											<input type="password" id="password-input"
												name="OLDJFPASSWORD" class="form-control"
												placeholder="请输入旧密码">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">新密码 <i
											style="color: red">*</i>
										</label>
										<div class=" col-md-9">
											<input type="password" id="password-input" name="JFPASSWORD"
												class="form-control" placeholder="请输入新密码">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">确认密码 <i
											style="color: red">*</i>
										</label>
										<div class=" col-md-9">
											<input type="password" id="password-input"
												name="confirmPassword" class="form-control"
												placeholder="请输入确认密码">
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
						onclick="tjxgmmhd()">
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
<!--[if !IE]>-->
<script src="${path}/assets/js/jquery-2.1.1.min.js"></script>
<!--[if !IE]>-->
<script type="text/javascript">
	window.jQuery
			|| document
					.write("<script src='${path}/assets/js/jquery-2.1.1.min.js'>"
							+ "<"+"/script>");
</script>
<script src="${path}/assets/js/bootstrapValidator.min.js"></script>
<script type="text/javascript">
	function tjxgmmhd() {
		var bootstrapValidator = $("#UserUpPasswordfrom").data(
				'bootstrapValidator');
		//手动触发验证
		bootstrapValidator.validate();
		if (bootstrapValidator.isValid()) {
			$.ajax({
				type : "post",
				url : "/Myssm/preven/xgmm.do",
				data : $('#UserUpPasswordfrom').serialize(),
				dataType : "Text",
				async : false,
				error : function(XMLResponse) {
				},
				success : function(data) {
					if (data == '-1') {
						alert("输入的旧密码不正确");
					} else {
						alert(data);
						window.location.reload();
					}
				}
			});
		}
	}
	function xgmm() {
		$("#UserUpModel").modal("show");
	}
	$(function() {
		$('#UserUpPasswordfrom').bootstrapValidator({
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				OLDJFPASSWORD : {
					validators : {
						notEmpty : {
							message : '旧密码不能为空'
						}
					}
				},
				JFPASSWORD : {
					validators : {
						notEmpty : {
							message : '新密码不能为空'
						}
					}
				},
				confirmPassword : {
					validators : {
						notEmpty : {
							message : '确认密码不能为空'
						},
						identical : {
							field : 'JFPASSWORD',
							message : '和新密码不一致'
						}
					}
				}
			}
		});
	});
</script>
