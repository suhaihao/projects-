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
		String LRRQ = "";
		String LRRY = "";
		String RWSJ = "";
		String DCRQ = "";
			ExecuteConnection ecbody = new ExecuteConnection();
			PreparedStatement pstmtbody = null;
			ResultSet rsbody = null;
			try {
				String sql = "select "
						 +"sum(MD_ZZMJ) MD_ZZMJ,"
					        +"sum(CM_ZZMJ) CM_ZZMJ,"
					        +"sum(YLM_MJBL) YLM_MJBL,"
					        +"sum(ELM_MJBL) ELM_MJBL,"
					        +"sum(SLM_MJBL) SLM_MJBL,"
					        +"sum(TXB_MJ) TXB_MJ,"
					        +"sum(BFB_MJ) BFB_MJ,"
					        +"sum(WKB_MJ) WKB_MJ,"
					        +"sum(CMB_MJ) CMB_MJ,"
					        +"sum(YXB_MJ) YXB_MJ,"
					        +"sum(HSB_MJ) HSB_MJ,"
					        +"sum(BBB_MJ) BBB_MJ,"
					        +"sum(QSB_MJ) QSB_MJ,"
					        +"sum(GFB_MJ) GFB_MJ,"
					        +"sum(YKB_MJ) YKB_MJ,"
					        +"sum(XCB_MJ) XCB_MJ,"
					        +"sum(XFB_MJ) XFB_MJ,"
					        +"sum(QTBH_MJ) QTBH_MJ,"
					        +"sum(YC_MJ) YC_MJ,"
					        +"sum(ZZ_MJ) ZZ_MJ,"
					        +"sum(XJC_MJ) XJC_MJ,"
					        +"sum(YDNC_MJ) YDNC_MJ,"
					        +"sum(DXHC_MJ) DXHC_MJ,"
					        +"sum(HFS_MJ) HFS_MJ,"
					        +"sum(TH_MJ) TH_MJ,"
					        +"sum(MYF_MJ) MYF_MJ,"
					        +"sum(MJF_MJ) MJF_MJ,"
					        +"sum(QTHC_MJ) QTHC_MJ,"
					        +"trunc(avg(TXB_FSJS),2) TXB_FSJS,"
					        +"trunc(avg(BFB_FSJS),2) BFB_FSJS,"
					        +"trunc(avg(WKB_FSJS),2) WKB_FSJS,"
					        +"trunc(avg(CMB_FSJS),2) CMB_FSJS,"
					        +"trunc(avg(YXB_FSJS),2) YXB_FSJS,"
					        +"trunc(avg(HSB_FSJS),2) HSB_FSJS,"
					        +"trunc(avg(BBB_FSJS),2) BBB_FSJS,"
					        +"trunc(avg(QSB_FSJS),2) QSB_FSJS,"
					        +"trunc(avg(GFB_FSJS),2) GFB_FSJS,"
					        +"trunc(avg(YKB_FSJS),2) YKB_FSJS,"
					        +"trunc(avg(XCB_FSJS),2) XCB_FSJS,"
					        +"trunc(avg(XFB_FSJS),2) XFB_FSJS,"
					        +"trunc(avg(QTBH_FSJS),2) QTBH_FSJS,"
					        +"trunc(avg(YC_FSJS),2) YC_FSJS,"
					        +"trunc(avg(ZZ_FSJS),2) ZZ_FSJS,"
					        +"trunc(avg(XJC_FSJS),2) XJC_FSJS,"
					        +"trunc(avg(YDNC_FSJS),2) YDNC_FSJS,"
					        +"trunc(avg(DXHC_FSJS),2) DXHC_FSJS,"
					        +"trunc(avg(HFS_FSJS),2) HFS_FSJS,"
					        +"trunc(avg(TH_FSJS),2) TH_FSJS,"
					        +"trunc(avg(MYF_FSJS),2) MYF_FSJS,"
					        +"trunc(avg(MJF_FSJS),2) MJF_FSJS,"
					        +"trunc(avg(QTHC_FSJS),2) QTHC_FSJS,"
					        +"sum(BFB_MJ_WL) BFB_MJ_WL,"
					        +"sum(WKB_MJ_WL) WKB_MJ_WL,"
					        +"sum(CMB_MJ_WL) CMB_MJ_WL,"
					        +"sum(YXB_MJ_WL) YXB_MJ_WL,"
					        +"sum(HSB_MJ_WL) HSB_MJ_WL,"
					        +"sum(BBB_MJ_WL) BBB_MJ_WL,"
					        +"sum(QSB_MJ_WL) QSB_MJ_WL,"
					        +"sum(GFB_MJ_WL) GFB_MJ_WL,"
					        +"sum(YKB_MJ_WL) YKB_MJ_WL,"
					        +"sum(XCB_MJ_WL) XCB_MJ_WL,"
					        +"sum(XFB_MJ_WL) XFB_MJ_WL,"
					        +"sum(QTBH_MJ_WL) QTBH_MJ_WL,"
					        +"sum(YC_MJ_WL) YC_MJ_WL,"
					        +"sum(ZZ_MJ_WL) ZZ_MJ_WL,"
					        +"sum(XJC_MJ_WL) XJC_MJ_WL,"
					        +"sum(YDNC_MJ_WL) YDNC_MJ_WL,"
					        +"sum(DXHC_MJ_WL) DXHC_MJ_WL,"
					        +"sum(HFS_MJ_WL) HFS_MJ_WL,"
					        +"sum(TH_MJ_WL) TH_MJ_WL,"
					        +"sum(MYF_MJ_WL) MYF_MJ_WL,"
					        +"sum(MJF_MJ_WL) MJF_MJ_WL,"
					        +"sum(QTHC_MJ_WL) QTHC_MJ_WL"
					    	+" from D007 "
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
					 MD_ZZMJ =rsbody.getString("MD_ZZMJ")==null?"":rsbody.getString("MD_ZZMJ");
					 CM_ZZMJ =rsbody.getString("CM_ZZMJ")==null?"":rsbody.getString("CM_ZZMJ");
					 YLM_MJBL =rsbody.getString("YLM_MJBL")==null?"":rsbody.getString("YLM_MJBL");
					 ELM_MJBL =rsbody.getString("ELM_MJBL")==null?"":rsbody.getString("ELM_MJBL");
					 SLM_MJBL =rsbody.getString("SLM_MJBL")==null?"":rsbody.getString("SLM_MJBL");
					 TXB_MJ =rsbody.getString("TXB_MJ")==null?"":rsbody.getString("TXB_MJ");
					 TXB_FSJS =rsbody.getString("TXB_FSJS")==null?"":rsbody.getString("TXB_FSJS");
					 BFB_MJ =rsbody.getString("BFB_MJ")==null?"":rsbody.getString("BFB_MJ");
					 BFB_FSJS =rsbody.getString("BFB_FSJS")==null?"":rsbody.getString("BFB_FSJS");
					 BFB_MJ_WL =rsbody.getString("BFB_MJ_WL")==null?"":rsbody.getString("BFB_MJ_WL");
					 WKB_MJ =rsbody.getString("WKB_MJ")==null?"":rsbody.getString("WKB_MJ");
					 WKB_FSJS =rsbody.getString("WKB_FSJS")==null?"":rsbody.getString("WKB_FSJS");
					 WKB_MJ_WL =rsbody.getString("WKB_MJ_WL")==null?"":rsbody.getString("WKB_MJ_WL");
					 CMB_MJ =rsbody.getString("CMB_MJ")==null?"":rsbody.getString("CMB_MJ");
					 CMB_FSJS =rsbody.getString("CMB_FSJS")==null?"":rsbody.getString("CMB_FSJS");
					 CMB_MJ_WL =rsbody.getString("CMB_MJ_WL")==null?"":rsbody.getString("CMB_MJ_WL");
					 YXB_MJ =rsbody.getString("YXB_MJ")==null?"":rsbody.getString("YXB_MJ");
					 YXB_FSJS =rsbody.getString("YXB_FSJS")==null?"":rsbody.getString("YXB_FSJS");
					 YXB_MJ_WL =rsbody.getString("YXB_MJ_WL")==null?"":rsbody.getString("YXB_MJ_WL");
					 HSB_MJ =rsbody.getString("HSB_MJ")==null?"":rsbody.getString("HSB_MJ");
					 HSB_FSJS =rsbody.getString("HSB_FSJS")==null?"":rsbody.getString("HSB_FSJS");
					 HSB_MJ_WL =rsbody.getString("HSB_MJ_WL")==null?"":rsbody.getString("HSB_MJ_WL");
					 BBB_MJ =rsbody.getString("BBB_MJ")==null?"":rsbody.getString("BBB_MJ");
					 BBB_FSJS =rsbody.getString("BBB_FSJS")==null?"":rsbody.getString("BBB_FSJS");
					 BBB_MJ_WL =rsbody.getString("BBB_MJ_WL")==null?"":rsbody.getString("BBB_MJ_WL");
					 QSB_MJ =rsbody.getString("QSB_MJ")==null?"":rsbody.getString("QSB_MJ");
					 QSB_FSJS =rsbody.getString("QSB_FSJS")==null?"":rsbody.getString("QSB_FSJS");
					 QSB_MJ_WL =rsbody.getString("QSB_MJ_WL")==null?"":rsbody.getString("QSB_MJ_WL");
					 GFB_MJ =rsbody.getString("GFB_MJ")==null?"":rsbody.getString("GFB_MJ");
					 GFB_FSJS =rsbody.getString("GFB_FSJS")==null?"":rsbody.getString("GFB_FSJS");
					 GFB_MJ_WL =rsbody.getString("GFB_MJ_WL")==null?"":rsbody.getString("GFB_MJ_WL");
					 YKB_MJ =rsbody.getString("YKB_MJ")==null?"":rsbody.getString("YKB_MJ");
					 YKB_FSJS =rsbody.getString("YKB_FSJS")==null?"":rsbody.getString("YKB_FSJS");
					 YKB_MJ_WL =rsbody.getString("YKB_MJ_WL")==null?"":rsbody.getString("YKB_MJ_WL");
					 XCB_MJ =rsbody.getString("XCB_MJ")==null?"":rsbody.getString("XCB_MJ");
					 XCB_FSJS =rsbody.getString("XCB_FSJS")==null?"":rsbody.getString("XCB_FSJS");
					 XCB_MJ_WL =rsbody.getString("XCB_MJ_WL")==null?"":rsbody.getString("XCB_MJ_WL");
					 XFB_MJ =rsbody.getString("XFB_MJ")==null?"":rsbody.getString("XFB_MJ");
					 XFB_FSJS =rsbody.getString("XFB_FSJS")==null?"":rsbody.getString("XFB_FSJS");
					 XFB_MJ_WL =rsbody.getString("XFB_MJ_WL")==null?"":rsbody.getString("XFB_MJ_WL");
					 QTBH_MJ =rsbody.getString("QTBH_MJ")==null?"":rsbody.getString("QTBH_MJ");
					 QTBH_FSJS =rsbody.getString("QTBH_FSJS")==null?"":rsbody.getString("QTBH_FSJS");
					 QTBH_MJ_WL =rsbody.getString("QTBH_MJ_WL")==null?"":rsbody.getString("QTBH_MJ_WL");
					 YC_MJ =rsbody.getString("YC_MJ")==null?"":rsbody.getString("YC_MJ");
					 YC_FSJS =rsbody.getString("YC_FSJS")==null?"":rsbody.getString("YC_FSJS");
					 YC_MJ_WL =rsbody.getString("YC_MJ_WL")==null?"":rsbody.getString("YC_MJ_WL");
					 ZZ_MJ =rsbody.getString("ZZ_MJ")==null?"":rsbody.getString("ZZ_MJ");
					 ZZ_FSJS =rsbody.getString("ZZ_FSJS")==null?"":rsbody.getString("ZZ_FSJS");
					 ZZ_MJ_WL =rsbody.getString("ZZ_MJ_WL")==null?"":rsbody.getString("ZZ_MJ_WL");
					 XJC_MJ =rsbody.getString("XJC_MJ")==null?"":rsbody.getString("XJC_MJ");
					 XJC_FSJS =rsbody.getString("XJC_FSJS")==null?"":rsbody.getString("XJC_FSJS");
					 XJC_MJ_WL =rsbody.getString("XJC_MJ_WL")==null?"":rsbody.getString("XJC_MJ_WL");
					 YDNC_MJ =rsbody.getString("YDNC_MJ")==null?"":rsbody.getString("YDNC_MJ");
					 YDNC_FSJS =rsbody.getString("YDNC_FSJS")==null?"":rsbody.getString("YDNC_FSJS");
					 YDNC_MJ_WL =rsbody.getString("YDNC_MJ_WL")==null?"":rsbody.getString("YDNC_MJ_WL");
					 DXHC_MJ =rsbody.getString("DXHC_MJ")==null?"":rsbody.getString("DXHC_MJ");
					 DXHC_FSJS =rsbody.getString("DXHC_FSJS")==null?"":rsbody.getString("DXHC_FSJS");
					 DXHC_MJ_WL =rsbody.getString("DXHC_MJ_WL")==null?"":rsbody.getString("DXHC_MJ_WL");
					 HFS_MJ =rsbody.getString("HFS_MJ")==null?"":rsbody.getString("HFS_MJ");
					 HFS_FSJS =rsbody.getString("HFS_FSJS")==null?"":rsbody.getString("HFS_FSJS");
					 HFS_MJ_WL =rsbody.getString("HFS_MJ_WL")==null?"":rsbody.getString("HFS_MJ_WL");
					 TH_MJ =rsbody.getString("TH_MJ")==null?"":rsbody.getString("TH_MJ");
					 TH_FSJS =rsbody.getString("TH_FSJS")==null?"":rsbody.getString("TH_FSJS");
					 TH_MJ_WL =rsbody.getString("TH_MJ_WL")==null?"":rsbody.getString("TH_MJ_WL");
					 MYF_MJ =rsbody.getString("MYF_MJ")==null?"":rsbody.getString("MYF_MJ");
					 MYF_FSJS =rsbody.getString("MYF_FSJS")==null?"":rsbody.getString("MYF_FSJS");
					 MYF_MJ_WL =rsbody.getString("MYF_MJ_WL")==null?"":rsbody.getString("MYF_MJ_WL");
					 MJF_MJ =rsbody.getString("MJF_MJ")==null?"":rsbody.getString("MJF_MJ");
					 MJF_FSJS =rsbody.getString("MJF_FSJS")==null?"":rsbody.getString("MJF_FSJS");
					 MJF_MJ_WL =rsbody.getString("MJF_MJ_WL")==null?"":rsbody.getString("MJF_MJ_WL");
					 QTHC_MJ =rsbody.getString("QTHC_MJ")==null?"":rsbody.getString("QTHC_MJ");
					 QTHC_FSJS =rsbody.getString("QTHC_FSJS")==null?"":rsbody.getString("QTHC_FSJS");
					 QTHC_MJ_WL =rsbody.getString("QTHC_MJ_WL")==null?"":rsbody.getString("QTHC_MJ_WL");
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
					style="text-align:center;font-size=30;width: ;height: "><b>С�󲡳溦���������Ԥ��������Ԥ����ͳ�Ʊ�
				</b><br> <br></td>
			</tr>
			<tr>
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
					<td colspan=1 rowspan=2><label><%=TXB_CD_WL%></label></td>
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
					<td><label><%=BFB_CD_WL%></label></td>
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
					<td><label><%=WKB_CD_WL%></label></td>
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
					<td><label><%=YXB_CD_WL%></label></td>
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
					<td><label><%=HSB_CD_WL%></label></td>
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
					<td><label><%=BBB_CD_WL%></label></td>
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
					<td><label><%=QTBH_CD_WL%></label></td>
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
					<td><label><%=YC_CD_WL%></label></td>
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
					<td><label><%=ZZ_CD_WL%></label></td>
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
					<td><label><%=XJC_CD_WL%></label></td>
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
					<td><label><%=DXHC_CD_WL%></label></td>
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
					<td><label><%=QTHC_CD_WL%></label></td>
					<td><label><%=QTHC_MJ_WL%></label></td>
					<td><label><%=QTHC_CDYSNB%></label></td>
					<td><label><%=QTHC_ZDFSQY%></label></td>
					<td><label><%=QTHC_LXSQ%></label></td>
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