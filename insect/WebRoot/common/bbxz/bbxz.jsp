<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="报表选择" />
</jsp:include>
<%
	String lb = request.getParameter("lb");
	String sql = "";
	QueryConnection qc = new QueryConnection();
	Statement stmt = qc.con.createStatement();
	ResultSet rs = null;
	String style = "style=\"display:none\"";
	if (null != lb) {
		style = "";
	}
%>
<!-- start content -->
<div id="content">
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
            	<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">报表选择</h3>
					</div>
					<div class="mod-bd">
						<table class="w">
							<tr>
								<td style="width:40%;border-right:1px solid #000">
									<table class="w">
									<%
										sql = "SELECT JFCODE,JFREMARK FROM DSYS11 WHERE JFSORT='BBLB' AND LENGTH(JFCODE)=4 ORDER BY jfid";
										rs = stmt.executeQuery(sql);
										while (rs.next()) {
									%>
										<tr act="lb" id="<%=rs.getString(1) %>"><td style="cursor:pointer;"><div class="cell-wrap"><%=rs.getString(2) %></div></td></tr>
									<%
										}
									%>
									</table>
								</td>
								<td style="width:60%;height: 500px;" >
								<div>
									<table class="w" <%=style %>>
										<thead>
										<tr>
											<td><div class="cell-wrap">报表名称(<font style="color:red">双击选择</font>)</div></td>
										</tr>
										</thead>
										<%
										if (null != lb) {
											sql = "SELECT JFID,JFTABNAME FROM DBBZB WHERE JFSTATE='1' AND JFLB='" + lb + "'";
											rs = stmt.executeQuery(sql);
											while (rs.next()) {
										%>
										<tr act="result" id="<%=rs.getString(1) %>" title="<%=rs.getString(2) %>">
											<td><div class="cell-wrap"><%=rs.getString(2) %></div></td>
										</tr>
										<%
											}
											rs.close();
											stmt.close();
											qc.close();
											}
										%>
									</table>
								</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
        	</div>
    	</div>
	</div>
</div>
<script type="text/javascript">
$("body").css("min-height", "300px");
$("#content").css("min-height", "300px");
$("tr[act='lb']").on("click", function(){
	window.location = "/insect/common/bbxz/bbxz.jsp?lb=" + $(this).attr("id");
});
$("tr[act='result']").on("dblclick", function(){
	/*if (window.opener != undefined) {
		window.opener.returnValue = $(this).attr("id") + "," + $(this).attr("title");
	} else {
		window.returnValue = $(this).attr("id") + "," + $(this).attr("title");
	}*/
	$(window.opener.document).find("#dbbzb_id").val($(this).attr("id"));
	$(window.opener.document).find("#bbmc").val($(this).attr("title"));
	window.close();
});
</script>
<!-- end content -->
<%@include file="/footer_nocopy.jsp"%>
