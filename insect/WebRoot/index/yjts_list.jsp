<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="工作提示-北京市植物保护站" />
</jsp:include>
<style>
 table td{
  border-bottom: 1px solid gray;
  }
</style>
<!-- start content -->
<div id="content">
	<div class="breadcrumb"><ol><li class="home"> <a title="首页" href="/insect/index.jsp">首页</a></li><li> <span>预警提示</span></li></ol></div>
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
				<div class="mod">
					<div class="mod-bd">
						<table class="w">
							<thead>
								<tr>
									<td><div class="cell-wrap">序号</div></td>
									<td><div class="cell-wrap">报表名称</div></td>
									<td><div class="cell-wrap">录入日期</div></td>
								</tr>
							</thead>
							<mt:sheet pagesize="30">
							<tr>
								<td><div class="cell-wrap"><font color="red"><mt:index/></font></div></td>
								<td><div class="cell-wrap"><a href="/insect/index_map.jsp?YJJB=<mt:vlabel name="DBBZB_YJ:YJJB:str:s"/>&JFID_BODY=<mt:vlabel name="DBBZB_YJ:JFID_BODY:str:s"/>&TNAME=<mt:vlabel name="DBBZB_YJ:TNAME:str:s"/>&LRRQ=<mt:vlabel name="DBBZB_YJ:LRRQ:str:s"/>&YJNR=<mt:vlabel name="DBBZB_YJ:YJNR:str:s"/>" target="_blank"><font color="red"><mt:vlabel name="DBBZB_YJ:YJNR:str:s"/></font></a></div></td>
								<td><div class="cell-wrap"><font color="red"><mt:vlabel name="DBBZB_YJ:LRRQ:str:s"/></font></div></td>
							</tr>
							</mt:sheet>
							<tr>
								<td colspan="3">
								<div class="cell-wrap"><mt:pagenavigate/></div>
								</td>
							</tr>
						</table>
					</div>
				</div>
        	</div>
    	</div>
	</div>
</div>
<!-- end content -->
<%@include file="/footer.jsp"%>
