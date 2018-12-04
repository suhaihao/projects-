<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="�����û�" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="8025" name="c"/>
	</jsp:include>
	
	
	
	<!-- no menu page -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">�����û�</h3>
					</div>
					<div class="mod-bd">
					<form name="f1" method="post" action="">
						<table class="w">
							<colgroup>
								<col style="width:50%">
								<col>
							</colgroup>
<tr>
  <td align="right" ><div class="cell-wrap">�û����룺</div></td>
  <td  width="400px"align="left">
       <input type="text" id="freeselect1" chname="���ű���" nullable="no"  name="jfcode" size="30">
  </td>
</tr>
<tr>
  <td align="right" ><div class="cell-wrap">�û����ƣ�</div></td>
  <td  width="400px"align="left">
    <input name="jfname" size="30"  chname="��������" nullable="no"/>
  </td>
</tr>
    <tr>
      <td align="right"><div class="cell-wrap">��������:</div></td>
      <td width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
        <mt:freeselect other="style='width:192px;margin:-2px'" name="bmbm" datamember="dsys05" select="JFDEPTCODE,JFDEPTNAME" where=" 1=1 order by JFDEPTCODE" >
        </mt:freeselect>
      </span>
      </td>
    </tr>
<tr>
  <td align="right" ><div class="cell-wrap">�û�����</div></td>
  <td  width="400px"align="left">
    <input name="jfuserid" size="30"  chname="��������" nullable="no"/>
  </td>
    </tr>
<tr>
  <td align="right" ><div class="cell-wrap">���룺</div></td>
  <td  width="400px"align="left">
    <input name="jfpassword" size="30"  chname="��������" nullable="no"/>
  </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">״&nbsp;&nbsp;&nbsp;&nbsp;̬:</div></td>
      <td width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
        <select style="width:192px;margin:-2px" name="zt">
        	<option value="0">����</option>
        	<option value="1" selected>ʹ��</option>
        </select>
      </span>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">��&nbsp;&nbsp;&nbsp;&nbsp;ע:</div></td>
      <td class=forumRowright width="400px"align="left">       
        <textarea name="bz" cols='50' rows='3' ></textarea>
      </td>
    </tr>
<tr>
    <td colspan=4 class="tc p10">
	<input class='btn' style='cursor:hand'  name="U_insert" type="button" onclick="return f_save()" value="�� ��" />
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

 function window_onload()
{
  initcal();
}
function f_save(){
       document.f1.action = "/insect/userAction.do?ACT_TYPE=INSERT";
       document.f1.method = "post";
       document.f1.submit();
  }
</script>
<mt:messagedialog/>