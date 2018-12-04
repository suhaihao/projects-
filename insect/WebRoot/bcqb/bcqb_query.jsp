<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="�����鱨" />
</jsp:include>

<!-- start content -->
<div id="content">
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
	
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
            	<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">�����鱨</h3>
					</div>
					<div class="mod-bd">
		                <form name="f1" method="post" action="/insect/bcqbAction.do?ACT_TYPE=QUERY" target="result">
							<table class="w" >
								<tr>
									<td class="tr" style="width:5%;" align="left">
										<div class="cell-wrap">���:</div>
									</td>
									<td style="width:width:5%;" align="left">
										<select name="lb">
											<option value="02" selected="selected">ȫ��</option>
											<option value="01">����</option>
											<option value="03">ȫ��</option>
											<option value="04">����ʡ��</option>
											<option value="" >ȫ��</option>
										</select>
									</td>
									<td class="tr" style="width:5%;" align="left">
										<div class="cell-wrap">����:</div>
									</td>
									<td style="width:width:10%;" align="left">
										<input type="text" name="bt" maxlength="100">
									</td>
									<td class="tr" style="width:5%;" align="left">
										<div class="cell-wrap">״̬:</div>
									</td>
									<td style="width:width:5%;" align="left">
										<select name="lb">
											<option value="0">��ʼ</option>
											<option value="1">����</option>
											<option value="" selected="selected">ȫ��</option>
										</select>
									</td>
									<td align="left" style="width:35%; padding: 5px;">
										���ڷ�Χ:<input type="text" id="d11" name="lrrq_b" class="Wdate" onFocus="WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })" onkeyup="changeiput(this)"/>��<input type="text" id="d11" name="lrrq_e" class="Wdate" onFocus="WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })" onkeyup="changeiput(this)"/>
									</td>
									<td align="left" style="width:35%;">
										<input type="submit" value="��ѯ" class="btn" />&nbsp;&nbsp;
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
				<iframe id="result" name="result" style="width:100%;border:0px;" scrolling="no" onload="iFrameHeight()" src="/insect/bcqbAction.do?ACT_TYPE=QUERY"></iframe>
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
