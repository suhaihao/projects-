<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="表头定义-报表统计定义" />
</jsp:include>

<div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
<div class="mod">
<!-- 
	<div class="mod-hd">
		<h3 class="mod-tit">表头定义-报表统计定义</h3>
	</div>
 -->
	<div class="mod-bd">
		<form id="f1" name="f1" method="post" action="">
			<table class="w" id="t1" name="t1">
				<thead>
					<tr>
						<td style="width: 50px"><div class="cell-wrap">序号</div></td>
			            <td style="width: 90px"><div class="cell-wrap">列编码</div></td>
			            <td><div class="cell-wrap">列名</div></td>
			            <td style="width: 90px"><div class="cell-wrap">列高</div></td>
			            <td style="width: 90px"><div class="cell-wrap">列宽</div></td>
			            <td style="width: 90px"><div class="cell-wrap">列列顺序</div></td>
			            <td style="width: 90px"><div class="cell-wrap">列行顺序</div></td>
			            <td style="width: 90px"><div class="cell-wrap">列列数</div></td>
			            <td style="width: 90px"><div class="cell-wrap">列行数</div></td>
			            <td style="width: 90px"><div class="cell-wrap">列属性</div></td>
			            <td style="width: 50px"><div class="cell-wrap">删除</div></td>
			        </tr>
				</thead>
				<tbody id="hd_body" name="hd_body">
				<mt:sheet pagesize="20">
				<tr>
					<td><div class="cell-wrap"><mt:index/></td>
					<td><div class="cell-wrap"><input type='text' style="width:100%" name="lbm" value="<mt:vlabel name="d:jfcolcode:str:s"/>" maxlength="10" /></div></td>
					<td><div class="cell-wrap"><input type='text' style="width:100%" name="lmc" value="<mt:vlabel name="d:jfcolname:str:s"/>" maxlength="25" /></div></td>
					<td><div class="cell-wrap"><input type='text' style="width:100%" name="lg" value="<mt:vlabel name="d:jfcolheight:str:s"/>" maxlength="3" datatype="int" /></div></td>
					<td><div class="cell-wrap"><input type='text' style="width:100%" name="lk" value="<mt:vlabel name="d:jfcolwidth:str:s"/>" maxlength="4" datatype="int" /></div></td>
					<td><div class="cell-wrap"><input type='text' style="width:100%" name="llsx" value="<mt:vlabel name="d:jfcolorder:str:s"/>" maxlength="3" datatype="int" /></div></td>
					<td><div class="cell-wrap"><input type='text' style="width:100%" name="lhsx" value="<mt:vlabel name="d:jfcolroword:str:s"/>" maxlength="3" datatype="int" /></div></td>
					<td><div class="cell-wrap"><input type='text' style="width:100%" name="lls" value="<mt:vlabel name="d:jfcolnumber:str:s"/>" maxlength="3" datatype="int" /></div></td>
					<td><div class="cell-wrap"><input type='text' style="width:100%" name="lhs" value="<mt:vlabel name="d:jfcolrows:str:s"/>" maxlength="3" datatype="int" /></div></td>
					<td><div class="cell-wrap"><input type='text' style="width:100%" name="lsx" value="<mt:vlabel name="d:jfcolattr:str:s"/>"/></div></td>
					<td><div class="cell-wrap">
						<input type="checkbox" onclick="f_del('<mt:vlabel name="d:jfid:str:s"/>')">
						<input type="hidden" name="jfid" value="<mt:vlabel name="d:jfid:str:s"/>" />
					</div></td>
				</tr>
				</mt:sheet>
				</tbody>
				<mt:addcolumn name="ac1">
				<tr>
					<td><div class="cell-wrap">
						<label name='xh'></label>
					</div></td>
					<td><div class="cell-wrap">
						<input name="lbm" type="text" style="width:100%" maxlength="10" />
					</div></td>
					<td><div class="cell-wrap">
						<input name="lmc" type="text" style="width:100%" maxlength="25" />
					</div></td>
					<td><div class="cell-wrap">
						<input name="lg" type="text" style="width:100%" maxlength="3" datatype="int" />
					</div></td>
					<td><div class="cell-wrap">
						<input name="lk" type="text" style="width:100%" maxlength="4" datatype="int" />
					</div></td>
					<td><div class="cell-wrap">
						<input name="llsx" type="text" style="width:100%" maxlength="3" datatype="int" />
					</div></td>
					<td><div class="cell-wrap">
						<input name="lhsx" type="text" style="width:100%" maxlength="3" datatype="int" />
					</div></td>
					<td><div class="cell-wrap">
						<input name="lls" type="text" style="width:100%" maxlength="3" datatype="int" />
					</div></td>
					<td><div class="cell-wrap">
						<input name="lhs" type="text" style="width:100%" maxlength="3" datatype="int" />
					</div></td>
					<td><div class="cell-wrap">
						<input name="lsx" type="text" style="width:100%" />
					</div></td>
					<td><div class="cell-wrap">
						<input type="checkbox" onclick="f_delete_row(this);">
						<input type="hidden" name="jfid" value="" />
					</div></td>
				</tr>
			</mt:addcolumn>
				<tr>
					<td colspan="11" class="tc p10">
						<input type="hidden" id="dtjbb_id" name="dtjbb_id" value="${DTJBB_ID}">
						<mt:addbutton other=" class='btn'" name="b1" table="t1" tablebody="hd_body" addobject="ac1" />
						<input type="button" class="btn" value="取源表头数据" onclick="f_old()" />
						<input type="button" class="btn" value="保存" onclick="f_save()" />
						<input type="button" class="btn" value="关闭" onclick="window.close()" />
					</td>
				</tr>
			</table>
			<script type="text/javascript">
				function f_save() {
					$("#f1").attr("action", "/insect/sysbbtj_hd.do?ACT_TYPE=UPDATE");
					$("#f1").submit();
				}
				function f_old() {
					window.location = "/insect/sysbbtj_hd.do?ACT_TYPE=QUERY2&dtjbb_id=${DTJBB_ID}&dbbzb_id=${DBBZB_ID}";
				}
				function f_del(id) {
					var chked = false;
					$("input[type=checkbox]").each(function(){
						if(this.checked){
							chked = true;
						}
					});
					if(chked){
						if(f_confirm()){
							$("#f1").attr("action", "/insect/sysbbtj_hd.do?ACT_TYPE=DEL&dbbzb_id=${DBBZB_ID}&dtjbb_id=" + $("#dtjbb_id").val() + "&id=" + id);
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
			</script>
		</form>
	</div>
</div>
</div>
    	</div>
	</div>
<mt:messagedialog/>
<mt:successrefresh/>
<!-- end content -->
<%@include file="/footer.jsp"%>
