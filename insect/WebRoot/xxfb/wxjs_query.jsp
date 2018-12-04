<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="文献检索" />
</jsp:include>

<!-- start content -->
<div id="content">
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
	
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
            	<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">文献检索</h3>
					</div>
					<div class="mod-bd">
		                <form name="f1" method="post" action="/insect/wxjs_Action.do?ACT_TYPE=QUERY" target="result">
							<table class="w" >
								<tr>
								    <td class="tr" style="width:5%;">
										<div class="cell-wrap">标题:</div>
									</td>
									<td align="left" style="width:10%;">
										<input type="text" name="bt" maxlength="">
									</td>
									<td class="tr" style="width:5%;">
										<div class="cell-wrap">状态:</div>
									</td>
									<td align="left" style="width:5%;" >
										<select name="lb">
											<option value="0">初始</option>
											<option value="1">发布</option>
											<option value="" selected="selected">全部</option>
										</select>
									</td>
									<td class="tr" style="width:5%;">
										<div class="cell-wrap">日期范围:</div>
									</td>
									<td align="left" style="width:25%;">
										<input type="text" id="d11" name="lrrq_b" class="Wdate" onFocus="WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })" onkeyup="changeiput(this)"/>至<input type="text" id="d11" name="lrrq_e" class="Wdate" onFocus="WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })" onkeyup="changeiput(this)"/>
									</td>
									<td align="left" style="width:45%;">
									    <input type="submit" value="查询" class="btn" />&nbsp;&nbsp;
										<input type="submit" value=" 增 加 "  class='btn' onclick='return f_add(this)' />
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
  							var p = window.open("/insect/xxfb/wxjs_insert.jsp","");
					}
					
				</script>
				<iframe id="result" name="result" style="width:100%;border:0px;" scrolling="no" onload="iFrameHeight()" src="/insect/wxjs_Action.do?ACT_TYPE=QUERY"></iframe>
        	</div>
    	</div>
	</div>
</div>
<!-- end content -->
<%@include file="/footer.jsp"%>
