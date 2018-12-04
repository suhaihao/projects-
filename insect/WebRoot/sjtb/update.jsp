<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.jf.util.DrawTable"%>
<html>
<head><title>数据填报</title>
<script type="text/javascript" src="/insect/javascript/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/insect/javascript/function.js"></script>
<script type="text/javascript">
var jsgs = new Array();
var gsjg = new Array();
$(document).keyup(function(event){
    f_jsgs(event.target);
});
var jygx = new Array();
var jyts = new Array();
$(document).ready(function(){
	$("#btnAddRow").click(function(){ // add row
		add_row();
	});
	$("#btnDel").click(function(){ // delete row
		del_row();
	});
	$("#btnSave").click(function(){ // save
		$("#bbzt").val("bc");
		f_jygx();
		document.forms[0].submit();
	});
	$("#btnSubmit").click(function(){ // submit
		$("#bbzt").val("tj");
		$("input[name*='_HEAD:ZT']").val("1");
		f_jygx();
		document.forms[0].submit();
	});
	$("#okUp").click(function(){ // upload
		var path = $("#file").val();
		if (path.indexOf(".xls") > 0) {
			var _con_ = "";
			$("input[name*='_HEAD']").each(function(){
				_con_ += $(this).attr("name") + "," + $(this).val() + "@";
			});
			$("#f2").attr("action", $("#f2").attr("action") + "&hd=" + _con_);
			$("#f2").submit();
		} else {
			alert("请选择Excel格式文件");
		}
	});
	$("#btnUpload").click(function(){ // show upload layer
		$("#upLayer").show();
	});
	$("#cancelUp").click(function(){ // hide upload layer
		$("#upLayer").hide();
	});
	if (document.getElementById("hbs")) {
		$("#f2").attr("action", $("#f2").attr("action") + "&hbs=1");
	}
});
</script>
</head>
<body>
<form name="f1" action="/insect/sjtb/update_ht.jsp" method="post">
<%
	String zbid = request.getParameter("zbid");
	String jfid = request.getParameter("jfid");
	String rwid = request.getParameter("rwid");
	String lb = request.getParameter("lb");
	String bbzt = request.getParameter("bbzt");
	request.setAttribute("BBZT", bbzt);
	DrawTable dt = new DrawTable();
	dt.setJfid(jfid);
	//StringBuffer html = dt.draw_table(zbid, "2", request);
	//out.print(html.toString());
%>
<input type="hidden" name="zbid" id="zbid" value="<%=zbid %>" />
<input type="hidden" name="jfid" id="jfid" value="<%=jfid %>" />
<input type="hidden" name="rwid" value="<%=rwid %>" />
<input type="hidden" name="tblb" value="<%=lb %>" />
<input type="hidden" name="bbzt" id="bbzt" value="<%=bbzt %>" />
</form>
<div id="upLayer" style="display:none; width:300px; font-size:12px; border:#D8D8D8 4px solid; position:absolute; left:600px; top:100px; background-color:#F6F6F6">
<form id="f2" name="f2" action="/insect/sjtb/xls_upload.jsp?zbid=<%=zbid %>&rwid=<%=rwid %>&lb=<%=lb %>&jfid=<%=jfid %>" method="post" enctype="multipart/form-data">
	<table style="text-align: center;width:100%">
		<tr>
			<td><align center>请录入需要上载的文件</align></td>
		</tr>
		<tr>
			<td>
				<input id="file" name="file" type="file" style="width:90%">
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="确认" id="okUp">&nbsp;&nbsp;
				<input type="button" value="取消" id="cancelUp">
			</td>
		</tr>
	</table>
</form>
</div>
<script type="text/javascript">
	if($("#bbzt").val() == "tj"){
		$("#btnSave").hide();
		$("#btnSubmit").hide();
		$("#btnDel").hide();
		$("#btnUpload").hide();
		$("#btnAddRow").hide();
		$("#btnExport").show();
	}
	$("#btnExport").click(function(){ // export
		window.open("/insect/sjtb/xls_export.jsp?zbid=<%=zbid %>&jfid=<%=jfid %>","sjtb_export","");
	});
</script>
</body>
</html>