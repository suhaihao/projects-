<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.jf.util.DrawTable"%>
<html>
<head><title>±®±Ì‘§¿¿</title>
<script type="text/javascript" src="/insect/javascript/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/insect/javascript/function.js"></script>
<script type="text/javascript">
var jsgs = new Array();
var gsjg = new Array();
$(document).keyup(function(event){
	//alert(event.target.id);
    f_jsgs(event.target);
});
</script>
</head>
<body>
<form name="f1">
<%
	String zbid = request.getParameter("zbid");
	DrawTable dt = new DrawTable();
	String html = dt.draw_table(zbid, "1", request);
	out.print(html);
%>
</form>
</body>
</html>