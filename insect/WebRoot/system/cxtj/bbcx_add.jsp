<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%
	String jfid = request.getParameter("jfid");
	String bb = request.getParameter("bb");
	bb = java.net.URLDecoder.decode(bb, "UTF-8");
	User user = (User)session.getAttribute("user");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String lrrq = sdf.format(new Date());
%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="�����ѯ����" />
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
						<h3 class="mod-tit">�����ѯ����</h3>
					</div>
					<div class="mod-bd">
		<form name="f1" method="post" action="">
			<table class="w">
				<tr>
					<td class="tr"><div class="cell-wrap">��ѯ����</div></td>
					<td><div class="cell-wrap">
						<input type=text name="cxmc" maxlength="50" style="width: 250px" value="<%=bb %>">
					</div></td>
					<td class="tr"><div class="cell-wrap">��ѯ���</div></td>
					<td><div class="cell-wrap">
						<select name="cxlb">
							<option value="0">����</option>
							<option value="1">˽��</option>
						</select>
					</div></td>
				</tr>
				<tr>
					<td class="tr"><div class="cell-wrap">������Ա</div></td>
					<td><div class="cell-wrap">
						<%=user.getUsername() %>
					</div></td>
					<td class="tr"><div class="cell-wrap">��������</div></td>
					<td><div class="cell-wrap"><%=lrrq %></div></td>
				</tr>
				<tr>
					<td style="width:20%" class="tr"><div class="cell-wrap">״̬</div></td>
					<td style="width:30%"><div class="cell-wrap">��ʼ</div></td>
					<td style="width:20%">&nbsp;</td>
					<td style="width:30%">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4" class="tc p10">
						<input type="hidden" name="dbbzb_jfid" value="<%=jfid %>">
						<input class="btn" type="button" value="����" onclick="f_save()">
						<input class="btn" type="button" value="����" onclick="f_back('<%=jfid %>','<%=bb %>')">
					</td>
				</tr>
			</table>
		</form>
		<script type="text/javascript">
			function f_back(id,bb){
				window.location = "/insect/system/cxtj/bbcx_list.jsp?jfid=" + id + "&bb=" + encodeURIComponent(encodeURIComponent(bb));
			}
			function f_save(){
				document.forms[0].action = "/insect/sysbbcx.do?ACT_TYPE=INSERT";
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
