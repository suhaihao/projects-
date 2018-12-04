<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="报表查询定义" />
</jsp:include>
	
<div class="mod">
<!-- 
	<div class="mod-hd">
		<h3 class="mod-tit">报表查询定义</h3>
	</div>
 -->
	<div class="mod-bd">
		<form name="f1" method="post">
			<table class="w">
				<thead>
					<tr>
						<td><div class="cell-wrap">序号</div></td>
						<td><div class="cell-wrap">编码</div></td>
						<td><div class="cell-wrap">表名</div></td>
						<td><div class="cell-wrap">制表人</div></td>
						<td><div class="cell-wrap">制表日期</div></td>
						<td><div class="cell-wrap">状态</div></td>
					</tr>
				</thead>
				<mt:sheet pagesize="20">
					<tr>
						<td><div class="cell-wrap"><mt:index/></div></td>
						<td><div class="cell-wrap"><a href="javascript:f_list('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:jftabname:str:s"/>')"><mt:vlabel name="d:jfcode:str:s"/></a></div></td>
						<td><div class="cell-wrap"><a href="javascript:f_list('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:jftabname:str:s"/>')"><mt:vlabel name="d:jftabname:str:s"/></a></div></td>
						<td><div class="cell-wrap"><a href="javascript:f_list('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:jftabname:str:s"/>')"><mt:vlabel name="d:rymc:str:s"/></a></div></td>
						<td><div class="cell-wrap"><a href="javascript:f_list('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:jftabname:str:s"/>')"><mt:vlabel name="d:lrrq:str:s"/></a></div></td>
						<td><div class="cell-wrap"><a href="javascript:f_list('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:jftabname:str:s"/>')"><mt:vlabel name="d:jfstate:str:s"/></a></div></td>
					</tr>
				</mt:sheet>
				<tr>
					<td colspan="6"><div class="cell-wrap"><mt:pagenavigate/></div></td>
				</tr>
				<tr>
					<td class="tc p10" colspan="6">
						<input type="button" class="btn" value="查询" />
					</td>
				</tr>
			</table>
			<script type="text/javascript">
				function f_list(id,bb){
					//window.location = "/insect/system/cxtj/bbcx_list.jsp?jfid=" + id + "&bb=" + encodeURIComponent(encodeURIComponent(bb));
					window.open("/insect/system/cxtj/bbcx_list.jsp?jfid=" + id + "&bb=" + encodeURIComponent(encodeURIComponent(bb)),"bbcxdy_list","");
					//window.location = "/insect/sysbbcx.do?ACT_TYPE=LIST&jfid=" + id + "&bb=" + bb;
				}
			</script>
		</form>
	</div>
</div>
<!-- end content -->
<%@include file="/footer_nocopy.jsp"%>
