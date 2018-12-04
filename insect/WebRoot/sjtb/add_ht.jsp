<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.jf.util.DrawTable"%>
<%@ include file="../system/bb/function.jsp" %>
<%
	String zbid = request.getParameter("zbid");
	String jfid = request.getParameter("jfid");
	String bbzt = request.getParameter("bbzt");
	String msg = update(request,jfid);
	if (msg.contains("SUCCESS")) {
		String[] msgs = msg.split("@");
		if(bbzt.equals("bc"))
		{
		out.print("<script>alert(\"操作成功！\");window.opener.location.reload();window.location='/insect/scblei.do?ACT_TYPE=Q"+zbid+"&zbid=" + zbid + "&jfid=" + msgs[1] + "&rwid=" + msgs[2] + "&lb=" + msgs[3] + "&bbzt=" + msgs[4] + "'</script>");
		}
		else
		{
		out.print("<script>alert(\"操作成功！\");window.opener.location.reload();window.opener=null;window.open('','_self');window.close();</script>");
		}
	} else {
		out.print("<script>alert(\"" + msg + "\");window.location='/insect/scblei.do?ACT_TYPE=Q"+zbid+"&zbid=" + zbid + "'</script>");
	}
%>
