<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="报表管理-报表主表" />
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
						<form id="f1" name="f1" method="post" action="">
							<div class="tabs">
								<ul>
									<li class="on"><a href="javascript:secBoard(0)">报表主表</a></li>
									<li><a href="javascript:secBoard(1)">报表结构</a></li>
									<li><a href="javascript:secBoard(2)">报表格式</a></li>
									<li style="margin-left:150px;border:1px solid red;height:28px;text-align:center;display:none"><span id="title_xx"></span></li>
								</ul>
							</div>
							<table class="w">
								<thead>
									<tr>
										<td><div class="cell-wrap">序号</div></td>
										<td><div class="cell-wrap">编码</div></td>
										<td><div class="cell-wrap">表名</div></td>
										<td><div class="cell-wrap">制表人</div></td>
										<td><div class="cell-wrap">制表日期</div></td>
										<td><div class="cell-wrap">状态</div></td>
										<td><div class="cell-wrap">删除</div></td>
									</tr>
								</thead>
								<tbody id="zg_body">
								<mt:sheet pagesize="20">
									<tr onclick="row_color(this)">
										<td><div class="cell-wrap">
											<a act="modify" href="javascript:void(0);" id="<mt:vlabel name="d:jfid:str:s"/>"><mt:index /></a>
										</div></td>
										<td><div class="cell-wrap"><mt:vlabel name="d:jfcode:str:s"/></div></td>
										<td><mt:vlabel name="d:jftabname:str:s"/></td>
										<td><div class="cell-wrap"><mt:vlabel name="d:zbr:str:s"/></div></td>
										<td><div class="cell-wrap"><mt:vlabel name="d:zbrq:str:s"/></div></td>
										<td><div class="cell-wrap"><mt:vlabel name="d:jfstate:str:s"/></div></td>
										<td><div class="cell-wrap">
											<input type="checkbox" name="chkdel" value="<mt:vlabel name="d:jfid:str:s"/>" <mt:vlabel name="d:del:str:s"/>>
											<input type="hidden" name="jfid" value="<mt:vlabel name="d:jfid:str:s"/>">
										</div></td>
									</tr>
								</mt:sheet>
								</tbody>
								<tr>
									<td colspan="7">
										<div class="cell-wrap">
											<mt:pagenavigate/>
										</div>
									</td>
								</tr>
								<tr>
									<td class="tc p10" colspan="7">
										<input class="btn" type="button" value="增加" onclick="window.location='/insect/system/bb/add.jsp'" />&nbsp;
										<input class="btn" type="button" value="删除" onclick="f_del()" />
										<%--<input type=button value="查询" onclick="">
										<input type=button value="返回" onclick="">--%>
									</td>
								</tr>
							</table>
						</form>
						<script type="text/javascript">
						var row_value;
						function secBoard(n) {
							var title = document.getElementById("title_xx").innerHTML;
							if (!title) {
								alert("请先选择一张报表后再操作");
								return;
							}
							if (n == 1) {
								window.location="/insect/system/bb/list1.jsp?zbid=" + row_value + "&title_xx=" + encodeURIComponent(encodeURIComponent(title));
							}
							if (n == 2) {
								window.location="/insect/system/bb/list2.jsp?zbid=" + row_value + "&title_xx=" + encodeURIComponent(encodeURIComponent(title));
							}
						}
						function row_color(obj) {
							$("#title_xx").parent().show();
							if ($("#zg_body tr").length < 1) return;
							$("#zg_body tr").each(function(){
								$(this).children("td").css("backgroundColor", "#fff");
							});
							$(obj).children("td").css("backgroundColor", "lightblue");
							row_value = $(obj).find("input[name='jfid']").val();
							$("#title_xx").html($(obj).children("td").eq(2).html());
						}
						window.onload = function() {
							selectrow("${SYSBBGL_ZBID}");
						}
						function selectrow(objvalue) {
							if ($("#zg_body tr").length < 1) return;
							if (objvalue) {
								$("#zg_body tr td").find("input[name='jfid']").each(function(){
									if ($(this).val() == objvalue) {
										$(this).click();
										return false;
									}
								});
							}
						}
						function f_del() {
							var chked = false;
							$("input[type=checkbox]").each(function(){
								if(this.checked){
									chked = true;
								}
							});
							if(chked){
								if(f_confirm()){
									$("#f1").attr("action", "/insect/sysbbgl.do?ACT_TYPE=DEL");
									$("#f1").submit();
								} else {
									$("input[type=checkbox]").each(function(){
										$(this).attr("checked",false);
									});
								}
							} else {
								alert("请先选中再删除");
							}
						}
						$("a[act=modify]").on("click",function(){
							window.location = "/insect/system/bb/update.jsp?jfid=" + $(this).attr("id");
						});
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
<mt:messagedialog/>
<!-- end content -->
<%@include file="/footer.jsp"%>
