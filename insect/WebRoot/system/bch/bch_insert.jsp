<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<%@page language="java"   session="true"   import="com.jf.bchyj.bean.User" %>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="���Ӳ��溦" />
</jsp:include>
<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="8050" name="c"/>
	</jsp:include>
	
	
	
	<!-- no menu page -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">���Ӳ��溦</h3>
					</div>
					<div class="mod-bd">
					<form name="f1" method="post" action="">
						<table class="w">
							<colgroup>
								<col style="width:50%">
								<col>
							</colgroup>
<tr>
  <td align="right" ><div class="cell-wrap">���溦���룺</div></td>
  <td  width="400px"align="left">
    <input name="JFINSECTCODE" size="30"  chname="��������" nullable="no"/>
  </td>
</tr>
<tr>
  <td align="right" ><div class="cell-wrap">���溦���ƣ�</div></td>
  <td  width="400px"align="left">
    <input name="JFINSECTNAME" size="30"  chname="��������" nullable="no"/>
  </td>
</tr>
<tr>
  <td align="right" ><div class="cell-wrap">���������ƣ�</div></td>
  <td  width="400px"align="left">
    <input name="JFLATIN" size="30"  chname="��������" nullable="no"/>
  </td>
</tr>
<tr>
  <td align="right" ><div class="cell-wrap">Ӣ�����ƣ�</div></td>
  <td  width="400px"align="left">
    <input name="JFENGLISH" size="30"  chname="��������" nullable="no"/>
  </td>
</tr>
<tr id="qx" style="display: ">
  <td align="right" ><div class="cell-wrap">���溦���</div></td>
  <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
        <mt:freeselect other="style='width:192px;margin:-2px'" name="JFSTATCODE" datamember="dbchlb" select="JFSTATCODE,JFSTATNAME" where=" JFSTATE='1' order by JFSTATCODE" >
        </mt:freeselect>
      </span>
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
      <td align="right"><div class="cell-wrap">���溦��̬����:</div></td>
      <td width="400px"align="left">       
        <textarea name="JFREMARK" cols='' rows='' ></textarea>
      </td>
    </tr>
<tr>
    <td colspan=4 class="tc p10">
	<input class='btn' style='cursor:hand'  name="U_insert" type="button" onclick="return f_save()" value="����" />
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
	function f_refreshOpener() {
		window.location = "/insect/bchAction.do?ACT_TYPE=DETAIL&zt=0&id=${id}";
		parent.opener.window.location = "/insect/system/bch/bch_query.jsp";
	}

function f_save(){
       document.f1.action = "/insect/bchAction.do?ACT_TYPE=INSERT";
       document.f1.method = "post";
       document.f1.submit();
  }
</script>
<mt:successrefresh successMes="�ύ�ɹ�"/>