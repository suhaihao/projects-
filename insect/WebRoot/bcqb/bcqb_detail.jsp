<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mt.database.extend.ExecuteConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%-- import header --%>
<% String zt = request.getParameter("zt"); %>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="病虫情报" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="2010" name="c"/>
	</jsp:include>
	<%
	String id=(String)request.getAttribute("ID");
	ExecuteConnection ec = new ExecuteConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String zw="";
	try {
		String sql = "select zw from dqbfb_zw where DYID='"+id+"' order by to_number (jfid) ";
		pstmt = ec.con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			zw+=rs.getString(1);
		}
		rs.close();
		pstmt.close();
		ec.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	zw=zw.replaceAll("!", "'");
	%>
	
	
	<!-- no menu page -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">病虫情报</h3>
					</div>
					<div class="mod-bd">
					<form name="f1" method="post" action="">
						<table class="w">
							<colgroup>
								<col style="width:50%">
								<col>
							</colgroup>
<mt:mastersheet>
<mt:uinput id="dqbfb:jfid:str:P" name="dqbfb:jfid:str:P" type="hidden"/>
<tr>
  <td align="right" ><div class="cell-wrap">类别：</div></td>
  <td  width="400px"align="left">
        <mt:ulabel name="dzj12:lbmc:str:s"/>
  </td>
</tr>
<tr style="display:${display_01}">
  <td align="right" ><div class="cell-wrap">区县：</div></td>
  <td  width="400px"align="left">
        <mt:ulabel name="dzj12:qxmc:str:s"/>
  </td>
</tr>
<tr style="display:${display_04}">
  <td align="right" ><div class="cell-wrap">其他省市：</div></td>
  <td  width="400px" align="left">
        <mt:ulabel name="dzj12:sfmc:str:s"/>
  </td>
</tr>
    <tr>
      <td align="right"><div class="cell-wrap">标题:</div></td>
      <td width="400px" align="left">
		<mt:ulabel name="dzj12:bt:str:s"/>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">发布日期:</div></td>
      <td width="400px" align="left">
		<mt:ulabel name="dzj12:fbrq:str:s"/>
      </td>
    </tr>
    <tr>
      <td align="center" colspan="2">
      <%=zw %>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">附件:</div></td>
      <td width="400px" align="left">
								<table class="J_xxfj">
								<mt:mastersheet detailindex="1">
									<tr><td>
										<a onclick="window.open('/insect/file_down.jsp?path=<mt:ulabel name="d:lj:str:s"/>&mc=encodeURI(<mt:ulabel name="d:wjm:str:s"/>)')" href="javascript:void(0)"><mt:ulabel name="d:wjm:str:s"/></a>
									</td></tr>
								</mt:mastersheet>
								</table>
      </td>
    </tr>
<tr>
    <td colspan=4 class="tc p10">
      <input name="confirm" type="button" class="btn" style="cursor:hand" onclick="javascript:window.close()" id="confirm" value=" 关 闭 ">
	</td>
</tr>
   </mt:mastersheet>
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
