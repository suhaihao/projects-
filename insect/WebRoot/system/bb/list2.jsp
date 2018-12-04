<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@ include file="function.jsp" %>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="报表管理-报表格式" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
	
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">报表管理</h3>
					</div>
					<div class="mod-bd">
						<form id="f1" name="f1" action="/insect/system/bb/list2_ht.jsp" method="post">
							<div class="tabs">
								<ul>
									<li><a href="javascript:secBoard(0)">报表主表</a></li>
									<li><a href="javascript:secBoard(1)">报表结构</a></li>
									<li class="on"><a href="javascript:secBoard(2)">报表格式</a></li>
									<li style="margin-left:150px;border:1px solid red;height:28px;text-align:center"><span id="title_xx">
									<%
										String title_xx = request.getParameter("title_xx");
										String jglb = request.getParameter("jfcolvest"); // 报表结构类别(0:标题;1:表头;2:表体;3:表尾)
										if ("".equals(title_xx) || title_xx == null) {
											title_xx = "";
										}
										title_xx = java.net.URLDecoder.decode(title_xx, "UTF-8");
									%>
									<%=title_xx %>
									</span></li>
								</ul>
							</div>
							<table class="w" name="t1" id="t1">
								<tr>
									<td colspan="4" class="tr">
										<div class="cell-wrap">
										报表结构类别：
										</div>
									</td>
									<td colspan="10">
										<select id="jfcolvest" name="jfcolvest" onchange="return page_redirect()">
											<option value="0">标题</option>
											<option value="1">表头</option>
											<option value="2">表体</option>
											<option value="3">表尾</option>
										</select>
									<%
										if ("2".equals(jglb)) {
									%>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<label>表体类别：</label>
										<select id="_btlb" name="_btlb" onchange="chgBT(this.value)">
											<option value="0">列定义</option>
											<option value="1">行定义</option>
										</select>
									<%
										}
									%>
									</td>
								</tr>
								<tr>
									<td style="width: 35px"><div class="cell-wrap">序号</div></td>
						            <td style="width: 80px"><div class="cell-wrap">列编码</div></td>
						            <td><div class="cell-wrap">列名</div></td>
						            <td style="width: 45px"><div class="cell-wrap">列高</div></td>
						            <td style="width: 45px"><div class="cell-wrap">列宽</div></td>
						            <td style="width: 60px"><div class="cell-wrap">列列顺序</div></td>
						            <td style="width: 60px"><div class="cell-wrap">列行顺序</div></td>
						            <td style="width: 60px"><div class="cell-wrap">列列数</div></td>
						            <td style="width: 60px"><div class="cell-wrap">列行数</div></td>
						            <td style="width: 90px"><div class="cell-wrap">列标识</div></td>
						            <td style="width: 100px"><div class="cell-wrap">列属性</div></td>
						            <td style="width: 70px"><div class="cell-wrap">是否基本列</div></td>
						            <td style="width: 60px"><div class="cell-wrap">列归属</div></td>
						            <td style="width: 40px"><div class="cell-wrap">删除</div></td>
						        </tr>
								<tbody id="zg_body" name="zg_body">
								<%
									String zbid = request.getParameter("zbid");
									if (jglb == null || "".equals(jglb)) {
										jglb = "0";
									}
									
									String sql_gs = "SELECT JFID,JFCOLCODE, JFCOLNAME, JFCOLHEIGHT, JFCOLWIDTH, JFDBBZB_ID,JFCOLORDER,JFCOLROWORD,JFCOLNUMBER,JFCOLROWS, JFCOLID, JFCOLATTR, JFBASECOL, JFCOLVEST FROM DBBZB_GS WHERE JFDBBZB_ID='" 
										+ zbid + "' AND JFCOLVEST = '" + jglb + "' ORDER BY JFCOLORDER";
									QueryConnection qc = new QueryConnection();
									Statement stmt = qc.con.createStatement();
									ResultSet rs_gs = stmt.executeQuery(sql_gs);
									boolean nodata = true;
									int index = 0;
									// 读取DBBZB_GS表数据
									while (rs_gs.next()) {
										index++;
										nodata = false;
								%>
									<tr>
										<td><div class="cell-wrap"><label><%=index %></label></div></td>
										<td><div class="cell-wrap"><input type='text' style='width:100%' name="lbm" value="<%=cStr(rs_gs.getString("JFCOLCODE")) %>" /></div></td>
										<td><div class="cell-wrap"><input type='text' style='width:100%' name="lmc" value="<%=cStr(rs_gs.getString("JFCOLNAME")) %>" /></div></td>
										<td><div class="cell-wrap"><input type='text' style='width:100%' name="lg" value="<%=cStr(rs_gs.getString("JFCOLHEIGHT")) %>" /></div></td>
										<td><div class="cell-wrap"><input type='text' style='width:100%' name="lk" value="<%=cStr(rs_gs.getString("JFCOLWIDTH")) %>" /></div></td>
										<td><div class="cell-wrap"><input type='text' style='width:100%' name="llsx" value="<%=cStr(rs_gs.getString("JFCOLORDER")) %>" /></div></td>
										<td><div class="cell-wrap"><input type='text' style='width:100%' name="lhsx" value="<%=cStr(rs_gs.getString("JFCOLROWORD")) %>" /></div></td>
										<td><div class="cell-wrap"><input type='text' style='width:100%' name="lls" value="<%=cStr(rs_gs.getString("JFCOLNUMBER")) %>" /></div></td>
										<td><div class="cell-wrap"><input type='text' style='width:100%' name="lhs" value="<%=cStr(rs_gs.getString("JFCOLROWS")) %>" /></div></td>
										<td><div class="cell-wrap">
											<select name="lbs" style='width:100%' id="lbs0<%=index %>">
												<option value=0>固定</option>
												<option value=1>录入字段</option>
												<option value=2>序号字段</option>
											</select>
										</div></td>
										<td><div class="cell-wrap"><input type='text' style='width:100%' name="lsx" value="<%=cStr(rs_gs.getString("JFCOLATTR")) %>" /></div></td>
										<td><div class="cell-wrap">
											<select style="width:100%" name="lsfjb" id="jbl0<%=index %>">
												<option value="0">否</option>
												<option value="1">是</option>
											</select>
										</div></td>
										<td><div class="cell-wrap">
											<select style="width:100%" name="lgs" id="lgs0<%=index %>">
												<option value="0">标题</option>
												<option value="1">表头</option>
												<option value="2">表体</option>
												<option value="3">表尾</option>
											</select>
										</div></td>
										<td><div class="cell-wrap">
											<input type="checkbox" value="<%=cStr(rs_gs.getString("JFID")) %>" onclick="f_delgs('c',this.value)" />
											<input type="hidden" name="jfid" value="<%=cStr(rs_gs.getString("JFID")) %>" />
										</div></td>
									</tr>
									<script type="text/javascript">
										document.getElementById("lbs0<%=index %>").value = "<%=cStr(rs_gs.getString("JFCOLID")) %>";
										document.getElementById("jbl0<%=index %>").value = "<%=cStr(rs_gs.getString("JFBASECOL")) %>";
										document.getElementById("lgs0<%=index %>").value = "<%=cStr(rs_gs.getString("JFCOLVEST")) %>";
									</script>
								<%
									}
									rs_gs.close();
									// DBBZB_GS表无数据，用DBBZB_JG表填充
									if (nodata) {
										String sql_jg = "SELECT JFCOLID,JFCOLNAME,JFCOLVEST,'1','1' FROM DBBZB_JG WHERE JFDBBZB_ID='" 
											+ zbid + "' AND JFCOLVEST='" + jglb + "'";
										stmt = qc.con.createStatement();
										ResultSet rs_jg = stmt.executeQuery(sql_jg);
										index = -1;
										String colname = "", colvest = "";
										while (rs_jg.next()) {
											index = index + 2;
											colname = rs_jg.getString("JFCOLNAME");
											colvest = rs_jg.getString("JFCOLVEST");
								%>
								<tr>
									<td><div class="cell-wrap"><label><%=index %></label></div></td>
									<td><div class="cell-wrap"><input type='text' style='width:100%' name="lbm" value="" /></div></td>
									<td><div class="cell-wrap"><input type='text' style='width:100%' name="lmc" value="<%=colname %>" /></div></td>
									<td><div class="cell-wrap"><input type='text' style='width:100%' name="lg" value="" /></div></td>
									<td><div class="cell-wrap"><input type='text' style='width:100%' name="lk" value="" /></div></td>
									<td><div class="cell-wrap"><input type='text' style='width:100%' name="llsx" value="" /></div></td>
									<td><div class="cell-wrap"><input type='text' style='width:100%' name="lhsx" value="" /></div></td>
									<td><div class="cell-wrap"><input type='text' style='width:100%' name="lls" value="" /></div></td>
									<td><div class="cell-wrap"><input type='text' style='width:100%' name="lhs" value="" /></div></td>
									<td><div class="cell-wrap">
										<select style="width:100%" name="lbs" id="lbs<%=index %>">
											<option value="0">固定</option>
											<option value="1">录入字段</option>
											<option value="2">序号字段</option>
										</select>
									</div></td>
									<td><div class="cell-wrap"><input type='text' style='width:100%' name="lsx" value="" /></div></td>
									<td><div class="cell-wrap">
										<select style="width:100%" name="lsfjb" id="jbl<%=index %>">
											<option value="0">否</option>
											<option value="1">是</option>
										</select>
									</div></td>
									<td><div class="cell-wrap">
										<select style="width:100%" name="lgs" id="lgs<%=index %>">
											<option value="0">标题</option>
											<option value="1">表头</option>
											<option value="2">表体</option>
											<option value="3">表尾</option>
										</select>
									</div></td>
									<td><div class="cell-wrap"><input type="checkbox" onclick="f_delete_row(this);"><input type="hidden" name="jfid" value="" /></div></td>
								</tr>
								<tr>
									<td><div class="cell-wrap"><label><%=index+1 %></label></div></td>
									<td><div class="cell-wrap"><input type='text' style='width:100%' name="lbm" value="<%=rs_jg.getString("JFCOLID") %>" /></div></td>
									<td><div class="cell-wrap"><input type='text' style='width:100%' name="lmc" value="<%=colname %>" /></div></td>
									<td><div class="cell-wrap"><input type='text' style='width:100%' name="lg" value="" /></div></td>
									<td><div class="cell-wrap"><input type='text' style='width:100%' name="lk" value="" /></div></td>
									<td><div class="cell-wrap"><input type='text' style='width:100%' name="llsx" value="" /></div></td>
									<td><div class="cell-wrap"><input type='text' style='width:100%' name="lhsx" value="" /></div></td>
									<td><div class="cell-wrap"><input type='text' style='width:100%' name="lls" value="" /></div></td>
									<td><div class="cell-wrap"><input type='text' style='width:100%' name="lhs" value="" /></div></td>
									<td><div class="cell-wrap">
										<select style="width:100%" name="lbs" id="lbs1<%=index %>">
											<option value="0">固定</option>
											<option value="1">录入字段</option>
											<option value="2">序号字段</option>
										</select>
									</div></td>
									<td><div class="cell-wrap"><input type='text' style='width:100%' name="lsx" value="" /></div></td>
									<td><div class="cell-wrap">
										<select style="width:100%" name="lsfjb" id="jbl1<%=index %>">
											<option value="0">否</option>
											<option value="1">是</option>
										</select>
									</div></td>
									<td><div class="cell-wrap">
										<select style="width:100%" name="lgs" id="lgs1<%=index %>">
											<option value="0">标题</option>
											<option value="1">表头</option>
											<option value="2">表体</option>
											<option value="3">表尾</option>
										</select>
										<script type="text/javascript">
											document.getElementById("lbs<%=index %>").value = "0";
											document.getElementById("lbs1<%=index %>").value = "1";
											document.getElementById("jbl<%=index %>").value = "0";
											document.getElementById("jbl1<%=index %>").value = "1";
										<%
											if ("2".equals(colvest)) { // 表体
										%>
											document.getElementById("lgs<%=index %>").value = "1";
										<%
											} else {
										%>
											document.getElementById("lgs<%=index %>").value = "<%=colvest %>";
										<%
											}
										%>
											document.getElementById("lgs1<%=index %>").value = "<%=colvest %>";
										</script>
									</div></td>
									<td><div class="cell-wrap">
										<input type="checkbox" onclick="f_delete_row(this);">
										<input type="hidden" name="jfid" value="" />
									</div></td>
								</tr>
								<%
										}
										rs_jg.close();
									}
								%>
								</tbody>
							<mt:addcolumn name="ac1">
								<tr>
									<td><div class="cell-wrap">
										<label name='xh'></label>
									</div></td>
									<td><div class="cell-wrap">
										<input name="lbm" type="text" style='width:100%' />
									</div></td>
									<td><div class="cell-wrap">
										<input name="lmc" type="text" style='width:100%' />
									</div></td>
									<td><div class="cell-wrap">
										<input name="lg" type="text" style="width:100%" />
									</div></td>
									<td><div class="cell-wrap">
										<input name="lk" type="text" style="width:100%" />
									</div></td>
									<td><div class="cell-wrap">
										<input name="llsx" type="text" style="width:100%" />
									</div></td>
									<td><div class="cell-wrap">
										<input name="lhsx" type="text" style="width:100%" />
									</div></td>
									<td><div class="cell-wrap">
										<input name="lls" type="text" style="width:100%" />
									</div></td>
									<td><div class="cell-wrap">
										<input name="lhs" type="text" style="width:100%" />
									</div></td>
									<td><div class="cell-wrap">
										<select name="lbs" style='width:100%'>
											<option value=0>固定</option>
											<option value=1>录入字段</option>
											<option value=2>序号字段</option>
										</select>
									</div></td>
									<td><div class="cell-wrap">
										<input name="lsx" type="text" style='width:100%' />
									</div></td>
									<td><div class="cell-wrap">
										<select name="lsfjb" style='width:100%'>
											<option value=0>否</option>
											<option value=1>是</option>
										</select>
									</div></td>
									<td><div class="cell-wrap">
										<select name="lgs" style='width:100%'>
											<option></option>
											<option value=0>标题</option>
											<option value=1>表头</option>
											<option value=2>表体</option>
											<option value=3>表尾</option>
										</select>
									</div></td>
									<td><div class="cell-wrap">
										<input type="checkbox" onclick="f_delete_row(this);">
										<input type="hidden" name="jfid" value="" />
									</div></td>
								</tr>
							</mt:addcolumn>
								<tr>
									<td colspan="14" class="tc p10">
										<input type="hidden" name="zbid" id="zbid" value="<%=zbid %>">
										<mt:addbutton other=" class='btn'" name="b1" table="t1"
											tablebody="zg_body" addobject="ac1" />&nbsp;
										<input class="btn" type="button" value="保存" onclick="page_submit_onclick()">&nbsp;
										<input class="btn" type="button" value="预览" onclick="preview()">
									</td>
								</tr>
							</table>
							<table class="w" name="t2" id="t2" style="display: none">
								<tr>
									<td colspan="4" class="tr">
										<div class="cell-wrap">
										报表结构类别：
										</div>
									</td>
									<td colspan="10">
										<select id="jfcolvest2" name="jfcolvest2" onchange="return page_redirect()">
											<option value="0">标题</option>
											<option value="1">表头</option>
											<option value="2">表体</option>
											<option value="3">表尾</option>
										</select>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<label>表体类别：</label>
										<select id="btlb" name="btlb" onchange="chgBT(this.value)">
											<option value="0">列定义</option>
											<option value="1" selected="selected">行定义</option>
										</select>
									</td>
								</tr>
								<tr>
									<td style="width: 35px"><div class="cell-wrap">序号</div></td>
						            <td style="width: 80px"><div class="cell-wrap">列编码</div></td>
						            <td><div class="cell-wrap">行名</div></td>
						            <td style="width: 45px"><div class="cell-wrap">列高</div></td>
						            <td style="width: 45px"><div class="cell-wrap">列宽</div></td>
						            <td style="width: 60px"><div class="cell-wrap">行行顺序</div></td>
						            <td style="width: 60px"><div class="cell-wrap">列行顺序</div></td>
						            <td style="width: 60px"><div class="cell-wrap">列列数</div></td>
						            <td style="width: 60px"><div class="cell-wrap">列行数</div></td>
						            <td style="width: 90px"><div class="cell-wrap">列标识</div></td>
						            <td style="width: 100px"><div class="cell-wrap">列属性</div></td>
						            <td style="width: 70px"><div class="cell-wrap">是否基本列</div></td>
						            <td style="width: 60px"><div class="cell-wrap">列归属</div></td>
						            <td style="width: 40px"><div class="cell-wrap">删除</div></td>
						        </tr>
								<tbody id="zg_body2" name="zg_body2">
								<%
									String sql_gs_h = "SELECT JFID,JFCOLCODE, JFCOLNAME, JFCOLHEIGHT, JFCOLWIDTH, JFDBBZB_ID,JFCOLORDER,JFCOLROWORD,JFCOLNUMBER,JFCOLROWS, JFCOLID, JFCOLATTR, JFBASECOL, JFCOLVEST FROM DBBZB_GS_H WHERE JFDBBZB_ID='" 
										+ zbid + "' ORDER BY JFCOLORDER";
									ResultSet rs_gs_h = stmt.executeQuery(sql_gs_h);
									index = 0;
									// 读取DBBZB_GS表数据
									while (rs_gs_h.next()) {
										index++;
								%>
									<tr>
										<td><div class="cell-wrap"><label><%=index %></label></div></td>
										<td><div class="cell-wrap"><input type='text' style='width:100%' name="lbm2" value="<%=cStr(rs_gs_h.getString("JFCOLCODE")) %>" /></div></td>
										<td><div class="cell-wrap"><input type='text' style='width:100%' name="lmc2" value="<%=cStr(rs_gs_h.getString("JFCOLNAME")) %>" /></div></td>
										<td><div class="cell-wrap"><input type='text' style='width:100%' name="lg2" value="<%=cStr(rs_gs_h.getString("JFCOLHEIGHT")) %>" /></div></td>
										<td><div class="cell-wrap"><input type='text' style='width:100%' name="lk2" value="<%=cStr(rs_gs_h.getString("JFCOLWIDTH")) %>" /></div></td>
										<td><div class="cell-wrap"><input type='text' style='width:100%' name="llsx2" value="<%=cStr(rs_gs_h.getString("JFCOLORDER")) %>" /></div></td>
										<td><div class="cell-wrap"><input type='text' style='width:100%' name="lhsx2" value="<%=cStr(rs_gs_h.getString("JFCOLROWORD")) %>" /></div></td>
										<td><div class="cell-wrap"><input type='text' style='width:100%' name="lls2" value="<%=cStr(rs_gs_h.getString("JFCOLNUMBER")) %>" /></div></td>
										<td><div class="cell-wrap"><input type='text' style='width:100%' name="lhs2" value="<%=cStr(rs_gs_h.getString("JFCOLROWS")) %>" /></div></td>
										<td><div class="cell-wrap">
											<select name="lbs2" style='width:100%' id="lbs02<%=index %>">
												<option value=0>固定</option>
												<option value=1>录入字段</option>
												<option value=2>序号字段</option>
											</select>
										</div></td>
										<td><div class="cell-wrap"><input type='text' style='width:100%' name="lsx2" value="<%=cStr(rs_gs_h.getString("JFCOLATTR")) %>" /></div></td>
										<td><div class="cell-wrap">
											<select style="width:100%" name="lsfjb2" id="jbl02<%=index %>">
												<option value="0">否</option>
												<option value="1">是</option>
											</select>
										</div></td>
										<td><div class="cell-wrap">
											<select style="width:100%" name="lgs2" id="lgs02<%=index %>">
												<option value="0">标题</option>
												<option value="1">表头</option>
												<option value="2">表体</option>
												<option value="3">表尾</option>
											</select>
										</div></td>
										<td><div class="cell-wrap">
											<input type="checkbox" value="<%=cStr(rs_gs_h.getString("JFID")) %>" onclick="f_delgs('r',this.value)" />
											<input type="hidden" name="jfid2" value="<%=cStr(rs_gs_h.getString("JFID")) %>" />
										</div></td>
									</tr>
									<script type="text/javascript">
										document.getElementById("lbs02<%=index %>").value = "<%=cStr(rs_gs_h.getString("JFCOLID")) %>";
										document.getElementById("jbl02<%=index %>").value = "<%=cStr(rs_gs_h.getString("JFBASECOL")) %>";
										document.getElementById("lgs02<%=index %>").value = "<%=cStr(rs_gs_h.getString("JFCOLVEST")) %>";
									</script>
								<%
									}
									rs_gs_h.close();
									stmt.close();
								%>
								</tbody>
							<mt:addcolumn name="ac2">
								<tr>
									<td><div class="cell-wrap">
										<label name='xh2'></label>
									</div></td>
									<td><div class="cell-wrap">
										<input name="lbm2" type="text" style='width:100%' />
									</div></td>
									<td><div class="cell-wrap">
										<input name="lmc2" type="text" style='width:100%' />
									</div></td>
									<td><div class="cell-wrap">
										<input name="lg2" type="text" style="width:100%" />
									</div></td>
									<td><div class="cell-wrap">
										<input name="lk2" type="text" style="width:100%" />
									</div></td>
									<td><div class="cell-wrap">
										<input name="llsx2" type="text" style="width:100%" />
									</div></td>
									<td><div class="cell-wrap">
										<input name="lhsx2" type="text" style="width:100%" />
									</div></td>
									<td><div class="cell-wrap">
										<input name="lls2" type="text" style="width:100%" />
									</div></td>
									<td><div class="cell-wrap">
										<input name="lhs2" type="text" style="width:100%" />
									</div></td>
									<td><div class="cell-wrap">
										<select name="lbs2" style='width:100%'>
											<option value=0>固定</option>
											<option value=1>录入字段</option>
											<option value=2>序号字段</option>
										</select>
									</div></td>
									<td><div class="cell-wrap">
										<input name="lsx2" type="text" style='width:100%' />
									</div></td>
									<td><div class="cell-wrap">
										<select name="lsfjb2" style='width:100%'>
											<option value=0>否</option>
											<option value=1>是</option>
										</select>
									</div></td>
									<td><div class="cell-wrap">
										<select name="lgs2" style='width:100%'>
											<option></option>
											<option value=0>标题</option>
											<option value=1>表头</option>
											<option value=2>表体</option>
											<option value=3>表尾</option>
										</select>
									</div></td>
									<td><div class="cell-wrap">
										<input type="checkbox" onclick="f_delete_row(this);">
										<input type="hidden" name="jfid2" value="" />
									</div></td>
								</tr>
							</mt:addcolumn>
								<tr>
									<td colspan="14" class="tc p10">
										<mt:addbutton other=" class='btn'" name="b2" table="t2"
											tablebody="zg_body2" addobject="ac2" />&nbsp;
										<input class="btn" type="button" value="保存" onclick="page_submit_onclick()">&nbsp;
										<input class="btn" type="button" value="预览" onclick="preview()">
									</td>
								</tr>
							</table>
							<input type="hidden" id="sfh" name="sfh" value="0" />
							<input type="hidden" id="dt" name="dt" value="" />
							<input id="delid" name="delid" type="hidden" value="" />
							<input id="act" name="act" type="hidden" value="" />
						</form>
						<script type="text/javascript">
						document.getElementById("jfcolvest").value = "<%=jglb %>";
						document.getElementById("jfcolvest2").value = "<%=jglb %>";
						
						function preview() {
							var zbid = document.getElementById("zbid").value;
							window.open("/insect/system/bb/view.jsp?zbid=" + zbid, "preview", "");
						}
						function page_redirect(){
						  window.location="?jfdbbzb_id="+f1.elements["zbid"].value+"&jfcolvest="+f1.elements["jfcolvest"].value
						  	+"&title_xx="+encodeURIComponent(encodeURIComponent($("#title_xx").html())) + "&zbid=<%=zbid %>";
						}
						function page_submit_onclick(){
							$("#act").val("save");
						   //if (verifyAll(f1)==false)return false
						   document.f1.submit();
						}
						window.onload = function(){
							chgBT(0);
						}
						function secBoard(n) {
							var title = document.getElementById("title_xx").innerHTML;
						    if (n==0) {
						        window.location = "/insect/sysbbgl.do?ACT_TYPE=QUERY&zbid=<%=zbid %>";
							} else if (n==1) {
						        window.location="/insect/system/bb/list1.jsp?zbid=<%=zbid %>&jfcolvest=" 
						        	+ document.getElementById("jfcolvest").value + "&title_xx=" + encodeURIComponent(encodeURIComponent(title));
						    }
						}
						function chgBT(val) {
							if (val == "1") {
								document.getElementById("_btlb").value = "0";
								document.getElementById("sfh").value = "1";
								//document.getElementById("t1").style.display = "none";
								//document.getElementById("t2").style.display = "block";
								$("#t1").hide();
								$("#t2").show();
							} else {
								document.getElementById("btlb").value = "1";
								document.getElementById("sfh").value = "0";
								//document.getElementById("t2").style.display = "none";
								//document.getElementById("t1").style.display = "block";
								$("#t2").hide();
								$("#t1").show();
							}
						}
						function f_delgs(t,id) {
							if (f_confirm()) {
								$("#dt").val(t);
								$("#act").val("delcr");
								$("#delid").val(id);
								$("#f1").submit();
							}
						}
						</script>
					</div>
				</div>
        	</div>
    	</div>
		<!-- menu -->
		<div class="layout-sub">
			<div class="layout-wrap">
				<%@include file="/menu.jsp"%>
			</div>
		</div>
	</div>
</div>
<!-- end content -->
<%@include file="/footer.jsp"%>
