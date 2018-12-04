<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="��������ͳ��-������ֲ�ﱣ��վ" />
</jsp:include>
<!-- start content -->
<div id="content">
	<div class="breadcrumb"><ol><li class="home"> <a title="��ҳ" href="/insect/index.jsp">��ҳ</a></li><li> <span>��������ͳ��</span></li></ol></div>
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
				<div class="mod">
					<div class="mod-bd">
						<table class="w">
							<thead>
								<tr>
									<td><div class="cell-wrap">����</div></td>
									<td><div class="cell-wrap">��������</div></td>
									<td><div class="cell-wrap">�ϱ�����</div></td>
									<td><div class="cell-wrap">��ʼ�����</div></td>
									<td><div class="cell-wrap">������ֹ�����</div></td>
									<td><div class="cell-wrap">���ڽ�ֹ�����</div></td>
									<td><div class="cell-wrap">ʵ�������</div></td>
									<td><div class="cell-wrap">״̬</div></td>
								</tr>
							</thead>
							<mt:sheet pagesize="30">
							<tr>
								<td><div class="cell-wrap"><mt:vlabel name="d:qx:str:s"/></div></td>
								<td id="<mt:vlabel name="d:jfid:str:s"/>" act="<mt:vlabel name="d:ztbm:str:s"/>"><div class="cell-wrap"><mt:vlabel name="d:rwmc:str:s"/></div></td>
								<td><div class="cell-wrap"><mt:vlabel name="d:tbrq:str:s"/></div></td>
								<td><div class="cell-wrap"><mt:vlabel name="d:kstbrq:str:s"/></div></td>
								<td><div class="cell-wrap"><mt:vlabel name="d:jztbrq:str:s"/></div></td>
								<td><div class="cell-wrap"><mt:vlabel name="d:jzcbrq:str:s"/></div></td>
								<td><div class="cell-wrap"><mt:vlabel name="d:sjtbrq:str:s"/></div></td>
								<td><div class="cell-wrap"><mt:vlabel name="d:zxzt:str:s"/></div></td>
							</tr>
							</mt:sheet>
							<tr>
								<td colspan="8">
								<div class="cell-wrap"><mt:pagenavigate/></div>
								</td>
							</tr>
						</table>
						<script type="text/javascript">
							$("td[act='detail']").css("cursor", "pointer");
							$("td[act='detail']").on("click", function(){
								window.open("/insect/qxrwtj.do?ACT_TYPE=DETAIL&id=" + $(this).attr("id"),"qx_rw_detail","");
							});
						</script>
					</div>
				</div>
        	</div>
    	</div>
	</div>
</div>
<!-- end content -->
<%@include file="/footer.jsp"%>
