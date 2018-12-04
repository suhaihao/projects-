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
			String SDNC_FSCD = "";
			String SDNC_FSMJ = "";
			String SDNC_FZMJ = "";
			String SDNC_ZYWHZW = "";
			String SDNC_ZDFSQY = "";
			String SDNC_FSCD_H = "";
			String SDNC_FSMJ_H = "";
			String SDNC_ZDFSQY_H = "";
			String XMNC_FSCD = "";
			String XMNC_FSMJ = "";
			String XMNC_FZMJ = "";
			String XMNC_ZYWHZW = "";
			String XMNC_ZDFSQY = "";
			String XMNC_FSCD_H = "";
			String XMNC_FSMJ_H = "";
			String XMNC_ZDFSQY_H = "";
			String YMNC_FSCD = "";
			String YMNC_FSMJ = "";
			String YMNC_FZMJ = "";
			String YMNC_ZYWHZW = "";
			String YMNC_ZDFSQY = "";
			String YMNC_FSCD_H = "";
			String YMNC_FSMJ_H = "";
			String YMNC_ZDFSQY_H = "";
			String QTLZNC_FSCD = "";
			String QTLZNC_FSMJ = "";
			String QTLZNC_FZMJ = "";
			String QTLZNC_ZYWHZW = "";
			String QTLZNC_ZDFSQY = "";
			String QTLZNC_FSCD_H = "";
			String QTLZNC_FSMJ_H = "";
			String QTLZNC_ZDFSQY_H = "";
			String NCHJ_FSCD = "";
			String NCHJ_FSMJ = "";
			String NCHJ_FZMJ = "";
			String NCHJ_ZYWHZW = "";
			String NCHJ_ZDFSQY = "";
			String NCHJ_FSCD_H = "";
			String NCHJ_FSMJ_H = "";
			String NCHJ_ZDFSQY_H = "";
			
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
			String sql = "select * from D022 where jfid=" + jfid;
			pstmtbody = ecbody.con.prepareStatement(sql);
			rsbody = pstmtbody.executeQuery();
			while (rsbody.next()) {
					JFID = rsbody.getString("JFID")==null?"":rsbody.getString("JFID");
					SDNC_FSCD = rsbody.getString("SDNC_FSCD")==null?"":rsbody.getString("SDNC_FSCD");
					SDNC_FSMJ = rsbody.getString("SDNC_FSMJ")==null?"":rsbody.getString("SDNC_FSMJ");
					SDNC_FZMJ = rsbody.getString("SDNC_FZMJ")==null?"":rsbody.getString("SDNC_FZMJ");
					SDNC_ZYWHZW = rsbody.getString("SDNC_ZYWHZW")==null?"":rsbody.getString("SDNC_ZYWHZW");
					SDNC_ZDFSQY = rsbody.getString("SDNC_ZDFSQY")==null?"":rsbody.getString("SDNC_ZDFSQY");
					SDNC_FSCD_H = rsbody.getString("SDNC_FSCD_H")==null?"":rsbody.getString("SDNC_FSCD_H");
					SDNC_FSMJ_H = rsbody.getString("SDNC_FSMJ_H")==null?"":rsbody.getString("SDNC_FSMJ_H");
					SDNC_ZDFSQY_H = rsbody.getString("SDNC_ZDFSQY_H")==null?"":rsbody.getString("SDNC_ZDFSQY_H");
					XMNC_FSCD = rsbody.getString("XMNC_FSCD")==null?"":rsbody.getString("XMNC_FSCD");
					XMNC_FSMJ = rsbody.getString("XMNC_FSMJ")==null?"":rsbody.getString("XMNC_FSMJ");
					XMNC_FZMJ = rsbody.getString("XMNC_FZMJ")==null?"":rsbody.getString("XMNC_FZMJ");
					XMNC_ZYWHZW = rsbody.getString("XMNC_ZYWHZW")==null?"":rsbody.getString("XMNC_ZYWHZW");
					XMNC_ZDFSQY = rsbody.getString("XMNC_ZDFSQY")==null?"":rsbody.getString("XMNC_ZDFSQY");
					XMNC_FSCD_H = rsbody.getString("XMNC_FSCD_H")==null?"":rsbody.getString("XMNC_FSCD_H");
					XMNC_FSMJ_H = rsbody.getString("XMNC_FSMJ_H")==null?"":rsbody.getString("XMNC_FSMJ_H");
					XMNC_ZDFSQY_H = rsbody.getString("XMNC_ZDFSQY_H")==null?"":rsbody.getString("XMNC_ZDFSQY_H");
					YMNC_FSCD = rsbody.getString("YMNC_FSCD")==null?"":rsbody.getString("YMNC_FSCD");
					YMNC_FSMJ = rsbody.getString("YMNC_FSMJ")==null?"":rsbody.getString("YMNC_FSMJ");
					YMNC_FZMJ = rsbody.getString("YMNC_FZMJ")==null?"":rsbody.getString("YMNC_FZMJ");
					YMNC_ZYWHZW = rsbody.getString("YMNC_ZYWHZW")==null?"":rsbody.getString("YMNC_ZYWHZW");
					YMNC_ZDFSQY = rsbody.getString("YMNC_ZDFSQY")==null?"":rsbody.getString("YMNC_ZDFSQY");
					YMNC_FSCD_H = rsbody.getString("YMNC_FSCD_H")==null?"":rsbody.getString("YMNC_FSCD_H");
					YMNC_FSMJ_H = rsbody.getString("YMNC_FSMJ_H")==null?"":rsbody.getString("YMNC_FSMJ_H");
					YMNC_ZDFSQY_H = rsbody.getString("YMNC_ZDFSQY_H")==null?"":rsbody.getString("YMNC_ZDFSQY_H");
					QTLZNC_FSCD = rsbody.getString("QTLZNC_FSCD")==null?"":rsbody.getString("QTLZNC_FSCD");
					QTLZNC_FSMJ = rsbody.getString("QTLZNC_FSMJ")==null?"":rsbody.getString("QTLZNC_FSMJ");
					QTLZNC_FZMJ = rsbody.getString("QTLZNC_FZMJ")==null?"":rsbody.getString("QTLZNC_FZMJ");
					QTLZNC_ZYWHZW = rsbody.getString("QTLZNC_ZYWHZW")==null?"":rsbody.getString("QTLZNC_ZYWHZW");
					QTLZNC_ZDFSQY = rsbody.getString("QTLZNC_ZDFSQY")==null?"":rsbody.getString("QTLZNC_ZDFSQY");
					QTLZNC_FSCD_H = rsbody.getString("QTLZNC_FSCD_H")==null?"":rsbody.getString("QTLZNC_FSCD_H");
					QTLZNC_FSMJ_H = rsbody.getString("QTLZNC_FSMJ_H")==null?"":rsbody.getString("QTLZNC_FSMJ_H");
					QTLZNC_ZDFSQY_H = rsbody.getString("QTLZNC_ZDFSQY_H")==null?"":rsbody.getString("QTLZNC_ZDFSQY_H");
					NCHJ_FSCD = rsbody.getString("NCHJ_FSCD")==null?"":rsbody.getString("NCHJ_FSCD");
					NCHJ_FSMJ = rsbody.getString("NCHJ_FSMJ")==null?"":rsbody.getString("NCHJ_FSMJ");
					NCHJ_FZMJ = rsbody.getString("NCHJ_FZMJ")==null?"":rsbody.getString("NCHJ_FZMJ");
					NCHJ_ZYWHZW = rsbody.getString("NCHJ_ZYWHZW")==null?"":rsbody.getString("NCHJ_ZYWHZW");
					NCHJ_ZDFSQY = rsbody.getString("NCHJ_ZDFSQY")==null?"":rsbody.getString("NCHJ_ZDFSQY");
					NCHJ_FSCD_H = rsbody.getString("NCHJ_FSCD_H")==null?"":rsbody.getString("NCHJ_FSCD_H");
					NCHJ_FSMJ_H = rsbody.getString("NCHJ_FSMJ_H")==null?"":rsbody.getString("NCHJ_FSMJ_H");
					NCHJ_ZDFSQY_H = rsbody.getString("NCHJ_ZDFSQY_H")==null?"":rsbody.getString("NCHJ_ZDFSQY_H");
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
					style="text-align:center;font-size=30;width: ;height: "><b>粘虫年度发生与预测统计表（按代次分）(<%=rwsj%>)
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
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>病虫名称</b></td>
					<td colspan=5 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>本年度发生情况</b></td>
					<td colspan=3 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>下年度发生情况预测</b></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>发生程度（级)</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>发生面积（万亩）</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>防治面积（万亩）</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>主要危害作物</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>重点发生区域</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>发生程度（级)</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>发生面积（万亩）</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>重点发生区域</b></td>
				</tr>
			</tbody>
			<tbody id="zg_body">
				<tr>
					<td style="text-align: center;">水稻粘虫</td>
					<td><label><%=SDNC_FSCD%>级</label></td>
					<td><label><%=SDNC_FSMJ%></label></td>
					<td><label><%=SDNC_FZMJ%></label></td>
					<td><label><%=SDNC_ZYWHZW%></label></td>
					<td><label><%=SDNC_ZDFSQY%></label></td>
					<td><label><%=SDNC_FSCD_H%>级</label></td>
					<td><label><%=SDNC_FSMJ_H%></label></td>
					<td><label><%=SDNC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">小麦粘虫</td>
					<td><label><%=XMNC_FSCD%>级</label></td>
					<td><label><%=XMNC_FSMJ%></label></td>
					<td><label><%=XMNC_FZMJ%></label></td>
					<td><label><%=XMNC_ZYWHZW%></label></td>
					<td><label><%=XMNC_ZDFSQY%></label></td>
					<td><label><%=XMNC_FSCD_H%>级</label></td>
					<td><label><%=XMNC_FSMJ_H%></label></td>
					<td><label><%=XMNC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">玉米粘虫</td>
					<td><label><%=YMNC_FSCD%>级</label></td>
					<td><label><%=YMNC_FSMJ%></label></td>
					<td><label><%=YMNC_FZMJ%></label></td>
					<td><label><%=YMNC_ZYWHZW%></label></td>
					<td><label><%=YMNC_ZDFSQY%></label></td>
					<td><label><%=YMNC_FSCD_H%>级</label></td>
					<td><label><%=YMNC_FSMJ_H%></label></td>
					<td><label><%=YMNC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">其他粮作粘虫</td>
					<td><label><%=QTLZNC_FSCD%>级</label></td>
					<td><label><%=QTLZNC_FSMJ%></label></td>
					<td><label><%=QTLZNC_FZMJ%></label></td>
					<td><label><%=QTLZNC_ZYWHZW%></label></td>
					<td><label><%=QTLZNC_ZDFSQY%></label></td>
					<td><label><%=QTLZNC_FSCD_H%>级</label></td>
					<td><label><%=QTLZNC_FSMJ_H%></label></td>
					<td><label><%=QTLZNC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">粘虫合计</td>
					<td>\</td>
					<td><label><%=NCHJ_FSMJ%></label></td>
					<td><label><%=NCHJ_FZMJ%></label></td>
					<td><label><%=NCHJ_ZYWHZW%></label></td>
					<td><label><%=NCHJ_ZDFSQY%></label></td>
					<td>\</td>
					<td><label><%=NCHJ_FSMJ_H%></label></td>
					<td><label><%=NCHJ_ZDFSQY_H%></label></td>
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
    function xzsel(name,val)
    {
    	if(val!="")
    	{
    	$("select[name='"+name+"']") .val(val);
    	}
    }
	$(function() {
		xzsel('SDNC_FSCD','<%=SDNC_FSCD%>');
		xzsel('SDNC_FSCD_H','<%=SDNC_FSCD_H%>');
		xzsel('XMNC_FSCD','<%=XMNC_FSCD%>');
		xzsel('YMNC_FSCD','<%=YMNC_FSCD%>');
		xzsel('XMNC_FSCD_H','<%=XMNC_FSCD_H%>');
		xzsel('YMNC_FSCD_H','<%=YMNC_FSCD_H%>');
		xzsel('QTLZNC_FSCD','<%=QTLZNC_FSCD%>');
		xzsel('QTLZNC_FSCD_H','<%=QTLZNC_FSCD_H%>');
		
    });
	function fzmj(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='SDNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_FZMJ']").val());
			}
			if ($("input[name='XMNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XMNC_FZMJ']").val());
			}
			if ($("input[name='YMNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YMNC_FZMJ']").val());
			}
			if ($("input[name='QTLZNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTLZNC_FZMJ']").val());
			}
			$("input[name='NCHJ_FZMJ']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='SDNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_FZMJ']").val());
			}
			if ($("input[name='XMNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XMNC_FZMJ']").val());
			}
			if ($("input[name='YMNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YMNC_FZMJ']").val());
			}
			if ($("input[name='QTLZNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTLZNC_FZMJ']").val());
			}
			$("input[name='NCHJ_FZMJ']").val(zh);
		}
	}
	function fsmj(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='SDNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_FSMJ']").val());
			}
			if ($("input[name='XMNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XMNC_FSMJ']").val());
			}
			if ($("input[name='YMNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YMNC_FSMJ']").val());
			}
			if ($("input[name='QTLZNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTLZNC_FSMJ']").val());
			}
			$("input[name='NCHJ_FSMJ']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='SDNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_FSMJ']").val());
			}
			if ($("input[name='XMNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XMNC_FSMJ']").val());
			}
			if ($("input[name='YMNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YMNC_FSMJ']").val());
			}
			if ($("input[name='QTLZNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTLZNC_FSMJ']").val());
			}
			$("input[name='NCHJ_FSMJ']").val(zh);
		}
	}
	function fsmj_h(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='SDNC_FSMJ_H']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_FSMJ_H']").val());
			}
			if ($("input[name='XMNC_FSMJ_H']").val() != "") {
				zh = zh + parseFloat($("input[name='XMNC_FSMJ_H']").val());
			}
			if ($("input[name='YMNC_FSMJ_H']").val() != "") {
				zh = zh + parseFloat($("input[name='YMNC_FSMJ_H']").val());
			}
			if ($("input[name='QTLZNC_FSMJ_H']").val() != "") {
				zh = zh + parseFloat($("input[name='QTLZNC_FSMJ_H']").val());
			}
			$("input[name='NCHJ_FSMJ_H']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='SDNC_FSMJ_H']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_FSMJ_H']").val());
			}
			if ($("input[name='XMNC_FSMJ_H']").val() != "") {
				zh = zh + parseFloat($("input[name='XMNC_FSMJ_H']").val());
			}
			if ($("input[name='YMNC_FSMJ_H']").val() != "") {
				zh = zh + parseFloat($("input[name='YMNC_FSMJ_H']").val());
			}
			if ($("input[name='QTLZNC_FSMJ_H']").val() != "") {
				zh = zh + parseFloat($("input[name='QTLZNC_FSMJ_H']").val());
			}
			$("input[name='NCHJ_FSMJ_H']").val(zh);
		}
	}
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