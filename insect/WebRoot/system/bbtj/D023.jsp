<%@ page language="java" import="java.util.*" pageEncoding="GBK"%><%@ taglib
	uri="/WEB-INF/mt.tld" prefix="mt"%><%@page
	import="com.jf.util.DrawTable"%><%@page import="com.jf.bchyj.bean.User"%><%@page
	import="java.util.Date"%><%@page import="java.text.DateFormat"%><%@page
	import="java.text.SimpleDateFormat"%>
<%@page import="mt.database.extend.ExecuteConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
<title>数据填报</title>
<script type="text/javascript"
	src="/insect/javascript/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/insect/javascript/function.js"></script>
<script type="text/javascript" src="/insect/javascript/jy.js"></script>
<script type="text/javascript"
	src="/insect/javascript/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/insect/javascript/common.js"></script>
</head>
<%
	String usebm = ((User) request.getSession().getAttribute("user"))
			.getBmbm();
	String usebmmc = ((User) request.getSession().getAttribute("user"))
			.getBmmc();
	String jfid = (String) request.getAttribute("jfid");
	String bbzt = (String) request.getAttribute("bbzt");
	String kstbrq = (String) request.getAttribute("kstbrq");
	String jztbrq = (String) request.getAttribute("jztbrq");
	String lb = (String) request.getAttribute("lb");
	String zbid = (String) request.getAttribute("zbid");
	String rwid = (String) request.getAttribute("rwid");
	String rwsj = (String) request.getAttribute("rwsj");
%>
<%
	ExecuteConnection ec = new ExecuteConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String onpent = "";
	try {
		String sql = "select jfcode,jfcodename from dsys11 where jfsort='FSCD' and jfcode!=0 order by jfid";
		pstmt = ec.con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			onpent += "<option value=\"" + rs.getString(1) + "\">"
					+ rs.getString(2) + "</option>";
		}
		rs.close();
		pstmt.close();
		ec.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<body>
	<%
		String JFID = "";
		String FSCD = "";
		String GLXTCCLBLNJZZJ = "";
		String EDNCYCMJ = "";
		String YJCCYHKSRQ = "";
		String FZMJ = "";
		String YJCCYHJSRQ = "";
		String GLXTJQPJCCL = "";
		
		String JFNO = "";
		String KSTBRQ = "";
		String JZTBRQ = "";
		String BBLX = "";
		String BMBM = "";
		String LRRQ = "";
		String LRRY = "";
		String RWSJ = "";
		String DCRQ = "";
		if (!bbzt.equals("0")) {
			ExecuteConnection ecbody = new ExecuteConnection();
			PreparedStatement pstmtbody = null;
			ResultSet rsbody = null;
			try {
				String sql = "select * from D023 where jfid=" + jfid;
				pstmtbody = ecbody.con.prepareStatement(sql);
				rsbody = pstmtbody.executeQuery();
				while (rsbody.next()) {
					JFID = rsbody.getString("JFID")==null?"":rsbody.getString("JFID");
					 FSCD = rsbody.getString("FSCD")==null?"":rsbody.getString("FSCD");
					 GLXTCCLBLNJZZJ = rsbody.getString("GLXTCCLBLNJZZJ")==null?"":rsbody.getString("GLXTCCLBLNJZZJ");
					 EDNCYCMJ = rsbody.getString("EDNCYCMJ")==null?"":rsbody.getString("EDNCYCMJ");
					 YJCCYHKSRQ = rsbody.getString("YJCCYHKSRQ").substring(0,
								rsbody.getString("YJCCYHKSRQ").length() - 10);
					 if(YJCCYHKSRQ==null)
					 {
						 YJCCYHKSRQ="";
					 }
					 FZMJ = rsbody.getString("FZMJ")==null?"":rsbody.getString("FZMJ");
					 YJCCYHJSRQ = rsbody.getString("YJCCYHJSRQ").substring(0,
								rsbody.getString("YJCCYHJSRQ").length() - 10);
					 if(YJCCYHJSRQ==null)
					 {
						 YJCCYHJSRQ="";
					 }
					 GLXTJQPJCCL = rsbody.getString("GLXTJQPJCCL")==null?"":rsbody.getString("GLXTJQPJCCL");
					
					JFNO = rsbody.getString("JFNO")==null?"":rsbody.getString("JFNO");
					KSTBRQ = rsbody.getString("KSTBRQ")==null?"":rsbody.getString("KSTBRQ");
					JZTBRQ = rsbody.getString("JZTBRQ")==null?"":rsbody.getString("KSTBRQ");
					BBLX = rsbody.getString("BBLX")==null?"":rsbody.getString("BBLX");
					BMBM = rsbody.getString("BMBM")==null?"":rsbody.getString("BMBM");
					LRRY = rsbody.getString("LRRY")==null?"":rsbody.getString("LRRY");
					RWSJ = rsbody.getString("RWSJ")==null?"":rsbody.getString("RWSJ");
					LRRQ = rsbody.getString("LRRQ").substring(0,
							rsbody.getString("LRRQ").length() - 2);
					DCRQ = rsbody.getString("DCRQ").substring(0,
							rsbody.getString("DCRQ").length() - 10);
				}
				rsbody.close();
				pstmtbody.close();
				ecbody.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>
	<form id="f1" name="f1" action="/insect/tjbcsj_t.do?ACT_TYPE=Q<%=zbid%>"
		method="post">
		<input name="DC" type="hidden" value="" /> <input name="JFID"
			type="hidden" value="<%=jfid%>" /> <input name="KSTBRQ"
			type="hidden" value="<%=kstbrq%>" /> <input name="RWSJ"
			type="hidden" value="<%=rwsj%>" /> <input name="JZTBRQ"
			type="hidden" value="<%=jztbrq%>" /> <input name="lb" type="hidden"
			value="<%=lb%>" /> <input name="zbid" type="hidden"
			value="<%=zbid%>" /> <input name="rwid" type="hidden"
			value="<%=rwid%>" /> <input name="ZT" type="hidden" value="0" />
		<%
			if (!bbzt.equals("2") && !bbzt.equals("3") && !bbzt.equals("4")) {
		%>
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td colspan=5 rowspan=1
					style="text-align:center;font-size=30;width: ;height: "><b>二代粘虫省站汇报模式报表(<%=rwsj%>)
				</b><br> <br></td>
			</tr>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">测报站点：<%=usebmmc%><input
					name="BMBM" type="hidden" value="<%=usebm%>" /></td>
				<td style="padding-left: 100px;padding-right: 100px;">上报日期：<input
					type="text" id="DCRQ" name="DCRQ"
					style="width:80;height: ;font-size:12" value="<%=DCRQ%>"
					 class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})"/></td>
			</tr>
		</table>
		<table border=1 borderColorDark=black borderColorLight=white
			cellpadding=1 cellspacing=1 align=center id=zg name=zg>
			<tbody id="zg_body">
				 <tr>
					<td style="text-align: center;">发生程度</td>
					<td><input style="width: 100%;" name="FSCD" type="text"
						value="<%=FSCD%>" alertname="发生程度必须为数字" datatype="number" /></td>
					<td style="text-align: center;">各类型田残虫量比历年均值增减(%)</td>
					<td><input style="width: 100%;" name="GLXTCCLBLNJZZJ" type="text"
						value="<%=GLXTCCLBLNJZZJ%>" alertname="各类型田残虫量比历年均值增减必须为数字" datatype="number" /></td>
				</tr>
				 <tr>
					<td style="text-align: center;">二代粘虫有虫面积(万亩)</td>
					<td><input style="width: 100%;" name="EDNCYCMJ" type="text"
						value="<%=EDNCYCMJ%>" alertname="二代粘虫有虫面积必须为数字" datatype="number" /></td>
					<td style="text-align: center;">预计成虫羽化盛期开始日期(月/日)</td>
					<td><input style="width: 100%;" name="YJCCYHKSRQ" type="text"
						value="<%=YJCCYHKSRQ%>" class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})" /></td>
				</tr>
				 <tr>
					<td style="text-align: center;">防治面积(万亩)</td>
					<td><input style="width: 100%;" name="FZMJ" type="text"
						value="<%=FZMJ%>" alertname="防治面积必须为数字" datatype="number" /></td>
					<td style="text-align: center;">预计成虫羽化盛期结束日期(月/日)</td>
					<td><input style="width: 100%;" name="YJCCYHJSRQ" type="text"
						value="<%=YJCCYHJSRQ%>" class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})" /></td>
				</tr>
				 <tr>
					<td style="text-align: center;">各类型田加权平均残虫量(头/平方米)</td>
					<td><input style="width: 100%;" name="GLXTJQPJCCL" type="text"
						value="<%=GLXTJQPJCCL%>" alertname="各类型田加权平均残虫量必须为数字" datatype="number" /></td>
				</tr>
			</tbody>
			<tr>
				<td colspan=100 align="center">
					<%
						if (!bbzt.equals("2") && !bbzt.equals("3") && !bbzt.equals("4")) {
					%> <input type="button" value="保存" id="btnSave" onclick="zt(0)" />&nbsp;&nbsp;
					<input type="button" value="提交" id="btnSubmit" onclick="zt(1)" />&nbsp;&nbsp;
					<input type=button value="上载" id="btnUpload" />
					<%
						} else {
					%> <input type=button value="导出Excel" id="btnExport" onclick="dc()" />
					<%
						}
					%> <!-- 
				<input type=button value="上载" id="btnUpload" /></td>
				 -->
			</tr>
		</table>
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">录入人员：<%=LRRY%></td>
				<td style="padding-left: 100px;padding-right: 100px;">录入日期：<%=LRRQ%></td>
			</tr>
		</table>
		<%
			} else {
		%>
	    <table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td colspan=5 rowspan=1
					style="text-align:center;font-size=30;width: ;height: "><b>二代粘虫省站汇报模式报表(<%=rwsj%>)
				</b><br> <br></td>
			</tr>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">测报站点：<%=usebmmc%><input
					name="BMBM" type="hidden" value="<%=usebm%>" /></td>
				<td style="padding-left: 100px;padding-right: 100px;">上报日期：<label><%=DCRQ%></label></td>
			</tr>
		</table>
		<table border=1 borderColorDark=black borderColorLight=white
			cellpadding=1 cellspacing=1 align=center id=zg name=zg>
			<tbody id="zg_body">
				 <tr>
					<td style="text-align: center;">发生程度</td>
					<td><label><%=FSCD%></label></td>
					<td style="text-align: center;">各类型田残虫量比历年均值增减(%)</td>
					<td><label><%=GLXTCCLBLNJZZJ%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">二代粘虫有虫面积(万亩)</td>
					<td><label><%=EDNCYCMJ%></label></td>
					<td style="text-align: center;">预计成虫羽化盛期开始日期(月/日)</td>
					<td><label><%=YJCCYHKSRQ%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">防治面积(万亩)</td>
					<td><label><%=FZMJ%></label></td>
					<td style="text-align: center;">预计成虫羽化盛期结束日期(月/日)</td>
					<td><label><%=YJCCYHJSRQ%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">各类型田加权平均残虫量(头/平方米)</td>
					<td><label><%=GLXTJQPJCCL%></label></td>
				</tr>
			</tbody>
			<tr>
				<td colspan=100 align="center">
					<%
						if (!bbzt.equals("2") && !bbzt.equals("3") && !bbzt.equals("4")) {
					%> <input type="button" value="保存" id="btnSave" onclick="zt(0)" />&nbsp;&nbsp;
					<input type="button" value="提交" id="btnSubmit" onclick="zt(1)" />
					<%
						} else {
					%> <input type=button value="导出Excel" id="btnExport" onclick="dc()" />
					<%
						}
					%> <!-- 
				<input type=button value="上载" id="btnUpload" /></td>
				 -->
			</tr>
		</table>
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">录入人员：<%=LRRY%></td>
				<td style="padding-left: 100px;padding-right: 100px;">录入日期：<%=LRRQ%></td>
			</tr>
		</table>
		<%
			}
		%>
	</form>
<div id="upLayer"
		style="display:none; width:300px; font-size:12px; border:#D8D8D8 4px solid; position:absolute; left:600px; top:100px; background-color:#F6F6F6">
		<form id="f2" name="f2"
			action="/insect/sjtb/xls_upload_n.jsp?jfid=<%=jfid %>&bbzt=<%=bbzt %>&kstbrq=<%=kstbrq %>&jztbrq=<%=jztbrq %>&lb=<%=lb %>&zbid=<%=zbid %>&rwid=<%=rwid %>&rwsj=<%=rwsj %>"
			method="post" enctype="multipart/form-data">
			<table style="text-align: center;width:100%">
				<tr>
					<td><align center>请录入需要上载的文件</align></td>
				</tr>
				<tr>
					<td><input id="file" name="file" type="file" style="width:90%"></td>
				</tr>
				<tr>
					<td><input type="button" value="确认" id="okUp">&nbsp;&nbsp;<input
						type="button" value="取消" id="cancelUp"></td>
				</tr>
			</table>
		</form>
  </div>
</body>
<script type="text/javascript">

$("#btnUpload").click(function(){
	$("#upLayer").show();
	});
    $("#cancelUp").click(function(){
    $("#upLayer").css("display","none");
    });
    $("#okUp").click(function(){
    	var path = $("#file").val();
    	if (path.indexOf(".xls") > 0) {
    		$("#f2").submit();
    	} else {
    	 alert("请选择Excel格式文件");
    	}
    });

	function zt(zt) {
		$("input[name='ZT']").val(zt);
		if (jysz()) {
			$("#f1").submit();
		}
	}
	function dc() {
		$("input[name='DC']").val("1");
		$("#f1").attr("action","/insect/ymscExcel.do?ACT_TYPE=Q<%=zbid%>");
		if (jysz()) {
			$("#f1").submit();
		}
	}
</script>
</html>