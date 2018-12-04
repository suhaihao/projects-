<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="������ʾ-������ֲ�ﱣ��վ" />
</jsp:include>
<!-- start content -->
<div id="content">
	<div class="breadcrumb"><ol><li class="home"> <a title="��ҳ" href="/insect/index.jsp">��ҳ</a></li><li> <span>������ʾ</span></li></ol></div>
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
				<div class="mod">
					<div class="mod-bd">
						<table class="w">
							<thead>
								<tr>
									<td><div class="cell-wrap">���</div></td>
									<td><div class="cell-wrap">��������</div></td>
									<td><div class="cell-wrap">��ʼ�����</div></td>
								</tr>
							</thead>
							<mt:sheet pagesize="30">
							<tr>
								<td><div class="cell-wrap"><mt:index/></div></td>
								<td><div class="cell-wrap"><mt:vlabel name="d:bbmc:str:s"/></div></td>
								<td><div class="cell-wrap"><mt:vlabel name="d:kstbrq:str:s"/></div></td>
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
