<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="����ͳ�ƶ���" />
</jsp:include>

<div class="mod">
<!-- 
	<div class="mod-hd">
		<h3 class="mod-tit">����ͳ�ƶ���</h3>
	</div>
 -->
	<div class="mod-bd">
		<form id="f1" name="f1" method="post" action="" target="_top">
			<table class="w">
				<thead>
					<tr>
						<td><div class="cell-wrap">���</div></td>
						<td><div class="cell-wrap">�������</div></td>
						<td><div class="cell-wrap">����</div></td>
						<td><div class="cell-wrap">�Ʊ���</div></td>
						<td><div class="cell-wrap">�Ʊ�����</div></td>
						<td><div class="cell-wrap">״̬</div></td>
						<td><div class="cell-wrap">ɾ��</div></td>
					</tr>
				</thead>
				<mt:sheet pagesize="20">
				<tr>
					<td><div class="cell-wrap"><mt:index/></td>
					<td><div class="cell-wrap"><a href="javascript:f_detail('<mt:vlabel name="d:jfid:str:s"/>')"><mt:vlabel name="d:jfcode:str:s"/></a></div></td>
					<td><div class="cell-wrap"><a href="javascript:f_detail('<mt:vlabel name="d:jfid:str:s"/>')"><mt:vlabel name="d:jfname:str:s"/></a></div></td>
					<td><div class="cell-wrap"><a href="javascript:f_detail('<mt:vlabel name="d:jfid:str:s"/>')"><mt:vlabel name="d:rymc:str:s"/></a></div></td>
					<td><div class="cell-wrap"><a href="javascript:f_detail('<mt:vlabel name="d:jfid:str:s"/>')"><mt:vlabel name="d:lrrq:str:s"/></a></div></td>
					<td><div class="cell-wrap"><a href="javascript:f_detail('<mt:vlabel name="d:jfid:str:s"/>')"><mt:vlabel name="d:zt:str:s"/></a></div></td>
					<td><div class="cell-wrap"><input type="checkbox" name="chkdel" value="<mt:vlabel name="d:jfid:str:s"/>" <mt:vlabel name="d:del:str:s"/> /></div></td>
				</tr>
				</mt:sheet>
				<tr>
					<td colspan="7">
					<div class="cell-wrap"><mt:pagenavigate/></div>
					</td>
				</tr>
				<tr>
					<td colspan="7" class="tc p10">
						<input type="button" class="btn" value="����" onclick="f_add()" />&nbsp;
						<input type="button" class="btn" value="ɾ��" onclick="f_del()" />
						<!-- <input type="button" class="btn" value="����" onclick="window.location='/insect/system/bbtj/bbtj_query.jsp'" /> -->
					</td>
				</tr>
			</table>
			<script type="text/javascript">
				function f_detail(id){
					//window.location = "/insect/sysbbtj.do?ACT_TYPE=MODIFY&jfid=" + id;
					window.open("/insect/sysbbtj.do?ACT_TYPE=MODIFY&jfid=" + id,"sysbbtj_update","");
				}
				function f_add(){
					//window.location = "/insect/sysbbtj.do?ACT_TYPE=MODIFY&jfid=" + id;
					window.open("/insect/system/bbtj/bbtj_add.jsp","sysbbtj_add","");
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
							$("#f1").attr("action", "/insect/sysbbtj.do?ACT_TYPE=DEL");
							$("#f1").attr("target", "_self");
							$("#f1").submit();
						} else {
							$("input[type=checkbox]").each(function(){
								$(this).attr("checked",false);
							});
						}
					} else {
						alert("����ѡ����ɾ��");
					}
				}
			</script>
		</form>
	</div>
</div>
<mt:messagedialog/>
<!-- end content -->
<%@include file="/footer_nocopy.jsp"%>
