<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%@page import="com.jf.util.Function"%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="统计条件列定义" />
</jsp:include>
<div class="mod">
	<div class="mod-bd">
		<form name="f1" method="post">
			<div style="scrollbar-shadow-color:white;scrollbar-base-color:menu;scrollbar-arrow-color:black;overflow-Y:scroll;word-Break:break-all;height:295px">
			<table class="w">
				<tr>
					<td style="width:60%"><div class="cell-wrap">列名</div></td>
					<td style="width:40%"><div class="cell-wrap">运算关系</div></td>
				</tr>
				<%
					String dbbzb_tj_jfid = request.getParameter("dbbzb_tj_jfid");
					String dbbzb_tj_lrry = request.getParameter("dbbzb_tj_lrry");
					String dbbzb_tj_zt = request.getParameter("dbbzb_tj_zt");
					User user = (User) session.getAttribute("user");
					String sqlStr = "";
					sqlStr = sqlStr + " select dbbzb_jg.jfcolname jfcolname,dtjbb_tj.jfoperation jfoperation ";
					sqlStr = sqlStr + " from dtjbb,dtjbb_tj,dbbzb,dbbzb_jg";
					sqlStr = sqlStr + " where dtjbb_tj.jfdbbzb_tj_id='" + dbbzb_tj_jfid + "' ";
					sqlStr = sqlStr + "		and dtjbb_tj.jfdbbzb_tj_id=dtjbb.jfid ";
					sqlStr = sqlStr + "		and dtjbb_tj.jfdbbzb_jg_id =dbbzb_jg.jfid ";
					sqlStr = sqlStr + "		and dtjbb.jfdbbzb_id=dbbzb.jfid ";
					sqlStr = sqlStr + " order by dtjbb_tj.jfid ";

					QueryConnection qc = new QueryConnection();
					Statement stmt = qc.con.createStatement();
					ResultSet rs = stmt.executeQuery(sqlStr);
					while (rs.next()) {
				%>
				<tr>
					<td><div class="cell-wrap"><%=rs.getString("jfcolname")%></div></td>
					<td><div class="cell-wrap"><%=Function.f_state_return("dbbzb_cx_jfoperation", rs.getString("jfoperation")) %></div></td>
				</tr>
				<%
					}
					rs.close();
					stmt.close();
					qc.close();
				%>
				<tr>
					<td colspan="2" class="tc p5">
						<%
							if (user.getUserjfid().equals(dbbzb_tj_lrry) && "0".equals(dbbzb_tj_zt)) {
						%>
						<input type="button" class="btn" value="编辑" onclick="return f_edit()">
						<%
							}
						%>
					</td>
				</tr>
			</table>
			</div>
		</form>
		<script language="javascript">
		function f_edit(){
			var url = "condition_update.jsp?dbbzb_tj_jfid=<%=dbbzb_tj_jfid%>";
			new_win = window.open(url,"dbbzb_tj_tj", "height=320,width=500,left=400,toolbar=no,menubar=yes,scrollbars=yes,resizable=yes,location=no,status=no");
			new_win.focus();
		}
		</script>
	</div>
</div>
<!-- end content -->
<%@include file="/footer_nocopy.jsp"%>
