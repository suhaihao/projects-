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
				String sql = "select * from D004 where jfid=" + jfid;
				pstmtbody = ecbody.con.prepareStatement(sql);
				rsbody = pstmtbody.executeQuery();
				while (rsbody.next()) {
					JFID = rsbody.getString("JFID")==null?"":rsbody.getString("JFID");
					MY_FSCD = rsbody.getString("MY_FSCD")==null?"":rsbody.getString("MY_FSCD");
					MY_FSMJ = rsbody.getString("MY_FSMJ")==null?"":rsbody.getString("MY_FSMJ");
					MY_FZMJ = rsbody.getString("MY_FZMJ")==null?"":rsbody.getString("MY_FZMJ");
					MY_SJSS = rsbody.getString("MY_SJSS")==null?"":rsbody.getString("MY_SJSS");
					MY_WHSS = rsbody.getString("MY_WHSS")==null?"":rsbody.getString("MY_WHSS");
					MZZ_FSCD = rsbody.getString("MZZ_FSCD")==null?"":rsbody.getString("MZZ_FSCD");
					MZZ_FSMJ = rsbody.getString("MZZ_FSMJ")==null?"":rsbody.getString("MZZ_FSMJ");
					MZZ_FZMJ = rsbody.getString("MZZ_FZMJ")==null?"":rsbody.getString("MZZ_FZMJ");
					MZZ_SJSS = rsbody.getString("MZZ_SJSS")==null?"":rsbody.getString("MZZ_SJSS");
					MZZ_WHSS = rsbody.getString("MZZ_WHSS")==null?"":rsbody.getString("MZZ_WHSS");
					XJC_FSCD = rsbody.getString("XJC_FSCD")==null?"":rsbody.getString("XJC_FSCD");
					XJC_FSMJ = rsbody.getString("XJC_FSMJ")==null?"":rsbody.getString("XJC_FSMJ");
					XJC_FZMJ = rsbody.getString("XJC_FZMJ")==null?"":rsbody.getString("XJC_FZMJ");
					XJC_SJSS = rsbody.getString("XJC_SJSS")==null?"":rsbody.getString("XJC_SJSS");
					XJC_WHSS = rsbody.getString("XJC_WHSS")==null?"":rsbody.getString("XJC_WHSS");
					YDNC_FSCD = rsbody.getString("YDNC_FSCD")==null?"":rsbody.getString("YDNC_FSCD");
					YDNC_FSMJ = rsbody.getString("YDNC_FSMJ")==null?"":rsbody.getString("YDNC_FSMJ");
					YDNC_FZMJ = rsbody.getString("YDNC_FZMJ")==null?"":rsbody.getString("YDNC_FZMJ");
					YDNC_SJSS = rsbody.getString("YDNC_SJSS")==null?"":rsbody.getString("YDNC_SJSS");
					YDNC_WHSS = rsbody.getString("YDNC_WHSS")==null?"":rsbody.getString("YDNC_WHSS");
					DXHC_FSCD = rsbody.getString("DXHC_FSCD")==null?"":rsbody.getString("DXHC_FSCD");
					DXHC_FSMJ = rsbody.getString("DXHC_FSMJ")==null?"":rsbody.getString("DXHC_FSMJ");
					DXHC_FZMJ = rsbody.getString("DXHC_FZMJ")==null?"":rsbody.getString("DXHC_FZMJ");
					DXHC_SJSS = rsbody.getString("DXHC_SJSS")==null?"":rsbody.getString("DXHC_SJSS");
					DXHC_WHSS = rsbody.getString("DXHC_WHSS")==null?"":rsbody.getString("DXHC_WHSS");
					HFS_FSCD = rsbody.getString("HFS_FSCD")==null?"":rsbody.getString("HFS_FSCD");
					HFS_FSMJ = rsbody.getString("HFS_FSMJ")==null?"":rsbody.getString("HFS_FSMJ");
					HFS_FZMJ = rsbody.getString("HFS_FZMJ")==null?"":rsbody.getString("HFS_FZMJ");
					HFS_SJSS = rsbody.getString("HFS_SJSS")==null?"":rsbody.getString("HFS_SJSS");
					HFS_WHSS = rsbody.getString("HFS_WHSS")==null?"":rsbody.getString("HFS_WHSS");
					TH_FSCD = rsbody.getString("TH_FSCD")==null?"":rsbody.getString("TH_FSCD");
					TH_FSMJ = rsbody.getString("TH_FSMJ")==null?"":rsbody.getString("TH_FSMJ");
					TH_FZMJ = rsbody.getString("TH_FZMJ")==null?"":rsbody.getString("TH_FZMJ");
					TH_SJSS = rsbody.getString("TH_SJSS")==null?"":rsbody.getString("TH_SJSS");
					TH_WHSS = rsbody.getString("TH_WHSS")==null?"":rsbody.getString("TH_WHSS");
					MYF_FSCD = rsbody.getString("MYF_FSCD")==null?"":rsbody.getString("MYF_FSCD");
					MYF_FSMJ = rsbody.getString("MYF_FSMJ")==null?"":rsbody.getString("MYF_FSMJ");
					MYF_FZMJ = rsbody.getString("MYF_FZMJ")==null?"":rsbody.getString("MYF_FZMJ");
					MYF_SJSS = rsbody.getString("MYF_SJSS")==null?"":rsbody.getString("MYF_SJSS");
					MYF_WHSS = rsbody.getString("MYF_WHSS")==null?"":rsbody.getString("MYF_WHSS");
					MJF_FSCD = rsbody.getString("MJF_FSCD")==null?"":rsbody.getString("MJF_FSCD");
					MJF_FSMJ = rsbody.getString("MJF_FSMJ")==null?"":rsbody.getString("MJF_FSMJ");
					MJF_FZMJ = rsbody.getString("MJF_FZMJ")==null?"":rsbody.getString("MJF_FZMJ");
					MJF_SJSS = rsbody.getString("MJF_SJSS")==null?"":rsbody.getString("MJF_SJSS");
					MJF_WHSS = rsbody.getString("MJF_WHSS")==null?"":rsbody.getString("MJF_WHSS");
					QTCH_FSCD = rsbody.getString("QTCH_FSCD")==null?"":rsbody.getString("QTCH_FSCD");
					QTCH_FSMJ = rsbody.getString("QTCH_FSMJ")==null?"":rsbody.getString("QTCH_FSMJ");
					QTCH_FZMJ = rsbody.getString("QTCH_FZMJ")==null?"":rsbody.getString("QTCH_FZMJ");
					QTCH_SJSS = rsbody.getString("QTCH_SJSS")==null?"":rsbody.getString("QTCH_SJSS");
					QTCH_WHSS = rsbody.getString("QTCH_WHSS")==null?"":rsbody.getString("QTCH_WHSS");
					CHHJ_FSCD = rsbody.getString("CHHJ_FSCD")==null?"":rsbody.getString("CHHJ_FSCD");
					CHHJ_FSMJ = rsbody.getString("CHHJ_FSMJ")==null?"":rsbody.getString("CHHJ_FSMJ");
					CHHJ_FZMJ = rsbody.getString("CHHJ_FZMJ")==null?"":rsbody.getString("CHHJ_FZMJ");
					CHHJ_SJSS = rsbody.getString("CHHJ_SJSS")==null?"":rsbody.getString("CHHJ_SJSS");
					CHHJ_WHSS = rsbody.getString("CHHJ_WHSS")==null?"":rsbody.getString("CHHJ_WHSS");
					TXB_FSCD = rsbody.getString("TXB_FSCD")==null?"":rsbody.getString("TXB_FSCD");
					TXB_FSMJ = rsbody.getString("TXB_FSMJ")==null?"":rsbody.getString("TXB_FSMJ");
					TXB_FZMJ = rsbody.getString("TXB_FZMJ")==null?"":rsbody.getString("TXB_FZMJ");
					TXB_SJSS = rsbody.getString("TXB_SJSS")==null?"":rsbody.getString("TXB_SJSS");
					TXB_WHSS = rsbody.getString("TXB_WHSS")==null?"":rsbody.getString("TXB_WHSS");
					YXB_FSCD = rsbody.getString("YXB_FSCD")==null?"":rsbody.getString("YXB_FSCD");
					YXB_FSMJ = rsbody.getString("YXB_FSMJ")==null?"":rsbody.getString("YXB_FSMJ");
					YXB_FZMJ = rsbody.getString("YXB_FZMJ")==null?"":rsbody.getString("YXB_FZMJ");
					YXB_SJSS = rsbody.getString("YXB_SJSS")==null?"":rsbody.getString("YXB_SJSS");
					YXB_WHSS = rsbody.getString("YXB_WHSS")==null?"":rsbody.getString("YXB_WHSS");
					CMB_FSCD = rsbody.getString("CMB_FSCD")==null?"":rsbody.getString("CMB_FSCD");
					CMB_FSMJ = rsbody.getString("CMB_FSMJ")==null?"":rsbody.getString("CMB_FSMJ");
					CMB_FZMJ = rsbody.getString("CMB_FZMJ")==null?"":rsbody.getString("CMB_FZMJ");
					CMB_SJSS = rsbody.getString("CMB_SJSS")==null?"":rsbody.getString("CMB_SJSS");
					CMB_WHSS = rsbody.getString("CMB_WHSS")==null?"":rsbody.getString("CMB_WHSS");
					BFB_FSCD = rsbody.getString("BFB_FSCD")==null?"":rsbody.getString("BFB_FSCD");
					BFB_FSMJ = rsbody.getString("BFB_FSMJ")==null?"":rsbody.getString("BFB_FSMJ");
					BFB_FZMJ = rsbody.getString("BFB_FZMJ")==null?"":rsbody.getString("BFB_FZMJ");
					BFB_SJSS = rsbody.getString("BFB_SJSS")==null?"":rsbody.getString("BFB_SJSS");
					BFB_WHSS = rsbody.getString("BFB_WHSS")==null?"":rsbody.getString("BFB_WHSS");
					WKB_FSCD = rsbody.getString("WKB_FSCD")==null?"":rsbody.getString("WKB_FSCD");
					WKB_FSMJ = rsbody.getString("WKB_FSMJ")==null?"":rsbody.getString("WKB_FSMJ");
					WKB_FZMJ = rsbody.getString("WKB_FZMJ")==null?"":rsbody.getString("WKB_FZMJ");
					WKB_SJSS = rsbody.getString("WKB_SJSS")==null?"":rsbody.getString("WKB_SJSS");
					WKB_WHSS = rsbody.getString("WKB_WHSS")==null?"":rsbody.getString("WKB_WHSS");
					HSB_FSCD = rsbody.getString("HSB_FSCD")==null?"":rsbody.getString("HSB_FSCD");
					HSB_FSMJ = rsbody.getString("HSB_FSMJ")==null?"":rsbody.getString("HSB_FSMJ");
					HSB_FZMJ = rsbody.getString("HSB_FZMJ")==null?"":rsbody.getString("HSB_FZMJ");
					HSB_SJSS = rsbody.getString("HSB_SJSS")==null?"":rsbody.getString("HSB_SJSS");
					HSB_WHSS = rsbody.getString("HSB_WHSS")==null?"":rsbody.getString("HSB_WHSS");
					BBB_FSCD = rsbody.getString("BBB_FSCD")==null?"":rsbody.getString("BBB_FSCD");
					BBB_FSMJ = rsbody.getString("BBB_FSMJ")==null?"":rsbody.getString("BBB_FSMJ");
					BBB_FZMJ = rsbody.getString("BBB_FZMJ")==null?"":rsbody.getString("BBB_FZMJ");
					BBB_SJSS = rsbody.getString("BBB_SJSS")==null?"":rsbody.getString("BBB_SJSS");
					BBB_WHSS = rsbody.getString("BBB_WHSS")==null?"":rsbody.getString("BBB_WHSS");
					QSB_FSCD = rsbody.getString("QSB_FSCD")==null?"":rsbody.getString("QSB_FSCD");
					QSB_FSMJ = rsbody.getString("QSB_FSMJ")==null?"":rsbody.getString("QSB_FSMJ");
					QSB_FZMJ = rsbody.getString("QSB_FZMJ")==null?"":rsbody.getString("QSB_FZMJ");
					QSB_SJSS = rsbody.getString("QSB_SJSS")==null?"":rsbody.getString("QSB_SJSS");
					QSB_WHSS = rsbody.getString("QSB_WHSS")==null?"":rsbody.getString("QSB_WHSS");
					GFB_FSCD = rsbody.getString("GFB_FSCD")==null?"":rsbody.getString("GFB_FSCD");
					GFB_FSMJ = rsbody.getString("GFB_FSMJ")==null?"":rsbody.getString("GFB_FSMJ");
					GFB_FZMJ = rsbody.getString("GFB_FZMJ")==null?"":rsbody.getString("GFB_FZMJ");
					GFB_SJSS = rsbody.getString("GFB_SJSS")==null?"":rsbody.getString("GFB_SJSS");
					GFB_WHSS = rsbody.getString("GFB_WHSS")==null?"":rsbody.getString("GFB_WHSS");
					YKB_FSCD = rsbody.getString("YKB_FSCD")==null?"":rsbody.getString("YKB_FSCD");
					YKB_FSMJ = rsbody.getString("YKB_FSMJ")==null?"":rsbody.getString("YKB_FSMJ");
					YKB_FZMJ = rsbody.getString("YKB_FZMJ")==null?"":rsbody.getString("YKB_FZMJ");
					YKB_SJSS = rsbody.getString("YKB_SJSS")==null?"":rsbody.getString("YKB_SJSS");
					YKB_WHSS = rsbody.getString("YKB_WHSS")==null?"":rsbody.getString("YKB_WHSS");
					XCB_FSCD = rsbody.getString("XCB_FSCD")==null?"":rsbody.getString("XCB_FSCD");
					XCB_FSMJ = rsbody.getString("XCB_FSMJ")==null?"":rsbody.getString("XCB_FSMJ");
					XCB_FZMJ = rsbody.getString("XCB_FZMJ")==null?"":rsbody.getString("XCB_FZMJ");
					XCB_SJSS = rsbody.getString("XCB_SJSS")==null?"":rsbody.getString("XCB_SJSS");
					XCB_WHSS = rsbody.getString("XCB_WHSS")==null?"":rsbody.getString("XCB_WHSS");
					XFB_FSCD = rsbody.getString("XFB_FSCD")==null?"":rsbody.getString("XFB_FSCD");
					XFB_FSMJ = rsbody.getString("XFB_FSMJ")==null?"":rsbody.getString("XFB_FSMJ");
					XFB_FZMJ = rsbody.getString("XFB_FZMJ")==null?"":rsbody.getString("XFB_FZMJ");
					XFB_SJSS = rsbody.getString("XFB_SJSS")==null?"":rsbody.getString("XFB_SJSS");
					XFB_WHSS = rsbody.getString("XFB_WHSS")==null?"":rsbody.getString("XFB_WHSS");
					QTB_FSCD = rsbody.getString("QTB_FSCD")==null?"":rsbody.getString("QTB_FSCD");
					QTB_FSMJ = rsbody.getString("QTB_FSMJ")==null?"":rsbody.getString("QTB_FSMJ");
					QTB_FZMJ = rsbody.getString("QTB_FZMJ")==null?"":rsbody.getString("QTB_FZMJ");
					QTB_SJSS = rsbody.getString("QTB_SJSS")==null?"":rsbody.getString("QTB_SJSS");
					QTB_WHSS = rsbody.getString("QTB_WHSS")==null?"":rsbody.getString("QTB_WHSS");
					BHHJ_FSCD = rsbody.getString("BHHJ_FSCD")==null?"":rsbody.getString("BHHJ_FSCD");
					BHHJ_FSMJ = rsbody.getString("BHHJ_FSMJ")==null?"":rsbody.getString("BHHJ_FSMJ");
					BHHJ_FZMJ = rsbody.getString("BHHJ_FZMJ")==null?"":rsbody.getString("BHHJ_FZMJ");
					BHHJ_SJSS = rsbody.getString("BHHJ_SJSS")==null?"":rsbody.getString("BHHJ_SJSS");
					BHHJ_WHSS = rsbody.getString("BHHJ_WHSS")==null?"":rsbody.getString("BHHJ_WHSS");
					BCHJ_FSCD = rsbody.getString("BCHJ_FSCD")==null?"":rsbody.getString("BCHJ_FSCD");
					BCHJ_FSMJ = rsbody.getString("BCHJ_FSMJ")==null?"":rsbody.getString("BCHJ_FSMJ");
					BCHJ_FZMJ = rsbody.getString("BCHJ_FZMJ")==null?"":rsbody.getString("BCHJ_FZMJ");
					BCHJ_SJSS = rsbody.getString("BCHJ_SJSS")==null?"":rsbody.getString("BCHJ_SJSS");
					BCHJ_WHSS = rsbody.getString("BCHJ_WHSS")==null?"":rsbody.getString("BCHJ_WHSS");
					
					JFNO = rsbody.getString("JFNO")==null?"":rsbody.getString("JFNO");
					KSTBRQ = rsbody.getString("KSTBRQ")==null?"":rsbody.getString("KSTBRQ");
					JZTBRQ = rsbody.getString("JZTBRQ")==null?"":rsbody.getString("JZTBRQ");
					BBLX = rsbody.getString("BBLX")==null?"":rsbody.getString("BBLX");
					BMBM = rsbody.getString("BMBM")==null?"":rsbody.getString("BMBM");
					LRRY = rsbody.getString("LRRY")==null?"":rsbody.getString("LRRY");
					RWSJ = rsbody.getString("RWSJ")==null?"":rsbody.getString("RWSJ");
					LRRQ = rsbody.getString("LRRQ").substring(0, rsbody.getString("LRRQ").length()-2);
					DCRQ = rsbody.getString("DCRQ").substring(0, rsbody.getString("DCRQ").length()-10);
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
		<input name="DC" type="hidden" value="" />
		<input name="JFID" type="hidden" value="<%=jfid%>" />
		<input name="KSTBRQ" type="hidden" value="<%=kstbrq%>" /> 
		<input name="RWSJ" type="hidden" value="<%=rwsj%>" /> 
		<input name="JZTBRQ" type="hidden" value="<%=jztbrq%>" /> 
		<input name="lb" type="hidden" value="<%=lb%>" /> 
		<input name="zbid" type="hidden" value="<%=zbid%>" />
		<input name="rwid" type="hidden" value="<%=rwid%>" />
		<input name="ZT" type="hidden" value="0" />
		<%
				if(!bbzt.equals("2") && !bbzt.equals("3") && !bbzt.equals("4"))
				{
					%>
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td colspan=5 rowspan=1
					style="text-align:center;font-size=30;width: ;height: "><b>С�󲡳淢�����ͳ�Ʊ�(<%=rwsj %>)</b><br>
					<br></td>
			</tr>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">�ⱨվ�㣺<%=usebmmc%><input
					name="BMBM" type="hidden" value="<%=usebm%>" /></td>
				<td style="padding-left: 100px;padding-right: 100px;">����ʱ�䣺<input
					type="text" id="DCRQ" name="DCRQ"
					style="width:80;height: ;font-size:12" value="<%=DCRQ%>"
					class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})"
					onkeyup="changeiput(this)" /></td>
				<td style="padding-left: 100px;padding-right: 100px;">��λ����Ķ</td>
			</tr>
		</table>
		<table border=1 borderColorDark=black borderColorLight=white
			cellpadding=1 cellspacing=1 align=center id=zg name=zg>
			<tbody id="zg_head">
				<tr>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��������</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����̶�</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����������Ķ�Σ�</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����������Ķ�Σ�</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>ʵ����ʧ���֣�</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����ʧ���֣�</b></td>
				</tr>
			</tbody>
			<tbody id="zg_body">
				<tr>
					<td style="text-align: center;">����</td>
					<td><select name="MY_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="MY_FSMJ" type="text"
						value="<%=MY_FSMJ%>" alertname="���������������Ϊ����" datatype="number"  onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="MY_FZMJ" type="text"
						value="<%=MY_FZMJ%>" alertname="���������������Ϊ����" datatype="number"  onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="MY_SJSS" type="text"
						value="<%=MY_SJSS%>" alertname="����ʵ����ʧ����Ϊ����" datatype="number"  onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="MY_WHSS" type="text"
						value="<%=MY_WHSS%>" alertname="���������ʧ����Ϊ����" datatype="number"  onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">��֩��</td>
					<td><select name="MZZ_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="MZZ_FSMJ" type="text"
						value="<%=MZZ_FSMJ%>" alertname="��֩�뷢���������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="MZZ_FZMJ" type="text"
						value="<%=MZZ_FZMJ%>" alertname="��֩������������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="MZZ_SJSS" type="text"
						value="<%=MZZ_SJSS%>" alertname="��֩��ʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="MZZ_WHSS" type="text"
						value="<%=MZZ_WHSS%>" alertname="��֩�������ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">������</td>
					<td><select name="XJC_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="XJC_FSMJ" type="text"
						value="<%=XJC_FSMJ%>" alertname="�����淢���������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="XJC_FZMJ" type="text"
						value="<%=XJC_FZMJ%>" alertname="����������������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="XJC_SJSS" type="text"
						value="<%=XJC_SJSS%>" alertname="������ʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="XJC_WHSS" type="text"
						value="<%=XJC_WHSS%>" alertname="�����������ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">һ��ճ��</td>
					<td><select name="YDNC_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="YDNC_FSMJ" type="text"
						value="<%=YDNC_FSMJ%>" alertname="һ��ճ�淢���������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="YDNC_FZMJ" type="text"
						value="<%=YDNC_FZMJ%>" alertname="һ��ճ������������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="YDNC_SJSS" type="text"
						value="<%=YDNC_SJSS%>" alertname="һ��ճ��ʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="YDNC_WHSS" type="text"
						value="<%=YDNC_WHSS%>" alertname="һ��ճ�������ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">���º���</td>
					<td><select name="DXHC_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="DXHC_FSMJ" type="text"
						value="<%=DXHC_FSMJ%>" alertname="���º��淢���������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="DXHC_FZMJ" type="text"
						value="<%=DXHC_FZMJ%>" alertname="���º�������������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="DXHC_SJSS" type="text"
						value="<%=DXHC_SJSS%>" alertname="���º���ʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="DXHC_WHSS" type="text"
						value="<%=DXHC_WHSS%>" alertname="���º��������ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">�ҷ�ʭ</td>
					<td><select name="HFS_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="HFS_FSMJ" type="text"
						value="<%=HFS_FSMJ%>" alertname="�ҷ�ʭ�����������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="HFS_FZMJ" type="text"
						value="<%=HFS_FZMJ%>" alertname="�ҷ�ʭ�����������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="HFS_SJSS" type="text"
						value="<%=HFS_SJSS%>" alertname="�ҷ�ʭʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="HFS_WHSS" type="text"
						value="<%=HFS_WHSS%>" alertname="�ҷ�ʭ�����ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">����</td>
					<td><select name="TH_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="TH_FSMJ" type="text"
						value="<%=TH_FSMJ%>" alertname="���ȷ����������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="TH_FZMJ" type="text"
						value="<%=TH_FZMJ%>" alertname="���ȷ����������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="TH_SJSS" type="text"
						value="<%=TH_SJSS%>" alertname="����ʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="TH_WHSS" type="text"
						value="<%=TH_WHSS%>" alertname="���������ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">��Ҷ��</td>
					<td><select name="MYF_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="MYF_FSMJ" type="text"
						value="<%=MYF_FSMJ%>" alertname="��Ҷ�䷢���������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="MYF_FZMJ" type="text"
						value="<%=MYF_FZMJ%>" alertname="��Ҷ������������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="MYF_SJSS" type="text"
						value="<%=MYF_SJSS%>" alertname="��Ҷ��ʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="MYF_WHSS" type="text"
						value="<%=MYF_WHSS%>" alertname="��Ҷ�������ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">�󾥷�</td>
					<td><select name="MJF_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="MJF_FSMJ" type="text"
						value="<%=MJF_FSMJ%>" alertname="�󾥷䷢���������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="MJF_FZMJ" type="text"
						value="<%=MJF_FZMJ%>" alertname="�󾥷�����������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="MJF_SJSS" type="text"
						value="<%=MJF_SJSS%>" alertname="�󾥷�ʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="MJF_WHSS" type="text"
						value="<%=MJF_WHSS%>" alertname="�󾥷������ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">�����溦</td>
					<td><select name="QTCH_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="QTCH_FSMJ" type="text"
						value="<%=QTCH_FSMJ%>" alertname="�����溦�����������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="QTCH_FZMJ" type="text"
						value="<%=QTCH_FZMJ%>" alertname="�����溦�����������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="QTCH_SJSS" type="text"
						value="<%=QTCH_SJSS%>" alertname="�����溦ʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="QTCH_WHSS" type="text"
						value="<%=QTCH_WHSS%>" alertname="�����溦�����ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">�溦�ϼ�</td>
					<td><select name="CHHJ_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="CHHJ_FSMJ" type="text"
						value="<%=CHHJ_FSMJ%>" alertname="�溦�ϼƷ����������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="CHHJ_FZMJ" type="text"
						value="<%=CHHJ_FZMJ%>" alertname="�溦�ϼƷ����������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="CHHJ_SJSS" type="text"
						value="<%=CHHJ_SJSS%>" alertname="�溦�ϼ�ʵ����ʧ����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="CHHJ_WHSS" type="text"
						value="<%=CHHJ_WHSS%>" alertname="�溦�ϼ������ʧ����Ϊ����" datatype="number" /></td>
				</tr>
				<tr>
					<td style="text-align: center;">���ⲡ</td>
					<td><select name="TXB_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="TXB_FSMJ" type="text"
						value="<%=TXB_FSMJ%>" alertname="���ⲡ�����������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="TXB_FZMJ" type="text"
						value="<%=TXB_FZMJ%>" alertname="���ⲡ�����������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="TXB_SJSS" type="text"
						value="<%=TXB_SJSS%>" alertname="���ⲡʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="TXB_WHSS" type="text"
						value="<%=TXB_WHSS%>" alertname="���ⲡ�����ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">Ҷ�ⲡ</td>
					<td><select name="YXB_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="YXB_FSMJ" type="text"
						value="<%=YXB_FSMJ%>" alertname="Ҷ�ⲡ�����������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="YXB_FZMJ" type="text"
						value="<%=YXB_FZMJ%>" alertname="Ҷ�ⲡ�����������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="YXB_SJSS" type="text"
						value="<%=YXB_SJSS%>" alertname="Ҷ�ⲡʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="YXB_WHSS" type="text"
						value="<%=YXB_WHSS%>" alertname="Ҷ�ⲡ�����ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">��ù��</td>
					<td><select name="CMB_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="CMB_FSMJ" type="text"
						value="<%=CMB_FSMJ%>" alertname="��ù�������������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="CMB_FZMJ" type="text"
						value="<%=CMB_FZMJ%>" alertname="��ù�������������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="CMB_SJSS" type="text"
						value="<%=CMB_SJSS%>" alertname="��ù��ʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="CMB_WHSS" type="text"
						value="<%=CMB_WHSS%>" alertname="��ù�������ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">�׷۲�</td>
					<td><select name="BFB_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="BFB_FSMJ" type="text"
						value="<%=BFB_FSMJ%>" alertname="�׷۲������������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="BFB_FZMJ" type="text"
						value="<%=BFB_FZMJ%>" alertname="�׷۲������������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="BFB_SJSS" type="text"
						value="<%=BFB_SJSS%>" alertname="�׷۲�ʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="BFB_WHSS" type="text"
						value="<%=BFB_WHSS%>" alertname="�׷۲������ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">�ƿݲ�</td>
					<td><select name="WKB_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="WKB_FSMJ" type="text"
						value="<%=WKB_FSMJ%>" alertname="�ƿݲ������������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="WKB_FZMJ" type="text"
						value="<%=WKB_FZMJ%>" alertname="�ƿݲ������������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="WKB_SJSS" type="text"
						value="<%=WKB_SJSS%>" alertname="�ƿݲ�ʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="WKB_WHSS" type="text"
						value="<%=WKB_WHSS%>" alertname="�ƿݲ������ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">���벡</td>
					<td><select name="HSB_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="HSB_FSMJ" type="text"
						value="<%=HSB_FSMJ%>" alertname="���벡�����������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="HSB_FZMJ" type="text"
						value="<%=HSB_FZMJ%>" alertname="���벡�����������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="HSB_SJSS" type="text"
						value="<%=HSB_SJSS%>" alertname="���벡ʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="HSB_WHSS" type="text"
						value="<%=HSB_WHSS%>" alertname="���벡�����ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">������</td>
					<td><select name="BBB_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="BBB_FSMJ" type="text"
						value="<%=BBB_FSMJ%>" alertname="�����������������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="BBB_FZMJ" type="text"
						value="<%=BBB_FZMJ%>" alertname="�����������������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="BBB_SJSS" type="text"
						value="<%=BBB_SJSS%>" alertname="������ʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="BBB_WHSS" type="text"
						value="<%=BBB_WHSS%>" alertname="�����������ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">ȫʴ��</td>
					<td><select name="QSB_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="QSB_FSMJ" type="text"
						value="<%=QSB_FSMJ%>" alertname="ȫʴ�������������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="QSB_FZMJ" type="text"
						value="<%=QSB_FZMJ%>" alertname="ȫʴ�������������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="QSB_SJSS" type="text"
						value="<%=QSB_SJSS%>" alertname="ȫʴ��ʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="QSB_WHSS" type="text"
						value="<%=QSB_WHSS%>" alertname="ȫʴ�������ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">������</td>
					<td><select name="GFB_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="GFB_FSMJ" type="text"
						value="<%=GFB_FSMJ%>" alertname="�����������������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="GFB_FZMJ" type="text"
						value="<%=GFB_FZMJ%>" alertname="�����������������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="GFB_SJSS" type="text"
						value="<%=GFB_SJSS%>" alertname="������ʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="GFB_WHSS" type="text"
						value="<%=GFB_WHSS%>" alertname="�����������ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">Ҷ�ݲ�</td>
					<td><select name="YKB_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="YKB_FSMJ" type="text"
						value="<%=YKB_FSMJ%>" alertname="Ҷ�ݲ������������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="YKB_FZMJ" type="text"
						value="<%=YKB_FZMJ%>" alertname="Ҷ�ݲ������������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="YKB_SJSS" type="text"
						value="<%=YKB_SJSS%>" alertname="Ҷ�ݲ�ʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="YKB_WHSS" type="text"
						value="<%=YKB_WHSS%>" alertname="Ҷ�ݲ������ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">�߳没</td>
					<td><select name="XCB_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="XCB_FSMJ" type="text"
						value="<%=XCB_FSMJ%>" alertname="�߳没�����������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="XCB_FZMJ" type="text"
						value="<%=XCB_FZMJ%>" alertname="�߳没�����������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="XCB_SJSS" type="text"
						value="<%=XCB_SJSS%>" alertname="�߳没ʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="XCB_WHSS" type="text"
						value="<%=XCB_WHSS%>" alertname="�߳没�����ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">ѩ����</td>
					<td><select name="XFB_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="XFB_FSMJ" type="text"
						value="<%=XFB_FSMJ%>" alertname="ѩ���������������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="XFB_FZMJ" type="text"
						value="<%=XFB_FZMJ%>" alertname="ѩ���������������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="XFB_SJSS" type="text"
						value="<%=XFB_SJSS%>" alertname="ѩ����ʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="XFB_WHSS" type="text"
						value="<%=XFB_WHSS%>" alertname="ѩ���������ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">��������</td>
					<td><select name="QTB_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="QTB_FSMJ" type="text"
						value="<%=QTB_FSMJ%>" alertname="�������������������Ϊ����" datatype="number" onkeyup="fsmj(this)"/></td>
					<td><input style="width: 100%;" name="QTB_FZMJ" type="text"
						value="<%=QTB_FZMJ%>" alertname="�������������������Ϊ����" datatype="number" onkeyup="fzmj(this)"/></td>
					<td><input style="width: 100%;" name="QTB_SJSS" type="text"
						value="<%=QTB_SJSS%>" alertname="��������ʵ����ʧ����Ϊ����" datatype="number" onkeyup="sjss(this)"/></td>
					<td><input style="width: 100%;" name="QTB_WHSS" type="text"
						value="<%=QTB_WHSS%>" alertname="�������������ʧ����Ϊ����" datatype="number" onkeyup="whss(this)"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">�����ϼ�</td>
					<td><select name="BHHJ_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="BHHJ_FSMJ" type="text"
						value="<%=BHHJ_FSMJ%>" alertname="�����ϼƷ����������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="BHHJ_FZMJ" type="text"
						value="<%=BHHJ_FZMJ%>" alertname="�����ϼƷ����������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="BHHJ_SJSS" type="text"
						value="<%=BHHJ_SJSS%>" alertname="�����ϼ�ʵ����ʧ����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="BHHJ_WHSS" type="text"
						value="<%=BHHJ_WHSS%>" alertname="�����ϼ������ʧ����Ϊ����" datatype="number" /></td>
				</tr>
				<tr>
					<td style="text-align: center;">����ϼ�</td>
					<td><select name="BCHJ_FSCD"><option value="">��ѡ��</option><%=onpent %></select></td>
					<td><input style="width: 100%;" name="BCHJ_FSMJ" type="text"
						value="<%=BCHJ_FSMJ%>" alertname="����ϼƷ����������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="BCHJ_FZMJ" type="text"
						value="<%=BCHJ_FZMJ%>" alertname="����ϼƷ����������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="BCHJ_SJSS" type="text"
						value="<%=BCHJ_SJSS%>" alertname="����ϼ�ʵ����ʧ����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="BCHJ_WHSS" type="text"
						value="<%=BCHJ_WHSS%>" alertname="����ϼ������ʧ����Ϊ����" datatype="number" /></td>
				</tr>
			</tbody>
			<tr>
				<td colspan=100 align="center">
				<%
				if(!bbzt.equals("2") && !bbzt.equals("3") && !bbzt.equals("4"))
				{
					%>
				<input type="button" value="����" id="btnSave" onclick="zt(0)" />&nbsp;&nbsp;
				<input type="button" value="�ύ" id="btnSubmit" onclick="zt(1)" />&nbsp;&nbsp;
				<input type=button value="����" id="btnUpload" />
					<%
				}else{
					%>
				<input type=button value="����Excel" id="btnExport" onclick="dc()" />
					<%
				}
				%>
			</tr>
		</table>
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">¼����Ա��<%=LRRY %></td>
				<td style="padding-left: 100px;padding-right: 100px;">¼�����ڣ�<%=LRRQ %></td>
			</tr>
		</table>
					<%
				}else{
					%>
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td colspan=5 rowspan=1
					style="text-align:center;font-size=30;width: ;height: "><b>С�󲡳淢�����ͳ�Ʊ�(<%=rwsj %>)</b><br>
					<br></td>
			</tr>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">�ⱨվ�㣺<%=usebmmc%><input
					name="BMBM" type="hidden" value="<%=usebm%>" /></td>
				<td style="padding-left: 100px;padding-right: 100px;">����ʱ�䣺<label><%=DCRQ%></label></td>
				<td style="padding-left: 100px;padding-right: 100px;">��λ����Ķ</td>
			</tr>
		</table>
		<table border=1 borderColorDark=black borderColorLight=white
			cellpadding=1 cellspacing=1 align=center id=zg name=zg>
			<tbody id="zg_head">
				<tr>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��������</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����̶�</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����������Ķ�Σ�</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����������Ķ�Σ�</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>ʵ����ʧ���֣�</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����ʧ���֣�</b></td>
				</tr>
			</tbody>
			<tbody id="zg_body">
				<tr>
					<td style="text-align: center;">����</td>
					<td><label><%=MY_FSCD%>��</label></td>
					<td><label><%=MY_FSMJ%></label></td>
					<td><label><%=MY_FZMJ%></label></td>
					<td><label><%=MY_SJSS%></label></td>
					<td><label><%=MY_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">��֩��</td>
					<td><label><%=MZZ_FSCD%>��</label></td>
					<td><label><%=MZZ_FSMJ%></label></td>
					<td><label><%=MZZ_FZMJ%></label></td>
					<td><label><%=MZZ_SJSS%></label></td>
					<td><label><%=MZZ_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">������</td>
					<td><label><%=XJC_FSCD%>��</label></td>
					<td><label><%=XJC_FSMJ%></label></td>
					<td><label><%=XJC_FZMJ%></label></td>
					<td><label><%=XJC_SJSS%></label></td>
					<td><label><%=XJC_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">һ��ճ��</td>
					<td><label><%=YDNC_FSCD%>��</label></td>
					<td><label><%=YDNC_FSMJ%></label></td>
					<td><label><%=YDNC_FZMJ%></label></td>
					<td><label><%=YDNC_SJSS%></label></td>
					<td><label><%=YDNC_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">���º���</td>
					<td><label><%=DXHC_FSCD%>��</label></td>
					<td><label><%=DXHC_FSMJ%></label></td>
					<td><label><%=DXHC_FZMJ%></label></td>
					<td><label><%=DXHC_SJSS%></label></td>
					<td><label><%=DXHC_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">�ҷ�ʭ</td>
					<td><label><%=HFS_FSCD%>��</label></td>
					<td><label><%=HFS_FSMJ%></label></td>
					<td><label><%=HFS_FZMJ%></label></td>
					<td><label><%=HFS_SJSS%></label></td>
					<td><label><%=HFS_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">����</td>
					<td><label><%=TH_FSCD%>��</label></td>
					<td><label><%=TH_FSMJ%></label></td>
					<td><label><%=TH_FZMJ%></label></td>
					<td><label><%=TH_SJSS%></label></td>
					<td><label><%=TH_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">��Ҷ��</td>
					<td><label><%=MYF_FSCD%>��</label></td>
					<td><label><%=MYF_FSMJ%></label></td>
					<td><label><%=MYF_FZMJ%></label></td>
					<td><label><%=MYF_SJSS%></label></td>
					<td><label><%=MYF_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">�󾥷�</td>
					<td><label><%=MJF_FSCD%>��</label></td>
					<td><label><%=MJF_FSMJ%></label></td>
					<td><label><%=MJF_FZMJ%></label></td>
					<td><label><%=MJF_SJSS%></label></td>
					<td><label><%=MJF_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">�����溦</td>
					<td><label><%=QTCH_FSCD%>��</label></td>
					<td><label><%=QTCH_FSMJ%></label></td>
					<td><label><%=QTCH_FZMJ%></label></td>
					<td><label><%=QTCH_SJSS%></label></td>
					<td><label><%=QTCH_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">�溦�ϼ�</td>
					<td><label><%=CHHJ_FSCD%>��</label></td>
					<td><label><%=CHHJ_FSMJ%></label></td>
					<td><label><%=CHHJ_FZMJ%></label></td>
					<td><label><%=CHHJ_SJSS%></label></td>
					<td><label><%=CHHJ_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">���ⲡ</td>
					<td><label><%=TXB_FSCD%>��</label></td>
					<td><label><%=TXB_FSMJ%></label></td>
					<td><label><%=TXB_FZMJ%></label></td>
					<td><label><%=TXB_SJSS%></label></td>
					<td><label><%=TXB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">Ҷ�ⲡ</td>
					<td><label><%=YXB_FSCD%>��</label></td>
					<td><label><%=YXB_FSMJ%></label></td>
					<td><label><%=YXB_FZMJ%></label></td>
					<td><label><%=YXB_SJSS%></label></td>
					<td><label><%=YXB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">��ù��</td>
					<td><label><%=CMB_FSCD%>��</label></td>
					<td><label><%=CMB_FSMJ%></label></td>
					<td><label><%=CMB_FZMJ%></label></td>
					<td><label><%=CMB_SJSS%></label></td>
					<td><label><%=CMB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">�׷۲�</td>
					<td><label><%=BFB_FSCD%>��</label></td>
					<td><label><%=BFB_FSMJ%></label></td>
					<td><label><%=BFB_FZMJ%></label></td>
					<td><label><%=BFB_SJSS%></label></td>
					<td><label><%=BFB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">�ƿݲ�</td>
					<td><label><%=WKB_FSCD%>��</label></td>
					<td><label><%=WKB_FSMJ%></label></td>
					<td><label><%=WKB_FZMJ%></label></td>
					<td><label><%=WKB_SJSS%></label></td>
					<td><label><%=WKB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">���벡</td>
					<td><label><%=HSB_FSCD%>��</label></td>
					<td><label><%=HSB_FSMJ%></label></td>
					<td><label><%=HSB_FZMJ%></label></td>
					<td><label><%=HSB_SJSS%></label></td>
					<td><label><%=HSB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">������</td>
					<td><label><%=BBB_FSCD%>��</label></td>
					<td><label><%=BBB_FSMJ%></label></td>
					<td><label><%=BBB_FZMJ%></label></td>
					<td><label><%=BBB_SJSS%></label></td>
					<td><label><%=BBB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">ȫʴ��</td>
					<td><label><%=QSB_FSCD%>��</label></td>
					<td><label><%=QSB_FSMJ%></label></td>
					<td><label><%=QSB_FZMJ%></label></td>
					<td><label><%=QSB_SJSS%></label></td>
					<td><label><%=QSB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">������</td>
					<td><label><%=GFB_FSCD%>��</label></td>
					<td><label><%=GFB_FSMJ%></label></td>
					<td><label><%=GFB_FZMJ%></label></td>
					<td><label><%=GFB_SJSS%></label></td>
					<td><label><%=GFB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">Ҷ�ݲ�</td>
					<td><label><%=YKB_FSCD%>��</label></td>
					<td><label><%=YKB_FSMJ%></label></td>
					<td><label><%=YKB_FZMJ%></label></td>
					<td><label><%=YKB_SJSS%></label></td>
					<td><label><%=YKB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">�߳没</td>
					<td><label><%=XCB_FSCD%>��</label></td>
					<td><label><%=XCB_FSMJ%></label></td>
					<td><label><%=XCB_FZMJ%></label></td>
					<td><label><%=XCB_SJSS%></label></td>
					<td><label><%=XCB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">ѩ����</td>
					<td><label><%=XFB_FSCD%>��</label></td>
					<td><label><%=XFB_FSMJ%></label></td>
					<td><label><%=XFB_FZMJ%></label></td>
					<td><label><%=XFB_SJSS%></label></td>
					<td><label><%=XFB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">��������</td>
					<td><label><%=QTB_FSCD%>��</label></td>
					<td><label><%=QTB_FSMJ%></label></td>
					<td><label><%=QTB_FZMJ%></label></td>
					<td><label><%=QTB_SJSS%></label></td>
					<td><label><%=QTB_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">�����ϼ�</td>
					<td><label><%=BHHJ_FSCD%>��</label></td>
					<td><label><%=BHHJ_FSMJ%></label></td>
					<td><label><%=BHHJ_FZMJ%></label></td>
					<td><label><%=BHHJ_SJSS%></label></td>
					<td><label><%=BHHJ_WHSS%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">����ϼ�</td>
					<td><label><%=BCHJ_FSCD%>��</label></td>
					<td><label><%=BCHJ_FSMJ%></label></td>
					<td><label><%=BCHJ_FZMJ%></label></td>
					<td><label><%=BCHJ_SJSS%></label></td>
					<td><label><%=BCHJ_WHSS%></label></td>
				</tr>
			</tbody>
			<tr>
				<td colspan=100 align="center">
				<%
				if(!bbzt.equals("2") && !bbzt.equals("3") && !bbzt.equals("4"))
				{
					%>
				<input type="button" value="����" id="btnSave" onclick="zt(0)" />&nbsp;&nbsp;
				<input type="button" value="�ύ" id="btnSubmit" onclick="zt(1)" />
					<%
				}else{
					%>
				<input type=button value="����Excel" id="btnExport" onclick="dc()" />
					<%
				}
				%>
				
			</tr>
		</table>
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">¼����Ա��<%=LRRY %></td>
				<td style="padding-left: 100px;padding-right: 100px;">¼�����ڣ�<%=LRRQ %></td>
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
		xzsel('MY_FSCD','<%=MY_FSCD%>');
		xzsel('MZZ_FSCD','<%=MZZ_FSCD%>');
		xzsel('XJC_FSCD','<%=XJC_FSCD%>');
		xzsel('YDNC_FSCD','<%=YDNC_FSCD%>');
		xzsel('DXHC_FSCD','<%=DXHC_FSCD%>');
		xzsel('HFS_FSCD','<%=HFS_FSCD%>');
		xzsel('TH_FSCD','<%=TH_FSCD%>');
		xzsel('MYF_FSCD','<%=MYF_FSCD%>');
		xzsel('MJF_FSCD','<%=MJF_FSCD%>');
		xzsel('QTCH_FSCD','<%=QTCH_FSCD%>');
		xzsel('CHHJ_FSCD','<%=CHHJ_FSCD%>');
		xzsel('TXB_FSCD','<%=TXB_FSCD%>');
		xzsel('YXB_FSCD','<%=YXB_FSCD%>');
		xzsel('CMB_FSCD','<%=CMB_FSCD%>');
		xzsel('BFB_FSCD','<%=BFB_FSCD%>');
		xzsel('WKB_FSCD','<%=WKB_FSCD%>');
		xzsel('HSB_FSCD','<%=HSB_FSCD%>');
		xzsel('BBB_FSCD','<%=BBB_FSCD%>');
		xzsel('QSB_FSCD','<%=QSB_FSCD%>');
		xzsel('GFB_FSCD','<%=GFB_FSCD%>');
		xzsel('YKB_FSCD','<%=YKB_FSCD%>');
		xzsel('XCB_FSCD','<%=XCB_FSCD%>');
		xzsel('XFB_FSCD','<%=XFB_FSCD%>');
		xzsel('QTB_FSCD','<%=QTB_FSCD%>');
		xzsel('BHHJ_FSCD','<%=BHHJ_FSCD%>');
		xzsel('BCHJ_FSCD','<%=BCHJ_FSCD%>');
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
	function fsmj(obj) {
		var zh = 0.0;
		var ch=0.0;
		var bh=0.0;
		var hz=obj.name.split("_")[0].substr(obj.name.split("_")[0].length-1); 
		if (!isNaN(obj.value)) {
			if ($("input[name='MY_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='MY_FSMJ']").val());
			}
			if ($("input[name='MZZ_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_FSMJ']").val());
			}
			if ($("input[name='XJC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_FSMJ']").val());
			}
			if ($("input[name='YDNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDNC_FSMJ']").val());
			}
			if ($("input[name='DXHC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DXHC_FSMJ']").val());
			}
			if ($("input[name='HFS_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='HFS_FSMJ']").val());
			}
			if ($("input[name='TH_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='TH_FSMJ']").val());
			}
			if ($("input[name='MYF_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='MYF_FSMJ']").val());
			}
			if ($("input[name='MJF_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='MJF_FSMJ']").val());
			}
			if ($("input[name='QTCH_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTCH_FSMJ']").val());
			}
			if ($("input[name='TXB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_FSMJ']").val());
			}
			if ($("input[name='YXB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YXB_FSMJ']").val());
			}
			if ($("input[name='CMB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_FSMJ']").val());
			}
			if ($("input[name='BFB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_FSMJ']").val());
			}
			if ($("input[name='WKB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_FSMJ']").val());
			}
			if ($("input[name='HSB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='HSB_FSMJ']").val());
			}
			if ($("input[name='BBB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='BBB_FSMJ']").val());
			}
			if ($("input[name='QSB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QSB_FSMJ']").val());
			}
			if ($("input[name='GFB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='GFB_FSMJ']").val());
			}
			if ($("input[name='YKB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YKB_FSMJ']").val());
			}
			if ($("input[name='XCB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XCB_FSMJ']").val());
			}
			if ($("input[name='XFB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XFB_FSMJ']").val());
			}
			if ($("input[name='QTB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTB_FSMJ']").val());
			}
			if(hz=="B")
			{
				if ($("input[name='TXB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='TXB_FSMJ']").val());
				}
				if ($("input[name='YXB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='YXB_FSMJ']").val());
				}
				if ($("input[name='CMB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='CMB_FSMJ']").val());
				}
				if ($("input[name='BFB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='BFB_FSMJ']").val());
				}
				if ($("input[name='WKB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='WKB_FSMJ']").val());
				}
				if ($("input[name='HSB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='HSB_FSMJ']").val());
				}
				if ($("input[name='BBB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='BBB_FSMJ']").val());
				}
				if ($("input[name='QSB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='QSB_FSMJ']").val());
				}
				if ($("input[name='GFB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='GFB_FSMJ']").val());
				}
				if ($("input[name='YKB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='YKB_FSMJ']").val());
				}
				if ($("input[name='XCB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='XCB_FSMJ']").val());
				}
				if ($("input[name='XFB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='XFB_FSMJ']").val());
				}
				if ($("input[name='QTB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='QTB_FSMJ']").val());
				}
				$("input[name='BHHJ_FSMJ']").val(bh);
			}
			else
			{
				if ($("input[name='MY_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='MY_FSMJ']").val());
				}
				if ($("input[name='MZZ_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='MZZ_FSMJ']").val());
				}
				if ($("input[name='XJC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='XJC_FSMJ']").val());
				}
				if ($("input[name='YDNC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YDNC_FSMJ']").val());
				}
				if ($("input[name='DXHC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='DXHC_FSMJ']").val());
				}
				if ($("input[name='HFS_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='HFS_FSMJ']").val());
				}
				if ($("input[name='TH_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='TH_FSMJ']").val());
				}
				if ($("input[name='MYF_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='MYF_FSMJ']").val());
				}
				if ($("input[name='MJF_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='MJF_FSMJ']").val());
				}
				if ($("input[name='QTCH_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='QTCH_FSMJ']").val());
				}
				$("input[name='CHHJ_FSMJ']").val(ch);
			}
			$("input[name='BCHJ_FSMJ']").val(zh);
		} else {
			alert("����������");
			obj.value = "";
			if ($("input[name='MY_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='MY_FSMJ']").val());
			}
			if ($("input[name='MZZ_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_FSMJ']").val());
			}
			if ($("input[name='XJC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_FSMJ']").val());
			}
			if ($("input[name='YDNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDNC_FSMJ']").val());
			}
			if ($("input[name='DXHC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DXHC_FSMJ']").val());
			}
			if ($("input[name='HFS_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='HFS_FSMJ']").val());
			}
			if ($("input[name='TH_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='TH_FSMJ']").val());
			}
			if ($("input[name='MYF_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='MYF_FSMJ']").val());
			}
			if ($("input[name='MJF_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='MJF_FSMJ']").val());
			}
			if ($("input[name='QTCH_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTCH_FSMJ']").val());
			}
			if ($("input[name='TXB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_FSMJ']").val());
			}
			if ($("input[name='YXB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YXB_FSMJ']").val());
			}
			if ($("input[name='CMB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_FSMJ']").val());
			}
			if ($("input[name='BFB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_FSMJ']").val());
			}
			if ($("input[name='WKB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_FSMJ']").val());
			}
			if ($("input[name='HSB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='HSB_FSMJ']").val());
			}
			if ($("input[name='BBB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='BBB_FSMJ']").val());
			}
			if ($("input[name='QSB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QSB_FSMJ']").val());
			}
			if ($("input[name='GFB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='GFB_FSMJ']").val());
			}
			if ($("input[name='YKB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YKB_FSMJ']").val());
			}
			if ($("input[name='XCB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XCB_FSMJ']").val());
			}
			if ($("input[name='XFB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XFB_FSMJ']").val());
			}
			if ($("input[name='QTB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTB_FSMJ']").val());
			}
			if(hz=="B")
			{
				if ($("input[name='TXB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='TXB_FSMJ']").val());
				}
				if ($("input[name='YXB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='YXB_FSMJ']").val());
				}
				if ($("input[name='CMB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='CMB_FSMJ']").val());
				}
				if ($("input[name='BFB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='BFB_FSMJ']").val());
				}
				if ($("input[name='WKB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='WKB_FSMJ']").val());
				}
				if ($("input[name='HSB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='HSB_FSMJ']").val());
				}
				if ($("input[name='BBB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='BBB_FSMJ']").val());
				}
				if ($("input[name='QSB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='QSB_FSMJ']").val());
				}
				if ($("input[name='GFB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='GFB_FSMJ']").val());
				}
				if ($("input[name='YKB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='YKB_FSMJ']").val());
				}
				if ($("input[name='XCB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='XCB_FSMJ']").val());
				}
				if ($("input[name='XFB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='XFB_FSMJ']").val());
				}
				if ($("input[name='QTB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='QTB_FSMJ']").val());
				}
				$("input[name='BHHJ_FSMJ']").val(bh);
			}
			else
			{
				if ($("input[name='MY_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='MY_FSMJ']").val());
				}
				if ($("input[name='MZZ_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='MZZ_FSMJ']").val());
				}
				if ($("input[name='XJC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='XJC_FSMJ']").val());
				}
				if ($("input[name='YDNC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YDNC_FSMJ']").val());
				}
				if ($("input[name='DXHC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='DXHC_FSMJ']").val());
				}
				if ($("input[name='HFS_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='HFS_FSMJ']").val());
				}
				if ($("input[name='TH_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='TH_FSMJ']").val());
				}
				if ($("input[name='MYF_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='MYF_FSMJ']").val());
				}
				if ($("input[name='MJF_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='MJF_FSMJ']").val());
				}
				if ($("input[name='QTCH_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='QTCH_FSMJ']").val());
				}
				$("input[name='CHHJ_FSMJ']").val(ch);
			}
			$("input[name='BCHJ_FSMJ']").val(zh);
		}
	}
	function fzmj(obj) {
		var zh = 0.0;
		var ch=0.0;
		var bh=0.0;
		var hz=obj.name.split("_")[0].substr(obj.name.split("_")[0].length-1); 
		if (!isNaN(obj.value)) {
			if ($("input[name='MY_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='MY_FZMJ']").val());
			}
			if ($("input[name='MZZ_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_FZMJ']").val());
			}
			if ($("input[name='XJC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_FZMJ']").val());
			}
			if ($("input[name='YDNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDNC_FZMJ']").val());
			}
			if ($("input[name='DXHC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DXHC_FZMJ']").val());
			}
			if ($("input[name='HFS_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='HFS_FZMJ']").val());
			}
			if ($("input[name='TH_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='TH_FZMJ']").val());
			}
			if ($("input[name='MYF_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='MYF_FZMJ']").val());
			}
			if ($("input[name='MJF_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='MJF_FZMJ']").val());
			}
			if ($("input[name='QTCH_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTCH_FZMJ']").val());
			}
			if ($("input[name='TXB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_FZMJ']").val());
			}
			if ($("input[name='YXB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YXB_FZMJ']").val());
			}
			if ($("input[name='CMB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_FZMJ']").val());
			}
			if ($("input[name='BFB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_FZMJ']").val());
			}
			if ($("input[name='WKB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_FZMJ']").val());
			}
			if ($("input[name='HSB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='HSB_FZMJ']").val());
			}
			if ($("input[name='BBB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='BBB_FZMJ']").val());
			}
			if ($("input[name='QSB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QSB_FZMJ']").val());
			}
			if ($("input[name='GFB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='GFB_FZMJ']").val());
			}
			if ($("input[name='YKB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YKB_FZMJ']").val());
			}
			if ($("input[name='XCB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XCB_FZMJ']").val());
			}
			if ($("input[name='XFB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XFB_FZMJ']").val());
			}
			if ($("input[name='QTB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTB_FZMJ']").val());
			}
			if(hz=="B")
			{
				if ($("input[name='TXB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='TXB_FZMJ']").val());
				}
				if ($("input[name='YXB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='YXB_FZMJ']").val());
				}
				if ($("input[name='CMB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='CMB_FZMJ']").val());
				}
				if ($("input[name='BFB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='BFB_FZMJ']").val());
				}
				if ($("input[name='WKB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='WKB_FZMJ']").val());
				}
				if ($("input[name='HSB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='HSB_FZMJ']").val());
				}
				if ($("input[name='BBB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='BBB_FZMJ']").val());
				}
				if ($("input[name='QSB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='QSB_FZMJ']").val());
				}
				if ($("input[name='GFB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='GFB_FZMJ']").val());
				}
				if ($("input[name='YKB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='YKB_FZMJ']").val());
				}
				if ($("input[name='XCB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='XCB_FZMJ']").val());
				}
				if ($("input[name='XFB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='XFB_FZMJ']").val());
				}
				if ($("input[name='QTB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='QTB_FZMJ']").val());
				}
				$("input[name='BHHJ_FZMJ']").val(bh);
			}
			else
			{
				if ($("input[name='MY_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='MY_FZMJ']").val());
				}
				if ($("input[name='MZZ_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='MZZ_FZMJ']").val());
				}
				if ($("input[name='XJC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='XJC_FZMJ']").val());
				}
				if ($("input[name='YDNC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YDNC_FZMJ']").val());
				}
				if ($("input[name='DXHC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='DXHC_FZMJ']").val());
				}
				if ($("input[name='HFS_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='HFS_FZMJ']").val());
				}
				if ($("input[name='TH_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='TH_FZMJ']").val());
				}
				if ($("input[name='MYF_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='MYF_FZMJ']").val());
				}
				if ($("input[name='MJF_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='MJF_FZMJ']").val());
				}
				if ($("input[name='QTCH_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='QTCH_FZMJ']").val());
				}
				$("input[name='CHHJ_FZMJ']").val(ch);
			}
			$("input[name='BCHJ_FZMJ']").val(zh);
		} else {
			alert("����������");
			obj.value = "";
			if ($("input[name='MY_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='MY_FZMJ']").val());
			}
			if ($("input[name='MZZ_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_FZMJ']").val());
			}
			if ($("input[name='XJC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_FZMJ']").val());
			}
			if ($("input[name='YDNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDNC_FZMJ']").val());
			}
			if ($("input[name='DXHC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DXHC_FZMJ']").val());
			}
			if ($("input[name='HFS_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='HFS_FZMJ']").val());
			}
			if ($("input[name='TH_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='TH_FZMJ']").val());
			}
			if ($("input[name='MYF_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='MYF_FZMJ']").val());
			}
			if ($("input[name='MJF_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='MJF_FZMJ']").val());
			}
			if ($("input[name='QTCH_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTCH_FZMJ']").val());
			}
			if ($("input[name='TXB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_FZMJ']").val());
			}
			if ($("input[name='YXB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YXB_FZMJ']").val());
			}
			if ($("input[name='CMB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_FZMJ']").val());
			}
			if ($("input[name='BFB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_FZMJ']").val());
			}
			if ($("input[name='WKB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_FZMJ']").val());
			}
			if ($("input[name='HSB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='HSB_FZMJ']").val());
			}
			if ($("input[name='BBB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='BBB_FZMJ']").val());
			}
			if ($("input[name='QSB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QSB_FZMJ']").val());
			}
			if ($("input[name='GFB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='GFB_FZMJ']").val());
			}
			if ($("input[name='YKB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YKB_FZMJ']").val());
			}
			if ($("input[name='XCB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XCB_FZMJ']").val());
			}
			if ($("input[name='XFB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XFB_FZMJ']").val());
			}
			if ($("input[name='QTB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTB_FZMJ']").val());
			}
			if(hz=="B")
			{
				if ($("input[name='TXB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='TXB_FZMJ']").val());
				}
				if ($("input[name='YXB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='YXB_FZMJ']").val());
				}
				if ($("input[name='CMB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='CMB_FZMJ']").val());
				}
				if ($("input[name='BFB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='BFB_FZMJ']").val());
				}
				if ($("input[name='WKB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='WKB_FZMJ']").val());
				}
				if ($("input[name='HSB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='HSB_FZMJ']").val());
				}
				if ($("input[name='BBB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='BBB_FZMJ']").val());
				}
				if ($("input[name='QSB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='QSB_FZMJ']").val());
				}
				if ($("input[name='GFB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='GFB_FZMJ']").val());
				}
				if ($("input[name='YKB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='YKB_FZMJ']").val());
				}
				if ($("input[name='XCB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='XCB_FZMJ']").val());
				}
				if ($("input[name='XFB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='XFB_FZMJ']").val());
				}
				if ($("input[name='QTB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='QTB_FZMJ']").val());
				}
				$("input[name='BHHJ_FZMJ']").val(bh);
			}
			else
			{
				if ($("input[name='MY_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='MY_FZMJ']").val());
				}
				if ($("input[name='MZZ_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='MZZ_FZMJ']").val());
				}
				if ($("input[name='XJC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='XJC_FZMJ']").val());
				}
				if ($("input[name='YDNC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YDNC_FZMJ']").val());
				}
				if ($("input[name='DXHC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='DXHC_FZMJ']").val());
				}
				if ($("input[name='HFS_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='HFS_FZMJ']").val());
				}
				if ($("input[name='TH_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='TH_FZMJ']").val());
				}
				if ($("input[name='MYF_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='MYF_FZMJ']").val());
				}
				if ($("input[name='MJF_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='MJF_FZMJ']").val());
				}
				if ($("input[name='QTCH_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='QTCH_FZMJ']").val());
				}
				$("input[name='CHHJ_FZMJ']").val(ch);
			}
			$("input[name='BCHJ_FZMJ']").val(zh);
		}
	}
	function sjss(obj) {
		var zh = 0.0;
		var ch=0.0;
		var bh=0.0;
		var hz=obj.name.split("_")[0].substr(obj.name.split("_")[0].length-1); 
		if (!isNaN(obj.value)) {
			if ($("input[name='MY_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='MY_SJSS']").val());
			}
			if ($("input[name='MZZ_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_SJSS']").val());
			}
			if ($("input[name='XJC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_SJSS']").val());
			}
			if ($("input[name='YDNC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDNC_SJSS']").val());
			}
			if ($("input[name='DXHC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='DXHC_SJSS']").val());
			}
			if ($("input[name='HFS_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='HFS_SJSS']").val());
			}
			if ($("input[name='TH_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='TH_SJSS']").val());
			}
			if ($("input[name='MYF_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='MYF_SJSS']").val());
			}
			if ($("input[name='MJF_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='MJF_SJSS']").val());
			}
			if ($("input[name='QTCH_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='QTCH_SJSS']").val());
			}
			if ($("input[name='TXB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_SJSS']").val());
			}
			if ($("input[name='YXB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YXB_SJSS']").val());
			}
			if ($("input[name='CMB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_SJSS']").val());
			}
			if ($("input[name='BFB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_SJSS']").val());
			}
			if ($("input[name='WKB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_SJSS']").val());
			}
			if ($("input[name='HSB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='HSB_SJSS']").val());
			}
			if ($("input[name='BBB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='BBB_SJSS']").val());
			}
			if ($("input[name='QSB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='QSB_SJSS']").val());
			}
			if ($("input[name='GFB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='GFB_SJSS']").val());
			}
			if ($("input[name='YKB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YKB_SJSS']").val());
			}
			if ($("input[name='XCB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='XCB_SJSS']").val());
			}
			if ($("input[name='XFB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='XFB_SJSS']").val());
			}
			if ($("input[name='QTB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='QTB_SJSS']").val());
			}
			if(hz=="B")
			{
				if ($("input[name='TXB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='TXB_SJSS']").val());
				}
				if ($("input[name='YXB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='YXB_SJSS']").val());
				}
				if ($("input[name='CMB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='CMB_SJSS']").val());
				}
				if ($("input[name='BFB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='BFB_SJSS']").val());
				}
				if ($("input[name='WKB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='WKB_SJSS']").val());
				}
				if ($("input[name='HSB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='HSB_SJSS']").val());
				}
				if ($("input[name='BBB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='BBB_SJSS']").val());
				}
				if ($("input[name='QSB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='QSB_SJSS']").val());
				}
				if ($("input[name='GFB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='GFB_SJSS']").val());
				}
				if ($("input[name='YKB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='YKB_SJSS']").val());
				}
				if ($("input[name='XCB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='XCB_SJSS']").val());
				}
				if ($("input[name='XFB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='XFB_SJSS']").val());
				}
				if ($("input[name='QTB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='QTB_SJSS']").val());
				}
				$("input[name='BHHJ_SJSS']").val(bh);
			}
			else
			{
				if ($("input[name='MY_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='MY_SJSS']").val());
				}
				if ($("input[name='MZZ_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='MZZ_SJSS']").val());
				}
				if ($("input[name='XJC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='XJC_SJSS']").val());
				}
				if ($("input[name='YDNC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='YDNC_SJSS']").val());
				}
				if ($("input[name='DXHC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='DXHC_SJSS']").val());
				}
				if ($("input[name='HFS_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='HFS_SJSS']").val());
				}
				if ($("input[name='TH_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='TH_SJSS']").val());
				}
				if ($("input[name='MYF_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='MYF_SJSS']").val());
				}
				if ($("input[name='MJF_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='MJF_SJSS']").val());
				}
				if ($("input[name='QTCH_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='QTCH_SJSS']").val());
				}
				$("input[name='CHHJ_SJSS']").val(ch);
			}
			$("input[name='BCHJ_SJSS']").val(zh);
		} else {
			alert("����������");
			obj.value = "";
			if ($("input[name='MY_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='MY_SJSS']").val());
			}
			if ($("input[name='MZZ_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_SJSS']").val());
			}
			if ($("input[name='XJC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_SJSS']").val());
			}
			if ($("input[name='YDNC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDNC_SJSS']").val());
			}
			if ($("input[name='DXHC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='DXHC_SJSS']").val());
			}
			if ($("input[name='HFS_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='HFS_SJSS']").val());
			}
			if ($("input[name='TH_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='TH_SJSS']").val());
			}
			if ($("input[name='MYF_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='MYF_SJSS']").val());
			}
			if ($("input[name='MJF_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='MJF_SJSS']").val());
			}
			if ($("input[name='QTCH_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='QTCH_SJSS']").val());
			}
			if ($("input[name='TXB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_SJSS']").val());
			}
			if ($("input[name='YXB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YXB_SJSS']").val());
			}
			if ($("input[name='CMB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_SJSS']").val());
			}
			if ($("input[name='BFB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_SJSS']").val());
			}
			if ($("input[name='WKB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_SJSS']").val());
			}
			if ($("input[name='HSB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='HSB_SJSS']").val());
			}
			if ($("input[name='BBB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='BBB_SJSS']").val());
			}
			if ($("input[name='QSB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='QSB_SJSS']").val());
			}
			if ($("input[name='GFB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='GFB_SJSS']").val());
			}
			if ($("input[name='YKB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YKB_SJSS']").val());
			}
			if ($("input[name='XCB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='XCB_SJSS']").val());
			}
			if ($("input[name='XFB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='XFB_SJSS']").val());
			}
			if ($("input[name='QTB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='QTB_SJSS']").val());
			}
			if(hz=="B")
			{
				if ($("input[name='TXB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='TXB_SJSS']").val());
				}
				if ($("input[name='YXB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='YXB_SJSS']").val());
				}
				if ($("input[name='CMB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='CMB_SJSS']").val());
				}
				if ($("input[name='BFB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='BFB_SJSS']").val());
				}
				if ($("input[name='WKB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='WKB_SJSS']").val());
				}
				if ($("input[name='HSB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='HSB_SJSS']").val());
				}
				if ($("input[name='BBB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='BBB_SJSS']").val());
				}
				if ($("input[name='QSB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='QSB_SJSS']").val());
				}
				if ($("input[name='GFB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='GFB_SJSS']").val());
				}
				if ($("input[name='YKB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='YKB_SJSS']").val());
				}
				if ($("input[name='XCB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='XCB_SJSS']").val());
				}
				if ($("input[name='XFB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='XFB_SJSS']").val());
				}
				if ($("input[name='QTB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='QTB_SJSS']").val());
				}
				$("input[name='BHHJ_SJSS']").val(bh);
			}
			else
			{
				if ($("input[name='MY_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='MY_SJSS']").val());
				}
				if ($("input[name='MZZ_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='MZZ_SJSS']").val());
				}
				if ($("input[name='XJC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='XJC_SJSS']").val());
				}
				if ($("input[name='YDNC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='YDNC_SJSS']").val());
				}
				if ($("input[name='DXHC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='DXHC_SJSS']").val());
				}
				if ($("input[name='HFS_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='HFS_SJSS']").val());
				}
				if ($("input[name='TH_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='TH_SJSS']").val());
				}
				if ($("input[name='MYF_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='MYF_SJSS']").val());
				}
				if ($("input[name='MJF_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='MJF_SJSS']").val());
				}
				if ($("input[name='QTCH_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='QTCH_SJSS']").val());
				}
				$("input[name='CHHJ_SJSS']").val(ch);
			}
			$("input[name='BCHJ_SJSS']").val(zh);
		}
	}
	function whss(obj) {
		var zh = 0.0;
		var ch=0.0;
		var bh=0.0;
		var hz=obj.name.split("_")[0].substr(obj.name.split("_")[0].length-1); 
		if (!isNaN(obj.value)) {
			if ($("input[name='MY_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='MY_WHSS']").val());
			}
			if ($("input[name='MZZ_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_WHSS']").val());
			}
			if ($("input[name='XJC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_WHSS']").val());
			}
			if ($("input[name='YDNC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDNC_WHSS']").val());
			}
			if ($("input[name='DXHC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='DXHC_WHSS']").val());
			}
			if ($("input[name='HFS_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='HFS_WHSS']").val());
			}
			if ($("input[name='TH_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='TH_WHSS']").val());
			}
			if ($("input[name='MYF_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='MYF_WHSS']").val());
			}
			if ($("input[name='MJF_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='MJF_WHSS']").val());
			}
			if ($("input[name='QTCH_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='QTCH_WHSS']").val());
			}
			if ($("input[name='TXB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_WHSS']").val());
			}
			if ($("input[name='YXB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YXB_WHSS']").val());
			}
			if ($("input[name='CMB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_WHSS']").val());
			}
			if ($("input[name='BFB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_WHSS']").val());
			}
			if ($("input[name='WKB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_WHSS']").val());
			}
			if ($("input[name='HSB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='HSB_WHSS']").val());
			}
			if ($("input[name='BBB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='BBB_WHSS']").val());
			}
			if ($("input[name='QSB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='QSB_WHSS']").val());
			}
			if ($("input[name='GFB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='GFB_WHSS']").val());
			}
			if ($("input[name='YKB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YKB_WHSS']").val());
			}
			if ($("input[name='XCB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='XCB_WHSS']").val());
			}
			if ($("input[name='XFB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='XFB_WHSS']").val());
			}
			if ($("input[name='QTB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='QTB_WHSS']").val());
			}
			if(hz=="B")
			{
				if ($("input[name='TXB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='TXB_WHSS']").val());
				}
				if ($("input[name='YXB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='YXB_WHSS']").val());
				}
				if ($("input[name='CMB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='CMB_WHSS']").val());
				}
				if ($("input[name='BFB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='BFB_WHSS']").val());
				}
				if ($("input[name='WKB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='WKB_WHSS']").val());
				}
				if ($("input[name='HSB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='HSB_WHSS']").val());
				}
				if ($("input[name='BBB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='BBB_WHSS']").val());
				}
				if ($("input[name='QSB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='QSB_WHSS']").val());
				}
				if ($("input[name='GFB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='GFB_WHSS']").val());
				}
				if ($("input[name='YKB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='YKB_WHSS']").val());
				}
				if ($("input[name='XCB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='XCB_WHSS']").val());
				}
				if ($("input[name='XFB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='XFB_WHSS']").val());
				}
				if ($("input[name='QTB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='QTB_WHSS']").val());
				}
				$("input[name='BHHJ_WHSS']").val(bh);
			}
			else
			{
				if ($("input[name='MY_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='MY_WHSS']").val());
				}
				if ($("input[name='MZZ_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='MZZ_WHSS']").val());
				}
				if ($("input[name='XJC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='XJC_WHSS']").val());
				}
				if ($("input[name='YDNC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='YDNC_WHSS']").val());
				}
				if ($("input[name='DXHC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='DXHC_WHSS']").val());
				}
				if ($("input[name='HFS_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='HFS_WHSS']").val());
				}
				if ($("input[name='TH_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='TH_WHSS']").val());
				}
				if ($("input[name='MYF_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='MYF_WHSS']").val());
				}
				if ($("input[name='MJF_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='MJF_WHSS']").val());
				}
				if ($("input[name='QTCH_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='QTCH_WHSS']").val());
				}
				$("input[name='CHHJ_WHSS']").val(ch);
			}
			$("input[name='BCHJ_WHSS']").val(zh);
		} else {
			alert("����������");
			obj.value = "";
			if ($("input[name='MY_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='MY_WHSS']").val());
			}
			if ($("input[name='MZZ_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_WHSS']").val());
			}
			if ($("input[name='XJC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_WHSS']").val());
			}
			if ($("input[name='YDNC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDNC_WHSS']").val());
			}
			if ($("input[name='DXHC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='DXHC_WHSS']").val());
			}
			if ($("input[name='HFS_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='HFS_WHSS']").val());
			}
			if ($("input[name='TH_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='TH_WHSS']").val());
			}
			if ($("input[name='MYF_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='MYF_WHSS']").val());
			}
			if ($("input[name='MJF_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='MJF_WHSS']").val());
			}
			if ($("input[name='QTCH_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='QTCH_WHSS']").val());
			}
			if ($("input[name='TXB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_WHSS']").val());
			}
			if ($("input[name='YXB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YXB_WHSS']").val());
			}
			if ($("input[name='CMB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_WHSS']").val());
			}
			if ($("input[name='BFB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_WHSS']").val());
			}
			if ($("input[name='WKB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_WHSS']").val());
			}
			if ($("input[name='HSB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='HSB_WHSS']").val());
			}
			if ($("input[name='BBB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='BBB_WHSS']").val());
			}
			if ($("input[name='QSB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='QSB_WHSS']").val());
			}
			if ($("input[name='GFB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='GFB_WHSS']").val());
			}
			if ($("input[name='YKB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YKB_WHSS']").val());
			}
			if ($("input[name='XCB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='XCB_WHSS']").val());
			}
			if ($("input[name='XFB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='XFB_WHSS']").val());
			}
			if ($("input[name='QTB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='QTB_WHSS']").val());
			}
			if(hz=="B")
			{
				if ($("input[name='TXB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='TXB_WHSS']").val());
				}
				if ($("input[name='YXB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='YXB_WHSS']").val());
				}
				if ($("input[name='CMB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='CMB_WHSS']").val());
				}
				if ($("input[name='BFB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='BFB_WHSS']").val());
				}
				if ($("input[name='WKB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='WKB_WHSS']").val());
				}
				if ($("input[name='HSB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='HSB_WHSS']").val());
				}
				if ($("input[name='BBB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='BBB_WHSS']").val());
				}
				if ($("input[name='QSB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='QSB_WHSS']").val());
				}
				if ($("input[name='GFB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='GFB_WHSS']").val());
				}
				if ($("input[name='YKB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='YKB_WHSS']").val());
				}
				if ($("input[name='XCB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='XCB_WHSS']").val());
				}
				if ($("input[name='XFB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='XFB_WHSS']").val());
				}
				if ($("input[name='QTB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='QTB_WHSS']").val());
				}
				$("input[name='BHHJ_WHSS']").val(bh);
			}
			else
			{
				if ($("input[name='MY_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='MY_WHSS']").val());
				}
				if ($("input[name='MZZ_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='MZZ_WHSS']").val());
				}
				if ($("input[name='XJC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='XJC_WHSS']").val());
				}
				if ($("input[name='YDNC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='YDNC_WHSS']").val());
				}
				if ($("input[name='DXHC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='DXHC_WHSS']").val());
				}
				if ($("input[name='HFS_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='HFS_WHSS']").val());
				}
				if ($("input[name='TH_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='TH_WHSS']").val());
				}
				if ($("input[name='MYF_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='MYF_WHSS']").val());
				}
				if ($("input[name='MJF_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='MJF_WHSS']").val());
				}
				if ($("input[name='QTCH_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='QTCH_WHSS']").val());
				}
				$("input[name='CHHJ_WHSS']").val(ch);
			}
			$("input[name='BCHJ_WHSS']").val(zh);
		}
	}
</script>
</html>