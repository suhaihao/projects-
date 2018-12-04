<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%@page import="com.jf.util.Function"%>
<%@page import="java.util.Calendar"%>
<%
	response.setHeader("X-UA-Compatible","IE=EmulateIE11");
%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="监测预警" />
</jsp:include>
<style type="text/css">
.w th {
	text-align: right;
	width: 45%;
	padding-top: 5px;
	padding-bottom: 5px;
}

.w td {
	padding-left: 15px;
	padding-top: 5px;
	padding-bottom: 5px;
}
</style>
<script type="text/javascript">
function sub(){
	if (isNaN($("#year").val())) {
		alert("年度请输出数字");
		return false;
	}
	if (isNaN($("#chong").val())) {
		alert("初始蚜量请输出数字");
		return false;
	}
	 $("#f1").submit();
}
</script>
<%
Calendar date = Calendar.getInstance();
String y=date.get(date.YEAR)+"";
%>
<div id="content">
	<jsp:include page="/breadcrumb.jsp" flush="true" />
	<!-- navigation -->
	<div class="layout grid-s5m0">
		<div class="layout-main">
			<div class="layout-wrap">
				<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">模型预测</h3>
					</div>
					<form id="f1" action="/insect/jcyj.do?ACT_TYPE=INSERT" target="result" method="post" enctype="multipart/form-data">
					<div class="mod-bd">
						<table class="w">
							<colgroup>
								<col style="width:40%"></col>
							</colgroup>
							<tr>
								<td style="text-align: right;">年度</td>
								<td style="text-align: left"><input type="text" id="year" name="year" value="<%=y %>"/></td>
							</tr>
							<tr>
								<td style="text-align: right;">初始蚜量</td>
								<td style="text-align: left"><input type="text" id="chong" name="chong" value="0"/></td>
							</tr>
							<tr>
								<td style="text-align: right;">开始日期</td>
								<td style="text-align: left"><select id="ksrq" name="ksrq"
									style="width:100px;">
										<option value="-04-20" selected="selected">04-20</option>
										<option value="-04-25">04-25</option>
										<option value="-04-30">04-30</option>
										<option value="-05-05">05-05</option>
										<option value="-05-10">05-10</option>
										<option value="-05-15">05-15</option>
										<option value="-05-20">05-20</option>
										<option value="-05-25">05-25</option>
										<option value="-05-30">05-30</option>
								</select></td>
							</tr>
							<tr>
								<td style="text-align: right;">模型构建数据</td>
								<td style="text-align: left"><input type="file" name="year" value=""/></td>
							</tr>
							<tr>
								<td style="text-align: right;">模板下载</td>
								<td style="text-align: left"><a  href="/insect/mb.xlsx" download="mb.xlsx">点击下载</a></td>
							</tr>
							<tr>
								<td class="tc p10" colspan="2"><input class="btn"
									type="button" value="确定"  onclick="sub()"/>&nbsp;</td>
							</tr>
						</table>
					</div>
					</form>
				</div>
				<div style="text-align: center;">
					<iframe src="" id="result" name="result" style="width:100%;border:0px;"
						scrolling="no" onload="iFrameHeight();"></iframe>
						<script type="text/javascript">
							function iFrameHeight() {
								var ifm = document.getElementById("result");
								var subWeb = document.frames ? document.frames["result"].document
										: ifm.contentDocument;
								if (ifm != null && subWeb != null) {
									ifm.height = subWeb.body.scrollHeight;
								}
							}
						</script>
				</div>
			</div>
		</div>
		<div class="layout-sub">
			<div class="layout-wrap">
				<%@include file="/menu.jsp"%>
			</div>
		</div>
	</div>
</div>
<%@include file="/footer.jsp"%>
