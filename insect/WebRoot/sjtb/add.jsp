<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%@page import="com.jf.util.DrawTable"%>
<html>
<head><title>数据填报</title>
<script type="text/javascript" src="/insect/javascript/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/insect/javascript/function.js"></script>
<script type="text/javascript">
function xuanze(obj)
{
var index = obj.selectedIndex;
var opnvalue=obj.options[index].value;
 $.ajax({
            type:"post",
            url:"/insect/cesdm.do?ACT_TYPE=QUERY",
            data:{code:opnvalue},
            dataType:"json",        
            async: false,
            error:function(XMLResponse){
            },
            success:function(data){
            var partr=obj.parentNode.parentNode;
            var sel=obj.parentNode.parentNode.childNodes; 
            for(var i=0; i<sel.length;i++){
            if(sel[i].nodeName == "#text")
            {
            partr.removeChild(sel[i]);
            }
            }
            
            var $sel=$(sel);
            var sels=$sel.find("select");
            //alert(sels[1].id);
            var newsel=partr.childNodes[2].firstChild
            var $jqsel=$(newsel);
              $jqsel.empty();
              $jqsel.append("<option value='0'>请选择市</option>");
              $.each(data,function(key,city){
              $jqsel.append("<option value="+city+">"+key+"</option>"); 
              }) 
            }
       });
}
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
<form id="f1" name="f1" action="/insect/sjtb/add_ht.jsp" method="post">
<%
	String zbid = request.getParameter("zbid");
	String rwid = request.getParameter("rwid");
	String lb = request.getParameter("lb");
	request.setAttribute("BBZT", "bc");
	DrawTable dt = new DrawTable();
	long starTime=System.currentTimeMillis();
	String html = dt.draw_table(zbid, "0", request);
	long endTime=System.currentTimeMillis();
	out.print(html);
%>
<input type="hidden" name="zbid" id="zbid" value="<%=zbid %>" />
<input type="hidden" name="rwid" value="<%=rwid %>" />
<input type="hidden" name="tblb" value="<%=lb %>" />
<input type="hidden" name="bbzt" id="bbzt" value="bc" />
</form>
<div id="upLayer" style="display:none; width:300px; font-size:12px; border:#D8D8D8 4px solid; position:absolute; left:600px; top:100px; background-color:#F6F6F6">
<form id="f2" name="f2" action="/insect/sjtb/xls_upload.jsp?zbid=<%=zbid %>&rwid=<%=rwid %>&lb=<%=lb %>" method="post" enctype="multipart/form-data">
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
</body>
</html>
