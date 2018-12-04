<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="系统代码维护" />
</jsp:include>

<div class="mod">
<!--
<div class="mod-hd">
	<h3 class="mod-tit">
		病虫害数据填报
	</h3>
</div>
-->
	<div class="mod-bd">
		<table class="w">
			<thead>
				<tr>
					<td><div class="cell-wrap">序号</div></td>
					<td><div class="cell-wrap">编码</div></td>
					<td><div class="cell-wrap">汉字说明</div></td>
					<td><div class="cell-wrap">详细</div></td>
				</tr>
			</thead>
			<mt:sheet pagesize="20">
			<tr>
				<td><div class="cell-wrap"><mt:index/></a></td>
				<td><div class="cell-wrap"><mt:vlabel name="dsys10:jfsort:str:s"/></div></td>
				<td><div class="cell-wrap"><mt:vlabel name="dsys10:jfsortname:str:s"/></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/systemCodeUpdate.do?ACT_TYPE=QUERY&bmlb=<mt:vlabel name="dsys10:jfsort:str:N"/>"><mt:vlabel name="dsys10:jfsort:str:N"/></a></div></td>
			</tr>
			</mt:sheet>
			<tr>
				<td colspan="5">
				<div class="cell-wrap"><mt:pagenavigate/></div>
				</td>
			</tr>
		</table>
	</div>
</div>

<%@include file="/footer_nocopy.jsp"%>
