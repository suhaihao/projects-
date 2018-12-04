<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="�����������" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="�����������" name="last"/>
	</jsp:include>
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">�����������</h3>
					</div>
					<div class="mod-bd">
						<form name="f1" action="/insect/system/bb/add_ht.jsp" method="post">
						<table class="w">
							<tr>
								<td width="15%" class="tr"><div class="cell-wrap">
									��������
								</div></td>
								<td width="35%"><div class="cell-wrap">
									<input type="text" name="bbmc" chname="����" nullable="no"
										maxlength="50" style="width: 250px">
								</div></td>
								<td width="15%" class="tr"><div class="cell-wrap">
									��������
								</div></td>
								<td width="35%"><div class="cell-wrap">
									<select name="bbzl">
										<option value="1">
											�ղ��
										</option>
										<option value="0">
											ϵͳ��
										</option>
									</select>
								</div></td>
							</tr>
							<tr>
								<td width="15%" class="tr"><div class="cell-wrap">
									�������
								</div></td>
								<td width="35%"><div class="cell-wrap">
									<input type="text" name="bbbm" chname="��������" nullable="no"
										maxlength="20" style="width:158px">
								</div></td>
								<td width="15%" class="tr"><div class="cell-wrap">
									״̬
								</div></td>
								<td width="35%"><div class="cell-wrap">
									��ʼ
								</div></td>
							</tr>
							<tr>
								<td class="tr"><div class="cell-wrap">
									���
								</div></td>
								<td colspan="3"><div class="cell-wrap">
									<mt:freeselect id="bblb" name="bblb" datamember="dsys11" select="jfcode,jfremark" where="jfsort='BBLB' and length(jfcode)=4" sort="jfid" other="multiple='multiple' size='5'"></mt:freeselect>
								</div></td>
							</tr>
							<tr>
								<td colspan="4">
									<table class="w">
										<tr>
											<td><div class="cell-wrap" style="width:60px"></div></td>
											<td width="20%"><div class="cell-wrap">
												��������
											</div></td>
											<td width="20%"><div class="cell-wrap">
												��������
											</div></td>
											<td width="20%"><div class="cell-wrap">
												��ͷ����
											</div></td>
											<td width="20%"><div class="cell-wrap">
												��������
											</div></td>
											<td width="20%"><div class="cell-wrap">
												��β����
											</div></td>
										</tr>
										<tr>
											<td><div class="cell-wrap">
												����
											</div></td>
											<td><div class="cell-wrap">
												<input type=radio name="jz_title" value="1" checked>
												��
												<input type=radio name="jz_title" value="0">
												��
											</div></td>
											<td><div class="cell-wrap">
												<input type=radio name="jz_subtitle" value="1" checked>
												��
												<input type=radio name="jz_subtitle" value="0">
												��
											</div></td>
											<td><div class="cell-wrap">
												<input type=radio name="jz_tabtitle" value="1" checked>
												��
												<input type=radio name="jz_tabtitle" value="0">
												��
											</div></td>
											<td><div class="cell-wrap">
												<input type=radio name="jz_tabbody" value="1">
												��
												<input type=radio name="jz_tabbody" value="0" checked>
												��
											</div></td>
											<td><div class="cell-wrap">
												<input type=radio name="jz_tabend" value="1" checked>
												��
												<input type=radio name="jz_tabend" value="0">
												��
											</div></td>
										</tr>
										<tr>
											<td><div class="cell-wrap">
												��С
											</div></td>
											<td><div class="cell-wrap">
												<input name="dx_title"
													chname="���������С" datatype="longint" maxlength="3" value="30">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="dx_subtitle"
													chname="�����������С" datatype="longint"
													maxlength="3" value="12">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="dx_tabtitle"
													chname="��ͷ�����С" datatype="longint"
													maxlength="3" value="12">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="dx_tabbody"
													chname="���������С" datatype="longint"
													maxlength="3" value="12">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="dx_tabend"
													chname="��β�����С" datatype="longint" maxlength="3" value="12">
											</div></td>
										</tr>
										<tr>
											<td><div class="cell-wrap">
												���
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="kd_title"
													chname="������" datatype="longint" maxlength="3">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="kd_subtitle"
													chname="��������" datatype="longint"
													maxlength="3">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="kd_tabtitle"
													chname="��ͷ���" datatype="longint" maxlength="3">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="kd_tabbody"
													chname="������" datatype="longint" maxlength="3">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="kd_tabend"
													chname="��β���" datatype="longint" maxlength="3">
											</div></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="4" class="tc p10">
									<input class="btn" type="button" value="����" name="dbbzb:submit1:Z"
										onclick="return page_submit_onclick()">&nbsp;
									<input class="btn" type="button" value="����" onclick="window.location='list.jsp'">
								</td>
							</tr>
						</table>
					</form>
					<script type="text/javascript">
						function page_submit_onclick() {
							/*for ( var i = 0; i < f1.jfplantsort.length; i++) {
								f1.jfplantsort.options[i].selected = true
							}
							for ( var i = 0; i < f1.jfwormsort.length; i++) {
								f1.jfwormsort[i].selected = true
							}*/
							document.forms[0].submit();
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
