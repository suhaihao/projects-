<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="�û���ѯ" />
</jsp:include>

<!-- start content -->
<div id="content">
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
	
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
            	<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">�û���ѯ</h3>
					</div>
					<div class="mod-bd">
		                <form name="f1" method="post" action="/insect/userAction.do?ACT_TYPE=QUERY" target="result">
							<table class="w">
								<tr>
									<td class="tr" align="right" width="50%">
										<div class="cell-wrap">�û�����:</div>
									</td>
									<td align="left">
										<input type="text" name="jfuserid" style="width:210px">
									</td>
								</tr>
								<tr>
									<td class="tr" align="right">
										<div class="cell-wrap">�û�����:</div>
									</td>
									<td align="left">
										<input type="text" name="jfname" style="width:210px">
									</td>
								</tr>
								<tr>
									<td class="tr" align="right">
										<div class="cell-wrap">��������:</div>
									</td>
									<td align="left">
      									  <mt:freeselect other="style='width:162px;margin:-2px'" name="bmbm" datamember="dsys05" select="JFDEPTCODE,JFDEPTNAME" where=" 1=1 order by JFDEPTCODE" >
     								   </mt:freeselect>
									</td>
								</tr>
								<tr>
									<td class="tr" align="right">
										<div class="cell-wrap">״̬:</div>
									</td>
									<td align="left">
										<select name="zt">
											<option value="0">����</option>
											<option value="1">ʹ��</option>
											<option value="" selected="selected">ȫ��</option>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="tc p10">
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
  							var p = window.open("/insect/system/user/user_insert.jsp","newuser");
					}
					
				</script>
				<iframe id="result" name="result" style="width:100%;border:0px;" scrolling="no" onload="iFrameHeight()" src="/insect/userAction.do?ACT_TYPE=QUERY"></iframe>
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
