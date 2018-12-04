<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.jf.bchyj.bean.User"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>报表统计定义</title>
		<%@ include file="/header.jsp"%>
	</head>
	<%
		String jfid = request.getParameter("jfid");
		String bb = request.getParameter("bb");
		bb = new String(bb.getBytes("ISO-8859-1"), "UTF-8");
		User user = (User)session.getAttribute("user");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String lrrq = sdf.format(new Date());
	%>
	<body>
		<form name="f1" method="post" action="">
			<table border="0" style="width: 100%" cellpadding="1" cellspacing="1">
				<tr>
					<td class="title">
						报表统计定义
					</td>
				</tr>
			</table>
			<table border=0 style="width: 100%" cellpadding="1" cellspacing="1">
				<tr>
					<td colspan="4"></td>
				</tr>
				<tr>
					<td>查询名称</td>
					<td>
						<input type=text name="cxmc" maxlength="50"
							style="width: 100%" value="<%=bb %>">
					</td>
					<td>查询类别</td>
					<td>
						<select name="cxlb">
							<option value="1">公开</option>
							<option value="2">私有</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>制作人员</td>
					<td>
						<%=user.getUsername() %>
					</td>
					<td>制作日期</td>
					<td><%=lrrq %></td>
				</tr>
				<tr>
					<td>状态</td>
					<td>初始</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center">
						<input type="hidden" name="dbbzb_jfid" value="<%=jfid %>">
						<input class="button" type="button" value="保存" onclick="f_save()">
						<input class="button" type="button" value="返回" onclick="f_back('<%=jfid %>','<%=bb %>')">
					</td>
				</tr>
			</table>
		</form>
		<script type="text/javascript">
			function f_back(id,bb){
				window.location = "/insect/system/cxtj/bbtj_list.jsp?jfid=" + id + "&bb=" + bb;
			}
			function f_save(){
				document.forms[0].action = "/insect/sysbbtj.do?ACT_TYPE=INSERT";
				document.forms[0].submit();
			}
		</script>
	</body>
</html>
