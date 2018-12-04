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
	String DC = (String) request.getAttribute("DC");
	if(DC!=null&&DC.equals("1"))
	{
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("content-disposition","attachment;filename=\"D"+zbid+".xls\"");//下载
	}
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
		String YDZMJ = "";
		String YDHJMD = "";
		String YDHJMDBLNPJZJBL = "";
		String YDZCL = "";
		String YDZCLBSNZJBL = "";
		String SMC = "";
		String XMC = "";
		String JD = "";
		String WD = "";
		String YDZMJ_T = "";
		String YDHJMD_T = "";
		
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
				String sql = "select * from D017 where jfid=" + jfid;
				pstmtbody = ecbody.con.prepareStatement(sql);
				rsbody = pstmtbody.executeQuery();
				while (rsbody.next()) {
					JFID = rsbody.getString("JFID")==null?"":rsbody.getString("JFID");
					YDZMJ = rsbody.getString("YDZMJ")==null?"":rsbody.getString("YDZMJ");
					YDHJMD = rsbody.getString("YDHJMD")==null?"":rsbody.getString("YDHJMD");
					YDHJMDBLNPJZJBL = rsbody.getString("YDHJMDBLNPJZJBL")==null?"":rsbody.getString("YDHJMDBLNPJZJBL");
					YDZCL = rsbody.getString("YDZCL")==null?"":rsbody.getString("YDZCL");
					YDZCLBSNZJBL = rsbody.getString("YDZCLBSNZJBL")==null?"":rsbody.getString("YDZCLBSNZJBL");
					SMC = rsbody.getString("SMC")==null?"":rsbody.getString("SMC");
					XMC = rsbody.getString("XMC")==null?"":rsbody.getString("XMC");
					JD = rsbody.getString("JD")==null?"":rsbody.getString("JD");
					WD = rsbody.getString("WD")==null?"":rsbody.getString("WD");
					YDZMJ_T = rsbody.getString("YDZMJ_T")==null?"":rsbody.getString("YDZMJ_T");
					YDHJMD_T = rsbody.getString("YDHJMD_T")==null?"":rsbody.getString("YDHJMD_T");
					JFNO = rsbody.getString("JFNO")==null?"":rsbody.getString("JFNO");
					KSTBRQ = rsbody.getString("KSTBRQ")==null?"":rsbody.getString("KSTBRQ");
					JZTBRQ = rsbody.getString("JZTBRQ")==null?"":rsbody.getString("JZTBRQ");
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
		
    <table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td colspan=5 rowspan=1
					style="text-align:center;font-size=30;width: ;height: "><b>草地螟越冬情况省站模式报表(<%=rwsj%>)
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
			<tbody id="zg_head">
			<tr>
			<td style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>病虫名称</b></td>
			<td style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>越冬活茧密度（头/m2）</b></td>
			<td colspan="2" style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>越冬活茧密度比历年平均增减比率(％)</b></td>
			<td style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>越冬总虫量(万头) </b></td>
			<td style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>越冬总虫量比上年增减比率(％)</b></td>
			</tr>
			<tr>
			<td><label><%=YDZMJ%></label></td>
			<td><label><%=YDHJMD%></label></td>
			<td colspan="2" style="text-align: center;">\</td>
			<td><label><%=YDZCL%></label></td>
			<td style="text-align: center;">\</td>
			</tr>
			<tr>
			<td colspan="6" style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>越冬虫茧分布情况</b></td>
			</tr>
			<tr>
			<td style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>市（盟、地区）名称</b></td>
			<td style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>县（旗、区、市）名称</b></td>
			<td style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>经度</b></td>
			<td style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>纬度</b></td>
			<td style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>越冬总面积（万亩）</b></td>
			<td style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>越冬活茧密度（头/m2）</b></td>
			</tr>
			<tr>
			<td style="word-break: break-all;text-align:center; font-size:12;width: ;height: ">\</td>
			<td style="word-break: break-all;text-align:center; font-size:12;width: ;height: ">\</td>
			<td style="word-break: break-all;text-align:center; font-size:12;width: ;height: ">\</td>
			<td style="word-break: break-all;text-align:center; font-size:12;width: ;height: ">\</td>
			<td style="word-break: break-all;text-align:center; font-size:12;width: ;height: ">\</td>
			<td style="word-break: break-all;text-align:center; font-size:12;width: ;height: ">\</td>
			</tr>
			</tbody>
		</table>
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">录入人员：<%=LRRY%></td>
				<td style="padding-left: 100px;padding-right: 100px;">录入日期：<%=LRRQ%></td>
			</tr>
		</table>
	</form>
	<!-- 
	<div id="upLayer"
		style="display:none; width:300px; font-size:12px; border:#D8D8D8 4px solid; position:absolute; left:600px; top:100px; background-color:#F6F6F6">
		<form id="f2" name="f2" action="/insect/sjtb/xls_upload.jsp?"
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
	 -->
</body>
<script type="text/javascript">
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