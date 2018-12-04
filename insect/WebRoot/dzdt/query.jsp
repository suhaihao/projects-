<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%response.setHeader("X-UA-Compatible","IE=EmulateIE11");%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="���ӵ�ͼ��ѯ" />
</jsp:include>

<!-- start content -->
<div id="content">
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
	
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
            	<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">���ӵ�ͼ��ѯ</h3>
					</div>
					<div class="mod-bd">
					  <div style="margin-left: 45%">
		              <a href="/insect/dzdt/fxqk/query_fxqk.jsp" target="result">1���������</a><br/>
		              <a href="/insect/dzdt/dbfx/query_dbfx.jsp" target="result">2���Աȷ���</a><br/>
		              <a href="/insect/dzdt/dtys/query_dtys.jsp" target="result">3����ȷ�������</a><br/>
					  </div>
					</div>
				</div>
				<iframe id="result" name="result" style="width:100%;border:0px; " scrolling="no" onload="iFrameHeight()"></iframe>
				<script type="text/javascript">
					function iFrameHeight() {
						var ifm= document.getElementById("result");
						var subWeb = document.frames ? document.frames["result"].document : ifm.contentDocument;
						if(ifm != null && subWeb != null) {
							ifm.height = subWeb.body.scrollHeight;
						}
					}
				</script>
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
<!-- end content -->
<%@include file="/footer.jsp"%>
