<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="�ⱨ�淶" />
</jsp:include>

<!-- start content -->
<div id="content">
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
	
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
            	<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">�ⱨ�淶</h3>
					</div>
					<div class="mod-bd">
		                <form name="f1" method="post" action="/insect/xxfb_cbgfQueryAction.do?ACT_TYPE=QUERY" target="result">
							<table class="w" >
								<tr>
								
									<td class="tr" style="width:5%;">
										<div class="cell-wrap">���:</div>
									</td>
									<td align="left" style="width:5%;">
										<select name="lb">
											<option value="0">����</option>
											<option value="1">ȫ��</option>
											<option value="" selected="selected">ȫ��</option>
										</select>
									</td>
									<td class="tr" style="width:5%;">
										<div class="cell-wrap">����:</div>
									</td>
									<td align="left"  style="width:10%;">
										<select name="lx">
											<option value="01">���ұ�׼</option>
											<option value="02">ũҵ��ҵ��׼</option>
											<option value="03">���еط���׼</option>
											<option value="04">���вⱨ�취</option>
											<option value="" selected="selected">ȫ��</option>
										</select>
									</td>
									<td class="tr" style="width:5%;">
										<div class="cell-wrap">���ڷ�Χ:</div>
									</td>
									<td align="left" style="width:25%;">
										<input type="text" id="d11" name="lrrq_b" class="Wdate" onFocus="WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })" onkeyup="changeiput(this)"/>��<input type="text" id="d11" name="lrrq_e" class="Wdate" onFocus="WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })" onkeyup="changeiput(this)"/>
									</td>
									<td align="left" style="width:45%;">
									    <input type="submit" value="��ѯ" class="btn" />&nbsp;&nbsp;
										<input name="U_add" type="submit" value=" �� �� "  class='btn' onclick='return f_add(this)' />
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
						function f_add(obj){
  							var p = window.open("/insect/xxfb/cbgf_insert.jsp","newcbgf_i");
					}
					
				</script>
				<iframe id="result" name="result" style="width:100%;border:0px;" scrolling="no" onload="iFrameHeight()" src="/insect/xxfb_cbgfQueryAction.do?ACT_TYPE=QUERY"></iframe>
        	</div>
    	</div>
	</div>
</div>
<!-- end content -->
<%@include file="/footer.jsp"%>
