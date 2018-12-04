<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="信息发布" />
</jsp:include>

<!-- start content -->
<div id="content">
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
	
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
            	<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">信息发布</h3>
					</div>
					<div class="mod-bd">
		                <form name="f1" method="post" action="" target="result">
							<table class="w">
								<tr>
								
									<td class="tr" style="width:180px">
										<div class="cell-wrap">类别:</div>
									</td>
									<td style="width:190px" align="center">
										<select name="lb">
											<option value="0">病虫情报</option>
											<option value="1">测报规范</option>
											<option value="2" selected="selected">通知公告</option>
											<option value="3">文献检索</option>
										</select>
									</td>
									<td >
										<input type="button" value="确定" class="btn" onclick='f_add(this)' />
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
						var lb = document.f1.lb.value;
						if(lb=="0"){
  							var p = window.open("/insect/xxfb/bcqb_query.jsp","newbcqb");
  						}
						if(lb=="1"){
  							var p = window.open("/insect/xxfb/cbgf_query.jsp","newcbgf");
  						}
						if(lb=="2"){
  							var p = window.open("/insect/xxfb/tzgg_query.jsp","newtzgg");
  						}
  						if(lb=="3")
  						{
  						    var p = window.open("/insect/xxfb/wxjs_query.jsp");
  						}
					}
					
				</script>
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
