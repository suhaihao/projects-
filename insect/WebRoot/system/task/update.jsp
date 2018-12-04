<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="�����޸�" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="�����޸�" name="last"/>
	</jsp:include>
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">�����޸�</h3>
					</div>
					<div class="mod-bd">
						<form id="f1" name="f1" action="/insect/systask.do?ACT_TYPE=UPDATE" method="post">
						<table class="w">
							<mt:sheet pagesize="1">
							<tr>
								<td width="30%" class="tr"><div class="cell-wrap">
									����:
								</div></td>
								<td width="20%"><div class="cell-wrap">
									<mt:freeselect id="bmbm" name="bmbm" datamember="dsys05" select="JFDEPTCODE,JFDEPTNAME" where="JFDEPTPROP='1' or JFDEPTPROP='2' and jfstate='1'" sort="JFDEPTCODE" />
								</div></td>
								<td width="20%" class="tr"><div class="cell-wrap">
									���:
								</div></td>
								<td width="30%"><div class="cell-wrap">
									<mt:freeselect id="nd" name="nd" datamember="DSYS11" select="JFCODE,JFCODENAME" where="JFSORT='BBYEAR'" sort="JFCODE" other=" style='width:78px'" />
								</div>
								<script type="text/javascript">
								$("#bmbm").val('<mt:vlabel name="d:bmbm:str:s"/>');
								$("#nd").val('<mt:vlabel name="d:nd:str:s"/>');
								</script>
								</td>
							</tr>
							<tr>
								<td class="tr"><div class="cell-wrap">
									��������:
								</div></td>
								<td colspan="3"><div class="cell-wrap">
									<input type="text" id="bbmc" name="bbmc" style="width:300px" readonly="readonly" value="<mt:vlabel name="d:bbmc:str:s"/>" />
									<input type="hidden" id="dbbzb_id" name="dbbzb_id" value="<mt:vlabel name="d:dbbzb_id:str:s"/>" />
									<a href="javascript:f_bbxz()">ѡ��</a>
								</div></td>
							</tr>
							<tr>
								<td width="30%" class="tr"><div class="cell-wrap">
									�����ʱ��:
								</div></td>
								<td width="20%"><div class="cell-wrap">
									<a href="javascript:f_tbsjxz('bmbm','nd','dbbzb_id')">ѡ��</a>
									<input type="hidden" id="tbrq_id" name="tbrq_id" value="<mt:vlabel name="d:dbbzb_tbrq_jfid:str:s"/>" />
								</div></td>
								<td width="20%" class="tr"><div class="cell-wrap">
									�ϱ�����:
								</div></td>
								<td width="30%"><div class="cell-wrap">
									<input type="text" id="sbrq" name="sbrq" style="width:75px" readonly="readonly" value="<mt:vlabel name="d:tbrq:str:s"/>" /> (��-��)
								</div></td>
							</tr>
							<tr>
								<td class="tr"><div class="cell-wrap">
									��������:
								</div></td>
								<td colspan="3"><div class="cell-wrap">
									<input type="text" id="rwmc" name="rwmc" style="width:300px" value="<mt:vlabel name="d:rwmc:str:s"/>" />
								</div></td>
							</tr>
							<tr>
								<td width="30%" class="tr"><div class="cell-wrap">
									��ʼ��ʾ����:
								</div></td>
								<td width="20%"><div class="cell-wrap">
									<input type="text" id="kststs" name="kststs" readonly="readonly" style="width:75px" value="<mt:vlabel name="d:kststs:str:s"/>" />
								</div></td>
								<td width="20%" class="tr"><div class="cell-wrap">
									��ʼ�����:
								</div></td>
								<td width="30%"><div class="cell-wrap">
									<input type="text" id="kstbts" name="kstbts" readonly="readonly" style="width:75px" value="<mt:vlabel name="d:kstbts:str:s"/>" />
								</div></td>
							</tr>
							<tr>
								<td width="30%" class="tr"><div class="cell-wrap">
									��ֹ�����:
								</div></td>
								<td width="20%"><div class="cell-wrap">
									<input type="text" id="jztbts" name="jztbts" readonly="readonly" style="width:75px" value="<mt:vlabel name="d:jztbts:str:s"/>" />
								</div></td>
								<td width="20%" class="tr"><div class="cell-wrap">
									��ֹ�߱�����:
								</div></td>
								<td width="30%"><div class="cell-wrap">
									<input type="text" id="jzcbts" name="jzcbts" readonly="readonly" style="width:75px" value="<mt:vlabel name="d:jzcbts:str:s"/>" />
								</div></td>
							</tr>
							<tr>
								<td width="30%" class="tr"><div class="cell-wrap">
									ʵ�������:
								</div></td>
								<td width="20%"><div class="cell-wrap">
									<mt:vlabel name="d:sjtbrq:str:s"/>
								</div></td>
								<td width="20%" class="tr"><div class="cell-wrap">
									ִ��״̬:
								</div></td>
								<td width="30%"><div class="cell-wrap">
									<mt:vlabel name="d:zxzt:str:s"/>
								</div></td>
							</tr>
							<tr>
								<td width="30%" class="tr"><div class="cell-wrap">
									���:
								</div></td>
								<td width="20%"><div class="cell-wrap">
									<mt:vlabel name="d:lb:str:s"/>
								</div></td>
								<td width="20%" class="tr"><div class="cell-wrap">
									¼������:
								</div></td>
								<td width="30%"><div class="cell-wrap">
									<mt:vlabel name="d:lrrq:str:s"/>
								</div></td>
							</tr>
							<tr>
								<td colspan="4" class="tc p10">
									<input type="hidden" id="jfid" name="jfid" value="<mt:vlabel name="d:jfid:str:s"/>" />
									<input type="hidden" id="kstbrq" value="<mt:vlabel name="d:kstbrq:str:s"/>" />
									<input type="hidden" id="rwzt" name="rwzt" value="<mt:vlabel name="d:zt:str:s"/>" />
									<input class="btn" type="button" value="����" id="btnSave" onclick="save('0')" style="display:none"/>
									<input class="btn" type="button" value="����" id="btnPub" onclick="save('1')" style="display:none"/>
									<input class="btn" type="button" value="ȡ������" id="btnCancel" onclick="f_cancel()" style="display:none"/>
									<input class="btn" type="button" value="ɾ��" id="btnDel" onclick="f_del()" style="display:none"/>
									<input class="btn" type="button" value="©������" id="btnAct" onclick="f_active()" style="display:none"/>
									<input class="btn" type="button" value="����" onclick="window.location='/insect/system/task/query.jsp'"/>
								</td>
							</tr>
						</mt:sheet>
						</table>
					</form>
					<script type="text/javascript">
						if ($("#rwzt").val() === "0") {
							$("#btnSave").show();
							$("#btnPub").show();
							$("#btnDel").show();
						} else if ($("#rwzt").val() === "1") {
							$("#btnCancel").show();
							$("#btnAct").show();
						}
						function save(zt) {
							var sysdate = new Date().getMilliseconds();
							var kstbrq = new Date($("#kstbrq").val()).getMilliseconds();
							if (sysdate > kstbrq) {
								if (!window.confirm("�Ƿ�ȷ��ɾ���޸�")) {
									return;
								}
							}
							$("#rwzt").val(zt);
							$("#f1").submit();
						}
						function f_cancel() {
							$("#f1").attr("action", "/insect/systask.do?ACT_TYPE=CANCEL");
							$("#f1").submit();
						}
						function f_active() {
							$("#f1").attr("action", "/insect/systask.do?ACT_TYPE=ACTIVE");
							$("#f1").submit();
						}
						function f_del() {
							if (window.confirm("�Ƿ�ȷ��ɾ���޸�")) {
								$("#f1").attr("action", "/insect/systask.do?ACT_TYPE=DEL");
								$("#f1").submit();
							}
						}
						$("#bmbm").on("change", function(){
							if ($("#bmbm").val() && $("#bbmc").val() && $("#sbrq").val()) {
								$("#rwmc").val($("#bmbm option:selected").text() + "_" +$("#bbmc").val() + "_" +$("#sbrq").val());
							}
						});
						function valRWMC(rq){
							$("#rwmc").val($("#bmbm option:selected").text() + "_" +$("#bbmc").val() + "_" + rq);
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
<mt:messagedialog/>
<!-- end content -->
<%@include file="/footer.jsp"%>
