<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="病虫情报" />
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
					<td><div class="cell-wrap">类别</div></td>
					<td><div class="cell-wrap">标题</div></td>
					<td><div class="cell-wrap">发布日期</div></td>
					<td><div class="cell-wrap">状态</div></td>
				</tr>
			</thead>
			<mt:sheet pagesize="20">
			<tr>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/bcqbAction.do?ACT_TYPE=DETAIL&id=<mt:vlabel name="d:jfid:str:s"/>"><mt:index/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/bcqbAction.do?ACT_TYPE=DETAIL&id=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:lb:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/bcqbAction.do?ACT_TYPE=DETAIL&id=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:bt:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/bcqbAction.do?ACT_TYPE=DETAIL&id=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:fbrq:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/bcqbAction.do?ACT_TYPE=DETAIL&id=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:zt:str:s"/></a></div></td>
			</tr>
			</mt:sheet>
			<tr>
				<td colspan="7">
				<div class="cell-wrap"><mt:pagenavigate/></div>
				</td>
			</tr>
		</table>
	</div>
</div>

<%@include file="/footer_nocopy.jsp"%>
