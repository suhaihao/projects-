<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="���溦����޸�" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="8040" name="c"/>
	</jsp:include>
	
	
	
	<!-- no menu page -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">���溦����޸�</h3>
					</div>
					<div class="mod-bd">
					<form name="f1" method="post" action="">
						<table class="w">
							<colgroup>
								<col style="width:50%">
								<col>
							</colgroup>
    <mt:sheet pagesize="1">
<tr>
  <td align="right" ><div class="cell-wrap">���溦�����룺</div></td>
  <td  width="400px"align="left">
        <mt:vlabel name="d_hy_zx:JFstatCODE:str:s"/>
        <mt:vinput name="d_hy_zx:JFstatCODE:str:s" type="hidden"/>
  </td>
</tr>
<tr>
  <td align="right" ><div class="cell-wrap">���溦������ƣ�</div></td>
  <td  width="400px"align="left">
    <mt:vinput name="dfirm_zhg:JFstatNAME:str:s" other="size='50' maxlength='100'"/>
  </td>
</tr>
    <tr>
      <td align="right"><div class="cell-wrap">״&nbsp;&nbsp;&nbsp;&nbsp;̬:</div></td>
      <td >
        <mt:vfreeselect chname="����״̬" name="dfirm_zhg:JFSTATE:str:s" nullable="no" optvalue="0:1" opttext="����:ʹ��">
          </mt:vfreeselect>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">��&nbsp;&nbsp;&nbsp;&nbsp;ע:</div></td>
      <td class=forumRowright>       
        <mt:vtextarea name="dfirm_zhg:JFREMARK:str:s" other="cols='50' rows='3'"></mt:vtextarea>
        <mt:vinput name="dfirm_zhg:jfid:str:s" type="hidden" />
      </td>
    </tr>
    </mt:sheet>
<tr>
    <td colspan=4 class="tc p10">
        <input name="jfid" type="hidden" />
        <input name="U_find1" type="button"  style='cursor:hand' class='btn' onclick='return f_query()'  id="find" value=" �� �� "/>
      <input name="confirm" type="button" class="btn" style="cursor:hand" onclick="javascript:window.close()" id="confirm" value=" �� �� ">
	</td>
</tr>
						</table>
					</form>	
					</div>
					
				</div>
        	</div>
    	</div>
	</div>
</div>
<!-- end content -->
<%@include file="/footer.jsp"%>
<script language="javascript">
function f_query(){
       document.f1.action = "/insect/bchlbAction.do?ACT_TYPE=UPDATE";
       document.f1.method = "post";
       document.f1.submit();
  }
function window_onload()
{
  initcal();
}
<%String hybm = (String)request.getAttribute("jfid");
%>
document.f1.jfid.value=<%=hybm%>;
function f_refreshOpener()
{
  var jfid=document.f1.jfid.value;
  window.document.location.replace("/insect/bchlbAction.do?ACT_TYPE=DETAIL&jfid="+jfid);
}

</script>
<mt:successrefresh successMes="�ɹ�!"/>
