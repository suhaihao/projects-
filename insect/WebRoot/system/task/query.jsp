<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="任务管理" />
</jsp:include>

<!-- start content -->
<div id="content">
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
	
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
            	<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">任务管理</h3>
					</div>
					<div class="mod-bd">
		                <form id="f1" name="f1" method="post" action="/insect/systask.do?ACT_TYPE=QUERY" target="result">
							<table class="w">
								<tr >
									<td class="tr" align="right" width="45%">
										<div class="cell-wrap">类别:</div>
									</td>
									<td align="left">
										<select name="lb" style="width:105px">
											<option value="1">系统生成</option>
											<option value="2">手动生成</option>
											<option selected="selected" value="all">全部</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="tr" align="right">
										<div class="cell-wrap">任务名称:</div>
									</td>
									<td align="left">
										<input type="text" name="rwmc" style="width:210px">
									</td>
								</tr>
								<tr>
									<td class="tr" align="right">
										<div class="cell-wrap">区县:</div>
									</td>
									<td align="left">
										<mt:freeselect name="bmbm" datamember="dsys05" select="JFDEPTCODE,JFDEPTNAME" where="JFDEPTPROP='1' or JFDEPTPROP='2' and jfstate='1'" sort="JFDEPTCODE" other="style='width:105px'"></mt:freeselect>
									</td>
								</tr>
								<tr>
									<td class="tr" align="right">
										<div class="cell-wrap">报表名称:</div>
									</td>
									<td align="left">
										<input type="text" id="bbmc" name="bbmc" style="width:210px" />
										<input type="hidden" id="dbbzb_id" name="dbbzb_id" />
										<a href="javascript:f_bbxz()">选择</a>
									</td>
								</tr>
								<tr>
									<td class="tr" align="right">
										<div class="cell-wrap">任务状态:</div>
									</td>
									<td align="left">
										<select name="rwzt" style="width:105px">
											<option value="0">初始</option>
											<option value="1">发布</option>
											<option selected="selected" value="all">全部</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="tr" align="right">
										<div class="cell-wrap">执行状态:</div>
									</td>
									<td align="left">
										<select name="zxzt" style="width:105px">
											<option value="0">未填报</option>
											<option value="1">已填报未上报</option>
											<option value="2">正常上报</option>
											<option value="3">迟报</option>
											<option value="4">漏报</option>
											<option selected="selected" value="all">全部</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="tr" align="right">
										<div class="cell-wrap">上报日期:</div>
									</td>
									<td align="left">
										<input type="text" id="sbrq_b" name="sbrq_b" style="width:100px" readonly="readonly" class="Wdate" onFocus="WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })" onkeyup="changeiput(this)" />
										<!-- 
										<img src="/insect/images/datePicker.gif" width="16" height="22" align="absmiddle" style="cursor:pointer" class="Wdate" onFocus="WdatePicker({el:'sbrq_b'})" onkeyup="changeiput(this)" />
										 -->
										至
										<input type="text" id="sbrq_e" name="sbrq_e" style="width:100px" readonly="readonly" class="Wdate" onFocus="WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })" onkeyup="changeiput(this)" />
										<!-- 
										<img src="/insect/images/datePicker.gif" width="16" height="22" align="absmiddle" style="cursor:pointer"  class="Wdate" onFocus="WdatePicker({el:'sbrq_e'})" onkeyup="changeiput(this)" />
										 -->
									</td>
								</tr>
								<tr>
									<td colspan="2" class="tc p10">
										<input type="button" value="增加" class="btn" onclick="window.location='/insect/system/task/add.jsp'" />&nbsp;
										<input type="submit" value="查询" class="btn" />&nbsp;
										<input type="reset" value="重置" class="btn" />&nbsp;
										<input type="button" value="任务生成" class="btn" id="benGen" />
									</td>
								</tr>
							</table>
							<div id="selectYear" style="display:none;" title="任务生成">
								<table class="w">
									<tr>
										<td class="tc">
											<div class="cell-wrap">选择年度:
											<mt:freeselect id="nd" datamember="DSYS11" select="JFCODE,JFCODENAME" where="JFSORT='BBYEAR'" sort="JFCODE" />
											</div>
										</td>
									</tr>
								</table>
							</div>
						</form>
					</div>
				</div>
				<script type="text/javascript">
					function iFrameHeight() {
						var ifm= document.getElementById("result");
						var subWeb = document.frames ? document.frames["result"].document : ifm.contentDocument;
						if(ifm != null && subWeb != null) {
							ifm.height = subWeb.body.scrollHeight;
						}
					}
					$("#benGen").on("click",function(){
						$("#selectYear").dialog({
						    height: 170,
						    width: 300,
						    buttons: [{text: "确定", click:function(){
							    	if($("#nd").val()) {
							    		$("#f1").attr("action", "/insect/systask.do?ACT_TYPE=GENTASK&nd=" + $("#nd").val());
							    		$("#f1").attr("target", "_self");
							    		$("#f1").submit();
							    	}else {
								    	alert("请选择生成任务的年度");
							    	}
							    	}}]
						}).show();
					});
				</script>
				<iframe id="result" name="result" style="width:100%;border:0px;" scrolling="no" onload="iFrameHeight()" src="/insect/systask.do?ACT_TYPE=QUERY"></iframe>
        	</div>
    	</div>
		<!-- menu -->
		<div class="layout-sub">
			<div class="layout-wrap">
				<%@include file="/menu.jsp"%>
			</div>
		</div>
	</div>
</div>
<mt:messagedialog/>
<!-- end content -->
<%@include file="/footer.jsp"%>
