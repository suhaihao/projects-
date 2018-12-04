<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="����ͳ�ƶ���" />
</jsp:include>

<!-- start content -->
<div id="content">
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
	
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
            	<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">����ͳ�ƶ���</h3>
					</div>
					<div class="mod-bd">
		                <form name="f1" method="post" action="/insect/sysbbtj.do?ACT_TYPE=QUERY" target="result">
							<table class="w">
								<tr>
									<td class="tr" style="width:200px">
										<div class="cell-wrap">�������:</div>
									</td>
									<td style="width:100px">
										<input type="text" name="bbbm" style="width:95%">
									</td>
									<td class="tr" style="width:70px">
										<div class="cell-wrap">��������:</div>
									</td>
									<td style="width:200px">
										<input type="text" name="bbmc" style="width:95%">
									</td>
									<td class="tr" style="width:45px">
										<div class="cell-wrap">״̬:</div>
									</td>
									<td style="width:70px">
										<select name="zt">
											<option value="0">��ʼ</option>
											<option value="1">����</option>
											<option value="2">�鵵</option>
											<option value="" selected="selected"></option>
										</select>
									</td>
									<td>
										<input type="submit" value="��ѯ" class="btn" />&nbsp;
										<input type="reset" value="����" class="btn" />
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
				<iframe id="result" name="result" style="width:100%;border:0px;" scrolling="no" onload="iFrameHeight()" src="/insect/sysbbtj.do?ACT_TYPE=QUERY"></iframe>
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
