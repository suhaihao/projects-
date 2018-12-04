<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mt.database.extend.ExecuteConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%-- import header --%>
<% String zt = request.getParameter("zt"); %>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="֪ͨ����" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="6010" name="c"/>
	</jsp:include>
	
	<%
	String id=(String)request.getAttribute("ID");
	ExecuteConnection ec = new ExecuteConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String zw="";
	try {
		String sql = "select zw from dtzgg_zw where DYID='"+id+"' order by to_number (jfid) ";
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
						<h3 class="mod-tit">֪ͨ����</h3>
					</div>
					<div class="mod-bd">
					<form name="f1" method="post" action="">
						<table class="w">
							<colgroup>
								<col style="width:50%">
								<col>
							</colgroup>
<mt:mastersheet>
<mt:uinput id="dtzgg:jfid:str:P" name="dtzgg:jfid:str:P" type="hidden"/>
    <tr>
      <td align="right"><div class="cell-wrap">����:</div></td>
      <td width="400px"align="left">
		<mt:ulabel name="dzj12:bt:str:s"/>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">�ؼ���:</div></td>
      <td width="400px"align="left">
		<mt:ulabel name="dzj12:gjc:str:s"/>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">��������:</div></td>
      <td width="400px"align="left">
		<mt:ulabel name="dzj12:fbrq:str:s"/>
      </td>
    </tr>
    <tr>
       <td align="center" colspan="2">
      <%=zw %>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">����:</div></td>
      <td >
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
      <input name="confirm" type="button" class="btn" style="cursor:hand" onclick="javascript:window.close()" id="confirm" value=" �� �� ">
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
