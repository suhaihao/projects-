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
String zbid=(String)request.getAttribute("zbid");
String DCRQUP=(String)request.getAttribute("DCRQUP");
String DCRQDOWN=(String)request.getAttribute("DCRQDOWN");
String BMBM=(String)request.getAttribute("BMBM");
	String DC = (String) request.getAttribute("DC");
	if(DC!=null&&DC.equals("1"))
	{
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("content-disposition","attachment;filename=\"DNYTJ.xls\"");//下载
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
			String LRRQ = "";
			String LRRY = "";
			String RWSJ = "";
			String DCRQ = "";
		ExecuteConnection ecbody = new ExecuteConnection();
		PreparedStatement pstmtbody = null;
		ResultSet rsbody = null;
		try {
			String sql = "select "
			        +"sum(SDNC_FSMJ) SDNC_FSMJ," 
			        +"sum(XMNC_FSMJ) XMNC_FSMJ," 
			        +"sum(YMNC_FSMJ) YMNC_FSMJ," 
			        +"sum(QTLZNC_FSMJ) QTLZNC_FSMJ," 
			        +"sum(NCHJ_FSMJ) NCHJ_FSMJ," 
			        +"sum(SDNC_FZMJ) SDNC_FZMJ," 
			        +"sum(XMNC_FZMJ) XMNC_FZMJ," 
			        +"sum(YMNC_FZMJ) YMNC_FZMJ," 
			        +"sum(QTLZNC_FZMJ) QTLZNC_FZMJ," 
			        +"sum(NCHJ_FZMJ) NCHJ_FZMJ," 
			        +"sum(SDNC_FSMJ_H) SDNC_FSMJ_H," 
			        +"sum(XMNC_FSMJ_H) XMNC_FSMJ_H," 
			        +"sum(YMNC_FSMJ_H) YMNC_FSMJ_H," 
			        +"sum(QTLZNC_FSMJ_H) QTLZNC_FSMJ_H," 
			        +"sum(NCHJ_FSMJ_H) NCHJ_FSMJ_H" 
				   +" from D022 "
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
					SDNC_FSMJ = rsbody.getString("SDNC_FSMJ")==null?"":rsbody.getString("SDNC_FSMJ");
					SDNC_FZMJ = rsbody.getString("SDNC_FZMJ")==null?"":rsbody.getString("SDNC_FZMJ");
					SDNC_FSMJ_H = rsbody.getString("SDNC_FSMJ_H")==null?"":rsbody.getString("SDNC_FSMJ_H");
					XMNC_FSMJ = rsbody.getString("XMNC_FSMJ")==null?"":rsbody.getString("XMNC_FSMJ");
					XMNC_FZMJ = rsbody.getString("XMNC_FZMJ")==null?"":rsbody.getString("XMNC_FZMJ");
					XMNC_FSMJ_H = rsbody.getString("XMNC_FSMJ_H")==null?"":rsbody.getString("XMNC_FSMJ_H");
					YMNC_FSMJ = rsbody.getString("YMNC_FSMJ")==null?"":rsbody.getString("YMNC_FSMJ");
					YMNC_FZMJ = rsbody.getString("YMNC_FZMJ")==null?"":rsbody.getString("YMNC_FZMJ");
					YMNC_FSMJ_H = rsbody.getString("YMNC_FSMJ_H")==null?"":rsbody.getString("YMNC_FSMJ_H");
					QTLZNC_FSMJ = rsbody.getString("QTLZNC_FSMJ")==null?"":rsbody.getString("QTLZNC_FSMJ");
					QTLZNC_FZMJ = rsbody.getString("QTLZNC_FZMJ")==null?"":rsbody.getString("QTLZNC_FZMJ");
					QTLZNC_FSMJ_H = rsbody.getString("QTLZNC_FSMJ_H")==null?"":rsbody.getString("QTLZNC_FSMJ_H");
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
					style="text-align:center;font-size=30;width: ;height: "><b>粘虫年度发生与预测统计表（按代次分）
				</b><br> <br></td>
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
					<td style="text-align: center;">小麦粘虫</td>
					<td><label><%=XMNC_FSCD%></label></td>
					<td><label><%=XMNC_FSMJ%></label></td>
					<td><label><%=XMNC_FZMJ%></label></td>
					<td><label><%=XMNC_ZYWHZW%></label></td>
					<td><label><%=XMNC_ZDFSQY%></label></td>
					<td><label><%=XMNC_FSCD_H%></label></td>
					<td><label><%=XMNC_FSMJ_H%></label></td>
					<td><label><%=XMNC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">玉米粘虫</td>
					<td><label><%=YMNC_FSCD%></label></td>
					<td><label><%=YMNC_FSMJ%></label></td>
					<td><label><%=YMNC_FZMJ%></label></td>
					<td><label><%=YMNC_ZYWHZW%></label></td>
					<td><label><%=YMNC_ZDFSQY%></label></td>
					<td><label><%=YMNC_FSCD_H%></label></td>
					<td><label><%=YMNC_FSMJ_H%></label></td>
					<td><label><%=YMNC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">其他粮作粘虫</td>
					<td><label><%=QTLZNC_FSCD%></label></td>
					<td><label><%=QTLZNC_FSMJ%></label></td>
					<td><label><%=QTLZNC_FZMJ%></label></td>
					<td><label><%=QTLZNC_ZYWHZW%></label></td>
					<td><label><%=QTLZNC_ZDFSQY%></label></td>
					<td><label><%=QTLZNC_FSCD_H%></label></td>
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
				<td style="padding-left: 100px;padding-right: 100px;"><input type=button value="导出Excel" id="btnExport" onclick="dc()" /></td>
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
function dc() {
	$("#f1").attr("action","/insect/ymscExcel_tj.do?ACT_TYPE=Q<%=zbid%>&DC=1");  
	if (jysz()) {
		$("#f1").submit();
	}
}
</script>
</html>