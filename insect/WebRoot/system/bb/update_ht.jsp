<%@page import="java.sql.PreparedStatement"%>
<%@page import="mt.database.extend.ExecuteConnection"%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="function.jsp" %>
<%
	String jfid = request.getParameter("jfid");
	String zt = request.getParameter("zt");
	String msg = "";
	// 1:����;2:ȡ������;3:�鵵
	if ("1".equals(zt)) {
		msg = fb(jfid);
	} else if ("2".equals(zt)) {
		msg = qxfb(jfid);
	} else if ("3".equals(zt)) {
		msg = gd(jfid);
	}
	
	if ("SUCCESS".equals(msg)) {
		if ("1".equals(zt)) {
			msg = "�����ɹ�!";
		} else if ("2".equals(zt)) {
			msg = "ȡ�������ɹ�!";
		} else if ("3".equals(zt)) {
			msg = "�鵵�ɹ�!";
		}
	}
	out.write("<script>alert('" + msg + "');window.location='/insect/system/bb/update.jsp?jfid=" + jfid + "';</script>");
%>