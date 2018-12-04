<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%
	String tb = request.getParameter("tb");
	String id = request.getParameter("id");
	String lx = (request.getParameter("lx") == null) ? (String)request.getAttribute("lx") : request.getParameter("lx");
%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="上传附件" />
</jsp:include>

<!-- start content -->
<div id="content">
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">上传附件</h3>
					</div>
					<div class="mod-bd">
						<form action="/insect/upload.do?ACT_TYPE=QUERY&tb=<%=tb %>&id=<%=id %>" method="post" enctype="multipart/form-data">
							<table class="w">
								<tr>
									<td class="tr" style="width:40%"><div class="cell-wrap">选择文件</div></td>
									<td><div class="cell-wrap">
										<input type="file" name="file" id="file" />
									</div></td>
								</tr>
							</table>
							<div class="tc p10">
								<a class="btn" href="javascript:void(0);" onclick="subform_other('<%=tb %>');return false;">提交</a>&nbsp;
								<a class="btn" href="javascript:void(0);" onclick="window.close();">取消</a>
							</div>
						</form>
					</div>
				</div>
        	</div>
    	</div>
	</div>
</div>
<script type="text/javascript" src="/insect/javascript/upload.js"></script>
<script type="text/javascript">
	$("body").css("min-height","300px");
	$("#content").css("min-height","300px");
	function f_refreshOpener() {
		opener.location.reload();
		window.location = "/insect/common/upload/upload.jsp?tb=<%=tb %>&id=<%=id %>&lx=<%=lx %>";
	}
	function subform_other(jc) {
		var file = document.getElementById("file");
		var ext = file.value.substr(file.value.lastIndexOf(".") + 1);
		var exts = "";
		if (file.value == "") {
			alert("请选择文件");
			return;
		}
		document.forms[0].submit();
	}
</script>
<mt:successrefresh successMes="成功!"/>
<!-- end content -->
<%@include file="/footer_nocopy.jsp"%>

<%--
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
  <head>
    <title>上传附件</title>
	<%@ include file="/header_nologo.jsp" %>
	<script type="text/javascript" src="/insect/javascript/CJL.0.1.min.js"></script>
	<script type="text/javascript" src="/insect/javascript/ImagePreviewd.js"></script>
  </head>
<%
	String tb = request.getParameter("tb");
	String id = request.getParameter("id");
	String lx = (request.getParameter("lx") == null) ? (String)request.getAttribute("lx") : request.getParameter("lx");
%>
  <body>
    <div id="container">
		<div class="big-title">
			<h2><span class="h2_img">上传附件</span></h2>
		</div>
		<div id="l_col_1">
			<div class="search-area">
				<form action="/insect/upload.do?ACT_TYPE=QUERY&tb=<%=tb %>&id=<%=id %>" method="post" enctype="multipart/form-data">
					<table class="form_2col" cellspacing="0">
						<tr id="tr_other" style="display: ">
							<th><label for="file"> 选择文件</label></th>
							<td>
								<input type="file" name="file" id="file" />
							</td>
						</tr>
					</table>
					<div class="main-btn-group">
						<a class="button" href="javascript:void(0);" onclick="subform_other('<%=tb %>');return false;" ><span><b class="ico_submit">提交</b></span></a>						
						<a class="button" href="javascript:void(0);" onClick="javascript:window.close();"><span><b class="ico_cancel">取消</b></span></a>
					</div>
				</form>
			</div>
		</div>
	</div>
  </body>
</html>
<script type="text/javascript" src="/insect/javascript/upload.js">
</script>
<script type="text/javascript">
	function f_refreshOpener() {
		opener.location.reload();
		window.location = "/insect/common/upload/upload.jsp?tb=<%=tb %>&id=<%=id %>&lx=<%=lx %>";
	}
function subform_other(jc) {
		var file = document.getElementById("file");
		var ext = file.value.substr(file.value.lastIndexOf(".") + 1);
		var exts = "";
			if (file.value == "") {
				alert("请选择文件");
				return;
			}
	document.forms[0].submit();
}</script>
<mt:successrefresh successMes="成功!"/>
 --%>