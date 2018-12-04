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
			String YDDCC_NTFSMJ = "";
			String EDYC_CCFSMJ = "";
			String YDDCC_CCFSMJ = "";
			String EDYC_LDFSMJ = "";
			String YDDCC_LDFSMJ = "";
			String EDYC_FSZMJ = "";
			String YDDCC_FSZMJ = "";
			String EDYC_NTPJMD = "";
			String YDYC_NTFSMJ = "";
			String EDYC_NTFZMJ = "";
			String YDYC_CCFSMJ = "";
			String EDYC_CCFZMJ = "";
			String YDYC_LDFSMJ = "";
			String EDYC_LDFZMJ = "";
			String YDYC_FSZMJ = "";
			String EDCC_NTFZMJ = "";
			String YDYC_NTPJMD = "";
			String EDCC_CCFSMJ = "";
			String YDYC_NTFZMJ = "";
			String EDCC_LDFSMJ = "";
			String YDYC_CCFZMJ = "";
			String EDCC_FSZMJ = "";
			String YDYC_LDFZMJ = "";
			String SDYC_NTFSMJ = "";
			String YDCC_NTFSMJ = "";
			String SDYC_CCFSMJ = "";
			String YDCC_CCFSMJ = "";
			String SDYC_LDFSMJ = "";
			String YDCC_LDFSMJ = "";
			String SDYC_NTPJSL = "";
			String YDCC_FSZMJ = "";
			String SDYC_NTFZMJ = "";
			String EDYC_NTFSMJ = "";
			String SDYC_CCFZMJ = "";
			String SDYC_LDFZMJ = "";
			
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
			String sql = "select * from D018 where jfid=" + jfid;
			pstmtbody = ecbody.con.prepareStatement(sql);
			rsbody = pstmtbody.executeQuery();
			while (rsbody.next()) {
					JFID = rsbody.getString("JFID")==null?"":rsbody.getString("JFID");
					YDDCC_NTFSMJ = rsbody.getString("YDDCC_NTFSMJ")==null?"":rsbody.getString("YDDCC_NTFSMJ");
					EDYC_CCFSMJ = rsbody.getString("EDYC_CCFSMJ")==null?"":rsbody.getString("EDYC_CCFSMJ");
					YDDCC_CCFSMJ = rsbody.getString("YDDCC_CCFSMJ")==null?"":rsbody.getString("YDDCC_CCFSMJ");
					EDYC_LDFSMJ = rsbody.getString("EDYC_LDFSMJ")==null?"":rsbody.getString("EDYC_LDFSMJ");
					YDDCC_LDFSMJ = rsbody.getString("YDDCC_LDFSMJ")==null?"":rsbody.getString("YDDCC_LDFSMJ");
					EDYC_FSZMJ = rsbody.getString("EDYC_FSZMJ")==null?"":rsbody.getString("EDYC_FSZMJ");
					YDDCC_FSZMJ = rsbody.getString("YDDCC_FSZMJ")==null?"":rsbody.getString("YDDCC_FSZMJ");
					EDYC_NTPJMD = rsbody.getString("EDYC_NTPJMD")==null?"":rsbody.getString("EDYC_NTPJMD");
					YDYC_NTFSMJ = rsbody.getString("YDYC_NTFSMJ")==null?"":rsbody.getString("YDYC_NTFSMJ");
					EDYC_NTFZMJ = rsbody.getString("EDYC_NTFZMJ")==null?"":rsbody.getString("EDYC_NTFZMJ");
					YDYC_CCFSMJ = rsbody.getString("YDYC_CCFSMJ")==null?"":rsbody.getString("YDYC_CCFSMJ");
					EDYC_CCFZMJ = rsbody.getString("EDYC_CCFZMJ")==null?"":rsbody.getString("EDYC_CCFZMJ");
					YDYC_LDFSMJ = rsbody.getString("YDYC_LDFSMJ")==null?"":rsbody.getString("YDYC_LDFSMJ");
					EDYC_LDFZMJ = rsbody.getString("EDYC_LDFZMJ")==null?"":rsbody.getString("EDYC_LDFZMJ");
					YDYC_FSZMJ = rsbody.getString("YDYC_FSZMJ")==null?"":rsbody.getString("YDYC_FSZMJ");
					EDCC_NTFZMJ = rsbody.getString("EDCC_NTFZMJ")==null?"":rsbody.getString("EDCC_NTFZMJ");
					YDYC_NTPJMD = rsbody.getString("YDYC_NTPJMD")==null?"":rsbody.getString("YDYC_NTPJMD");
					EDCC_CCFSMJ = rsbody.getString("EDCC_CCFSMJ")==null?"":rsbody.getString("EDCC_CCFSMJ");
					YDYC_NTFZMJ = rsbody.getString("YDYC_NTFZMJ")==null?"":rsbody.getString("YDYC_NTFZMJ");
					EDCC_LDFSMJ = rsbody.getString("EDCC_LDFSMJ")==null?"":rsbody.getString("EDCC_LDFSMJ");
					YDYC_CCFZMJ = rsbody.getString("YDYC_CCFZMJ")==null?"":rsbody.getString("YDYC_CCFZMJ");
					EDCC_FSZMJ = rsbody.getString("EDCC_FSZMJ")==null?"":rsbody.getString("EDCC_FSZMJ");
					YDYC_LDFZMJ = rsbody.getString("YDYC_LDFZMJ")==null?"":rsbody.getString("YDYC_LDFZMJ");
					SDYC_NTFSMJ = rsbody.getString("SDYC_NTFSMJ")==null?"":rsbody.getString("SDYC_NTFSMJ");
					YDCC_NTFSMJ = rsbody.getString("YDCC_NTFSMJ")==null?"":rsbody.getString("YDCC_NTFSMJ");
					SDYC_CCFSMJ = rsbody.getString("SDYC_CCFSMJ")==null?"":rsbody.getString("SDYC_CCFSMJ");
					YDCC_CCFSMJ = rsbody.getString("YDCC_CCFSMJ")==null?"":rsbody.getString("YDCC_CCFSMJ");
					SDYC_LDFSMJ = rsbody.getString("SDYC_LDFSMJ")==null?"":rsbody.getString("SDYC_LDFSMJ");
					YDCC_LDFSMJ = rsbody.getString("YDCC_LDFSMJ")==null?"":rsbody.getString("YDCC_LDFSMJ");
					SDYC_NTPJSL = rsbody.getString("SDYC_NTPJSL")==null?"":rsbody.getString("SDYC_NTPJSL");
					YDCC_FSZMJ = rsbody.getString("YDCC_FSZMJ")==null?"":rsbody.getString("YDCC_FSZMJ");
					SDYC_NTFZMJ = rsbody.getString("SDYC_NTFZMJ")==null?"":rsbody.getString("SDYC_NTFZMJ");
					EDYC_NTFSMJ = rsbody.getString("EDYC_NTFSMJ")==null?"":rsbody.getString("EDYC_NTFSMJ");
					SDYC_CCFZMJ = rsbody.getString("SDYC_CCFZMJ")==null?"":rsbody.getString("SDYC_CCFZMJ");
					SDYC_LDFZMJ = rsbody.getString("SDYC_LDFZMJ")==null?"":rsbody.getString("SDYC_LDFZMJ");

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
					style="text-align:center;font-size=30;width: ;height: "><b>草地螟年度发生情况统计表(<%=rwsj%>)
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
					<td style="text-align: center;">越冬代成虫农田发生面积（万亩）</td>
					<td><label><%=YDDCC_NTFSMJ%></label></td>
					<td style="text-align: center;">二代幼虫草场发生面积（万亩）</td>
					<td><label><%=EDYC_CCFSMJ%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">越冬代成虫草场发生面积（万亩）</td>
					<td><label><%=YDDCC_CCFSMJ%></label></td>
					<td style="text-align: center;">二代幼虫林地发生面积（万亩）</td>
					<td>\</td>
				</tr>
				<tr>
					<td style="text-align: center;">越冬代成虫林地发生面积（万亩）</td>
					<td>\</td>
					<td style="text-align: center;">二代幼虫发生总面积（万亩）</td>
					<td><label><%=EDYC_FSZMJ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">越冬代成虫发生总面积（万亩）</td>
					<td><label><%=YDDCC_FSZMJ%></label></td>
					<td style="text-align: center;">二代幼虫农田平均密度（头/m2）</td>
					<td><label><%=EDYC_NTPJMD%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">一代幼虫农田发生面积（万亩）</td>
					<td><label><%=YDYC_NTFSMJ%></label></td>
					<td style="text-align: center;">二代幼虫农田防治面积（万亩）</td>
					<td><label><%=EDYC_NTFZMJ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">一代幼虫草场发生面积（万亩）</td>
					<td><label><%=YDYC_CCFSMJ%></label></td>
					<td style="text-align: center;">二代幼虫草场防治面积（万亩）</td>
					<td><label><%=EDYC_CCFZMJ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">一代幼虫林地发生面积（万亩）</td>
					<td>\</td>
					<td style="text-align: center;">二代幼虫林地防治面积（万亩）</td>
					<td>\</td>
				</tr>
				<tr>
					<td style="text-align: center;">一代幼虫发生总面积（万亩）</td>
					<td><label><%=YDYC_FSZMJ%></label></td>
					<td style="text-align: center;">二代成虫农田发生面积（万亩）</td>
					<td><label><%=EDCC_NTFZMJ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">一代幼虫农田平均密度（头/m2）</td>
					<td><label><%=YDYC_NTPJMD%></label></td>
					<td style="text-align: center;">二代成虫草场发生面积（万亩）</td>
					<td><label><%=EDCC_CCFSMJ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">一代幼虫农田防治面积（万亩）</td>
					<td><label><%=YDYC_NTFZMJ%></label></td>
					<td style="text-align: center;">二代成虫林地发生面积（万亩）</td>
					<td>\</td>
				</tr>
				<tr>
					<td style="text-align: center;">一代幼虫草场防治面积（万亩）</td>
					<td><label><%=YDYC_CCFZMJ%></label></td>
					<td style="text-align: center;">二代成虫发生总面积（万亩）</td>
					<td><label><%=EDCC_FSZMJ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">一代幼虫林地防治面积（万亩）</td>
					<td>\</td>
					<td style="text-align: center;">三代幼虫农田发生面积（万亩）</td>
					<td><label><%=SDYC_NTFSMJ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">一代成虫农田发生面积（万亩）</td>
					<td><label><%=YDCC_NTFSMJ%></label></td>
					<td style="text-align: center;">三代幼虫草场发生面积（万亩）</td>
					<td><label><%=SDYC_CCFSMJ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">一代成虫草场发生面积（万亩）</td>
					<td><label><%=YDCC_CCFSMJ%></label></td>
					<td style="text-align: center;">三代幼虫林地发生面积（万亩）</td>
					<td>\</td>
				</tr>
				<tr>
					<td style="text-align: center;">一代成虫林地发生面积（万亩）</td>
					<td>\</td>
					<td style="text-align: center;">三代幼虫农田平均数量（头/m2）</td>
					<td><label><%=SDYC_NTPJSL%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">一代成虫发生总面积（万亩） </td>
					<td><label><%=YDCC_FSZMJ%></label></td>
					<td style="text-align: center;">三代幼虫农田防治面积（万亩）</td>
					<td><label><%=SDYC_NTFZMJ%></label></td>
				</tr>
				<tr>
					<td rowspan="2" style="text-align: center;">二代幼虫农田发生面积（万亩） </td>
					<td rowspan="2"><label><%=EDYC_NTFSMJ%></label></td>
					<td style="text-align: center;">三代幼虫草场防治面积（万亩）</td>
					<td><label><%=SDYC_CCFZMJ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">三代幼虫林地防治面积（万亩） </td>
					<td>\</td>
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