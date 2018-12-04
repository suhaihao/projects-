<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="统计输出列定义" />
</jsp:include>
<div class="mod">
	<div class="mod-bd">
		<form name="f1" method="post">
			<div style="scrollbar-shadow-color:white;scrollbar-base-color:menu;scrollbar-arrow-color:black;overflow-Y:scroll;word-Break:break-all;height:295px">
			<table class="w">
				<tr>
					<td style="width:9%"><div class="cell-wrap">列名</div></td>
					<td style="width:9%"><div class="cell-wrap">公式</div></td>
					<td style="width:10%"><div class="cell-wrap">特殊计算列的计算方法</div></td>
					<td style="width:10%"><div class="cell-wrap">特殊计算列汉字名称</div></td>
					<td style="width:10%"><div class="cell-wrap">特殊计算列是否可点击</div></td>
					<td style="width:10%"><div class="cell-wrap">特殊计算列点击后的附加条件</div></td>
					<td style="width:10%"><div class="cell-wrap">汇总计算公式</div></td>
					<td style="width:10%"><div class="cell-wrap">汇总特殊计算列的计算方法</div></td>
					<td style="width:10%"><div class="cell-wrap">汇总特殊计算列是否可点击</div></td>
					<td style="width:12%"><div class="cell-wrap">汇总特殊计算列点击后的附加条件</div></td>
				</tr>
				<%
				String dbbzb_tj_jfid = request.getParameter("dbbzb_tj_jfid");
				String dbbzb_tj_lrry = request.getParameter("dbbzb_tj_lrry");
				String dbbzb_tj_zt = request.getParameter("dbbzb_tj_zt");
				User user = (User) session.getAttribute("user");
				String sqlStr = "";
				sqlStr = sqlStr + " select dbbzb_jg.jfcolname jfcolname,f_get_mc('BMJSGS',dtjbb_sc.jfcolgs) jfcolgs,dtjbb_sc.jfcolstate jfcolstate,dtjbb_sc.JFCOMUPTE_METHOD JFCOMUPTE_METHOD,dtjbb_sc.JFCOMUPTE_NAME JFCOMUPTE_NAME,dtjbb_sc.JFCOMUPTE_CLICK JFCOMUPTE_CLICK,dtjbb_sc.JFCOMUPTE_CONDITION JFCOMUPTE_CONDITION,dtjbb_sc.SUM_COLGS SUM_COLGS,dtjbb_sc.SUM_COMUPTE_METHOD SUM_COMUPTE_METHOD,dtjbb_sc.SUM_COMUPTE_CLICK SUM_COMUPTE_CLICK,dtjbb_sc.SUM_COMUPTE_CONDITION SUM_COMUPTE_CONDITION";
				sqlStr = sqlStr + " from dtjbb_sc,dtjbb,dbbzb,dbbzb_jg";
				sqlStr = sqlStr + " where dtjbb_sc.jfdbbzb_tj_id='" + dbbzb_tj_jfid + "' ";
				sqlStr = sqlStr + "		and dtjbb_sc.jfdbbzb_tj_id=dtjbb.jfid ";
				sqlStr = sqlStr + "		and dtjbb_sc.jfdbbzb_jg_id =dbbzb_jg.jfid ";
				sqlStr = sqlStr + "		and dtjbb.jfdbbzb_id=dbbzb.jfid";
				sqlStr = sqlStr + " order by dtjbb_sc.jfid ";
				QueryConnection qc = new QueryConnection();
				Statement stmt = qc.con.createStatement();
				ResultSet rs = stmt.executeQuery(sqlStr);
				while (rs.next()) {
				%>
				<tr>
				    <td>
				    <div class="cell-wrap">
				    <%
				       if ("1".equals(rs.getString("jfcolstate"))){ 
				           out.print("计算列");
				       }else{
				    	   out.print(rs.getString("jfcolname"));
				       }
				       %>
				    </div>
				    </td>
				    <td>
				    <div class="cell-wrap"><%=rs.getString("jfcolgs")%></div>
				    </td>
				    <!-- 新添加 -->
				    <td>
				    <div class="cell-wrap"><%=(rs.getString("JFCOMUPTE_METHOD")==null?"":rs.getString("JFCOMUPTE_METHOD"))%></div>
				    </td>
				    <td>
				    <div class="cell-wrap"><%=(rs.getString("JFCOMUPTE_NAME")==null?"":rs.getString("JFCOMUPTE_NAME"))%></div>
				    </td>
				    <td>
				    <div class="cell-wrap"><%=(rs.getString("JFCOMUPTE_CLICK")==null?"":rs.getString("JFCOMUPTE_CLICK"))%></div>
				    </td>
				    <td>
				    <div class="cell-wrap"><%=(rs.getString("JFCOMUPTE_CONDITION")==null?"":rs.getString("JFCOMUPTE_CONDITION"))%></div>
				    </td>
				    <td>
				    <div class="cell-wrap"><%=(rs.getString("SUM_COLGS")==null?"":rs.getString("SUM_COLGS"))%></div>
				    </td>
				    <td>
				    <div class="cell-wrap"><%=(rs.getString("SUM_COMUPTE_METHOD")==null?"":rs.getString("SUM_COMUPTE_METHOD"))%></div>
				    </td>
				    <td>
				    <div class="cell-wrap"><%=(rs.getString("SUM_COMUPTE_CLICK")==null?"":rs.getString("SUM_COMUPTE_CLICK"))%></div>
				    </td>
				    <td>
				    <div class="cell-wrap"><%=(rs.getString("SUM_COMUPTE_CONDITION")==null?"":rs.getString("SUM_COMUPTE_CONDITION"))%></div>
				    </td>
				    
				</tr>
				<%	
				}
				rs.close();
				stmt.close();
				qc.close();
				%>
				<tr>
					<td colspan="10" class="tc p5">
					<% if (user.getUserjfid().equals(dbbzb_tj_lrry) && "0".equals(dbbzb_tj_zt)) { %>
						<input type="button" class="btn" value="编辑" onclick="return f_edit('output')">               
					<% } %>
					</td>
				</tr>
			</table>
			</div>
		</form>
		<script type="text/javascript">
		function f_edit(){
			var url = "output_update.jsp?dbbzb_tj_jfid=<%=dbbzb_tj_jfid%>";
			new_win = window.open(url,"dbbzb_tj_sc", "height=370,width=2500,left=1500,toolbar=no,menubar=yes,scrollbars=no,resizable=yes,location=no,status=no");
			new_win.focus();
		}
		</script>
	</div>
</div>
<!-- end content -->
<%@include file="/footer_nocopy.jsp"%>
