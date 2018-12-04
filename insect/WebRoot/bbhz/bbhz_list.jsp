<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="采集数据统计" />
</jsp:include>
<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="${BBMC}" name="last"/>
	</jsp:include>
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">采集数据统计</h3>
					</div>
					<div class="mod-bd">
						<form name="f1" method="post" action="">
							<table class="w">
								<thead>
									<tr>
										<td><div class="cell-wrap">序号</div></td>
										<td><div class="cell-wrap">查询名称</div></td>
										<td><div class="cell-wrap">查询类别</div></td>
										<td><div class="cell-wrap">制作人员</div></td>
										<td><div class="cell-wrap">制作日期</div></td>
										<td><div class="cell-wrap">状态</div></td>
									</tr>
								</thead>
								<mt:sheet pagesize="200">
								<tr>
									<td><div class="cell-wrap">
										<a href="/insect/bbhz/bbhz_query.jsp?dbbzb_tj_jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:index/></a>
									</div></td>
									<td><div class="cell-wrap">
										<a href="/insect/bbhz/bbhz_query.jsp?dbbzb_tj_jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:jfname:str:s"/></a>
									</div></td>
									<td><div class="cell-wrap">
										<a href="/insect/bbhz/bbhz_query.jsp?dbbzb_tj_jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:jfattribute:str:s"/></a>
									</div></td>
									<td><div class="cell-wrap">
										<a href="/insect/bbhz/bbhz_query.jsp?dbbzb_tj_jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:jflister:str:s"/></a>
									</div></td>
									<td><div class="cell-wrap">
										<a href="/insect/bbhz/bbhz_query.jsp?dbbzb_tj_jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:jflistdate:str:s"/></a>
									</div></td>
									<td><div class="cell-wrap">
										<a href="/insect/bbhz/bbhz_query.jsp?dbbzb_tj_jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:jfstate:str:s"/></a>
									</div></td>
								</tr>
								</mt:sheet>
								<tr>
									<td colspan="6" class="tc p10">
										<!-- <input class="btn" type=button value="查询" onclick="">&nbsp; -->
										<input class="btn" type=button value="关闭"	onclick="window.close()">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
        	</div>
    	</div>
	</div>
</div>
<!-- end content -->
<%@include file="/footer.jsp"%>
