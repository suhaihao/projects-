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
		String MD_ZZMJ = "";
		String CM_ZZMJ = "";
		String BZQ="";
		String YLM_MJBL = "";
		String ELM_MJBL = "";
		String SLM_MJBL = "";
		String ZTMQYCNBJ = "";
		String ZS = "";
		String ZZPZKCX = "";
		String TXB_MJ = "";
		String TXB_FSJS = "";
		String TXB_BCN = "";
		String TXB_BSN = "";
		String TXB_CD_WL = "";
		String TXB_MJ_WL = "";
		String TXB_CDYSNB = "";
		String TXB_ZDFSQY = "";
		String TXB_LXSQ = "";
		String BFB_MJ = "";
		String BFB_FSJS = "";
		String BFB_BCN = "";
		String BFB_BSN = "";
		String BFB_CD_WL = "";
		String BFB_MJ_WL = "";
		String BFB_CDYSNB = "";
		String BFB_ZDFSQY = "";
		String BFB_LXSQ = "";
		String WKB_MJ = "";
		String WKB_FSJS = "";
		String WKB_BCN = "";
		String WKB_BSN = "";
		String WKB_CD_WL = "";
		String WKB_MJ_WL = "";
		String WKB_CDYSNB = "";
		String WKB_ZDFSQY = "";
		String WKB_LXSQ = "";
		String CMB_MJ = "";
		String CMB_FSJS = "";
		String CMB_BCN = "";
		String CMB_BSN = "";
		String CMB_CD_WL = "";
		String CMB_MJ_WL = "";
		String CMB_CDYSNB = "";
		String CMB_ZDFSQY = "";
		String CMB_LXSQ = "";
		String YXB_MJ = "";
		String YXB_FSJS = "";
		String YXB_BCN = "";
		String YXB_BSN = "";
		String YXB_CD_WL = "";
		String YXB_MJ_WL = "";
		String YXB_CDYSNB = "";
		String YXB_ZDFSQY = "";
		String YXB_LXSQ = "";
		String HSB_MJ = "";
		String HSB_FSJS = "";
		String HSB_BCN = "";
		String HSB_BSN = "";
		String HSB_CD_WL = "";
		String HSB_MJ_WL = "";
		String HSB_CDYSNB = "";
		String HSB_ZDFSQY = "";
		String HSB_LXSQ = "";
		String BBB_MJ = "";
		String BBB_FSJS = "";
		String BBB_BCN = "";
		String BBB_BSN = "";
		String BBB_CD_WL = "";
		String BBB_MJ_WL = "";
		String BBB_CDYSNB = "";
		String BBB_ZDFSQY = "";
		String BBB_LXSQ = "";
		String QSB_MJ = "";
		String QSB_FSJS = "";
		String QSB_BCN = "";
		String QSB_BSN = "";
		String QSB_CD_WL = "";
		String QSB_MJ_WL = "";
		String QSB_CDYSNB = "";
		String QSB_ZDFSQY = "";
		String QSB_LXSQ = "";
		String GFB_MJ = "";
		String GFB_FSJS = "";
		String GFB_BCN = "";
		String GFB_BSN = "";
		String GFB_CD_WL = "";
		String GFB_MJ_WL = "";
		String GFB_CDYSNB = "";
		String GFB_ZDFSQY = "";
		String GFB_LXSQ = "";
		String YKB_MJ = "";
		String YKB_FSJS = "";
		String YKB_BCN = "";
		String YKB_BSN = "";
		String YKB_CD_WL = "";
		String YKB_MJ_WL = "";
		String YKB_CDYSNB = "";
		String YKB_ZDFSQY = "";
		String YKB_LXSQ = "";
		String XCB_MJ = "";
		String XCB_FSJS = "";
		String XCB_BCN = "";
		String XCB_BSN = "";
		String XCB_CD_WL = "";
		String XCB_MJ_WL = "";
		String XCB_CDYSNB = "";
		String XCB_ZDFSQY = "";
		String XCB_LXSQ = "";
		String XFB_MJ = "";
		String XFB_FSJS = "";
		String XFB_BCN = "";
		String XFB_BSN = "";
		String XFB_CD_WL = "";
		String XFB_MJ_WL = "";
		String XFB_CDYSNB = "";
		String XFB_ZDFSQY = "";
		String XFB_LXSQ = "";
		String QTBH_MJ = "";
		String QTBH_FSJS = "";
		String QTBH_BCN = "";
		String QTBH_BSN = "";
		String QTBH_CD_WL = "";
		String QTBH_MJ_WL = "";
		String QTBH_CDYSNB = "";
		String QTBH_ZDFSQY = "";
		String QTBH_LXSQ = "";
		String QTBH_FSZB = "";
		String YC_MJ = "";
		String YC_FSJS = "";
		String YC_BCN = "";
		String YC_BSN = "";
		String YC_CD_WL = "";
		String YC_MJ_WL = "";
		String YC_CDYSNB = "";
		String YC_ZDFSQY = "";
		String YC_LXSQ = "";
		String ZZ_MJ = "";
		String ZZ_FSJS = "";
		String ZZ_BCN = "";
		String ZZ_BSN = "";
		String ZZ_CD_WL = "";
		String ZZ_MJ_WL = "";
		String ZZ_CDYSNB = "";
		String ZZ_ZDFSQY = "";
		String ZZ_LXSQ = "";
		String XJC_MJ = "";
		String XJC_FSJS = "";
		String XJC_BCN = "";
		String XJC_BSN = "";
		String XJC_CD_WL = "";
		String XJC_MJ_WL = "";
		String XJC_CDYSNB = "";
		String XJC_ZDFSQY = "";
		String XJC_LXSQ = "";
		String YDNC_MJ = "";
		String YDNC_FSJS = "";
		String YDNC_BCN = "";
		String YDNC_BSN = "";
		String YDNC_CD_WL = "";
		String YDNC_MJ_WL = "";
		String YDNC_CDYSNB = "";
		String YDNC_ZDFSQY = "";
		String YDNC_LXSQ = "";
		String DXHC_MJ = "";
		String DXHC_FSJS = "";
		String DXHC_BCN = "";
		String DXHC_BSN = "";
		String DXHC_CD_WL = "";
		String DXHC_MJ_WL = "";
		String DXHC_CDYSNB = "";
		String DXHC_ZDFSQY = "";
		String DXHC_LXSQ = "";
		String HFS_MJ = "";
		String HFS_FSJS = "";
		String HFS_BCN = "";
		String HFS_BSN = "";
		String HFS_CD_WL = "";
		String HFS_MJ_WL = "";
		String HFS_CDYSNB = "";
		String HFS_ZDFSQY = "";
		String HFS_LXSQ = "";
		String TH_MJ = "";
		String TH_FSJS = "";
		String TH_BCN = "";
		String TH_BSN = "";
		String TH_CD_WL = "";
		String TH_MJ_WL = "";
		String TH_CDYSNB = "";
		String TH_ZDFSQY = "";
		String TH_LXSQ = "";
		String MYF_MJ = "";
		String MYF_FSJS = "";
		String MYF_BCN = "";
		String MYF_BSN = "";
		String MYF_CD_WL = "";
		String MYF_MJ_WL = "";
		String MYF_CDYSNB = "";
		String MYF_ZDFSQY = "";
		String MYF_LXSQ = "";
		String MJF_MJ = "";
		String MJF_FSJS = "";
		String MJF_BCN = "";
		String MJF_BSN = "";
		String MJF_CD_WL = "";
		String MJF_MJ_WL = "";
		String MJF_CDYSNB = "";
		String MJF_ZDFSQY = "";
		String MJF_LXSQ = "";
		String QTHC_MJ = "";
		String QTHC_FSJS = "";
		String QTHC_BCN = "";
		String QTHC_BSN = "";
		String QTHC_CD_WL = "";
		String QTHC_MJ_WL = "";
		String QTHC_CDYSNB = "";
		String QTHC_ZDFSQY = "";
		String QTHC_FSZB = "";
		String QTHC_LXSQ = "";
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
				String sql = "select * from D007 where jfid=" + jfid;
				pstmtbody = ecbody.con.prepareStatement(sql);
				rsbody = pstmtbody.executeQuery();
				while (rsbody.next()) {
					JFID = rsbody.getString("JFID")==null?"":rsbody.getString("JFID");
					 MD_ZZMJ =rsbody.getString("MD_ZZMJ")==null?"":rsbody.getString("MD_ZZMJ");
					 CM_ZZMJ =rsbody.getString("CM_ZZMJ")==null?"":rsbody.getString("CM_ZZMJ");
					 BZQ =rsbody.getString("BZQ")==null?"":rsbody.getString("BZQ");
					 YLM_MJBL =rsbody.getString("YLM_MJBL")==null?"":rsbody.getString("YLM_MJBL");
					 ELM_MJBL =rsbody.getString("ELM_MJBL")==null?"":rsbody.getString("ELM_MJBL");
					 SLM_MJBL =rsbody.getString("SLM_MJBL")==null?"":rsbody.getString("SLM_MJBL");
					 ZTMQYCNBJ =rsbody.getString("ZTMQYCNBJ")==null?"":rsbody.getString("ZTMQYCNBJ");
					 ZS =rsbody.getString("ZS")==null?"":rsbody.getString("ZS");
					 ZZPZKCX =rsbody.getString("ZZPZKCX")==null?"":rsbody.getString("ZZPZKCX");
					 TXB_MJ =rsbody.getString("TXB_MJ")==null?"":rsbody.getString("TXB_MJ");
					 TXB_FSJS =rsbody.getString("TXB_FSJS")==null?"":rsbody.getString("TXB_FSJS");
					 TXB_BCN =rsbody.getString("TXB_BCN")==null?"":rsbody.getString("TXB_BCN");
					 TXB_BSN =rsbody.getString("TXB_BSN")==null?"":rsbody.getString("TXB_BSN");
					 TXB_CD_WL =rsbody.getString("TXB_CD_WL")==null?"":rsbody.getString("TXB_CD_WL");
					 TXB_MJ_WL =rsbody.getString("TXB_MJ_WL")==null?"":rsbody.getString("TXB_MJ_WL");
					 TXB_CDYSNB =rsbody.getString("TXB_CDYSNB")==null?"":rsbody.getString("TXB_CDYSNB");
					 TXB_ZDFSQY =rsbody.getString("TXB_ZDFSQY")==null?"":rsbody.getString("TXB_ZDFSQY");
					 TXB_LXSQ =rsbody.getString("TXB_LXSQ")==null?"":rsbody.getString("TXB_LXSQ");
					 BFB_MJ =rsbody.getString("BFB_MJ")==null?"":rsbody.getString("BFB_MJ");
					 BFB_FSJS =rsbody.getString("BFB_FSJS")==null?"":rsbody.getString("BFB_FSJS");
					 BFB_BCN =rsbody.getString("BFB_BCN")==null?"":rsbody.getString("BFB_BCN");
					 BFB_BSN =rsbody.getString("BFB_BSN")==null?"":rsbody.getString("BFB_BSN");
					 BFB_CD_WL =rsbody.getString("BFB_CD_WL")==null?"":rsbody.getString("BFB_CD_WL");
					 BFB_MJ_WL =rsbody.getString("BFB_MJ_WL")==null?"":rsbody.getString("BFB_MJ_WL");
					 BFB_CDYSNB =rsbody.getString("BFB_CDYSNB")==null?"":rsbody.getString("BFB_CDYSNB");
					 BFB_ZDFSQY =rsbody.getString("BFB_ZDFSQY")==null?"":rsbody.getString("BFB_ZDFSQY");
					 BFB_LXSQ =rsbody.getString("BFB_LXSQ")==null?"":rsbody.getString("BFB_LXSQ");
					 WKB_MJ =rsbody.getString("WKB_MJ")==null?"":rsbody.getString("WKB_MJ");
					 WKB_FSJS =rsbody.getString("WKB_FSJS")==null?"":rsbody.getString("WKB_FSJS");
					 WKB_BCN =rsbody.getString("WKB_BCN")==null?"":rsbody.getString("WKB_BCN");
					 WKB_BSN =rsbody.getString("WKB_BSN")==null?"":rsbody.getString("WKB_BSN");
					 WKB_CD_WL =rsbody.getString("WKB_CD_WL")==null?"":rsbody.getString("WKB_CD_WL");
					 WKB_MJ_WL =rsbody.getString("WKB_MJ_WL")==null?"":rsbody.getString("WKB_MJ_WL");
					 WKB_CDYSNB =rsbody.getString("WKB_CDYSNB")==null?"":rsbody.getString("WKB_CDYSNB");
					 WKB_ZDFSQY =rsbody.getString("WKB_ZDFSQY")==null?"":rsbody.getString("WKB_ZDFSQY");
					 WKB_LXSQ =rsbody.getString("WKB_LXSQ")==null?"":rsbody.getString("WKB_LXSQ");
					 CMB_MJ =rsbody.getString("CMB_MJ")==null?"":rsbody.getString("CMB_MJ");
					 CMB_FSJS =rsbody.getString("CMB_FSJS")==null?"":rsbody.getString("CMB_FSJS");
					 CMB_BCN =rsbody.getString("CMB_BCN")==null?"":rsbody.getString("CMB_BCN");
					 CMB_BSN =rsbody.getString("CMB_BSN")==null?"":rsbody.getString("CMB_BSN");
					 CMB_CD_WL =rsbody.getString("CMB_CD_WL")==null?"":rsbody.getString("CMB_CD_WL");
					 CMB_MJ_WL =rsbody.getString("CMB_MJ_WL")==null?"":rsbody.getString("CMB_MJ_WL");
					 CMB_CDYSNB =rsbody.getString("CMB_CDYSNB")==null?"":rsbody.getString("CMB_CDYSNB");
					 CMB_ZDFSQY =rsbody.getString("CMB_ZDFSQY")==null?"":rsbody.getString("CMB_ZDFSQY");
					 CMB_LXSQ =rsbody.getString("CMB_LXSQ")==null?"":rsbody.getString("CMB_LXSQ");
					 YXB_MJ =rsbody.getString("YXB_MJ")==null?"":rsbody.getString("YXB_MJ");
					 YXB_FSJS =rsbody.getString("YXB_FSJS")==null?"":rsbody.getString("YXB_FSJS");
					 YXB_BCN =rsbody.getString("YXB_BCN")==null?"":rsbody.getString("YXB_BCN");
					 YXB_BSN =rsbody.getString("YXB_BSN")==null?"":rsbody.getString("YXB_BSN");
					 YXB_CD_WL =rsbody.getString("YXB_CD_WL")==null?"":rsbody.getString("YXB_CD_WL");
					 YXB_MJ_WL =rsbody.getString("YXB_MJ_WL")==null?"":rsbody.getString("YXB_MJ_WL");
					 YXB_CDYSNB =rsbody.getString("YXB_CDYSNB")==null?"":rsbody.getString("YXB_CDYSNB");
					 YXB_ZDFSQY =rsbody.getString("YXB_ZDFSQY")==null?"":rsbody.getString("YXB_ZDFSQY");
					 YXB_LXSQ =rsbody.getString("YXB_LXSQ")==null?"":rsbody.getString("YXB_LXSQ");
					 HSB_MJ =rsbody.getString("HSB_MJ")==null?"":rsbody.getString("HSB_MJ");
					 HSB_FSJS =rsbody.getString("HSB_FSJS")==null?"":rsbody.getString("HSB_FSJS");
					 HSB_BCN =rsbody.getString("HSB_BCN")==null?"":rsbody.getString("HSB_BCN");
					 HSB_BSN =rsbody.getString("HSB_BSN")==null?"":rsbody.getString("HSB_BSN");
					 HSB_CD_WL =rsbody.getString("HSB_CD_WL")==null?"":rsbody.getString("HSB_CD_WL");
					 HSB_MJ_WL =rsbody.getString("HSB_MJ_WL")==null?"":rsbody.getString("HSB_MJ_WL");
					 HSB_CDYSNB =rsbody.getString("HSB_CDYSNB")==null?"":rsbody.getString("HSB_CDYSNB");
					 HSB_ZDFSQY =rsbody.getString("HSB_ZDFSQY")==null?"":rsbody.getString("HSB_ZDFSQY");
					 HSB_LXSQ =rsbody.getString("HSB_LXSQ")==null?"":rsbody.getString("HSB_LXSQ");
					 BBB_MJ =rsbody.getString("BBB_MJ")==null?"":rsbody.getString("BBB_MJ");
					 BBB_FSJS =rsbody.getString("BBB_FSJS")==null?"":rsbody.getString("BBB_FSJS");
					 BBB_BCN =rsbody.getString("BBB_BCN")==null?"":rsbody.getString("BBB_BCN");
					 BBB_BSN =rsbody.getString("BBB_BSN")==null?"":rsbody.getString("BBB_BSN");
					 BBB_CD_WL =rsbody.getString("BBB_CD_WL")==null?"":rsbody.getString("BBB_CD_WL");
					 BBB_MJ_WL =rsbody.getString("BBB_MJ_WL")==null?"":rsbody.getString("BBB_MJ_WL");
					 BBB_CDYSNB =rsbody.getString("BBB_CDYSNB")==null?"":rsbody.getString("BBB_CDYSNB");
					 BBB_ZDFSQY =rsbody.getString("BBB_ZDFSQY")==null?"":rsbody.getString("BBB_ZDFSQY");
					 BBB_LXSQ =rsbody.getString("BBB_LXSQ")==null?"":rsbody.getString("BBB_LXSQ");
					 QSB_MJ =rsbody.getString("QSB_MJ")==null?"":rsbody.getString("QSB_MJ");
					 QSB_FSJS =rsbody.getString("QSB_FSJS")==null?"":rsbody.getString("QSB_FSJS");
					 QSB_BCN =rsbody.getString("QSB_BCN")==null?"":rsbody.getString("QSB_BCN");
					 QSB_BSN =rsbody.getString("QSB_BSN")==null?"":rsbody.getString("QSB_BSN");
					 QSB_CD_WL =rsbody.getString("QSB_CD_WL")==null?"":rsbody.getString("QSB_CD_WL");
					 QSB_MJ_WL =rsbody.getString("QSB_MJ_WL")==null?"":rsbody.getString("QSB_MJ_WL");
					 QSB_CDYSNB =rsbody.getString("QSB_CDYSNB")==null?"":rsbody.getString("QSB_CDYSNB");
					 QSB_ZDFSQY =rsbody.getString("QSB_ZDFSQY")==null?"":rsbody.getString("QSB_ZDFSQY");
					 QSB_LXSQ =rsbody.getString("QSB_LXSQ")==null?"":rsbody.getString("QSB_LXSQ");
					 GFB_MJ =rsbody.getString("GFB_MJ")==null?"":rsbody.getString("GFB_MJ");
					 GFB_FSJS =rsbody.getString("GFB_FSJS")==null?"":rsbody.getString("GFB_FSJS");
					 GFB_BCN =rsbody.getString("GFB_BCN")==null?"":rsbody.getString("GFB_BCN");
					 GFB_BSN =rsbody.getString("GFB_BSN")==null?"":rsbody.getString("GFB_BSN");
					 GFB_CD_WL =rsbody.getString("GFB_CD_WL")==null?"":rsbody.getString("GFB_CD_WL");
					 GFB_MJ_WL =rsbody.getString("GFB_MJ_WL")==null?"":rsbody.getString("GFB_MJ_WL");
					 GFB_CDYSNB =rsbody.getString("GFB_CDYSNB")==null?"":rsbody.getString("GFB_CDYSNB");
					 GFB_ZDFSQY =rsbody.getString("GFB_ZDFSQY")==null?"":rsbody.getString("GFB_ZDFSQY");
					 GFB_LXSQ =rsbody.getString("GFB_LXSQ")==null?"":rsbody.getString("GFB_LXSQ");
					 YKB_MJ =rsbody.getString("YKB_MJ")==null?"":rsbody.getString("YKB_MJ");
					 YKB_FSJS =rsbody.getString("YKB_FSJS")==null?"":rsbody.getString("YKB_FSJS");
					 YKB_BCN =rsbody.getString("YKB_BCN")==null?"":rsbody.getString("YKB_BCN");
					 YKB_BSN =rsbody.getString("YKB_BSN")==null?"":rsbody.getString("YKB_BSN");
					 YKB_CD_WL =rsbody.getString("YKB_CD_WL")==null?"":rsbody.getString("YKB_CD_WL");
					 YKB_MJ_WL =rsbody.getString("YKB_MJ_WL")==null?"":rsbody.getString("YKB_MJ_WL");
					 YKB_CDYSNB =rsbody.getString("YKB_CDYSNB")==null?"":rsbody.getString("YKB_CDYSNB");
					 YKB_ZDFSQY =rsbody.getString("YKB_ZDFSQY")==null?"":rsbody.getString("YKB_ZDFSQY");
					 YKB_LXSQ =rsbody.getString("YKB_LXSQ")==null?"":rsbody.getString("YKB_LXSQ");
					 XCB_MJ =rsbody.getString("XCB_MJ")==null?"":rsbody.getString("XCB_MJ");
					 XCB_FSJS =rsbody.getString("XCB_FSJS")==null?"":rsbody.getString("XCB_FSJS");
					 XCB_BCN =rsbody.getString("XCB_BCN")==null?"":rsbody.getString("XCB_BCN");
					 XCB_BSN =rsbody.getString("XCB_BSN")==null?"":rsbody.getString("XCB_BSN");
					 XCB_CD_WL =rsbody.getString("XCB_CD_WL")==null?"":rsbody.getString("XCB_CD_WL");
					 XCB_MJ_WL =rsbody.getString("XCB_MJ_WL")==null?"":rsbody.getString("XCB_MJ_WL");
					 XCB_CDYSNB =rsbody.getString("XCB_CDYSNB")==null?"":rsbody.getString("XCB_CDYSNB");
					 XCB_ZDFSQY =rsbody.getString("XCB_ZDFSQY")==null?"":rsbody.getString("XCB_ZDFSQY");
					 XCB_LXSQ =rsbody.getString("XCB_LXSQ")==null?"":rsbody.getString("XCB_LXSQ");
					 XFB_MJ =rsbody.getString("XFB_MJ")==null?"":rsbody.getString("XFB_MJ");
					 XFB_FSJS =rsbody.getString("XFB_FSJS")==null?"":rsbody.getString("XFB_FSJS");
					 XFB_BCN =rsbody.getString("XFB_BCN")==null?"":rsbody.getString("XFB_BCN");
					 XFB_BSN =rsbody.getString("XFB_BSN")==null?"":rsbody.getString("XFB_BSN");
					 XFB_CD_WL =rsbody.getString("XFB_CD_WL")==null?"":rsbody.getString("XFB_CD_WL");
					 XFB_MJ_WL =rsbody.getString("XFB_MJ_WL")==null?"":rsbody.getString("XFB_MJ_WL");
					 XFB_CDYSNB =rsbody.getString("XFB_CDYSNB")==null?"":rsbody.getString("XFB_CDYSNB");
					 XFB_ZDFSQY =rsbody.getString("XFB_ZDFSQY")==null?"":rsbody.getString("XFB_ZDFSQY");
					 XFB_LXSQ =rsbody.getString("XFB_LXSQ")==null?"":rsbody.getString("XFB_LXSQ");
					 QTBH_MJ =rsbody.getString("QTBH_MJ")==null?"":rsbody.getString("QTBH_MJ");
					 QTBH_FSJS =rsbody.getString("QTBH_FSJS")==null?"":rsbody.getString("QTBH_FSJS");
					 QTBH_BCN =rsbody.getString("QTBH_BCN")==null?"":rsbody.getString("QTBH_BCN");
					 QTBH_BSN =rsbody.getString("QTBH_BSN")==null?"":rsbody.getString("QTBH_BSN");
					 QTBH_CD_WL =rsbody.getString("QTBH_CD_WL")==null?"":rsbody.getString("QTBH_CD_WL");
					 QTBH_MJ_WL =rsbody.getString("QTBH_MJ_WL")==null?"":rsbody.getString("QTBH_MJ_WL");
					 QTBH_CDYSNB =rsbody.getString("QTBH_CDYSNB")==null?"":rsbody.getString("QTBH_CDYSNB");
					 QTBH_ZDFSQY =rsbody.getString("QTBH_ZDFSQY")==null?"":rsbody.getString("QTBH_ZDFSQY");
					 QTBH_LXSQ =rsbody.getString("QTBH_LXSQ")==null?"":rsbody.getString("QTBH_LXSQ");
					 QTBH_FSZB =rsbody.getString("QTBH_FSZB")==null?"":rsbody.getString("QTBH_FSZB");
					 YC_MJ =rsbody.getString("YC_MJ")==null?"":rsbody.getString("YC_MJ");
					 YC_FSJS =rsbody.getString("YC_FSJS")==null?"":rsbody.getString("YC_FSJS");
					 YC_BCN =rsbody.getString("YC_BCN")==null?"":rsbody.getString("YC_BCN");
					 YC_BSN =rsbody.getString("YC_BSN")==null?"":rsbody.getString("YC_BSN");
					 YC_CD_WL =rsbody.getString("YC_CD_WL")==null?"":rsbody.getString("YC_CD_WL");
					 YC_MJ_WL =rsbody.getString("YC_MJ_WL")==null?"":rsbody.getString("YC_MJ_WL");
					 YC_CDYSNB =rsbody.getString("YC_CDYSNB")==null?"":rsbody.getString("YC_CDYSNB");
					 YC_ZDFSQY =rsbody.getString("YC_ZDFSQY")==null?"":rsbody.getString("YC_ZDFSQY");
					 YC_LXSQ =rsbody.getString("YC_LXSQ")==null?"":rsbody.getString("YC_LXSQ");
					 ZZ_MJ =rsbody.getString("ZZ_MJ")==null?"":rsbody.getString("ZZ_MJ");
					 ZZ_FSJS =rsbody.getString("ZZ_FSJS")==null?"":rsbody.getString("ZZ_FSJS");
					 ZZ_BCN =rsbody.getString("ZZ_BCN")==null?"":rsbody.getString("ZZ_BCN");
					 ZZ_BSN =rsbody.getString("ZZ_BSN")==null?"":rsbody.getString("ZZ_BSN");
					 ZZ_CD_WL =rsbody.getString("ZZ_CD_WL")==null?"":rsbody.getString("ZZ_CD_WL");
					 ZZ_MJ_WL =rsbody.getString("ZZ_MJ_WL")==null?"":rsbody.getString("ZZ_MJ_WL");
					 ZZ_CDYSNB =rsbody.getString("ZZ_CDYSNB")==null?"":rsbody.getString("ZZ_CDYSNB");
					 ZZ_ZDFSQY =rsbody.getString("ZZ_ZDFSQY")==null?"":rsbody.getString("ZZ_ZDFSQY");
					 ZZ_LXSQ =rsbody.getString("ZZ_LXSQ")==null?"":rsbody.getString("ZZ_LXSQ");
					 XJC_MJ =rsbody.getString("XJC_MJ")==null?"":rsbody.getString("XJC_MJ");
					 XJC_FSJS =rsbody.getString("XJC_FSJS")==null?"":rsbody.getString("XJC_FSJS");
					 XJC_BCN =rsbody.getString("XJC_BCN")==null?"":rsbody.getString("XJC_BCN");
					 XJC_BSN =rsbody.getString("XJC_BSN")==null?"":rsbody.getString("XJC_BSN");
					 XJC_CD_WL =rsbody.getString("XJC_CD_WL")==null?"":rsbody.getString("XJC_CD_WL");
					 XJC_MJ_WL =rsbody.getString("XJC_MJ_WL")==null?"":rsbody.getString("XJC_MJ_WL");
					 XJC_CDYSNB =rsbody.getString("XJC_CDYSNB")==null?"":rsbody.getString("XJC_CDYSNB");
					 XJC_ZDFSQY =rsbody.getString("XJC_ZDFSQY")==null?"":rsbody.getString("XJC_ZDFSQY");
					 XJC_LXSQ =rsbody.getString("XJC_LXSQ")==null?"":rsbody.getString("XJC_LXSQ");
					 YDNC_MJ =rsbody.getString("YDNC_MJ")==null?"":rsbody.getString("YDNC_MJ");
					 YDNC_FSJS =rsbody.getString("YDNC_FSJS")==null?"":rsbody.getString("YDNC_FSJS");
					 YDNC_BCN =rsbody.getString("YDNC_BCN")==null?"":rsbody.getString("YDNC_BCN");
					 YDNC_BSN =rsbody.getString("YDNC_BSN")==null?"":rsbody.getString("YDNC_BSN");
					 YDNC_CD_WL =rsbody.getString("YDNC_CD_WL")==null?"":rsbody.getString("YDNC_CD_WL");
					 YDNC_MJ_WL =rsbody.getString("YDNC_MJ_WL")==null?"":rsbody.getString("YDNC_MJ_WL");
					 YDNC_CDYSNB =rsbody.getString("YDNC_CDYSNB")==null?"":rsbody.getString("YDNC_CDYSNB");
					 YDNC_ZDFSQY =rsbody.getString("YDNC_ZDFSQY")==null?"":rsbody.getString("YDNC_ZDFSQY");
					 YDNC_LXSQ =rsbody.getString("YDNC_LXSQ")==null?"":rsbody.getString("YDNC_LXSQ");
					 DXHC_MJ =rsbody.getString("DXHC_MJ")==null?"":rsbody.getString("DXHC_MJ");
					 DXHC_FSJS =rsbody.getString("DXHC_FSJS")==null?"":rsbody.getString("DXHC_FSJS");
					 DXHC_BCN =rsbody.getString("DXHC_BCN")==null?"":rsbody.getString("DXHC_BCN");
					 DXHC_BSN =rsbody.getString("DXHC_BSN")==null?"":rsbody.getString("DXHC_BSN");
					 DXHC_CD_WL =rsbody.getString("DXHC_CD_WL")==null?"":rsbody.getString("DXHC_CD_WL");
					 DXHC_MJ_WL =rsbody.getString("DXHC_MJ_WL")==null?"":rsbody.getString("DXHC_MJ_WL");
					 DXHC_CDYSNB =rsbody.getString("DXHC_CDYSNB")==null?"":rsbody.getString("DXHC_CDYSNB");
					 DXHC_ZDFSQY =rsbody.getString("DXHC_ZDFSQY")==null?"":rsbody.getString("DXHC_ZDFSQY");
					 DXHC_LXSQ =rsbody.getString("DXHC_LXSQ")==null?"":rsbody.getString("DXHC_LXSQ");
					 HFS_MJ =rsbody.getString("HFS_MJ")==null?"":rsbody.getString("HFS_MJ");
					 HFS_FSJS =rsbody.getString("HFS_FSJS")==null?"":rsbody.getString("HFS_FSJS");
					 HFS_BCN =rsbody.getString("HFS_BCN")==null?"":rsbody.getString("HFS_BCN");
					 HFS_BSN =rsbody.getString("HFS_BSN")==null?"":rsbody.getString("HFS_BSN");
					 HFS_CD_WL =rsbody.getString("HFS_CD_WL")==null?"":rsbody.getString("HFS_CD_WL");
					 HFS_MJ_WL =rsbody.getString("HFS_MJ_WL")==null?"":rsbody.getString("HFS_MJ_WL");
					 HFS_CDYSNB =rsbody.getString("HFS_CDYSNB")==null?"":rsbody.getString("HFS_CDYSNB");
					 HFS_ZDFSQY =rsbody.getString("HFS_ZDFSQY")==null?"":rsbody.getString("HFS_ZDFSQY");
					 HFS_LXSQ =rsbody.getString("HFS_LXSQ")==null?"":rsbody.getString("HFS_LXSQ");
					 TH_MJ =rsbody.getString("TH_MJ")==null?"":rsbody.getString("TH_MJ");
					 TH_FSJS =rsbody.getString("TH_FSJS")==null?"":rsbody.getString("TH_FSJS");
					 TH_BCN =rsbody.getString("TH_BCN")==null?"":rsbody.getString("TH_BCN");
					 TH_BSN =rsbody.getString("TH_BSN")==null?"":rsbody.getString("TH_BSN");
					 TH_CD_WL =rsbody.getString("TH_CD_WL")==null?"":rsbody.getString("TH_CD_WL");
					 TH_MJ_WL =rsbody.getString("TH_MJ_WL")==null?"":rsbody.getString("TH_MJ_WL");
					 TH_CDYSNB =rsbody.getString("TH_CDYSNB")==null?"":rsbody.getString("TH_CDYSNB");
					 TH_ZDFSQY =rsbody.getString("TH_ZDFSQY")==null?"":rsbody.getString("TH_ZDFSQY");
					 TH_LXSQ =rsbody.getString("TH_LXSQ")==null?"":rsbody.getString("TH_LXSQ");
					 MYF_MJ =rsbody.getString("MYF_MJ")==null?"":rsbody.getString("MYF_MJ");
					 MYF_FSJS =rsbody.getString("MYF_FSJS")==null?"":rsbody.getString("MYF_FSJS");
					 MYF_BCN =rsbody.getString("MYF_BCN")==null?"":rsbody.getString("MYF_BCN");
					 MYF_BSN =rsbody.getString("MYF_BSN")==null?"":rsbody.getString("MYF_BSN");
					 MYF_CD_WL =rsbody.getString("MYF_CD_WL")==null?"":rsbody.getString("MYF_CD_WL");
					 MYF_MJ_WL =rsbody.getString("MYF_MJ_WL")==null?"":rsbody.getString("MYF_MJ_WL");
					 MYF_CDYSNB =rsbody.getString("MYF_CDYSNB")==null?"":rsbody.getString("MYF_CDYSNB");
					 MYF_ZDFSQY =rsbody.getString("MYF_ZDFSQY")==null?"":rsbody.getString("MYF_ZDFSQY");
					 MYF_LXSQ =rsbody.getString("MYF_LXSQ")==null?"":rsbody.getString("MYF_LXSQ");
					 MJF_MJ =rsbody.getString("MJF_MJ")==null?"":rsbody.getString("MJF_MJ");
					 MJF_FSJS =rsbody.getString("MJF_FSJS")==null?"":rsbody.getString("MJF_FSJS");
					 MJF_BCN =rsbody.getString("MJF_BCN")==null?"":rsbody.getString("MJF_BCN");
					 MJF_BSN =rsbody.getString("MJF_BSN")==null?"":rsbody.getString("MJF_BSN");
					 MJF_CD_WL =rsbody.getString("MJF_CD_WL")==null?"":rsbody.getString("MJF_CD_WL");
					 MJF_MJ_WL =rsbody.getString("MJF_MJ_WL")==null?"":rsbody.getString("MJF_MJ_WL");
					 MJF_CDYSNB =rsbody.getString("MJF_CDYSNB")==null?"":rsbody.getString("MJF_CDYSNB");
					 MJF_ZDFSQY =rsbody.getString("MJF_ZDFSQY")==null?"":rsbody.getString("MJF_ZDFSQY");
					 MJF_LXSQ =rsbody.getString("MJF_LXSQ")==null?"":rsbody.getString("MJF_LXSQ");
					 QTHC_MJ =rsbody.getString("QTHC_MJ")==null?"":rsbody.getString("QTHC_MJ");
					 QTHC_FSJS =rsbody.getString("QTHC_FSJS")==null?"":rsbody.getString("QTHC_FSJS");
					 QTHC_BCN =rsbody.getString("QTHC_BCN")==null?"":rsbody.getString("QTHC_BCN");
					 QTHC_BSN =rsbody.getString("QTHC_BSN")==null?"":rsbody.getString("QTHC_BSN");
					 QTHC_CD_WL =rsbody.getString("QTHC_CD_WL")==null?"":rsbody.getString("QTHC_CD_WL");
					 QTHC_MJ_WL =rsbody.getString("QTHC_MJ_WL")==null?"":rsbody.getString("QTHC_MJ_WL");
					 QTHC_CDYSNB =rsbody.getString("QTHC_CDYSNB")==null?"":rsbody.getString("QTHC_CDYSNB");
					 QTHC_ZDFSQY =rsbody.getString("QTHC_ZDFSQY")==null?"":rsbody.getString("QTHC_ZDFSQY");
					 QTHC_LXSQ =rsbody.getString("QTHC_LXSQ")==null?"":rsbody.getString("QTHC_LXSQ");
					 QTHC_FSZB =rsbody.getString("QTHC_FSZB")==null?"":rsbody.getString("QTHC_FSZB");
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
					style="text-align:center;font-size=30;width: ;height: "><b>С�󲡳溦���������Ԥ��������Ԥ����ͳ�Ʊ�(<%=rwsj%>)
				</b><br> <br></td>
			</tr>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">�ⱨվ�㣺<%=usebmmc%><input
					name="BMBM" type="hidden" value="<%=usebm%>" /></td>
				<td style="padding-left: 100px;padding-right: 100px;">����ʱ�䣺<input
					type="text" id="DCRQ" name="DCRQ"
					style="width:80;height: ;font-size:12" value="<%=DCRQ%>"
					class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})" /></td>
				<td style="padding-left: 100px;padding-right: 100px;">��λ����Ķ</td>
			</tr>
		</table>
		<table border=1 borderColorDark=black borderColorLight=white
			cellpadding=1 cellspacing=1 align=center id=zg name=zg>
			<tbody id="zg_head">
				<tr>
					<td colspan=2 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>������ֲ�������Ķ��</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>������ֲ�������Ķ��</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>������</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>һ�����������(%)</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�������������(%)</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�������������(%)</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>���������볣��Ƚ�</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>����</b></td>
					<td colspan=2 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>����Ʒ�ֿ�������</b></td>
				</tr>
				<tr>
				<td colspan=2 rowspan=1><input style="width: 100%;" name="MD_ZZMJ" type="text"
						value="<%=MD_ZZMJ%>" alertname="������ֲ�������Ϊ����" datatype="number"/></td>
				<td><input style="width: 100%;" name="CM_ZZMJ" type="text"
						value="<%=CM_ZZMJ%>" alertname="������ֲ�������Ϊ����" datatype="number"/></td>
				<td><input style="width: 100%;" name="BZQ" type="text"value="<%=BZQ%>"/></td>
				<td><input style="width: 100%;" name="YLM_MJBL" type="text"
						value="<%=YLM_MJBL%>" alertname="һ����������ʱ���Ϊ����" datatype="number"/></td>
				<td><input style="width: 100%;" name="ELM_MJBL" type="text"
						value="<%=ELM_MJBL%>" alertname="������������ʱ���Ϊ����" datatype="number"/></td>
				<td><input style="width: 100%;" name="SLM_MJBL" type="text"
						value="<%=SLM_MJBL%>" alertname="������������ʱ���Ϊ����" datatype="number"/></td>
				<td><input style="width: 100%;" name="ZTMQYCNBJ" type="text"
						value="<%=ZTMQYCNBJ%>"/></td>
				<td><input style="width: 100%;" name="ZS" type="text"
						value="<%=ZS%>"/></td>
				<td colspan=2 rowspan=1><input style="width: 100%;" name="ZZPZKCX" type="text"
						value="<%=ZZPZKCX%>"/></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��������</b></td>
					<td colspan=5 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��ǰ�������</b></td>
					<td colspan=5 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>δ������</b></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>���</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>����ָ��</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��������</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�ȳ����%</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�������%</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�̶�</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>���</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�̶�������ȡ�</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�ص㷢������</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>����ʢ��</b></td>
				</tr>
			</tbody>
			<tbody id="zg_body">
				<tr>
					<td colspan=1 rowspan=2 style="text-align: center;">���ⲡ</td>
					<td colspan=1 rowspan=2><input style="width: 100%;" name="TXB_MJ" type="text"
						value="<%=TXB_MJ%>" alertname="���ⲡ�������Ϊ����" datatype="number" /></td>
					<td colspan=1 rowspan=1 style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td colspan=1 rowspan=1><input style="width: 100%;" name="TXB_FSJS" type="text"
						value="<%=TXB_FSJS%>" alertname="���ⲡ������������Ϊ����" datatype="number" /></td>
					<td colspan=1 rowspan=1><input style="width: 100%;" name="TXB_BCN" type="text"
						value="<%=TXB_BCN%>" alertname="���ⲡ�ȳ����%����Ϊ����" datatype="number" /></td>
					<td colspan=1 rowspan=1><input style="width: 100%;" name="TXB_BSN" type="text"
						value="<%=TXB_BSN%>" alertname="���ⲡ�������%����Ϊ����" datatype="number" /></td>
					<td colspan=1 rowspan=2><select name="TXB_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td colspan=1 rowspan=2><input style="width: 100%;" name="TXB_MJ_WL" type="text"
						value="<%=TXB_MJ_WL%>" alertname="���ⲡδ���������Ϊ����" datatype="number" /></td>
					<td colspan=1 rowspan=2><input style="width: 100%;" name="TXB_CDYSNB" type="text"
						value="<%=TXB_CDYSNB%>" alertname="���ⲡδ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td colspan=1 rowspan=2><input style="width: 100%;" name="TXB_ZDFSQY" type="text"
						value="<%=TXB_ZDFSQY%>"/></td>
					<td colspan=1 rowspan=2><input style="width: 100%;" name="TXB_LXSQ" type="text"
						value="<%=TXB_LXSQ%>"/></td>
				</tr>
				<tr>
				   <td colspan=1 rowspan=1 style="text-align: center;">�����С���</td>
				</tr>
				<tr>
					<td style="text-align: center;">�׷۲�</td>
					<td><input style="width: 100%;" name="BFB_MJ" type="text"
						value="<%=BFB_MJ%>" alertname="�׷۲��������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><input style="width: 100%;" name="BFB_FSJS" type="text"
						value="<%=BFB_FSJS%>" alertname="�׷۲�������������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="BFB_BCN" type="text"
						value="<%=BFB_BCN%>" alertname="�׷۲��ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="BFB_BSN" type="text"
						value="<%=BFB_BSN%>" alertname="�׷۲��������%����Ϊ����" datatype="number" /></td>
					<td><select name="BFB_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="BFB_MJ_WL" type="text"
						value="<%=BFB_MJ_WL%>" alertname="�׷۲�δ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="BFB_CDYSNB" type="text"
						value="<%=BFB_CDYSNB%>" alertname="�׷۲�δ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="BFB_ZDFSQY" type="text"
						value="<%=BFB_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="BFB_LXSQ" type="text"
						value="<%=BFB_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">�ƿݲ�</td>
					<td><input style="width: 100%;" name="WKB_MJ" type="text"
						value="<%=WKB_MJ%>" alertname="�ƿݲ��������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><input style="width: 100%;" name="WKB_FSJS" type="text"
						value="<%=WKB_FSJS%>" alertname="�ƿݲ�������������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="WKB_BCN" type="text"
						value="<%=WKB_BCN%>" alertname="�ƿݲ��ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="WKB_BSN" type="text"
						value="<%=WKB_BSN%>" alertname="�ƿݲ��������%����Ϊ����" datatype="number" /></td>
					<td><select name="WKB_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="WKB_MJ_WL" type="text"
						value="<%=WKB_MJ_WL%>" alertname="�ƿݲ�δ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="WKB_CDYSNB" type="text"
						value="<%=WKB_CDYSNB%>" alertname="�ƿݲ�δ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="WKB_ZDFSQY" type="text"
						value="<%=WKB_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="WKB_LXSQ" type="text"
						value="<%=WKB_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">��ù��</td>
					<td><input style="width: 100%;" name="CMB_MJ" type="text"
						value="<%=CMB_MJ%>" alertname="��ù���������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><input style="width: 100%;" name="CMB_FSJS" type="text"
						value="<%=CMB_FSJS%>" alertname="��ù��������������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="CMB_BCN" type="text"
						value="<%=CMB_BCN%>" alertname="��ù���ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="CMB_BSN" type="text"
						value="<%=CMB_BSN%>" alertname="��ù���������%����Ϊ����" datatype="number" /></td>
					<td style="text-align: center;"><select name="CMB_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="CMB_MJ_WL" type="text"
						value="<%=CMB_MJ_WL%>" alertname="��ù��δ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="CMB_CDYSNB" type="text"
						value="<%=CMB_CDYSNB%>" alertname="��ù��δ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="CMB_ZDFSQY" type="text"
						value="<%=CMB_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="CMB_LXSQ" type="text"
						value="<%=CMB_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">Ҷ�ⲡ</td>
					<td><input style="width: 100%;" name="YXB_MJ" type="text"
						value="<%=YXB_MJ%>" alertname="Ҷ�ⲡ�������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><input style="width: 100%;" name="YXB_FSJS" type="text"
						value="<%=YXB_FSJS%>" alertname="Ҷ�ⲡ������������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="YXB_BCN" type="text"
						value="<%=YXB_BCN%>" alertname="Ҷ�ⲡ�ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="YXB_BSN" type="text"
						value="<%=YXB_BSN%>" alertname="Ҷ�ⲡ�������%����Ϊ����" datatype="number" /></td>
					<td><select name="YXB_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="YXB_MJ_WL" type="text"
						value="<%=YXB_MJ_WL%>" alertname="Ҷ�ⲡδ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="YXB_CDYSNB" type="text"
						value="<%=YXB_CDYSNB%>" alertname="Ҷ�ⲡδ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="YXB_ZDFSQY" type="text"
						value="<%=YXB_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="YXB_LXSQ" type="text"
						value="<%=YXB_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">���벡</td>
					<td><input style="width: 100%;" name="HSB_MJ" type="text"
						value="<%=HSB_MJ%>" alertname="���벡�������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><input style="width: 100%;" name="HSB_FSJS" type="text"
						value="<%=HSB_FSJS%>" alertname="���벡������������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="HSB_BCN" type="text"
						value="<%=HSB_BCN%>" alertname="���벡�ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="HSB_BSN" type="text"
						value="<%=HSB_BSN%>" alertname="���벡�������%����Ϊ����" datatype="number" /></td>
					<td><select name="HSB_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="HSB_MJ_WL" type="text"
						value="<%=HSB_MJ_WL%>" alertname="���벡δ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="HSB_CDYSNB" type="text"
						value="<%=HSB_CDYSNB%>" alertname="���벡δ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="HSB_ZDFSQY" type="text"
						value="<%=HSB_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="HSB_LXSQ" type="text"
						value="<%=HSB_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">������</td>
					<td><input style="width: 100%;" name="BBB_MJ" type="text"
						value="<%=BBB_MJ%>" alertname="�������������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><input style="width: 100%;" name="BBB_FSJS" type="text"
						value="<%=BBB_FSJS%>" alertname="������������������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="BBB_BCN" type="text"
						value="<%=BBB_BCN%>" alertname="�������ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="BBB_BSN" type="text"
						value="<%=BBB_BSN%>" alertname="�������������%����Ϊ����" datatype="number" /></td>
					<td><select name="BBB_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="BBB_MJ_WL" type="text"
						value="<%=BBB_MJ_WL%>" alertname="������δ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="BBB_CDYSNB" type="text"
						value="<%=BBB_CDYSNB%>" alertname="������δ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="BBB_ZDFSQY" type="text"
						value="<%=BBB_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="BBB_LXSQ" type="text"
						value="<%=BBB_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">ȫʴ��</td>
					<td><input style="width: 100%;" name="QSB_MJ" type="text"
						value="<%=QSB_MJ%>" alertname="ȫʴ���������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><input style="width: 100%;" name="QSB_FSJS" type="text"
						value="<%=QSB_FSJS%>" alertname="ȫʴ��������������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="QSB_BCN" type="text"
						value="<%=QSB_BCN%>" alertname="ȫʴ���ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="QSB_BSN" type="text"
						value="<%=QSB_BSN%>" alertname="ȫʴ���������%����Ϊ����" datatype="number" /></td>
					<td style="text-align: center;"><select name="QSB_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="QSB_MJ_WL" type="text"
						value="<%=QSB_MJ_WL%>" alertname="ȫʴ��δ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="QSB_CDYSNB" type="text"
						value="<%=QSB_CDYSNB%>" alertname="ȫʴ��δ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="QSB_ZDFSQY" type="text"
						value="<%=QSB_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="QSB_LXSQ" type="text"
						value="<%=QSB_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">������</td>
					<td><input style="width: 100%;" name="GFB_MJ" type="text"
						value="<%=GFB_MJ%>" alertname="�������������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><input style="width: 100%;" name="GFB_FSJS" type="text"
						value="<%=GFB_FSJS%>" alertname="������������������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="GFB_BCN" type="text"
						value="<%=GFB_BCN%>" alertname="�������ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="GFB_BSN" type="text"
						value="<%=GFB_BSN%>" alertname="�������������%����Ϊ����" datatype="number" /></td>
					<td style="text-align: center;"><select name="GFB_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="GFB_MJ_WL" type="text"
						value="<%=GFB_MJ_WL%>" alertname="������δ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="GFB_CDYSNB" type="text"
						value="<%=GFB_CDYSNB%>" alertname="������δ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="GFB_ZDFSQY" type="text"
						value="<%=GFB_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="GFB_LXSQ" type="text"
						value="<%=GFB_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">Ҷ�ݲ�</td>
					<td><input style="width: 100%;" name="YKB_MJ" type="text"
						value="<%=YKB_MJ%>" alertname="Ҷ�ݲ��������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><input style="width: 100%;" name="YKB_FSJS" type="text"
						value="<%=YKB_FSJS%>" alertname="Ҷ�ݲ�������������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="YKB_BCN" type="text"
						value="<%=YKB_BCN%>" alertname="Ҷ�ݲ��ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="YKB_BSN" type="text"
						value="<%=YKB_BSN%>" alertname="Ҷ�ݲ��������%����Ϊ����" datatype="number" /></td>
					<td style="text-align: center;"><select name="YKB_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="YKB_MJ_WL" type="text"
						value="<%=YKB_MJ_WL%>" alertname="Ҷ�ݲ�δ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="YKB_CDYSNB" type="text"
						value="<%=YKB_CDYSNB%>" alertname="Ҷ�ݲ�δ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="YKB_ZDFSQY" type="text"
						value="<%=YKB_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="YKB_LXSQ" type="text"
						value="<%=YKB_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">�߳没</td>
					<td><input style="width: 100%;" name="XCB_MJ" type="text"
						value="<%=XCB_MJ%>" alertname="�߳没�������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><input style="width: 100%;" name="XCB_FSJS" type="text"
						value="<%=XCB_FSJS%>" alertname="�߳没������������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="XCB_BCN" type="text"
						value="<%=XCB_BCN%>" alertname="�߳没�ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="XCB_BSN" type="text"
						value="<%=XCB_BSN%>" alertname="�߳没�������%����Ϊ����" datatype="number" /></td>
					<td style="text-align: center;"><select name="XCB_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="XCB_MJ_WL" type="text"
						value="<%=XCB_MJ_WL%>" alertname="�߳没δ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="XCB_CDYSNB" type="text"
						value="<%=XCB_CDYSNB%>" alertname="�߳没δ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="XCB_ZDFSQY" type="text"
						value="<%=XCB_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="XCB_LXSQ" type="text"
						value="<%=XCB_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">ѩ����</td>
					<td><input style="width: 100%;" name="XFB_MJ" type="text"
						value="<%=XFB_MJ%>" alertname="ѩ�����������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><input style="width: 100%;" name="XFB_FSJS" type="text"
						value="<%=XFB_FSJS%>" alertname="ѩ����������������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="XFB_BCN" type="text"
						value="<%=XFB_BCN%>" alertname="ѩ�����ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="XFB_BSN" type="text"
						value="<%=XFB_BSN%>" alertname="ѩ�����������%����Ϊ����" datatype="number" /></td>
					<td style="text-align: center;"><select name="XFB_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="XFB_MJ_WL" type="text"
						value="<%=XFB_MJ_WL%>" alertname="ѩ����δ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="XFB_CDYSNB" type="text"
						value="<%=XFB_CDYSNB%>" alertname="ѩ����δ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="XFB_ZDFSQY" type="text"
						value="<%=XFB_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="XFB_LXSQ" type="text"
						value="<%=XFB_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">��������</td>
					<td><input style="width: 100%;" name="QTBH_MJ" type="text"
						value="<%=QTBH_MJ%>" alertname="���������������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="QTBH_FSZB" type="text"
						value="<%=QTBH_FSZB%>"/></td>
					<td><input style="width: 100%;" name="QTBH_FSJS" type="text"
						value="<%=QTBH_FSJS%>" alertname="��������������������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="QTBH_BCN" type="text"
						value="<%=QTBH_BCN%>" alertname="���������ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="QTBH_BSN" type="text"
						value="<%=QTBH_BSN%>" alertname="���������������%����Ϊ����" datatype="number" /></td>
					<td><select name="QTBH_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="QTBH_MJ_WL" type="text"
						value="<%=QTBH_MJ_WL%>" alertname="��������δ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="QTBH_CDYSNB" type="text"
						value="<%=QTBH_CDYSNB%>" alertname="��������δ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="QTBH_ZDFSQY" type="text"
						value="<%=QTBH_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="QTBH_LXSQ" type="text"
						value="<%=QTBH_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">����</td>
					<td><input style="width: 100%;" name="YC_MJ" type="text"
						value="<%=YC_MJ%>" alertname="�����������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">���������ͷ/���꣩</td>
					<td><input style="width: 100%;" name="YC_FSJS" type="text"
						value="<%=YC_FSJS%>" alertname="���淢����������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="YC_BCN" type="text"
						value="<%=YC_BCN%>" alertname="����ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="YC_BSN" type="text"
						value="<%=YC_BSN%>" alertname="����������%����Ϊ����" datatype="number" /></td>
					<td><select name="YC_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="YC_MJ_WL" type="text"
						value="<%=YC_MJ_WL%>" alertname="����δ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="YC_CDYSNB" type="text"
						value="<%=YC_CDYSNB%>" alertname="����δ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="YC_ZDFSQY" type="text"
						value="<%=YC_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="YC_LXSQ" type="text"
						value="<%=YC_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">֩��</td>
					<td><input style="width: 100%;" name="ZZ_MJ" type="text"
						value="<%=ZZ_MJ%>" alertname="֩���������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">ÿ�ߵ��г�����ͷ/��/�У�</td>
					<td><input style="width: 100%;" name="ZZ_FSJS" type="text"
						value="<%=ZZ_FSJS%>" alertname="֩�뷢����������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="ZZ_BCN" type="text"
						value="<%=ZZ_BCN%>" alertname="֩��ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="ZZ_BSN" type="text"
						value="<%=ZZ_BSN%>" alertname="֩��������%����Ϊ����" datatype="number" /></td>
					<td><select name="ZZ_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="ZZ_MJ_WL" type="text"
						value="<%=ZZ_MJ_WL%>" alertname="֩��δ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="ZZ_CDYSNB" type="text"
						value="<%=ZZ_CDYSNB%>" alertname="֩��δ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="ZZ_ZDFSQY" type="text"
						value="<%=ZZ_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="ZZ_LXSQ" type="text"
						value="<%=ZZ_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">������</td>
					<td><input style="width: 100%;" name="XJC_MJ" type="text"
						value="<%=XJC_MJ%>" alertname="�������������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">ÿС��������ͷ/С����</td>
					<td><input style="width: 100%;" name="XJC_FSJS" type="text"
						value="<%=XJC_FSJS%>" alertname="�����淢����������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="XJC_BCN" type="text"
						value="<%=XJC_BCN%>" alertname="������ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="XJC_BSN" type="text"
						value="<%=XJC_BSN%>" alertname="������������%����Ϊ����" datatype="number" /></td>
					<td><select name="XJC_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="XJC_MJ_WL" type="text"
						value="<%=XJC_MJ_WL%>" alertname="������δ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="XJC_CDYSNB" type="text"
						value="<%=XJC_CDYSNB%>" alertname="������δ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="XJC_ZDFSQY" type="text"
						value="<%=XJC_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="XJC_LXSQ" type="text"
						value="<%=XJC_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">һ��ճ��</td>
					<td><input style="width: 100%;" name="YDNC_MJ" type="text"
						value="<%=YDNC_MJ%>" alertname="һ��ճ���������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">ÿƽ���׳�����ͷ/m2��</td>
					<td><input style="width: 100%;" name="YDNC_FSJS" type="text"
						value="<%=YDNC_FSJS%>" alertname="һ��ճ�淢����������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="YDNC_BCN" type="text"
						value="<%=YDNC_BCN%>" alertname="һ��ճ��ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="YDNC_BSN" type="text"
						value="<%=YDNC_BSN%>" alertname="һ��ճ��������%����Ϊ����" datatype="number" /></td>
					<td style="text-align: center;"><select name="YDNC_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="YDNC_MJ_WL" type="text"
						value="<%=YDNC_MJ_WL%>" alertname="һ��ճ��δ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="YDNC_CDYSNB" type="text"
						value="<%=YDNC_CDYSNB%>" alertname="һ��ճ��δ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="YDNC_ZDFSQY" type="text"
						value="<%=YDNC_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="YDNC_LXSQ" type="text"
						value="<%=YDNC_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">���º���</td>
					<td><input style="width: 100%;" name="DXHC_MJ" type="text"
						value="<%=DXHC_MJ%>" alertname="���º����������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">�������ʣ�%��</td>
					<td><input style="width: 100%;" name="DXHC_FSJS" type="text"
						value="<%=DXHC_FSJS%>" alertname="���º��淢����������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="DXHC_BCN" type="text"
						value="<%=DXHC_BCN%>" alertname="���º���ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="DXHC_BSN" type="text"
						value="<%=DXHC_BSN%>" alertname="���º���������%����Ϊ����" datatype="number" /></td>
					<td><select name="DXHC_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="DXHC_MJ_WL" type="text"
						value="<%=DXHC_MJ_WL%>" alertname="���º���δ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="DXHC_CDYSNB" type="text"
						value="<%=DXHC_CDYSNB%>" alertname="���º���δ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="DXHC_ZDFSQY" type="text"
						value="<%=DXHC_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="DXHC_LXSQ" type="text"
						value="<%=DXHC_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">�ҷ�ʭ</td>
					<td><input style="width: 100%;" name="HFS_MJ" type="text"
						value="<%=HFS_MJ%>" alertname="�ҷ�ʭ�������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">Ķ����(��ͷ/Ķ)</td>
					<td><input style="width: 100%;" name="HFS_FSJS" type="text"
						value="<%=HFS_FSJS%>" alertname="�ҷ�ʭ������������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="HFS_BCN" type="text"
						value="<%=HFS_BCN%>" alertname="�ҷ�ʭ�ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="HFS_BSN" type="text"
						value="<%=HFS_BSN%>" alertname="�ҷ�ʭ�������%����Ϊ����" datatype="number" /></td>
					<td style="text-align: center;"><select name="HFS_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="HFS_MJ_WL" type="text"
						value="<%=HFS_MJ_WL%>" alertname="�ҷ�ʭδ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="HFS_CDYSNB" type="text"
						value="<%=HFS_CDYSNB%>" alertname="�ҷ�ʭδ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="HFS_ZDFSQY" type="text"
						value="<%=HFS_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="HFS_LXSQ" type="text"
						value="<%=HFS_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">����</td>
					<td><input style="width: 100%;" name="TH_MJ" type="text"
						value="<%=TH_MJ%>" alertname="�����������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">ÿƽ���׳�����ͷ/m2��</td>
					<td><input style="width: 100%;" name="TH_FSJS" type="text"
						value="<%=TH_FSJS%>" alertname="���ȷ�����������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="TH_BCN" type="text"
						value="<%=TH_BCN%>" alertname="���ȱȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="TH_BSN" type="text"
						value="<%=TH_BSN%>" alertname="���ȱ������%����Ϊ����" datatype="number" /></td>
					<td style="text-align: center;"><select name="TH_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="TH_MJ_WL" type="text"
						value="<%=TH_MJ_WL%>" alertname="����δ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="TH_CDYSNB" type="text"
						value="<%=TH_CDYSNB%>" alertname="����δ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="TH_ZDFSQY" type="text"
						value="<%=TH_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="TH_LXSQ" type="text"
						value="<%=TH_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">��Ҷ��</td>
					<td><input style="width: 100%;" name="MYF_MJ" type="text"
						value="<%=MYF_MJ%>" alertname="��Ҷ���������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">ÿƽ���׳�����ͷ/m2��</td>
					<td><input style="width: 100%;" name="MYF_FSJS" type="text"
						value="<%=MYF_FSJS%>" alertname="��Ҷ�䷢����������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="MYF_BCN" type="text"
						value="<%=MYF_BCN%>" alertname="��Ҷ��ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="MYF_BSN" type="text"
						value="<%=MYF_BSN%>" alertname="��Ҷ��������%����Ϊ����" datatype="number" /></td>
					<td style="text-align: center;"><select name="MYF_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="MYF_MJ_WL" type="text"
						value="<%=MYF_MJ_WL%>" alertname="��Ҷ��δ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="MYF_CDYSNB" type="text"
						value="<%=MYF_CDYSNB%>" alertname="��Ҷ��δ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="MYF_ZDFSQY" type="text"
						value="<%=MYF_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="MYF_LXSQ" type="text"
						value="<%=MYF_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">�󾥷�</td>
					<td><input style="width: 100%;" name="MJF_MJ" type="text"
						value="<%=MJF_MJ%>" alertname="�󾥷��������Ϊ����" datatype="number" /></td>
					<td style="text-align: center;">�������ʣ�%��</td>
					<td><input style="width: 100%;" name="MJF_FSJS" type="text"
						value="<%=MJF_FSJS%>" alertname="�󾥷䷢����������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="MJF_BCN" type="text"
						value="<%=MJF_BCN%>" alertname="�󾥷�ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="MJF_BSN" type="text"
						value="<%=MJF_BSN%>" alertname="�󾥷�������%����Ϊ����" datatype="number" /></td>
					<td style="text-align: center;"><select name="MJF_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="MJF_MJ_WL" type="text"
						value="<%=MJF_MJ_WL%>" alertname="�󾥷�δ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="MJF_CDYSNB" type="text"
						value="<%=MJF_CDYSNB%>" alertname="�󾥷�δ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="MJF_ZDFSQY" type="text"
						value="<%=MJF_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="MJF_LXSQ" type="text"
						value="<%=MJF_LXSQ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">��������</td>
					<td><input style="width: 100%;" name="QTHC_MJ" type="text"
						value="<%=QTHC_MJ%>" alertname="���������������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="QTHC_FSZB" type="text"
						value="<%=QTHC_FSZB%>"/></td>
					<td><input style="width: 100%;" name="QTHC_FSJS" type="text"
						value="<%=QTHC_FSJS%>" alertname="�������淢����������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="QTHC_BCN" type="text"
						value="<%=QTHC_BCN%>" alertname="��������ȳ����%����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="QTHC_BSN" type="text"
						value="<%=QTHC_BSN%>" alertname="��������������%����Ϊ����" datatype="number" /></td>
					<td><select name="QTHC_CD_WL" style="width: 100%"><option value="">��ѡ��</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="QTHC_MJ_WL" type="text"
						value="<%=QTHC_MJ_WL%>" alertname="��������δ���������Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="QTHC_CDYSNB" type="text"
						value="<%=QTHC_CDYSNB%>" alertname="��������δ���̶�������ȡ�����Ϊ����" datatype="number" /></td>
					<td><input style="width: 100%;" name="QTHC_ZDFSQY" type="text"
						value="<%=QTHC_ZDFSQY%>"/></td>
					<td><input style="width: 100%;" name="QTHC_LXSQ" type="text"
						value="<%=QTHC_LXSQ%>"/></td>
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
					style="text-align:center;font-size=30;width: ;height: "><b>С�󲡳溦�к�������Ԥ��������Ԥ����ͳ�Ʊ�(<%=rwsj%>)
				</b><br> <br></td>
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
					<td colspan=2 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>������ֲ�������Ķ��</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>������ֲ�������Ķ��</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>������</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>һ�����������(%)</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�������������(%)</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�������������(%)</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>���������볣��Ƚ�</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>����</b></td>
					<td colspan=2 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>����Ʒ�ֿ�������</b></td>
				</tr>
				<tr>
				<td colspan=2 rowspan=1><label><%=MD_ZZMJ%></label></td>
				<td><label><%=CM_ZZMJ%></label></td>
				<td><label><%=BZQ%></label></td>
				<td><label><%=YLM_MJBL%></label></td>
				<td><label><%=ELM_MJBL%></label></td>
				<td><label><%=SLM_MJBL%></label></td>
				<td><label><%=ZTMQYCNBJ%></label></td>
				<td><label><%=ZS%></label></td>
				<td colspan=2 rowspan=1><label><%=ZZPZKCX%></label></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��������</b></td>
					<td colspan=5 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��ǰ�������</b></td>
					<td colspan=5 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>δ������</b></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>���</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>����ָ��</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��������</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�ȳ����%</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�������%</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�̶�</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>���</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�̶�������ȡ�</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�ص㷢������</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>����ʢ��</b></td>
				</tr>
			</tbody>
			<tbody id="zg_body">
				<tr>
					<td colspan=1 rowspan=2 style="text-align: center;">���ⲡ</td>
					<td colspan=1 rowspan=2><label><%=TXB_MJ%></label></td>
					<td colspan=1 rowspan=1 style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td colspan=1 rowspan=1><label><%=TXB_FSJS%></label></td>
					<td colspan=1 rowspan=1><label><%=TXB_BCN%></label></td>
					<td colspan=1 rowspan=1><label><%=TXB_BSN%></label></td>
					<td colspan=1 rowspan=2><label><%=TXB_CD_WL%>��</label></td>
					<td colspan=1 rowspan=2><label><%=TXB_MJ_WL%></label></td>
					<td colspan=1 rowspan=2><label><%=TXB_CDYSNB%></label></td>
					<td colspan=1 rowspan=2><label><%=TXB_ZDFSQY%></label></td>
					<td colspan=1 rowspan=2><label><%=TXB_LXSQ%></label></td>
				</tr>
				<tr>
				   <td colspan=1 rowspan=1 style="text-align: center;">�����С���</td>
				</tr>
				<tr>
					<td style="text-align: center;">�׷۲�</td>
					<td><label><%=BFB_MJ%></label></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><label><%=BFB_FSJS%></label></td>
					<td><label><%=BFB_BCN%></label></td>
					<td><label><%=BFB_BSN%></label></td>
					<td><label><%=BFB_CD_WL%>��</label></td>
					<td><label><%=BFB_MJ_WL%></label></td>
					<td><label><%=BFB_CDYSNB%></label></td>
					<td><label><%=BFB_ZDFSQY%></label></td>
					<td><label><%=BFB_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">�ƿݲ�</td>
					<td><label><%=WKB_MJ%></label></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><label><%=WKB_FSJS%></label></td>
					<td><label><%=WKB_BCN%></label></td>
					<td><label><%=WKB_BSN%></label></td>
					<td><label><%=WKB_CD_WL%>��</label></td>
					<td><label><%=WKB_MJ_WL%></label></td>
					<td><label><%=WKB_CDYSNB%></label></td>
					<td><label><%=WKB_ZDFSQY%></label></td>
					<td><label><%=WKB_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">��ù��</td>
					<td><label><%=CMB_MJ%></label></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><label><%=CMB_FSJS%></label></td>
					<td><label><%=CMB_BCN%></label></td>
					<td><label><%=CMB_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=CMB_MJ_WL%></label></td>
					<td><label><%=CMB_CDYSNB%></label></td>
					<td><label><%=CMB_ZDFSQY%></label></td>
					<td><label><%=CMB_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">Ҷ�ⲡ</td>
					<td><label><%=YXB_MJ%></label></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><label><%=YXB_FSJS%></label></td>
					<td><label><%=YXB_BCN%></label></td>
					<td><label><%=YXB_BSN%></label></td>
					<td><label><%=YXB_CD_WL%>��</label></td>
					<td><label><%=YXB_MJ_WL%></label></td>
					<td><label><%=YXB_CDYSNB%></label></td>
					<td><label><%=YXB_ZDFSQY%></label></td>
					<td><label><%=YXB_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">���벡</td>
					<td><label><%=HSB_MJ%></label></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><label><%=HSB_FSJS%></label></td>
					<td><label><%=HSB_BCN%></label></td>
					<td><label><%=HSB_BSN%></label></td>
					<td><label><%=HSB_CD_WL%>��</label></td>
					<td><label><%=HSB_MJ_WL%></label></td>
					<td><label><%=HSB_CDYSNB%></label></td>
					<td><label><%=HSB_ZDFSQY%></label></td>
					<td><label><%=HSB_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">������</td>
					<td><label><%=BBB_MJ%></label></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><label><%=BBB_FSJS%></label></td>
					<td><label><%=BBB_BCN%></label></td>
					<td><label><%=BBB_BSN%></label></td>
					<td><label><%=BBB_CD_WL%>��</label></td>
					<td><label><%=BBB_MJ_WL%></label></td>
					<td><label><%=BBB_CDYSNB%></label></td>
					<td><label><%=BBB_ZDFSQY%></label></td>
					<td><label><%=BBB_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">ȫʴ��</td>
					<td><label><%=QSB_MJ%></label></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><label><%=QSB_FSJS%></label></td>
					<td><label><%=QSB_BCN%></label></td>
					<td><label><%=QSB_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=QSB_MJ_WL%></label></td>
					<td><label><%=QSB_CDYSNB%></label></td>
					<td><label><%=QSB_ZDFSQY%></label></td>
					<td><label><%=QSB_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">������</td>
					<td><label><%=GFB_MJ%></label></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><label><%=GFB_FSJS%></label></td>
					<td><label><%=GFB_BCN%></label></td>
					<td><label><%=GFB_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=GFB_MJ_WL%></label></td>
					<td><label><%=GFB_CDYSNB%></label></td>
					<td><label><%=GFB_ZDFSQY%></label></td>
					<td><label><%=GFB_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">Ҷ�ݲ�</td>
					<td><label><%=YKB_MJ%></label></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><label><%=YKB_FSJS%></label></td>
					<td><label><%=YKB_BCN%></label></td>
					<td><label><%=YKB_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=YKB_MJ_WL%></label></td>
					<td><label><%=YKB_CDYSNB%></label></td>
					<td><label><%=YKB_ZDFSQY%></label></td>
					<td><label><%=YKB_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">�߳没</td>
					<td><label><%=XCB_MJ%></label></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><label><%=XCB_FSJS%></label></td>
					<td><label><%=XCB_BCN%></label></td>
					<td><label><%=XCB_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=XCB_MJ_WL%></label></td>
					<td><label><%=XCB_CDYSNB%></label></td>
					<td><label><%=XCB_ZDFSQY%></label></td>
					<td><label><%=XCB_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">ѩ����</td>
					<td><label><%=XFB_MJ%></label></td>
					<td style="text-align: center;">��Ҷ�ʣ�%��</td>
					<td><label><%=XFB_FSJS%></label></td>
					<td><label><%=XFB_BCN%></label></td>
					<td><label><%=XFB_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=XFB_MJ_WL%></label></td>
					<td><label><%=XFB_CDYSNB%></label></td>
					<td><label><%=XFB_ZDFSQY%></label></td>
					<td><label><%=XFB_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">��������</td>
					<td><label><%=QTBH_MJ%></label></td>
					<td><label><%=QTBH_FSZB%></label></td>
					<td><label><%=QTBH_FSJS%></label></td>
					<td><label><%=QTBH_BCN%></label></td>
					<td><label><%=QTBH_BSN%></label></td>
					<td><label><%=QTBH_CD_WL%>��</label></td>
					<td><label><%=QTBH_MJ_WL%></label></td>
					<td><label><%=QTBH_CDYSNB%></label></td>
					<td><label><%=QTBH_ZDFSQY%></label></td>
					<td><label><%=QTBH_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">����</td>
					<td><label><%=YC_MJ%></label></td>
					<td style="text-align: center;">���������ͷ/���꣩</td>
					<td><label><%=YC_FSJS%></label></td>
					<td><label><%=YC_BCN%></label></td>
					<td><label><%=YC_BSN%></label></td>
					<td><label><%=YC_CD_WL%>��</label></td>
					<td><label><%=YC_MJ_WL%></label></td>
					<td><label><%=YC_CDYSNB%></label></td>
					<td><label><%=YC_ZDFSQY%></label></td>
					<td><label><%=YC_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">֩��</td>
					<td><label><%=ZZ_MJ%></label></td>
					<td style="text-align: center;">ÿ�ߵ��г�����ͷ/��/�У�</td>
					<td><label><%=ZZ_FSJS%></label></td>
					<td><label><%=ZZ_BCN%></label></td>
					<td><label><%=ZZ_BSN%></label></td>
					<td><label><%=ZZ_CD_WL%>��</label></td>
					<td><label><%=ZZ_MJ_WL%></label></td>
					<td><label><%=ZZ_CDYSNB%></label></td>
					<td><label><%=ZZ_ZDFSQY%></label></td>
					<td><label><%=ZZ_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">������</td>
					<td><label><%=XJC_MJ%></label></td>
					<td style="text-align: center;">ÿС��������ͷ/С����</td>
					<td><label><%=XJC_FSJS%></label></td>
					<td><label><%=XJC_BCN%></label></td>
					<td><label><%=XJC_BSN%></label></td>
					<td><label><%=XJC_CD_WL%>��</label></td>
					<td><label><%=XJC_MJ_WL%></label></td>
					<td><label><%=XJC_CDYSNB%></label></td>
					<td><label><%=XJC_ZDFSQY%></label></td>
					<td><label><%=XJC_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">һ��ճ��</td>
					<td><label><%=YDNC_MJ%></label></td>
					<td style="text-align: center;">ÿƽ���׳�����ͷ/m2��</td>
					<td><label><%=YDNC_FSJS%></label></td>
					<td><label><%=YDNC_BCN%></label></td>
					<td><label><%=YDNC_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=YDNC_MJ_WL%></label></td>
					<td><label><%=YDNC_CDYSNB%></label></td>
					<td><label><%=YDNC_ZDFSQY%></label></td>
					<td><label><%=YDNC_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">���º���</td>
					<td><label><%=DXHC_MJ%></label></td>
					<td style="text-align: center;">�������ʣ�%��</td>
					<td><label><%=DXHC_FSJS%></label></td>
					<td><label><%=DXHC_BCN%></label></td>
					<td><label><%=DXHC_BSN%></label></td>
					<td><label><%=DXHC_CD_WL%>��</label></td>
					<td><label><%=DXHC_MJ_WL%></label></td>
					<td><label><%=DXHC_CDYSNB%></label></td>
					<td><label><%=DXHC_ZDFSQY%></label></td>
					<td><label><%=DXHC_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">�ҷ�ʭ</td>
					<td><label><%=HFS_MJ%></label></td>
					<td style="text-align: center;">Ķ����(��ͷ/Ķ)</td>
					<td><label><%=HFS_FSJS%></label></td>
					<td><label><%=HFS_BCN%></label></td>
					<td><label><%=HFS_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=HFS_MJ_WL%></label></td>
					<td><label><%=HFS_CDYSNB%></label></td>
					<td><label><%=HFS_ZDFSQY%></label></td>
					<td><label><%=HFS_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">����</td>
					<td><label><%=TH_MJ%></label></td>
					<td style="text-align: center;">ÿƽ���׳�����ͷ/m2��</td>
					<td><label><%=TH_FSJS%></label></td>
					<td><label><%=TH_BCN%></label></td>
					<td><label><%=TH_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=TH_MJ_WL%></label></td>
					<td><label><%=TH_CDYSNB%></label></td>
					<td><label><%=TH_ZDFSQY%></label></td>
					<td><label><%=TH_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">��Ҷ��</td>
					<td><label><%=MYF_MJ%></label></td>
					<td style="text-align: center;">ÿƽ���׳�����ͷ/m2��</td>
					<td><label><%=MYF_FSJS%></label></td>
					<td><label><%=MYF_BCN%></label></td>
					<td><label><%=MYF_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=MYF_MJ_WL%></label></td>
					<td><label><%=MYF_CDYSNB%></label></td>
					<td><label><%=MYF_ZDFSQY%></label></td>
					<td><label><%=MYF_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">�󾥷�</td>
					<td><label><%=MJF_MJ%></label></td>
					<td style="text-align: center;">�������ʣ�%��</td>
					<td><label><%=MJF_FSJS%></label></td>
					<td><label><%=MJF_BCN%></label></td>
					<td><label><%=MJF_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=MJF_MJ_WL%></label></td>
					<td><label><%=MJF_CDYSNB%></label></td>
					<td><label><%=MJF_ZDFSQY%></label></td>
					<td><label><%=MJF_LXSQ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">��������</td>
					<td><label><%=QTHC_MJ%></label></td>
					<td><label><%=QTHC_FSZB%></label></td>
					<td><label><%=QTHC_FSJS%></label></td>
					<td><label><%=QTHC_BCN%></label></td>
					<td><label><%=QTHC_BSN%></label></td>
					<td><label><%=QTHC_CD_WL%>��</label></td>
					<td><label><%=QTHC_MJ_WL%></label></td>
					<td><label><%=QTHC_CDYSNB%></label></td>
					<td><label><%=QTHC_ZDFSQY%></label></td>
					<td><label><%=QTHC_LXSQ%></label></td>
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
		xzsel('BFB_CD_WL','<%=BFB_CD_WL%>');
		xzsel('WKB_CD_WL','<%=WKB_CD_WL%>');
		xzsel('YXB_CD_WL','<%=YXB_CD_WL%>');
		xzsel('HSB_CD_WL','<%=HSB_CD_WL%>');
		xzsel('BBB_CD_WL','<%=BBB_CD_WL%>');
		xzsel('QTBH_CD_WL','<%=QTBH_CD_WL%>');
		xzsel('YC_CD_WL','<%=YC_CD_WL%>');
		xzsel('ZZ_CD_WL','<%=ZZ_CD_WL%>');
		xzsel('XJC_CD_WL','<%=XJC_CD_WL%>');
		xzsel('DXHC_CD_WL','<%=DXHC_CD_WL%>');
		xzsel('QTHC_CD_WL','<%=QTHC_CD_WL%>');
		xzsel('TXB_CD_WL','<%=TXB_CD_WL%>');
		xzsel('CMB_CD_WL','<%=CMB_CD_WL%>');
		xzsel('QSB_CD_WL','<%=QSB_CD_WL%>');
		xzsel('GFB_CD_WL','<%=GFB_CD_WL%>');
		xzsel('YKB_CD_WL','<%=YKB_CD_WL%>');
		xzsel('XCB_CD_WL','<%=XCB_CD_WL%>');
		xzsel('XFB_CD_WL','<%=XFB_CD_WL%>');
		xzsel('YDNC_CD_WL','<%=YDNC_CD_WL%>');
		xzsel('HFS_CD_WL','<%=HFS_CD_WL%>');
		xzsel('TH_CD_WL','<%=TH_CD_WL%>');
		xzsel('MYF_CD_WL','<%=MYF_CD_WL%>');
		xzsel('MJF_CD_WL','<%=MJF_CD_WL%>');
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