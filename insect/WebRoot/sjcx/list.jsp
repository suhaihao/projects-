<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="采集数据查询" />
</jsp:include>

<div class="mod">
<!--
<div class="mod-hd">
	<h3 class="mod-tit">
		采集数据查询
	</h3>
</div>
-->
	<div class="mod-bd">
		<table class="w">
			<!-- 
			<colgroup>
				<col style="width:5%">
				<col style="width:15%">
				<col style="width:40%">
				<col style="width:10%">
				<col style="width:15%">
				<col style="width:13%">
			</colgroup>
			 -->
			<thead>
				<tr>
					<td><div class="cell-wrap">序号</div></td>
					<td><div class="cell-wrap">报表编码</div></td>
					<td><div class="cell-wrap">表名</div></td>
					<td><div class="cell-wrap">制表人</div></td>
					<td><div class="cell-wrap">制表日期</div></td>
					<td><div class="cell-wrap">报表种类</div></td>
				</tr>
			</thead>
			<mt:sheet pagesize="20">
			<tr>
				<td><div class="cell-wrap"><a href="javascript:f_list('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:jftabname:str:s"/>')"><mt:index/></a></div></td>
				<td><div class="cell-wrap"><a href="javascript:f_list('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:jftabname:str:s"/>')"><mt:vlabel name="d:jfcode:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a href="javascript:f_list('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:jftabname:str:s"/>')"><mt:vlabel name="d:jftabname:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a href="javascript:f_list('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:jftabname:str:s"/>')"><mt:vlabel name="d:rymc:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a href="javascript:f_list('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:jftabname:str:s"/>')"><mt:vlabel name="d:lrrq:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a href="javascript:f_list('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:jftabname:str:s"/>')"><mt:vlabel name="d:bbzl:str:s"/></a></div></td>
			</tr>
			</mt:sheet>
			<tr>
				<td colspan="6">
				<div class="cell-wrap"><mt:pagenavigate/></div>
				</td>
			</tr>
		</table>
		<script type="text/javascript">
			function f_list(id,bb) {
				window.open("/insect/sjcx.do?ACT_TYPE=LIST&dbbzb_jfid=" + id + "&bbmc="+encodeURIComponent(encodeURIComponent(bb)),"sjcx_list","");
			}
		</script>
	</div>
</div>

<%@include file="/footer_nocopy.jsp"%>
