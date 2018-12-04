<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="病虫害管理" />
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
					<td><div class="cell-wrap">病虫害编码</div></td>
					<td><div class="cell-wrap">病虫害名称</div></td>
					<td><div class="cell-wrap">拉丁文名称</div></td>
					<td><div class="cell-wrap">英文名称</div></td>
					<td><div class="cell-wrap">病虫害类别</div></td>
					<td><div class="cell-wrap">状态</div></td>
				</tr>
			</thead>
			<mt:sheet pagesize="20">
			<tr>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/bchAction.do?ACT_TYPE=DETAIL&id=<mt:vlabel name="d:jfid:str:s"/>"><mt:index/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/bchAction.do?ACT_TYPE=DETAIL&id=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:JFINSECTCODE:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/bchAction.do?ACT_TYPE=DETAIL&id=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:JFINSECTNAME:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/bchAction.do?ACT_TYPE=DETAIL&id=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:JFLATIN:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/bchAction.do?ACT_TYPE=DETAIL&id=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:JFENGLISH:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/bchAction.do?ACT_TYPE=DETAIL&id=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:lb:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/bchAction.do?ACT_TYPE=DETAIL&id=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:JFSTATE:str:s"/></a></div></td>
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
