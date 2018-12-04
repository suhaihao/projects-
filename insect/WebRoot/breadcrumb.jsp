<%@ page language="java" pageEncoding="GBK"%>
<%@page import="java.util.Map"%>
<%
	String id = request.getParameter("c"); // 菜单id
	//String path = request.getParameter("p");
	String last = request.getParameter("last"); // 最后一级
	Object obj = session.getAttribute("BREADCRUMB"); // session中存储的导航信息，Map类型
	if (id == null) {
		id = (String) session.getAttribute("C");
	} else {
		session.setAttribute("C", id);
	}
	Map<String, String> map = null;
	String first = "", second = "";
	if (null != obj) {
		map = (Map<String, String>) obj;
	}
	if (null != map && null != id) {
		first = map.get(id.substring(0, 2));
		second = map.get(id);
		out.print(
			"<div class=\"breadcrumb\"><ol>" + 
			"<li class=\"home\"> <a title=\"首页\" href=\"/insect/index.jsp\">首页</a></li>" + 
			"<li> <a href=\"#\">" + first +"</a></li>");
		if (null == last) {
			out.print("<li> <span>" + second + "</span></li>");
		} else {
			out.print("<li> <a href=\"#\">" + second + "</a></li><li> <span>" + last + "</span></li>");
		}
		out.print("</ol></div>");
	}
%>
