<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="���������" />
</jsp:include>

<!-- start content -->
<div id="content">
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
	
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
            	<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">���������</h3>
					</div>
					<div class="mod-bd">
		                <form id="f1" name="f1" method="post" action="/insect/tbglAction.do?ACT_TYPE=QUERY" target="result">
							<table class="w">
								<tr>
									<td class="tr" width="48%" align="right">
										<div class="cell-wrap">����No:</div>
									</td>
									<td align="left">
										<input type="text" name="bbno" style="width:210px">
									</td>
								</tr>
								<tr>
									<td class="tr" align="right">
										<div class="cell-wrap">��������:</div>
									</td>
									<td align="left">
										<input type="text" id="bbmc" name="bbmc" style="width:210px" />
										<input type="hidden" id="dbbzb_id" name="dbbzb_id" />
										<a href="javascript:f_bbxz()">ѡ��</a>
									</td>
								</tr>
								<tr>
									<td class="tr" align="right">
										<div class="cell-wrap">����:</div>
									</td>
									<td align="left">
										<mt:freeselect name="bmbm" datamember="dsys05" select="JFDEPTCODE,JFDEPTNAME" where="JFDEPTPROP='1' or JFDEPTPROP='2' and jfstate='1'" sort="JFDEPTCODE" other="style='width:105px'"></mt:freeselect>
									</td>
								</tr>
								<tr>
									<td class="tr" align="right">
										<div class="cell-wrap">�ϱ�����:</div>
									</td>
									<td align="left">
										<input type="text" id="sbrq_b" name="sbrq_b" style="width:75px" readonly="readonly" class="Wdate" onFocus="WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })" onkeyup="changeiput(this)" />
										��
										<input type="text" id="sbrq_e" name="sbrq_e" style="width:75px" readonly="readonly" class="Wdate" onFocus="WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })" onkeyup="changeiput(this)" />
									</td>
								</tr>
								<tr>
									<td colspan="2" class="tc p10">
										<input type="submit" value="��ѯ" class="btn" />&nbsp;
										<input type="reset" value="����" class="btn" />&nbsp;
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
				<iframe id="result" name="result" style="width:100%;border:0px;" scrolling="no" onload="iFrameHeight()" src="/insect/tbglAction.do?ACT_TYPE=QUERY"></iframe>
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
<mt:messagedialog/>
<!-- end content -->
<%@include file="/footer.jsp"%>
