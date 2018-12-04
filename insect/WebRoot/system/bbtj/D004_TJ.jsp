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
	    String MY_FSCD="";
	    String MY_FSMJ="";
	    String MY_FZMJ="";
	    String MY_SJSS="";
	    String MY_WHSS="";
	    String MZZ_FSCD="";
	    String MZZ_FSMJ="";
	    String MZZ_FZMJ="";
	    String MZZ_SJSS="";
	    String MZZ_WHSS="";
	    String XJC_FSCD="";
	    String XJC_FSMJ="";
	    String XJC_FZMJ="";
	    String XJC_SJSS="";
	    String XJC_WHSS="";
	    String YDNC_FSCD="";
	    String YDNC_FSMJ="";
	    String YDNC_FZMJ="";
	    String YDNC_SJSS="";
	    String YDNC_WHSS="";
	    String DXHC_FSCD="";
	    String DXHC_FSMJ="";
	    String DXHC_FZMJ="";
	    String DXHC_SJSS="";
	    String DXHC_WHSS="";
	    String HFS_FSCD="";
	    String HFS_FSMJ="";
	    String HFS_FZMJ="";
	    String HFS_SJSS="";
	    String HFS_WHSS="";
	    String TH_FSCD="";
	    String TH_FSMJ="";
	    String TH_FZMJ="";
	    String TH_SJSS="";
	    String TH_WHSS="";
	    String MYF_FSCD="";
	    String MYF_FSMJ="";
	    String MYF_FZMJ="";
	    String MYF_SJSS="";
	    String MYF_WHSS="";
	    String MJF_FSCD="";
	    String MJF_FSMJ="";
	    String MJF_FZMJ="";
	    String MJF_SJSS="";
	    String MJF_WHSS="";
	    String QTCH_FSCD="";
	    String QTCH_FSMJ="";
	    String QTCH_FZMJ="";
	    String QTCH_SJSS="";
	    String QTCH_WHSS="";
	    String CHHJ_FSCD="";
	    String CHHJ_FSMJ="";
	    String CHHJ_FZMJ="";
	    String CHHJ_SJSS="";
	    String CHHJ_WHSS="";
	    String TXB_FSCD="";
	    String TXB_FSMJ="";
	    String TXB_FZMJ="";
	    String TXB_SJSS="";
	    String TXB_WHSS="";
	    String YXB_FSCD="";
	    String YXB_FSMJ="";
	    String YXB_FZMJ="";
	    String YXB_SJSS="";
	    String YXB_WHSS="";
	    String CMB_FSCD="";
	    String CMB_FSMJ="";
	    String CMB_FZMJ="";
	    String CMB_SJSS="";
	    String CMB_WHSS="";
	    String BFB_FSCD="";
	    String BFB_FSMJ="";
	    String BFB_FZMJ="";
	    String BFB_SJSS="";
	    String BFB_WHSS="";
	    String WKB_FSCD="";
	    String WKB_FSMJ="";
	    String WKB_FZMJ="";
	    String WKB_SJSS="";
	    String WKB_WHSS="";
	    String HSB_FSCD="";
	    String HSB_FSMJ="";
	    String HSB_FZMJ="";
	    String HSB_SJSS="";
	    String HSB_WHSS="";
	    String BBB_FSCD="";
	    String BBB_FSMJ="";
	    String BBB_FZMJ="";
	    String BBB_SJSS="";
	    String BBB_WHSS="";
	    String QSB_FSCD="";
	    String QSB_FSMJ="";
	    String QSB_FZMJ="";
	    String QSB_SJSS="";
	    String QSB_WHSS="";
	    String GFB_FSCD="";
	    String GFB_FSMJ="";
	    String GFB_FZMJ="";
	    String GFB_SJSS="";
	    String GFB_WHSS="";
	    String YKB_FSCD="";
	    String YKB_FSMJ="";
	    String YKB_FZMJ="";
	    String YKB_SJSS="";
	    String YKB_WHSS="";
	    String XCB_FSCD="";
	    String XCB_FSMJ="";
	    String XCB_FZMJ="";
	    String XCB_SJSS="";
	    String XCB_WHSS="";
	    String XFB_FSCD="";
	    String XFB_FSMJ="";
	    String XFB_FZMJ="";
	    String XFB_SJSS="";
	    String XFB_WHSS="";
	    String QTB_FSCD="";
	    String QTB_FSMJ="";
	    String QTB_FZMJ="";
	    String QTB_SJSS="";
	    String QTB_WHSS="";
	    String BHHJ_FSCD="";
	    String BHHJ_FSMJ="";
	    String BHHJ_FZMJ="";
	    String BHHJ_SJSS="";
	    String BHHJ_WHSS="";
	    String BCHJ_FSCD="";
	    String BCHJ_FSMJ="";
	    String BCHJ_FZMJ="";
	    String BCHJ_SJSS="";
	    String BCHJ_WHSS="";
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
				String sql =   "select "
						     +"sum(MY_FSMJ) MY_FSMJ,"
						     +"sum(MZZ_FSMJ) MZZ_FSMJ,"
						     +"sum(XJC_FSMJ) XJC_FSMJ,"
						     +"sum(YDNC_FSMJ) YDNC_FSMJ,"
						     +"sum(DXHC_FSMJ) DXHC_FSMJ,"
						     +"sum(HFS_FSMJ) HFS_FSMJ,"
						     +"sum(TH_FSMJ) TH_FSMJ,"
						     +"sum(MYF_FSMJ) MYF_FSMJ,"
						     +"sum(MJF_FSMJ) MJF_FSMJ,"
						     +"sum(QTCH_FSMJ) QTCH_FSMJ,"
						     +"sum(CHHJ_FSMJ) CHHJ_FSMJ,"
						     +"sum(TXB_FSMJ) TXB_FSMJ,"
						     +"sum(YXB_FSMJ) YXB_FSMJ,"
						     +"sum(CMB_FSMJ) CMB_FSMJ,"
						     +"sum(BFB_FSMJ) BFB_FSMJ,"
						     +"sum(WKB_FSMJ) WKB_FSMJ,"
						     +"sum(HSB_FSMJ) HSB_FSMJ,"
						     +"sum(BBB_FSMJ) BBB_FSMJ,"
						     +"sum(QSB_FSMJ) QSB_FSMJ,"
						     +"sum(GFB_FSMJ) GFB_FSMJ,"
						     +"sum(YKB_FSMJ) YKB_FSMJ,"
						     +"sum(XCB_FSMJ) XCB_FSMJ,"
						     +"sum(XFB_FSMJ) XFB_FSMJ,"
						     +"sum(QTB_FSMJ) QTB_FSMJ,"
						     +"sum(BHHJ_FSMJ) BHHJ_FSMJ,"
						     +"sum(BCHJ_FSMJ) BCHJ_FSMJ,"
						     +"sum(MY_FZMJ) MY_FZMJ,"
						     +"sum(MZZ_FZMJ) MZZ_FZMJ,"
						     +"sum(XJC_FZMJ) XJC_FZMJ,"
						     +"sum(YDNC_FZMJ) YDNC_FZMJ,"
						     +"sum(DXHC_FZMJ) DXHC_FZMJ,"
						     +"sum(HFS_FZMJ) HFS_FZMJ,"
						     +"sum(TH_FZMJ) TH_FZMJ,"
						     +"sum(MYF_FZMJ) MYF_FZMJ,"
						     +"sum(MJF_FZMJ) MJF_FZMJ,"
						     +"sum(QTCH_FZMJ) QTCH_FZMJ,"
						     +"sum(CHHJ_FZMJ) CHHJ_FZMJ,"
						     +"sum(TXB_FZMJ) TXB_FZMJ,"
						     +"sum(YXB_FZMJ) YXB_FZMJ,"
						     +"sum(CMB_FZMJ) CMB_FZMJ,"
						     +"sum(BFB_FZMJ) BFB_FZMJ,"
						     +"sum(WKB_FZMJ) WKB_FZMJ,"
						     +"sum(HSB_FZMJ) HSB_FZMJ,"
						     +"sum(BBB_FZMJ) BBB_FZMJ,"
						     +"sum(QSB_FZMJ) QSB_FZMJ,"
						     +"sum(GFB_FZMJ) GFB_FZMJ,"
						     +"sum(YKB_FZMJ) YKB_FZMJ,"
						     +"sum(XCB_FZMJ) XCB_FZMJ,"
						     +"sum(XFB_FZMJ) XFB_FZMJ,"
						     +"sum(QTB_FZMJ) QTB_FZMJ,"
						     +"sum(BHHJ_FZMJ) BHHJ_FZMJ,"
						     +"sum(BCHJ_FZMJ) BCHJ_FZMJ,"
						     +"sum(MY_SJSS) MY_SJSS,"
						     +"sum(MZZ_SJSS) MZZ_SJSS,"
						     +"sum(XJC_SJSS) XJC_SJSS,"
						     +"sum(YDNC_SJSS) YDNC_SJSS,"
						     +"sum(DXHC_SJSS) DXHC_SJSS,"
						     +"sum(HFS_SJSS) HFS_SJSS,"
						     +"sum(TH_SJSS) TH_SJSS,"
						     +"sum(MYF_SJSS) MYF_SJSS,"
						     +"sum(MJF_SJSS) MJF_SJSS,"
						     +"sum(QTCH_SJSS) QTCH_SJSS,"
						     +"sum(CHHJ_SJSS) CHHJ_SJSS,"
						     +"sum(TXB_SJSS) TXB_SJSS,"
						     +"sum(YXB_SJSS) YXB_SJSS,"
						     +"sum(CMB_SJSS) CMB_SJSS,"
						     +"sum(BFB_SJSS) BFB_SJSS,"
						     +"sum(WKB_SJSS) WKB_SJSS,"
						     +"sum(HSB_SJSS) HSB_SJSS,"
						     +"sum(BBB_SJSS) BBB_SJSS,"
						     +"sum(QSB_SJSS) QSB_SJSS,"
						     +"sum(GFB_SJSS) GFB_SJSS,"
						     +"sum(YKB_SJSS) YKB_SJSS,"
						     +"sum(XCB_SJSS) XCB_SJSS,"
						     +"sum(XFB_SJSS) XFB_SJSS,"
						     +"sum(QTB_SJSS) QTB_SJSS,"
						     +"sum(BHHJ_SJSS) BHHJ_SJSS,"
						     +"sum(BCHJ_SJSS) BCHJ_SJSS,"
						     +"sum(MY_WHSS) MY_WHSS,"
						     +"sum(MZZ_WHSS) MZZ_WHSS,"
						     +"sum(XJC_WHSS) XJC_WHSS,"
						     +"sum(YDNC_WHSS) YDNC_WHSS,"
						     +"sum(DXHC_WHSS) DXHC_WHSS,"
						     +"sum(HFS_WHSS) HFS_WHSS,"
						     +"sum(TH_WHSS) TH_WHSS,"
						     +"sum(MYF_WHSS) MYF_WHSS,"
						     +"sum(MJF_WHSS) MJF_WHSS,"
						     +"sum(QTCH_WHSS) QTCH_WHSS,"
						     +"sum(CHHJ_WHSS) CHHJ_WHSS,"
						     +"sum(TXB_WHSS) TXB_WHSS,"
						     +"sum(YXB_WHSS) YXB_WHSS,"
						     +"sum(CMB_WHSS) CMB_WHSS,"
						     +"sum(BFB_WHSS) BFB_WHSS,"
						     +"sum(WKB_WHSS) WKB_WHSS,"
						     +"sum(HSB_WHSS) HSB_WHSS,"
						     +"sum(BBB_WHSS) BBB_WHSS,"
						     +"sum(QSB_WHSS) QSB_WHSS,"
						     +"sum(GFB_WHSS) GFB_WHSS,"
						     +"sum(YKB_WHSS) YKB_WHSS,"
						     +"sum(XCB_WHSS) XCB_WHSS,"
						     +"sum(XFB_WHSS) XFB_WHSS,"
						     +"sum(QTB_WHSS) QTB_WHSS,"
						     +"sum(BHHJ_WHSS) BHHJ_WHSS,"
						     +"sum(BCHJ_WHSS) BCHJ_WHSS"
						     +" from D004 "
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
					MY_FSMJ = rsbody.getString("MY_FSMJ")==null?"":rsbody.getString("MY_FSMJ");
					MY_FZMJ = rsbody.getString("MY_FZMJ")==null?"":rsbody.getString("MY_FZMJ");
					MY_SJSS = rsbody.getString("MY_SJSS")==null?"":rsbody.getString("MY_SJSS");
					MY_WHSS = rsbody.getString("MY_WHSS")==null?"":rsbody.getString("MY_WHSS");
					MZZ_FSMJ = rsbody.getString("MZZ_FSMJ")==null?"":rsbody.getString("MZZ_FSMJ");
					MZZ_FZMJ = rsbody.getString("MZZ_FZMJ")==null?"":rsbody.getString("MZZ_FZMJ");
					MZZ_SJSS = rsbody.getString("MZZ_SJSS")==null?"":rsbody.getString("MZZ_SJSS");
					MZZ_WHSS = rsbody.getString("MZZ_WHSS")==null?"":rsbody.getString("MZZ_WHSS");
					XJC_FSMJ = rsbody.getString("XJC_FSMJ")==null?"":rsbody.getString("XJC_FSMJ");
					XJC_FZMJ = rsbody.getString("XJC_FZMJ")==null?"":rsbody.getString("XJC_FZMJ");
					XJC_SJSS = rsbody.getString("XJC_SJSS")==null?"":rsbody.getString("XJC_SJSS");
					XJC_WHSS = rsbody.getString("XJC_WHSS")==null?"":rsbody.getString("XJC_WHSS");
					YDNC_FSMJ = rsbody.getString("YDNC_FSMJ")==null?"":rsbody.getString("YDNC_FSMJ");
					YDNC_FZMJ = rsbody.getString("YDNC_FZMJ")==null?"":rsbody.getString("YDNC_FZMJ");
					YDNC_SJSS = rsbody.getString("YDNC_SJSS")==null?"":rsbody.getString("YDNC_SJSS");
					YDNC_WHSS = rsbody.getString("YDNC_WHSS")==null?"":rsbody.getString("YDNC_WHSS");
					DXHC_FSMJ = rsbody.getString("DXHC_FSMJ")==null?"":rsbody.getString("DXHC_FSMJ");
					DXHC_FZMJ = rsbody.getString("DXHC_FZMJ")==null?"":rsbody.getString("DXHC_FZMJ");
					DXHC_SJSS = rsbody.getString("DXHC_SJSS")==null?"":rsbody.getString("DXHC_SJSS");
					DXHC_WHSS = rsbody.getString("DXHC_WHSS")==null?"":rsbody.getString("DXHC_WHSS");
					HFS_FSMJ = rsbody.getString("HFS_FSMJ")==null?"":rsbody.getString("HFS_FSMJ");
					HFS_FZMJ = rsbody.getString("HFS_FZMJ")==null?"":rsbody.getString("HFS_FZMJ");
					HFS_SJSS = rsbody.getString("HFS_SJSS")==null?"":rsbody.getString("HFS_SJSS");
					HFS_WHSS = rsbody.getString("HFS_WHSS")==null?"":rsbody.getString("HFS_WHSS");
					TH_FSMJ = rsbody.getString("TH_FSMJ")==null?"":rsbody.getString("TH_FSMJ");
					TH_FZMJ = rsbody.getString("TH_FZMJ")==null?"":rsbody.getString("TH_FZMJ");
					TH_SJSS = rsbody.getString("TH_SJSS")==null?"":rsbody.getString("TH_SJSS");
					TH_WHSS = rsbody.getString("TH_WHSS")==null?"":rsbody.getString("TH_WHSS");
					MYF_FSMJ = rsbody.getString("MYF_FSMJ")==null?"":rsbody.getString("MYF_FSMJ");
					MYF_FZMJ = rsbody.getString("MYF_FZMJ")==null?"":rsbody.getString("MYF_FZMJ");
					MYF_SJSS = rsbody.getString("MYF_SJSS")==null?"":rsbody.getString("MYF_SJSS");
					MYF_WHSS = rsbody.getString("MYF_WHSS")==null?"":rsbody.getString("MYF_WHSS");
					MJF_FSMJ = rsbody.getString("MJF_FSMJ")==null?"":rsbody.getString("MJF_FSMJ");
					MJF_FZMJ = rsbody.getString("MJF_FZMJ")==null?"":rsbody.getString("MJF_FZMJ");
					MJF_SJSS = rsbody.getString("MJF_SJSS")==null?"":rsbody.getString("MJF_SJSS");
					MJF_WHSS = rsbody.getString("MJF_WHSS")==null?"":rsbody.getString("MJF_WHSS");
					QTCH_FSMJ = rsbody.getString("QTCH_FSMJ")==null?"":rsbody.getString("QTCH_FSMJ");
					QTCH_FZMJ = rsbody.getString("QTCH_FZMJ")==null?"":rsbody.getString("QTCH_FZMJ");
					QTCH_SJSS = rsbody.getString("QTCH_SJSS")==null?"":rsbody.getString("QTCH_SJSS");
					QTCH_WHSS = rsbody.getString("QTCH_WHSS")==null?"":rsbody.getString("QTCH_WHSS");
					CHHJ_FSMJ = rsbody.getString("CHHJ_FSMJ")==null?"":rsbody.getString("CHHJ_FSMJ");
					CHHJ_FZMJ = rsbody.getString("CHHJ_FZMJ")==null?"":rsbody.getString("CHHJ_FZMJ");
					CHHJ_SJSS = rsbody.getString("CHHJ_SJSS")==null?"":rsbody.getString("CHHJ_SJSS");
					CHHJ_WHSS = rsbody.getString("CHHJ_WHSS")==null?"":rsbody.getString("CHHJ_WHSS");
					TXB_FSMJ = rsbody.getString("TXB_FSMJ")==null?"":rsbody.getString("TXB_FSMJ");
					TXB_FZMJ = rsbody.getString("TXB_FZMJ")==null?"":rsbody.getString("TXB_FZMJ");
					TXB_SJSS = rsbody.getString("TXB_SJSS")==null?"":rsbody.getString("TXB_SJSS");
					TXB_WHSS = rsbody.getString("TXB_WHSS")==null?"":rsbody.getString("TXB_WHSS");
					YXB_FSMJ = rsbody.getString("YXB_FSMJ")==null?"":rsbody.getString("YXB_FSMJ");
					YXB_FZMJ = rsbody.getString("YXB_FZMJ")==null?"":rsbody.getString("YXB_FZMJ");
					YXB_SJSS = rsbody.getString("YXB_SJSS")==null?"":rsbody.getString("YXB_SJSS");
					YXB_WHSS = rsbody.getString("YXB_WHSS")==null?"":rsbody.getString("YXB_WHSS");
					CMB_FSMJ = rsbody.getString("CMB_FSMJ")==null?"":rsbody.getString("CMB_FSMJ");
					CMB_FZMJ = rsbody.getString("CMB_FZMJ")==null?"":rsbody.getString("CMB_FZMJ");
					CMB_SJSS = rsbody.getString("CMB_SJSS")==null?"":rsbody.getString("CMB_SJSS");
					CMB_WHSS = rsbody.getString("CMB_WHSS")==null?"":rsbody.getString("CMB_WHSS");
					BFB_FSMJ = rsbody.getString("BFB_FSMJ")==null?"":rsbody.getString("BFB_FSMJ");
					BFB_FZMJ = rsbody.getString("BFB_FZMJ")==null?"":rsbody.getString("BFB_FZMJ");
					BFB_SJSS = rsbody.getString("BFB_SJSS")==null?"":rsbody.getString("BFB_SJSS");
					BFB_WHSS = rsbody.getString("BFB_WHSS")==null?"":rsbody.getString("BFB_WHSS");
					WKB_FSMJ = rsbody.getString("WKB_FSMJ")==null?"":rsbody.getString("WKB_FSMJ");
					WKB_FZMJ = rsbody.getString("WKB_FZMJ")==null?"":rsbody.getString("WKB_FZMJ");
					WKB_SJSS = rsbody.getString("WKB_SJSS")==null?"":rsbody.getString("WKB_SJSS");
					WKB_WHSS = rsbody.getString("WKB_WHSS")==null?"":rsbody.getString("WKB_WHSS");
					HSB_FSMJ = rsbody.getString("HSB_FSMJ")==null?"":rsbody.getString("HSB_FSMJ");
					HSB_FZMJ = rsbody.getString("HSB_FZMJ")==null?"":rsbody.getString("HSB_FZMJ");
					HSB_SJSS = rsbody.getString("HSB_SJSS")==null?"":rsbody.getString("HSB_SJSS");
					HSB_WHSS = rsbody.getString("HSB_WHSS")==null?"":rsbody.getString("HSB_WHSS");
					BBB_FSMJ = rsbody.getString("BBB_FSMJ")==null?"":rsbody.getString("BBB_FSMJ");
					BBB_FZMJ = rsbody.getString("BBB_FZMJ")==null?"":rsbody.getString("BBB_FZMJ");
					BBB_SJSS = rsbody.getString("BBB_SJSS")==null?"":rsbody.getString("BBB_SJSS");
					BBB_WHSS = rsbody.getString("BBB_WHSS")==null?"":rsbody.getString("BBB_WHSS");
					QSB_FSMJ = rsbody.getString("QSB_FSMJ")==null?"":rsbody.getString("QSB_FSMJ");
					QSB_FZMJ = rsbody.getString("QSB_FZMJ")==null?"":rsbody.getString("QSB_FZMJ");
					QSB_SJSS = rsbody.getString("QSB_SJSS")==null?"":rsbody.getString("QSB_SJSS");
					QSB_WHSS = rsbody.getString("QSB_WHSS")==null?"":rsbody.getString("QSB_WHSS");
					GFB_FSMJ = rsbody.getString("GFB_FSMJ")==null?"":rsbody.getString("GFB_FSMJ");
					GFB_FZMJ = rsbody.getString("GFB_FZMJ")==null?"":rsbody.getString("GFB_FZMJ");
					GFB_SJSS = rsbody.getString("GFB_SJSS")==null?"":rsbody.getString("GFB_SJSS");
					GFB_WHSS = rsbody.getString("GFB_WHSS")==null?"":rsbody.getString("GFB_WHSS");
					YKB_FSMJ = rsbody.getString("YKB_FSMJ")==null?"":rsbody.getString("YKB_FSMJ");
					YKB_FZMJ = rsbody.getString("YKB_FZMJ")==null?"":rsbody.getString("YKB_FZMJ");
					YKB_SJSS = rsbody.getString("YKB_SJSS")==null?"":rsbody.getString("YKB_SJSS");
					YKB_WHSS = rsbody.getString("YKB_WHSS")==null?"":rsbody.getString("YKB_WHSS");
					XCB_FSMJ = rsbody.getString("XCB_FSMJ")==null?"":rsbody.getString("XCB_FSMJ");
					XCB_FZMJ = rsbody.getString("XCB_FZMJ")==null?"":rsbody.getString("XCB_FZMJ");
					XCB_SJSS = rsbody.getString("XCB_SJSS")==null?"":rsbody.getString("XCB_SJSS");
					XCB_WHSS = rsbody.getString("XCB_WHSS")==null?"":rsbody.getString("XCB_WHSS");
					XFB_FSMJ = rsbody.getString("XFB_FSMJ")==null?"":rsbody.getString("XFB_FSMJ");
					XFB_FZMJ = rsbody.getString("XFB_FZMJ")==null?"":rsbody.getString("XFB_FZMJ");
					XFB_SJSS = rsbody.getString("XFB_SJSS")==null?"":rsbody.getString("XFB_SJSS");
					XFB_WHSS = rsbody.getString("XFB_WHSS")==null?"":rsbody.getString("XFB_WHSS");
					QTB_FSMJ = rsbody.getString("QTB_FSMJ")==null?"":rsbody.getString("QTB_FSMJ");
					QTB_FZMJ = rsbody.getString("QTB_FZMJ")==null?"":rsbody.getString("QTB_FZMJ");
					QTB_SJSS = rsbody.getString("QTB_SJSS")==null?"":rsbody.getString("QTB_SJSS");
					QTB_WHSS = rsbody.getString("QTB_WHSS")==null?"":rsbody.getString("QTB_WHSS");
					BHHJ_FSMJ = rsbody.getString("BHHJ_FSMJ")==null?"":rsbody.getString("BHHJ_FSMJ");
					BHHJ_FZMJ = rsbody.getString("BHHJ_FZMJ")==null?"":rsbody.getString("BHHJ_FZMJ");
					BHHJ_SJSS = rsbody.getString("BHHJ_SJSS")==null?"":rsbody.getString("BHHJ_SJSS");
					BHHJ_WHSS = rsbody.getString("BHHJ_WHSS")==null?"":rsbody.getString("BHHJ_WHSS");
					BCHJ_FSMJ = rsbody.getString("BCHJ_FSMJ")==null?"":rsbody.getString("BCHJ_FSMJ");
					BCHJ_FZMJ = rsbody.getString("BCHJ_FZMJ")==null?"":rsbody.getString("BCHJ_FZMJ");
					BCHJ_SJSS = rsbody.getString("BCHJ_SJSS")==null?"":rsbody.getString("BCHJ_SJSS");
					BCHJ_WHSS = rsbody.getString("BCHJ_WHSS")==null?"":rsbody.getString("BCHJ_WHSS");
					
				}
				rsbody.close();
				pstmtbody.close();
				ecbody.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	%>
	<form id="f1" name="f1" action="/insect/tjbcsj.do?ACT_TYPE=Q<%=zbid%>"
		method="post">
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td colspan=5 rowspan=1
					style="text-align:center;font-size=30;width: ;height: "><b>小麦病虫发生情况统计表</b><br>
					<br></td>
			</tr>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">单位：万亩</td>
			</tr>
		</table>
		<table border=1 borderColorDark=black borderColorLight=white
			cellpadding=1 cellspacing=1 align=center id=zg name=zg>
			<tbody id="zg_head">
				<tr>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>病虫名称</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>发生程度</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>发生面积（万亩次）</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>防治面积（万亩次）</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>实际损失（吨）</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>挽回损失（吨）</b></td>
				</tr>
			</tbody>
			<tbody id="zg_body">
				<tr>
					<td style="text-align: center;">麦蚜</td>
					<td><label><%=MY_FSCD%></label></td>
					<td><label><%=MY_FSMJ%></label></td>
					<td><label><%=MY_FZMJ%></label></td>
					<td><label><%=MY_SJSS%></label></td>
					<td><label><%=MY_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">麦蜘蛛</td>
					<td><label><%=MZZ_FSCD%></label></td>
					<td><label><%=MZZ_FSMJ%></label></td>
					<td><label><%=MZZ_FZMJ%></label></td>
					<td><label><%=MZZ_SJSS%></label></td>
					<td><label><%=MZZ_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">吸浆虫</td>
					<td><label><%=XJC_FSCD%></label></td>
					<td><label><%=XJC_FSMJ%></label></td>
					<td><label><%=XJC_FZMJ%></label></td>
					<td><label><%=XJC_SJSS%></label></td>
					<td><label><%=XJC_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">一代粘虫</td>
					<td><label><%=YDNC_FSCD%></label></td>
					<td><label><%=YDNC_FSMJ%></label></td>
					<td><label><%=YDNC_FZMJ%></label></td>
					<td><label><%=YDNC_SJSS%></label></td>
					<td><label><%=YDNC_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">地下害虫</td>
					<td><label><%=DXHC_FSCD%></label></td>
					<td><label><%=DXHC_FSMJ%></label></td>
					<td><label><%=DXHC_FZMJ%></label></td>
					<td><label><%=DXHC_SJSS%></label></td>
					<td><label><%=DXHC_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">灰飞虱</td>
					<td><label><%=HFS_FSCD%></label></td>
					<td><label><%=HFS_FSMJ%></label></td>
					<td><label><%=HFS_FZMJ%></label></td>
					<td><label><%=HFS_SJSS%></label></td>
					<td><label><%=HFS_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">土蝗</td>
					<td><label><%=TH_FSCD%></label></td>
					<td><label><%=TH_FSMJ%></label></td>
					<td><label><%=TH_FZMJ%></label></td>
					<td><label><%=TH_SJSS%></label></td>
					<td><label><%=TH_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">麦叶蜂</td>
					<td><label><%=MYF_FSCD%></label></td>
					<td><label><%=MYF_FSMJ%></label></td>
					<td><label><%=MYF_FZMJ%></label></td>
					<td><label><%=MYF_SJSS%></label></td>
					<td><label><%=MYF_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">麦茎蜂</td>
					<td><label><%=MJF_FSCD%></label></td>
					<td><label><%=MJF_FSMJ%></label></td>
					<td><label><%=MJF_FZMJ%></label></td>
					<td><label><%=MJF_SJSS%></label></td>
					<td><label><%=MJF_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">其它虫害</td>
					<td><label><%=QTCH_FSCD%></label></td>
					<td><label><%=QTCH_FSMJ%></label></td>
					<td><label><%=QTCH_FZMJ%></label></td>
					<td><label><%=QTCH_SJSS%></label></td>
					<td><label><%=QTCH_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">虫害合计</td>
					<td><label><%=CHHJ_FSCD%></label></td>
					<td><label><%=CHHJ_FSMJ%></label></td>
					<td><label><%=CHHJ_FZMJ%></label></td>
					<td><label><%=CHHJ_SJSS%></label></td>
					<td><label><%=CHHJ_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">条锈病</td>
					<td><label><%=TXB_FSCD%></label></td>
					<td><label><%=TXB_FSMJ%></label></td>
					<td><label><%=TXB_FZMJ%></label></td>
					<td><label><%=TXB_SJSS%></label></td>
					<td><label><%=TXB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">叶锈病</td>
					<td><label><%=YXB_FSCD%></label></td>
					<td><label><%=YXB_FSMJ%></label></td>
					<td><label><%=YXB_FZMJ%></label></td>
					<td><label><%=YXB_SJSS%></label></td>
					<td><label><%=YXB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">赤霉病</td>
					<td><label><%=CMB_FSCD%></label></td>
					<td><label><%=CMB_FSMJ%></label></td>
					<td><label><%=CMB_FZMJ%></label></td>
					<td><label><%=CMB_SJSS%></label></td>
					<td><label><%=CMB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">白粉病</td>
					<td><label><%=BFB_FSCD%></label></td>
					<td><label><%=BFB_FSMJ%></label></td>
					<td><label><%=BFB_FZMJ%></label></td>
					<td><label><%=BFB_SJSS%></label></td>
					<td><label><%=BFB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">纹枯病</td>
					<td><label><%=WKB_FSCD%></label></td>
					<td><label><%=WKB_FSMJ%></label></td>
					<td><label><%=WKB_FZMJ%></label></td>
					<td><label><%=WKB_SJSS%></label></td>
					<td><label><%=WKB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">黑穗病</td>
					<td><label><%=HSB_FSCD%></label></td>
					<td><label><%=HSB_FSMJ%></label></td>
					<td><label><%=HSB_FZMJ%></label></td>
					<td><label><%=HSB_SJSS%></label></td>
					<td><label><%=HSB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">病毒病</td>
					<td><label><%=BBB_FSCD%></label></td>
					<td><label><%=BBB_FSMJ%></label></td>
					<td><label><%=BBB_FZMJ%></label></td>
					<td><label><%=BBB_SJSS%></label></td>
					<td><label><%=BBB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">全蚀病</td>
					<td><label><%=QSB_FSCD%></label></td>
					<td><label><%=QSB_FSMJ%></label></td>
					<td><label><%=QSB_FZMJ%></label></td>
					<td><label><%=QSB_SJSS%></label></td>
					<td><label><%=QSB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">根腐病</td>
					<td><label><%=GFB_FSCD%></label></td>
					<td><label><%=GFB_FSMJ%></label></td>
					<td><label><%=GFB_FZMJ%></label></td>
					<td><label><%=GFB_SJSS%></label></td>
					<td><label><%=GFB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">叶枯病</td>
					<td><label><%=YKB_FSCD%></label></td>
					<td><label><%=YKB_FSMJ%></label></td>
					<td><label><%=YKB_FZMJ%></label></td>
					<td><label><%=YKB_SJSS%></label></td>
					<td><label><%=YKB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">线虫病</td>
					<td><label><%=XCB_FSCD%></label></td>
					<td><label><%=XCB_FSMJ%></label></td>
					<td><label><%=XCB_FZMJ%></label></td>
					<td><label><%=XCB_SJSS%></label></td>
					<td><label><%=XCB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">雪腐病</td>
					<td><label><%=XFB_FSCD%></label></td>
					<td><label><%=XFB_FSMJ%></label></td>
					<td><label><%=XFB_FZMJ%></label></td>
					<td><label><%=XFB_SJSS%></label></td>
					<td><label><%=XFB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">其它病害</td>
					<td><label><%=QTB_FSCD%></label></td>
					<td><label><%=QTB_FSMJ%></label></td>
					<td><label><%=QTB_FZMJ%></label></td>
					<td><label><%=QTB_SJSS%></label></td>
					<td><label><%=QTB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">病害合计</td>
					<td><label><%=BHHJ_FSCD%></label></td>
					<td><label><%=BHHJ_FSMJ%></label></td>
					<td><label><%=BHHJ_FZMJ%></label></td>
					<td><label><%=BHHJ_SJSS%></label></td>
					<td><label><%=BHHJ_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">病虫合计</td>
					<td><label><%=BCHJ_FSCD%></label></td>
					<td><label><%=BCHJ_FSMJ%></label></td>
					<td><label><%=BCHJ_FZMJ%></label></td>
					<td><label><%=BCHJ_SJSS%></label></td>
					<td><label><%=BCHJ_WHSS%></label></td>
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