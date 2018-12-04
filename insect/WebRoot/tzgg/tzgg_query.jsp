<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="通知公告" />
</jsp:include>

<!-- start content -->
<div id="content">
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
	
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
            	<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">通知公告</h3>
					</div>
					<div class="mod-bd">
		                <form name="f1" method="post" action="/insect/tzggAction.do?ACT_TYPE=QUERY" target="result">
							<table class="w" >
								<tr>
								
									<td class="tr" style="width:80px">
										<div class="cell-wrap">标题:</div>
									</td>
									<td style="width:90px">
										<input type="text" name="bt" maxlength="100">
									</td>
									<td class="tr" style="width:95px">
										<div class="cell-wrap">关键词:</div>
									</td>
									<td style="width:90px" >
										<input type="text" size="20" name="gjc">
									</td>
									<td class="tr" style="width:95px">
										<div class="cell-wrap">日期范围:</div>
									</td>
									<td style="width:350px">
										<input type="text" id="d11" name="lrrq_b" class="Wdate" onFocus="WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })" onkeyup="changeiput(this)"/>至<input type="text" id="d11" name="lrrq_e" class="Wdate" onFocus="WdatePicker()" onkeyup="changeiput(this)"/>
									</td>
									<td align="center" >
										<input type="submit" value="查询" class="btn" />&nbsp;&nbsp;
										
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
				<iframe id="result" name="result" style="width:100%;border:0px;" scrolling="no" onload="iFrameHeight()" src="/insect/tzggAction.do?ACT_TYPE=QUERY"></iframe>
        	</div>
    	</div>
		<div class="layout-sub">
			<div class="layout-wrap">
				<%@include file="/menu.jsp"%>
			</div>
		</div>
	</div>
</div>
<!-- end content -->
<%@include file="/footer.jsp"%>
