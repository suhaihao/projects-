<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="�û��޸�" />
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
						<h3 class="mod-tit">�û��޸�</h3>
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
  <td align="right" ><div class="cell-wrap">�û����룺</div></td>
  <td  width="400px"align="left">
        <mt:vinput name="dfirm_zhg:jfcode:str:s" other="size='50' maxlength='100'"/>
  </td>
</tr>
<tr>
  <td align="right" ><div class="cell-wrap">�û����ƣ�</div></td>
  <td  width="400px"align="left">
    <mt:vinput name="dfirm_zhg:jfname:str:s" other="size='50' maxlength='100'"/>
  </td>
</tr>
    <tr>
      <td align="right"><div class="cell-wrap">��������:</div></td>
      <td >
         <span style="width:130px;border:1px solid #797a98">
           <mt:vselect name="dfirm_zhg:JFDSYS05_CODE:str:s" datamember="dsys05" chname="��������" nullable="no" select="JFDEPTCODE,JFDEPTNAME" where=" 1=1 " other="style='width:135px;margin:-2px'">
           </mt:vselect>
        </span>
      </td>
    </tr>
<tr>
  <td align="right" ><div class="cell-wrap">�û�����</div></td>
  <td  width="400px"align="left">
    <mt:vinput name="dfirm_zhg:jfuserid:str:s" other="size='50' maxlength='100'"/>
  </td>
</tr>
<tr>
  <td align="right" ><div class="cell-wrap">���룺</div></td>
  <td  width="400px"align="left">
    <mt:vinput name="dfirm_zhg:jfpassword:str:s" other="size='50' maxlength='10'"/>
  </td>
</tr>
    <tr>
      <td align="right"><div class="cell-wrap">״&nbsp;&nbsp;&nbsp;&nbsp;̬:</div></td>
      <td >
        <span style="width:180px;border:1px solid #797a98">
        <mt:vfreeselect chname="����״̬" name="dfirm_zhg:JFSTATE:str:s" nullable="no" optvalue="0:1" opttext="����:ʹ��">
          </mt:vfreeselect>
      </span>
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
       document.f1.action = "/insect/userAction.do?ACT_TYPE=UPDATE";
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
  window.document.location.replace("/insect/userAction.do?ACT_TYPE=DETAIL&jfid="+jfid);
}

</script>
<mt:successrefresh successMes="�ɹ�!"/>
