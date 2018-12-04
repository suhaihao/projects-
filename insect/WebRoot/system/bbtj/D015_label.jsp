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
		String CCCJQ = "";
		String ZYJZDYDDCCYDYCFSYLCD = "";
		String CCCJQBLNZW = "";
		String YJYDFSCD = "";
		String DGLJYEL = "";
		String YJYDFSMJ = "";
		String DGLJYELBLNPJZJBL = "";
		String YJYDNTFSMJ = "";
		String JPCERQ = "";
		String YDNTFSMJBSNZJBL = "";
		String YEJCESZBL = "";
		String YJYDCCFSMJ = "";
		String SSJCESZBL = "";
		String YDCCFSMJBSNZJBL = "";
		String CCYFSMJ = "";
		String YJYDLDFSMJ = "";
		String CCFSMJBLNPJZJBL = "";
		String YDLDFSMJBSNZJBL = "";
		String YJYDFSXSMC = "";
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
				String sql = "select * from D015 where jfid=" + jfid;
				pstmtbody = ecbody.con.prepareStatement(sql);
				rsbody = pstmtbody.executeQuery();
				while (rsbody.next()) {
					 JFID = rsbody.getString("JFID")==null?"":rsbody.getString("JFID");
					 CCCJQ = rsbody.getString("CCCJQ").substring(0,
								rsbody.getString("CCCJQ").length() - 10);
					 if(CCCJQ==null)
					 {
						 CCCJQ="";
					 }
					 ZYJZDYDDCCYDYCFSYLCD = rsbody.getString("ZYJZDYDDCCYDYCFSYLCD")==null?"":rsbody.getString("ZYJZDYDDCCYDYCFSYLCD");
					 CCCJQBLNZW = rsbody.getString("CCCJQBLNZW")==null?"":rsbody.getString("CCCJQBLNZW");
					 YJYDFSCD = rsbody.getString("YJYDFSCD")==null?"":rsbody.getString("YJYDFSCD");
					 DGLJYEL = rsbody.getString("DGLJYEL")==null?"":rsbody.getString("DGLJYEL");
					 YJYDFSMJ = rsbody.getString("YJYDFSMJ")==null?"":rsbody.getString("YJYDFSMJ");
					 DGLJYELBLNPJZJBL = rsbody.getString("DGLJYELBLNPJZJBL")==null?"":rsbody.getString("DGLJYELBLNPJZJBL");
					 YJYDNTFSMJ = rsbody.getString("YJYDNTFSMJ")==null?"":rsbody.getString("YJYDNTFSMJ");
					 JPCERQ = rsbody.getString("JPCERQ").substring(0,
								rsbody.getString("JPCERQ").length() - 10);
					 if(JPCERQ==null)
					 {
						 JPCERQ="";
					 }
					 YDNTFSMJBSNZJBL = rsbody.getString("YDNTFSMJBSNZJBL")==null?"":rsbody.getString("YDNTFSMJBSNZJBL");
					 YEJCESZBL = rsbody.getString("YEJCESZBL")==null?"":rsbody.getString("YEJCESZBL");
					 YJYDCCFSMJ = rsbody.getString("YJYDCCFSMJ")==null?"":rsbody.getString("YJYDCCFSMJ");
					 SSJCESZBL = rsbody.getString("SSJCESZBL")==null?"":rsbody.getString("SSJCESZBL");
					 YDCCFSMJBSNZJBL = rsbody.getString("YDCCFSMJBSNZJBL")==null?"":rsbody.getString("YDCCFSMJBSNZJBL");
					 CCYFSMJ = rsbody.getString("CCYFSMJ")==null?"":rsbody.getString("CCYFSMJ");
					 YJYDLDFSMJ = rsbody.getString("YJYDLDFSMJ")==null?"":rsbody.getString("YJYDLDFSMJ");
					 CCFSMJBLNPJZJBL = rsbody.getString("CCFSMJBLNPJZJBL")==null?"":rsbody.getString("CCFSMJBLNPJZJBL");
					 YDLDFSMJBSNZJBL = rsbody.getString("YDLDFSMJBSNZJBL")==null?"":rsbody.getString("YDLDFSMJBSNZJBL");
					 YJYDFSXSMC = rsbody.getString("YJYDFSXSMC")==null?"":rsbody.getString("YJYDFSXSMC");
				
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
					style="text-align:center;font-size=30;width: ;height: "><b>草地螟越冬代成虫发生实况及一代预测模式报表(<%=rwsj%>)
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
					<td style="text-align: center;">成虫始见期（月/日）</td>
					<td><label><%=CCCJQ%></label></td>
					<td style="text-align: center;">主要寄主对越冬代成虫、一代幼虫发生有利程度</td>
					<td style="text-align: center;">\</td>
				</tr>
				 <tr>
					<td style="text-align: center;">成虫始见期比历年早晚（天）</td>
					<td><label><%=CCCJQBLNZW%></label></td>
					<td style="text-align: center;">预计一代发生程度（级）</td>
					<td style="text-align: center;">\</td>
				</tr>
				 <tr>
					<td style="text-align: center;">灯光累计诱蛾量（头）</td>
					<td><label><%=DGLJYEL%></label></td>
					<td style="text-align: center;">预计一代发生面积（万亩）</td>
					<td><label><%=YJYDFSMJ%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">灯光累计诱蛾量比历年平均增减比率(％)</td>
					<td><label><%=DGLJYELBLNPJZJBL%></label></td>
					<td style="text-align: center;">预计一代农田发生面积（万亩）</td>
					<td><label><%=YJYDNTFSMJ%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">解剖雌蛾日期（月/日）</td>
					<td><label><%=JPCERQ%></label></td>
					<td style="text-align: center;">一代农田发生面积比上年增减比率(％)</td>
					<td><label><%=YDNTFSMJBSNZJBL%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">1-2级雌蛾所占比率(％)</td>
					<td><label><%=YEJCESZBL%></label></td>
					<td style="text-align: center;">预计一代草场发生面积（万亩）</td>
					<td><label><%=YJYDCCFSMJ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">3-4级雌蛾所占比率(％)</td>
					<td><label><%=SSJCESZBL%></label></td>
					<td style="text-align: center;">一代草场发生面积比上年增减比率(％)</td>
					<td><label><%=YDCCFSMJBSNZJBL%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">成虫已发生面积（万亩）</td>
					<td><label><%=CCYFSMJ%></label></td>
					<td style="text-align: center;">预计一代林地发生面积（万亩）</td>
					<td><label><%=YJYDLDFSMJ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">成虫发生面积比历年平均增减比率(％) </td>
					<td><label><%=CCFSMJBLNPJZJBL%></label></td>
					<td style="text-align: center;">一代林地发生面积比上年增减比率(％)</td>
					<td><label><%=YDLDFSMJBSNZJBL%></label></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=1 style="text-align: center;">预计一代发生县、市名称</td>
					<td colspan=3 rowspan=1><label><%=YJYDFSXSMC%></label></td>
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