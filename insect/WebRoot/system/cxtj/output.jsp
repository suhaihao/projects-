<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="查询输出列定义" />
</jsp:include>
<div class="mod">
	<div class="mod-bd">
		<form name="f1" method="post">
			<div style="scrollbar-shadow-color:white;scrollbar-base-color:menu;scrollbar-arrow-color:black;overflow-Y:scroll;word-Break:break-all;height:295px">
				<table class="w">
					<tr>
						<td class="tc"><div class="cell-wrap">列名</div></td>
					</tr>
					<%
						String dbbzb_cx_jfid = request.getParameter("dbbzb_cx_jfid");
						String dbbzb_cx_lrry = request.getParameter("dbbzb_cx_lrry");
						String dbbzb_cx_zt = request.getParameter("dbbzb_cx_zt");
						User user = (User) session.getAttribute("user");
						String sqlStr = "";
						sqlStr = sqlStr + " select dbbzb_jg.jfcolname jfcolname ";
						sqlStr = sqlStr + " from dbbzb_cx_sc,dbbzb_cx,dbbzb,dbbzb_jg";
						sqlStr = sqlStr + " where dbbzb_cx_sc.jfdbbzb_cx_id='"
								+ dbbzb_cx_jfid + "' ";
						sqlStr = sqlStr + "		and dbbzb_cx_sc.jfdbbzb_cx_id=dbbzb_cx.jfid ";
						sqlStr = sqlStr + "		and dbbzb_cx_sc.jfdbbzb_jg_id =dbbzb_jg.jfid ";
						sqlStr = sqlStr + "		and dbbzb_cx.jfdbbzb_id=dbbzb.jfid ";
						sqlStr = sqlStr + " order by dbbzb_cx_sc.jfid ";

						QueryConnection qc = new QueryConnection();
						Statement stmt = qc.con.createStatement();
						ResultSet rs = stmt.executeQuery(sqlStr);
						while (rs.next()) {
					%>
					<tr>
						<td><div class="cell-wrap"><%=rs.getString("jfcolname")%></div></td>
					</tr>
					<%
						}
						rs.close();
						stmt.close();
						qc.close();
					%>
					<tr>
						<td class="tc p5">
							<%
								if (user.getUserjfid().equals(dbbzb_cx_lrry) && "0".equals(dbbzb_cx_zt)) {
							%>
							<input class="btn" type="button" value="编辑" onclick="return f_edit()">
							<%
								}
							%>
						</td>
					</tr>
				</table>
			</div>
		</form>
		<script type="text/javascript">
		function f_edit(){
			var url = "output_update.jsp?dbbzb_cx_jfid=<%=dbbzb_cx_jfid%>";
			new_win = window.open(url,"newwindow", "height=320,width=420,left=400,toolbar=no,menubar=yes,scrollbars=yes,resizable=yes,location=no,status=no");
			new_win.focus();
		}
		</script>
	</div>
</div>
<!-- end content -->
<%@include file="/footer_nocopy.jsp"%>
