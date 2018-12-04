<%@page import="java.sql.PreparedStatement"%>
<%@page import="mt.database.extend.ExecuteConnection"%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="function.jsp" %>
<%
	String jfid = request.getParameter("jfid");
	String zt = request.getParameter("zt");
	String msg = "";
	// 1:发布;2:取消发布;3:归档
	if ("1".equals(zt)) {
		msg = fb(jfid);
	} else if ("2".equals(zt)) {
		msg = qxfb(jfid);
	} else if ("3".equals(zt)) {
		msg = gd(jfid);
	}
	
	if ("SUCCESS".equals(msg)) {
		if ("1".equals(zt)) {
			msg = "发布成功!";
		} else if ("2".equals(zt)) {
			msg = "取消发布成功!";
		} else if ("3".equals(zt)) {
			msg = "归档成功!";
		}
	}
	out.write("<script>alert('" + msg + "');window.location='/insect/system/bb/update.jsp?jfid=" + jfid + "';</script>");
%>