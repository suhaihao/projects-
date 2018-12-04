<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<%response.setHeader("X-UA-Compatible","IE=EmulateIE11");%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="病虫害数据查询" />
</jsp:include>

<!-- start content -->
<div id="content">
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
	
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
            	<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">病虫害数据查询</h3>
					</div>
					<div class="mod-bd">
		                <form name="f1" method="post" action="/insect/sjcx.do?ACT_TYPE=QUERY" target="result">
							<table class="w">
								<tr>
									<td class="tr" style="width:80px">
										<div class="cell-wrap">报表类别:</div>
									</td>
									<td style="width:165px">
										<mt:freeselect id="jflb" name="jflb" datamember="dsys11" select="jfcode,jfcodename" where="jfsort='BBLB' and length(jfcode)=4" sort="jfid"></mt:freeselect>
									</td>
									<td class="tr" style="width:70px">
										<div class="cell-wrap">报表编码:</div>
									</td>
									<td style="width:100px">
										<input type="text" name="bbbm" style="width:95%">
									</td>
									<td class="tr" style="width:70px">
										<div class="cell-wrap">报表名称:</div>
									</td>
									<td style="width:200px">
										<input type="text" name="bbmc" style="width:95%">
									</td>
									<td style="text-align: left;padding-left: 20px;">
										<input type="submit" value="查询" class="btn" />&nbsp;
										<input type="reset" value="重置" class="btn" />
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<script type="text/javascript">
					function iFrameHeight() {
						var ifm= document.getElementById("result");
						var subWeb = document.frames ? document.frames["result"].document : ifm.contentDocument;
						if(ifm != null && subWeb != null) {
							ifm.height = subWeb.body.scrollHeight;
						}
					}
				</script>
				<iframe id="result" name="result" style="width:100%;border:0px;" scrolling="no" onload="iFrameHeight()" src="/insect/sjcx.do?ACT_TYPE=QUERY"></iframe>
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
