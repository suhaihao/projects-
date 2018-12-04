<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%@page import="com.jf.util.Function"%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="统计方式列定义" />
</jsp:include>
<div class="mod">
	<div class="mod-bd">
<%
	String dbbzb_tj_jfid = request.getParameter("dbbzb_tj_jfid");
	String sqlStr = " select a.jfid,a.jfcolname,nvl(b.jfdbbzb_jg_id,'0'),b.jfoperation jfoperation,a.jfcolstyle jfcolstyle ";
	sqlStr = sqlStr + " from ( select dbbzb_jg.jfid jfid,dbbzb_jg.jfcolname jfcolname,dbbzb_jg.jfcolstyle jfcolstyle ";
	sqlStr = sqlStr + "        from dtjbb,dbbzb,dbbzb_jg ";
	sqlStr = sqlStr + "        where dtjbb.jfid='" + dbbzb_tj_jfid + "' ";
	sqlStr = sqlStr + "              and dtjbb.jfdbbzb_id=dbbzb.jfid ";
	sqlStr = sqlStr + "              and dbbzb_jg.jfdbbzb_id=dbbzb.jfid ";
	sqlStr = sqlStr + "      ) a ";
	sqlStr = sqlStr + "      ,(select jfdbbzb_jg_id,jfoperation,jfid from dtjbb_fs where jfdbbzb_tj_id='" + dbbzb_tj_jfid + "') b ";
	sqlStr = sqlStr + " where a.jfid=b.jfdbbzb_jg_id(+) ";
	sqlStr = sqlStr + " order by b.jfid ";
	String colListStr = "", colSelectStr = "";
	QueryConnection qc = new QueryConnection();
	Statement stmt = qc.con.createStatement();
	ResultSet rs = stmt.executeQuery(sqlStr);
	String tempstate = "";
	while (rs.next()) {
		if (!tempstate.contains(","+rs.getString(1))) {
			colListStr = colListStr + "<tr>";
			colListStr = colListStr + "<td onclick='f_div(this,"+rs.getString("jfcolstyle")+")'><div class=\"cell-wrap\">";
			colListStr = colListStr + rs.getString(2);
			colListStr = colListStr + "<input type='hidden' name='jfdbbzb_jg_id' value='"+rs.getString(1)+"'>";
			colListStr = colListStr + "</div></td>";
			colListStr = colListStr + "</tr>";
			tempstate = tempstate + "," + rs.getString(1);
		}
		if (!"0".equals(rs.getString(3))) {
			colSelectStr = colSelectStr + "<tr>";
			colSelectStr = colSelectStr + "<td onclick='f_div(this,"+rs.getString("jfcolstyle")+")'><div class=\"cell-wrap\">";
			colSelectStr = colSelectStr + rs.getString(2);
			colSelectStr = colSelectStr + "<input type='hidden' name='jfdbbzb_jg_id' value='"+rs.getString(1)+"'>";
			colSelectStr = colSelectStr + "</div></td>";
			colSelectStr = colSelectStr + "<td><div class=\"cell-wrap\">";
			if ("1".equals(rs.getString("jfcolstyle"))) {
			    colSelectStr = colSelectStr + "<select name='jfoperation'>";
			    colSelectStr = colSelectStr + Function.f_select_return(qc.con,"BMTJFS",rs.getString("jfoperation"));		
			    colSelectStr = colSelectStr + "</select>";
			}else{
			    colSelectStr = colSelectStr + "<select style='visibility:hidden;' name='jfoperation'>";
			    colSelectStr = colSelectStr + Function.f_select_return(qc.con,"BMTJFS",rs.getString("jfoperation"));
			    colSelectStr = colSelectStr + "</select>";
			}    
			colSelectStr = colSelectStr + "</div></td>";
			colSelectStr = colSelectStr + "</tr>";
		}
	}
	rs.close();
	stmt.close();
%>
	<table class="w">
		<tr>
			<td class="tc" colspan="2">
				<font size="2"><b>查询排序</b></font>
			</td>
		</tr>
		<tr>
			<td style="width:180px">
				<form id="f1" name="f1" method="post">
					<div style="scrollbar-shadow-color: white; scrollbar-base-color: menu; scrollbar-arrow-color: black; overflow-Y: scroll; word-Break: break-all; height: 200px; background-color: white">
						<table id="table1" name="table1" class="w">
							<tbody id="tbody1" name="tbody1">
								<%=colListStr%>
							</tbody>
						</table>
					</div>
				</form>
			</td>
			<td>
				<form id="f2" method="post" action="sort_data.jsp">
					<input type="hidden" name="jfdbbzb_tj_id" value="<%=dbbzb_tj_jfid%>">
					<div style="scrollbar-shadow-color: white; scrollbar-base-color: menu; scrollbar-arrow-color: black; overflow-Y: scroll; word-Break: break-all; height: 200px; background-color: white">
						<table id="table2" name="table2" class="w">
							<tbody id="tbody2" name="tbody2">
								<%=colSelectStr%>
							</tbody>
						</table>
					</div>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="tc p5">
				<input class="btn" type="button" value="确认" onclick="return f_submit()">&nbsp;
				<input class="btn" type="button" value="关闭" onclick="window.close()">
			</td>
		</tr>
	</table>
	<script type="text/javascript">
	$("body").css("min-height", "300px"); // nothing useful
	function f_submit(){
	    $("#f2").submit();
	}
	function f_div(obj,cs){
		if ($(obj).parents("tbody").attr("id") == "tbody1"){
			f_f1(obj,cs);
		} else {
			f_f2(obj);
		}
	}
	function f_f1(obj,cs){
		var selectStr = "";
		if (cs=="1") {
			selectStr = '<select name="jfoperation"><%=Function.f_select_return(qc.con,"BMTJFS","") %></select>';
		} else {
			selectStr = '<select style="visibility:hidden" name="jfoperation"><%=Function.f_select_return(qc.con,"BMTJFS","") %></select>';
		}
		$("#tbody2").append("<tr><td onclick='f_div(this," + cs + ")'>" + $(obj).html() 
				+ "</td><td><div class=\"cell-wrap\">" + selectStr + "</div></td></tr>");
		//$(obj).parent().remove();
	}
	function f_f2(obj){
		//$("table").find("#tbody1").append("<tr><td onclick='f_div(this)'>" + $(obj).html() + "</td></tr>");
		$(obj).parent().remove();
	}
	</script>
	<%
	qc.close();
	%>
	</div>
</div>
<!-- end content -->
<%@include file="/footer_nocopy.jsp"%>
