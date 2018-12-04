<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="区县任务详细-北京市植物保护站" />
</jsp:include>
<!-- start content -->
<div id="content">
	<div class="breadcrumb"><ol><li class="home"> <a title="首页" href="/insect/index.jsp">首页</a></li><li> <span>区县任务详细</span></li></ol></div>
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">区县任务详细</h3>
					</div>
					<div class="mod-bd">
						<table class="w">
							<mt:sheet pagesize="1">
							<tr>
								<td width="30%" class="tr"><div class="cell-wrap">
									区县:
								</div></td>
								<td width="20%"><div class="cell-wrap">
									<mt:vlabel name="d:qx:str:s"/>
								</div></td>
								<td width="20%" class="tr"><div class="cell-wrap">
									年度:
								</div></td>
								<td width="30%"><div class="cell-wrap">
									<mt:vlabel name="d:nd:str:s"/>
								</div>
								</td>
							</tr>
							<tr>
								<td class="tr"><div class="cell-wrap">
									报表名称:
								</div></td>
								<td colspan="3"><div class="cell-wrap">
									<mt:vlabel name="d:bbmc:str:s"/>
								</div></td>
							</tr>
							<tr>
								<td class="tr"><div class="cell-wrap">
									任务名称:
								</div></td>
								<td colspan="3"><div class="cell-wrap">
									<mt:vlabel name="d:rwmc:str:s"/>
								</div></td>
							</tr>
							<tr>
								<td width="30%" class="tr"><div class="cell-wrap">
									上报日期:
								</div></td>
								<td width="20%"><div class="cell-wrap">
									<mt:vlabel name="d:tbrq:str:s"/> (月-日)
								</div></td>
								<td width="20%" class="tr"><div class="cell-wrap">
								</div></td>
								<td width="30%"><div class="cell-wrap">
								</div></td>
							</tr>
							<tr>
								<td width="30%" class="tr"><div class="cell-wrap">
									开始提示天数:
								</div></td>
								<td width="20%"><div class="cell-wrap">
									<mt:vlabel name="d:kststs:str:s"/>
								</div></td>
								<td width="20%" class="tr"><div class="cell-wrap">
									开始填报天数:
								</div></td>
								<td width="30%"><div class="cell-wrap">
									<mt:vlabel name="d:kstbts:str:s"/>
								</div></td>
							</tr>
							<tr>
								<td width="30%" class="tr"><div class="cell-wrap">
									截止填报天数:
								</div></td>
								<td width="20%"><div class="cell-wrap">
									<mt:vlabel name="d:jztbts:str:s"/>
								</div></td>
								<td width="20%" class="tr"><div class="cell-wrap">
									截止催报天数:
								</div></td>
								<td width="30%"><div class="cell-wrap">
									<mt:vlabel name="d:jzcbts:str:s"/>
								</div></td>
							</tr>
							<tr>
								<td width="30%" class="tr"><div class="cell-wrap">
									实际填报日期:
								</div></td>
								<td width="20%"><div class="cell-wrap">
									<mt:vlabel name="d:sjtbrq:str:s"/>
								</div></td>
								<td width="20%" class="tr"><div class="cell-wrap">
									执行状态:
								</div></td>
								<td width="30%"><div class="cell-wrap">
									<mt:vlabel name="d:zxzt:str:s"/>
								</div></td>
							</tr>
							<tr>
								<td width="30%" class="tr"><div class="cell-wrap">
									类别:
								</div></td>
								<td width="20%"><div class="cell-wrap">
									<mt:vlabel name="d:lb:str:s"/>
								</div></td>
								<td width="20%" class="tr"><div class="cell-wrap">
									录入日期:
								</div></td>
								<td width="30%"><div class="cell-wrap">
									<mt:vlabel name="d:lrrq:str:s"/>
								</div></td>
							</tr>
							<tr>
								<td colspan="4" class="tc p10">
									<input class="btn" type="button" value="关闭" onclick="window.close()"/>
								</td>
							</tr>
						</mt:sheet>
						</table>
					</div>
				</div>
        	</div>
    	</div>
	</div>
</div>
<!-- end content -->
<%@include file="/footer.jsp"%>
