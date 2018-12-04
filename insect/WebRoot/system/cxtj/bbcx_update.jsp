<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="报表查询定义" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
	<div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">报表查询定义</h3>
					</div>
					<div class="mod-bd">
						<form name="f1" method="post" action="">
							<mt:mastersheet>
							<table class="w">
								<tr>
									<td class="tr"><div class="cell-wrap">查询名称</div></td>
									<td><div class="cell-wrap">
										<input type=text name="cxmc" maxlength="50"
											style="width: 250px" value="<mt:ulabel name="d:jfname:str:s" />">
									</div></td>
									<td class="tr"><div class="cell-wrap">查询类别</div></td>
									<td><div class="cell-wrap">
										<mt:ufreeselect opttext="公开:私有" optvalue="0:1" name="d:jfattribute:str:s"></mt:ufreeselect>
									</div></td>
								</tr>
								<tr>
									<td class="tr"><div class="cell-wrap">制作人员</div></td>
									<td><div class="cell-wrap"><mt:ulabel name="d:lrry:str:s" /></div></td>
									<td class="tr"><div class="cell-wrap">制作日期</div></td>
									<td><div class="cell-wrap"><mt:ulabel name="d:JFLISTDATE:dat:s" /></div></td>
								</tr>
								<tr>
									<td style="width:20%" class="tr"><div class="cell-wrap">状态</div></td>
									<td style="width:30%"><div class="cell-wrap"><mt:ulabel name="d:zt:str:s" /></div></td>
									<td style="width:20%">&nbsp;</td>
									<td style="width:30%">&nbsp;</td>
								</tr>
							</table>
							<table class="w">
								<tr>
									<td style="width:30%" class="tc"><div class="cell-wrap">查询输出列</div></td>
									<td style="width:35%" class="tc"><div class="cell-wrap">查询条件列</div></td>
									<td style="width:35%" class="tc"><div class="cell-wrap">查询排序列</div></td>
								</tr>
								<tr>
									<td>
										<iframe width="100%" height="300" frameborder="0" scrolling="no" name="output" id="output" 
										src="/insect/system/cxtj/output.jsp?dbbzb_cx_jfid=<mt:ulabel name="d:jfid:str:s" />&dbbzb_cx_lrry=<mt:ulabel name="d:JFLISTER:str:s" />&dbbzb_cx_zt=<mt:ulabel name="d:jfstate:str:s" />"></iframe>
									</td>
									<td>
										<iframe width="100%" height="300" frameborder="0" scrolling="no" name="condition" id="condition" 
										src="/insect/system/cxtj/condition.jsp?dbbzb_cx_jfid=<mt:ulabel name="d:jfid:str:s" />&dbbzb_cx_lrry=<mt:ulabel name="d:JFLISTER:str:s" />&dbbzb_cx_zt=<mt:ulabel name="d:jfstate:str:s" />"></iframe>
									</td>
									<td>
										<iframe width="100%" height="300" frameborder="0" scrolling="no" name="sort" id="sort" 
										src="/insect/system/cxtj/sort.jsp?dbbzb_cx_jfid=<mt:ulabel name="d:jfid:str:s" />&dbbzb_cx_lrry=<mt:ulabel name="d:JFLISTER:str:s" />&dbbzb_cx_zt=<mt:ulabel name="d:JFSTATE:str:s" />"></iframe>
									</td>
								</tr>
								<tr>
									<td colspan="3" class="tc p10">
										<input type="hidden" name="jfid" value="<mt:ulabel name="d:jfid:str:s" />">
										<input type="hidden" id="zt" name="zt" value="">
										<input type="hidden" name="dbbzb_jfid" value="<mt:ulabel name="d:JFDBBZB_ID:str:s" />">
										<input type="button" class="btn" value="增加" onclick="f_add('<mt:ulabel name="d:JFDBBZB_ID:str:s" />','<mt:ulabel name="d:jfname:str:s" />')" />
										<input id="btnSave" class="btn" type="button" value="保存" onclick="f_save(0)">
										<input id="btnSubmit" class="btn" type="button" value="提交" onclick="f_save(1)">
										<input id="btnCancel" class="btn" type="button" value="取消提交" onclick="f_save(0)">
										<input class="btn" type="button" value="返回" onclick="f_back('<mt:ulabel name="d:JFDBBZB_ID:str:s" />','<mt:ulabel name="d:jfname:str:s" />')">
										<script type="text/javascript">
											var zt = '<mt:ulabel name="d:JFSTATE:str:s" />';
											if(zt=="1"){
												$("#btnSave").hide();
												$("#btnSubmit").hide();
											} else {
												$("#btnCancel").hide();
											}
										</script>
									</td>
								</tr>
							</table>
							</mt:mastersheet>
						</form>
						<script type="text/javascript">
							function f_back(id,bb){
								window.location = "/insect/system/cxtj/bbcx_list.jsp?jfid=" + id + "&bb=" + encodeURIComponent(encodeURIComponent(bb));
							}
							function f_add(id,bb){
								window.location = "/insect/system/cxtj/bbcx_add.jsp?jfid=" + id + "&bb=" + encodeURIComponent(encodeURIComponent(bb));
							}
							function f_save(zt){
								document.getElementById("zt").value = zt;
								document.forms[0].action = "/insect/sysbbcx.do?ACT_TYPE=UPDATE";
								document.forms[0].submit();
							}
						</script>
					</div>
				</div>
        	</div>
    	</div>
	</div>
</div>
<!-- end content -->
<%@include file="/footer.jsp"%>
