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
	String DC = (String) request.getAttribute("DC");
	if(DC!=null&&DC.equals("1"))
	{
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("content-disposition","attachment;filename=\"D"+zbid+".xls\"");//����
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
			String YDNC_FSCD = "";
			String YDNC_FSMJ = "";
			String YDNC_FZMJ = "";
			String YDNC_ZYWHZW = "";
			String YDNC_ZDFSQY = "";
			String YDNC_FSCD_H = "";
			String YDNC_FSMJ_H = "";
			String YDNC_ZDFSQY_H = "";
			String EDNC_FSCD = "";
			String EDNC_FSMJ = "";
			String EDNC_FZMJ = "";
			String EDNC_ZYWHZW = "";
			String EDNC_ZDFSQY = "";
			String EDNC_FSCD_H = "";
			String EDNC_FSMJ_H = "";
			String EDNC_ZDFSQY_H = "";
			String SDNC_FSCD = "";
			String SDNC_FSMJ = "";
			String SDNC_FZMJ = "";
			String SDNC_ZYWHZW = "";
			String SDNC_ZDFSQY = "";
			String SDNC_FSCD_H = "";
			String SDNC_FSMJ_H = "";
			String SDNC_ZDFSQY_H = "";
			String QTDCNC_FSCD = "";
			String QTDCNC_FSMJ = "";
			String QTDCNC_FZMJ = "";
			String QTDCNC_ZYWHZW = "";
			String QTDCNC_ZDFSQY = "";
			String QTDCNC_FSCD_H = "";
			String QTDCNC_FSMJ_H = "";
			String QTDCNC_ZDFSQY_H = "";
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
			String sql = "select * from D021 where jfid=" + jfid;
			pstmtbody = ecbody.con.prepareStatement(sql);
			rsbody = pstmtbody.executeQuery();
			while (rsbody.next()) {
					JFID = rsbody.getString("JFID")==null?"":rsbody.getString("JFID");
					YDNC_FSCD = rsbody.getString("YDNC_FSCD")==null?"":rsbody.getString("YDNC_FSCD");
					YDNC_FSMJ = rsbody.getString("YDNC_FSMJ")==null?"":rsbody.getString("YDNC_FSMJ");
					YDNC_FZMJ = rsbody.getString("YDNC_FZMJ")==null?"":rsbody.getString("YDNC_FZMJ");
					YDNC_ZYWHZW = rsbody.getString("YDNC_ZYWHZW")==null?"":rsbody.getString("YDNC_ZYWHZW");
					YDNC_ZDFSQY = rsbody.getString("YDNC_ZDFSQY")==null?"":rsbody.getString("YDNC_ZDFSQY");
					YDNC_FSCD_H = rsbody.getString("YDNC_FSCD_H")==null?"":rsbody.getString("YDNC_FSCD_H");
					YDNC_FSMJ_H = rsbody.getString("YDNC_FSMJ_H")==null?"":rsbody.getString("YDNC_FSMJ_H");
					YDNC_ZDFSQY_H = rsbody.getString("YDNC_ZDFSQY_H")==null?"":rsbody.getString("YDNC_ZDFSQY_H");
					EDNC_FSCD = rsbody.getString("EDNC_FSCD")==null?"":rsbody.getString("EDNC_FSCD");
					EDNC_FSMJ = rsbody.getString("EDNC_FSMJ")==null?"":rsbody.getString("EDNC_FSMJ");
					EDNC_FZMJ = rsbody.getString("EDNC_FZMJ")==null?"":rsbody.getString("EDNC_FZMJ");
					EDNC_ZYWHZW = rsbody.getString("EDNC_ZYWHZW")==null?"":rsbody.getString("EDNC_ZYWHZW");
					EDNC_ZDFSQY = rsbody.getString("EDNC_ZDFSQY")==null?"":rsbody.getString("EDNC_ZDFSQY");
					EDNC_FSCD_H = rsbody.getString("EDNC_FSCD_H")==null?"":rsbody.getString("EDNC_FSCD_H");
					EDNC_FSMJ_H = rsbody.getString("EDNC_FSMJ_H")==null?"":rsbody.getString("EDNC_FSMJ_H");
					EDNC_ZDFSQY_H = rsbody.getString("EDNC_ZDFSQY_H")==null?"":rsbody.getString("EDNC_ZDFSQY_H");
					SDNC_FSCD = rsbody.getString("SDNC_FSCD")==null?"":rsbody.getString("SDNC_FSCD");
					SDNC_FSMJ = rsbody.getString("SDNC_FSMJ")==null?"":rsbody.getString("SDNC_FSMJ");
					SDNC_FZMJ = rsbody.getString("SDNC_FZMJ")==null?"":rsbody.getString("SDNC_FZMJ");
					SDNC_ZYWHZW = rsbody.getString("SDNC_ZYWHZW")==null?"":rsbody.getString("SDNC_ZYWHZW");
					SDNC_ZDFSQY = rsbody.getString("SDNC_ZDFSQY")==null?"":rsbody.getString("SDNC_ZDFSQY");
					SDNC_FSCD_H = rsbody.getString("SDNC_FSCD_H")==null?"":rsbody.getString("SDNC_FSCD_H");
					SDNC_FSMJ_H = rsbody.getString("SDNC_FSMJ_H")==null?"":rsbody.getString("SDNC_FSMJ_H");
					SDNC_ZDFSQY_H = rsbody.getString("SDNC_ZDFSQY_H")==null?"":rsbody.getString("SDNC_ZDFSQY_H");
					QTDCNC_FSCD = rsbody.getString("QTDCNC_FSCD")==null?"":rsbody.getString("QTDCNC_FSCD");
					QTDCNC_FSMJ = rsbody.getString("QTDCNC_FSMJ")==null?"":rsbody.getString("QTDCNC_FSMJ");
					QTDCNC_FZMJ = rsbody.getString("QTDCNC_FZMJ")==null?"":rsbody.getString("QTDCNC_FZMJ");
					QTDCNC_ZYWHZW = rsbody.getString("QTDCNC_ZYWHZW")==null?"":rsbody.getString("QTDCNC_ZYWHZW");
					QTDCNC_ZDFSQY = rsbody.getString("QTDCNC_ZDFSQY")==null?"":rsbody.getString("QTDCNC_ZDFSQY");
					QTDCNC_FSCD_H = rsbody.getString("QTDCNC_FSCD_H")==null?"":rsbody.getString("QTDCNC_FSCD_H");
					QTDCNC_FSMJ_H = rsbody.getString("QTDCNC_FSMJ_H")==null?"":rsbody.getString("QTDCNC_FSMJ_H");
					QTDCNC_ZDFSQY_H = rsbody.getString("QTDCNC_ZDFSQY_H")==null?"":rsbody.getString("QTDCNC_ZDFSQY_H");
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
					<td style="text-align: center;">һ��ճ��</td>
					<td><label><%=YDNC_FSCD%>��</label></td>
					<td><label><%=YDNC_FSMJ%></label></td>
					<td><label><%=YDNC_FZMJ%></label></td>
					<td><label><%=YDNC_ZYWHZW%></label></td>
					<td><label><%=YDNC_ZDFSQY%></label></td>
					<td>\</td>
					<td><label><%=YDNC_FSMJ_H%></label></td>
					<td><label><%=YDNC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">����ճ��</td>
					<td><label><%=EDNC_FSCD%>��</label></td>
					<td><label><%=EDNC_FSMJ%></label></td>
					<td><label><%=EDNC_FZMJ%></label></td>
					<td><label><%=EDNC_ZYWHZW%></label></td>
					<td><label><%=EDNC_ZDFSQY%></label></td>
					<td><label><%=EDNC_FSCD_H%>��</label></td>
					<td><label><%=EDNC_FSMJ_H%></label></td>
					<td><label><%=EDNC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">����ճ��</td>
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
					<td style="text-align: center;">��������ճ��</td>
					<td>\</td>
					<td><label><%=QTDCNC_FSMJ%></label></td>
					<td><label><%=QTDCNC_FZMJ%></label></td>
					<td><label><%=QTDCNC_ZYWHZW%></label></td>
					<td><label><%=QTDCNC_ZDFSQY%></label></td>
					<td>\</td>
					<td><label><%=QTDCNC_FSMJ_H%></label></td>
					<td><label><%=QTDCNC_ZDFSQY_H%></label></td>
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
		</table>
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">¼����Ա��<%=LRRY%></td>
				<td style="padding-left: 100px;padding-right: 100px;">¼�����ڣ�<%=LRRQ%></td>
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
		xzsel('YDNC_FSCD','<%=YDNC_FSCD%>');
		xzsel('EDNC_FSCD','<%=EDNC_FSCD%>');
		xzsel('SDNC_FSCD','<%=SDNC_FSCD%>');
		xzsel('EDNC_FSCD_H','<%=EDNC_FSCD_H%>');
		xzsel('SDNC_FSCD_H','<%=SDNC_FSCD_H%>');
		
    });
	function fzmj(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YDNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDNC_FZMJ']").val());
			}
			if ($("input[name='EDNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_FZMJ']").val());
			}
			if ($("input[name='SDNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_FZMJ']").val());
			}
			if ($("input[name='QTDCNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTDCNC_FZMJ']").val());
			}
			$("input[name='NCHJ_FZMJ']").val(zh);
		} else {
			alert("����������");
			obj.value = "";
			if ($("input[name='YDNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDNC_FZMJ']").val());
			}
			if ($("input[name='EDNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_FZMJ']").val());
			}
			if ($("input[name='SDNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_FZMJ']").val());
			}
			if ($("input[name='QTDCNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTDCNC_FZMJ']").val());
			}
			$("input[name='NCHJ_FZMJ']").val(zh);
		}
	}
	function fsmj(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YDNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDNC_FSMJ']").val());
			}
			if ($("input[name='EDNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_FSMJ']").val());
			}
			if ($("input[name='SDNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_FSMJ']").val());
			}
			if ($("input[name='QTDCNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTDCNC_FSMJ']").val());
			}
			$("input[name='NCHJ_FSMJ']").val(zh);
		} else {
			alert("����������");
			obj.value = "";
			if ($("input[name='YDNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDNC_FSMJ']").val());
			}
			if ($("input[name='EDNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_FSMJ']").val());
			}
			if ($("input[name='SDNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_FSMJ']").val());
			}
			if ($("input[name='QTDCNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTDCNC_FSMJ']").val());
			}
			$("input[name='NCHJ_FSMJ']").val(zh);
		}
	}
	function fsmj_h(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YDNC_FSMJ_H']").val() != "") {
				zh = zh + parseFloat($("input[name='YDNC_FSMJ_H']").val());
			}
			if ($("input[name='EDNC_FSMJ_H']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_FSMJ_H']").val());
			}
			if ($("input[name='SDNC_FSMJ_H']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_FSMJ_H']").val());
			}
			if ($("input[name='QTDCNC_FSMJ_H']").val() != "") {
				zh = zh + parseFloat($("input[name='QTDCNC_FSMJ_H']").val());
			}
			$("input[name='NCHJ_FSMJ_H']").val(zh);
		} else {
			alert("����������");
			obj.value = "";
			if ($("input[name='YDNC_FSMJ_H']").val() != "") {
				zh = zh + parseFloat($("input[name='YDNC_FSMJ_H']").val());
			}
			if ($("input[name='EDNC_FSMJ_H']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_FSMJ_H']").val());
			}
			if ($("input[name='SDNC_FSMJ_H']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_FSMJ_H']").val());
			}
			if ($("input[name='QTDCNC_FSMJ_H']").val() != "") {
				zh = zh + parseFloat($("input[name='QTDCNC_FSMJ_H']").val());
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