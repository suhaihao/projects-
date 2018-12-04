<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.jf.util.DrawTable"%>
<%@ include file="../system/bb/function.jsp" %>
<%
	response.setHeader("Content-disposition","attachment; filename=sjtb_export.xls");
	String zbid = request.getParameter("zbid");
	String jfid = request.getParameter("jfid");
	DrawTable dt = new DrawTable();
	dt.setJfid(jfid);
	String html = dt.draw_table_export(zbid, "2", request);
	out.print(html);
%>
<script type="text/javascript">
window.close();
</script>
