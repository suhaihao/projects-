<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="角色权限查询" />
</jsp:include>
<% String dsys20_jfid = (String) request.getAttribute("dsys20_jfid");
if(dsys20_jfid==null){dsys20_jfid="";}
%>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="8020" name="c"/>
	</jsp:include>
	
	
	
	<!-- no menu page -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">角色权限查询</h3>
					</div>
					<div class="mod-bd">
						<table class="w">
							<colgroup>
								<col style="width:50%">
								<col>
							</colgroup>
							<thead>
								<tr>
									<td><div class="cell-wrap">序号</div></td>
									<td><div class="cell-wrap">模块名称</div></td>
									<td><div class="cell-wrap">权限</div></td>
								</tr>
							</thead>
        <mt:form name="f1" method="post" action="">
							<tbody id="tbodyData" name="tbodyData">
    <mt:sheet pagesize="200">
								<tr>
									<td><div class="cell-wrap"><mt:index other="style='width:10%;text-align:center'"/></div></td>
									<td><div class="cell-wrap"><mt:vlabel other="style='width:20%'" name="dsys02_n_20:item_name:str:s"/>
									<mt:vinput othername="dsys02_n_20:dsys02n_itemid:str:P" type="hidden" name="dsys02_n_20:dsys02n_itemid:str:P"  />
									<mt:vinput othername="dsys02_n_20:dsys20_jfid:str:P" type="hidden" name="dsys02_n_20:dsys20_jfid:str:P"  />
									</div></td>
									<td><div class="cell-wrap">
									<mt:vfreeselect_max id="spec2" optmax="5" name="dsys02_n_20:jfpopedom:str:M" defaultvalue="0"
											other=" style='width:72px;margin:-2px' " optvalue="0:1:2:3" opttext="无权:查询:录入:提交">
									</mt:vfreeselect_max>									</div></td>
								</tr>
    </mt:sheet>
							</tbody>
        <input name="dsys20_jfid" type="hidden" value=<%=dsys20_jfid%> />
        </mt:form>
<tr>
    <td colspan=4 align=center>
        <input name="U_find1" type="button"  style='cursor:hand' class='btn' onclick='return f_submit()'  id="find" value=" 提 交 "/>
      <input name="confirm" type="button" class="btn" style="cursor:hand" onclick="javascript:window.close()" id="confirm" value=" 关 闭 ">
	</td>
</tr>
						</table>
					</div>
					
				</div>
        	</div>
    	</div>
	</div>
</div>
<!-- end content -->
<%@include file="/footer.jsp"%>
   <script language=javascript>
    function f_submit(){
    var dsys20_jfid = document.f1.dsys20_jfid.value;
       document.f1.action = "/insect/roleMenuListAction.do?ACT_TYPE=INSERT&dsys20_jfid="+dsys20_jfid;
       document.f1.method = "post";
       document.f1.submit();

	}
   </script>
