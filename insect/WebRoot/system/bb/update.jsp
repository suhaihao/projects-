<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="function.jsp" %>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="���������޸�" />
</jsp:include>
<script type="text/javascript">
function scb(jfid)
{
$.ajax({
            type:"post",
            url:"/insect/schtml.do?ACT_TYPE=QUERY",
            data:{code:jfid},
            dataType:"json",        
            async: false,
            error:function(XMLResponse){
            alert("����ʧ��");
            },
            success:function(data){
             $.each(data,function(key,city){
                alert(city);
             });
            }
       });
}
</script>
<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="���������޸�" name="last"/>
	</jsp:include>
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">���������޸�</h3>
					</div>
					<div class="mod-bd">
					<form name="f1" action="/insect/system/bb/update_ht.jsp" method="post">
					<%
						String jfid = request.getParameter("jfid");
						String sql = "select * from dbbzb where jfid='" + jfid + "'";
						QueryConnection qc = new QueryConnection();
						Statement stmt = qc.con.createStatement();
						ResultSet rs = stmt.executeQuery(sql);
						if (rs.next()) {
					%>
						<input type="hidden" name="jfid" id="jfid" value="<%=rs.getString("JFID") %>">
						<table class="w">
							<tr>
								<td width="15%" class="tr"><div class="cell-wrap">
									��������
								</div></td>
								<td width="35%"><div class="cell-wrap">
									<input type=text name="bbmc" chname="��������" nullable=no
										maxlength="50" style="width: 250px" value="<%=cStr(rs.getString("JFTABNAME")) %>">
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
									<input type=text name="bbbm" chname="�������" nullable=no
										maxlength="20" style="width: 158px" value="<%=cStr(rs.getString("JFCODE")) %>">
									<input type="hidden" name="bbbm_o" value="<%=cStr(rs.getString("JFCODE")) %>">
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
									<script type="text/javascript">
										var bblb = "<%=rs.getString("JFLB")%>";
										var lbs = bblb.split(",");
										$(lbs).each(function(idx){
											$("#bblb option[value='" + lbs[idx] + "']").attr("selected",true);
										});
									</script>
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
													chname="���������С" datatype="longint" 
													maxlength="3" value="<%=cStr(rs.getString("JFTITLESIZE")) %>">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="dx_subtitle"
													chname="�����������С" datatype="longint"
													maxlength="3" value="<%=cStr(rs.getString("JFSUBHEADSIZE")) %>">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="dx_tabtitle"
													chname="��ͷ�����С" datatype="longint"
													maxlength="3" value="<%=cStr(rs.getString("JFTABHEADSIZE")) %>">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="dx_tabbody"
													chname="���������С" datatype="longint"
													maxlength="3" value="<%=cStr(rs.getString("JFTABBODYSIZE")) %>">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="dx_tabend"
													chname="��β�����С" datatype="longint" 
													maxlength="3" value="<%=cStr(rs.getString("JFTABENDSIZE")) %>">
											</div></td>
										</tr>
										<tr>
											<td><div class="cell-wrap">
												���
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="kd_title"
													chname="������" datatype="longint" 
													maxlength="3" value="<%=cStr(rs.getString("JFTITLEWIDTH")) %>">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="kd_subtitle"
													chname="��������" datatype="longint"
													maxlength="3" value="<%=cStr(rs.getString("JFSUBHEADWIDTH")) %>">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="kd_tabtitle"
													chname="��ͷ���" datatype="longint" 
													maxlength="3" value="<%=cStr(rs.getString("JFTABHEADWIDTH")) %>">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="kd_tabbody"
													chname="������" datatype="longint" 
													maxlength="3" value="<%=cStr(rs.getString("JFTABBODYWIDTH")) %>">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="kd_tabend"
													chname="��β���" datatype="longint" 
													maxlength="3" value="<%=cStr(rs.getString("JFTABENDWIDTH")) %>">
											</div></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="4" class="tc p10">
									<input type="hidden" id="zt" name="zt" value="<%=rs.getString("JFSTATE") %>" />
									<input class="btn" type="button" value="����" onclick="page_submit_onclick('0')" />
									<%
										if ("0".equals(cStr(rs.getString("JFSTATE")))) {
									%>
									<input class="btn" type="button" value="����" onclick="page_submit_onclick('1')" />
									<%
										} else {
									%>
									<input class="btn" type="button" value="ȡ������" onclick="page_submit_onclick('2')" />
									<input class="btn" type="button" value="�鵵" onclick="page_submit_onclick('3')" />
									<%
										}
									%>
									<input class="btn" type="button" value="�ʱ�䶨��" onclick="tbsj()" />
									<input class="btn" type="button" value="����" onclick="window.location='list.jsp'" />
									<input class="btn" type="button" value="���ɱ�" onclick="scb(<%=jfid %>)" />
								</td>
							</tr>
						</table>
					<%
						}
						rs.close();
						stmt.close();
						qc.con.close();
					%>
					</form>
					<script type="text/javascript">
						function page_submit_onclick(zt) {
							document.getElementById('zt').value = zt;
							if (zt == "0") {
								document.forms[0].action = "add_ht.jsp";
							} else {
								document.forms[0].action = "update_ht.jsp";
							}
							document.forms[0].submit();
						}
						function tbsj(){
							window.open("/insect/system/bb/tbsj.jsp?id=<%=jfid%>","tbsjgl","");
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
