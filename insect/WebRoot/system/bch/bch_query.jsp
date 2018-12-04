<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="²¡³æº¦²éÑ¯" />
</jsp:include>

<!-- start content -->
<div id="content">
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
	
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
            	<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">²¡³æº¦²éÑ¯</h3>
					</div>
					<div class="mod-bd">
		                <form name="f1" method="post" action="/insect/bchAction.do?ACT_TYPE=QUERY" target="result">
							<table class="w">
								<tr>
								
									<td class="tr" style="width:80px">
										<div class="cell-wrap">²¡³æº¦±àÂë:</div>
									</td>
									<td style="width:100px">
										<input type="text" name="bmbm" size="10">
									</td>
									<td class="tr" style="width:80px">
										<div class="cell-wrap">²¡³æº¦Ãû³Æ:</div>
									</td>
									<td style="width:100px">
										<input type="text" name="bmmc" maxlength="100">
									</td>
									<td class="tr" style="width:80px">
										<div class="cell-wrap">²¡³æº¦Àà±ð:</div>
									</td>
									<td style="width:90px">
       								 <mt:freeselect other="style='width:92px;margin:-2px'" name="lb" datamember="dbchlb" select="JFstatCODE,JFstatNAME" where=" JFstate='1' order by JFstatCODE" >
      								  </mt:freeselect>
									</td>
									<td class="tr" style="width:80px">
										<div class="cell-wrap">×´Ì¬:</div>
									</td>
									<td style="width:90px">
										<select name="zt">
											<option value="0">·ÏÆú</option>
											<option value="1">Ê¹ÓÃ</option>
											<option value="" selected="selected">È«²¿</option>
										</select>
									</td>
									<td>
										<input type="submit" value="²éÑ¯" class="btn" />&nbsp;&nbsp;
										<input name="U_add" type="submit" value=" Ôö ¼Ó "  class='btn' onclick='return f_add(this)' />
										
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
  							var p = window.open("/insect/system/bch/bch_insert.jsp","newbch");
					}
					
				</script>
				<iframe id="result" name="result" style="width:100%;border:0px;" scrolling="no" onload="iFrameHeight()" src="/insect/bchAction.do?ACT_TYPE=QUERY"></iframe>
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
