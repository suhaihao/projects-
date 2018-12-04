<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="用户管理" />
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
					<td><div class="cell-wrap">用户名</div></td>
					<td><div class="cell-wrap">用户名称</div></td>
					<td><div class="cell-wrap">部门名称</div></td>
					<td><div class="cell-wrap">状态</div></td>
				</tr>
			</thead>
			<mt:sheet pagesize="20">
			<tr>
				<td><div class="cell-wrap"><mt:index/></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/userAction.do?ACT_TYPE=DETAIL&jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:jfuserid:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/userRoleListAction.do?ACT_TYPE=QUERY&jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:jfname:str:s"/></a></div></td>
				<td><div class="cell-wrap"><mt:vlabel name="d:bmmc:str:s"/></div></td>
				<td><div class="cell-wrap"><mt:vlabel name="d:JFSTATE:str:s"/></div></td>
			</tr>
			</mt:sheet>
			<tr>
				<td colspan="5">
				<div class="cell-wrap"><mt:pagenavigate/></div>
				</td>
			</tr>
		</table>
  <TABLE class=w cellSpacing=1 cellPadding=5 width="95%" align=center border=0>
    <TR>
      <td>注：点击用户名进行修改；点击用户名称授权。</td>
    </tr>
  </table>
	</div>
</div>

<%@include file="/footer_nocopy.jsp"%>
