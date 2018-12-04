<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%@page import="java.text.SimpleDateFormat"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="气象资料录入" />
</jsp:include>

<!-- start content -->
<div id="content">
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
	
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
            	<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">气象资料录入</h3>
					</div>
					<div class="mod-bd">
		                <form name="f1" method="post" action="/insect/qxzlActioncx.do?ACT_TYPE=QUERY" target="result">
							<table class="w" >
								<tr>
									<td class="tr" style="width:80px">
										<div class="cell-wrap">气象站点:</div>
									</td>
									<td style="width:90px">
								        <span style="width:180px;border:1px solid #797a98">
								        <mt:freeselect other="style='width:192px;margin:-2px'" name="JFSTATIONCODE" datamember="dsys11" select="JFCODE,JFCODENAME" where=" jfsort='ZDBM' order by JFCODE" >
								        </mt:freeselect>
								      </span>
									</td>
									<td class="tr" style="width:80px">
										<div class="cell-wrap">日期范围:</div>
									</td>
									<td style="width:350px">
									<%
								Date dNow = new Date();   
                                Date dBefore = new Date();
                                Calendar calendar = Calendar.getInstance(); 
                                calendar.setTime(dNow);
                                calendar.add(Calendar.DAY_OF_MONTH, -31);  
                                dBefore = calendar.getTime();   
                                SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); 
                                String defaultStartDate = sdf.format(dBefore);  
                                String defaultEndDate = sdf.format(dNow); 
									 %>
										<input type="text" id="d11" name="lrrq_b" class="Wdate" onFocus="WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })" onkeyup="changeiput(this)" value="<%=defaultStartDate %>"/>至<input type="text" id="d11" name="lrrq_e" class="Wdate" onFocus="WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })" onkeyup="changeiput(this)" value="<%=defaultEndDate %>"/>
									</td>
									<td>
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
				<iframe id="result" name="result" style="width:100%;border:0px;" scrolling="no" onload="iFrameHeight()" src="/insect/qxzlActioncx.do?ACT_TYPE=QUERY"></iframe>
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
