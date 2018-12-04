<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="测报规范" />
</jsp:include>

<!-- start content -->
<div id="content">
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
	
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
            	<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">测报规范</h3>
					</div>
					<div class="mod-bd">
		                <form name="f1" method="post" action="/insect/cbgfQueryAction.do?ACT_TYPE=QUERY" target="result">
							<table class="w" >
								<tr>
								
									<td class="tr" style="width:5%;" align="left">
										<div class="cell-wrap">类别:</div>
									</td>
									<td style="width:width:5%;" align="left">
										<select name="lb">
											<option value="0">北京</option>
											<option value="1">全国</option>
											<option value="" selected="selected">全部</option>
										</select>
									</td>
									<td class="tr" style="width:5%;" align="left">
										<div class="cell-wrap">类型:</div>
									</td>
									<td style="width:10%;" align="left">
										<select name="lx">
											<option value="01">国家标准</option>
											<option value="02">农业行业标准</option>
											<option value="03">本市地方标准</option>
											<option value="04">本市测报办法</option>
											<option value="" selected="selected">全部</option>
										</select>
									</td>
									<td align="left" style="width:30%;">
										日期范围:<input type="text" id="d11" name="lrrq_b" class="Wdate" onFocus="WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })" onkeyup="changeiput(this)"/>至<input type="text" id="d11" name="lrrq_e" class="Wdate" onFocus="WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })" onkeyup="changeiput(this)"/>
									</td>
									<td align="left" style="width:45%;">
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
				<iframe id="result" name="result" style="width:100%;border:0px;" scrolling="no" onload="iFrameHeight()" src="/insect/cbgfQueryAction.do?ACT_TYPE=QUERY"></iframe>
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
