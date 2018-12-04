<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<%
	String bch_jfid = request.getParameter("jfid");
	String bchbm = request.getParameter("bchbm");
	String bchmc = new String(request.getParameter("bchmc").getBytes("8859_1")); 
%>
<%@page language="java"   session="true"   import="com.jf.bchyj.bean.User" %>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="增加病虫害作物" />
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
						<h3 class="mod-tit">增加病虫害作物</h3>
					</div>
					<div class="mod-bd">
					<form name="f1" method="post" action="">
						<table class="w">
							<colgroup>
								<col style="width:50%">
								<col>
							</colgroup>
<tr>
  <td align="right" ><div class="cell-wrap">病虫害名称：</div></td>
  <td  width="400px"align="left">
    <%=bchmc%>
    <input name="JFINSECTCODE" type="hidden" value="<%=bchbm%>"/>
    <input name="bch_jfid" type="hidden" value="<%=bch_jfid%>"/>
  </td>
</tr>
<tr id="qx" style="display: ">
  <td align="right" ><div class="cell-wrap">作物名称：</div></td>
  <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
        <mt:freeselect other="style='width:192px;margin:-2px'" name="JFPLANTCODE" datamember="dzw" select="JFPLANTCODE,JFPLANTNAME" where=" JFSTATE='1' order by JFPLANTNAME" >
        </mt:freeselect>
      </span>
  </td>
    <tr>
      <td align="right"><div class="cell-wrap">危害症状:</div></td>
      <td >       
        <textarea name="JFHARM" cols='' rows='' ></textarea>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">发病条件或生活习性:</div></td>
      <td >       
        <textarea name="JFHABIT" cols='' rows='' ></textarea>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">防治方法:</div></td>
      <td >       
        <textarea name="JFCURE" cols='' rows='' ></textarea>
      </td>
    </tr>
<tr>
    <td colspan=4 class="tc p10">
	<input class='btn' style='cursor:hand'  name="U_insert" type="button" onclick="return f_save()" value="保存" />
      <input name="confirm" type="button" class="btn" style="cursor:hand" onclick="javascript:window.close()" id="confirm" value=" 关 闭 ">
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
		window.location = "/insect/bchAction.do?ACT_TYPE=DETAIL_ZW&id=${id}";
		parent.opener.window.location = "/insect/bchAction.do?ACT_TYPE=DETAIL&id=${bch_id}";
	}

function f_save(){
       document.f1.action = "/insect/bchAction.do?ACT_TYPE=INSERT_ZW";
       document.f1.method = "post";
       document.f1.submit();
  }
</script>
<mt:successrefresh successMes="提交成功"/>