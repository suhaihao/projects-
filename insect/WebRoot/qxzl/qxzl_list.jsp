<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="气象资料录入" />
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
						<form id="f1" name="f1" method="post" action="">
		<table class="w">
			<thead>
				<tr>
					<td><div class="cell-wrap">序号</div></td>
					<td><div class="cell-wrap">气象站点</div></td>
					<td><div class="cell-wrap">日期</div></td>
					<td><div class="cell-wrap">平均气温0.1°C</div></td>
					<td><div class="cell-wrap">平均相对湿度％</div></td>
					<td><div class="cell-wrap">日照时数0.1hp</div></td>
					<td><div class="cell-wrap">删除</div></td>
				</tr>
			</thead>
			<mt:sheet pagesize="20">
			<tr>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/qxzlAction.do?ACT_TYPE=DETAIL&jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:index/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/qxzlAction.do?ACT_TYPE=DETAIL&jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:JFSTATIONCODE:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/qxzlAction.do?ACT_TYPE=DETAIL&jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:JFDATE:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/qxzlAction.do?ACT_TYPE=DETAIL&jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:JFTT:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/qxzlAction.do?ACT_TYPE=DETAIL&jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:JFRH:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/qxzlAction.do?ACT_TYPE=DETAIL&jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:JFS:str:s"/></a></div></td>
										<td><div class="cell-wrap">
											<input type="checkbox" name="chkdel" value="<mt:vlabel name="d:jfid:str:s"/>" >
											<input type="hidden" name="jfid" value="<mt:vlabel name="d:jfid:str:s"/>">
										</div></td>
			</tr>
			</mt:sheet>
			<tr>
				<td colspan="7">
				<div class="cell-wrap"><mt:pagenavigate/></div>
				</td>
			</tr>
								<tr>
									<td class="tc p10" colspan="7">
										<input class="btn" type="button" value="删除" onclick="f_del()" />
										<%--<input type=button value="查询" onclick="">
										<input type=button value="返回" onclick="">--%>
									</td>
								</tr>
		</table>
						</form>
	</div>
</div>

<%@include file="/footer_nocopy.jsp"%>
<script type="text/javascript">

function f_del() {
	var chked = false;
	$("input[type=checkbox]").each(function(){
		if(this.checked){
			chked = true;
		}
	});
	if(chked){
		if(f_confirm()){
			$("#f1").attr("action", "/insect/qxzlAction.do?ACT_TYPE=DELETE");
			$("#f1").submit();
		} else {
			$("input[type=checkbox]").each(function(){
				$(this).attr("checked",false);
			});
		}
	} else {
		alert("请先选中再删除");
	}
}

</script>
						