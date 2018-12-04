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
		String MD_ZZMJ = "";
		String CM_ZZMJ = "";
		String YLM_MJBL = "";
		String ELM_MJBL = "";
		String SLM_MJBL = "";
		String ZTMQYCNBJ = "";
		String ZS = "";
		String ZZPZKCX = "";
		String TXB_CD = "";
		String TXB_MJ = "";
		String TXB_FSJS = "";
		String TXB_BCN = "";
		String TXB_BSN = "";
		String TXB_CD_WL = "";
		String TXB_MJ_WL = "";
		String TXB_CDYSNB = "";
		String TXB_ZDFSQY = "";
		String BFB_CD = "";
		String BFB_MJ = "";
		String BFB_FSJS = "";
		String BFB_BCN = "";
		String BFB_BSN = "";
		String BFB_CD_WL = "";
		String BFB_MJ_WL = "";
		String BFB_CDYSNB = "";
		String BFB_ZDFSQY = "";
		String WKB_CD = "";
		String WKB_MJ = "";
		String WKB_FSJS = "";
		String WKB_BCN = "";
		String WKB_BSN = "";
		String WKB_CD_WL = "";
		String WKB_MJ_WL = "";
		String WKB_CDYSNB = "";
		String WKB_ZDFSQY = "";
		String CMB_CD = "";
		String CMB_MJ = "";
		String CMB_FSJS = "";
		String CMB_BCN = "";
		String CMB_BSN = "";
		String CMB_CD_WL = "";
		String CMB_MJ_WL = "";
		String CMB_CDYSNB = "";
		String CMB_ZDFSQY = "";
		String YXB_CD = "";
		String YXB_MJ = "";
		String YXB_FSJS = "";
		String YXB_BCN = "";
		String YXB_BSN = "";
		String YXB_CD_WL = "";
		String YXB_MJ_WL = "";
		String YXB_CDYSNB = "";
		String YXB_ZDFSQY = "";
		String HSB_CD = "";
		String HSB_MJ = "";
		String HSB_FSJS = "";
		String HSB_BCN = "";
		String HSB_BSN = "";
		String HSB_CD_WL = "";
		String HSB_MJ_WL = "";
		String HSB_CDYSNB = "";
		String HSB_ZDFSQY = "";
		String BBB_CD = "";
		String BBB_MJ = "";
		String BBB_FSJS = "";
		String BBB_BCN = "";
		String BBB_BSN = "";
		String BBB_CD_WL = "";
		String BBB_MJ_WL = "";
		String BBB_CDYSNB = "";
		String BBB_ZDFSQY = "";
		String QSB_CD = "";
		String QSB_MJ = "";
		String QSB_FSJS = "";
		String QSB_BCN = "";
		String QSB_BSN = "";
		String QSB_CD_WL = "";
		String QSB_MJ_WL = "";
		String QSB_CDYSNB = "";
		String QSB_ZDFSQY = "";
		String GFB_CD = "";
		String GFB_MJ = "";
		String GFB_FSJS = "";
		String GFB_BCN = "";
		String GFB_BSN = "";
		String GFB_CD_WL = "";
		String GFB_MJ_WL = "";
		String GFB_CDYSNB = "";
		String GFB_ZDFSQY = "";
		String YKB_CD = "";
		String YKB_MJ = "";
		String YKB_FSJS = "";
		String YKB_BCN = "";
		String YKB_BSN = "";
		String YKB_CD_WL = "";
		String YKB_MJ_WL = "";
		String YKB_CDYSNB = "";
		String YKB_ZDFSQY = "";
		String XCB_CD = "";
		String XCB_MJ = "";
		String XCB_FSJS = "";
		String XCB_BCN = "";
		String XCB_BSN = "";
		String XCB_CD_WL = "";
		String XCB_MJ_WL = "";
		String XCB_CDYSNB = "";
		String XCB_ZDFSQY = "";
		String XFB_CD = "";
		String XFB_MJ = "";
		String XFB_FSJS = "";
		String XFB_BCN = "";
		String XFB_BSN = "";
		String XFB_CD_WL = "";
		String XFB_MJ_WL = "";
		String XFB_CDYSNB = "";
		String XFB_ZDFSQY = "";
		String QTBH_CD = "";
		String QTBH_MJ = "";
		String QTBH_FSJS = "";
		String QTBH_BCN = "";
		String QTBH_BSN = "";
		String QTBH_CD_WL = "";
		String QTBH_MJ_WL = "";
		String QTBH_CDYSNB = "";
		String QTBH_ZDFSQY = "";
		String QTBH_FSZB = "";
		String YC_CD = "";
		String YC_MJ = "";
		String YC_FSJS = "";
		String YC_BCN = "";
		String YC_BSN = "";
		String YC_CD_WL = "";
		String YC_MJ_WL = "";
		String YC_CDYSNB = "";
		String YC_ZDFSQY = "";
		String ZZ_CD = "";
		String ZZ_MJ = "";
		String ZZ_FSJS = "";
		String ZZ_BCN = "";
		String ZZ_BSN = "";
		String ZZ_CD_WL = "";
		String ZZ_MJ_WL = "";
		String ZZ_CDYSNB = "";
		String ZZ_ZDFSQY = "";
		String XJC_CD = "";
		String XJC_MJ = "";
		String XJC_FSJS = "";
		String XJC_BCN = "";
		String XJC_BSN = "";
		String XJC_CD_WL = "";
		String XJC_MJ_WL = "";
		String XJC_CDYSNB = "";
		String XJC_ZDFSQY = "";
		String YDNC_CD = "";
		String YDNC_MJ = "";
		String YDNC_FSJS = "";
		String YDNC_BCN = "";
		String YDNC_BSN = "";
		String YDNC_CD_WL = "";
		String YDNC_MJ_WL = "";
		String YDNC_CDYSNB = "";
		String YDNC_ZDFSQY = "";
		String DXHC_CD = "";
		String DXHC_MJ = "";
		String DXHC_FSJS = "";
		String DXHC_BCN = "";
		String DXHC_BSN = "";
		String DXHC_CD_WL = "";
		String DXHC_MJ_WL = "";
		String DXHC_CDYSNB = "";
		String DXHC_ZDFSQY = "";
		String HFS_CD = "";
		String HFS_MJ = "";
		String HFS_FSJS = "";
		String HFS_BCN = "";
		String HFS_BSN = "";
		String HFS_CD_WL = "";
		String HFS_MJ_WL = "";
		String HFS_CDYSNB = "";
		String HFS_ZDFSQY = "";
		String TH_CD = "";
		String TH_MJ = "";
		String TH_FSJS = "";
		String TH_BCN = "";
		String TH_BSN = "";
		String TH_CD_WL = "";
		String TH_MJ_WL = "";
		String TH_CDYSNB = "";
		String TH_ZDFSQY = "";
		String MYF_CD = "";
		String MYF_MJ = "";
		String MYF_FSJS = "";
		String MYF_BCN = "";
		String MYF_BSN = "";
		String MYF_CD_WL = "";
		String MYF_MJ_WL = "";
		String MYF_CDYSNB = "";
		String MYF_ZDFSQY = "";
		String MJF_CD = "";
		String MJF_MJ = "";
		String MJF_FSJS = "";
		String MJF_BCN = "";
		String MJF_BSN = "";
		String MJF_CD_WL = "";
		String MJF_MJ_WL = "";
		String MJF_CDYSNB = "";
		String MJF_ZDFSQY = "";
		String QTHC_CD = "";
		String QTHC_MJ = "";
		String QTHC_FSJS = "";
		String QTHC_BCN = "";
		String QTHC_BSN = "";
		String QTHC_CD_WL = "";
		String QTHC_MJ_WL = "";
		String QTHC_CDYSNB = "";
		String QTHC_ZDFSQY = "";
		String QTHC_FSZB = "";
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
				String sql = "select * from D006 where jfid=" + jfid;
				pstmtbody = ecbody.con.prepareStatement(sql);
				rsbody = pstmtbody.executeQuery();
				while (rsbody.next()) {
					 JFID = rsbody.getString("JFID")==null?"":rsbody.getString("JFID");
					 MD_ZZMJ =rsbody.getString("MD_ZZMJ")==null?"":rsbody.getString("MD_ZZMJ");
					 CM_ZZMJ =rsbody.getString("CM_ZZMJ")==null?"":rsbody.getString("CM_ZZMJ");
					 YLM_MJBL =rsbody.getString("YLM_MJBL")==null?"":rsbody.getString("YLM_MJBL");
					 ELM_MJBL =rsbody.getString("ELM_MJBL")==null?"":rsbody.getString("ELM_MJBL");
					 SLM_MJBL =rsbody.getString("SLM_MJBL")==null?"":rsbody.getString("SLM_MJBL");
					 ZTMQYCNBJ =rsbody.getString("ZTMQYCNBJ")==null?"":rsbody.getString("ZTMQYCNBJ");
					 ZS =rsbody.getString("ZS")==null?"":rsbody.getString("ZS");
					 ZZPZKCX =rsbody.getString("ZZPZKCX")==null?"":rsbody.getString("ZZPZKCX");
					 TXB_CD =rsbody.getString("TXB_CD")==null?"":rsbody.getString("TXB_CD");
					 TXB_MJ =rsbody.getString("TXB_MJ")==null?"":rsbody.getString("TXB_MJ");
					 TXB_FSJS =rsbody.getString("TXB_FSJS")==null?"":rsbody.getString("TXB_FSJS");
					 TXB_BCN =rsbody.getString("TXB_BCN")==null?"":rsbody.getString("TXB_BCN");
					 TXB_BSN =rsbody.getString("TXB_BSN")==null?"":rsbody.getString("TXB_BSN");
					 TXB_CD_WL =rsbody.getString("TXB_CD_WL")==null?"":rsbody.getString("TXB_CD_WL");
					 TXB_MJ_WL =rsbody.getString("TXB_MJ_WL")==null?"":rsbody.getString("TXB_MJ_WL");
					 TXB_CDYSNB =rsbody.getString("TXB_CDYSNB")==null?"":rsbody.getString("TXB_CDYSNB");
					 TXB_ZDFSQY =rsbody.getString("TXB_ZDFSQY")==null?"":rsbody.getString("TXB_ZDFSQY");
					 BFB_CD =rsbody.getString("BFB_CD")==null?"":rsbody.getString("BFB_CD");
					 BFB_MJ =rsbody.getString("BFB_MJ")==null?"":rsbody.getString("BFB_MJ");
					 BFB_FSJS =rsbody.getString("BFB_FSJS")==null?"":rsbody.getString("BFB_FSJS");
					 BFB_BCN =rsbody.getString("BFB_BCN")==null?"":rsbody.getString("BFB_BCN");
					 BFB_BSN =rsbody.getString("BFB_BSN")==null?"":rsbody.getString("BFB_BSN");
					 BFB_CD_WL =rsbody.getString("BFB_CD_WL")==null?"":rsbody.getString("BFB_CD_WL");
					 BFB_MJ_WL =rsbody.getString("BFB_MJ_WL")==null?"":rsbody.getString("BFB_MJ_WL");
					 BFB_CDYSNB =rsbody.getString("BFB_CDYSNB")==null?"":rsbody.getString("BFB_CDYSNB");
					 BFB_ZDFSQY =rsbody.getString("BFB_ZDFSQY")==null?"":rsbody.getString("BFB_ZDFSQY");
					 WKB_CD =rsbody.getString("WKB_CD")==null?"":rsbody.getString("WKB_CD");
					 WKB_MJ =rsbody.getString("WKB_MJ")==null?"":rsbody.getString("WKB_MJ");
					 WKB_FSJS =rsbody.getString("WKB_FSJS")==null?"":rsbody.getString("WKB_FSJS");
					 WKB_BCN =rsbody.getString("WKB_BCN")==null?"":rsbody.getString("WKB_BCN");
					 WKB_BSN =rsbody.getString("WKB_BSN")==null?"":rsbody.getString("WKB_BSN");
					 WKB_CD_WL =rsbody.getString("WKB_CD_WL")==null?"":rsbody.getString("WKB_CD_WL");
					 WKB_MJ_WL =rsbody.getString("WKB_MJ_WL")==null?"":rsbody.getString("WKB_MJ_WL");
					 WKB_CDYSNB =rsbody.getString("WKB_CDYSNB")==null?"":rsbody.getString("WKB_CDYSNB");
					 WKB_ZDFSQY =rsbody.getString("WKB_ZDFSQY")==null?"":rsbody.getString("WKB_ZDFSQY");
					 CMB_CD =rsbody.getString("CMB_CD")==null?"":rsbody.getString("CMB_CD");
					 CMB_MJ =rsbody.getString("CMB_MJ")==null?"":rsbody.getString("CMB_MJ");
					 CMB_FSJS =rsbody.getString("CMB_FSJS")==null?"":rsbody.getString("CMB_FSJS");
					 CMB_BCN =rsbody.getString("CMB_BCN")==null?"":rsbody.getString("CMB_BCN");
					 CMB_BSN =rsbody.getString("CMB_BSN")==null?"":rsbody.getString("CMB_BSN");
					 CMB_CD_WL =rsbody.getString("CMB_CD_WL")==null?"":rsbody.getString("CMB_CD_WL");
					 CMB_MJ_WL =rsbody.getString("CMB_MJ_WL")==null?"":rsbody.getString("CMB_MJ_WL");
					 CMB_CDYSNB =rsbody.getString("CMB_CDYSNB")==null?"":rsbody.getString("CMB_CDYSNB");
					 CMB_ZDFSQY =rsbody.getString("CMB_ZDFSQY")==null?"":rsbody.getString("CMB_ZDFSQY");
					 YXB_CD =rsbody.getString("YXB_CD")==null?"":rsbody.getString("YXB_CD");
					 YXB_MJ =rsbody.getString("YXB_MJ")==null?"":rsbody.getString("YXB_MJ");
					 YXB_FSJS =rsbody.getString("YXB_FSJS")==null?"":rsbody.getString("YXB_FSJS");
					 YXB_BCN =rsbody.getString("YXB_BCN")==null?"":rsbody.getString("YXB_BCN");
					 YXB_BSN =rsbody.getString("YXB_BSN")==null?"":rsbody.getString("YXB_BSN");
					 YXB_CD_WL =rsbody.getString("YXB_CD_WL")==null?"":rsbody.getString("YXB_CD_WL");
					 YXB_MJ_WL =rsbody.getString("YXB_MJ_WL")==null?"":rsbody.getString("YXB_MJ_WL");
					 YXB_CDYSNB =rsbody.getString("YXB_CDYSNB")==null?"":rsbody.getString("YXB_CDYSNB");
					 YXB_ZDFSQY =rsbody.getString("YXB_ZDFSQY")==null?"":rsbody.getString("YXB_ZDFSQY");
					 HSB_CD =rsbody.getString("HSB_CD")==null?"":rsbody.getString("HSB_CD");
					 HSB_MJ =rsbody.getString("HSB_MJ")==null?"":rsbody.getString("HSB_MJ");
					 HSB_FSJS =rsbody.getString("HSB_FSJS")==null?"":rsbody.getString("HSB_FSJS");
					 HSB_BCN =rsbody.getString("HSB_BCN")==null?"":rsbody.getString("HSB_BCN");
					 HSB_BSN =rsbody.getString("HSB_BSN")==null?"":rsbody.getString("HSB_BSN");
					 HSB_CD_WL =rsbody.getString("HSB_CD_WL")==null?"":rsbody.getString("HSB_CD_WL");
					 HSB_MJ_WL =rsbody.getString("HSB_MJ_WL")==null?"":rsbody.getString("HSB_MJ_WL");
					 HSB_CDYSNB =rsbody.getString("HSB_CDYSNB")==null?"":rsbody.getString("HSB_CDYSNB");
					 HSB_ZDFSQY =rsbody.getString("HSB_ZDFSQY")==null?"":rsbody.getString("HSB_ZDFSQY");
					 BBB_CD =rsbody.getString("BBB_CD")==null?"":rsbody.getString("BBB_CD");
					 BBB_MJ =rsbody.getString("BBB_MJ")==null?"":rsbody.getString("BBB_MJ");
					 BBB_FSJS =rsbody.getString("BBB_FSJS")==null?"":rsbody.getString("BBB_FSJS");
					 BBB_BCN =rsbody.getString("BBB_BCN")==null?"":rsbody.getString("BBB_BCN");
					 BBB_BSN =rsbody.getString("BBB_BSN")==null?"":rsbody.getString("BBB_BSN");
					 BBB_CD_WL =rsbody.getString("BBB_CD_WL")==null?"":rsbody.getString("BBB_CD_WL");
					 BBB_MJ_WL =rsbody.getString("BBB_MJ_WL")==null?"":rsbody.getString("BBB_MJ_WL");
					 BBB_CDYSNB =rsbody.getString("BBB_CDYSNB")==null?"":rsbody.getString("BBB_CDYSNB");
					 BBB_ZDFSQY =rsbody.getString("BBB_ZDFSQY")==null?"":rsbody.getString("BBB_ZDFSQY");
					 QSB_CD =rsbody.getString("QSB_CD")==null?"":rsbody.getString("QSB_CD");
					 QSB_MJ =rsbody.getString("QSB_MJ")==null?"":rsbody.getString("QSB_MJ");
					 QSB_FSJS =rsbody.getString("QSB_FSJS")==null?"":rsbody.getString("QSB_FSJS");
					 QSB_BCN =rsbody.getString("QSB_BCN")==null?"":rsbody.getString("QSB_BCN");
					 QSB_BSN =rsbody.getString("QSB_BSN")==null?"":rsbody.getString("QSB_BSN");
					 QSB_CD_WL =rsbody.getString("QSB_CD_WL")==null?"":rsbody.getString("QSB_CD_WL");
					 QSB_MJ_WL =rsbody.getString("QSB_MJ_WL")==null?"":rsbody.getString("QSB_MJ_WL");
					 QSB_CDYSNB =rsbody.getString("QSB_CDYSNB")==null?"":rsbody.getString("QSB_CDYSNB");
					 QSB_ZDFSQY =rsbody.getString("QSB_ZDFSQY")==null?"":rsbody.getString("QSB_ZDFSQY");
					 GFB_CD =rsbody.getString("GFB_CD")==null?"":rsbody.getString("GFB_CD");
					 GFB_MJ =rsbody.getString("GFB_MJ")==null?"":rsbody.getString("GFB_MJ");
					 GFB_FSJS =rsbody.getString("GFB_FSJS")==null?"":rsbody.getString("GFB_FSJS");
					 GFB_BCN =rsbody.getString("GFB_BCN")==null?"":rsbody.getString("GFB_BCN");
					 GFB_BSN =rsbody.getString("GFB_BSN")==null?"":rsbody.getString("GFB_BSN");
					 GFB_CD_WL =rsbody.getString("GFB_CD_WL")==null?"":rsbody.getString("GFB_CD_WL");
					 GFB_MJ_WL =rsbody.getString("GFB_MJ_WL")==null?"":rsbody.getString("GFB_MJ_WL");
					 GFB_CDYSNB =rsbody.getString("GFB_CDYSNB")==null?"":rsbody.getString("GFB_CDYSNB");
					 GFB_ZDFSQY =rsbody.getString("GFB_ZDFSQY")==null?"":rsbody.getString("GFB_ZDFSQY");
					 YKB_CD =rsbody.getString("YKB_CD")==null?"":rsbody.getString("YKB_CD");
					 YKB_MJ =rsbody.getString("YKB_MJ")==null?"":rsbody.getString("YKB_MJ");
					 YKB_FSJS =rsbody.getString("YKB_FSJS")==null?"":rsbody.getString("YKB_FSJS");
					 YKB_BCN =rsbody.getString("YKB_BCN")==null?"":rsbody.getString("YKB_BCN");
					 YKB_BSN =rsbody.getString("YKB_BSN")==null?"":rsbody.getString("YKB_BSN");
					 YKB_CD_WL =rsbody.getString("YKB_CD_WL")==null?"":rsbody.getString("YKB_CD_WL");
					 YKB_MJ_WL =rsbody.getString("YKB_MJ_WL")==null?"":rsbody.getString("YKB_MJ_WL");
					 YKB_CDYSNB =rsbody.getString("YKB_CDYSNB")==null?"":rsbody.getString("YKB_CDYSNB");
					 YKB_ZDFSQY =rsbody.getString("YKB_ZDFSQY")==null?"":rsbody.getString("YKB_ZDFSQY");
					 XCB_CD =rsbody.getString("XCB_CD")==null?"":rsbody.getString("XCB_CD");
					 XCB_MJ =rsbody.getString("XCB_MJ")==null?"":rsbody.getString("XCB_MJ");
					 XCB_FSJS =rsbody.getString("XCB_FSJS")==null?"":rsbody.getString("XCB_FSJS");
					 XCB_BCN =rsbody.getString("XCB_BCN")==null?"":rsbody.getString("XCB_BCN");
					 XCB_BSN =rsbody.getString("XCB_BSN")==null?"":rsbody.getString("XCB_BSN");
					 XCB_CD_WL =rsbody.getString("XCB_CD_WL")==null?"":rsbody.getString("XCB_CD_WL");
					 XCB_MJ_WL =rsbody.getString("XCB_MJ_WL")==null?"":rsbody.getString("XCB_MJ_WL");
					 XCB_CDYSNB =rsbody.getString("XCB_CDYSNB")==null?"":rsbody.getString("XCB_CDYSNB");
					 XCB_ZDFSQY =rsbody.getString("XCB_ZDFSQY")==null?"":rsbody.getString("XCB_ZDFSQY");
					 XFB_CD =rsbody.getString("XFB_CD")==null?"":rsbody.getString("XFB_CD");
					 XFB_MJ =rsbody.getString("XFB_MJ")==null?"":rsbody.getString("XFB_MJ");
					 XFB_FSJS =rsbody.getString("XFB_FSJS")==null?"":rsbody.getString("XFB_FSJS");
					 XFB_BCN =rsbody.getString("XFB_BCN")==null?"":rsbody.getString("XFB_BCN");
					 XFB_BSN =rsbody.getString("XFB_BSN")==null?"":rsbody.getString("XFB_BSN");
					 XFB_CD_WL =rsbody.getString("XFB_CD_WL")==null?"":rsbody.getString("XFB_CD_WL");
					 XFB_MJ_WL =rsbody.getString("XFB_MJ_WL")==null?"":rsbody.getString("XFB_MJ_WL");
					 XFB_CDYSNB =rsbody.getString("XFB_CDYSNB")==null?"":rsbody.getString("XFB_CDYSNB");
					 XFB_ZDFSQY =rsbody.getString("XFB_ZDFSQY")==null?"":rsbody.getString("XFB_ZDFSQY");
					 QTBH_CD =rsbody.getString("QTBH_CD")==null?"":rsbody.getString("QTBH_CD");
					 QTBH_MJ =rsbody.getString("QTBH_MJ")==null?"":rsbody.getString("QTBH_MJ");
					 QTBH_FSJS =rsbody.getString("QTBH_FSJS")==null?"":rsbody.getString("QTBH_FSJS");
					 QTBH_BCN =rsbody.getString("QTBH_BCN")==null?"":rsbody.getString("QTBH_BCN");
					 QTBH_BSN =rsbody.getString("QTBH_BSN")==null?"":rsbody.getString("QTBH_BSN");
					 QTBH_CD_WL =rsbody.getString("QTBH_CD_WL")==null?"":rsbody.getString("QTBH_CD_WL");
					 QTBH_MJ_WL =rsbody.getString("QTBH_MJ_WL")==null?"":rsbody.getString("QTBH_MJ_WL");
					 QTBH_CDYSNB =rsbody.getString("QTBH_CDYSNB")==null?"":rsbody.getString("QTBH_CDYSNB");
					 QTBH_ZDFSQY =rsbody.getString("QTBH_ZDFSQY")==null?"":rsbody.getString("QTBH_ZDFSQY");
					 QTBH_FSZB =rsbody.getString("QTBH_FSZB")==null?"":rsbody.getString("QTBH_FSZB");
					 YC_CD =rsbody.getString("YC_CD")==null?"":rsbody.getString("YC_CD");
					 YC_MJ =rsbody.getString("YC_MJ")==null?"":rsbody.getString("YC_MJ");
					 YC_FSJS =rsbody.getString("YC_FSJS")==null?"":rsbody.getString("YC_FSJS");
					 YC_BCN =rsbody.getString("YC_BCN")==null?"":rsbody.getString("YC_BCN");
					 YC_BSN =rsbody.getString("YC_BSN")==null?"":rsbody.getString("YC_BSN");
					 YC_CD_WL =rsbody.getString("YC_CD_WL")==null?"":rsbody.getString("YC_CD_WL");
					 YC_MJ_WL =rsbody.getString("YC_MJ_WL")==null?"":rsbody.getString("YC_MJ_WL");
					 YC_CDYSNB =rsbody.getString("YC_CDYSNB")==null?"":rsbody.getString("YC_CDYSNB");
					 YC_ZDFSQY =rsbody.getString("YC_ZDFSQY")==null?"":rsbody.getString("YC_ZDFSQY");
					 ZZ_CD =rsbody.getString("ZZ_CD")==null?"":rsbody.getString("ZZ_CD");
					 ZZ_MJ =rsbody.getString("ZZ_MJ")==null?"":rsbody.getString("ZZ_MJ");
					 ZZ_FSJS =rsbody.getString("ZZ_FSJS")==null?"":rsbody.getString("ZZ_FSJS");
					 ZZ_BCN =rsbody.getString("ZZ_BCN")==null?"":rsbody.getString("ZZ_BCN");
					 ZZ_BSN =rsbody.getString("ZZ_BSN")==null?"":rsbody.getString("ZZ_BSN");
					 ZZ_CD_WL =rsbody.getString("ZZ_CD_WL")==null?"":rsbody.getString("ZZ_CD_WL");
					 ZZ_MJ_WL =rsbody.getString("ZZ_MJ_WL")==null?"":rsbody.getString("ZZ_MJ_WL");
					 ZZ_CDYSNB =rsbody.getString("ZZ_CDYSNB")==null?"":rsbody.getString("ZZ_CDYSNB");
					 ZZ_ZDFSQY =rsbody.getString("ZZ_ZDFSQY")==null?"":rsbody.getString("ZZ_ZDFSQY");
					 XJC_CD =rsbody.getString("XJC_CD")==null?"":rsbody.getString("XJC_CD");
					 XJC_MJ =rsbody.getString("XJC_MJ")==null?"":rsbody.getString("XJC_MJ");
					 XJC_FSJS =rsbody.getString("XJC_FSJS")==null?"":rsbody.getString("XJC_FSJS");
					 XJC_BCN =rsbody.getString("XJC_BCN")==null?"":rsbody.getString("XJC_BCN");
					 XJC_BSN =rsbody.getString("XJC_BSN")==null?"":rsbody.getString("XJC_BSN");
					 XJC_CD_WL =rsbody.getString("XJC_CD_WL")==null?"":rsbody.getString("XJC_CD_WL");
					 XJC_MJ_WL =rsbody.getString("XJC_MJ_WL")==null?"":rsbody.getString("XJC_MJ_WL");
					 XJC_CDYSNB =rsbody.getString("XJC_CDYSNB")==null?"":rsbody.getString("XJC_CDYSNB");
					 XJC_ZDFSQY =rsbody.getString("XJC_ZDFSQY")==null?"":rsbody.getString("XJC_ZDFSQY");
					 YDNC_CD =rsbody.getString("YDNC_CD")==null?"":rsbody.getString("YDNC_CD");
					 YDNC_MJ =rsbody.getString("YDNC_MJ")==null?"":rsbody.getString("YDNC_MJ");
					 YDNC_FSJS =rsbody.getString("YDNC_FSJS")==null?"":rsbody.getString("YDNC_FSJS");
					 YDNC_BCN =rsbody.getString("YDNC_BCN")==null?"":rsbody.getString("YDNC_BCN");
					 YDNC_BSN =rsbody.getString("YDNC_BSN")==null?"":rsbody.getString("YDNC_BSN");
					 YDNC_CD_WL =rsbody.getString("YDNC_CD_WL")==null?"":rsbody.getString("YDNC_CD_WL");
					 YDNC_MJ_WL =rsbody.getString("YDNC_MJ_WL")==null?"":rsbody.getString("YDNC_MJ_WL");
					 YDNC_CDYSNB =rsbody.getString("YDNC_CDYSNB")==null?"":rsbody.getString("YDNC_CDYSNB");
					 YDNC_ZDFSQY =rsbody.getString("YDNC_ZDFSQY")==null?"":rsbody.getString("YDNC_ZDFSQY");
					 DXHC_CD =rsbody.getString("DXHC_CD")==null?"":rsbody.getString("DXHC_CD");
					 DXHC_MJ =rsbody.getString("DXHC_MJ")==null?"":rsbody.getString("DXHC_MJ");
					 DXHC_FSJS =rsbody.getString("DXHC_FSJS")==null?"":rsbody.getString("DXHC_FSJS");
					 DXHC_BCN =rsbody.getString("DXHC_BCN")==null?"":rsbody.getString("DXHC_BCN");
					 DXHC_BSN =rsbody.getString("DXHC_BSN")==null?"":rsbody.getString("DXHC_BSN");
					 DXHC_CD_WL =rsbody.getString("DXHC_CD_WL")==null?"":rsbody.getString("DXHC_CD_WL");
					 DXHC_MJ_WL =rsbody.getString("DXHC_MJ_WL")==null?"":rsbody.getString("DXHC_MJ_WL");
					 DXHC_CDYSNB =rsbody.getString("DXHC_CDYSNB")==null?"":rsbody.getString("DXHC_CDYSNB");
					 DXHC_ZDFSQY =rsbody.getString("DXHC_ZDFSQY")==null?"":rsbody.getString("DXHC_ZDFSQY");
					 HFS_CD =rsbody.getString("HFS_CD")==null?"":rsbody.getString("HFS_CD");
					 HFS_MJ =rsbody.getString("HFS_MJ")==null?"":rsbody.getString("HFS_MJ");
					 HFS_FSJS =rsbody.getString("HFS_FSJS")==null?"":rsbody.getString("HFS_FSJS");
					 HFS_BCN =rsbody.getString("HFS_BCN")==null?"":rsbody.getString("HFS_BCN");
					 HFS_BSN =rsbody.getString("HFS_BSN")==null?"":rsbody.getString("HFS_BSN");
					 HFS_CD_WL =rsbody.getString("HFS_CD_WL")==null?"":rsbody.getString("HFS_CD_WL");
					 HFS_MJ_WL =rsbody.getString("HFS_MJ_WL")==null?"":rsbody.getString("HFS_MJ_WL");
					 HFS_CDYSNB =rsbody.getString("HFS_CDYSNB")==null?"":rsbody.getString("HFS_CDYSNB");
					 HFS_ZDFSQY =rsbody.getString("HFS_ZDFSQY")==null?"":rsbody.getString("HFS_ZDFSQY");
					 TH_CD =rsbody.getString("TH_CD")==null?"":rsbody.getString("TH_CD");
					 TH_MJ =rsbody.getString("TH_MJ")==null?"":rsbody.getString("TH_MJ");
					 TH_FSJS =rsbody.getString("TH_FSJS")==null?"":rsbody.getString("TH_FSJS");
					 TH_BCN =rsbody.getString("TH_BCN")==null?"":rsbody.getString("TH_BCN");
					 TH_BSN =rsbody.getString("TH_BSN")==null?"":rsbody.getString("TH_BSN");
					 TH_CD_WL =rsbody.getString("TH_CD_WL")==null?"":rsbody.getString("TH_CD_WL");
					 TH_MJ_WL =rsbody.getString("TH_MJ_WL")==null?"":rsbody.getString("TH_MJ_WL");
					 TH_CDYSNB =rsbody.getString("TH_CDYSNB")==null?"":rsbody.getString("TH_CDYSNB");
					 TH_ZDFSQY =rsbody.getString("TH_ZDFSQY")==null?"":rsbody.getString("TH_ZDFSQY");
					 MYF_CD =rsbody.getString("MYF_CD")==null?"":rsbody.getString("MYF_CD");
					 MYF_MJ =rsbody.getString("MYF_MJ")==null?"":rsbody.getString("MYF_MJ");
					 MYF_FSJS =rsbody.getString("MYF_FSJS")==null?"":rsbody.getString("MYF_FSJS");
					 MYF_BCN =rsbody.getString("MYF_BCN")==null?"":rsbody.getString("MYF_BCN");
					 MYF_BSN =rsbody.getString("MYF_BSN")==null?"":rsbody.getString("MYF_BSN");
					 MYF_CD_WL =rsbody.getString("MYF_CD_WL")==null?"":rsbody.getString("MYF_CD_WL");
					 MYF_MJ_WL =rsbody.getString("MYF_MJ_WL")==null?"":rsbody.getString("MYF_MJ_WL");
					 MYF_CDYSNB =rsbody.getString("MYF_CDYSNB")==null?"":rsbody.getString("MYF_CDYSNB");
					 MYF_ZDFSQY =rsbody.getString("MYF_ZDFSQY")==null?"":rsbody.getString("MYF_ZDFSQY");
					 MJF_CD =rsbody.getString("MJF_CD")==null?"":rsbody.getString("MJF_CD");
					 MJF_MJ =rsbody.getString("MJF_MJ")==null?"":rsbody.getString("MJF_MJ");
					 MJF_FSJS =rsbody.getString("MJF_FSJS")==null?"":rsbody.getString("MJF_FSJS");
					 MJF_BCN =rsbody.getString("MJF_BCN")==null?"":rsbody.getString("MJF_BCN");
					 MJF_BSN =rsbody.getString("MJF_BSN")==null?"":rsbody.getString("MJF_BSN");
					 MJF_CD_WL =rsbody.getString("MJF_CD_WL")==null?"":rsbody.getString("MJF_CD_WL");
					 MJF_MJ_WL =rsbody.getString("MJF_MJ_WL")==null?"":rsbody.getString("MJF_MJ_WL");
					 MJF_CDYSNB =rsbody.getString("MJF_CDYSNB")==null?"":rsbody.getString("MJF_CDYSNB");
					 MJF_ZDFSQY =rsbody.getString("MJF_ZDFSQY")==null?"":rsbody.getString("MJF_ZDFSQY");
					 QTHC_CD =rsbody.getString("QTHC_CD")==null?"":rsbody.getString("QTHC_CD");
					 QTHC_MJ =rsbody.getString("QTHC_MJ")==null?"":rsbody.getString("QTHC_MJ");
					 QTHC_FSJS =rsbody.getString("QTHC_FSJS")==null?"":rsbody.getString("QTHC_FSJS");
					 QTHC_BCN =rsbody.getString("QTHC_BCN")==null?"":rsbody.getString("QTHC_BCN");
					 QTHC_BSN =rsbody.getString("QTHC_BSN")==null?"":rsbody.getString("QTHC_BSN");
					 QTHC_CD_WL =rsbody.getString("QTHC_CD_WL")==null?"":rsbody.getString("QTHC_CD_WL");
					 QTHC_MJ_WL =rsbody.getString("QTHC_MJ_WL")==null?"":rsbody.getString("QTHC_MJ_WL");
					 QTHC_CDYSNB =rsbody.getString("QTHC_CDYSNB")==null?"":rsbody.getString("QTHC_CDYSNB");
					 QTHC_ZDFSQY =rsbody.getString("QTHC_ZDFSQY")==null?"":rsbody.getString("QTHC_ZDFSQY");
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
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td colspan=5 rowspan=1
					style="text-align:center;font-size=30;width: ;height: "><b>小麦病虫害中后期趋势预报因子与预测结果统计表(<%=rwsj%>)
				</b><br> <br></td>
			</tr>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">测报站点：<%=usebmmc%><input
					name="BMBM" type="hidden" value="<%=usebm%>" /></td>
				<td style="padding-left: 100px;padding-right: 100px;">调查时间：<label><%=DCRQ%></label></td>
				<td style="padding-left: 100px;padding-right: 100px;">单位：万亩</td>
			</tr>
		</table>
		<table border=1 borderColorDark=black borderColorLight=white
			cellpadding=1 cellspacing=1 align=center id=zg name=zg>
			<tbody id="zg_head">
				<tr>
					<td colspan=3 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>冬麦种植面积（万亩）</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>春麦种植面积（万亩）</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>一类苗面积比率(%)</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>二类苗面积比率(%)</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>三类苗面积比率(%)</b></td>
					<td colspan=2 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>总体苗情与常年比较</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>长势</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>主栽品种抗病虫性</b></td>
				</tr>
				<tr>
				<td colspan=3 rowspan=1><label><%=MD_ZZMJ%></label></td>
				<td><label><%=CM_ZZMJ%></label></td>
				<td><label><%=YLM_MJBL%></label></td>
				<td><label><%=ELM_MJBL%></label></td>
				<td><label><%=SLM_MJBL%></label></td>
				<td colspan=2 rowspan=1><label><%=ZTMQYCNBJ%></label></td>
				<td><label><%=ZS%></label></td>
				<td><label><%=ZZPZKCX%></label></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>病虫名称</b></td>
					<td colspan=6 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>当前发生情况</b></td>
					<td colspan=4 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>未来发生</b></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>程度</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>面积</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>发生指标</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>发生基数</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>比常年±%</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>比上年±%</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>程度</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>面积</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>程度与上年比±</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>重点发生区域</b></td>
				</tr>
			</tbody>
			<tbody id="zg_body">
				<tr>
					<td style="text-align: center;">条锈病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=TXB_MJ%></label></td>
					<td style="text-align: center;">病叶率（%）</td>
					<td><label><%=TXB_FSJS%></label></td>
					<td><label><%=TXB_BCN%></label></td>
					<td><label><%=TXB_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=TXB_MJ_WL%></label></td>
					<td><label><%=TXB_CDYSNB%></label></td>
					<td><label><%=TXB_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">白粉病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=BFB_MJ%></label></td>
					<td style="text-align: center;">病叶率（%）</td>
					<td><label><%=BFB_FSJS%></label></td>
					<td><label><%=BFB_BCN%></label></td>
					<td><label><%=BFB_BSN%></label></td>
					<td><label><%=BFB_CD_WL%>级</label></td>
					<td><label><%=BFB_MJ_WL%></label></td>
					<td><label><%=BFB_CDYSNB%></label></td>
					<td><label><%=BFB_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">纹枯病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=WKB_MJ%></label></td>
					<td style="text-align: center;">病叶率（%）</td>
					<td><label><%=WKB_FSJS%></label></td>
					<td><label><%=WKB_BCN%></label></td>
					<td><label><%=WKB_BSN%></label></td>
					<td><label><%=WKB_CD_WL%>级</label></td>
					<td><label><%=WKB_MJ_WL%></label></td>
					<td><label><%=WKB_CDYSNB%></label></td>
					<td><label><%=WKB_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">赤霉病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=CMB_MJ%></label></td>
					<td style="text-align: center;">病叶率（%）</td>
					<td><label><%=CMB_FSJS%></label></td>
					<td><label><%=CMB_BCN%></label></td>
					<td><label><%=CMB_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=CMB_MJ_WL%></label></td>
					<td><label><%=CMB_CDYSNB%></label></td>
					<td><label><%=CMB_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">叶锈病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=YXB_MJ%></label></td>
					<td style="text-align: center;">病叶率（%）</td>
					<td><label><%=YXB_FSJS%></label></td>
					<td><label><%=YXB_BCN%></label></td>
					<td><label><%=YXB_BSN%></label></td>
					<td><label><%=YXB_CD_WL%>级</label></td>
					<td><label><%=YXB_MJ_WL%></label></td>
					<td><label><%=YXB_CDYSNB%></label></td>
					<td><label><%=YXB_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">黑穗病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=HSB_MJ%></label></td>
					<td style="text-align: center;">病叶率（%）</td>
					<td><label><%=HSB_FSJS%></label></td>
					<td><label><%=HSB_BCN%></label></td>
					<td><label><%=HSB_BSN%></label></td>
					<td><label><%=HSB_CD_WL%>级</label></td>
					<td><label><%=HSB_MJ_WL%></label></td>
					<td><label><%=HSB_CDYSNB%></label></td>
					<td><label><%=HSB_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">病毒病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=BBB_MJ%></label></td>
					<td style="text-align: center;">病叶率（%）</td>
					<td><label><%=BBB_FSJS%></label></td>
					<td><label><%=BBB_BCN%></label></td>
					<td><label><%=BBB_BSN%></label></td>
					<td><label><%=BBB_CD_WL%>级</label></td>
					<td><label><%=BBB_MJ_WL%></label></td>
					<td><label><%=BBB_CDYSNB%></label></td>
					<td><label><%=BBB_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">全蚀病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=QSB_MJ%></label></td>
					<td style="text-align: center;">病叶率（%）</td>
					<td><label><%=QSB_FSJS%></label></td>
					<td><label><%=QSB_BCN%></label></td>
					<td><label><%=QSB_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=QSB_MJ_WL%></label></td>
					<td><label><%=QSB_CDYSNB%></label></td>
					<td><label><%=QSB_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">根腐病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=GFB_MJ%></label></td>
					<td style="text-align: center;">病叶率（%）</td>
					<td><label><%=GFB_FSJS%></label></td>
					<td><label><%=GFB_BCN%></label></td>
					<td><label><%=GFB_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=GFB_MJ_WL%></label></td>
					<td><label><%=GFB_CDYSNB%></label></td>
					<td><label><%=GFB_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">叶枯病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=YKB_MJ%></label></td>
					<td style="text-align: center;">病叶率（%）</td>
					<td><label><%=YKB_FSJS%></label></td>
					<td><label><%=YKB_BCN%></label></td>
					<td><label><%=YKB_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=YKB_MJ_WL%></label></td>
					<td><label><%=YKB_CDYSNB%></label></td>
					<td><label><%=YKB_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">线虫病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=XCB_MJ%></label></td>
					<td style="text-align: center;">病叶率（%）</td>
					<td><label><%=XCB_FSJS%></label></td>
					<td><label><%=XCB_BCN%></label></td>
					<td><label><%=XCB_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=XCB_MJ_WL%></label></td>
					<td><label><%=XCB_CDYSNB%></label></td>
					<td><label><%=XCB_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">雪腐病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=XFB_MJ%></label></td>
					<td style="text-align: center;">病叶率（%）</td>
					<td><label><%=XFB_FSJS%></label></td>
					<td><label><%=XFB_BCN%></label></td>
					<td><label><%=XFB_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=XFB_MJ_WL%></label></td>
					<td><label><%=XFB_CDYSNB%></label></td>
					<td><label><%=XFB_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">其他病害</td>
					<td style="text-align: center;">\</td>
					<td><label><%=QTBH_MJ%></label></td>
					<td><label><%=QTBH_FSZB%></label></td>
					<td><label><%=QTBH_FSJS%></label></td>
					<td><label><%=QTBH_BCN%></label></td>
					<td><label><%=QTBH_BSN%></label></td>
					<td><label><%=QTBH_CD_WL%>级</label></td>
					<td><label><%=QTBH_MJ_WL%></label></td>
					<td><label><%=QTBH_CDYSNB%></label></td>
					<td><label><%=QTBH_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">蚜虫</td>
					<td><label><%=YC_CD%>级</label></td>
					<td><label><%=YC_MJ%></label></td>
					<td style="text-align: center;">百株虫量（头/百株）</td>
					<td><label><%=YC_FSJS%></label></td>
					<td><label><%=YC_BCN%></label></td>
					<td><label><%=YC_BSN%></label></td>
					<td><label><%=YC_CD_WL%>级</label></td>
					<td><label><%=YC_MJ_WL%></label></td>
					<td><label><%=YC_CDYSNB%></label></td>
					<td><label><%=YC_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">蜘蛛</td>
					<td style="text-align: center;">\</td>
					<td><label><%=ZZ_MJ%></label></td>
					<td style="text-align: center;">每尺单行虫量（头/尺/行）</td>
					<td><label><%=ZZ_FSJS%></label></td>
					<td><label><%=ZZ_BCN%></label></td>
					<td><label><%=ZZ_BSN%></label></td>
					<td><label><%=ZZ_CD_WL%>级</label></td>
					<td><label><%=ZZ_MJ_WL%></label></td>
					<td><label><%=ZZ_CDYSNB%></label></td>
					<td><label><%=ZZ_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">吸浆虫</td>
					<td><label><%=XJC_CD%>级</label></td>
					<td><label><%=XJC_MJ%></label></td>
					<td style="text-align: center;">每小方虫量（头/小方）</td>
					<td><label><%=XJC_FSJS%></label></td>
					<td><label><%=XJC_BCN%></label></td>
					<td><label><%=XJC_BSN%></label></td>
					<td><label><%=XJC_CD_WL%>级</label></td>
					<td><label><%=XJC_MJ_WL%></label></td>
					<td><label><%=XJC_CDYSNB%></label></td>
					<td><label><%=XJC_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">一代粘虫</td>
					<td style="text-align: center;">\</td>
					<td><label><%=YDNC_MJ%></label></td>
					<td style="text-align: center;">每平方米虫量（头/m2）</td>
					<td><label><%=YDNC_FSJS%></label></td>
					<td><label><%=YDNC_BCN%></label></td>
					<td><label><%=YDNC_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=YDNC_MJ_WL%></label></td>
					<td><label><%=YDNC_CDYSNB%></label></td>
					<td><label><%=YDNC_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">地下害虫</td>
					<td><label><%=DXHC_CD%>级</label></td>
					<td><label><%=DXHC_MJ%></label></td>
					<td style="text-align: center;">被害株率（%）</td>
					<td><label><%=DXHC_FSJS%></label></td>
					<td><label><%=DXHC_BCN%></label></td>
					<td><label><%=DXHC_BSN%></label></td>
					<td><label><%=DXHC_CD_WL%>级</label></td>
					<td><label><%=DXHC_MJ_WL%></label></td>
					<td><label><%=DXHC_CDYSNB%></label></td>
					<td><label><%=DXHC_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">灰飞虱</td>
					<td style="text-align: center;">\</td>
					<td><label><%=HFS_MJ%></label></td>
					<td style="text-align: center;">亩虫量(万头/亩)</td>
					<td><label><%=HFS_FSJS%></label></td>
					<td><label><%=HFS_BCN%></label></td>
					<td><label><%=HFS_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=HFS_MJ_WL%></label></td>
					<td><label><%=HFS_CDYSNB%></label></td>
					<td><label><%=HFS_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">土蝗</td>
					<td style="text-align: center;">\</td>
					<td><label><%=TH_MJ%></label></td>
					<td style="text-align: center;">每平方米虫量（头/m2）</td>
					<td><label><%=TH_FSJS%></label></td>
					<td><label><%=TH_BCN%></label></td>
					<td><label><%=TH_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=TH_MJ_WL%></label></td>
					<td><label><%=TH_CDYSNB%></label></td>
					<td><label><%=TH_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">麦叶蜂</td>
					<td style="text-align: center;">\</td>
					<td><label><%=MYF_MJ%></label></td>
					<td style="text-align: center;">每平方米虫量（头/m2）</td>
					<td><label><%=MYF_FSJS%></label></td>
					<td><label><%=MYF_BCN%></label></td>
					<td><label><%=MYF_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=MYF_MJ_WL%></label></td>
					<td><label><%=MYF_CDYSNB%></label></td>
					<td><label><%=MYF_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">麦茎蜂</td>
					<td style="text-align: center;">\</td>
					<td><label><%=MJF_MJ%></label></td>
					<td style="text-align: center;">被害株率（%）</td>
					<td><label><%=MJF_FSJS%></label></td>
					<td><label><%=MJF_BCN%></label></td>
					<td><label><%=MJF_BSN%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=MJF_MJ_WL%></label></td>
					<td><label><%=MJF_CDYSNB%></label></td>
					<td><label><%=MJF_ZDFSQY%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">其他害虫</td>
					<td style="text-align: center;">\</td>
					<td><label><%=QTHC_MJ%></label></td>
					<td><label><%=QTHC_FSZB%></label></td>
					<td><label><%=QTHC_FSJS%></label></td>
					<td><label><%=QTHC_BCN%></label></td>
					<td><label><%=QTHC_BSN%></label></td>
					<td><label><%=QTHC_CD_WL%>级</label></td>
					<td><label><%=QTHC_MJ_WL%></label></td>
					<td><label><%=QTHC_CDYSNB%></label></td>
					<td><label><%=QTHC_ZDFSQY%></label></td>
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
		xzsel('BFB_CD_WL','<%=BFB_CD_WL%>');
		xzsel('WKB_CD_WL','<%=WKB_CD_WL%>');
		xzsel('YXB_CD_WL','<%=YXB_CD_WL%>');
		xzsel('HSB_CD_WL','<%=HSB_CD_WL%>');
		xzsel('BBB_CD_WL','<%=BBB_CD_WL%>');
		xzsel('QTBH_CD_WL','<%=QTBH_CD_WL%>');
		xzsel('YC_CD','<%=YC_CD%>');
		xzsel('YC_CD_WL','<%=YC_CD_WL%>');
		xzsel('ZZ_CD_WL','<%=ZZ_CD_WL%>');
		xzsel('XJC_CD','<%=XJC_CD%>');
		xzsel('XJC_CD_WL','<%=XJC_CD_WL%>');
		xzsel('DXHC_CD','<%=DXHC_CD%>');
		xzsel('DXHC_CD_WL','<%=DXHC_CD_WL%>');
		xzsel('QTHC_CD_WL','<%=QTHC_CD_WL%>');
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