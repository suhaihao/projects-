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
		<%
			if (!bbzt.equals("2") && !bbzt.equals("3") && !bbzt.equals("4")) {
		%>
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td colspan=5 rowspan=1
					style="text-align:center;font-size=30;width: ;height: "><b>�ݵ���Խ�����ɳ淢��ʵ����һ��Ԥ��ģʽ����(<%=rwsj%>)
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
					<td style="text-align: center;">�ɳ�ʼ���ڣ���/�գ�</td>
					<td><input style="width: 100%;" name="CCCJQ" type="text"
						value="<%=CCCJQ%>" class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})"/></td>
					<td style="text-align: center;">��Ҫ������Խ�����ɳ桢һ���׳淢�������̶�</td>
					<td style="text-align: center;">\</td>
				</tr>
				 <tr>
					<td style="text-align: center;">�ɳ�ʼ���ڱ����������죩</td>
					<td><input style="width: 100%;" name="CCCJQBLNZW" type="text"
						value="<%=CCCJQBLNZW%>" alertname="�ɳ�ʼ���ڱ������������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">Ԥ��һ�������̶ȣ�����</td>
					<td style="text-align: center;">\</td>
				</tr>
				 <tr>
					<td style="text-align: center;">�ƹ��ۼ��ն�����ͷ��</td>
					<td><input style="width: 100%;" name="DGLJYEL" type="text"
						value="<%=DGLJYEL%>" alertname="�ƹ��ۼ��ն�������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">Ԥ��һ�������������Ķ��</td>
					<td><input style="width: 100%;" name="YJYDFSMJ" type="text"
						value="<%=YJYDFSMJ%>" alertname="Ԥ��һ�������������Ϊ����" datatype="number"/></td>
				</tr>
				 <tr>
					<td style="text-align: center;">�ƹ��ۼ��ն���������ƽ����������(��)</td>
					<td><input style="width: 100%;" name="DGLJYELBLNPJZJBL" type="text"
						value="<%=DGLJYELBLNPJZJBL%>" alertname="�ƹ��ۼ��ն���������ƽ���������ʱ���Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">Ԥ��һ��ũ�﷢���������Ķ��</td>
					<td><input style="width: 100%;" name="YJYDNTFSMJ" type="text"
						value="<%=YJYDNTFSMJ%>" alertname="Ԥ��һ��ũ�﷢���������Ϊ����" datatype="number" /></td>
				</tr>
				 <tr>
					<td style="text-align: center;">���ʴƶ����ڣ���/�գ�</td>
					<td><input style="width: 100%;" name="JPCERQ" type="text"
						value="<%=JPCERQ%>" class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})"/></td>
					<td style="text-align: center;">һ��ũ�﷢�������������������(��)</td>
					<td><input style="width: 100%;" name="YDNTFSMJBSNZJBL" type="text"
						value="<%=YDNTFSMJBSNZJBL%>" alertname="һ��ũ�﷢������������������ʱ���Ϊ����" datatype="number"/></td>
				</tr>
				 <tr>
					<td style="text-align: center;">1-2���ƶ���ռ����(��)</td>
					<td><input style="width: 100%;" name="YEJCESZBL" type="text"
						value="<%=YEJCESZBL%>" alertname="1-2���ƶ���ռ���ʱ���Ϊ����" datatype="number"/></td>
					<td style="text-align: center;">Ԥ��һ���ݳ������������Ķ��</td>
					<td><input style="width: 100%;" name="YJYDCCFSMJ" type="text"
						value="<%=YJYDCCFSMJ%>" alertname="Ԥ��һ���ݳ������������Ϊ����" datatype="number"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">3-4���ƶ���ռ����(��)</td>
					<td><input style="width: 100%;" name="SSJCESZBL" type="text"
						value="<%=SSJCESZBL%>" alertname="3-4���ƶ���ռ���ʱ���Ϊ����" datatype="number"/></td>
					<td style="text-align: center;">һ���ݳ����������������������(��)</td>
					<td><input style="width: 100%;" name="YDCCFSMJBSNZJBL" type="text"
						value="<%=YDCCFSMJBSNZJBL%>" alertname="һ���ݳ���������������������ʱ���Ϊ����" datatype="number"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">�ɳ��ѷ����������Ķ��</td>
					<td><input style="width: 100%;" name="CCYFSMJ" type="text"
						value="<%=CCYFSMJ%>" alertname="�ɳ��ѷ����������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">Ԥ��һ���ֵط����������Ķ��</td>
					<td><input style="width: 100%;" name="YJYDLDFSMJ" type="text"
						value="<%=YJYDLDFSMJ%>" alertname="Ԥ��һ���ֵط����������Ϊ����" datatype="number"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">�ɳ淢�����������ƽ����������(��) </td>
					<td><input style="width: 100%;" name="CCFSMJBLNPJZJBL" type="text"
						value="<%=CCFSMJBLNPJZJBL%>" alertname="�ɳ淢�����������ƽ���������ʱ���Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">һ���ֵط��������������������(��)</td>
					<td><input style="width: 100%;" name="YDLDFSMJBSNZJBL" type="text"
						value="<%=YDLDFSMJBSNZJBL%>" alertname="һ���ֵط�������������������ʱ���Ϊ����" datatype="number"/></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=1 style="text-align: center;">Ԥ��һ�������ء�������</td>
					<td colspan=3 rowspan=1><input style="width: 100%;" name="YJYDFSXSMC" type="text"
						value="<%=YJYDFSXSMC%>" /></td>
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
					style="text-align:center;font-size=30;width: ;height: "><b>�ݵ���Խ�����ɳ淢��ʵ����һ��Ԥ��ģʽ����(<%=rwsj%>)
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
					<td style="text-align: center;">�ɳ�ʼ���ڣ���/�գ�</td>
					<td><label><%=CCCJQ%></label></td>
					<td style="text-align: center;">��Ҫ������Խ�����ɳ桢һ���׳淢�������̶�</td>
					<td style="text-align: center;">\</td>
				</tr>
				 <tr>
					<td style="text-align: center;">�ɳ�ʼ���ڱ����������죩</td>
					<td><label><%=CCCJQBLNZW%></label></td>
					<td style="text-align: center;">Ԥ��һ�������̶ȣ�����</td>
					<td style="text-align: center;">\</td>
				</tr>
				 <tr>
					<td style="text-align: center;">�ƹ��ۼ��ն�����ͷ��</td>
					<td><label><%=DGLJYEL%></label></td>
					<td style="text-align: center;">Ԥ��һ�������������Ķ��</td>
					<td><label><%=YJYDFSMJ%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">�ƹ��ۼ��ն���������ƽ����������(��)</td>
					<td><label><%=DGLJYELBLNPJZJBL%></label></td>
					<td style="text-align: center;">Ԥ��һ��ũ�﷢���������Ķ��</td>
					<td><label><%=YJYDNTFSMJ%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">���ʴƶ����ڣ���/�գ�</td>
					<td><label><%=JPCERQ%></label></td>
					<td style="text-align: center;">һ��ũ�﷢�������������������(��)</td>
					<td><label><%=YDNTFSMJBSNZJBL%></label></td>
				</tr>
				 <tr>
					<td style="text-align: center;">1-2���ƶ���ռ����(��)</td>
					<td><label><%=YEJCESZBL%></label></td>
					<td style="text-align: center;">Ԥ��һ���ݳ������������Ķ��</td>
					<td><label><%=YJYDCCFSMJ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">3-4���ƶ���ռ����(��)</td>
					<td><label><%=SSJCESZBL%></label></td>
					<td style="text-align: center;">һ���ݳ����������������������(��)</td>
					<td><label><%=YDCCFSMJBSNZJBL%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">�ɳ��ѷ����������Ķ��</td>
					<td><label><%=CCYFSMJ%></label></td>
					<td style="text-align: center;">Ԥ��һ���ֵط����������Ķ��</td>
					<td><label><%=YJYDLDFSMJ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">�ɳ淢�����������ƽ����������(��) </td>
					<td><label><%=CCFSMJBLNPJZJBL%></label></td>
					<td style="text-align: center;">һ���ֵط��������������������(��)</td>
					<td><label><%=YDLDFSMJBSNZJBL%></label></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=1 style="text-align: center;">Ԥ��һ�������ء�������</td>
					<td colspan=3 rowspan=1><label><%=YJYDFSXSMC%></label></td>
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