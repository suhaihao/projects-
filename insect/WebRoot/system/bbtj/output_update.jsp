<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%@page import="com.jf.util.Function"%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="统计输出列定义" />
</jsp:include>
<div class="mod">
	<div class="mod-bd">
<%
	String dbbzb_tj_jfid = request.getParameter("dbbzb_tj_jfid");
	String sqlStr = " select a.jfid,a.jfcolname,nvl(b.jfdbbzb_jg_id,'0'),jfcolstyle,b.jfcolgs jfcolgs,b.jfcolstate jfcolstate,a.jfcolid jfcolid,b.JFCOMUPTE_METHOD,b.JFCOMUPTE_NAME,b.JFCOMUPTE_CLICK,b.JFCOMUPTE_CONDITION,b.SUM_COLGS,b.SUM_COMUPTE_METHOD,b.SUM_COMUPTE_CLICK,b.SUM_COMUPTE_CONDITION ";
	sqlStr = sqlStr + " from ( select dbbzb_jg.jfid jfid,dbbzb_jg.jfcolname jfcolname,dbbzb_jg.jfcolstyle jfcolstyle,dbbzb_jg.jfcolid jfcolid ";
	sqlStr = sqlStr + "        from dtjbb,dbbzb,dbbzb_jg ";
	sqlStr = sqlStr + "        where dtjbb.jfid='" + dbbzb_tj_jfid + "' ";
	sqlStr = sqlStr + "              and dtjbb.jfdbbzb_id=dbbzb.jfid ";
	sqlStr = sqlStr + "              and dbbzb_jg.jfdbbzb_id=dbbzb.jfid ";
	sqlStr = sqlStr + "      ) a ";
	sqlStr = sqlStr + "      ,(select jfdbbzb_jg_id,jfid,jfcolgs,jfcolstate,JFCOMUPTE_METHOD,JFCOMUPTE_NAME,JFCOMUPTE_CLICK,JFCOMUPTE_CONDITION,SUM_COLGS,SUM_COMUPTE_METHOD,SUM_COMUPTE_CLICK,SUM_COMUPTE_CONDITION from dtjbb_sc where jfdbbzb_tj_id='" + dbbzb_tj_jfid + "') b ";
	sqlStr = sqlStr + " where a.jfid=b.jfdbbzb_jg_id(+) and a.jfcolstyle='3' ";
	sqlStr = sqlStr + " order by b.jfid ";
	String colListStr = "", colSelectStr = "";
	QueryConnection qc = new QueryConnection();
	Statement stmt = qc.con.createStatement();
	ResultSet rs = stmt.executeQuery(sqlStr);
	String tempstate = "",str_jfid="";
	while (rs.next()) {
		if (!tempstate.contains(","+rs.getString(1))) {
			colListStr = colListStr + "<tr>";
			colListStr = colListStr + "<td onclick='f_div(this)'><div class=\"cell-wrap\">";
			colListStr = colListStr + rs.getString(2)+"["+rs.getString("jfcolid")+"]";
			colListStr = colListStr + "<input type='hidden' name='jfdbbzb_jg_id' value='"+rs.getString(1)+"'>";
			colListStr = colListStr + "<input type='hidden' name='jfcolstate' value='"+(rs.getString("jfcolstate") == null ? "" : rs.getString("jfcolstate"))+"'>";				
			colListStr = colListStr + "</div></td>";
		    str_jfid=rs.getString(1);
		    colListStr = colListStr + "</tr>";
			tempstate = tempstate + "," + rs.getString(1);
		}
		if (!"0".equals(rs.getString(3))) {
			colSelectStr = colSelectStr + "<tr>";
			colSelectStr = colSelectStr + "<td onclick='f_div(this)'><div class=\"cell-wrap\">";
			if ("1".equals(rs.getString("jfcolstate"))) {
				colSelectStr = colSelectStr +"计算列";
			} else {
				colSelectStr = colSelectStr + rs.getString(2);
			}
			colSelectStr = colSelectStr + "<input type='hidden' name='jfdbbzb_jg_id' value='"+rs.getString(1)+"'>";
			colSelectStr = colSelectStr + "<input type='hidden' name='jfcolstate' value='" 
				+ (rs.getString("jfcolstate") == null ? "" : rs.getString("jfcolstate")) + "'>";
			colSelectStr = colSelectStr + "</div></td>";
			colSelectStr = colSelectStr + "<td><div class=\"cell-wrap\">";
			//if ("1".equals(rs.getString("jfcolstate"))) {
			//	colSelectStr = colSelectStr + "<input type=text name='jfcolgs' style='width:150px' chname='计算列' value='"+rs.getString("jfcolgs") +"' nullable=no>";
			//} else {
				colSelectStr = colSelectStr + "<select name='jfcolgs' chname='计算列' nullable=no>";
				colSelectStr = colSelectStr + Function.f_select_return(qc.con, "BMJSGS",rs.getString("jfcolgs"));
				colSelectStr = colSelectStr + "</select>";
			//}
			colSelectStr = colSelectStr + "</div></td>";
			//新添加代码
			colSelectStr +="<td><div class=\"cell-wrap\">";
			colSelectStr +="<input name='JFCOMUPTE_METHOD' value='"+(rs.getString("JFCOMUPTE_METHOD")==null? "" : rs.getString("JFCOMUPTE_METHOD"))+"'/>";
			colSelectStr +="</div></td>";
			
			colSelectStr +="<td><div class=\"cell-wrap\">";
			colSelectStr +="<input name='JFCOMUPTE_NAME' value='"+(rs.getString("JFCOMUPTE_NAME")==null? "" : rs.getString("JFCOMUPTE_NAME"))+"'/>";
			colSelectStr +="</div></td>";
			
			colSelectStr +="<td><div class=\"cell-wrap\">";
			if(rs.getString("JFCOMUPTE_CLICK")!=null&&rs.getString("JFCOMUPTE_CLICK").equals("1"))
			{
			colSelectStr +="<select name='JFCOMUPTE_CLICK'><option value='1' selected='selected'>是</option><option value='0'>否</option></select>";
			}
			else
			{
			colSelectStr +="<select name='JFCOMUPTE_CLICK'><option value='1' >是</option><option value='0' selected='selected'>否</option></select>";
			}
			colSelectStr +="</div></td>";
			
			colSelectStr +="<td><div class=\"cell-wrap\">";
			colSelectStr +="<input name='JFCOMUPTE_CONDITION' value='"+(rs.getString("JFCOMUPTE_CONDITION")==null? "" : rs.getString("JFCOMUPTE_CONDITION"))+"'/>";
			colSelectStr +="</div></td>";
			
			colSelectStr +="<td><div class=\"cell-wrap\">";
			colSelectStr +="<select name='SUM_COLGS' chname='计算列' nullable=no>"+Function.f_select_return(qc.con, "BMJSGS",rs.getString("jfcolgs"))+"</select>";
			colSelectStr +="</div></td>";
			
			colSelectStr +="<td><div class=\"cell-wrap\">";
			colSelectStr +="<input name='SUM_COMUPTE_METHOD' value='"+(rs.getString("SUM_COMUPTE_METHOD")==null? "" : rs.getString("SUM_COMUPTE_METHOD"))+"'/>";
			colSelectStr +="</div></td>";
			
			colSelectStr +="<td><div class=\"cell-wrap\">";
			if(rs.getString("SUM_COMUPTE_CLICK")!=null&&rs.getString("SUM_COMUPTE_CLICK").equals("1"))
			{
			colSelectStr +="<select name='SUM_COMUPTE_CLICK'><option value='1' selected='selected'>是</option><option value='0'>否</option></select>";
			}
			else
			{
			colSelectStr +="<select name='SUM_COMUPTE_CLICK'><option value='1' >是</option><option value='0' selected='selected'>否</option></select>";
			}
			colSelectStr +="</div></td>";
			
			colSelectStr +="<td><div class=\"cell-wrap\">";
			colSelectStr +="<input name='SUM_COMUPTE_CONDITION' value='"+(rs.getString("SUM_COMUPTE_CONDITION")==null? "" : rs.getString("SUM_COMUPTE_CONDITION"))+"'/>";
			colSelectStr +="</div></td>";
			
			colSelectStr = colSelectStr + "</tr>";
		}
	}
	rs.close();
	stmt.close();
%>
	<table class="w">
		<tr>
			<td class="tc" colspan="2">
			<div class="cell-wrap" style="float: left;margin-left: 200px;">
			<label style="display: inline-block;word-break: break-all;width: 20px;"><font size="2"><b>列名</b></font></label>
			</div>
			<div class="cell-wrap" style="float: left;margin-left: 60px;">
			<label style="display: inline-block;width: 20px;"><font size="2"><b>公式</b></font></label>
			</div>
			<div class="cell-wrap" style="float: left;">
			<label style="display: inline-block;width: 50px;margin-left: 75px;"><font size="2"><b>特殊计算列的计算方法</b></font></label>
			</div>
			<div class="cell-wrap" style="float: left;">
			<label style="display: inline-block;width: 50px;margin-left: 100px;"><font size="2"><b>特殊计算列汉字名称</b></font></label>
			</div>
			<div class="cell-wrap" style="float: left;">
			<label style="display: inline-block;width: 50px;margin-left: 50px;"><font size="2"><b>特殊计算列是否可点击</b></font></label>
			</div>
			<div class="cell-wrap" style="float: left;">
			<label style="display: inline-block;width: 50px;margin-left: 50px;"><font size="2"><b>特殊计算列点击后的附加条件</b></font></label>
			</div>
			<div class="cell-wrap" style="float: left;">
			<label style="display: inline-block;width: 50px;margin-left: 75px;"><font size="2"><b>汇总计算公式</b></font></label>
			</div>
			<div class="cell-wrap" style="float: left;">
			<label style="display: inline-block;width: 50px;margin-left: 90px;"><font size="2"><b>汇总特殊计算列的计算方法</b></font></label>
			</div>
			<div class="cell-wrap" style="float: left;">
			<label style="display: inline-block;width: 50px;margin-left: 60px;"><font size="2"><b>汇总特殊计算列是否可点击</b></font></label>
			</div>
			<div class="cell-wrap" style="float: left;"> 
			<label style="display: inline-block;width: 50px;margin-left: 50px;"><font size="2"><b>汇总特殊计算列点击后的附加条件</b></font></label>
			</div>
			
			</td>
		</tr>
		<tr>
			<td style="width:180px">
				<form id="f1" name="f1" method="post">
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
				<form id="f2" method="post" action="output_data.jsp"> 
					<input type="hidden" name="jfdbbzb_tj_id" value="<%=dbbzb_tj_jfid%>">
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
			    <input class="btn" type="button" value="计算列" onclick="return f_computerColumn()">&nbsp;
				<input class="btn" type="button" value="确认" onclick="return f_submit()">&nbsp;
				<input class="btn" type="button" value="关闭" onclick="window.close()">
		    </td>
		</tr>
	</table>
	<script type="text/javascript">
	function f_computerColumn(){
	    var selectStr = '<select name="jfcolgs">';
		selectStr += '<%=Function.f_select_return(qc.con, "BMJSGS","sum") %>';
		selectStr += '</select>';
		$("#tbody2").append("<tr><td onclick='f_div(this)'><div class=\"cell-wrap\">计算列<input type='hidden' name='jfdbbzb_jg_id' value='<%=str_jfid %>'><input type='hidden' name='jfcolstate' value='1'></div></td>"+
		"<td><div class=\"cell-wrap\">"+selectStr+"</div></td>"+
		"<td><div class=\"cell-wrap\"><input name='JFCOMUPTE_METHOD' value=''/></div></td>"+
		"<td><div class=\"cell-wrap\"><input name='JFCOMUPTE_NAME' value=''/></div></td>"+
		"<td><div class=\"cell-wrap\"><select name='JFCOMUPTE_CLICK'><option value='1'>是</option><option value='0'>否</option></select></div></td>"+
		"<td><div class=\"cell-wrap\"><input name='JFCOMUPTE_CONDITION' value=''/></div></td>"+
		"<td><div class=\"cell-wrap\"><select name='SUM_COLGS'><%=Function.f_select_return(qc.con, "BMJSGS","sum") %></select></div></td>"+
		"<td><div class=\"cell-wrap\"><input name='SUM_COMUPTE_METHOD' value=''/></div></td>"+
		"<td><div class=\"cell-wrap\"><select name='SUM_COMUPTE_CLICK'><option value='1'>是</option><option value='0'>否</option></select></div></td>"+
		"<td><div class=\"cell-wrap\"><input name='SUM_COMUPTE_CONDITION' value=''/></div></td>"+
		"</tr>");
	}
	function f_submit(){
		if($("#tbody2").children("tr").length <=0){
			alert("请录入数据");
	        return false;
		}
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
		var selectStr = '<select name="jfcolgs">';
		selectStr += '<%=Function.f_select_return(qc.con, "BMJSGS","sum") %>';
		selectStr += '</select>';
		$("#tbody2").append("<tr><td onclick='f_div(this)'>" + $(obj).html() + "</td><td><div class=\"cell-wrap\">" + selectStr + "</div></td>"+
		"<td><div class=\"cell-wrap\"><input name='JFCOMUPTE_METHOD' value=''/></div></td>"+
		"<td><div class=\"cell-wrap\"><input name='JFCOMUPTE_NAME' value=''/></div></td>"+
		"<td><div class=\"cell-wrap\"><select name='JFCOMUPTE_CLICK'><option value='1'>是</option><option value='0'>否</option></select></div></td>"+
		"<td><div class=\"cell-wrap\"><input name='JFCOMUPTE_CONDITION' value=''/></div></td>"+
		"<td><div class=\"cell-wrap\"><select name='SUM_COLGS'><%=Function.f_select_return(qc.con, "BMJSGS","sum") %></select></div></td>"+
		"<td><div class=\"cell-wrap\"><input name='SUM_COMUPTE_METHOD' value=''/></div></td>"+
		"<td><div class=\"cell-wrap\"><select name='SUM_COMUPTE_CLICK'><option value='1'>是</option><option value='0'>否</option></select></div></td>"+
		"<td><div class=\"cell-wrap\"><input name='SUM_COMUPTE_CONDITION' value=''/></div></td>"+
		"</tr>");
		//$(obj).parent().remove();
	}
	function f_f2(obj){
		//$("#tbody1").append("<tr><td onclick='f_div(this)'>" + $(obj).html() + "</td></tr>");
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
