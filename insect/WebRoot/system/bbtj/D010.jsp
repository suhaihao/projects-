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
		String YD = "";
		String PJBZHCS = "";
		String DYLJCCL = "";
		String PJBZHCSBLNPJZZJBL = "";
		String DYLJCCBLNPJZBL = "";
		String PJBZHCSBSNZZJBL = "";
		String DYLJCCLBSNZJBL = "";
		String YJHYSQ = "";
		String CYJYCLJCCL = "";
		String HYSQBLNPJZZWTS = "";
		String CYJYCLJCCLBLNPJZZJBL = "";
		String YJCCYHSQ = "";
		String CYJYCLJCCLBSNZZBL = "";
		String CCYHSQBLNPJZZWTS = "";
		String PJBZYXLKS = "";
		String YJXDFSMJBL = "";
		String BZYXLKSBLNPJZZJBL = "";
		String YJXDFSCD = "";
		String BZYXLKSBSNZJBL = "";
		String YCLGFQKSRQ = "";
		String YCLGFQJSRQ = "";
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
				String sql = "select * from D010 where jfid=" + jfid;
				pstmtbody = ecbody.con.prepareStatement(sql);
				rsbody = pstmtbody.executeQuery();
				while (rsbody.next()) {
					JFID = rsbody.getString("JFID")==null?"":rsbody.getString("JFID");
					 YD = rsbody.getString("YD")==null?"":rsbody.getString("YD");
					 PJBZHCS = rsbody.getString("PJBZHCS")==null?"":rsbody.getString("PJBZHCS");
					 DYLJCCL = rsbody.getString("DYLJCCL")==null?"":rsbody.getString("DYLJCCL");
					 PJBZHCSBLNPJZZJBL = rsbody.getString("PJBZHCSBLNPJZZJBL")==null?"":rsbody.getString("PJBZHCSBLNPJZZJBL");
					 DYLJCCBLNPJZBL = rsbody.getString("DYLJCCBLNPJZBL")==null?"":rsbody.getString("DYLJCCBLNPJZBL");
					 PJBZHCSBSNZZJBL = rsbody.getString("PJBZHCSBSNZZJBL")==null?"":rsbody.getString("PJBZHCSBSNZZJBL");
					 DYLJCCLBSNZJBL = rsbody.getString("DYLJCCLBSNZJBL")==null?"":rsbody.getString("DYLJCCLBSNZJBL");
					 YJHYSQ = rsbody.getString("YJHYSQ").substring(0,
								rsbody.getString("YJHYSQ").length() - 10);
					 if(YJHYSQ==null)
					 {
						 YJHYSQ="";
					 }
					 CYJYCLJCCL = rsbody.getString("CYJYCLJCCL")==null?"":rsbody.getString("CYJYCLJCCL");
					 HYSQBLNPJZZWTS = rsbody.getString("HYSQBLNPJZZWTS")==null?"":rsbody.getString("HYSQBLNPJZZWTS");
					 CYJYCLJCCLBLNPJZZJBL = rsbody.getString("CYJYCLJCCLBLNPJZZJBL")==null?"":rsbody.getString("CYJYCLJCCLBLNPJZZJBL");
					 YJCCYHSQ = rsbody.getString("YJCCYHSQ").substring(0,
								rsbody.getString("YJCCYHSQ").length() - 10);
					 if(YJCCYHSQ==null)
					 {
						 YJCCYHSQ="";
					 }
					 CYJYCLJCCLBSNZZBL = rsbody.getString("CYJYCLJCCLBSNZZBL")==null?"":rsbody.getString("CYJYCLJCCLBSNZZBL");
					 CCYHSQBLNPJZZWTS = rsbody.getString("CCYHSQBLNPJZZWTS")==null?"":rsbody.getString("CCYHSQBLNPJZZWTS");
					 PJBZYXLKS = rsbody.getString("PJBZYXLKS")==null?"":rsbody.getString("PJBZYXLKS");
					 YJXDFSMJBL = rsbody.getString("YJXDFSMJBL")==null?"":rsbody.getString("YJXDFSMJBL");
					 BZYXLKSBLNPJZZJBL = rsbody.getString("BZYXLKSBLNPJZZJBL")==null?"":rsbody.getString("BZYXLKSBLNPJZZJBL");
					 YJXDFSCD = rsbody.getString("YJXDFSCD")==null?"":rsbody.getString("YJXDFSCD");
					 BZYXLKSBSNZJBL = rsbody.getString("BZYXLKSBSNZJBL")==null?"":rsbody.getString("BZYXLKSBSNZJBL");
					 YCLGFQKSRQ = rsbody.getString("YCLGFQKSRQ").substring(0,
								rsbody.getString("YCLGFQKSRQ").length() - 10);
					 if(YCLGFQKSRQ==null)
					 {
						 YCLGFQKSRQ="";
					 }
					 YCLGFQJSRQ = rsbody.getString("YCLGFQJSRQ").substring(0,
								rsbody.getString("YCLGFQJSRQ").length() - 10);
					 if(YCLGFQJSRQ==null)
					 {
						 YCLGFQJSRQ="";
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
					style="text-align:center;font-size=30;width: ;height: "><b>һ���������������ģʽ����(<%=rwsj%>)
				</b><br> <br></td>
			</tr>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">�ⱨվ�㣺<%=usebmmc%><input
					name="BMBM" type="hidden" value="<%=usebm%>" /></td>
				<td style="padding-left: 100px;padding-right: 100px;">�ϱ����ڣ�<input
					type="text" id="SBRQ_B" name="SBRQ_B"
					style="width:80;height: ;font-size:12" value="<%=SBRQ_B%>"
					 class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})"/>-<input
					type="text" id="SBRQ_E" name="SBRQ_E"
					style="width:80;height: ;font-size:12" value="<%=SBRQ_E%>"
					 class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})"/></td>
			</tr>
		</table>
		<table border=1 borderColorDark=black borderColorLight=white
			cellpadding=1 cellspacing=1 align=center id=zg name=zg>
			<tbody id="zg_body">
				 <tr>
					<td style="text-align: center;">����</td>
					<td><input style="width: 100%;" name="YD" type="text"
						value="<%=YD%>" /></td>
					<td style="text-align: center;">ƽ����������(ͷ)</td>
					<td><input style="width: 100%;" name="PJBZHCS" type="text"
						value="<%=PJBZHCS%>" alertname="ƽ��������������Ϊ����" datatype="number" /></td>
				</tr>
				 <tr>
					<td style="text-align: center;">�����ۼƳɳ���(ͷ/ֻ)</td>
					<td><input style="width: 100%;" name="DYLJCCL" type="text"
						value="<%=DYLJCCL%>" alertname="�����ۼƳɳ�������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">ƽ����������������ƽ��ֵ��������(��%)</td>
					<td><input style="width: 100%;" name="PJBZHCSBLNPJZZJBL" type="text"
						value="<%=PJBZHCSBLNPJZZJBL%>" alertname="ƽ����������������ƽ��ֵ�������ʱ���Ϊ����" datatype="number" /></td>
				</tr>
				 <tr>
					<td style="text-align: center;">�����ۼƳɳ���������ƽ��ֵ��������(��%)</td>
					<td><input style="width: 100%;" name="DYLJCCBLNPJZBL" type="text"
						value="<%=DYLJCCBLNPJZBL%>" alertname="�����ۼƳɳ���������ƽ��ֵ�������ʱ���Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">ƽ����������������ֵ��������(��%)</td>
					<td><input style="width: 100%;" name="PJBZHCSBSNZZJBL" type="text"
						value="<%=PJBZHCSBSNZZJBL%>" alertname="ƽ����������������ֵ�������ʱ���Ϊ����" datatype="number"/></td>
				</tr>
				 <tr>
					<td style="text-align: center;">�����ۼƳɳ�����������������(��%)</td>
					<td><input style="width: 100%;" name="DYLJCCLBSNZJBL" type="text"
						value="<%=DYLJCCLBSNZJBL%>" alertname="�����ۼƳɳ����������������ʱ���Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">Ԥ�ƻ�Ӽʢ��(��/��)</td>
					<td><input style="width: 100%;" name="YJHYSQ" type="text"
						value="<%=YJHYSQ%>" class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})"/></td>
				</tr>
				 <tr>
					<td style="text-align: center;">���ռ��ղ��ۼƳɳ���(ͷ/ö)</td>
					<td style="text-align: center;">\</td>
					<td style="text-align: center;">��Ӽʢ�ڱ�����ƽ��ֵ��������(����)</td>
					<td><input style="width: 100%;" name="HYSQBLNPJZZWTS" type="text"
						value="<%=HYSQBLNPJZZWTS%>" alertname="��Ӽʢ�ڱ�����ƽ��ֵ������������Ϊ����" datatype="number"/></td>
				</tr>
				 <tr>
					<td style="text-align: center;">���ռ��ղ��ۼƳɳ���������ƽ��ֵ��������(��%)</td>
					<td style="text-align: center;">\</td>
					<td style="text-align: center;">Ԥ�Ƴɳ���ʢ��(��/��)</td>
					<td><input style="width: 100%;" name="YJCCYHSQ" type="text"
						value="<%=YJCCYHSQ%>" class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">���ռ��ղ�����ۼƳɳ�����������������(��%)</td>
					<td style="text-align: center;">\</td>
					<td style="text-align: center;">�ɳ���ʢ�ڱ�����ƽ��ֵ��������(���죩</td>
					<td><input style="width: 100%;" name="CCYHSQBLNPJZZWTS" type="text"
						value="<%=CCYHSQBLNPJZZWTS%>" alertname="�ɳ���ʢ�ڱ�����ƽ��ֵ������������Ϊ����" datatype="number"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">ƽ��������Ч�ѿ���(��)</td>
					<td><input style="width: 100%;" name="PJBZYXLKS" type="text"
						value="<%=PJBZYXLKS%>" alertname="ƽ��������Ч�ѿ�������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">Ԥ���´������������(%)</td>
					<td><input style="width: 100%;" name="YJXDFSMJBL" type="text"
						value="<%=YJXDFSMJBL%>" alertname="Ԥ���´�����������ʱ���Ϊ����" datatype="number"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">������Ч�ѿ���������ƽ��ֵ��������(��%)</td>
					<td><input style="width: 100%;" name="BZYXLKSBLNPJZZJBL" type="text"
						value="<%=BZYXLKSBLNPJZZJBL%>" alertname="������Ч�ѿ���������ƽ��ֵ�������ʱ���Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">Ԥ���´������̶�</td>
					<td><input style="width: 100%;" name="YJXDFSCD" type="text"
						value="<%=YJXDFSCD%>" alertname="Ԥ���´������̶ȱ���Ϊ����" datatype="number"/></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=2 style="text-align: center;">������Ч�ѿ���������ֵ��������(��%)</td>
					<td colspan=1 rowspan=2><input style="width: 100%;" name="BZYXLKSBSNZJBL" type="text"
						value="<%=BZYXLKSBSNZJBL%>" alertname="������Ч�ѿ���������ֵ�������ʱ���Ϊ����" datatype="number" /></td>
					<td colspan=1 rowspan=1 style="text-align: center;">Ԥ���Ѹ߷��ڿ�ʼ����(��/��)</td>
				    <td colspan=1 rowspan=1><input style="width: 100%;" name="YCLGFQKSRQ" type="text"
						value="<%=YCLGFQKSRQ%>" class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})"/></td>
				</tr>
				<tr>
				    <td colspan=1 rowspan=1 style="text-align: center;">Ԥ���Ѹ߷��ڽ�������(��/��)</td>
				    <td colspan=1 rowspan=1><input style="width: 100%;" name="YCLGFQJSRQ" type="text"
						value="<%=YCLGFQJSRQ%>" class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})"/></td>	
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
					style="text-align:center;font-size=30;width: ;height: "><b>һ���������������ģʽ����(<%=rwsj%>)
				</b><br> <br></td>
			</tr>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">�ⱨվ�㣺<%=usebmmc%><input
					name="BMBM" type="hidden" value="<%=usebm%>" /></td>
				<td style="padding-left: 100px;padding-right: 100px;">�ϱ����ڣ�<label><%=SBRQ_B%></label>-<label><%=SBRQ_E%></label></td>
			</tr>
		</table>
		<table border=1 borderColorDark=black borderColorLight=white
			cellpadding=1 cellspacing=1 align=center id=zg name=zg>
			<tbody id="zg_body">
				 <tr>
					<td style="text-align: center;">����</td>
					<td><label><%=YD%></label></td>
					<td style="text-align: center;">ƽ����������(ͷ)</td>
					<td><label><%=PJBZHCS%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">�����ۼƳɳ���(ͷ/ֻ)</td>
					<td><label><%=DYLJCCL%></label></td>
					<td style="text-align: center;">ƽ����������������ƽ��ֵ��������(��%)</td>
					<td><label><%=PJBZHCSBLNPJZZJBL%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">�����ۼƳɳ���������ƽ��ֵ��������(��%)</td>
					<td><label><%=DYLJCCBLNPJZBL%></label></td>
					<td style="text-align: center;">ƽ����������������ֵ��������(��%)</td>
					<td><label><%=PJBZHCSBSNZZJBL%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">�����ۼƳɳ�����������������(��%)</td>
					<td><label><%=DYLJCCLBSNZJBL%></label></td>
					<td style="text-align: center;">Ԥ�ƻ�Ӽʢ��(��/��)</td>
					<td><label><%=YJHYSQ%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">���ռ��ղ��ۼƳɳ���(ͷ/ö)</td>
					<td style="text-align: center;">\</td>
					<td style="text-align: center;">��Ӽʢ�ڱ�����ƽ��ֵ��������(����)</td>
					<td><label><%=HYSQBLNPJZZWTS%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">���ռ��ղ��ۼƳɳ���������ƽ��ֵ��������(��%)</td>
					<td style="text-align: center;">\</td>
					<td style="text-align: center;">Ԥ�Ƴɳ���ʢ��(��/��)</td>
					<td><label><%=YJCCYHSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">���ռ��ղ�����ۼƳɳ�����������������(��%)</td>
					<td style="text-align: center;">\</td>
					<td style="text-align: center;">�ɳ���ʢ�ڱ�����ƽ��ֵ��������(���죩</td>
					<td><label><%=CCYHSQBLNPJZZWTS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">ƽ��������Ч�ѿ���(��)</td>
					<td><label><%=PJBZYXLKS%></label></td>
					<td style="text-align: center;">Ԥ���´������������(%)</td>
					<td><label><%=YJXDFSMJBL%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">������Ч�ѿ���������ƽ��ֵ��������(��%)</td>
					<td><label><%=BZYXLKSBLNPJZZJBL%></label></td>
					<td style="text-align: center;">Ԥ���´������̶�</td>
					<td><label><%=YJXDFSCD%></label></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=2 style="text-align: center;">������Ч�ѿ���������ֵ��������(��%)</td>
					<td colspan=1 rowspan=2><label><%=BZYXLKSBSNZJBL%></label></td>
					<td colspan=1 rowspan=1 style="text-align: center;">Ԥ���Ѹ߷��ڿ�ʼ����(��/��)</td>
				    <td colspan=1 rowspan=1><label><%=YCLGFQKSRQ%></label></td>
				</tr>
				<tr>
				    <td colspan=1 rowspan=1 style="text-align: center;">Ԥ���Ѹ߷��ڽ�������(��/��)</td>
				    <td colspan=1 rowspan=1><label><%=YCLGFQJSRQ%></label></td>	
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