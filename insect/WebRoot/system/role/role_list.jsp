<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="角色管理" />
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
					<td><div class="cell-wrap">角色名称</div></td>
					<td><div class="cell-wrap">备注</div></td>
					<td><div class="cell-wrap">删除</div></td>
				</tr>
			</thead>
			<mt:sheet pagesize="20">
			<tr>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/roleMenuListAction.do?ACT_TYPE=QUERY&jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:index/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/roleMenuListAction.do?ACT_TYPE=QUERY&jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="dsys03:jfname:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/roleMenuListAction.do?ACT_TYPE=QUERY&jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="dsys03:bz:str:s"/></a></div></td>
				<td><div class="cell-wrap"><mt:vinputdelete type="checkbox" other="style='width:50px'" name="dsys20:jfid:str:P"/></div></td>
			</tr>
			</mt:sheet>
			<tr>
				<td colspan="5">
				<div class="cell-wrap"><mt:pagenavigate/></div>
				</td>
			</tr>
		</table>
 <TABLE class=tableBorder1 cellSpacing=1 cellPadding=5 width="95%" align=center border=0>
    <TR>
      <td>注：通过单击相应角色名称,可修改权限。</td>
    </tr>
  </table>
	</div>
</div>

<%@include file="/footer_nocopy.jsp"%>
