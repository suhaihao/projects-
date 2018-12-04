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
		String DCXZGS = "";
		String DCZGS = "";
		String PJBGHCS = "";
		String PJBGHCZGSZ = "";
		String PJBGHCZGNF = "";
		String PJBGHCSBZGNFSLZJBL = "";
		String PJBGHCSBLNPJZZJBL = "";
		String YDYCYJSJZBSWL = "";
		String YDYCYJSFJSSWL = "";
		String YDYCSWL = "";
		String YDYCSWLBLNPJZZJBL = "";
		String YDYCSWLBSNZJBL = "";
		String JGCCLBLNPJZZJBL = "";
		String YJYDYMMFSCD = "";
		String JFNO = "";
		String KSTBRQ = "";
		String JZTBRQ = "";
		String BBLX = "";
		String BMBM = "";
		String LRRQ = "";
		String LRRY = "";
		String RWSJ = "";
		String SBRQ_B = "";
		String SBRQ_E = "";
		if (!bbzt.equals("0")) {
			ExecuteConnection ecbody = new ExecuteConnection();
			PreparedStatement pstmtbody = null;
			ResultSet rsbody = null;
			try {
				String sql = "select * from D008 where jfid=" + jfid;
				pstmtbody = ecbody.con.prepareStatement(sql);
				rsbody = pstmtbody.executeQuery();
				while (rsbody.next()) {
					JFID = rsbody.getString("JFID")==null?"":rsbody.getString("JFID");
					 DCXZGS = rsbody.getString("DCXZGS")==null?"":rsbody.getString("DCXZGS");
					 DCZGS = rsbody.getString("DCZGS")==null?"":rsbody.getString("DCZGS");
					 PJBGHCS = rsbody.getString("PJBGHCS")==null?"":rsbody.getString("PJBGHCS");
					 PJBGHCZGSZ = rsbody.getString("PJBGHCZGSZ")==null?"":rsbody.getString("PJBGHCZGSZ");
					 PJBGHCZGNF = rsbody.getString("PJBGHCZGNF")==null?"":rsbody.getString("PJBGHCZGNF");
					 PJBGHCSBZGNFSLZJBL = rsbody.getString("PJBGHCSBZGNFSLZJBL")==null?"":rsbody.getString("PJBGHCSBZGNFSLZJBL");
					 PJBGHCSBLNPJZZJBL = rsbody.getString("PJBGHCSBLNPJZZJBL")==null?"":rsbody.getString("PJBGHCSBLNPJZZJBL");
					 YDYCYJSJZBSWL = rsbody.getString("YDYCYJSJZBSWL")==null?"":rsbody.getString("YDYCYJSJZBSWL");
					 YDYCYJSFJSSWL = rsbody.getString("YDYCYJSFJSSWL")==null?"":rsbody.getString("YDYCYJSFJSSWL");
					 YDYCSWL = rsbody.getString("YDYCSWL")==null?"":rsbody.getString("YDYCSWL");
					 YDYCSWLBLNPJZZJBL = rsbody.getString("YDYCSWLBLNPJZZJBL")==null?"":rsbody.getString("YDYCSWLBLNPJZZJBL");
					 YDYCSWLBSNZJBL = rsbody.getString("YDYCSWLBSNZJBL")==null?"":rsbody.getString("YDYCSWLBSNZJBL");
					 JGCCLBLNPJZZJBL = rsbody.getString("JGCCLBLNPJZZJBL")==null?"":rsbody.getString("JGCCLBLNPJZZJBL");
					 YJYDYMMFSCD = rsbody.getString("YJYDYMMFSCD")==null?"":rsbody.getString("YJYDYMMFSCD");
					JFNO = rsbody.getString("JFNO")==null?"":rsbody.getString("JFNO");
					KSTBRQ = rsbody.getString("KSTBRQ")==null?"":rsbody.getString("KSTBRQ");
					JZTBRQ = rsbody.getString("JZTBRQ")==null?"":rsbody.getString("JZTBRQ");
					BBLX = rsbody.getString("BBLX")==null?"":rsbody.getString("BBLX");
					BMBM = rsbody.getString("BMBM")==null?"":rsbody.getString("BMBM");
					LRRY = rsbody.getString("LRRY")==null?"":rsbody.getString("LRRY");
					RWSJ = rsbody.getString("RWSJ")==null?"":rsbody.getString("RWSJ");
					LRRQ = rsbody.getString("LRRQ").substring(0,
							rsbody.getString("LRRQ").length() - 2);
					SBRQ_B = rsbody.getString("SBRQ_B").substring(0,
							rsbody.getString("SBRQ_B").length() - 10);
					SBRQ_E = rsbody.getString("SBRQ_E").substring(0,
							rsbody.getString("SBRQ_E").length() - 10);
				}
				rsbody.close();
				pstmtbody.close();
				ecbody.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>
	<form id="f1" name="f1" action="/insect/tjbcsj.do?ACT_TYPE=Q<%=zbid%>"
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
					style="text-align:center;font-size=30;width: ;height: "><b>玉米螟冬前越冬基数调查模式报表(<%=rwsj%>)
				</b><br> <br></td>
			</tr>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">测报站点：<%=usebmmc%><input
					name="BMBM" type="hidden" value="<%=usebm%>" /></td>
				<td style="padding-left: 100px;padding-right: 100px;">上报日期：<input
					type="text" id="SBRQ_B" name="SBRQ_B"
					style="width:80;height: ;font-size:12" value="<%=SBRQ_B%>"
					 class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})"
					onkeyup="changeiput(this)"/>-<input
					type="text" id="SBRQ_E" name="SBRQ_E"
					style="width:80;height: ;font-size:12" value="<%=SBRQ_E%>"
					 class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})"
					onkeyup="changeiput(this)"/></td>
			</tr>
		</table>
		<table border=1 borderColorDark=black borderColorLight=white
			cellpadding=1 cellspacing=1 align=center id=zg name=zg>
			<tbody id="zg_body">
				 <tr>
					<td style="text-align: center;">调查乡镇数(个)</td>
					<td><input style="width: 100%;" name="DCXZGS" type="text"
						value="<%=DCXZGS%>" alertname="调查乡镇数必须为数字" datatype="number" /></td>
					<td style="text-align: center;">越冬幼虫因寄生菌致病死亡率(%)</td>
					<td style="text-align: center;">\</td>
				</tr>
				 <tr>
					<td style="text-align: center;">调查总秆数(秆)</td>
					<td><input style="width: 100%;" name="DCZGS" type="text"
						value="<%=DCZGS%>" alertname="调查总秆数必须为数字" datatype="number" /></td>
					<td style="text-align: center;">越冬幼虫因寄生蜂(蝇)寄生死亡率(%)</td>
					<td style="text-align: center;">\</td>
				</tr>
				 <tr>
					<td style="text-align: center;">平均百秆活虫数(头/百秆)</td>
					<td><input style="width: 100%;" name="PJBGHCS" type="text"
						value="<%=PJBGHCS%>" alertname="平均百秆活虫数必须为数字" datatype="number" /></td>
					<td style="text-align: center;">越冬幼虫死亡率(%)</td>
					<td><input style="width: 100%;" name="YDYCSWL" type="text"
						value="<%=YDYCSWL%>" alertname="越冬幼虫死亡率必须为数字" datatype="number" /></td>
				</tr>
				 <tr>
					<td style="text-align: center;">平均百秆活虫最高数值（头）</td>
					<td><input style="width: 100%;" name="PJBGHCZGSZ" type="text"
						value="<%=PJBGHCZGSZ%>" alertname="平均百秆活虫最高数值必须为数字" datatype="number" /></td>
					<td style="text-align: center;">越冬幼虫死亡率比历年平均值增减比率(±%)</td>
					<td style="text-align: center;">\</td>
				</tr>
				<tr>
					<td style="text-align: center;">平均百秆活虫最高年份（年）</td>
					<td><input style="width: 100%;" name="PJBGHCZGNF" type="text"
						value="<%=PJBGHCZGNF%>" alertname="平均百秆活虫最高年份必须为数字" datatype="number" /></td>
					<td style="text-align: center;">越冬幼虫死亡率比上年值增减比率(±%)</td>
					<td style="text-align: center;">\</td>
				</tr>
				<tr>
					<td style="text-align: center;">平均百秆活虫数比最高年份数量增减比率(±%)</td>
					<td><input style="width: 100%;" name="PJBGHCSBZGNFSLZJBL" type="text"
						value="<%=PJBGHCSBZGNFSLZJBL%>" alertname="平均百秆活虫数比最高年份数量增减比率必须为数字" datatype="number" /></td>
					<td style="text-align: center;">秸秆贮存量比历年平均值增减比率(±%)</td>
					<td><input style="width: 100%;" name="JGCCLBLNPJZZJBL" type="text"
						value="<%=JGCCLBLNPJZZJBL%>" alertname="秸秆贮存量比历年平均值增减比率必须为数字" datatype="number" /></td>
				</tr>
				<tr>
					<td style="text-align: center;">平均百秆活虫数比历年平均值增减比率(±%)</td>
					<td><input style="width: 100%;" name="PJBGHCSBLNPJZZJBL" type="text"
						value="<%=PJBGHCSBLNPJZZJBL%>" alertname="平均百秆活虫数比历年平均值增减比率必须为数字" datatype="number" /></td>
					<td style="text-align: center;">预计一代玉米螟发生程度</td>
					<td><input style="width: 100%;" name="YJYDYMMFSCD" type="text"
						value="<%=YJYDYMMFSCD%>" alertname="预计一代玉米螟发生程度必须为数字" datatype="number" /></td>
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
					%> 
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
					style="text-align:center;font-size=30;width: ;height: "><b>玉米螟冬前越冬基数调查模式报表(<%=rwsj%>)
				</b><br> <br></td>
			</tr>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">测报站点：<%=usebmmc%><input
					name="BMBM" type="hidden" value="<%=usebm%>" /></td>
				<td style="padding-left: 100px;padding-right: 100px;">上报日期：<label><%=SBRQ_B%></label>-<label><%=SBRQ_E%></label></td>
			</tr>
		</table>
		<table border=1 borderColorDark=black borderColorLight=white
			cellpadding=1 cellspacing=1 align=center id=zg name=zg>
			<tbody id="zg_body">
				 <tr>
					<td style="text-align: center;">调查乡镇数(个)</td>
					<td><label><%=DCXZGS%></label></td>
					<td style="text-align: center;">越冬幼虫因寄生菌致病死亡率(%)</td>
					<td style="text-align: center;">\</td>
				</tr>
				 <tr>
					<td style="text-align: center;">调查总秆数(秆)</td>
					<td><label><%=DCZGS%></label></td>
					<td style="text-align: center;">越冬幼虫因寄生蜂(蝇)寄生死亡率(%)</td>
					<td style="text-align: center;">\</td>
				</tr>
				 <tr>
					<td style="text-align: center;">平均百秆活虫数(头/百秆)</td>
					<td><label><%=PJBGHCS%></label></td>
					<td style="text-align: center;">越冬幼虫死亡率(%)</td>
					<td><label><%=YDYCSWL%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">平均百秆活虫最高数值（头）</td>
					<td><label><%=PJBGHCZGSZ%></label></td>
					<td style="text-align: center;">越冬幼虫死亡率比历年平均值增减比率(±%)</td>
					<td style="text-align: center;">\</td>
				</tr>
				<tr>
					<td style="text-align: center;">平均百秆活虫最高年份（年）</td>
					<td><label><%=PJBGHCZGNF%></label></td>
					<td style="text-align: center;">越冬幼虫死亡率比上年值增减比率(±%)</td>
					<td style="text-align: center;">\</td>
				</tr>
				<tr>
					<td style="text-align: center;">平均百秆活虫数比最高年份数量增减比率(±%)</td>
					<td><label><%=PJBGHCSBZGNFSLZJBL%></label></td>
					<td style="text-align: center;">秸秆贮存量比历年平均值增减比率(±%)</td>
					<td><label><%=JGCCLBLNPJZZJBL%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">平均百秆活虫数比历年平均值增减比率(±%)</td>
					<td><label><%=PJBGHCSBLNPJZZJBL%></label></td>
					<td style="text-align: center;">预计一代玉米螟发生程度</td>
					<td><label><%=YJYDYMMFSCD%></label></td>
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
					%> 
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