<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="任务录入" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="任务录入" name="last"/>
	</jsp:include>
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">任务录入</h3>
					</div>
					<div class="mod-bd">
						<form id="f1" name="f1" action="/insect/systask.do?ACT_TYPE=INSERT" method="post">
						<table class="w">
							<tr>
								<td width="30%" align="right" class="tr"><div class="cell-wrap">
									区县:
								</div></td>
								<td width="20%" align="left"><div class="cell-wrap">
									<mt:freeselect id="bmbm" name="bmbm" datamember="dsys05" select="JFDEPTCODE,JFDEPTNAME" where="JFDEPTPROP='1' or JFDEPTPROP='2' and jfstate='1'" sort="JFDEPTCODE" />
								</div></td>
								<td width="20%" class="tr" align="right"><div class="cell-wrap">
									年度:
								</div></td>
								<td width="30%" align="left"><div class="cell-wrap">
									<mt:freeselect id="nd" name="nd" datamember="DSYS11" select="JFCODE,JFCODENAME" where="JFSORT='BBYEAR'" sort="JFCODE" other=" style='width:78px'" />
								</div></td>
							</tr>
							<tr>
								<td class="tr" align="right"><div class="cell-wrap">
									报表名称:
								</div></td>
								<td colspan="3" align="left"><div class="cell-wrap">
									<input type="text" id="bbmc" name="bbmc" style="width:300px" readonly="readonly" />
									<input type="hidden" id="dbbzb_id" name="dbbzb_id" />
									<a href="javascript:f_bbxz()">选择</a>
								</div></td>
							</tr>
							<tr>
								<td width="30%" class="tr" align="right"><div class="cell-wrap">
									报表填报时间:
								</div></td>
								<td width="20%" align="left"><div class="cell-wrap">
									<a href="javascript:f_tbsjxz('bmbm','nd','dbbzb_id')">选择</a>
									<input type="hidden" id="tbrq_id" name="tbrq_id" />
								</div></td>
								<td width="20%" class="tr" align="right"><div class="cell-wrap">
									上报日期:
								</div></td>
								<td width="30%" align="left"><div class="cell-wrap">
									<input type="text" id="sbrq" name="sbrq" style="width:75px" readonly="readonly" /> (月-日)
								</div></td>
							</tr>
							<tr>
								<td class="tr" align="right"><div class="cell-wrap">
									任务名称:
								</div></td>
								<td colspan="3" align="left"><div class="cell-wrap">
									<input type="text" id="rwmc" name="rwmc" style="width:300px" />
								</div></td>
							</tr>
							<tr>
								<td width="30%" class="tr" align="right"><div class="cell-wrap">
									开始提示天数:
								</div></td>
								<td width="20%" align="left"><div class="cell-wrap">
									<input type="text" id="kststs" name="kststs" style="width:75px" readonly="readonly" />
									<!-- <input type="text" id="kststs" name="kststs" datatype="int" style="width:75px" /> -->
								</div></td>
								<td width="20%" class="tr" align="right"><div class="cell-wrap">
									开始填报天数:
								</div></td>
								<td width="30%" align="left"><div class="cell-wrap">
									<input type="text" id="kstbts" name="kstbts" style="width:75px" readonly="readonly" />
								</div></td>
							</tr>
							<tr>
								<td width="30%" class="tr" align="right"><div class="cell-wrap">
									截止填报天数:
								</div></td>
								<td width="20%" align="left"><div class="cell-wrap">
									<input type="text" id="jztbts" name="jztbts" style="width:75px" readonly="readonly" />
								</div></td>
								<td width="20%" class="tr" align="right"><div class="cell-wrap">
									截止催报天数:
								</div></td>
								<td width="30%" align="left"><div class="cell-wrap">
									<input type="text" id="jzcbts" name="jzcbts" style="width:75px" readonly="readonly" />
								</div></td>
							</tr>
							<tr>
								<td colspan="4" class="tc p10">
									<input type="hidden" id="rwzt" name="rwzt" />
									<input class="btn" type="button" value="保存" onclick="save('0')">&nbsp;
									<input class="btn" type="button" value="发布" onclick="save('1')">&nbsp;
									<input class="btn" type="button" value="返回" onclick="window.location='/insect/system/task/query.jsp'">
								</td>
							</tr>
						</table>
					</form>
					<script type="text/javascript">
						function save(zt) {
							$("#rwzt").val(zt);
							$("#f1").submit();
						}
						$("#bmbm").on("change", function(){
							if ($("#bmbm").val() && $("#bbmc").val() && $("#sbrq").val()) {
								$("#rwmc").val($("#bmbm option:selected").text() + "_" +$("#bbmc").val() + "_" +$("#sbrq").val());
							}
						});
						function valRWMC(rq){
							$("#rwmc").val($("#bmbm option:selected").text() + "_" +$("#bbmc").val() + "_" + rq);
						}
					</script>
					</div>
				</div>
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
