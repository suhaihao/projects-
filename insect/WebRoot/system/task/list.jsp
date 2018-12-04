<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="任务管理" />
</jsp:include>

<div class="mod">
<!--
<div class="mod-hd">
	<h3 class="mod-tit">
		任务管理
	</h3>
</div>
-->
	<div class="mod-bd">
		<table class="w">
			<thead>
				<tr>
					<td><div class="cell-wrap">序号</div></td>
					<td><div class="cell-wrap">任务名称</div></td>
					<td><div class="cell-wrap">正常填报日期</div></td>
					<td><div class="cell-wrap">开始提示日期</div></td>
					<td><div class="cell-wrap">开始填报日期</div></td>
					<td><div class="cell-wrap">正常截止填报日期</div></td>
					<td><div class="cell-wrap">逾期截止填报日期</div></td>
					<td><div class="cell-wrap">实际填报日期</div></td>
					<td><div class="cell-wrap">任务状态</div></td>
					<td><div class="cell-wrap">执行状态</div></td>
				</tr>
			</thead>
			<mt:sheet pagesize="20">
			<tr>
				<td><div class="cell-wrap"><mt:index/></div></td>
				<td><div class="cell-wrap"><a href="javascript:detail('<mt:vlabel name="d:jfid:str:s"/>')"><mt:vlabel name="d:rwmc:str:s"/></a></div></td>
				<td><div class="cell-wrap"><mt:vlabel name="d:tbrq:str:s"/></div></td>
				<td><div class="cell-wrap"><mt:vlabel name="d:kstsrq:str:s"/></div></td>
				<td><div class="cell-wrap"><mt:vlabel name="d:kstbrq:str:s"/></div></td>
				<td><div class="cell-wrap"><mt:vlabel name="d:jztbrq:str:s"/></div></td>
				<td><div class="cell-wrap"><mt:vlabel name="d:jzcbrq:str:s"/></div></td>
				<td><div class="cell-wrap"><mt:vlabel name="d:sjtbrq:str:s"/></div></td>
				<td><div class="cell-wrap"><mt:vlabel name="d:rwzt:str:s"/></div></td>
				<td><div class="cell-wrap"><mt:vlabel name="d:zxzt:str:s"/></div></td>
			</tr>
			</mt:sheet>
			<tr>
				<td colspan="10">
				<div class="cell-wrap"><mt:pagenavigate/></div>
				</td>
			</tr>
		</table>
		<script type="text/javascript">
			function detail(id) {
				parent.window.location = "/insect/systask.do?ACT_TYPE=MODIFY&jfid=" + id;
			}
		</script>
	</div>
</div>

<%@include file="/footer_nocopy.jsp"%>
