<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.jf.util.DrawTable"%>
<%@ include file="../system/bb/function.jsp" %>
<%
	String zbid = request.getParameter("zbid");
	String msg = "";//update(request);
	if (msg.contains("SUCCESS")) {
		String[] msgs = msg.split("@");
		out.print("<script>alert(\"²Ù×÷³É¹¦£¡\");window.location='/insect/sjtb/update.jsp?zbid=" 
				+ zbid + "&jfid=" + msgs[1] + "&rwid=" + msgs[2] + "&lb=" + msgs[3] + "&bbzt=" + msgs[4] + "'</script>");
	} else {
		out.print("<script>alert(\"" + msg + "\");window.location='/insect/sjtb/add.jsp?zbid=" + zbid + "'</script>");
	}
%>
