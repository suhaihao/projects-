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
String zbid=(String)request.getAttribute("zbid");
String DCRQUP=(String)request.getAttribute("DCRQUP");
String DCRQDOWN=(String)request.getAttribute("DCRQDOWN");
String BMBM=(String)request.getAttribute("BMBM");
	String DC = (String) request.getAttribute("DC");
	if(DC!=null&&DC.equals("1"))
	{
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("content-disposition","attachment;filename=\"DNYTJ.xls\"");//����
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
			String LRRQ = "";
			String LRRY = "";
			String RWSJ = "";
			String DCRQ = "";
		ExecuteConnection ecbody = new ExecuteConnection();
		PreparedStatement pstmtbody = null;
		ResultSet rsbody = null;
		try {
			String sql = "select "
				        +"sum(YDNC_FSMJ) YDNC_FSMJ," 
				        +"sum(EDNC_FSMJ) EDNC_FSMJ," 
				        +"sum(SDNC_FSMJ) SDNC_FSMJ," 
				        +"sum(QTDCNC_FSMJ) QTDCNC_FSMJ," 
				        +"sum(NCHJ_FSMJ) NCHJ_FSMJ," 
				        +"sum(YDNC_FZMJ) YDNC_FZMJ," 
				        +"sum(EDNC_FZMJ) EDNC_FZMJ," 
				        +"sum(SDNC_FZMJ) SDNC_FZMJ," 
				        +"sum(QTDCNC_FZMJ) QTDCNC_FZMJ," 
				        +"sum(NCHJ_FZMJ) NCHJ_FZMJ," 
				        +"sum(EDNC_FSMJ_H) EDNC_FSMJ_H," 
				        +"sum(SDNC_FSMJ_H) SDNC_FSMJ_H," 
				        +"sum(QTDCNC_FSMJ_H) QTDCNC_FSMJ_H," 
				        +"sum(NCHJ_FSMJ_H) NCHJ_FSMJ_H" 
					   +" from D021 "
			           +" where zt = '1' ";
			if(BMBM!=null&&!BMBM.equals(""))
			{
				sql+=" and BMBM ='"+BMBM+"'";
			}
			if(DCRQUP!=null&&!DCRQUP.equals(""))
			{
				sql+=" and DCRQ >=to_date('"+DCRQUP+"','yyyy-MM-dd')";
			}
			if(DCRQDOWN!=null&&!DCRQDOWN.equals(""))
			{
				sql+=" and DCRQ <=to_date('"+DCRQDOWN+"','yyyy-MM-dd')";
			}
			pstmtbody = ecbody.con.prepareStatement(sql);
			rsbody = pstmtbody.executeQuery();
			while (rsbody.next()) {
					YDNC_FSMJ = rsbody.getString("YDNC_FSMJ")==null?"":rsbody.getString("YDNC_FSMJ");
					YDNC_FZMJ = rsbody.getString("YDNC_FZMJ")==null?"":rsbody.getString("YDNC_FZMJ");
					EDNC_FSMJ = rsbody.getString("EDNC_FSMJ")==null?"":rsbody.getString("EDNC_FSMJ");
					EDNC_FZMJ = rsbody.getString("EDNC_FZMJ")==null?"":rsbody.getString("EDNC_FZMJ");
					EDNC_FSMJ_H = rsbody.getString("EDNC_FSMJ_H")==null?"":rsbody.getString("EDNC_FSMJ_H");
					SDNC_FSMJ = rsbody.getString("SDNC_FSMJ")==null?"":rsbody.getString("SDNC_FSMJ");
					SDNC_FZMJ = rsbody.getString("SDNC_FZMJ")==null?"":rsbody.getString("SDNC_FZMJ");
					SDNC_FSMJ_H = rsbody.getString("SDNC_FSMJ_H")==null?"":rsbody.getString("SDNC_FSMJ_H");
					QTDCNC_FSMJ = rsbody.getString("QTDCNC_FSMJ")==null?"":rsbody.getString("QTDCNC_FSMJ");
					QTDCNC_FZMJ = rsbody.getString("QTDCNC_FZMJ")==null?"":rsbody.getString("QTDCNC_FZMJ");
					QTDCNC_FSMJ_H = rsbody.getString("QTDCNC_FSMJ_H")==null?"":rsbody.getString("QTDCNC_FSMJ_H");
					NCHJ_FSMJ = rsbody.getString("NCHJ_FSMJ")==null?"":rsbody.getString("NCHJ_FSMJ");
					NCHJ_FZMJ = rsbody.getString("NCHJ_FZMJ")==null?"":rsbody.getString("NCHJ_FZMJ");
					NCHJ_FSMJ_H = rsbody.getString("NCHJ_FSMJ_H")==null?"":rsbody.getString("NCHJ_FSMJ_H");
				}
				rsbody.close();
				pstmtbody.close();
				ecbody.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	%>
	<form id="f1" name="f1" action="/insect/tjbcsj_t.do?ACT_TYPE=Q<%=zbid%>"
		method="post">
	
	<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td colspan=5 rowspan=1
					style="text-align:center;font-size=30;width: ;height: "><b>ճ����ȷ�����Ԥ��ͳ�Ʊ������η֣�
				</b><br> <br></td>
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
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����̶ȣ�)</b></td>
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
					<td><label><%=YDNC_FSCD%></label></td>
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
					<td><label><%=EDNC_FSCD%></label></td>
					<td><label><%=EDNC_FSMJ%></label></td>
					<td><label><%=EDNC_FZMJ%></label></td>
					<td><label><%=EDNC_ZYWHZW%></label></td>
					<td><label><%=EDNC_ZDFSQY%></label></td>
					<td><label><%=EDNC_FSCD_H%></label></td>
					<td><label><%=EDNC_FSMJ_H%></label></td>
					<td><label><%=EDNC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">����ճ��</td>
					<td><label><%=SDNC_FSCD%></label></td>
					<td><label><%=SDNC_FSMJ%></label></td>
					<td><label><%=SDNC_FZMJ%></label></td>
					<td><label><%=SDNC_ZYWHZW%></label></td>
					<td><label><%=SDNC_ZDFSQY%></label></td>
					<td><label><%=SDNC_FSCD_H%></label></td>
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
				<td style="padding-left: 100px;padding-right: 100px;"><input type=button value="����Excel" id="btnExport" onclick="dc()" /></td>
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
function dc() {
	$("#f1").attr("action","/insect/ymscExcel_tj.do?ACT_TYPE=Q<%=zbid%>&DC=1");  
	if (jysz()) {
		$("#f1").submit();
	}
}
</script>
</html>