<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="数据填报" />
</jsp:include>

<div class="mod">
	<div class="mod-bd">
		<table class="w">
			<thead>
				<tr>
					<td><div class="cell-wrap">序号</div></td>
					<td><div class="cell-wrap">类别</div></td>
					<td><div class="cell-wrap">任务名称</div></td>
					<td><div class="cell-wrap">表名</div></td>
					<td><div class="cell-wrap">地区</div></td>
					<td><div class="cell-wrap">（正常/逾期）截止填报日期</div></td>
					<td><div class="cell-wrap">状态</div></td>
				</tr>
			</thead>
			<mt:sheet pagesize="20">
			<tr class="<mt:vlabel name="d:style:str:s"/>">
				<td><div class="cell-wrap"><mt:index/></div></td>
				<td><div class="cell-wrap"><mt:vlabel name="d:gzlb:str:s"/></div></td>
				<td><div class="cell-wrap"><a href="javascript:void(0);" onclick="report('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:dbbzb_id:str:s"/>','<mt:vlabel name="d:dyid:str:s"/>','<mt:vlabel name="d:style:str:s"/>','<mt:vlabel name="d:BBZT:str:s"/>','<mt:vlabel name="d:SHBZ:str:s"/>')"><mt:vlabel name="d:rwmc:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a href="javascript:void(0);" onclick="report('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:dbbzb_id:str:s"/>','<mt:vlabel name="d:dyid:str:s"/>','<mt:vlabel name="d:style:str:s"/>','<mt:vlabel name="d:BBZT:str:s"/>','<mt:vlabel name="d:SHBZ:str:s"/>')"><mt:vlabel name="d:bbmc:str:s"/></a></div></td>
				<td><div class="cell-wrap"><mt:vlabel name="d:bmbm:str:s"/></div></td>
				<td><div class="cell-wrap"><mt:vlabel name="d:gzrq:str:s"/></div></td>
				<td><div class="cell-wrap"><mt:vlabel name="d:zxzt:str:s"/></div></td>
			</tr>
			</mt:sheet>
			<tr>
				<td colspan="6">
				<div class="cell-wrap"><mt:pagenavigate/></div>
				</td>
			</tr>
		</table>
		<script type="text/javascript">
			function report(rwid,zbid,dyid,lb,bbzt,shbz){
				if (lb == "repeat") {
					lb = "chb";
				} else if (lb == "miss") {
					lb = "lb";
				} else if (lb == "urge") {
					lb = "cb";
				} else {
					lb = "zc";
				}
				if(dyid) {
					window.open("/insect/scblei.do?ACT_TYPE=Q"+zbid+"&zbid=" + zbid + "&rwid=" + rwid + "&lb=" + lb + "&jfid=" + dyid+"&bbzt="+bbzt+"&shbz="+shbz,"report_update","");
				} else {
					window.open("/insect/scblei.do?ACT_TYPE=Q"+zbid+"&zbid=" + zbid + "&rwid=" + rwid + "&lb=" + lb + "&jfid=" + dyid+"&bbzt="+bbzt+"&shbz="+shbz,"report_update","");
				}
			}
		</script>
	</div>
</div>

<%@include file="/footer_nocopy.jsp"%>
