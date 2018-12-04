<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="用户权限查询" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="8015" name="c"/>
	</jsp:include>
	
	
	
	<!-- no menu page -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">用户权限查询</h3>
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
									<td><div class="cell-wrap">角色名称</div></td>
									<td><div class="cell-wrap">选择</div></td>
								</tr>
							</thead>
        <mt:form name="f1" method="post" action="">
							<tbody id="tbodyData" name="tbodyData">
    <mt:sheet pagesize="200">
								<tr>
									<td><div class="cell-wrap"><mt:index other="style='width:10%;text-align:center'"/></div></td>
									<td><div class="cell-wrap"><mt:vlabel other="style='width:20%'" name="dsys03:jfname:str:s"/></div></td>
									<td><div class="cell-wrap">
									<mt:vinput type="checkbox" checkname="dsys01_dsys03:dsys20_jfid:str:S" othername="dsys03:jfid:str:S" name="dsys01_dsys03:dsys20_jfid:str:M"/>
									<mt:vinput name="dsys01_dsys03:dsys01_jfid:str:N" type="hidden"  />
									</div></td>
								</tr>
    </mt:sheet>
							</tbody>
        </mt:form>
<tr>
    <td colspan=4 align=center>
        <input name="jfid" type="hidden" />
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
     var rowcount=tbodyData.rows.length;
	 var xz=false;
	 if (rowcount == 1 )
	 {
		 if  ( f1.elements["dsys01_dsys03:dsys20_jfid:str:M"].checked==true){
			 xz=true;
		 }
     }
	else if (rowcount > 1)  {
		 for (var i=0;i<rowcount ;i++ )
		 {
         if ( f1.elements["dsys01_dsys03:dsys20_jfid:str:M"][i].checked==true) {

			   xz=true;
			   break;
		   }
		 }

	}
     if (xz==false)
     {    alert("请选择需要授权的角色!")
		 return false
     }
       document.f1.action = "/insect/userRoleListAction.do?ACT_TYPE=INSERT";
       document.f1.method = "post";
       document.f1.submit();

	}
   </script>
