<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="����������ϸ-������ֲ�ﱣ��վ" />
</jsp:include>
<!-- start content -->
<div id="content">
	<div class="breadcrumb"><ol><li class="home"> <a title="��ҳ" href="/insect/index.jsp">��ҳ</a></li><li> <span>����������ϸ</span></li></ol></div>
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">����������ϸ</h3>
					</div>
					<div class="mod-bd">
						<table class="w">
							<mt:sheet pagesize="1">
							<tr>
								<td width="30%" class="tr"><div class="cell-wrap">
									����:
								</div></td>
								<td width="20%"><div class="cell-wrap">
									<mt:vlabel name="d:qx:str:s"/>
								</div></td>
								<td width="20%" class="tr"><div class="cell-wrap">
									���:
								</div></td>
								<td width="30%"><div class="cell-wrap">
									<mt:vlabel name="d:nd:str:s"/>
								</div>
								</td>
							</tr>
							<tr>
								<td class="tr"><div class="cell-wrap">
									��������:
								</div></td>
								<td colspan="3"><div class="cell-wrap">
									<mt:vlabel name="d:bbmc:str:s"/>
								</div></td>
							</tr>
							<tr>
								<td class="tr"><div class="cell-wrap">
									��������:
								</div></td>
								<td colspan="3"><div class="cell-wrap">
									<mt:vlabel name="d:rwmc:str:s"/>
								</div></td>
							</tr>
							<tr>
								<td width="30%" class="tr"><div class="cell-wrap">
									�ϱ�����:
								</div></td>
								<td width="20%"><div class="cell-wrap">
									<mt:vlabel name="d:tbrq:str:s"/> (��-��)
								</div></td>
								<td width="20%" class="tr"><div class="cell-wrap">
								</div></td>
								<td width="30%"><div class="cell-wrap">
								</div></td>
							</tr>
							<tr>
								<td width="30%" class="tr"><div class="cell-wrap">
									��ʼ��ʾ����:
								</div></td>
								<td width="20%"><div class="cell-wrap">
									<mt:vlabel name="d:kststs:str:s"/>
								</div></td>
								<td width="20%" class="tr"><div class="cell-wrap">
									��ʼ�����:
								</div></td>
								<td width="30%"><div class="cell-wrap">
									<mt:vlabel name="d:kstbts:str:s"/>
								</div></td>
							</tr>
							<tr>
								<td width="30%" class="tr"><div class="cell-wrap">
									��ֹ�����:
								</div></td>
								<td width="20%"><div class="cell-wrap">
									<mt:vlabel name="d:jztbts:str:s"/>
								</div></td>
								<td width="20%" class="tr"><div class="cell-wrap">
									��ֹ�߱�����:
								</div></td>
								<td width="30%"><div class="cell-wrap">
									<mt:vlabel name="d:jzcbts:str:s"/>
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
									<input class="btn" type="button" value="�ر�" onclick="window.close()"/>
								</td>
							</tr>
						</mt:sheet>
						</table>
					</div>
				</div>
        	</div>
    	</div>
	</div>
</div>
<!-- end content -->
<%@include file="/footer.jsp"%>
