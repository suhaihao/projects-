<%@ page language="java" pageEncoding="GBK"%>
<%@page import="java.util.Map"%>
<%
	String id = request.getParameter("c"); // �˵�id
	//String path = request.getParameter("p");
	String last = request.getParameter("last"); // ���һ��
	Object obj = session.getAttribute("BREADCRUMB"); // session�д洢�ĵ�����Ϣ��Map����
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
			"<li class=\"home\"> <a title=\"��ҳ\" href=\"/insect/index.jsp\">��ҳ</a></li>" + 
			"<li> <a href=\"#\">" + first +"</a></li>");
		if (null == last) {
			out.print("<li> <span>" + second + "</span></li>");
		} else {
			out.print("<li> <a href=\"#\">" + second + "</a></li><li> <span>" + last + "</span></li>");
		}
		out.print("</ol></div>");
	}
%>
