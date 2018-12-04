<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="�ɼ����ݲ�ѯ" />
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
						<h3 class="mod-tit">�ɼ����ݲ�ѯ</h3>
					</div>
					<div class="mod-bd">
						<form name="f1" method="post" action="">
							<table class="w">
								<thead>
									<tr>
										<td><div class="cell-wrap">���</div></td>
										<td><div class="cell-wrap">��ѯ����</div></td>
										<td><div class="cell-wrap">��ѯ���</div></td>
										<td><div class="cell-wrap">������Ա</div></td>
										<td><div class="cell-wrap">��������</div></td>
										<td><div class="cell-wrap">״̬</div></td>
									</tr>
								</thead>
								<mt:sheet pagesize="200">
								<tr>
									<td><div class="cell-wrap">
										<a href="/insect/sjcx/sjcx_query.jsp?dbbzb_cx_jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:index/></a>
									</div></td>
									<td><div class="cell-wrap">
										<a href="/insect/sjcx/sjcx_query.jsp?dbbzb_cx_jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:jfname:str:s"/></a>
									</div></td>
									<td><div class="cell-wrap">
										<a href="/insect/sjcx/sjcx_query.jsp?dbbzb_cx_jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:jfattribute:str:s"/></a>
									</div></td>
									<td><div class="cell-wrap">
										<a href="/insect/sjcx/sjcx_query.jsp?dbbzb_cx_jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:jflister:str:s"/></a>
									</div></td>
									<td><div class="cell-wrap">
										<a href="/insect/sjcx/sjcx_query.jsp?dbbzb_cx_jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:jflistdate:str:s"/></a>
									</div></td>
									<td><div class="cell-wrap">
										<a href="/insect/sjcx/sjcx_query.jsp?dbbzb_cx_jfid=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:jfstate:str:s"/></a>
									</div></td>
								</tr>
								</mt:sheet>
								<tr>
									<td colspan="6" class="tc p10">
										<!-- <input class="btn" type=button value="��ѯ" onclick="">&nbsp; -->
										<input class="btn" type=button value="�ر�"	onclick="window.close()">
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
