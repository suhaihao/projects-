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
<title>�����</title>
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
		<%
			if (!bbzt.equals("2") && !bbzt.equals("3") && !bbzt.equals("4")) {
		%>
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td colspan=5 rowspan=1
					style="text-align:center;font-size=30;width: ;height: "><b>ճ����ȷ�����Ԥ��ͳ�Ʊ�������֣�(<%=rwsj%>)
				</b><br> <br></td>
			</tr>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">�ⱨվ�㣺<%=usebmmc%><input
					name="BMBM" type="hidden" value="<%=usebm%>" /></td>
				<td style="padding-left: 100px;padding-right: 100px;">�ϱ����ڣ�<input
					type="text" id="DCRQ" name="DCRQ"
					style="width:80;height: ;font-size:12" value="<%=DCRQ%>"
					class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})" /></td>
			</tr>
		</table>
		<table border=1 borderColorDark=black borderColorLight=white
			cellpadding=1 cellspacing=1 align=center id=zg name=zg>
			<tbody id="zg_head">
				<tr>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��������</b></td>
					<td colspan=5 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>����ȷ������</b></td>
					<td colspan=3 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>����ȷ������Ԥ��</b></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����̶ȣ���)</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����������Ķ��</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����������Ķ��</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��ҪΣ������</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�ص㷢������</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����̶ȣ���)</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����������Ķ��</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�ص㷢������</b></td>
				</tr>
			</tbody>
			<tbody id="zg_body">
				<tr>
					<td style="text-align: center;">ˮ��ճ��</td>
					<td><select name="SDNC_FSCD" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="SDNC_FSMJ" type="text"
						value="<%=SDNC_FSMJ%>" alertname="ˮ��ճ�淢���������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="SDNC_FZMJ" type="text"
						value="<%=SDNC_FZMJ%>" alertname="ˮ��ճ������������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="SDNC_ZYWHZW" type="text"
						value="<%=SDNC_ZYWHZW%>"/></td>
					<td><input style="width: 100%;" name="SDNC_ZDFSQY" type="text"
						value="<%=SDNC_ZDFSQY%>"/></td>
					<td><select name="SDNC_FSCD_H" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="SDNC_FSMJ_H" type="text"
						value="<%=SDNC_FSMJ_H%>" alertname="ˮ��ճ�淢���������ȷ������Ԥ�����Ϊ����" datatype="number" onkeyup="fsmj_h(this)"/></td>
					<td><input style="width: 100%;" name="SDNC_ZDFSQY_H" type="text"
						value="<%=SDNC_ZDFSQY_H%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">С��ճ��</td>
					<td><select name="XMNC_FSCD" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="XMNC_FSMJ" type="text"
						value="<%=XMNC_FSMJ%>" alertname="С��ճ�淢���������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="XMNC_FZMJ" type="text"
						value="<%=XMNC_FZMJ%>" alertname="С��ճ������������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="XMNC_ZYWHZW" type="text"
						value="<%=XMNC_ZYWHZW%>"/></td>
					<td><input style="width: 100%;" name="XMNC_ZDFSQY" type="text"
						value="<%=XMNC_ZDFSQY%>"/></td>
					<td><select name="XMNC_FSCD_H" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="XMNC_FSMJ_H" type="text"
						value="<%=XMNC_FSMJ_H%>" alertname="С��ճ�淢���������ȷ������Ԥ�����Ϊ����" datatype="number" onkeyup="fsmj_h(this)"/></td>
					<td><input style="width: 100%;" name="XMNC_ZDFSQY_H" type="text"
						value="<%=XMNC_ZDFSQY_H%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">����ճ��</td>
					<td><select name="YMNC_FSCD" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="YMNC_FSMJ" type="text"
						value="<%=YMNC_FSMJ%>" alertname="����ճ�淢���������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="YMNC_FZMJ" type="text"
						value="<%=YMNC_FZMJ%>" alertname="����ճ������������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="YMNC_ZYWHZW" type="text"
						value="<%=YMNC_ZYWHZW%>"/></td>
					<td><input style="width: 100%;" name="YMNC_ZDFSQY" type="text"
						value="<%=YMNC_ZDFSQY%>"/></td>
					<td><select name="YMNC_FSCD_H" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="YMNC_FSMJ_H" type="text"
						value="<%=YMNC_FSMJ_H%>" alertname="����ճ�淢���������ȷ������Ԥ�����Ϊ����" datatype="number" onkeyup="fsmj_h(this)"/></td>
					<td><input style="width: 100%;" name="YMNC_ZDFSQY_H" type="text"
						value="<%=YMNC_ZDFSQY_H%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">��������ճ��</td>
					<td><select name="QTLZNC_FSCD" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="QTLZNC_FSMJ" type="text"
						value="<%=QTLZNC_FSMJ%>" alertname="��������ճ�淢���������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="QTLZNC_FZMJ" type="text"
						value="<%=QTLZNC_FZMJ%>" alertname="��������ճ������������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="QTLZNC_ZYWHZW" type="text"
						value="<%=QTLZNC_ZYWHZW%>"/></td>
					<td><input style="width: 100%;" name="QTLZNC_ZDFSQY" type="text"
						value="<%=QTLZNC_ZDFSQY%>"/></td>
					<td><select name="QTLZNC_FSCD_H" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="QTLZNC_FSMJ_H" type="text"
						value="<%=QTLZNC_FSMJ_H%>" alertname="��������ճ�淢���������ȷ������Ԥ�����Ϊ����" datatype="number" onkeyup="fsmj_h(this)"/></td>
					<td><input style="width: 100%;" name="QTLZNC_ZDFSQY_H" type="text"
						value="<%=QTLZNC_ZDFSQY_H%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">ճ��ϼ�</td>
					<td>\</td>
					<td><input style="width: 100%;" name="NCHJ_FSMJ" type="text"
						value="<%=NCHJ_FSMJ%>" alertname="ճ��ϼƷ����������Ϊ����" datatype="number"/></td>
					<td><input style="width: 100%;" name="NCHJ_FZMJ" type="text"
						value="<%=NCHJ_FZMJ%>" alertname="ճ��ϼƷ����������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="NCHJ_ZYWHZW" type="text"
						value="<%=NCHJ_ZYWHZW%>"/></td>
					<td><input style="width: 100%;" name="NCHJ_ZDFSQY" type="text"
						value="<%=NCHJ_ZDFSQY%>"/></td>
					<td>\</td>
					<td><input style="width: 100%;" name="NCHJ_FSMJ_H" type="text"
						value="<%=NCHJ_FSMJ_H%>" alertname="ճ��ϼƷ����������ȷ������Ԥ�����Ϊ����" datatype="number"/></td>
					<td><input style="width: 100%;" name="NCHJ_ZDFSQY_H" type="text"
						value="<%=NCHJ_ZDFSQY_H%>"/></td>
				</tr>
			</tbody>
			<tr>
				<td colspan=100 align="center">
					<%
						if (!bbzt.equals("2") && !bbzt.equals("3") && !bbzt.equals("4")) {
					%> <input type="button" value="����" id="btnSave" onclick="zt(0)" />&nbsp;&nbsp;
					<input type="button" value="�ύ" id="btnSubmit" onclick="zt(1)" />&nbsp;&nbsp;
					<input type=button value="����" id="btnUpload" />
					
					<%
						} else {
					%> <input type=button value="����Excel" id="btnExport" onclick="dc()" />
					<%
						}
					%> <!-- 
				<input type=button value="����" id="btnUpload" /></td>
				 -->
			</tr>
		</table>
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">¼����Ա��<%=LRRY%></td>
				<td style="padding-left: 100px;padding-right: 100px;">¼�����ڣ�<%=LRRQ%></td>
			</tr>
		</table>
		<%
			} else {
		%>
	<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td colspan=5 rowspan=1
					style="text-align:center;font-size=30;width: ;height: "><b>ճ����ȷ�����Ԥ��ͳ�Ʊ������η֣�(<%=rwsj%>)
				</b><br> <br></td>
			</tr>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">�ⱨվ�㣺<%=usebmmc%><input
					name="BMBM" type="hidden" value="<%=usebm%>" /></td>
				<td style="padding-left: 100px;padding-right: 100px;">�ϱ����ڣ�<label><%=DCRQ%></label></td>
			</tr>
		</table>
		<table border=1 borderColorDark=black borderColorLight=white
			cellpadding=1 cellspacing=1 align=center id=zg name=zg>
			<tbody id="zg_head">
				<tr>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��������</b></td>
					<td colspan=5 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>����ȷ������</b></td>
					<td colspan=3 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>����ȷ������Ԥ��</b></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����̶ȣ���)</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����������Ķ��</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����������Ķ��</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��ҪΣ������</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�ص㷢������</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����̶ȣ���)</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����������Ķ��</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�ص㷢������</b></td>
				</tr>
			</tbody>
			<tbody id="zg_body">
				<tr>
					<td style="text-align: center;">ˮ��ճ��</td>
					<td><label><%=SDNC_FSCD%>��</label></td>
					<td><label><%=SDNC_FSMJ%></label></td>
					<td><label><%=SDNC_FZMJ%></label></td>
					<td><label><%=SDNC_ZYWHZW%></label></td>
					<td><label><%=SDNC_ZDFSQY%></label></td>
					<td><label><%=SDNC_FSCD_H%>��</label></td>
					<td><label><%=SDNC_FSMJ_H%></label></td>
					<td><label><%=SDNC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">С��ճ��</td>
					<td><label><%=XMNC_FSCD%>��</label></td>
					<td><label><%=XMNC_FSMJ%></label></td>
					<td><label><%=XMNC_FZMJ%></label></td>
					<td><label><%=XMNC_ZYWHZW%></label></td>
					<td><label><%=XMNC_ZDFSQY%></label></td>
					<td><label><%=XMNC_FSCD_H%>��</label></td>
					<td><label><%=XMNC_FSMJ_H%></label></td>
					<td><label><%=XMNC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">����ճ��</td>
					<td><label><%=YMNC_FSCD%>��</label></td>
					<td><label><%=YMNC_FSMJ%></label></td>
					<td><label><%=YMNC_FZMJ%></label></td>
					<td><label><%=YMNC_ZYWHZW%></label></td>
					<td><label><%=YMNC_ZDFSQY%></label></td>
					<td><label><%=YMNC_FSCD_H%>��</label></td>
					<td><label><%=YMNC_FSMJ_H%></label></td>
					<td><label><%=YMNC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">��������ճ��</td>
					<td><label><%=QTLZNC_FSCD%>��</label></td>
					<td><label><%=QTLZNC_FSMJ%></label></td>
					<td><label><%=QTLZNC_FZMJ%></label></td>
					<td><label><%=QTLZNC_ZYWHZW%></label></td>
					<td><label><%=QTLZNC_ZDFSQY%></label></td>
					<td><label><%=QTLZNC_FSCD_H%>��</label></td>
					<td><label><%=QTLZNC_FSMJ_H%></label></td>
					<td><label><%=QTLZNC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">ճ��ϼ�</td>
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
			<tr>
				<td colspan=100 align="center">
					<%
						if (!bbzt.equals("2") && !bbzt.equals("3") && !bbzt.equals("4")) {
					%> <input type="button" value="����" id="btnSave" onclick="zt(0)" />&nbsp;&nbsp;
					<input type="button" value="�ύ" id="btnSubmit" onclick="zt(1)" />
					<%
						} else {
					%> <input type=button value="����Excel" id="btnExport" onclick="dc()" />
					<%
						}
					%> <!-- 
				<input type=button value="����" id="btnUpload" /></td>
				 -->
			</tr>
		</table>
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">¼����Ա��<%=LRRY%></td>
				<td style="padding-left: 100px;padding-right: 100px;">¼�����ڣ�<%=LRRQ%></td>
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
					<td><align center>��¼����Ҫ���ص��ļ�</align></td>
				</tr>
				<tr>
					<td><input id="file" name="file" type="file" style="width:90%"></td>
				</tr>
				<tr>
					<td><input type="button" value="ȷ��" id="okUp">&nbsp;&nbsp;<input
						type="button" value="ȡ��" id="cancelUp"></td>
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
    	 alert("��ѡ��Excel��ʽ�ļ�");
    	}
    });

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
			alert("����������");
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
			alert("����������");
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
			alert("����������");
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