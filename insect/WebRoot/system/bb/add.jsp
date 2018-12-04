<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="报表主表添加" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="报表主表添加" name="last"/>
	</jsp:include>
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">报表主表添加</h3>
					</div>
					<div class="mod-bd">
						<form name="f1" action="/insect/system/bb/add_ht.jsp" method="post">
						<table class="w">
							<tr>
								<td width="15%" class="tr"><div class="cell-wrap">
									报表名称
								</div></td>
								<td width="35%"><div class="cell-wrap">
									<input type="text" name="bbmc" chname="表名" nullable="no"
										maxlength="50" style="width: 250px">
								</div></td>
								<td width="15%" class="tr"><div class="cell-wrap">
									报表种类
								</div></td>
								<td width="35%"><div class="cell-wrap">
									<select name="bbzl">
										<option value="1">
											普查表
										</option>
										<option value="0">
											系统表
										</option>
									</select>
								</div></td>
							</tr>
							<tr>
								<td width="15%" class="tr"><div class="cell-wrap">
									报表编码
								</div></td>
								<td width="35%"><div class="cell-wrap">
									<input type="text" name="bbbm" chname="部门名称" nullable="no"
										maxlength="20" style="width:158px">
								</div></td>
								<td width="15%" class="tr"><div class="cell-wrap">
									状态
								</div></td>
								<td width="35%"><div class="cell-wrap">
									初始
								</div></td>
							</tr>
							<tr>
								<td class="tr"><div class="cell-wrap">
									类别
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
												标题字体
											</div></td>
											<td width="20%"><div class="cell-wrap">
												副标题字
											</div></td>
											<td width="20%"><div class="cell-wrap">
												表头字体
											</div></td>
											<td width="20%"><div class="cell-wrap">
												表体字体
											</div></td>
											<td width="20%"><div class="cell-wrap">
												表尾字体
											</div></td>
										</tr>
										<tr>
											<td><div class="cell-wrap">
												加重
											</div></td>
											<td><div class="cell-wrap">
												<input type=radio name="jz_title" value="1" checked>
												是
												<input type=radio name="jz_title" value="0">
												否
											</div></td>
											<td><div class="cell-wrap">
												<input type=radio name="jz_subtitle" value="1" checked>
												是
												<input type=radio name="jz_subtitle" value="0">
												否
											</div></td>
											<td><div class="cell-wrap">
												<input type=radio name="jz_tabtitle" value="1" checked>
												是
												<input type=radio name="jz_tabtitle" value="0">
												否
											</div></td>
											<td><div class="cell-wrap">
												<input type=radio name="jz_tabbody" value="1">
												是
												<input type=radio name="jz_tabbody" value="0" checked>
												否
											</div></td>
											<td><div class="cell-wrap">
												<input type=radio name="jz_tabend" value="1" checked>
												是
												<input type=radio name="jz_tabend" value="0">
												否
											</div></td>
										</tr>
										<tr>
											<td><div class="cell-wrap">
												大小
											</div></td>
											<td><div class="cell-wrap">
												<input name="dx_title"
													chname="标题字体大小" datatype="longint" maxlength="3" value="30">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="dx_subtitle"
													chname="副标题字体大小" datatype="longint"
													maxlength="3" value="12">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="dx_tabtitle"
													chname="表头字体大小" datatype="longint"
													maxlength="3" value="12">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="dx_tabbody"
													chname="表体字体大小" datatype="longint"
													maxlength="3" value="12">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="dx_tabend"
													chname="表尾字体大小" datatype="longint" maxlength="3" value="12">
											</div></td>
										</tr>
										<tr>
											<td><div class="cell-wrap">
												宽度
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="kd_title"
													chname="标题宽度" datatype="longint" maxlength="3">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="kd_subtitle"
													chname="副标题宽度" datatype="longint"
													maxlength="3">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="kd_tabtitle"
													chname="表头宽度" datatype="longint" maxlength="3">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="kd_tabbody"
													chname="表体宽度" datatype="longint" maxlength="3">
											</div></td>
											<td><div class="cell-wrap">
												<input type="text" name="kd_tabend"
													chname="表尾宽度" datatype="longint" maxlength="3">
											</div></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="4" class="tc p10">
									<input class="btn" type="button" value="保存" name="dbbzb:submit1:Z"
										onclick="return page_submit_onclick()">&nbsp;
									<input class="btn" type="button" value="返回" onclick="window.location='list.jsp'">
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
