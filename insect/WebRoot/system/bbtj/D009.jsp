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
		String CYMBZMJ = "";
		String YDYCSWBLBSNZJBL = "";
		String CYMBZMJBLNPJZZJBL = "";
		String PJHYL = "";
		String DCXZS = "";
		String YJCCYHSQKSRQ = "";
		String DCZGS = "";
		String YJCCYHSQJSRQ = "";
		String PJBGHCS = "";
		String CCYHGFQBLNPJZZWTS = "";
		String PJBGHCSBLNPJZZJBL = "";
		String YJYDFSMJBL = "";
		String PJBGHCSBSNZZJBL = "";
		String YJYDFSCD = "";
		String YDYCSWL = "";
		String YCFZSQKSRQ = "";
		String YDYCSWLBLNPJZZJBL = "";
		String YCFZSQJSRQ = "";
		String JFNO = "";
		String KSTBRQ = "";
		String JZTBRQ = "";
		String BBLX = "";
		String BMBM = "";
		String LRRQ = "";
		String LRRY = "";
		String RWSJ = "";
		String SBRQ = "";
		if (!bbzt.equals("0")) {
			ExecuteConnection ecbody = new ExecuteConnection();
			PreparedStatement pstmtbody = null;
			ResultSet rsbody = null;
			try {
				String sql = "select * from D009 where jfid=" + jfid;
				pstmtbody = ecbody.con.prepareStatement(sql);
				rsbody = pstmtbody.executeQuery();
				while (rsbody.next()) {
					 JFID = rsbody.getString("JFID")==null?"":rsbody.getString("JFID");
					 CYMBZMJ = rsbody.getString("CYMBZMJ")==null?"":rsbody.getString("CYMBZMJ");
					 YDYCSWBLBSNZJBL = rsbody.getString("YDYCSWBLBSNZJBL")==null?"":rsbody.getString("YDYCSWBLBSNZJBL");
					 CYMBZMJBLNPJZZJBL = rsbody.getString("CYMBZMJBLNPJZZJBL")==null?"":rsbody.getString("CYMBZMJBLNPJZZJBL");
					 PJHYL = rsbody.getString("PJHYL")==null?"":rsbody.getString("PJHYL");
					 DCXZS = rsbody.getString("DCXZS")==null?"":rsbody.getString("DCXZS");
					 YJCCYHSQKSRQ = rsbody.getString("YJCCYHSQKSRQ").substring(0,
								rsbody.getString("YJCCYHSQKSRQ").length() - 10);
					 if(YJCCYHSQKSRQ==null)
					 {
						 YJCCYHSQKSRQ="";
					 }
					 DCZGS = rsbody.getString("DCZGS")==null?"":rsbody.getString("DCZGS");
					 YJCCYHSQJSRQ = rsbody.getString("YJCCYHSQJSRQ").substring(0,
								rsbody.getString("YJCCYHSQJSRQ").length() - 10);
					 if(YJCCYHSQJSRQ==null)
					 {
						 YJCCYHSQJSRQ="";
					 }
					 PJBGHCS = rsbody.getString("PJBGHCS")==null?"":rsbody.getString("PJBGHCS");
					 CCYHGFQBLNPJZZWTS = rsbody.getString("CCYHGFQBLNPJZZWTS")==null?"":rsbody.getString("CCYHGFQBLNPJZZWTS");
					 PJBGHCSBLNPJZZJBL = rsbody.getString("PJBGHCSBLNPJZZJBL")==null?"":rsbody.getString("PJBGHCSBLNPJZZJBL");
					 YJYDFSMJBL = rsbody.getString("YJYDFSMJBL")==null?"":rsbody.getString("YJYDFSMJBL");
					 PJBGHCSBSNZZJBL = rsbody.getString("PJBGHCSBSNZZJBL")==null?"":rsbody.getString("PJBGHCSBSNZZJBL");
					 YJYDFSCD = rsbody.getString("YJYDFSCD")==null?"":rsbody.getString("YJYDFSCD");
					 YDYCSWL = rsbody.getString("YDYCSWL")==null?"":rsbody.getString("YDYCSWL");
					 YCFZSQKSRQ = rsbody.getString("YCFZSQKSRQ").substring(0,
								rsbody.getString("YCFZSQKSRQ").length() - 10);
					 if(YCFZSQKSRQ==null)
					 {
						 YCFZSQKSRQ="";
					 }
					 YDYCSWLBLNPJZZJBL = rsbody.getString("YDYCSWLBLNPJZZJBL")==null?"":rsbody.getString("YDYCSWLBLNPJZZJBL");
					 YCFZSQJSRQ = rsbody.getString("YCFZSQJSRQ").substring(0,
								rsbody.getString("YCFZSQJSRQ").length() - 10);
					 if(YCFZSQJSRQ==null)
					 {
						 YCFZSQJSRQ="";
					 }
					JFNO = rsbody.getString("JFNO")==null?"":rsbody.getString("JFNO");
					KSTBRQ = rsbody.getString("KSTBRQ")==null?"":rsbody.getString("KSTBRQ");
					JZTBRQ = rsbody.getString("JZTBRQ")==null?"":rsbody.getString("JZTBRQ");
					BBLX = rsbody.getString("BBLX")==null?"":rsbody.getString("BBLX");
					BMBM = rsbody.getString("BMBM")==null?"":rsbody.getString("BMBM");
					LRRY = rsbody.getString("LRRY")==null?"":rsbody.getString("LRRY");
					RWSJ = rsbody.getString("RWSJ")==null?"":rsbody.getString("RWSJ");
					LRRQ = rsbody.getString("LRRQ").substring(0,
							rsbody.getString("LRRQ").length() - 2);
					SBRQ = rsbody.getString("SBRQ").substring(0,
							rsbody.getString("SBRQ").length() - 10);
				
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
					style="text-align:center;font-size=30;width: ;height: "><b>玉米螟冬后基数模式报表(<%=rwsj%>)
				</b><br> <br></td>
			</tr>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">测报站点：<%=usebmmc%><input
					name="BMBM" type="hidden" value="<%=usebm%>" /></td>
				<td style="padding-left: 100px;padding-right: 100px;">上报日期：<input
					type="text" id="SBRQ" name="SBRQ"
					style="width:80;height: ;font-size:12" value="<%=SBRQ%>"
					 class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})"/></td>
			</tr>
		</table>
		<table border=1 borderColorDark=black borderColorLight=white
			cellpadding=1 cellspacing=1 align=center id=zg name=zg>
			<tbody id="zg_body">
				 <tr>
					<td style="text-align: center;">春玉米播种面积（万亩）</td>
					<td><input style="width: 100%;" name="CYMBZMJ" type="text"
						value="<%=CYMBZMJ%>" alertname="春玉米播种面积必须为数字" datatype="number" /></td>
					<td style="text-align: center;">越冬幼虫死亡率比上年值增减比率(±%)</td>
					<td><input style="width: 100%;" name="YDYCSWBLBSNZJBL" type="text"
						value="<%=YDYCSWBLBSNZJBL%>" alertname="越冬幼虫死亡率比上年值增减比率必须为数字" datatype="number" /></td>
				</tr>
				 <tr>
					<td style="text-align: center;">春玉米播种面积比历年平均值增减比率(%)</td>
					<td><input style="width: 100%;" name="CYMBZMJBLNPJZZJBL" type="text"
						value="<%=CYMBZMJBLNPJZZJBL%>" alertname="春玉米播种面积比历年平均值增减比率必须为数字" datatype="number" /></td>
					<td style="text-align: center;">平均化蛹率(%)</td>
					<td><input style="width: 100%;" name="PJHYL" type="text"
						value="<%=PJHYL%>" alertname="平均化蛹率必须为数字" datatype="number" /></td>
				</tr>
				 <tr>
					<td style="text-align: center;">调查乡镇数数(个)</td>
					<td><input style="width: 100%;" name="DCXZS" type="text"
						value="<%=DCXZS%>" alertname="调查乡镇数数必须为数字" datatype="number" /></td>
					<td style="text-align: center;">预计成虫羽化盛期开始日期(月/日)</td>
					<td><input style="width: 100%;" name="YJCCYHSQKSRQ" type="text"
						value="<%=YJCCYHSQKSRQ%>" class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})"/></td>
				</tr>
				 <tr>
					<td style="text-align: center;">调查总秆数(秆)</td>
					<td><input style="width: 100%;" name="DCZGS" type="text"
						value="<%=DCZGS%>" alertname="调查总秆数必须为数字" datatype="number" /></td>
					<td style="text-align: center;">预计成虫羽化盛期结束日期(月/日)</td>
					<td><input style="width: 100%;" name="YJCCYHSQJSRQ" type="text"
						value="<%=YJCCYHSQJSRQ%>" class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">平均百秆活虫数(头)</td>
					<td><input style="width: 100%;" name="PJBGHCS" type="text"
						value="<%=PJBGHCS%>" alertname="平均百秆活虫数必须为数字" datatype="number" /></td>
					<td style="text-align: center;">成虫羽化高峰期比历年平均值早晚天数(±天）</td>
					<td><input style="width: 100%;" name="CCYHGFQBLNPJZZWTS" type="text"
						value="<%=CCYHGFQBLNPJZZWTS%>" alertname="成虫羽化高峰期比历年平均值早晚天数必须为数字" datatype="number" /></td>
				</tr>
				<tr>
					<td style="text-align: center;">平均百秆活虫数比历年平均值增减比率(±%)</td>
					<td><input style="width: 100%;" name="PJBGHCSBLNPJZZJBL" type="text"
						value="<%=PJBGHCSBLNPJZZJBL%>" alertname="平均百秆活虫数比历年平均值增减比率必须为数字" datatype="number" /></td>
					<td style="text-align: center;">预计一代发生面积比率(%)</td>
					<td><input style="width: 100%;" name="YJYDFSMJBL" type="text"
						value="<%=YJYDFSMJBL%>" alertname="预计一代发生面积比率必须为数字" datatype="number" /></td>
				</tr>
				<tr>
					<td style="text-align: center;">平均百秆活虫数比上年值增减比率(±%)</td>
					<td><input style="width: 100%;" name="PJBGHCSBSNZZJBL" type="text"
						value="<%=PJBGHCSBSNZZJBL%>" alertname="平均百秆活虫数比上年值增减比率必须为数字" datatype="number" /></td>
					<td style="text-align: center;">预计一代发生程度</td>
					<td><input style="width: 100%;" name="YJYDFSCD" type="text"
						value="<%=YJYDFSCD%>" alertname="预计一代发生程度必须为数字" datatype="number" /></td>
				</tr>
				<tr>
					<td style="text-align: center;">越冬幼虫死亡率(%)</td>
					<td><input style="width: 100%;" name="YDYCSWL" type="text"
						value="<%=YDYCSWL%>" alertname="越冬幼虫死亡率必须为数字" datatype="number" /></td>
					<td style="text-align: center;">预测防治适期开始日期（月/日）</td>
					<td><input style="width: 100%;" name="YCFZSQKSRQ" type="text"
						value="<%=YCFZSQKSRQ%>" class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">越冬幼虫死亡率比历年平均值增减比率(±%)</td>
					<td><input style="width: 100%;" name="YDYCSWLBLNPJZZJBL" type="text"
						value="<%=YDYCSWLBLNPJZZJBL%>" alertname="越冬幼虫死亡率比历年平均值增减比率" datatype="number" /></td>
					<td style="text-align: center;">预测防治适期结束日期（月/日）</td>
					<td><input style="width: 100%;" name="YCFZSQJSRQ" type="text"
						value="<%=YCFZSQJSRQ%>" class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})"/></td>
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
					style="text-align:center;font-size=30;width: ;height: "><b>玉米螟冬后基数模式报表(<%=rwsj%>)
				</b><br> <br></td>
			</tr>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">测报站点：<%=usebmmc%><input
					name="BMBM" type="hidden" value="<%=usebm%>" /></td>
				<td style="padding-left: 100px;padding-right: 100px;">上报日期：<label><%=SBRQ%></label></td>
			</tr>
		</table>
		<table border=1 borderColorDark=black borderColorLight=white
			cellpadding=1 cellspacing=1 align=center id=zg name=zg>
			<tbody id="zg_body">
				 <tr>
					<td style="text-align: center;">春玉米播种面积（万亩）</td>
					<td><label><%=CYMBZMJ%></label></td>
					<td style="text-align: center;">越冬幼虫死亡率比上年值增减比率(±%)</td>
					<td><label><%=YDYCSWBLBSNZJBL%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">春玉米播种面积比历年平均值增减比率(%)</td>
					<td><label><%=CYMBZMJBLNPJZZJBL%></label></td>
					<td style="text-align: center;">平均化蛹率(%)</td>
					<td><label><%=PJHYL%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">调查乡镇数数(个)</td>
					<td><label><%=DCXZS%></label></td>
					<td style="text-align: center;">预计成虫羽化盛期开始日期(月/日)</td>
					<td><label><%=YJCCYHSQKSRQ%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">调查总秆数(秆)</td>
					<td><label><%=DCZGS%></label></td>
					<td style="text-align: center;">预计成虫羽化盛期结束日期(月/日)</td>
					<td><label><%=YJCCYHSQJSRQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">平均百秆活虫数(头)</td>
					<td><label><%=PJBGHCS%></label></td>
					<td style="text-align: center;">成虫羽化高峰期比历年平均值早晚天数(±天）</td>
					<td><label><%=CCYHGFQBLNPJZZWTS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">平均百秆活虫数比历年平均值增减比率(±%)</td>
					<td><label><%=PJBGHCSBLNPJZZJBL%></label></td>
					<td style="text-align: center;">预计一代发生面积比率(%)</td>
					<td><label><%=YJYDFSMJBL%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">平均百秆活虫数比上年值增减比率(±%)</td>
					<td><label><%=PJBGHCSBSNZZJBL%></label></td>
					<td style="text-align: center;">预计一代发生程度</td>
					<td><label><%=YJYDFSCD%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">越冬幼虫死亡率(%)</td>
					<td><label><%=YDYCSWL%></label></td>
					<td style="text-align: center;">预测防治适期开始日期（月/日）</td>
					<td><label><%=YCFZSQKSRQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">越冬幼虫死亡率比历年平均值增减比率(±%)</td>
					<td><label><%=YDYCSWLBLNPJZZJBL%></label></td>
					<td style="text-align: center;">预测防治适期结束日期（月/日）</td>
					<td><label><%=YCFZSQJSRQ%></label></td>
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