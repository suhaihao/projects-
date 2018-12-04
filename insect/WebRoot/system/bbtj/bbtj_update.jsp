<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="����ͳ�ƶ���" />
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
						<h3 class="mod-tit">����ͳ�ƶ���</h3>
					</div>
					<div class="mod-bd">
						<form name="f1" method="post" action="">
						<mt:mastersheet>
						<table class="w">
							<tr>
								<td class="tr"><div class="cell-wrap">ͳ�Ʊ�������</div></td>
								<td><div class="cell-wrap">
									<input type="text" name="jfname" maxlength="50"
										style="width: 250px" value="<mt:ulabel name="d:jfname:str:s" />">
								</div></td>
								<td class="tr"><div class="cell-wrap">ͳ�Ʊ������</div></td>
								<td><div class="cell-wrap">
									<input type="text" name="jfcode" maxlength="20"
										value="<mt:ulabel name="d:jfcode:str:s" />">
								</div></td>
							</tr>
							<tr>
								<td class="tr"><div class="cell-wrap">�Ƿ��Զ���</div></td>
								<td><div class="cell-wrap">
									<mt:ufreeselect opttext="��:��" optvalue="0:1" name="d:jfyesno:str:s"></mt:ufreeselect>
								</div></td>
								<td class="tr"><div class="cell-wrap">Դ����</div></td>
								<td><div class="cell-wrap">
									<mt:uselect select="jfid,jftabname" datamember="dbbzb" name="d:jfdbbzb_id:str:s" where="jfstate in ('1','2') and jfcode like '%_N'"></mt:uselect>
								</div></td>
							</tr>
							<tr>
								<td class="tr"><div class="cell-wrap">��ѯ���</div></td>
								<td><div class="cell-wrap">
									<mt:ufreeselect opttext="����:˽��" optvalue="0:1" name="d:jfattribute:str:s"></mt:ufreeselect>
								</div></td>
								<td class="tr"><div class="cell-wrap">������Ա</div></td>
								<td><div class="cell-wrap"><mt:ulabel name="d:rymc:str:s" /></div></td>
							</tr>
							<tr>
								<td class="tr"><div class="cell-wrap">״̬</div></td>
								<td><div class="cell-wrap"><mt:ulabel name="d:zt:str:s" /></div></td> 
							</tr>
						</table>
						<table class="w">
							<tr>
								<td style="width:30%" class="tc" colspan="2"><div class="cell-wrap">ͳ�������</div></td>
							</tr>
							
							<tr>
								<td colspan="2">
									<iframe width="100%" height="300" frameborder="0" scrolling="no" name="output" id="output" 
									src="/insect/system/bbtj/output.jsp?dbbzb_tj_jfid=<mt:ulabel name="d:jfid:str:s" />&dbbzb_tj_lrry=<mt:ulabel name="d:JFLISTER:str:s" />&dbbzb_tj_zt=<mt:ulabel name="d:jfstate:str:s" />"></iframe>
								</td>
							</tr>
							
							<tr>
							<td style="width:35%" class="tc"><div class="cell-wrap">ͳ��������</div></td>
							<td style="width:35%" class="tc"><div class="cell-wrap">ͳ�Ʒ�ʽ��</div></td>
							</tr>
							
							<tr>
							    <td>
									<iframe width="100%" height="300" frameborder="0" scrolling="no" name="condition" id="condition" 
									src="/insect/system/bbtj/condition.jsp?dbbzb_tj_jfid=<mt:ulabel name="d:jfid:str:s" />&dbbzb_tj_lrry=<mt:ulabel name="d:JFLISTER:str:s" />&dbbzb_tj_zt=<mt:ulabel name="d:jfstate:str:s" />"></iframe>
								</td>
								<td>
									<iframe width="100%" height="300" frameborder="0" scrolling="no" name="sort" id="sort" 
									src="/insect/system/bbtj/sort.jsp?dbbzb_tj_jfid=<mt:ulabel name="d:jfid:str:s" />&dbbzb_tj_lrry=<mt:ulabel name="d:JFLISTER:str:s" />&dbbzb_tj_zt=<mt:ulabel name="d:JFSTATE:str:s" />"></iframe>
								</td> 
							</tr>
							<tr>
								<td colspan="3" class="tc p10">
									<input type="hidden" name="jfid" value="<mt:ulabel name="d:jfid:str:s" />">
									<input type="hidden" id="zt" name="zt" value="">
									<input type="hidden" name="dbbzb_jfid" value="<mt:ulabel name="d:JFDBBZB_ID:str:s" />">
									<input type="button" class="btn" value="��ͷ����" onclick="f_head('<mt:ulabel name="d:jfid:str:s" />','<mt:ulabel name="d:jfdbbzb_id:str:s" />')" />
									<input id="btnSave" class="btn" type="button" value="����" onclick="f_save(0)">
									<input id="btnSubmit" class="btn" type="button" value="�ύ" onclick="f_save(1)">
									<input id="btnCancel" class="btn" type="button" value="ȡ���ύ" onclick="f_save(0)">
									<input class="btn" type="button" value="�ر�" onclick="window.close()">
									<script type="text/javascript">
										var zt = '<mt:ulabel name="d:JFSTATE:str:s" />';
										if(zt=="1"){
											$("#btnSave").hide();
											$("#btnSubmit").hide();
										} else {
											$("#btnCancel").hide();
										}
									</script>
								</td>
							</tr>
						</table>
						</mt:mastersheet>
					</form>
					<script type="text/javascript">
						function f_back(){
							window.location = "/insect/system/bbtj/bbtj_list.jsp";
						}
						function f_head(zbid,dbbzb_id){
							window.open("/insect/sysbbtj_hd.do?ACT_TYPE=QUERY&dtjbb_id=" + zbid + "&dbbzb_id=" + dbbzb_id,"sysbbtj_head","");
						}
						function f_save(zt){
							document.getElementById("zt").value = zt;
							document.forms[0].action = "/insect/sysbbtj.do?ACT_TYPE=UPDATE";
							document.forms[0].submit();
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
