<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="查询条件列定义" />
</jsp:include>
<div class="mod">
	<div class="mod-bd">
<%
	String dbbzb_cx_jfid = request.getParameter("dbbzb_cx_jfid");
	String sqlStr = " select a.jfid,a.jfcolname,nvl(b.jfdbbzb_jg_id,'0'),b.jfoperation jfoperation ";
	sqlStr = sqlStr + " from ( select dbbzb_jg.jfid jfid,dbbzb_jg.jfcolname jfcolname ";
	sqlStr = sqlStr + "        from dbbzb_cx,dbbzb,dbbzb_jg ";
	sqlStr = sqlStr + "        where dbbzb_cx.jfid='" + dbbzb_cx_jfid + "' ";
	sqlStr = sqlStr + "              and dbbzb_cx.jfdbbzb_id=dbbzb.jfid ";
	sqlStr = sqlStr + "              and dbbzb_jg.jfdbbzb_id=dbbzb.jfid ";
	sqlStr = sqlStr + "      ) a ";
	sqlStr = sqlStr + "      ,(select jfdbbzb_jg_id,jfoperation,jfid from dbbzb_cx_tj where jfdbbzb_cx_id='" + dbbzb_cx_jfid + "') b ";
	sqlStr = sqlStr + " where a.jfid=b.jfdbbzb_jg_id(+) ";
	sqlStr = sqlStr + " order by b.jfid ";
	String colListStr = "", colSelectStr = "";
	QueryConnection qc = new QueryConnection();
	Statement stmt = qc.con.createStatement();
	ResultSet rs = stmt.executeQuery(sqlStr);
	while (rs.next()) {
		if ("0".equals(rs.getString(3))) {
			colListStr = colListStr + "<tr>";
			colListStr = colListStr + "<td onclick='f_div(this)'><div class=\"cell-wrap\">";
			colListStr = colListStr + rs.getString(2);
			colListStr = colListStr + "<input type='hidden' name='jfdbbzb_jg_id' value='"+rs.getString(1)+"'>";
			colListStr = colListStr + "</div></td>";
			colListStr = colListStr + "</tr>";
		} else {
			colSelectStr = colSelectStr + "<tr>";
			colSelectStr = colSelectStr + "<td onclick='f_div(this)'><div class=\"cell-wrap\">";
			colSelectStr = colSelectStr + rs.getString(2);
			colSelectStr = colSelectStr + "<input type='hidden' name='jfdbbzb_jg_id' value='"+rs.getString(1)+"'>";
			colSelectStr = colSelectStr + "</div></td>";
			colSelectStr = colSelectStr + "<td><div class=\"cell-wrap\"><select name='jfoperation'>";
			if ("1".equals(rs.getString(4))) {
				colSelectStr = colSelectStr + "<option value='1' selected>like</option>";
			} else {
				colSelectStr = colSelectStr + "<option value='1'>like</option>";
			}
			if ("2".equals(rs.getString(4))) {
				colSelectStr = colSelectStr + "<option value='2' selected>=</option>";
			} else {
				colSelectStr = colSelectStr + "<option value='2'>=</option>";
			}
			if ("3".equals(rs.getString(4))) {
				colSelectStr = colSelectStr + "<option value='3' selected>></option>";
			} else {
				colSelectStr = colSelectStr + "<option value='3'>></option>";
			}
			if ("4".equals(rs.getString(4))) {
				colSelectStr = colSelectStr + "<option value='4' selected>>=</option>";
			} else {
				colSelectStr = colSelectStr + "<option value='4'>>=</option>";
			}
			if ("5".equals(rs.getString(4))) {
				colSelectStr = colSelectStr + "<option value='5' selected><</option>";
			} else {
				colSelectStr = colSelectStr + "<option value='5'><</option>";
			}
			if ("6".equals(rs.getString(4))) {
				colSelectStr = colSelectStr + "<option value='6' selected><=</option>";
			} else {
				colSelectStr = colSelectStr + "<option value='6'><=</option>";
			}
			colSelectStr = colSelectStr + "</select></div></td>";
			colSelectStr = colSelectStr + "</tr>";
		}
	}
	rs.close();
	stmt.close();
	qc.close();
%>
	<table class="w">                
		<tr>
			<td class="tc" colspan="2">
				<font size="2"><b>查询条件</b></font>
			</td>
		</tr>
		<tr>
			<td style="width:200px">
				<form name="f1" method="post">
					<div style="scrollbar-shadow-color:white;scrollbar-base-color:menu;scrollbar-arrow-color:black;overflow-Y:scroll;word-Break:break-all;height:200px;background-color:white">
						<table id="table1" name="table1" class="w">
							<tbody id="tbody1" name="tbody1">
								<%=colListStr%>
							</tbody>
						</table>
					</div>
				</form>
			</td>
			<td>
				<form id="f2" method="post" action="condition_data.jsp">
					<input type="hidden" name="jfdbbzb_cx_id" value="<%=dbbzb_cx_jfid%>">
					<div style="scrollbar-shadow-color:white;scrollbar-base-color:menu;scrollbar-arrow-color:black;overflow-Y:scroll;word-Break:break-all;height:200px;background-color:white">
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
				<input class="btn" type="button" value="确认" onclick="return f_submit()">
				<input class="btn" type="button" value="关闭" onclick="window.close()">
			</td>
		</tr>
	</table>
	<script type="text/javascript">
	$("body").css("min-height", "300px"); // nothing useful
	function f_submit(){
	    $("#f2").submit();
	}
	function f_div(obj){
		if ($(obj).parents("tbody").attr("id") == "tbody1"){
			f_f1(obj);
		} else {
			f_f2(obj);
		}
	}
	function f_f1(obj){
		var selectStr = "<select name='jfoperation'>";
		selectStr += "<option value='1'>like</option>";
		selectStr += "<option value='2'>=</option>"; 
		selectStr += "<option value='3'>></option>";
		selectStr += "<option value='4'>>=</option>";
		selectStr += "<option value='5'><</option>";
		selectStr += "<option value='6'><=</option>";
		selectStr += "</select>";
		$("#tbody2").append("<tr><td onclick='f_div(this)'>" + $(obj).html() + "</td><td>" + selectStr + "</td></tr>");
		//$(obj).parent().remove();
	}
	function f_f2(obj){
		$("#tbody1").append("<tr><td onclick='f_div(this)'>" + $(obj).html() + "</td></tr>");
		$(obj).parent().remove();
	}
	</script>
	</div>
</div>
<!-- end content -->
<%@include file="/footer_nocopy.jsp"%>
