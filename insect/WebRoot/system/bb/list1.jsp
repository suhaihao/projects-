<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@ include file="function.jsp" %>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="报表管理-报表结构" />
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
						<form id="f1" name="f1" method="post" action="/insect/system/bb/list1_ht.jsp">
							<div class="tabs">
								<ul>
									<li><a href="javascript:secBoard(0)">报表主表</a></li>
									<li class="on"><a href="javascript:secBoard(1)">报表结构</a></li>
									<li><a href="javascript:secBoard(2)">报表格式</a></li>
									<li style="margin-left:150px;border:1px solid red;height:28px;text-align:center"><span id="title_xx">
									<%
										String zbid = request.getParameter("zbid");
										String title_xx = request.getParameter("title_xx");
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
									<td colspan="3" class="tr">
										<div class="cell-wrap">
										报表结构类别：
										</div>
									</td>
									<td colspan="11">
										<input type="hidden" name="dbbzb_jg:jfdbbzb_id:Z" value="<%=zbid %>">
										<select id="jfcolvest" name="jfcolvest" onchange="return page_redirect()">
											<option value="0">
												标题
											</option>
											<option value="1">
												表头
											</option>
											<option value="2">
												表体
											</option>
											<option value="3">
												表尾
											</option>
										</select>
									</td>
								</tr>
								<tr class="tc">
									<td><div class="cell-wrap">
										序号
									</div></td>
									<td>
										列名
									</td>
									<td>
										列编码
									</td>
									<td>
										列类型
									</td>
									<td>
										列长
									</td>
									<td>
										小数位数
									</td>
									<td>
										空
									</td>
									<td>
										列归属
									</td>
									<td>
										列处理方式
									</td>
									<td>
										列处理方法
									</td>
									<td>
										列计算关系
									</td>
									<td>
										列校验关系
									</td>
									<td>
										列校验提示
									</td>
									<td>
										级联关系
									</td>
									<td>
										删除
									</td>
								</tr>
								<tbody id="zg_body" name="zg_body">
								<%
								String jglb = request.getParameter("jfcolvest"); // 报表结构类别(0:标题;1:表头;2:表体;3:表尾)
								if (jglb == null || "".equals(jglb)) {
									jglb = "0";
								}
								String sql = "SELECT JFID, JFDBBZB_ID, JFCOLNAME, JFCOLID, JFCOLSTYLE, NVL(JFDECINUM,'0') JFDECINUM, JFCOLLENGTH, JFCOLVEST, "
									+ "JFCOLFASHION, JFCOLMEANS, NVL(JFCOLCOUNT,' ') JFCOLCOUNT, JFNULL,JFCOLJYGX,JFCOLJYTS,DY_JL_COL FROM DBBZB_JG WHERE JFDBBZB_ID='" + zbid + "' AND JFCOLVEST='" + jglb + "'";
								QueryConnection qc = new QueryConnection();
								Statement stmt = qc.con.createStatement();
								ResultSet rs = stmt.executeQuery(sql);
								int i = 1;
								while (rs.next()) {
									request.setAttribute("_I",i);
								%>
									<tr>
										<td><div class="cell-wrap"><label name="xh"><%=i %></label></div></td>
										<td><div class="cell-wrap">
											<input name="lmc" type="text" value="<%=cStr(rs.getString("JFCOLNAME")) %>" style="width:100px" />
										</div></td>
										<td><div class="cell-wrap">
											<input name="lbm" type="text" value="<%=cStr(rs.getString("JFCOLID")) %>" style="width:50px" />
										</div></td>
										<td><div class="cell-wrap">
											<select name="llx" id="llx<%=i %>">
												<option selected></option>
												<option value="1">日期</option>
												<option value="2">字符</option>
												<option value="3">数字</option>
											</select>
										</div></td>
										<td><div class="cell-wrap">
											<input name="lc" type="text" value="<%=cStr(rs.getString("JFCOLLENGTH")) %>" style="width:30px" />
										</div></td>
										<td><div class="cell-wrap">
											<input name="lxsws" type="text" value="<%=cStr(rs.getString("JFDECINUM")) %>" style="width:25px" />
										</div></td>
										<td><div class="cell-wrap">
											<select name="lnull" id="lnull<%=i %>">
												<option value=0>空</option>
												<option value=1>非空</option>
											</select>
										</div></td>
										<td><div class="cell-wrap">
											<select name="lgs" id="lgs<%=i %>">
												<option></option>
												<option value=0>标题</option>
												<option value=1>表头</option>
												<option value=2>表体</option>
												<option value=3>表尾</option>
											</select>
										</div></td>
										<td><div class="cell-wrap">
											<select name="lclfs" id="lclfs<%=i %>" style="width:65px">
												<option selected></option>
												<option value=1>文本框</option>
												<option value=2>下拉框</option>
												<option value=3>多选框</option>
												<option value=4>单选框</option>
												<option value=5>多行文本框</option>
												<option value=6>级联下拉框（父）</option>
											    <option value=7>级联下拉框（子）</option>
											</select>
										</div></td>
										<td><div class="cell-wrap">
											<mt:freeselect name="lclff" id="lclff${_I}" datamember="dsys11" select="jfcode,jfcodename" where="jfsort='BMLFF'" other="style='width:65px'">
											</mt:freeselect>
										</div></td>
										<td><div class="cell-wrap">
											<input name="ljsgx" type="text" value="<%=cStr(rs.getString("JFCOLCOUNT")) %>" style="width:70px" />
										</div></td>
										<td><div class="cell-wrap">
											<input name="ljygx" type="text" value="<%=cStr(rs.getString("JFCOLJYGX")) %>" style="width:70px" />
										</div></td>
										<td>
										<div class="cell-wrap">
											<input name="ljyts" type="text" value="<%=cStr(rs.getString("JFCOLJYTS")) %>" style="width:70px" />
										</div>
										</td>
										<!-- 新添级联 -->
										<td>
										<div class="cell-wrap">
											<input name="dy_jl_col" type="text" value="<%=cStr(rs.getString("DY_JL_COL")) %>" style="width:70px" />
										</div>
										</td>
										<td><div class="cell-wrap">
											<input type="checkbox" value="<%=cStr(rs.getString("JFID")) %>" onclick="f_deljg(this.value)">
											<input type="hidden" name="jfid" value="<%=cStr(rs.getString("JFID")) %>">
										</div>
										<script type="text/javascript">
											document.getElementById("llx<%=i %>").value = "<%=cStr(rs.getString("JFCOLSTYLE")) %>";
											document.getElementById("lnull<%=i %>").value = "<%=cStr(rs.getString("JFNULL")) %>";
											document.getElementById("lgs<%=i %>").value = "<%=cStr(rs.getString("JFCOLVEST")) %>";
											document.getElementById("lclfs<%=i %>").value = "<%=cStr(rs.getString("JFCOLFASHION")) %>";
											document.getElementById("lclff<%=i %>").value = "<%=cStr(rs.getString("JFCOLMEANS")) %>";
										</script>
										</td>
									</tr>
								<%
								i++;
								}
								rs.close();
								stmt.close();
								qc.close();
								%>
								</tbody>
							<mt:addcolumn name="ac1">
								<tr>
									<td><div class="cell-wrap">
										<label name='xh'></label>
									</div></td>
									<td><div class="cell-wrap">
										<input name="lmc" type="text" style="width:100px" />
									</div></td>
									<td><div class="cell-wrap">
										<input name="lbm" type="text" style="width:50px" />
									</div></td>
									<td><div class="cell-wrap">
										<select name="llx">
											<option selected></option>
											<option value=1>日期</option>
											<option value=2>字符</option>
											<option value=3>数字</option>
										</select>
									</div></td>
									<td><div class="cell-wrap">
										<input name="lc" type="text" style="width:30px" />
									</div></td>
									<td><div class="cell-wrap">
										<input name="lxsws" type="text" style="width:25px" />
									</div></td>
									<td><div class="cell-wrap">
										<select name="lnull">
											<option value=0>空</option>
											<option value=1>非空</option>
										</select>
									</div></td>
									<td><div class="cell-wrap">
										<select name="lgs">
											<option></option>
											<option value=0>标题</option>
											<option value=1>表头</option>
											<option value=2>表体</option>
											<option value=3>表尾</option>
										</select>
									</div></td>
									<td><div class="cell-wrap">
										<select name="lclfs" style="width:65px">
											<option selected></option>
											<option value=1>文本框</option>
											<option value=2>下拉框</option>
											<option value=3>多选框</option>
											<option value=4>单选框</option>
											<option value=5>多行文本框</option>
											<option value=6>级联下拉框（父）</option>
											<option value=7>级联下拉框（子）</option>
										</select>
									</div></td>
									<td><div class="cell-wrap">
										<mt:freeselect name="lclff" datamember="dsys11" select="jfcode,jfcodename" where="jfsort='BMLFF'" other="style='width:65px'">
										</mt:freeselect>
									</div></td>
									<td><div class="cell-wrap"><input name="ljsgx" type="text" style="width:70px" /></div></td>
									<td><div class="cell-wrap"><input name="ljygx" type="text" style="width:70px" /></div></td>
									<td><div class="cell-wrap"><input name="ljyts" type="text" style="width:70px" /></div></td>
									<td><div class="cell-wrap"><input name="dy_jl_col" type="text" style="width:70px" /></div></td>
									<td><div class="cell-wrap">
										<input type="checkbox" value='' onclick='f_delete_row(this);'>
										<input type="hidden" name="jfid" value="">
									</div></td>
								</tr>
							</mt:addcolumn>
								<tr>
									<td colspan="15" class="tc p10">
										<input id="act" name="act" type="hidden" value="" />
										<input id="delid" name="delid" type="hidden" value="" />
										<input name="zbid" type="hidden" value="<%=zbid %>" />
										<mt:addbutton other=" class='btn'" name="b1" table="t1"
											tablebody="zg_body" addobject="ac1" />&nbsp;
										<input class="btn" type="button" value="保存" name="submit1"
											onclick="return page_submit_onclick()">
									</td>
								</tr>
							</table>
						</form>
						<script type="text/javascript">
						document.getElementById("jfcolvest").value="<%=jglb %>";
						function page_redirect(){
							window.location="?jfdbbzb_id="+f1.elements["dbbzb_jg:jfdbbzb_id:Z"].value
								+"&jfcolvest="+f1.elements["jfcolvest"].value
								+"&title_xx="+encodeURIComponent(encodeURIComponent($("#title_xx").html())) + "&zbid=<%=zbid %>";
						}
						function page_submit_onclick(){
							$("#act").val("save");
							$("#f1").submit();
						}
						function secBoard(n) {
							var title = document.getElementById("title_xx").innerHTML;
							if (n==0) {
						        window.location = "/insect/sysbbgl.do?ACT_TYPE=QUERY&zbid=<%=zbid %>";
							} else if (n==2) {
						    	window.location="/insect/system/bb/list2.jsp?zbid=<%=zbid %>&jfcolvest=" 
									+ document.getElementById("jfcolvest").value + "&title_xx=" + encodeURIComponent(encodeURIComponent(title));
						    }
						}
						function f_deljg(id) {
							if (f_confirm()) {
								$("#act").val("deljg");
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
