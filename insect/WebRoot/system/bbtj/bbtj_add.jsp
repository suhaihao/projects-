<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="报表统计定义" />
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
						<h3 class="mod-tit">报表统计定义</h3>
					</div>
					<div class="mod-bd">
					<form name="f1" method="post" action="">
						<table class="w">
							<tr>
								<td class="tr"><div class="cell-wrap">统计报表名称</div></td>
								<td><div class="cell-wrap">
									<input type="text" name="jfname" maxlength="50" style="width: 250px">
								</div></td>
								<td class="tr"><div class="cell-wrap">统计报表编码</div></td>
								<td><div class="cell-wrap">
									<input type="text" name="jfcode" maxlength="20">
								</div></td>
							</tr>
							<tr>
								<td class="tr"><div class="cell-wrap">是否自定义</div></td>
								<td><div class="cell-wrap">
									<select name="jfyesno">
										<option value="0">否</option>
										<option value="1">是</option>
									</select>
								</div></td>
								<td class="tr"><div class="cell-wrap">源报表</div></td>
								<td><div class="cell-wrap">
									<mt:freeselect select="jfid,jftabname" datamember="dbbzb" name="jfdbbzb_id" where="jfstate in ('1','2')"></mt:freeselect>
								</div></td>
							</tr>
							<tr>
								<td class="tr"><div class="cell-wrap">查询类别</div></td>
								<td><div class="cell-wrap">
									<select name="jfattribute">
										<option value="0">公开</option>
										<option value="1">私有</option>
									</select>
								</div></td>
								<td class="tr"><div class="cell-wrap">制作人员</div></td>
								<td><div class="cell-wrap"><%=((User)session.getAttribute("user")).getUsername() %></div></td>
							</tr>
							<tr>
								<td class="tr"><div class="cell-wrap">状态</div></td>
								<td><div class="cell-wrap">初始</div></td>
							</tr>
							<tr>
								<td colspan="4" class="tc p10">
									<input type="hidden" id="zt" name="zt" />
									<input id="btnSave" class="btn" type="button" value="保存" onclick="f_save(0)">
									<input id="btnSubmit" class="btn" type="button" value="提交" onclick="f_save(1)">
									<input class="btn" type="button" value="返回" onclick="f_back()">
								</td>
							</tr>
						</table>
					</form>
					<script type="text/javascript">
						function f_back(id,bb){
							window.location = "/insect/system/bbtj/bbtj_query.jsp";
						}
						function f_save(zt){
							document.getElementById("zt").value = zt;
							document.forms[0].action = "/insect/sysbbtj.do?ACT_TYPE=INSERT";
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
