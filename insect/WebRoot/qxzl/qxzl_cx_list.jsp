<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="��������¼��" />
</jsp:include>

<div class="mod">
	<div class="mod-bd">
		<table class="w">
			<thead>
				<tr>
					<td><div class="cell-wrap">���</div></td>
					<td><div class="cell-wrap">����վ��</div></td>
					<td><div class="cell-wrap">����</div></td>
					<td><div class="cell-wrap">ƽ������0.1��C</div></td>
					<td><div class="cell-wrap">ƽ�����ʪ�ȣ�</div></td>
					<td><div class="cell-wrap">����ʱ��0.1hp</div></td>
				</tr>
			</thead>
			<mt:sheet pagesize="20">
			<tr>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/qxzlActioncx.do?ACT_TYPE=DETAIL&jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:index/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/qxzlActioncx.do?ACT_TYPE=DETAIL&jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:JFSTATIONCODE:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/qxzlActioncx.do?ACT_TYPE=DETAIL&jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:JFDATE:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/qxzlActioncx.do?ACT_TYPE=DETAIL&jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:JFTT:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/qxzlActioncx.do?ACT_TYPE=DETAIL&jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:JFRH:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/qxzlActioncx.do?ACT_TYPE=DETAIL&jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:JFS:str:s"/></a></div></td>
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
<script type="text/javascript">

</script>
						