<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="地域查询" />
</jsp:include>

<!-- start content -->
<div id="content">
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
	
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
            	<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">地域查询</h3>
					</div>
					<div class="mod-bd">
		                <form name="f1" method="post" action="/insect/dyglAction.do?ACT_TYPE=QUERY" target="result">
							<table class="w">
								<tr>
								
									<td class="tr" style="width:80px">
										<div class="cell-wrap">地域编码:</div>
									</td>
									<td style="width:100px">
										<input type="text" name="bmbm" size="10">
									</td>
									<td class="tr" style="width:80px">
										<div class="cell-wrap">地域名称:</div>
									</td>
									<td style="width:100px">
										<input type="text" name="bmmc" maxlength="100">
									</td>
									<td class="tr" style="width:80px">
										<div class="cell-wrap">地域属性:</div>
									</td>
									<td style="width:90px">
										<select name="bmsx">
								        	<option value="0">近郊区</option>
								        	<option value="1">远郊区</option>
								        	<option value="" selected>全部</option>
										</select>
									</td>
									<td class="tr" style="width:80px">
										<div class="cell-wrap">状态:</div>
									</td>
									<td style="width:90px">
										<select name="zt">
											<option value="0">废弃</option>
											<option value="1">使用</option>
											<option value="" selected="selected">全部</option>
										</select>
									</td>
									<td>
										<input type="submit" value="查询" class="btn" />&nbsp;&nbsp;
										<input name="U_add" type="submit" value=" 增 加 "  class='btn' onclick='return f_add(this)' />
										
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
  							var p = window.open("/insect/system/dygl/dygl_insert.jsp","newdygl");
					}
					
				</script>
				<iframe id="result" name="result" style="width:100%;border:0px;" scrolling="no" onload="iFrameHeight()" src="/insect/dyglAction.do?ACT_TYPE=QUERY"></iframe>
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
