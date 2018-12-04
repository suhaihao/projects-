<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@ include file="function.jsp" %>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="报表管理-填报时间定义" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
	
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">填报时间定义</h3>
					</div>
					<div class="mod-bd">
						<form id="f1" name="f1" method="post">
							<table class="w" name="t1" id="t1">
								<colgroup>
									<col style="width:7%">
									<col>
									<col style="width:18%">
									<col style="width:18%">
									<col style="width:18%">
									<col style="width:18%">
									<col style="width:7%">
								</colgroup>
								<thead>
									<tr class="tc">
										<td><div class="cell-wrap">序号</div></td>
										<td><div class="cell-wrap">上报日期</div></td>
										<td><div class="cell-wrap">开始提示天数</div></td>
										<td><div class="cell-wrap">开始填报天数</div></td>
										<td><div class="cell-wrap">正常截止填报天数</div></td>
										<td><div class="cell-wrap">停止催报天数</div></td>
										<td><div class="cell-wrap">删除</div></td>
									</tr>
								</thead>
								<tbody id="zg_body" name="zg_body">
								<%
									String id = request.getParameter("id");
									QueryConnection qc = new QueryConnection();
									Statement stmt = qc.con.createStatement();
									String sql = "SELECT JFID,TO_CHAR(TBRQ,'YYYY-MM-DD') RQ,KSTSTS,KSTBTS,JZTBTS,JZCBTS,DYBM FROM DBBZB_TBRQ WHERE JFDBBZB_ID='" + id + "'";
									ResultSet rs = stmt.executeQuery(sql);
									int i = 1;
									while (rs.next()) {
								%>
								<tr class="tc">
									<td><div class="cell-wrap"><label name="xh"><%=i++ %></label></div></td>
									<td><div class="cell-wrap"><input name="tbrq" type="text" value="<%=rs.getString("rq")%>" class="Wdate" onFocus="WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })" onkeyup="changeiput(this)" style="width:80px" maxlength="10" /></div></td>
									<td><div class="cell-wrap"><input name="kststs" type="text" maxlength="3" datatype="int" value="<%=rs.getString("kststs")%>" /></div></td>
									<td><div class="cell-wrap"><input name="kstbts" type="text" maxlength="3" datatype="int" value="<%=rs.getString("kstbts")%>" /></div></td>
									<td><div class="cell-wrap"><input name="jztbts" type="text" maxlength="3" datatype="int" value="<%=rs.getString("jztbts")%>" /></div></td>
									<td><div class="cell-wrap"><input name="jzcbts" type="text" maxlength="3" datatype="int" value="<%=rs.getString("jzcbts")%>" /></div></td>
									<td><div class="cell-wrap">
										<input type="hidden" name="jfid" value="<%=rs.getString("jfid")%>">
										<input type="checkbox" value="<%=rs.getString("jfid")%>" onclick="f_del(this)">
									</div></td>
								</tr>
								<%
									}
									rs.close();
									stmt.close();
									qc.close();
								%>
								</tbody>
								<tr>
									<td colspan="15" class="tc p10">
										<input name="zbid" type="hidden" value="<%=id %>" />
										<mt:addbutton other=" class='btn'" name="b1" table="t1"
											tablebody="zg_body" addobject="ac1" />
										<input class="btn" type="button" value="保存" onclick="f_save()">
										<input class="btn" type="button" value="关闭" onclick="window.close()">
									</td>
								</tr>
							</table>
						</form>
						<script type="text/javascript">
				  		    function buttonb1_onclick(){
				  		    	var acac1="<tr class='tc'>"
								+"<td><div class='cell-wrap'><label name='xh'></label></div></td>"
								+"<td><div class='cell-wrap'><input name='tbrq' type='text' class='Wdate' onFocus='WdatePicker({skin:\"whyGreen\", maxDate: \"%y-%M-%d\" })' onkeyup='changeiput(this)' style='width:80px' maxlength='10' /></div></td>"
								+"<td><div class='cell-wrap'><input name='kststs' type='text' maxlength='3' datatype='int' /></div></td>"
								+"<td><div class='cell-wrap'><input name='kstbts' type='text' maxlength='3' datatype='int' /></div></td>"
								+"<td><div class='cell-wrap'><input name='jztbts' type='text' maxlength='3' datatype='int' /></div></td>"
								+"<td><div class='cell-wrap'><input name='jzcbts' type='text' maxlength='3' datatype='int' /></div></td>"
								+"<td><div class='cell-wrap'>"
								+"<input type='hidden' name='jfid' value=''>"
								+"<input type='checkbox' value='' onclick='f_delete_row(this)'>"
								+"</div></td>"
							    +"</tr>"
				  		      $("#zg_body").append(acac1);
				  		      f_adjust_seq(zg_body);
				  		    }
							function f_save(){
								$("#f1").attr("action","tbsj_ht.jsp?act=save");
								$("#f1").submit();
							}
							function f_del(obj){
								if (f_confirm()) {
									$("#f1").attr("action","tbsj_ht.jsp?act=del&id=" + obj.value);
									$("#f1").submit();
								}
							}
						</script>
					</div>
				</div>
        	</div>
    	</div>
	</div>
</div>
<!-- end content -->
<%@include file="/footer.jsp"%>
