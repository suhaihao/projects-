<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="信息浏览-北京市植物保护站" />
</jsp:include>
<style>
 table td{
  border-bottom: 1px solid gray;
  }
</style>
<!-- start content -->
<div id="content">
	<div class="breadcrumb"><ol><li class="home"> <a title="首页" href="/insect/index.jsp">首页</a></li><li> <span>信息浏览</span></li></ol></div>
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
				<div class="mod">
					<div class="mod-bd">
						<table class="w">
							<thead>
								<tr>
									<td><div class="cell-wrap">序号</div></td>
									<td><div class="cell-wrap">标题</div></td>
									<td><div class="cell-wrap">发布日期</div></td>
								</tr>
							</thead>
							<mt:sheet pagesize="30">
							<tr>
								<td><div class="cell-wrap"><mt:index/></div></td>
								<td><div class="cell-wrap"><a target="_blank" href="/insect/index/xxll_detail.jsp?id=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:bt:str:s"/></a><span class="new" style="display:<mt:vlabel name="d:isnew:str:s"/>">NEW</span></div></td>
								<td><div class="cell-wrap"><mt:vlabel name="d:fbrq:str:s"/></div></td>
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
