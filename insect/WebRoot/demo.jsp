<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="北京市植物保护站" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="1010" name="c"/>
	</jsp:include>
	
	<!-- menu page -->
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">Title</h3>
					</div>
					<div class="mod-bd">
						<table class="w">
							<colgroup>
								<col style="width:40%">
								<col>
							</colgroup>
							<thead>
								<tr>
									<td><div class="cell-wrap">表头1</div></td>
									<td><div class="cell-wrap">表头2</div></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><div class="cell-wrap">表体1</div></td>
									<td><div class="cell-wrap">表体2</div></td>
								</tr>
							</tbody>
							<tr>
								<td class="tc p10" colspan="2">
									<input type="button" class="btn" value="按钮" />
								</td>
							</tr>
						</table>
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
	
	<div class="tc p20">Gorgeous Split</div>
	
	<!-- no menu page -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">Title</h3>
					</div>
					<div class="mod-bd">
						<table class="w">
							<colgroup>
								<col style="width:50%">
								<col>
							</colgroup>
							<thead>
								<tr>
									<td><div class="cell-wrap">表头1</div></td>
									<td><div class="cell-wrap">表头2</div></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><div class="cell-wrap">表体1</div></td>
									<td><div class="cell-wrap">表体2</div></td>
								</tr>
							</tbody>
							<tr>
								<td class="tc p10" colspan="2">
									<input type="button" class="btn" value="按钮" />
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
