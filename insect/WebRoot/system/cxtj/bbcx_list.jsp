<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="报表查询定义" />
</jsp:include>
<%
	String jfid = request.getParameter("jfid");
	String bb = request.getParameter("bb");
	bb = java.net.URLDecoder.decode(bb, "UTF-8");
%>
<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="<%=bb %>" name="last"/>
	</jsp:include>
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">报表查询定义</h3>
					</div>
					<div class="mod-bd">
						<form id="f1" name="f1" method="post">
							<table class="w">
								<thead>
									<tr>
										<td><div class="cell-wrap">序号</div></td>
										<td><div class="cell-wrap">查询名称</div></td>
										<td><div class="cell-wrap">查询类别</div></td>
										<td><div class="cell-wrap">制作人员</div></td>
										<td><div class="cell-wrap">制作日期</div></td>
										<td><div class="cell-wrap">状态</div></td>
										<td><div class="cell-wrap">删除</div></td>
									</tr>
								</thead>
								<tbody id="zg_body">
							<%
							QueryConnection qc = new QueryConnection();
							String sql_xx = "";
							sql_xx = " select jfid,jfname,f_get_mc('RYBM',jflister) jflisterName,jflister,to_char(jflistdate,'yyyy-mm-dd') jflistdate,decode(jfattribute,'0','公开','1','私有')jfattribute,jfstate,decode(jfstate,'0','初始','1','提交') zt from dbbzb_cx where jfdbbzb_id='" + jfid + "' ";
							//sql_xx = sql_xx + " and ((('10'='"&session("fwqbz")&"' or jfattribute='0') and jfstate='1') or jflister='"&session("userid")&"' )";
							Statement stmt = qc.con.createStatement();
							ResultSet rs = stmt.executeQuery(sql_xx);
							int no = 0;
							while (rs.next()) {
								no++;
							%>
								<tr>
									<td><div class="cell-wrap"><%=no %></div></td>
									<td><div class="cell-wrap"><a href="/insect/sysbbcx.do?ACT_TYPE=MODIFY&jfid=<%=rs.getString(1) %>"><%=rs.getString("jfname") %></a></div></td>
									<td><div class="cell-wrap"><a href="/insect/sysbbcx.do?ACT_TYPE=MODIFY&jfid=<%=rs.getString(1) %>"><%=rs.getString("jfattribute") %></a></div></td>
									<td><div class="cell-wrap"><a href="/insect/sysbbcx.do?ACT_TYPE=MODIFY&jfid=<%=rs.getString(1) %>"><%=rs.getString("jflisterName") %></a></div></td>
									<td><div class="cell-wrap"><a href="/insect/sysbbcx.do?ACT_TYPE=MODIFY&jfid=<%=rs.getString(1) %>"><%=rs.getString("jflistdate") %></a></div></td>
									<td><div class="cell-wrap"><a href="/insect/sysbbcx.do?ACT_TYPE=MODIFY&jfid=<%=rs.getString(1) %>"><%=rs.getString("zt") %></a></div></td>
									<td><div class="cell-wrap"><input type="checkbox" value="<%=rs.getString(1) %>" onclick="f_del(this)" <%=(!"0".equals(rs.getString("jfstate")))?"disabled='disabled'":""%> /></div></td>
								</tr>
							<%
							}
							rs.close();
							stmt.close();
							qc.close();
							%>
								</tbody>
								<tr>
									<td class="tc p10" colspan="7">
										<input type="button" class="btn" value="增加" onclick="f_add('<%=jfid %>','<%=bb %>')" />&nbsp;
										<!-- <input type="button" class="btn" value="查询" />&nbsp; -->
										<input type="button" class="btn" value="关闭" onclick="window.close()" />
										<input type="hidden" id="jfid" name="jfid" value="<%=jfid %>" />
										<input type="hidden" id="bbmc" name="bbmc" value="<%=bb %>" />
									</td>
								</tr>
							</table>
							<script type="text/javascript">
								function f_add(id,bb){
									window.location = "bbcx_add.jsp?jfid=" + id + "&bb=" + encodeURIComponent(encodeURIComponent(bb));
								}
								function f_del(obj){
									if (f_confirm()) {
										$("#f1").attr("action","/insect/sysbbcx.do?ACT_TYPE=DEL&id=" + obj.value);
										$("#f1").submit();
									} else {
										obj.checked = false;
									}
								}
							</script>
						</form>
					</div>
				</div>
        	</div>
    	</div>
	</div>
</div>
<!-- end content -->
<%@include file="/footer.jsp"%>
