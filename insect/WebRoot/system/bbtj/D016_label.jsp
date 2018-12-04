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
		String YDYCFSCD = "";
		String YDYCFSXSMC = "";
		String YDDCCNTFSMJ = "";
		String JZZWYLYYCD = "";
		String YDDCCNTFSMJBLNPJZJBL = "";
		String YJEDFSCD = "";
		String YDDCCCCFSMJ = "";
		String YJEDYCFSWHSQKSRQ = "";
		String YDDCCLDFSMJ = "";
		String YJEDYCFSWHSQJSRQ = "";
		String YDYCNTFSMJ = "";
		String YJEDYCFSMJ = "";
		String YDYCNTFSMJBLNPJZJBL = "";
		String YJEDYCNTFSMJ = "";
		String YDYCCCFSMJ = "";
		String EDYCNTFSMJBSNZJBL = "";
		String YDYCLDFSMJ = "";
		String YJEDYCCCFSMJ = "";
		String YDYCNTMD = "";
		String YJEDYCLDFSMJ = "";
		String YDYCNTMDBLNPJZJBL = "";
		String YJEDYCFSXSMC = "";
		String YDYCNTFZMJ = "";
		String YJSDFSCD = "";
		String YDYCCCFZMJ = "";
		String YJSDYCFSWHSQKSRQ = "";
		String YDYCLDFZMJ = "";
		String YJSDYCFSWHSQJSRQ = "";
		String YDYCNTCLMJ = "";
		String YJSDYCFSMJ = "";
		String YDYCNTCLMJBLNPJZJBL = "";
		String YJSDYCNTFSMJ = "";
		String YDYCCCCLMJ = "";
		String SDYCNTFSMJBSNZJBL = "";
		String YDYCLDCLMJ = "";
		String YJSDYCCCFSMJ = "";
		String YDYCNTCLMD = "";
		String YJSDYCLDFSMJ = "";
		String YDYCNTCLMDBLNPJZJBL = "";
		String YJSDYCFSXSMC = "";
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
				String sql = "select * from D016 where jfid=" + jfid;
				pstmtbody = ecbody.con.prepareStatement(sql);
				rsbody = pstmtbody.executeQuery();
				while (rsbody.next()) {
					JFID = rsbody.getString("JFID")==null?"":rsbody.getString("JFID");
					YDYCFSCD = rsbody.getString("YDYCFSCD")==null?"":rsbody.getString("YDYCFSCD");
					YDYCFSXSMC = rsbody.getString("YDYCFSXSMC")==null?"":rsbody.getString("YDYCFSXSMC");
					YDDCCNTFSMJ = rsbody.getString("YDDCCNTFSMJ")==null?"":rsbody.getString("YDDCCNTFSMJ");
					JZZWYLYYCD = rsbody.getString("JZZWYLYYCD")==null?"":rsbody.getString("JZZWYLYYCD");
					YDDCCNTFSMJBLNPJZJBL = rsbody
							.getString("YDDCCNTFSMJBLNPJZJBL")==null?"":rsbody.getString("YDDCCNTFSMJBLNPJZJBL");
					YJEDFSCD = rsbody.getString("YJEDFSCD")==null?"":rsbody.getString("YJEDFSCD");
					YDDCCCCFSMJ = rsbody.getString("YDDCCCCFSMJ")==null?"":rsbody.getString("YDDCCCCFSMJ");
					YJEDYCFSWHSQKSRQ = rsbody.getString("YJEDYCFSWHSQKSRQ").substring(0,
							rsbody.getString("YJEDYCFSWHSQKSRQ").length() - 10);
					if(YJEDYCFSWHSQKSRQ==null)
					{
						YJEDYCFSWHSQKSRQ="";
					}
					YDDCCLDFSMJ = rsbody.getString("YDDCCLDFSMJ")==null?"":rsbody.getString("YDDCCLDFSMJ");
					YJEDYCFSWHSQJSRQ = rsbody.getString("YJEDYCFSWHSQJSRQ").substring(0,
							rsbody.getString("YJEDYCFSWHSQJSRQ").length() - 10);
					if(YJEDYCFSWHSQJSRQ==null)
					{
						YJEDYCFSWHSQJSRQ="";
					}
					YDYCNTFSMJ = rsbody.getString("YDYCNTFSMJ")==null?"":rsbody.getString("YDYCNTFSMJ");
					YJEDYCFSMJ = rsbody.getString("YJEDYCFSMJ")==null?"":rsbody.getString("YJEDYCFSMJ");
					YDYCNTFSMJBLNPJZJBL = rsbody
							.getString("YDYCNTFSMJBLNPJZJBL")==null?"":rsbody.getString("YDYCNTFSMJBLNPJZJBL");
					YJEDYCNTFSMJ = rsbody.getString("YJEDYCNTFSMJ")==null?"":rsbody.getString("YJEDYCNTFSMJ");
					YDYCCCFSMJ = rsbody.getString("YDYCCCFSMJ")==null?"":rsbody.getString("YDYCCCFSMJ");
					EDYCNTFSMJBSNZJBL = rsbody
							.getString("EDYCNTFSMJBSNZJBL")==null?"":rsbody.getString("EDYCNTFSMJBSNZJBL");
					YDYCLDFSMJ = rsbody.getString("YDYCLDFSMJ")==null?"":rsbody.getString("YDYCLDFSMJ");
					YJEDYCCCFSMJ = rsbody.getString("YJEDYCCCFSMJ")==null?"":rsbody.getString("YJEDYCCCFSMJ");
					YDYCNTMD = rsbody.getString("YDYCNTMD")==null?"":rsbody.getString("YDYCNTMD");
					YJEDYCLDFSMJ = rsbody.getString("YJEDYCLDFSMJ")==null?"":rsbody.getString("YJEDYCLDFSMJ");
					YDYCNTMDBLNPJZJBL = rsbody
							.getString("YDYCNTMDBLNPJZJBL")==null?"":rsbody.getString("YDYCNTMDBLNPJZJBL");
					YJEDYCFSXSMC = rsbody.getString("YJEDYCFSXSMC")==null?"":rsbody.getString("YJEDYCFSXSMC");
					YDYCNTFZMJ = rsbody.getString("YDYCNTFZMJ")==null?"":rsbody.getString("YDYCNTFZMJ");
					YJSDFSCD = rsbody.getString("YJSDFSCD")==null?"":rsbody.getString("YJSDFSCD");
					YDYCCCFZMJ = rsbody.getString("YDYCCCFZMJ")==null?"":rsbody.getString("YDYCCCFZMJ");
					YJSDYCFSWHSQKSRQ =rsbody.getString("YJSDYCFSWHSQKSRQ").substring(0,
							rsbody.getString("YJSDYCFSWHSQKSRQ").length() - 10);
					if(YJSDYCFSWHSQKSRQ==null)
					{
						YJSDYCFSWHSQKSRQ="";
					}
					YDYCLDFZMJ = rsbody.getString("YDYCLDFZMJ")==null?"":rsbody.getString("YDYCLDFZMJ");
					YJSDYCFSWHSQJSRQ = rsbody.getString("YJSDYCFSWHSQJSRQ").substring(0,
							rsbody.getString("YJSDYCFSWHSQJSRQ").length() - 10);
					if(YJSDYCFSWHSQJSRQ==null)
					{
						YJSDYCFSWHSQJSRQ="";
					}
					YDYCNTCLMJ = rsbody.getString("YDYCNTCLMJ")==null?"":rsbody.getString("YDYCNTCLMJ");
					YJSDYCFSMJ = rsbody.getString("YJSDYCFSMJ")==null?"":rsbody.getString("YJSDYCFSMJ");
					YDYCNTCLMJBLNPJZJBL = rsbody
							.getString("YDYCNTCLMJBLNPJZJBL")==null?"":rsbody.getString("YDYCNTCLMJBLNPJZJBL");
					YJSDYCNTFSMJ = rsbody.getString("YJSDYCNTFSMJ")==null?"":rsbody.getString("YJSDYCNTFSMJ");
					YDYCCCCLMJ = rsbody.getString("YDYCCCCLMJ")==null?"":rsbody.getString("YDYCCCCLMJ");
					SDYCNTFSMJBSNZJBL = rsbody
							.getString("SDYCNTFSMJBSNZJBL")==null?"":rsbody.getString("SDYCNTFSMJBSNZJBL");
					YDYCLDCLMJ = rsbody.getString("YDYCLDCLMJ")==null?"":rsbody.getString("YDYCLDCLMJ");
					YJSDYCCCFSMJ = rsbody.getString("YJSDYCCCFSMJ")==null?"":rsbody.getString("YJSDYCCCFSMJ");
					YDYCNTCLMD = rsbody.getString("YDYCNTCLMD")==null?"":rsbody.getString("YDYCNTCLMD");
					YJSDYCLDFSMJ = rsbody.getString("YJSDYCLDFSMJ")==null?"":rsbody.getString("YJSDYCLDFSMJ");
					YDYCNTCLMDBLNPJZJBL = rsbody
							.getString("YDYCNTCLMDBLNPJZJBL")==null?"":rsbody.getString("YDYCNTCLMDBLNPJZJBL");
					YJSDYCFSXSMC = rsbody.getString("YJSDYCFSXSMC")==null?"":rsbody.getString("YJSDYCFSXSMC");
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
					if(SBRQ_B==null)
					{
						SBRQ_B="";
					}
					SBRQ_E = rsbody.getString("SBRQ_E").substring(0,
							rsbody.getString("SBRQ_E").length() - 10);
					if(SBRQ_E==null)
					{
						SBRQ_E="";
					}

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
					style="text-align:center;font-size=30;width: ;height: "><b>一代草地螟发生实况及二、三代预测模式报表(<%=rwsj%>)
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
					<td style="text-align: center;">一代幼虫发生程度（级）</td>
					<td><label><%=YDYCFSCD%></label></td>
					<td style="text-align: center;">一代幼虫发生县市名称</td>
					<td style="text-align: center;">\</td>
				</tr>
				 <tr>
					<td style="text-align: center;">越冬代成虫农田发生面积（万亩）</td>
					<td><label><%=YDDCCNTFSMJ%></label></td>
					<td style="text-align: center;">寄主作物对二、三代成、幼虫有利程度和原因</td>
					<td style="text-align: center;">\</td>
				</tr>
				 <tr>
					<td style="text-align: center;">越冬代成虫农田发生面积比历年平均增减比率（％）</td>
					<td><label><%=YDDCCNTFSMJBLNPJZJBL%></label></td>
					<td style="text-align: center;">预计二代发生程度（级）</td>
					<td><label><%=YJEDFSCD%></label></td>
				</tr>
				 <tr>
				 	<td style="text-align: center;">越冬代成虫草场发生面积（万亩）</td>
					<td><label><%=YDDCCCCFSMJ%></label></td>
					<td style="text-align: center;">预计二代幼虫发生为害盛期开始日期（月/日）</td>
					<td><label><%=YJEDYCFSWHSQKSRQ%></label></td>
				</tr>
				 <tr>
				 	<td style="text-align: center;">越冬代成虫林地发生面积（万亩）</td>
					<td><label><%=YDDCCLDFSMJ%></label></td>
					<td style="text-align: center;">预计二代幼虫发生为害盛期结束日期（月/日）</td>
					<td><label><%=YJEDYCFSWHSQJSRQ%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">一代幼虫农田发生面积（万亩）</td>
					<td><label><%=YDYCNTFSMJ%></label></td>
					<td style="text-align: center;">预计二代幼虫发生面积（万亩）</td>
					<td><label><%=YJEDYCFSMJ%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">一代幼虫农田发生面积比历年平均增减比率（％）</td>
					<td><label><%=YDYCNTFSMJBLNPJZJBL%></label></td>
					<td style="text-align: center;">预计二代幼虫农田发生面积（万亩）</td>
					<td><label><%=YJEDYCNTFSMJ%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">一代幼虫草场发生面积（万亩）</td>
					<td><label><%=YDYCCCFSMJ%></label></td>
					<td style="text-align: center;">二代幼虫农田发生面积比上年增减比率（％）</td>
					<td><label><%=EDYCNTFSMJBSNZJBL%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">一代幼虫林地发生面积（万亩）</td>
					<td><label><%=YDYCLDFSMJ%></label></td>
					<td style="text-align: center;">预计二代幼虫草场发生面积（万亩）</td>
					<td><label><%=YJEDYCCCFSMJ%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">一代幼虫农田密度（头/ m2）</td>
					<td><label><%=YDYCNTMD%></label></td>
					<td style="text-align: center;">预计二代幼虫林地发生面积（万亩）</td>
					<td><label><%=YJEDYCLDFSMJ%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">一代幼虫农田密度比历年平均增减比率（％）</td>
					<td><label><%=YDYCNTMDBLNPJZJBL%></label></td>
					<td style="text-align: center;">预计二代幼虫发生县市名称</td>
					<td style="text-align: center;">\</td>
				</tr>
				 <tr>
					<td style="text-align: center;">一代幼虫农田防治面积（万亩）</td>
					<td><label><%=YDYCNTFZMJ%></label></td>
					<td style="text-align: center;">预计三代发生程度（级）</td>
					<td><label><%=YJSDFSCD%></label></td>
				</tr>
				<tr>
				 	<td style="text-align: center;">一代幼虫草场防治面积（万亩）</td>
					<td><label><%=YDYCCCFZMJ%></label></td>
					<td style="text-align: center;">预计三代幼虫发生为害盛期开始日期（月/日）</td>
					<td><label><%=YJSDYCFSWHSQKSRQ%></label></td>
				</tr>
				<tr>
				 	<td style="text-align: center;">一代幼虫林地防治面积（万亩）</td>
					<td><label><%=YDYCLDFZMJ%></label></td>
					<td style="text-align: center;">预计三代幼虫发生为害盛期结束日期（月/日）</td>
					<td><label><%=YJSDYCFSWHSQJSRQ%></label></td>
				</tr>
				<tr>
				 	<td style="text-align: center;">一代幼虫农田残留面积（万亩）</td>
					<td><label><%=YDYCNTCLMJ%></label></td>
					<td style="text-align: center;">预计三代幼虫发生面积（万亩）</td>
					<td><label><%=YJSDYCFSMJ%></label></td>
				</tr>
				<tr>
				 	<td style="text-align: center;">一代幼虫农田残留面积比历年平均增减比率（％）</td>
					<td><label><%=YDYCNTCLMJBLNPJZJBL%></label></td>
					<td style="text-align: center;">预计三代幼虫农田发生面积（万亩）</td>
					<td><label><%=YJSDYCNTFSMJ%></label></td>
				</tr>
				<tr>
				 	<td style="text-align: center;">一代幼虫草场残留面积（万亩）</td>
					<td><label><%=YDYCCCCLMJ%></label></td>
					<td style="text-align: center;">三代幼虫农田发生面积比上年增减比率（％）</td>
					<td><label><%=SDYCNTFSMJBSNZJBL%></label></td>
				</tr>
				<tr>
				 	<td style="text-align: center;">一代幼虫林地残留面积（万亩）</td>
					<td><label><%=YDYCLDCLMJ%></label></td>
					<td style="text-align: center;">预计三代幼虫草场发生面积（万亩）</td>
					<td><label><%=YJSDYCCCFSMJ%></label></td>
				</tr>
				<tr>
				 	<td style="text-align: center;">一代幼虫农田残留密度（头/m2）</td>
					<td><label><%=YDYCNTCLMD%></label></td>
					<td style="text-align: center;">预计三代幼虫林地发生面积（万亩）</td>
					<td><label><%=YJSDYCLDFSMJ%></label></td>
				</tr>
				<tr>
				 	<td style="text-align: center;">一代幼虫农田残留密度比历年平均增减比率（％）</td>
					<td><label><%=YDYCNTCLMDBLNPJZJBL%></label></td>
					<td style="text-align: center;">预计三代幼虫发生县市名称</td>
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