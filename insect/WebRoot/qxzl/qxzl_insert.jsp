<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="��������¼��" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="7010" name="c"/>
	</jsp:include>
	<!-- no menu page -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">������������</h3>
					</div>
					<div class="mod-bd">
					<form name="f1" method="post" action="">
						<table class="w">
<tr>
  <td width="30%" class="tr"><div class="cell-wrap">����վ�㣺</div></td>
  <td  width="20%"><div class="cell-wrap">
<span style="width:180px;border:1px solid #797a98">
	<mt:freeselect other="style='width:192px;margin:-2px'" name="JFSTATIONCODE" datamember="dsys11" select="JFCODE,JFCODENAME" where=" jfsort='ZDBM' order by JFCODE" >
	</mt:freeselect>
</span>
       </div>
  </td>
  <td width="10%" class="tr"><div class="cell-wrap">���ڣ�</div></td>
  <td  width="40%"><div class="cell-wrap">
    <input name="jfdate" size="30"  /></div>
  </td>
</tr>
<tr>
  <td width="30%" class="tr"><div class="cell-wrap">��ѹ0.1mb/hpa��</div></td>
  <td  width="20%"><div class="cell-wrap">
    <input name="JFPP" size="30"  /></div>
  </td>
  <td width="10%" class="tr"><div class="cell-wrap">ƽ������0.1��C��</div></td>
  <td  width="40%"><div class="cell-wrap">
    <input name="JFTT" size="30"  /></div>
  </td>
</tr>
<tr>
  <td width="30%" class="tr"><div class="cell-wrap">�������0.1��C��</div></td>
  <td  width="20%"><div class="cell-wrap">
    <input name="JFTMAX" size="30"  /></div>
  </td>
  <td width="10%" class="tr"><div class="cell-wrap">�������0.1��C��</div></td>
  <td  width="40%"><div class="cell-wrap">
    <input name="JFTMIN" size="30"  /></div>
  </td>
</tr>
<tr>
  <td width="30%" class="tr"><div class="cell-wrap">ƽ�����ʪ�ȣ���</div></td>
  <td  width="20%"><div class="cell-wrap">
    <input name="JFRH" size="30"  /></div>
  </td>
  <td width="10%" class="tr"><div class="cell-wrap">��ˮ0.1mm��</div></td>
  <td  width="40%"><div class="cell-wrap">
    <input name="JFRR" size="30"  /></div>
  </td>
</tr>
<tr>
  <td width="30%" class="tr"><div class="cell-wrap">��߷���0.1m/s��</div></td>
  <td  width="20%"><div class="cell-wrap">
    <input name="JFFMAX" size="30"  /></div>
  </td>
  <td width="10%" class="tr"><div class="cell-wrap">����</div></td>
  <td  width="40%"><div class="cell-wrap">
    <input name="JFDD" size="30"  /></div>
  </td>
</tr>
<tr>
  <td width="30%" class="tr"><div class="cell-wrap">ƽ������0.1m/s��</div></td>
  <td  width="20%"><div class="cell-wrap">
    <input name="JFFF" size="30"  /></div>
  </td>
  <td width="10%" class="tr"><div class="cell-wrap">ƽ������0.1��C��</div></td>
  <td  width="40%"><div class="cell-wrap">
    <input name="JFDK0" size="30"  /></div>
  </td>
</tr>
<tr>
  <td width="30%" class="tr"><div class="cell-wrap">��ߵ���0.1��C��</div></td>
  <td  width="20%"><div class="cell-wrap">
    <input name="JFDMAX" size="30"  /></div>
  </td>
  <td width="10%" class="tr"><div class="cell-wrap">��͵���0.1��C��</div></td>
  <td  width="40%"><div class="cell-wrap">
    <input name="JFDMIN" size="30"  /></div>
  </td>
</tr>
<tr>
  <td width="30%" class="tr"><div class="cell-wrap">5CM����0.1��C��</div></td>
  <td  width="20%"><div class="cell-wrap">
    <input name="JFDK5" size="30"  /></div>
  </td>
  <td width="10%" class="tr"><div class="cell-wrap">10CM����0.1��C��</div></td>
  <td  width="40%"><div class="cell-wrap">
    <input name="JFDK10" size="30"  /></div>
  </td>
</tr>
<tr>
  <td width="30%" class="tr"><div class="cell-wrap">15CM����0.1��C��</div></td>
  <td  width="20%"><div class="cell-wrap">
    <input name="JFDK15" size="30"  /></div>
  </td>
  <td width="10%" class="tr"><div class="cell-wrap">20CM����0.1��C��</div></td>
  <td  width="40%"><div class="cell-wrap">
    <input name="JFDK20" size="30"  /></div>
  </td>
</tr>
<tr>
  <td width="30%" class="tr"><div class="cell-wrap">����ʱ��0.1hp��</div></td>
  <td  width="20%"><div class="cell-wrap">
    <input name="JFS" size="30"  /></div>
  </td>
</tr>
<tr>
    <td colspan=4 class="tc p10">
	<input class='btn' style='cursor:hand'  name="U_insert" type="button" onclick="return f_save()" value="�� ��" />&nbsp;
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
       document.f1.action = "/insect/qxzlAction.do?ACT_TYPE=INSERT";
       document.f1.method = "post";
       document.f1.submit();
  }
</script>
<mt:messagedialog/>