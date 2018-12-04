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
		String YDYMM_FSCD = "";
		String YDYMM_FSMJ = "";
		String YDYMM_FZMJ = "";
		String YDYMM_SJSS = "";
		String YDYMM_WHSS = "";
		String YDYMM_FSQY = "";
		String YDYMM_FSSQ = "";
		String YDYMM_BZ = "";
		String EDYMM_FSCD = "";
		String EDYMM_FSMJ = "";
		String EDYMM_FZMJ = "";
		String EDYMM_SJSS = "";
		String EDYMM_WHSS = "";
		String EDYMM_FSQY = "";
		String EDYMM_FSSQ = "";
		String EDYMM_BZ = "";
		String SDYMM_FSCD = "";
		String SDYMM_FSMJ = "";
		String SDYMM_FZMJ = "";
		String SDYMM_SJSS = "";
		String SDYMM_WHSS = "";
		String SDYMM_FSQY = "";
		String SDYMM_FSSQ = "";
		String SDYMM_BZ = "";
		String EDWYE_FSCD = "";
		String EDWYE_FSMJ = "";
		String EDWYE_FZMJ = "";
		String EDWYE_SJSS = "";
		String EDWYE_WHSS = "";
		String EDWYE_FSQY = "";
		String EDWYE_FSSQ = "";
		String EDWYE_BZ = "";
		String EDNC_FSCD = "";
		String EDNC_FSMJ = "";
		String EDNC_FZMJ = "";
		String EDNC_SJSS = "";
		String EDNC_WHSS = "";
		String EDNC_FSQY = "";
		String EDNC_FSSQ = "";
		String EDNC_BZ = "";
		String SDNC_FSCD = "";
		String SDNC_FSMJ = "";
		String SDNC_FZMJ = "";
		String SDNC_SJSS = "";
		String SDNC_WHSS = "";
		String SDNC_FSQY = "";
		String SDNC_FSSQ = "";
		String SDNC_BZ = "";
		String EDMLC_FSCD = "";
		String EDMLC_FSMJ = "";
		String EDMLC_FZMJ = "";
		String EDMLC_SJSS = "";
		String EDMLC_WHSS = "";
		String EDMLC_FSQY = "";
		String EDMLC_FSSQ = "";
		String EDMLC_BZ = "";
		String SDMLC_FSCD = "";
		String SDMLC_FSMJ = "";
		String SDMLC_FZMJ = "";
		String SDMLC_SJSS = "";
		String SDMLC_WHSS = "";
		String SDMLC_FSQY = "";
		String SDMLC_FSSQ = "";
		String SDMLC_BZ = "";
		String FDMLC_FSCD = "";
		String FDMLC_FSMJ = "";
		String FDMLC_FZMJ = "";
		String FDMLC_SJSS = "";
		String FDMLC_WHSS = "";
		String FDMLC_FSQY = "";
		String FDMLC_FSSQ = "";
		String FDMLC_BZ = "";
		String CDM_FSCD = "";
		String CDM_FSMJ = "";
		String CDM_FZMJ = "";
		String CDM_SJSS = "";
		String CDM_WHSS = "";
		String CDM_FSQY = "";
		String CDM_FSSQ = "";
		String CDM_BZ = "";
		String YC_FSCD = "";
		String YC_FSMJ = "";
		String YC_FZMJ = "";
		String YC_SJSS = "";
		String YC_WHSS = "";
		String YC_FSQY = "";
		String YC_FSSQ = "";
		String YC_BZ = "";
		String JM_FSCD = "";
		String JM_FSMJ = "";
		String JM_FZMJ = "";
		String JM_SJSS = "";
		String JM_WHSS = "";
		String JM_FSQY = "";
		String JM_FSSQ = "";
		String JM_BZ = "";
		String YM_FSCD = "";
		String YM_FSMJ = "";
		String YM_FZMJ = "";
		String YM_SJSS = "";
		String YM_WHSS = "";
		String YM_FSQY = "";
		String YM_FSSQ = "";
		String YM_BZ = "";
		String SBYJC_FSCD = "";
		String SBYJC_FSMJ = "";
		String SBYJC_FZMJ = "";
		String SBYJC_SJSS = "";
		String SBYJC_WHSS = "";
		String SBYJC_FSQY = "";
		String SBYJC_FSSQ = "";
		String SBYJC_BZ = "";
		String TH_FSCD = "";
		String TH_FSMJ = "";
		String TH_FZMJ = "";
		String TH_SJSS = "";
		String TH_WHSS = "";
		String TH_FSQY = "";
		String TH_FSSQ = "";
		String TH_BZ = "";
		String DXHC_FSCD = "";
		String DXHC_FSMJ = "";
		String DXHC_FZMJ = "";
		String DXHC_SJSS = "";
		String DXHC_WHSS = "";
		String DXHC_FSQY = "";
		String DXHC_FSSQ = "";
		String DXHC_BZ = "";
		String QTCH_FSCD = "";
		String QTCH_FSMJ = "";
		String QTCH_FZMJ = "";
		String QTCH_SJSS = "";
		String QTCH_WHSS = "";
		String QTCH_FSQY = "";
		String QTCH_FSSQ = "";
		String QTCH_BZ = "";
		String CHHJ_FSCD = "";
		String CHHJ_FSMJ = "";
		String CHHJ_FZMJ = "";
		String CHHJ_SJSS = "";
		String CHHJ_WHSS = "";
		String CHHJ_FSQY = "";
		String CHHJ_FSSQ = "";
		String CHHJ_BZ = "";
		String DBB_FSCD = "";
		String DBB_FSMJ = "";
		String DBB_FZMJ = "";
		String DBB_SJSS = "";
		String DBB_WHSS = "";
		String DBB_FSQY = "";
		String DBB_FSSQ = "";
		String DBB_BZ = "";
		String XBB_FSCD = "";
		String XBB_FSMJ = "";
		String XBB_FZMJ = "";
		String XBB_SJSS = "";
		String XBB_WHSS = "";
		String XBB_FSQY = "";
		String XBB_FSSQ = "";
		String XBB_BZ = "";
		String HBB_FSCD = "";
		String HBB_FSMJ = "";
		String HBB_FZMJ = "";
		String HBB_SJSS = "";
		String HBB_WHSS = "";
		String HBB_FSQY = "";
		String HBB_FSSQ = "";
		String HBB_BZ = "";
		String YMWBMYBB_FSCD = "";
		String YMWBMYBB_FSMJ = "";
		String YMWBMYBB_FZMJ = "";
		String YMWBMYBB_SJSS = "";
		String YMWBMYBB_WHSS = "";
		String YMWBMYBB_FSQY = "";
		String YMWBMYBB_FSSQ = "";
		String YMWBMYBB_BZ = "";
		String WKB_FSCD = "";
		String WKB_FSMJ = "";
		String WKB_FZMJ = "";
		String WKB_SJSS = "";
		String WKB_WHSS = "";
		String WKB_FSQY = "";
		String WKB_FSSQ = "";
		String WKB_BZ = "";
		String SHSB_FSCD = "";
		String SHSB_FSMJ = "";
		String SHSB_FZMJ = "";
		String SHSB_SJSS = "";
		String SHSB_WHSS = "";
		String SHSB_FSQY = "";
		String SHSB_FSSQ = "";
		String SHSB_BZ = "";
		String XB_FSCD = "";
		String XB_FSMJ = "";
		String XB_FZMJ = "";
		String XB_SJSS = "";
		String XB_WHSS = "";
		String XB_FSQY = "";
		String XB_FSSQ = "";
		String XB_BZ = "";
		String LHFB_FSCD = "";
		String LHFB_FSMJ = "";
		String LHFB_FZMJ = "";
		String LHFB_SJSS = "";
		String LHFB_WHSS = "";
		String LHFB_FSQY = "";
		String LHFB_FSSQ = "";
		String LHFB_BZ = "";
		String CSB_FSCD = "";
		String CSB_FSMJ = "";
		String CSB_FZMJ = "";
		String CSB_SJSS = "";
		String CSB_WHSS = "";
		String CSB_FSQY = "";
		String CSB_FSSQ = "";
		String CSB_BZ = "";
		String DFB_FSCD = "";
		String DFB_FSMJ = "";
		String DFB_FZMJ = "";
		String DFB_SJSS = "";
		String DFB_WHSS = "";
		String DFB_FSQY = "";
		String DFB_FSSQ = "";
		String DFB_BZ = "";
		String QTB_FSCD = "";
		String QTB_FSMJ = "";
		String QTB_FZMJ = "";
		String QTB_SJSS = "";
		String QTB_WHSS = "";
		String QTB_FSQY = "";
		String QTB_FSSQ = "";
		String QTB_BZ = "";
		String BHHJ_FSCD = "";
		String BHHJ_FSMJ = "";
		String BHHJ_FZMJ = "";
		String BHHJ_SJSS = "";
		String BHHJ_WHSS = "";
		String BHHJ_FSQY = "";
		String BHHJ_FSSQ = "";
		String BHHJ_BZ = "";
		String BCHJ_FSCD = "";
		String BCHJ_FSMJ = "";
		String BCHJ_FZMJ = "";
		String BCHJ_SJSS = "";
		String BCHJ_WHSS = "";
		String BCHJ_FSQY = "";
		String BCHJ_FSSQ = "";
		String BCHJ_BZ = "";
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
				String sql = "select * from D005 where jfid=" + jfid;
				pstmtbody = ecbody.con.prepareStatement(sql);
				rsbody = pstmtbody.executeQuery();
				while (rsbody.next()) {
					JFID = rsbody.getString("JFID")==null?"":rsbody.getString("JFID");
					YDYMM_FSCD = rsbody.getString("YDYMM_FSCD")==null?"":rsbody.getString("YDYMM_FSCD");
					YDYMM_FSMJ = rsbody.getString("YDYMM_FSMJ")==null?"":rsbody.getString("YDYMM_FSMJ");
					YDYMM_FZMJ = rsbody.getString("YDYMM_FZMJ")==null?"":rsbody.getString("YDYMM_FZMJ");
					YDYMM_SJSS = rsbody.getString("YDYMM_SJSS")==null?"":rsbody.getString("YDYMM_SJSS");
					YDYMM_WHSS = rsbody.getString("YDYMM_WHSS")==null?"":rsbody.getString("YDYMM_WHSS");
					YDYMM_FSQY = rsbody.getString("YDYMM_FSQY")==null?"":rsbody.getString("YDYMM_FSQY");
					YDYMM_FSSQ = rsbody.getString("YDYMM_FSSQ").substring(0,10);
					if(YDYMM_FSSQ==null)
					{
						YDYMM_FSSQ="";
					}
					YDYMM_BZ = rsbody.getString("YDYMM_BZ")==null?"":rsbody.getString("YDYMM_BZ");
					EDYMM_FSCD = rsbody.getString("EDYMM_FSCD")==null?"":rsbody.getString("EDYMM_FSCD");
					EDYMM_FSMJ = rsbody.getString("EDYMM_FSMJ")==null?"":rsbody.getString("EDYMM_FSMJ");
					EDYMM_FZMJ = rsbody.getString("EDYMM_FZMJ")==null?"":rsbody.getString("EDYMM_FZMJ");
					EDYMM_SJSS = rsbody.getString("EDYMM_SJSS")==null?"":rsbody.getString("EDYMM_SJSS");
					EDYMM_WHSS = rsbody.getString("EDYMM_WHSS")==null?"":rsbody.getString("EDYMM_WHSS");
					EDYMM_FSQY = rsbody.getString("EDYMM_FSQY")==null?"":rsbody.getString("EDYMM_FSQY");
					EDYMM_FSSQ = rsbody.getString("EDYMM_FSSQ").substring(0,10);
					if(EDYMM_FSSQ==null)
					{
						EDYMM_FSSQ="";
					}
					EDYMM_BZ = rsbody.getString("EDYMM_BZ")==null?"":rsbody.getString("EDYMM_BZ");
					SDYMM_FSCD = rsbody.getString("SDYMM_FSCD")==null?"":rsbody.getString("SDYMM_FSCD");
					SDYMM_FSMJ = rsbody.getString("SDYMM_FSMJ")==null?"":rsbody.getString("SDYMM_FSMJ");
					SDYMM_FZMJ = rsbody.getString("SDYMM_FZMJ")==null?"":rsbody.getString("SDYMM_FZMJ");
					SDYMM_SJSS = rsbody.getString("SDYMM_SJSS")==null?"":rsbody.getString("SDYMM_SJSS");
					SDYMM_WHSS = rsbody.getString("SDYMM_WHSS")==null?"":rsbody.getString("SDYMM_WHSS");
					SDYMM_FSQY = rsbody.getString("SDYMM_FSQY")==null?"":rsbody.getString("SDYMM_FSQY");
					SDYMM_FSSQ = rsbody.getString("SDYMM_FSSQ").substring(0,10);
					if(SDYMM_FSSQ==null)
					{
						SDYMM_FSSQ="";
					}
					SDYMM_BZ = rsbody.getString("SDYMM_BZ")==null?"":rsbody.getString("SDYMM_BZ");
					EDWYE_FSCD = rsbody.getString("EDWYE_FSCD")==null?"":rsbody.getString("EDWYE_FSCD");
					EDWYE_FSMJ = rsbody.getString("EDWYE_FSMJ")==null?"":rsbody.getString("EDWYE_FSMJ");
					EDWYE_FZMJ = rsbody.getString("EDWYE_FZMJ")==null?"":rsbody.getString("EDWYE_FZMJ");
					EDWYE_SJSS = rsbody.getString("EDWYE_SJSS")==null?"":rsbody.getString("EDWYE_SJSS");
					EDWYE_WHSS = rsbody.getString("EDWYE_WHSS")==null?"":rsbody.getString("EDWYE_WHSS");
					EDWYE_FSQY = rsbody.getString("EDWYE_FSQY")==null?"":rsbody.getString("EDWYE_FSQY");
					EDWYE_FSSQ = rsbody.getString("EDWYE_FSSQ").substring(0,10);
					if(EDWYE_FSSQ==null)
					{
						EDWYE_FSSQ="";
					}
					EDWYE_BZ = rsbody.getString("EDWYE_BZ")==null?"":rsbody.getString("EDWYE_BZ");
					EDNC_FSCD = rsbody.getString("EDNC_FSCD")==null?"":rsbody.getString("EDNC_FSCD");
					EDNC_FSMJ = rsbody.getString("EDNC_FSMJ")==null?"":rsbody.getString("EDNC_FSMJ");
					EDNC_FZMJ = rsbody.getString("EDNC_FZMJ")==null?"":rsbody.getString("EDNC_FZMJ");
					EDNC_SJSS = rsbody.getString("EDNC_SJSS")==null?"":rsbody.getString("EDNC_SJSS");
					EDNC_WHSS = rsbody.getString("EDNC_WHSS")==null?"":rsbody.getString("EDNC_WHSS");
					EDNC_FSQY = rsbody.getString("EDNC_FSQY")==null?"":rsbody.getString("EDNC_FSQY");
					EDNC_FSSQ = rsbody.getString("EDNC_FSSQ").substring(0,10);
					if(EDNC_FSSQ==null)
					{
						EDNC_FSSQ="";
					}
					EDNC_BZ = rsbody.getString("EDNC_BZ")==null?"":rsbody.getString("EDNC_BZ");
					SDNC_FSCD = rsbody.getString("SDNC_FSCD")==null?"":rsbody.getString("SDNC_FSCD");
					SDNC_FSMJ = rsbody.getString("SDNC_FSMJ")==null?"":rsbody.getString("SDNC_FSMJ");
					SDNC_FZMJ = rsbody.getString("SDNC_FZMJ")==null?"":rsbody.getString("SDNC_FZMJ");
					SDNC_SJSS = rsbody.getString("SDNC_SJSS")==null?"":rsbody.getString("SDNC_SJSS");
					SDNC_WHSS = rsbody.getString("SDNC_WHSS")==null?"":rsbody.getString("SDNC_WHSS");
					SDNC_FSQY = rsbody.getString("SDNC_FSQY")==null?"":rsbody.getString("SDNC_FSQY");
					SDNC_FSSQ = rsbody.getString("SDNC_FSSQ").substring(0,10);
					if(SDNC_FSSQ==null)
					{
						SDNC_FSSQ="";
					}
					SDNC_BZ = rsbody.getString("SDNC_BZ")==null?"":rsbody.getString("SDNC_BZ");
					EDMLC_FSCD = rsbody.getString("EDMLC_FSCD")==null?"":rsbody.getString("EDMLC_FSCD");
					EDMLC_FSMJ = rsbody.getString("EDMLC_FSMJ")==null?"":rsbody.getString("EDMLC_FSMJ");
					EDMLC_FZMJ = rsbody.getString("EDMLC_FZMJ")==null?"":rsbody.getString("EDMLC_FZMJ");
					EDMLC_SJSS = rsbody.getString("EDMLC_SJSS")==null?"":rsbody.getString("EDMLC_SJSS");
					EDMLC_WHSS = rsbody.getString("EDMLC_WHSS")==null?"":rsbody.getString("EDMLC_WHSS");
					EDMLC_FSQY = rsbody.getString("EDMLC_FSQY")==null?"":rsbody.getString("EDMLC_FSQY");
					EDMLC_FSSQ = rsbody.getString("EDMLC_FSSQ").substring(0,10);
					if(EDMLC_FSSQ==null)
					{
						EDMLC_FSSQ="";
					}
					EDMLC_BZ = rsbody.getString("EDMLC_BZ")==null?"":rsbody.getString("EDMLC_BZ");
					SDMLC_FSCD = rsbody.getString("SDMLC_FSCD")==null?"":rsbody.getString("SDMLC_FSCD");
					SDMLC_FSMJ = rsbody.getString("SDMLC_FSMJ")==null?"":rsbody.getString("SDMLC_FSMJ");
					SDMLC_FZMJ = rsbody.getString("SDMLC_FZMJ")==null?"":rsbody.getString("SDMLC_FZMJ");
					SDMLC_SJSS = rsbody.getString("SDMLC_SJSS")==null?"":rsbody.getString("SDMLC_SJSS");
					SDMLC_WHSS = rsbody.getString("SDMLC_WHSS")==null?"":rsbody.getString("SDMLC_WHSS");
					SDMLC_FSQY = rsbody.getString("SDMLC_FSQY")==null?"":rsbody.getString("SDMLC_FSQY");
					SDMLC_FSSQ = rsbody.getString("SDMLC_FSSQ").substring(0,10);
					if(SDMLC_FSSQ==null)
					{
						SDMLC_FSSQ="";
					}
					SDMLC_BZ = rsbody.getString("SDMLC_BZ")==null?"":rsbody.getString("SDMLC_BZ");
					FDMLC_FSCD = rsbody.getString("FDMLC_FSCD")==null?"":rsbody.getString("FDMLC_FSCD");
					FDMLC_FSMJ = rsbody.getString("FDMLC_FSMJ")==null?"":rsbody.getString("FDMLC_FSMJ");
					FDMLC_FZMJ = rsbody.getString("FDMLC_FZMJ")==null?"":rsbody.getString("FDMLC_FZMJ");
					FDMLC_SJSS = rsbody.getString("FDMLC_SJSS")==null?"":rsbody.getString("FDMLC_SJSS");
					FDMLC_WHSS = rsbody.getString("FDMLC_WHSS")==null?"":rsbody.getString("FDMLC_WHSS");
					FDMLC_FSQY = rsbody.getString("FDMLC_FSQY")==null?"":rsbody.getString("FDMLC_FSQY");
					FDMLC_FSSQ = rsbody.getString("FDMLC_FSSQ").substring(0,10);
					if(FDMLC_FSSQ==null)
					{
						FDMLC_FSSQ="";
					}
					FDMLC_BZ = rsbody.getString("FDMLC_BZ")==null?"":rsbody.getString("FDMLC_BZ");
					CDM_FSCD = rsbody.getString("CDM_FSCD")==null?"":rsbody.getString("CDM_FSCD");
					CDM_FSMJ = rsbody.getString("CDM_FSMJ")==null?"":rsbody.getString("CDM_FSMJ");
					CDM_FZMJ = rsbody.getString("CDM_FZMJ")==null?"":rsbody.getString("CDM_FZMJ");
					CDM_SJSS = rsbody.getString("CDM_SJSS")==null?"":rsbody.getString("CDM_SJSS");
					CDM_WHSS = rsbody.getString("CDM_WHSS")==null?"":rsbody.getString("CDM_WHSS");
					CDM_FSQY = rsbody.getString("CDM_FSQY")==null?"":rsbody.getString("CDM_FSQY");
					CDM_FSSQ = rsbody.getString("CDM_FSSQ").substring(0,10);
					if(CDM_FSSQ==null)
					{
						CDM_FSSQ="";
					}
					CDM_BZ = rsbody.getString("CDM_BZ")==null?"":rsbody.getString("CDM_BZ");
					YC_FSCD = rsbody.getString("YC_FSCD")==null?"":rsbody.getString("YC_FSCD");
					YC_FSMJ = rsbody.getString("YC_FSMJ")==null?"":rsbody.getString("YC_FSMJ");
					YC_FZMJ = rsbody.getString("YC_FZMJ")==null?"":rsbody.getString("YC_FZMJ");
					YC_SJSS = rsbody.getString("YC_SJSS")==null?"":rsbody.getString("YC_SJSS");
					YC_WHSS = rsbody.getString("YC_WHSS")==null?"":rsbody.getString("YC_WHSS");
					YC_FSQY = rsbody.getString("YC_FSQY")==null?"":rsbody.getString("YC_FSQY");
					YC_FSSQ = rsbody.getString("YC_FSSQ").substring(0,10);
					if(YC_FSSQ==null)
					{
						YC_FSSQ="";
					}
					YC_BZ = rsbody.getString("YC_BZ")==null?"":rsbody.getString("YC_BZ");
					JM_FSCD = rsbody.getString("JM_FSCD")==null?"":rsbody.getString("JM_FSCD");
					JM_FSMJ = rsbody.getString("JM_FSMJ")==null?"":rsbody.getString("JM_FSMJ");
					JM_FZMJ = rsbody.getString("JM_FZMJ")==null?"":rsbody.getString("JM_FZMJ");
					JM_SJSS = rsbody.getString("JM_SJSS")==null?"":rsbody.getString("JM_SJSS");
					JM_WHSS = rsbody.getString("JM_WHSS")==null?"":rsbody.getString("JM_WHSS");
					JM_FSQY = rsbody.getString("JM_FSQY")==null?"":rsbody.getString("JM_FSQY");
					JM_FSSQ = rsbody.getString("JM_FSSQ").substring(0,10);
					if(JM_FSSQ==null)
					{
						JM_FSSQ="";
					}
					JM_BZ = rsbody.getString("JM_BZ")==null?"":rsbody.getString("JM_BZ");
					YM_FSCD = rsbody.getString("YM_FSCD")==null?"":rsbody.getString("YM_FSCD");
					YM_FSMJ = rsbody.getString("YM_FSMJ")==null?"":rsbody.getString("YM_FSMJ");
					YM_FZMJ = rsbody.getString("YM_FZMJ")==null?"":rsbody.getString("YM_FZMJ");
					YM_SJSS = rsbody.getString("YM_SJSS")==null?"":rsbody.getString("YM_SJSS");
					YM_WHSS = rsbody.getString("YM_WHSS")==null?"":rsbody.getString("YM_WHSS");
					YM_FSQY = rsbody.getString("YM_FSQY")==null?"":rsbody.getString("YM_FSQY");
					YM_FSSQ = rsbody.getString("YM_FSSQ").substring(0,10);
					if(YM_FSSQ==null)
					{
						YM_FSSQ="";
					}
					YM_BZ = rsbody.getString("YM_BZ")==null?"":rsbody.getString("YM_BZ");
					SBYJC_FSCD = rsbody.getString("SBYJC_FSCD")==null?"":rsbody.getString("SBYJC_FSCD");
					SBYJC_FSMJ = rsbody.getString("SBYJC_FSMJ")==null?"":rsbody.getString("SBYJC_FSMJ");
					SBYJC_FZMJ = rsbody.getString("SBYJC_FZMJ")==null?"":rsbody.getString("SBYJC_FZMJ");
					SBYJC_SJSS = rsbody.getString("SBYJC_SJSS")==null?"":rsbody.getString("SBYJC_SJSS");
					SBYJC_WHSS = rsbody.getString("SBYJC_WHSS")==null?"":rsbody.getString("SBYJC_WHSS");
					SBYJC_FSQY = rsbody.getString("SBYJC_FSQY")==null?"":rsbody.getString("SBYJC_FSQY");
					SBYJC_FSSQ = rsbody.getString("SBYJC_FSSQ").substring(0,10);
					if(SBYJC_FSSQ==null)
					{
						SBYJC_FSSQ="";
					}
					SBYJC_BZ = rsbody.getString("SBYJC_BZ")==null?"":rsbody.getString("SBYJC_BZ");
					TH_FSCD = rsbody.getString("TH_FSCD")==null?"":rsbody.getString("TH_FSCD");
					TH_FSMJ = rsbody.getString("TH_FSMJ")==null?"":rsbody.getString("TH_FSMJ");
					TH_FZMJ = rsbody.getString("TH_FZMJ")==null?"":rsbody.getString("TH_FZMJ");
					TH_SJSS = rsbody.getString("TH_SJSS")==null?"":rsbody.getString("TH_SJSS");
					TH_WHSS = rsbody.getString("TH_WHSS")==null?"":rsbody.getString("TH_WHSS");
					TH_FSQY = rsbody.getString("TH_FSQY")==null?"":rsbody.getString("TH_FSQY");
					TH_FSSQ = rsbody.getString("TH_FSSQ").substring(0,10);
					if(TH_FSSQ==null)
					{
						TH_FSSQ="";
					}
					TH_BZ = rsbody.getString("TH_BZ")==null?"":rsbody.getString("TH_BZ");
					DXHC_FSCD = rsbody.getString("DXHC_FSCD")==null?"":rsbody.getString("DXHC_FSCD");
					DXHC_FSMJ = rsbody.getString("DXHC_FSMJ")==null?"":rsbody.getString("DXHC_FSMJ");
					DXHC_FZMJ = rsbody.getString("DXHC_FZMJ")==null?"":rsbody.getString("DXHC_FZMJ");
					DXHC_SJSS = rsbody.getString("DXHC_SJSS")==null?"":rsbody.getString("DXHC_SJSS");
					DXHC_WHSS = rsbody.getString("DXHC_WHSS")==null?"":rsbody.getString("DXHC_WHSS");
					DXHC_FSQY = rsbody.getString("DXHC_FSQY")==null?"":rsbody.getString("DXHC_FSQY");
					DXHC_FSSQ = rsbody.getString("DXHC_FSSQ").substring(0,10);
					if(DXHC_FSSQ==null)
					{
						DXHC_FSSQ="";
					}
					DXHC_BZ = rsbody.getString("DXHC_BZ")==null?"":rsbody.getString("DXHC_BZ");
					QTCH_FSCD = rsbody.getString("QTCH_FSCD")==null?"":rsbody.getString("QTCH_FSCD");
					QTCH_FSMJ = rsbody.getString("QTCH_FSMJ")==null?"":rsbody.getString("QTCH_FSMJ");
					QTCH_FZMJ = rsbody.getString("QTCH_FZMJ")==null?"":rsbody.getString("QTCH_FZMJ");
					QTCH_SJSS = rsbody.getString("QTCH_SJSS")==null?"":rsbody.getString("QTCH_SJSS");
					QTCH_WHSS = rsbody.getString("QTCH_WHSS")==null?"":rsbody.getString("QTCH_WHSS");
					QTCH_FSQY = rsbody.getString("QTCH_FSQY")==null?"":rsbody.getString("QTCH_FSQY");
					QTCH_FSSQ = rsbody.getString("QTCH_FSSQ").substring(0,10);
					if(QTCH_FSSQ==null)
					{
						QTCH_FSSQ="";
					}
					QTCH_BZ = rsbody.getString("QTCH_BZ")==null?"":rsbody.getString("QTCH_BZ");
					CHHJ_FSCD = rsbody.getString("CHHJ_FSCD")==null?"":rsbody.getString("CHHJ_FSCD");
					CHHJ_FSMJ = rsbody.getString("CHHJ_FSMJ")==null?"":rsbody.getString("CHHJ_FSMJ");
					CHHJ_FZMJ = rsbody.getString("CHHJ_FZMJ")==null?"":rsbody.getString("CHHJ_FZMJ");
					CHHJ_SJSS = rsbody.getString("CHHJ_SJSS")==null?"":rsbody.getString("CHHJ_SJSS");
					CHHJ_WHSS = rsbody.getString("CHHJ_WHSS")==null?"":rsbody.getString("CHHJ_WHSS");
					CHHJ_FSQY = rsbody.getString("CHHJ_FSQY")==null?"":rsbody.getString("CHHJ_FSQY");
					CHHJ_FSSQ = rsbody.getString("CHHJ_FSSQ").substring(0,10);
					if(CHHJ_FSSQ==null)
					{
						CHHJ_FSSQ="";
					}
					CHHJ_BZ = rsbody.getString("CHHJ_BZ")==null?"":rsbody.getString("CHHJ_BZ");
					DBB_FSCD = rsbody.getString("DBB_FSCD")==null?"":rsbody.getString("DBB_FSCD");
					DBB_FSMJ = rsbody.getString("DBB_FSMJ")==null?"":rsbody.getString("DBB_FSMJ");
					DBB_FZMJ = rsbody.getString("DBB_FZMJ")==null?"":rsbody.getString("DBB_FZMJ");
					DBB_SJSS = rsbody.getString("DBB_SJSS")==null?"":rsbody.getString("DBB_SJSS");
					DBB_WHSS = rsbody.getString("DBB_WHSS")==null?"":rsbody.getString("DBB_WHSS");
					DBB_FSQY = rsbody.getString("DBB_FSQY")==null?"":rsbody.getString("DBB_FSQY");
					DBB_FSSQ = rsbody.getString("DBB_FSSQ").substring(0,10);
					if(DBB_FSSQ==null)
					{
						DBB_FSSQ="";
					}
					DBB_BZ = rsbody.getString("DBB_BZ")==null?"":rsbody.getString("DBB_BZ");
					XBB_FSCD = rsbody.getString("XBB_FSCD")==null?"":rsbody.getString("XBB_FSCD");
					XBB_FSMJ = rsbody.getString("XBB_FSMJ")==null?"":rsbody.getString("XBB_FSMJ");
					XBB_FZMJ = rsbody.getString("XBB_FZMJ")==null?"":rsbody.getString("XBB_FZMJ");
					XBB_SJSS = rsbody.getString("XBB_SJSS")==null?"":rsbody.getString("XBB_SJSS");
					XBB_WHSS = rsbody.getString("XBB_WHSS")==null?"":rsbody.getString("XBB_WHSS");
					XBB_FSQY = rsbody.getString("XBB_FSQY")==null?"":rsbody.getString("XBB_FSQY");
					XBB_FSSQ = rsbody.getString("XBB_FSSQ").substring(0,10);
					if(XBB_FSSQ==null)
					{
						XBB_FSSQ="";
					}
					XBB_BZ = rsbody.getString("XBB_BZ")==null?"":rsbody.getString("XBB_BZ");
					HBB_FSCD = rsbody.getString("HBB_FSCD")==null?"":rsbody.getString("HBB_FSCD");
					HBB_FSMJ = rsbody.getString("HBB_FSMJ")==null?"":rsbody.getString("HBB_FSMJ");
					HBB_FZMJ = rsbody.getString("HBB_FZMJ")==null?"":rsbody.getString("HBB_FZMJ");
					HBB_SJSS = rsbody.getString("HBB_SJSS")==null?"":rsbody.getString("HBB_SJSS");
					HBB_WHSS = rsbody.getString("HBB_WHSS")==null?"":rsbody.getString("HBB_WHSS");
					HBB_FSQY = rsbody.getString("HBB_FSQY")==null?"":rsbody.getString("HBB_FSQY");
					HBB_FSSQ = rsbody.getString("HBB_FSSQ").substring(0,10);
					if(HBB_FSSQ==null)
					{
						HBB_FSSQ="";
					}
					HBB_BZ = rsbody.getString("HBB_BZ")==null?"":rsbody.getString("HBB_BZ");
					YMWBMYBB_FSCD = rsbody.getString("YMWBMYBB_FSCD")==null?"":rsbody.getString("YMWBMYBB_FSCD");
					YMWBMYBB_FSMJ = rsbody.getString("YMWBMYBB_FSMJ")==null?"":rsbody.getString("YMWBMYBB_FSMJ");
					YMWBMYBB_FZMJ = rsbody.getString("YMWBMYBB_FZMJ")==null?"":rsbody.getString("YMWBMYBB_FZMJ");
					YMWBMYBB_SJSS = rsbody.getString("YMWBMYBB_SJSS")==null?"":rsbody.getString("YMWBMYBB_SJSS");
					YMWBMYBB_WHSS = rsbody.getString("YMWBMYBB_WHSS")==null?"":rsbody.getString("YMWBMYBB_WHSS");
					YMWBMYBB_FSQY = rsbody.getString("YMWBMYBB_FSQY")==null?"":rsbody.getString("YMWBMYBB_FSQY");
					YMWBMYBB_FSSQ = rsbody.getString("YMWBMYBB_FSSQ").substring(0,10);
					if(YMWBMYBB_FSSQ==null)
					{
						YMWBMYBB_FSSQ="";
					}
					YMWBMYBB_BZ = rsbody.getString("YMWBMYBB_BZ")==null?"":rsbody.getString("YMWBMYBB_BZ");
					WKB_FSCD = rsbody.getString("WKB_FSCD")==null?"":rsbody.getString("WKB_FSCD");
					WKB_FSMJ = rsbody.getString("WKB_FSMJ")==null?"":rsbody.getString("WKB_FSMJ");
					WKB_FZMJ = rsbody.getString("WKB_FZMJ")==null?"":rsbody.getString("WKB_FZMJ");
					WKB_SJSS = rsbody.getString("WKB_SJSS")==null?"":rsbody.getString("WKB_SJSS");
					WKB_WHSS = rsbody.getString("WKB_WHSS")==null?"":rsbody.getString("WKB_WHSS");
					WKB_FSQY = rsbody.getString("WKB_FSQY")==null?"":rsbody.getString("WKB_FSQY");
					WKB_FSSQ = rsbody.getString("WKB_FSSQ").substring(0,10);
					if(WKB_FSSQ==null)
					{
						WKB_FSSQ="";
					}
					WKB_BZ = rsbody.getString("WKB_BZ")==null?"":rsbody.getString("WKB_BZ");
					SHSB_FSCD = rsbody.getString("SHSB_FSCD")==null?"":rsbody.getString("SHSB_FSCD");
					SHSB_FSMJ = rsbody.getString("SHSB_FSMJ")==null?"":rsbody.getString("SHSB_FSMJ");
					SHSB_FZMJ = rsbody.getString("SHSB_FZMJ")==null?"":rsbody.getString("SHSB_FZMJ");
					SHSB_SJSS = rsbody.getString("SHSB_SJSS")==null?"":rsbody.getString("SHSB_SJSS");
					SHSB_WHSS = rsbody.getString("SHSB_WHSS")==null?"":rsbody.getString("SHSB_WHSS");
					SHSB_FSQY = rsbody.getString("SHSB_FSQY")==null?"":rsbody.getString("SHSB_FSQY");
					SHSB_FSSQ = rsbody.getString("SHSB_FSSQ").substring(0,10);
					if(SHSB_FSSQ==null)
					{
						SHSB_FSSQ="";
					}
					SHSB_BZ = rsbody.getString("SHSB_BZ")==null?"":rsbody.getString("SHSB_BZ");
					XB_FSCD = rsbody.getString("XB_FSCD")==null?"":rsbody.getString("XB_FSCD");
					XB_FSMJ = rsbody.getString("XB_FSMJ")==null?"":rsbody.getString("XB_FSMJ");
					XB_FZMJ = rsbody.getString("XB_FZMJ")==null?"":rsbody.getString("XB_FZMJ");
					XB_SJSS = rsbody.getString("XB_SJSS")==null?"":rsbody.getString("XB_SJSS");
					XB_WHSS = rsbody.getString("XB_WHSS")==null?"":rsbody.getString("XB_WHSS");
					XB_FSQY = rsbody.getString("XB_FSQY")==null?"":rsbody.getString("XB_FSQY");
					XB_FSSQ = rsbody.getString("XB_FSSQ").substring(0,10);
					if(XB_FSSQ==null)
					{
						XB_FSSQ="";
					}
					XB_BZ = rsbody.getString("XB_BZ")==null?"":rsbody.getString("XB_BZ");
					LHFB_FSCD = rsbody.getString("LHFB_FSCD")==null?"":rsbody.getString("LHFB_FSCD");
					LHFB_FSMJ = rsbody.getString("LHFB_FSMJ")==null?"":rsbody.getString("LHFB_FSMJ");
					LHFB_FZMJ = rsbody.getString("LHFB_FZMJ")==null?"":rsbody.getString("LHFB_FZMJ");
					LHFB_SJSS = rsbody.getString("LHFB_SJSS")==null?"":rsbody.getString("LHFB_SJSS");
					LHFB_WHSS = rsbody.getString("LHFB_WHSS")==null?"":rsbody.getString("LHFB_WHSS");
					LHFB_FSQY = rsbody.getString("LHFB_FSQY")==null?"":rsbody.getString("LHFB_FSQY");
					LHFB_FSSQ = rsbody.getString("LHFB_FSSQ").substring(0,10);
					if(LHFB_FSSQ==null)
					{
						LHFB_FSSQ="";
					}
					LHFB_BZ = rsbody.getString("LHFB_BZ")==null?"":rsbody.getString("LHFB_BZ");
					CSB_FSCD = rsbody.getString("CSB_FSCD")==null?"":rsbody.getString("CSB_FSCD");
					CSB_FSMJ = rsbody.getString("CSB_FSMJ")==null?"":rsbody.getString("CSB_FSMJ");
					CSB_FZMJ = rsbody.getString("CSB_FZMJ")==null?"":rsbody.getString("CSB_FZMJ");
					CSB_SJSS = rsbody.getString("CSB_SJSS")==null?"":rsbody.getString("CSB_SJSS");
					CSB_WHSS = rsbody.getString("CSB_WHSS")==null?"":rsbody.getString("CSB_WHSS");
					CSB_FSQY = rsbody.getString("CSB_FSQY")==null?"":rsbody.getString("CSB_FSQY");
					CSB_FSSQ = rsbody.getString("CSB_FSSQ").substring(0,10);
					if(CSB_FSSQ==null)
					{
						CSB_FSSQ="";
					}
					CSB_BZ = rsbody.getString("CSB_BZ")==null?"":rsbody.getString("CSB_BZ");
					DFB_FSCD = rsbody.getString("DFB_FSCD")==null?"":rsbody.getString("DFB_FSCD");
					DFB_FSMJ = rsbody.getString("DFB_FSMJ")==null?"":rsbody.getString("DFB_FSMJ");
					DFB_FZMJ = rsbody.getString("DFB_FZMJ")==null?"":rsbody.getString("DFB_FZMJ");
					DFB_SJSS = rsbody.getString("DFB_SJSS")==null?"":rsbody.getString("DFB_SJSS");
					DFB_WHSS = rsbody.getString("DFB_WHSS")==null?"":rsbody.getString("DFB_WHSS");
					DFB_FSQY = rsbody.getString("DFB_FSQY")==null?"":rsbody.getString("DFB_FSQY");
					DFB_FSSQ = rsbody.getString("DFB_FSSQ").substring(0,10);
					if(DFB_FSSQ==null)
					{
						DFB_FSSQ="";
					}
					DFB_BZ = rsbody.getString("DFB_BZ")==null?"":rsbody.getString("DFB_BZ");
					QTB_FSCD = rsbody.getString("QTB_FSCD")==null?"":rsbody.getString("QTB_FSCD");
					QTB_FSMJ = rsbody.getString("QTB_FSMJ")==null?"":rsbody.getString("QTB_FSMJ");
					QTB_FZMJ = rsbody.getString("QTB_FZMJ")==null?"":rsbody.getString("QTB_FZMJ");
					QTB_SJSS = rsbody.getString("QTB_SJSS")==null?"":rsbody.getString("QTB_SJSS");
					QTB_WHSS = rsbody.getString("QTB_WHSS")==null?"":rsbody.getString("QTB_WHSS");
					QTB_FSQY = rsbody.getString("QTB_FSQY")==null?"":rsbody.getString("QTB_FSQY");
					QTB_FSSQ = rsbody.getString("QTB_FSSQ").substring(0,10);
					if(QTB_FSSQ==null)
					{
						QTB_FSSQ="";
					}
					QTB_BZ = rsbody.getString("QTB_BZ")==null?"":rsbody.getString("QTB_BZ");
					BHHJ_FSCD = rsbody.getString("BHHJ_FSCD")==null?"":rsbody.getString("BHHJ_FSCD");
					BHHJ_FSMJ = rsbody.getString("BHHJ_FSMJ")==null?"":rsbody.getString("BHHJ_FSMJ");
					BHHJ_FZMJ = rsbody.getString("BHHJ_FZMJ")==null?"":rsbody.getString("BHHJ_FZMJ");
					BHHJ_SJSS = rsbody.getString("BHHJ_SJSS")==null?"":rsbody.getString("BHHJ_SJSS");
					BHHJ_WHSS = rsbody.getString("BHHJ_WHSS")==null?"":rsbody.getString("BHHJ_WHSS");
					BHHJ_FSQY = rsbody.getString("BHHJ_FSQY")==null?"":rsbody.getString("BHHJ_FSQY");
					BHHJ_FSSQ = rsbody.getString("BHHJ_FSSQ").substring(0,10);
					if(BHHJ_FSSQ==null)
					{
						BHHJ_FSSQ="";
					}
					BHHJ_BZ = rsbody.getString("BHHJ_BZ")==null?"":rsbody.getString("BHHJ_BZ");
					BCHJ_FSCD = rsbody.getString("BCHJ_FSCD")==null?"":rsbody.getString("BCHJ_FSCD");
					BCHJ_FSMJ = rsbody.getString("BCHJ_FSMJ")==null?"":rsbody.getString("BCHJ_FSMJ");
					BCHJ_FZMJ = rsbody.getString("BCHJ_FZMJ")==null?"":rsbody.getString("BCHJ_FZMJ");
					BCHJ_SJSS = rsbody.getString("BCHJ_SJSS")==null?"":rsbody.getString("BCHJ_SJSS");
					BCHJ_WHSS = rsbody.getString("BCHJ_WHSS")==null?"":rsbody.getString("BCHJ_WHSS");
					BCHJ_FSQY = rsbody.getString("BCHJ_FSQY")==null?"":rsbody.getString("BCHJ_FSQY");
					BCHJ_FSSQ = rsbody.getString("BCHJ_FSSQ").substring(0,10);
					if(BCHJ_FSSQ==null)
					{
						BCHJ_FSSQ="";
					}
					BCHJ_BZ = rsbody.getString("BCHJ_BZ")==null?"":rsbody.getString("BCHJ_BZ");
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
					style="text-align:center;font-size=30;width: ;height: "><b>玉米病虫害年度统计表(<%=rwsj%>)
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
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>重点发生区域</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>发生盛期</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>备注</b></td>
				</tr>
			</tbody>
			<tbody id="zg_body">
				<tr>
					<td style="text-align: center;">一代玉米螟</td>
					<td><label><%=YDYMM_FSCD%>级</label></td>
					<td><label><%=YDYMM_FSMJ%></label></td>
					<td><label><%=YDYMM_FZMJ%></label></td>
					<td><label><%=YDYMM_SJSS%></label></td>
					<td><label><%=YDYMM_WHSS%></label></td>
					<td><label><%=YDYMM_FSQY%></label></td>
					<td><label><%=YDYMM_FSSQ%></label></td>
					<td><label><%=YDYMM_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">二代玉米螟</td>
					<td><label><%=EDYMM_FSCD%>级</label></td>
					<td><label><%=EDYMM_FSMJ%></label></td>
					<td><label><%=EDYMM_FZMJ%></label></td>
					<td><label><%=EDYMM_SJSS%></label></td>
					<td><label><%=EDYMM_WHSS%></label></td>
					<td><label><%=EDYMM_FSQY%></label></td>
					<td><label><%=EDYMM_FSSQ%></label></td>
					<td><label><%=EDYMM_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">三代玉米螟</td>
					<td><label><%=SDYMM_FSCD%>级</label></td>
					<td><label><%=SDYMM_FSMJ%></label></td>
					<td><label><%=SDYMM_FZMJ%></label></td>
					<td><label><%=SDYMM_SJSS%></label></td>
					<td><label><%=SDYMM_WHSS%></label></td>
					<td><label><%=SDYMM_FSQY%></label></td>
					<td><label><%=SDYMM_FSSQ%></label></td>
					<td><label><%=SDYMM_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">二点委夜蛾</td>
					<td><label><%=EDWYE_FSCD%>级</label></td>
					<td><label><%=EDWYE_FSMJ%></label></td>
					<td><label><%=EDWYE_FZMJ%></label></td>
					<td><label><%=EDWYE_SJSS%></label></td>
					<td><label><%=EDWYE_WHSS%></label></td>
					<td><label><%=EDWYE_FSQY%></label></td>
					<td><label><%=EDWYE_FSSQ%></label></td>
					<td><label><%=EDWYE_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">二代粘虫</td>
					<td><label><%=EDNC_FSCD%>级</label></td>
					<td><label><%=EDNC_FSMJ%></label></td>
					<td><label><%=EDNC_FZMJ%></label></td>
					<td><label><%=EDNC_SJSS%></label></td>
					<td><label><%=EDNC_WHSS%></label></td>
					<td><label><%=EDNC_FSQY%></label></td>
					<td><label><%=EDNC_FSSQ%></label></td>
					<td><label><%=EDNC_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">三代粘虫</td>
					<td><label><%=SDNC_FSCD%>级</label></td>
					<td><label><%=SDNC_FSMJ%></label></td>
					<td><label><%=SDNC_FZMJ%></label></td>
					<td><label><%=SDNC_SJSS%></label></td>
					<td><label><%=SDNC_WHSS%></label></td>
					<td><label><%=SDNC_FSQY%></label></td>
					<td><label><%=SDNC_FSSQ%></label></td>
					<td><label><%=SDNC_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">二代棉铃虫</td>
					<td><label><%=EDMLC_FSCD%>级</label></td>
					<td><label><%=EDMLC_FSMJ%></label></td>
					<td><label><%=EDMLC_FZMJ%></label></td>
					<td><label><%=EDMLC_SJSS%></label></td>
					<td><label><%=EDMLC_WHSS%></label></td>
					<td><label><%=EDMLC_FSQY%></label></td>
					<td><label><%=EDMLC_FSSQ%></label></td>
					<td><label><%=EDMLC_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">三代棉铃虫</td>
					<td><label><%=SDMLC_FSCD%>级</label></td>
					<td><label><%=SDMLC_FSMJ%></label></td>
					<td><label><%=SDMLC_FZMJ%></label></td>
					<td><label><%=SDMLC_SJSS%></label></td>
					<td><label><%=SDMLC_WHSS%></label></td>
					<td><label><%=SDMLC_FSQY%></label></td>
					<td><label><%=SDMLC_FSSQ%></label></td>
					<td><label><%=SDMLC_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">四代棉铃虫</td>
					<td><label><%=FDMLC_FSCD%>级</label></td>
					<td><label><%=FDMLC_FSMJ%></label></td>
					<td><label><%=FDMLC_FZMJ%></label></td>
					<td><label><%=FDMLC_SJSS%></label></td>
					<td><label><%=FDMLC_WHSS%></label></td>
					<td><label><%=FDMLC_FSQY%></label></td>
					<td><label><%=FDMLC_FSSQ%></label></td>
					<td><label><%=FDMLC_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">草地螟</td>
					<td><label><%=CDM_FSCD%>级</label></td>
					<td><label><%=CDM_FSMJ%></label></td>
					<td><label><%=CDM_FZMJ%></label></td>
					<td><label><%=CDM_SJSS%></label></td>
					<td><label><%=CDM_WHSS%></label></td>
					<td><label><%=CDM_FSQY%></label></td>
					<td><label><%=CDM_FSSQ%></label></td>
					<td><label><%=CDM_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">蚜虫</td>
					<td><label><%=YC_FSCD%>级</label></td>
					<td><label><%=YC_FSMJ%></label></td>
					<td><label><%=YC_FZMJ%></label></td>
					<td><label><%=YC_SJSS%></label></td>
					<td><label><%=YC_WHSS%></label></td>
					<td><label><%=YC_FSQY%></label></td>
					<td><label><%=YC_FSSQ%></label></td>
					<td><label><%=YC_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">蓟马</td>
					<td><label><%=JM_FSCD%>级</label></td>
					<td><label><%=JM_FSMJ%></label></td>
					<td><label><%=JM_FZMJ%></label></td>
					<td><label><%=JM_SJSS%></label></td>
					<td><label><%=JM_WHSS%></label></td>
					<td><label><%=JM_FSQY%></label></td>
					<td><label><%=JM_FSSQ%></label></td>
					<td><label><%=JM_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">叶螨</td>
					<td><label><%=YM_FSCD%>级</label></td>
					<td><label><%=YM_FSMJ%></label></td>
					<td><label><%=YM_FZMJ%></label></td>
					<td><label><%=YM_SJSS%></label></td>
					<td><label><%=YM_WHSS%></label></td>
					<td><label><%=YM_FSQY%></label></td>
					<td><label><%=YM_FSSQ%></label></td>
					<td><label><%=YM_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">双斑萤叶甲</td>
					<td><label><%=SBYJC_FSCD%>级</label></td>
					<td><label><%=SBYJC_FSMJ%></label></td>
					<td><label><%=SBYJC_FZMJ%></label></td>
					<td><label><%=SBYJC_SJSS%></label></td>
					<td><label><%=SBYJC_WHSS%></label></td>
					<td><label><%=SBYJC_FSQY%></label></td>
					<td><label><%=SBYJC_FSSQ%></label></td>
					<td><label><%=SBYJC_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">土蝗（玉米田）</td>
					<td><label><%=TH_FSCD%>级</label></td>
					<td><label><%=TH_FSMJ%></label></td>
					<td><label><%=TH_FZMJ%></label></td>
					<td><label><%=TH_SJSS%></label></td>
					<td><label><%=TH_WHSS%></label></td>
					<td><label><%=TH_FSQY%></label></td>
					<td><label><%=TH_FSSQ%></label></td>
					<td><label><%=TH_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">地下害虫</td>
					<td><label><%=DXHC_FSCD%>级</label></td>
					<td><label><%=DXHC_FSMJ%></label></td>
					<td><label><%=DXHC_FZMJ%></label></td>
					<td><label><%=DXHC_SJSS%></label></td>
					<td><label><%=DXHC_WHSS%></label></td>
					<td><label><%=DXHC_FSQY%></label></td>
					<td><label><%=DXHC_FSSQ%></label></td>
					<td><label><%=DXHC_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">其他害虫</td>
					<td><label><%=QTCH_FSCD%>级</label></td>
					<td><label><%=QTCH_FSMJ%></label></td>
					<td><label><%=QTCH_FZMJ%></label></td>
					<td><label><%=QTCH_SJSS%></label></td>
					<td><label><%=QTCH_WHSS%></label></td>
					<td><label><%=QTCH_FSQY%></label></td>
					<td><label><%=QTCH_FSSQ%></label></td>
					<td><label><%=QTCH_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">虫害合计</td>
					<td style="text-align: center;">/</td>
					<td><label><%=CHHJ_FSMJ%></label></td>
					<td><label><%=CHHJ_FZMJ%></label></td>
					<td><label><%=CHHJ_SJSS%></label></td>
					<td><label><%=CHHJ_WHSS%></label></td>
					<td><label><%=CHHJ_FSQY%></label></td>
					<td><label><%=CHHJ_FSSQ%></label></td>
					<td><label><%=CHHJ_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">大斑病</td>
					<td><label><%=DBB_FSCD%>级</label></td>
					<td><label><%=DBB_FSMJ%></label></td>
					<td><label><%=DBB_FZMJ%></label></td>
					<td><label><%=DBB_SJSS%></label></td>
					<td><label><%=DBB_WHSS%></label></td>
					<td><label><%=DBB_FSQY%></label></td>
					<td><label><%=DBB_FSSQ%></label></td>
					<td><label><%=DBB_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">小斑病</td>
					<td><label><%=XBB_FSCD%>级</label></td>
					<td><label><%=XBB_FSMJ%></label></td>
					<td><label><%=XBB_FZMJ%></label></td>
					<td><label><%=XBB_SJSS%></label></td>
					<td><label><%=XBB_WHSS%></label></td>
					<td><label><%=XBB_FSQY%></label></td>
					<td><label><%=XBB_FSSQ%></label></td>
					<td><label><%=XBB_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">褐斑病</td>
					<td><label><%=HBB_FSCD%>级</label></td>
					<td><label><%=HBB_FSMJ%></label></td>
					<td><label><%=HBB_FZMJ%></label></td>
					<td><label><%=HBB_SJSS%></label></td>
					<td><label><%=HBB_WHSS%></label></td>
					<td><label><%=HBB_FSQY%></label></td>
					<td><label><%=HBB_FSSQ%></label></td>
					<td><label><%=HBB_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">玉米弯孢霉叶斑病</td>
					<td><label><%=YMWBMYBB_FSCD%>级</label></td>
					<td><label><%=YMWBMYBB_FSMJ%></label></td>
					<td><label><%=YMWBMYBB_FZMJ%></label></td>
					<td><label><%=YMWBMYBB_SJSS%></label></td>
					<td><label><%=YMWBMYBB_WHSS%></label></td>
					<td><label><%=YMWBMYBB_FSQY%></label></td>
					<td><label><%=YMWBMYBB_FSSQ%></label></td>
					<td><label><%=YMWBMYBB_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">纹枯病</td>
					<td><label><%=WKB_FSCD%>级</label></td>
					<td><label><%=WKB_FSMJ%></label></td>
					<td><label><%=WKB_FZMJ%></label></td>
					<td><label><%=WKB_SJSS%></label></td>
					<td><label><%=WKB_WHSS%></label></td>
					<td><label><%=WKB_FSQY%></label></td>
					<td><label><%=WKB_FSSQ%></label></td>
					<td><label><%=WKB_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">丝黑穗病</td>
					<td><label><%=SHSB_FSCD%>级</label></td>
					<td><label><%=SHSB_FSMJ%></label></td>
					<td><label><%=SHSB_FZMJ%></label></td>
					<td><label><%=SHSB_SJSS%></label></td>
					<td><label><%=SHSB_WHSS%></label></td>
					<td><label><%=SHSB_FSQY%></label></td>
					<td><label><%=SHSB_FSSQ%></label></td>
					<td><label><%=SHSB_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">锈病</td>
					<td><label><%=XB_FSCD%>级</label></td>
					<td><label><%=XB_FSMJ%></label></td>
					<td><label><%=XB_FZMJ%></label></td>
					<td><label><%=XB_SJSS%></label></td>
					<td><label><%=XB_WHSS%></label></td>
					<td><label><%=XB_FSQY%></label></td>
					<td><label><%=XB_FSSQ%></label></td>
					<td><label><%=XB_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">瘤黑粉病</td>
					<td><label><%=LHFB_FSCD%>级</label></td>
					<td><label><%=LHFB_FSMJ%></label></td>
					<td><label><%=LHFB_FZMJ%></label></td>
					<td><label><%=LHFB_SJSS%></label></td>
					<td><label><%=LHFB_WHSS%></label></td>
					<td><label><%=LHFB_FSQY%></label></td>
					<td><label><%=LHFB_FSSQ%></label></td>
					<td><label><%=LHFB_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">粗缩病</td>
					<td><label><%=CSB_FSCD%>级</label></td>
					<td><label><%=CSB_FSMJ%></label></td>
					<td><label><%=CSB_FZMJ%></label></td>
					<td><label><%=CSB_SJSS%></label></td>
					<td><label><%=CSB_WHSS%></label></td>
					<td><label><%=CSB_FSQY%></label></td>
					<td><label><%=CSB_FSSQ%></label></td>
					<td><label><%=CSB_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">顶腐病</td>
					<td><label><%=DFB_FSCD%>级</label></td>
					<td><label><%=DFB_FSMJ%></label></td>
					<td><label><%=DFB_FZMJ%></label></td>
					<td><label><%=DFB_SJSS%></label></td>
					<td><label><%=DFB_WHSS%></label></td>
					<td><label><%=DFB_FSQY%></label></td>
					<td><label><%=DFB_FSSQ%></label></td>
					<td><label><%=DFB_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">其他病害</td>
					<td><label><%=QTB_FSCD%>级</label></td>
					<td><label><%=QTB_FSMJ%></label></td>
					<td><label><%=QTB_FZMJ%></label></td>
					<td><label><%=QTB_SJSS%></label></td>
					<td><label><%=QTB_WHSS%></label></td>
					<td><label><%=QTB_FSQY%></label></td>
					<td><label><%=QTB_FSSQ%></label></td>
					<td><label><%=QTB_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">病害合计</td>
					<td style="text-align: center;">/</td>
					<td><label><%=BHHJ_FSMJ%></label></td>
					<td><label><%=BHHJ_FZMJ%></label></td>
					<td><label><%=BHHJ_SJSS%></label></td>
					<td><label><%=BHHJ_WHSS%></label></td>
					<td><label><%=BHHJ_FSQY%></label></td>
					<td><label><%=BHHJ_FSSQ%></label></td>
					<td><label><%=BHHJ_BZ%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">病虫合计</td>
					<td style="text-align: center;">/</td>
					<td><label><%=BCHJ_FSMJ%></label></td>
					<td><label><%=BCHJ_FZMJ%></label></td>
					<td><label><%=BCHJ_SJSS%></label></td>
					<td><label><%=BCHJ_WHSS%></label></td>
					<td><label><%=BCHJ_FSQY%></label></td>
					<td><label><%=BCHJ_FSSQ%></label></td>
					<td><label><%=BCHJ_BZ%></label></td>
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
		xzsel('YDYMM_FSCD','<%=YDYMM_FSCD%>');
		xzsel('EDYMM_FSCD','<%=EDYMM_FSCD%>');
		xzsel('SDYMM_FSCD','<%=SDYMM_FSCD%>');
		xzsel('EDWYE_FSCD','<%=EDWYE_FSCD%>');
		xzsel('EDNC_FSCD','<%=EDNC_FSCD%>');
		xzsel('SDNC_FSCD','<%=SDNC_FSCD%>');
		xzsel('EDMLC_FSCD','<%=EDMLC_FSCD%>');
		xzsel('SDMLC_FSCD','<%=SDMLC_FSCD%>');
		xzsel('FDMLC_FSCD','<%=FDMLC_FSCD%>');
		xzsel('CDM_FSCD','<%=CDM_FSCD%>');
		xzsel('YC_FSCD','<%=YC_FSCD%>');
		xzsel('JM_FSCD','<%=JM_FSCD%>');
		xzsel('YM_FSCD','<%=YM_FSCD%>');
		xzsel('SBYJC_FSCD','<%=SBYJC_FSCD%>');
		xzsel('TH_FSCD','<%=TH_FSCD%>');
		xzsel('DXHC_FSCD','<%=DXHC_FSCD%>');
		xzsel('QTCH_FSCD','<%=QTCH_FSCD%>');
		xzsel('DBB_FSCD','<%=DBB_FSCD%>');
		xzsel('XBB_FSCD','<%=XBB_FSCD%>');
		xzsel('HBB_FSCD','<%=HBB_FSCD%>');
		xzsel('YMWBMYBB_FSCD','<%=YMWBMYBB_FSCD%>');
		xzsel('WKB_FSCD','<%=WKB_FSCD%>');
		xzsel('SHSB_FSCD','<%=SHSB_FSCD%>');
		xzsel('XB_FSCD','<%=XB_FSCD%>');
		xzsel('LHFB_FSCD','<%=LHFB_FSCD%>');
		xzsel('CSB_FSCD','<%=CSB_FSCD%>');
		xzsel('DFB_FSCD','<%=DFB_FSCD%>');
		xzsel('QTB_FSCD','<%=QTB_FSCD%>');
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
		var ch = 0.0;
		var bh = 0.0;
		var hz = obj.name.split("_")[0]
				.substr(obj.name.split("_")[0].length - 1);
		if (!isNaN(obj.value)) {
			if ($("input[name='YDYMM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_FSMJ']").val());
			}
			if ($("input[name='EDYMM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_FSMJ']").val());
			}
			if ($("input[name='SDYMM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_FSMJ']").val());
			}
			if ($("input[name='EDWYE_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDWYE_FSMJ']").val());
			}
			if ($("input[name='EDNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_FSMJ']").val());
			}
			if ($("input[name='SDNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_FSMJ']").val());
			}
			if ($("input[name='EDMLC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDMLC_FSMJ']").val());
			}
			if ($("input[name='SDMLC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDMLC_FSMJ']").val());
			}
			if ($("input[name='FDMLC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='FDMLC_FSMJ']").val());
			}
			if ($("input[name='CDM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='CDM_FSMJ']").val());
			}
			if ($("input[name='YC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_FSMJ']").val());
			}
			if ($("input[name='JM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='JM_FSMJ']").val());
			}
			if ($("input[name='YM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YM_FSMJ']").val());
			}
			if ($("input[name='SBYJC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SBYJC_FSMJ']").val());
			}
			if ($("input[name='TH_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='TH_FSMJ']").val());
			}
			if ($("input[name='DXHC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DXHC_FSMJ']").val());
			}
			if ($("input[name='QTCH_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTCH_FSMJ']").val());
			}
			if ($("input[name='DBB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DBB_FSMJ']").val());
			}
			if ($("input[name='XBB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XBB_FSMJ']").val());
			}
			if ($("input[name='HBB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='HBB_FSMJ']").val());
			}
			if ($("input[name='YMWBMYBB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YMWBMYBB_FSMJ']").val());
			}
			if ($("input[name='WKB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_FSMJ']").val());
			}
			if ($("input[name='SHSB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SHSB_FSMJ']").val());
			}
			if ($("input[name='XB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XB_FSMJ']").val());
			}
			if ($("input[name='LHFB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='LHFB_FSMJ']").val());
			}
			if ($("input[name='CSB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='CSB_FSMJ']").val());
			}
			if ($("input[name='DFB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DFB_FSMJ']").val());
			}
			if ($("input[name='QTB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTB_FSMJ']").val());
			}
			if (hz == "B") {
				if ($("input[name='DBB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='DBB_FSMJ']").val());
				}
				if ($("input[name='XBB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='XBB_FSMJ']").val());
				}
				if ($("input[name='HBB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='HBB_FSMJ']").val());
				}
				if ($("input[name='YMWBMYBB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='YMWBMYBB_FSMJ']").val());
				}
				if ($("input[name='WKB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='WKB_FSMJ']").val());
				}
				if ($("input[name='SHSB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='SHSB_FSMJ']").val());
				}
				if ($("input[name='XB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='XB_FSMJ']").val());
				}
				if ($("input[name='LHFB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='LHFB_FSMJ']").val());
				}
				if ($("input[name='CSB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='CSB_FSMJ']").val());
				}
				if ($("input[name='DFB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='DFB_FSMJ']").val());
				}
				if ($("input[name='QTB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='QTB_FSMJ']").val());
				}
				$("input[name='BHHJ_FSMJ']").val(bh);
			} else {
				if ($("input[name='YDYMM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YDYMM_FSMJ']").val());
				}
				if ($("input[name='EDYMM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDYMM_FSMJ']").val());
				}
				if ($("input[name='SDYMM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SDYMM_FSMJ']").val());
				}
				if ($("input[name='EDWYE_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDWYE_FSMJ']").val());
				}
				if ($("input[name='EDNC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDNC_FSMJ']").val());
				}
				if ($("input[name='SDNC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SDNC_FSMJ']").val());
				}
				if ($("input[name='EDMLC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDMLC_FSMJ']").val());
				}
				if ($("input[name='SDMLC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SDMLC_FSMJ']").val());
				}
				if ($("input[name='FDMLC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='FDMLC_FSMJ']").val());
				}
				if ($("input[name='CDM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='CDM_FSMJ']").val());
				}
				if ($("input[name='YC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YC_FSMJ']").val());
				}
				if ($("input[name='JM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='JM_FSMJ']").val());
				}
				if ($("input[name='YM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YM_FSMJ']").val());
				}
				if ($("input[name='SBYJC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SBYJC_FSMJ']").val());
				}
				if ($("input[name='TH_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='TH_FSMJ']").val());
				}
				if ($("input[name='DXHC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='DXHC_FSMJ']").val());
				}
				if ($("input[name='QTCH_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='QTCH_FSMJ']").val());
				}
				$("input[name='CHHJ_FSMJ']").val(ch);
			}
			$("input[name='BCHJ_FSMJ']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDYMM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_FSMJ']").val());
			}
			if ($("input[name='EDYMM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_FSMJ']").val());
			}
			if ($("input[name='SDYMM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_FSMJ']").val());
			}
			if ($("input[name='EDWYE_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDWYE_FSMJ']").val());
			}
			if ($("input[name='EDNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_FSMJ']").val());
			}
			if ($("input[name='SDNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_FSMJ']").val());
			}
			if ($("input[name='EDMLC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDMLC_FSMJ']").val());
			}
			if ($("input[name='SDMLC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDMLC_FSMJ']").val());
			}
			if ($("input[name='FDMLC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='FDMLC_FSMJ']").val());
			}
			if ($("input[name='CDM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='CDM_FSMJ']").val());
			}
			if ($("input[name='YC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_FSMJ']").val());
			}
			if ($("input[name='JM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='JM_FSMJ']").val());
			}
			if ($("input[name='YM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YM_FSMJ']").val());
			}
			if ($("input[name='SBYJC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SBYJC_FSMJ']").val());
			}
			if ($("input[name='TH_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='TH_FSMJ']").val());
			}
			if ($("input[name='DXHC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DXHC_FSMJ']").val());
			}
			if ($("input[name='QTCH_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTCH_FSMJ']").val());
			}
			if ($("input[name='DBB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DBB_FSMJ']").val());
			}
			if ($("input[name='XBB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XBB_FSMJ']").val());
			}
			if ($("input[name='HBB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='HBB_FSMJ']").val());
			}
			if ($("input[name='YMWBMYBB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YMWBMYBB_FSMJ']").val());
			}
			if ($("input[name='WKB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_FSMJ']").val());
			}
			if ($("input[name='SHSB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SHSB_FSMJ']").val());
			}
			if ($("input[name='XB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XB_FSMJ']").val());
			}
			if ($("input[name='LHFB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='LHFB_FSMJ']").val());
			}
			if ($("input[name='CSB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='CSB_FSMJ']").val());
			}
			if ($("input[name='DFB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DFB_FSMJ']").val());
			}
			if ($("input[name='QTB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTB_FSMJ']").val());
			}
			if (hz == "B") {
				if ($("input[name='DBB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='DBB_FSMJ']").val());
				}
				if ($("input[name='XBB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='XBB_FSMJ']").val());
				}
				if ($("input[name='HBB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='HBB_FSMJ']").val());
				}
				if ($("input[name='YMWBMYBB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='YMWBMYBB_FSMJ']").val());
				}
				if ($("input[name='WKB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='WKB_FSMJ']").val());
				}
				if ($("input[name='SHSB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='SHSB_FSMJ']").val());
				}
				if ($("input[name='XB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='XB_FSMJ']").val());
				}
				if ($("input[name='LHFB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='LHFB_FSMJ']").val());
				}
				if ($("input[name='CSB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='CSB_FSMJ']").val());
				}
				if ($("input[name='DFB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='DFB_FSMJ']").val());
				}
				if ($("input[name='QTB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='QTB_FSMJ']").val());
				}
				$("input[name='BHHJ_FSMJ']").val(bh);
			} else {
				if ($("input[name='YDYMM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YDYMM_FSMJ']").val());
				}
				if ($("input[name='EDYMM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDYMM_FSMJ']").val());
				}
				if ($("input[name='SDYMM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SDYMM_FSMJ']").val());
				}
				if ($("input[name='EDWYE_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDWYE_FSMJ']").val());
				}
				if ($("input[name='EDNC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDNC_FSMJ']").val());
				}
				if ($("input[name='SDNC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SDNC_FSMJ']").val());
				}
				if ($("input[name='EDMLC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDMLC_FSMJ']").val());
				}
				if ($("input[name='SDMLC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SDMLC_FSMJ']").val());
				}
				if ($("input[name='FDMLC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='FDMLC_FSMJ']").val());
				}
				if ($("input[name='CDM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='CDM_FSMJ']").val());
				}
				if ($("input[name='YC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YC_FSMJ']").val());
				}
				if ($("input[name='JM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='JM_FSMJ']").val());
				}
				if ($("input[name='YM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YM_FSMJ']").val());
				}
				if ($("input[name='SBYJC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SBYJC_FSMJ']").val());
				}
				if ($("input[name='TH_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='TH_FSMJ']").val());
				}
				if ($("input[name='DXHC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='DXHC_FSMJ']").val());
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
		var ch = 0.0;
		var bh = 0.0;
		var hz = obj.name.split("_")[0]
				.substr(obj.name.split("_")[0].length - 1);
		if (!isNaN(obj.value)) {
			if ($("input[name='YDYMM_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_FZMJ']").val());
			}
			if ($("input[name='EDYMM_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_FZMJ']").val());
			}
			if ($("input[name='SDYMM_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_FZMJ']").val());
			}
			if ($("input[name='EDWYE_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDWYE_FZMJ']").val());
			}
			if ($("input[name='EDNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_FZMJ']").val());
			}
			if ($("input[name='SDNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_FZMJ']").val());
			}
			if ($("input[name='EDMLC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDMLC_FZMJ']").val());
			}
			if ($("input[name='SDMLC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDMLC_FZMJ']").val());
			}
			if ($("input[name='FDMLC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='FDMLC_FZMJ']").val());
			}
			if ($("input[name='CDM_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='CDM_FZMJ']").val());
			}
			if ($("input[name='YC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_FZMJ']").val());
			}
			if ($("input[name='JM_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='JM_FZMJ']").val());
			}
			if ($("input[name='YM_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YM_FZMJ']").val());
			}
			if ($("input[name='SBYJC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SBYJC_FZMJ']").val());
			}
			if ($("input[name='TH_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='TH_FZMJ']").val());
			}
			if ($("input[name='DXHC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DXHC_FZMJ']").val());
			}
			if ($("input[name='QTCH_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTCH_FZMJ']").val());
			}
			if ($("input[name='DBB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DBB_FZMJ']").val());
			}
			if ($("input[name='XBB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XBB_FZMJ']").val());
			}
			if ($("input[name='HBB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='HBB_FZMJ']").val());
			}
			if ($("input[name='YMWBMYBB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YMWBMYBB_FZMJ']").val());
			}
			if ($("input[name='WKB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_FZMJ']").val());
			}
			if ($("input[name='SHSB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SHSB_FZMJ']").val());
			}
			if ($("input[name='XB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XB_FZMJ']").val());
			}
			if ($("input[name='LHFB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='LHFB_FZMJ']").val());
			}
			if ($("input[name='CSB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='CSB_FZMJ']").val());
			}
			if ($("input[name='DFB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DFB_FZMJ']").val());
			}
			if ($("input[name='QTB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTB_FZMJ']").val());
			}
			if (hz == "B") {
				if ($("input[name='DBB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='DBB_FZMJ']").val());
				}
				if ($("input[name='XBB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='XBB_FZMJ']").val());
				}
				if ($("input[name='HBB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='HBB_FZMJ']").val());
				}
				if ($("input[name='YMWBMYBB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='YMWBMYBB_FZMJ']").val());
				}
				if ($("input[name='WKB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='WKB_FZMJ']").val());
				}
				if ($("input[name='SHSB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='SHSB_FZMJ']").val());
				}
				if ($("input[name='XB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='XB_FZMJ']").val());
				}
				if ($("input[name='LHFB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='LHFB_FZMJ']").val());
				}
				if ($("input[name='CSB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='CSB_FZMJ']").val());
				}
				if ($("input[name='DFB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='DFB_FZMJ']").val());
				}
				if ($("input[name='QTB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='QTB_FZMJ']").val());
				}
				$("input[name='BHHJ_FZMJ']").val(bh);
			} else {
				if ($("input[name='YDYMM_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YDYMM_FZMJ']").val());
				}
				if ($("input[name='EDYMM_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDYMM_FZMJ']").val());
				}
				if ($("input[name='SDYMM_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SDYMM_FZMJ']").val());
				}
				if ($("input[name='EDWYE_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDWYE_FZMJ']").val());
				}
				if ($("input[name='EDNC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDNC_FZMJ']").val());
				}
				if ($("input[name='SDNC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SDNC_FZMJ']").val());
				}
				if ($("input[name='EDMLC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDMLC_FZMJ']").val());
				}
				if ($("input[name='SDMLC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SDMLC_FZMJ']").val());
				}
				if ($("input[name='FDMLC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='FDMLC_FZMJ']").val());
				}
				if ($("input[name='CDM_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='CDM_FZMJ']").val());
				}
				if ($("input[name='YC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YC_FZMJ']").val());
				}
				if ($("input[name='JM_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='JM_FZMJ']").val());
				}
				if ($("input[name='YM_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YM_FZMJ']").val());
				}
				if ($("input[name='SBYJC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SBYJC_FZMJ']").val());
				}
				if ($("input[name='TH_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='TH_FZMJ']").val());
				}
				if ($("input[name='DXHC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='DXHC_FZMJ']").val());
				}
				if ($("input[name='QTCH_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='QTCH_FZMJ']").val());
				}
				$("input[name='CHHJ_FZMJ']").val(ch);
			}
			$("input[name='BCHJ_FZMJ']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDYMM_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_FZMJ']").val());
			}
			if ($("input[name='EDYMM_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_FZMJ']").val());
			}
			if ($("input[name='SDYMM_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_FZMJ']").val());
			}
			if ($("input[name='EDWYE_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDWYE_FZMJ']").val());
			}
			if ($("input[name='EDNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_FZMJ']").val());
			}
			if ($("input[name='SDNC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_FZMJ']").val());
			}
			if ($("input[name='EDMLC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDMLC_FZMJ']").val());
			}
			if ($("input[name='SDMLC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDMLC_FZMJ']").val());
			}
			if ($("input[name='FDMLC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='FDMLC_FZMJ']").val());
			}
			if ($("input[name='CDM_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='CDM_FZMJ']").val());
			}
			if ($("input[name='YC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_FZMJ']").val());
			}
			if ($("input[name='JM_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='JM_FZMJ']").val());
			}
			if ($("input[name='YM_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YM_FZMJ']").val());
			}
			if ($("input[name='SBYJC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SBYJC_FZMJ']").val());
			}
			if ($("input[name='TH_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='TH_FZMJ']").val());
			}
			if ($("input[name='DXHC_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DXHC_FZMJ']").val());
			}
			if ($("input[name='QTCH_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTCH_FZMJ']").val());
			}
			if ($("input[name='DBB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DBB_FZMJ']").val());
			}
			if ($("input[name='XBB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XBB_FZMJ']").val());
			}
			if ($("input[name='HBB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='HBB_FZMJ']").val());
			}
			if ($("input[name='YMWBMYBB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YMWBMYBB_FZMJ']").val());
			}
			if ($("input[name='WKB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_FZMJ']").val());
			}
			if ($("input[name='SHSB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SHSB_FZMJ']").val());
			}
			if ($("input[name='XB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XB_FZMJ']").val());
			}
			if ($("input[name='LHFB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='LHFB_FZMJ']").val());
			}
			if ($("input[name='CSB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='CSB_FZMJ']").val());
			}
			if ($("input[name='DFB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DFB_FZMJ']").val());
			}
			if ($("input[name='QTB_FZMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTB_FZMJ']").val());
			}
			if (hz == "B") {
				if ($("input[name='DBB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='DBB_FZMJ']").val());
				}
				if ($("input[name='XBB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='XBB_FZMJ']").val());
				}
				if ($("input[name='HBB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='HBB_FZMJ']").val());
				}
				if ($("input[name='YMWBMYBB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='YMWBMYBB_FZMJ']").val());
				}
				if ($("input[name='WKB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='WKB_FZMJ']").val());
				}
				if ($("input[name='SHSB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='SHSB_FZMJ']").val());
				}
				if ($("input[name='XB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='XB_FZMJ']").val());
				}
				if ($("input[name='LHFB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='LHFB_FZMJ']").val());
				}
				if ($("input[name='CSB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='CSB_FZMJ']").val());
				}
				if ($("input[name='DFB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='DFB_FZMJ']").val());
				}
				if ($("input[name='QTB_FZMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='QTB_FZMJ']").val());
				}
				$("input[name='BHHJ_FZMJ']").val(bh);
			} else {
				if ($("input[name='YDYMM_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YDYMM_FZMJ']").val());
				}
				if ($("input[name='EDYMM_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDYMM_FZMJ']").val());
				}
				if ($("input[name='SDYMM_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SDYMM_FZMJ']").val());
				}
				if ($("input[name='EDWYE_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDWYE_FZMJ']").val());
				}
				if ($("input[name='EDNC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDNC_FZMJ']").val());
				}
				if ($("input[name='SDNC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SDNC_FZMJ']").val());
				}
				if ($("input[name='EDMLC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDMLC_FZMJ']").val());
				}
				if ($("input[name='SDMLC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SDMLC_FZMJ']").val());
				}
				if ($("input[name='FDMLC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='FDMLC_FZMJ']").val());
				}
				if ($("input[name='CDM_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='CDM_FZMJ']").val());
				}
				if ($("input[name='YC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YC_FZMJ']").val());
				}
				if ($("input[name='JM_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='JM_FZMJ']").val());
				}
				if ($("input[name='YM_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YM_FZMJ']").val());
				}
				if ($("input[name='SBYJC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SBYJC_FZMJ']").val());
				}
				if ($("input[name='TH_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='TH_FZMJ']").val());
				}
				if ($("input[name='DXHC_FZMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='DXHC_FZMJ']").val());
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
		var ch = 0.0;
		var bh = 0.0;
		var hz = obj.name.split("_")[0]
				.substr(obj.name.split("_")[0].length - 1);
		if (!isNaN(obj.value)) {
			if ($("input[name='YDYMM_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_SJSS']").val());
			}
			if ($("input[name='EDYMM_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_SJSS']").val());
			}
			if ($("input[name='SDYMM_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_SJSS']").val());
			}
			if ($("input[name='EDWYE_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDWYE_SJSS']").val());
			}
			if ($("input[name='EDNC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_SJSS']").val());
			}
			if ($("input[name='SDNC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_SJSS']").val());
			}
			if ($("input[name='EDMLC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDMLC_SJSS']").val());
			}
			if ($("input[name='SDMLC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDMLC_SJSS']").val());
			}
			if ($("input[name='FDMLC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='FDMLC_SJSS']").val());
			}
			if ($("input[name='CDM_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='CDM_SJSS']").val());
			}
			if ($("input[name='YC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_SJSS']").val());
			}
			if ($("input[name='JM_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='JM_SJSS']").val());
			}
			if ($("input[name='YM_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YM_SJSS']").val());
			}
			if ($("input[name='SBYJC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='SBYJC_SJSS']").val());
			}
			if ($("input[name='TH_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='TH_SJSS']").val());
			}
			if ($("input[name='DXHC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='DXHC_SJSS']").val());
			}
			if ($("input[name='QTCH_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='QTCH_SJSS']").val());
			}
			if ($("input[name='DBB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='DBB_SJSS']").val());
			}
			if ($("input[name='XBB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='XBB_SJSS']").val());
			}
			if ($("input[name='HBB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='HBB_SJSS']").val());
			}
			if ($("input[name='YMWBMYBB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YMWBMYBB_SJSS']").val());
			}
			if ($("input[name='WKB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_SJSS']").val());
			}
			if ($("input[name='SHSB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='SHSB_SJSS']").val());
			}
			if ($("input[name='XB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='XB_SJSS']").val());
			}
			if ($("input[name='LHFB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='LHFB_SJSS']").val());
			}
			if ($("input[name='CSB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='CSB_SJSS']").val());
			}
			if ($("input[name='DFB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='DFB_SJSS']").val());
			}
			if ($("input[name='QTB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='QTB_SJSS']").val());
			}
			if (hz == "B") {
				if ($("input[name='DBB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='DBB_SJSS']").val());
				}
				if ($("input[name='XBB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='XBB_SJSS']").val());
				}
				if ($("input[name='HBB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='HBB_SJSS']").val());
				}
				if ($("input[name='YMWBMYBB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='YMWBMYBB_SJSS']").val());
				}
				if ($("input[name='WKB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='WKB_SJSS']").val());
				}
				if ($("input[name='SHSB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='SHSB_SJSS']").val());
				}
				if ($("input[name='XB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='XB_SJSS']").val());
				}
				if ($("input[name='LHFB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='LHFB_SJSS']").val());
				}
				if ($("input[name='CSB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='CSB_SJSS']").val());
				}
				if ($("input[name='DFB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='DFB_SJSS']").val());
				}
				if ($("input[name='QTB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='QTB_SJSS']").val());
				}
				$("input[name='BHHJ_SJSS']").val(bh);
			} else {
				if ($("input[name='YDYMM_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='YDYMM_SJSS']").val());
				}
				if ($("input[name='EDYMM_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='EDYMM_SJSS']").val());
				}
				if ($("input[name='SDYMM_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='SDYMM_SJSS']").val());
				}
				if ($("input[name='EDWYE_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='EDWYE_SJSS']").val());
				}
				if ($("input[name='EDNC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='EDNC_SJSS']").val());
				}
				if ($("input[name='SDNC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='SDNC_SJSS']").val());
				}
				if ($("input[name='EDMLC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='EDMLC_SJSS']").val());
				}
				if ($("input[name='SDMLC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='SDMLC_SJSS']").val());
				}
				if ($("input[name='FDMLC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='FDMLC_SJSS']").val());
				}
				if ($("input[name='CDM_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='CDM_SJSS']").val());
				}
				if ($("input[name='YC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='YC_SJSS']").val());
				}
				if ($("input[name='JM_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='JM_SJSS']").val());
				}
				if ($("input[name='YM_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='YM_SJSS']").val());
				}
				if ($("input[name='SBYJC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='SBYJC_SJSS']").val());
				}
				if ($("input[name='TH_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='TH_SJSS']").val());
				}
				if ($("input[name='DXHC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='DXHC_SJSS']").val());
				}
				if ($("input[name='QTCH_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='QTCH_SJSS']").val());
				}
				$("input[name='CHHJ_SJSS']").val(ch);
			}
			$("input[name='BCHJ_SJSS']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDYMM_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_SJSS']").val());
			}
			if ($("input[name='EDYMM_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_SJSS']").val());
			}
			if ($("input[name='SDYMM_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_SJSS']").val());
			}
			if ($("input[name='EDWYE_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDWYE_SJSS']").val());
			}
			if ($("input[name='EDNC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_SJSS']").val());
			}
			if ($("input[name='SDNC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_SJSS']").val());
			}
			if ($("input[name='EDMLC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDMLC_SJSS']").val());
			}
			if ($("input[name='SDMLC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDMLC_SJSS']").val());
			}
			if ($("input[name='FDMLC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='FDMLC_SJSS']").val());
			}
			if ($("input[name='CDM_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='CDM_SJSS']").val());
			}
			if ($("input[name='YC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_SJSS']").val());
			}
			if ($("input[name='JM_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='JM_SJSS']").val());
			}
			if ($("input[name='YM_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YM_SJSS']").val());
			}
			if ($("input[name='SBYJC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='SBYJC_SJSS']").val());
			}
			if ($("input[name='TH_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='TH_SJSS']").val());
			}
			if ($("input[name='DXHC_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='DXHC_SJSS']").val());
			}
			if ($("input[name='QTCH_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='QTCH_SJSS']").val());
			}
			if ($("input[name='DBB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='DBB_SJSS']").val());
			}
			if ($("input[name='XBB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='XBB_SJSS']").val());
			}
			if ($("input[name='HBB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='HBB_SJSS']").val());
			}
			if ($("input[name='YMWBMYBB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YMWBMYBB_SJSS']").val());
			}
			if ($("input[name='WKB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_SJSS']").val());
			}
			if ($("input[name='SHSB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='SHSB_SJSS']").val());
			}
			if ($("input[name='XB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='XB_SJSS']").val());
			}
			if ($("input[name='LHFB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='LHFB_SJSS']").val());
			}
			if ($("input[name='CSB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='CSB_SJSS']").val());
			}
			if ($("input[name='DFB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='DFB_SJSS']").val());
			}
			if ($("input[name='QTB_SJSS']").val() != "") {
				zh = zh + parseFloat($("input[name='QTB_SJSS']").val());
			}
			if (hz == "B") {
				if ($("input[name='DBB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='DBB_SJSS']").val());
				}
				if ($("input[name='XBB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='XBB_SJSS']").val());
				}
				if ($("input[name='HBB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='HBB_SJSS']").val());
				}
				if ($("input[name='YMWBMYBB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='YMWBMYBB_SJSS']").val());
				}
				if ($("input[name='WKB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='WKB_SJSS']").val());
				}
				if ($("input[name='SHSB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='SHSB_SJSS']").val());
				}
				if ($("input[name='XB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='XB_SJSS']").val());
				}
				if ($("input[name='LHFB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='LHFB_SJSS']").val());
				}
				if ($("input[name='CSB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='CSB_SJSS']").val());
				}
				if ($("input[name='DFB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='DFB_SJSS']").val());
				}
				if ($("input[name='QTB_SJSS']").val() != "") {
					bh = bh + parseFloat($("input[name='QTB_SJSS']").val());
				}
				$("input[name='BHHJ_SJSS']").val(bh);
			} else {
				if ($("input[name='YDYMM_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='YDYMM_SJSS']").val());
				}
				if ($("input[name='EDYMM_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='EDYMM_SJSS']").val());
				}
				if ($("input[name='SDYMM_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='SDYMM_SJSS']").val());
				}
				if ($("input[name='EDWYE_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='EDWYE_SJSS']").val());
				}
				if ($("input[name='EDNC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='EDNC_SJSS']").val());
				}
				if ($("input[name='SDNC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='SDNC_SJSS']").val());
				}
				if ($("input[name='EDMLC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='EDMLC_SJSS']").val());
				}
				if ($("input[name='SDMLC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='SDMLC_SJSS']").val());
				}
				if ($("input[name='FDMLC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='FDMLC_SJSS']").val());
				}
				if ($("input[name='CDM_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='CDM_SJSS']").val());
				}
				if ($("input[name='YC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='YC_SJSS']").val());
				}
				if ($("input[name='JM_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='JM_SJSS']").val());
				}
				if ($("input[name='YM_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='YM_SJSS']").val());
				}
				if ($("input[name='SBYJC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='SBYJC_SJSS']").val());
				}
				if ($("input[name='TH_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='TH_SJSS']").val());
				}
				if ($("input[name='DXHC_SJSS']").val() != "") {
					ch = ch + parseFloat($("input[name='DXHC_SJSS']").val());
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
		var ch = 0.0;
		var bh = 0.0;
		var hz = obj.name.split("_")[0]
				.substr(obj.name.split("_")[0].length - 1);
		if (!isNaN(obj.value)) {
			if ($("input[name='YDYMM_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_WHSS']").val());
			}
			if ($("input[name='EDYMM_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_WHSS']").val());
			}
			if ($("input[name='SDYMM_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_WHSS']").val());
			}
			if ($("input[name='EDWYE_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDWYE_WHSS']").val());
			}
			if ($("input[name='EDNC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_WHSS']").val());
			}
			if ($("input[name='SDNC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_WHSS']").val());
			}
			if ($("input[name='EDMLC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDMLC_WHSS']").val());
			}
			if ($("input[name='SDMLC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDMLC_WHSS']").val());
			}
			if ($("input[name='FDMLC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='FDMLC_WHSS']").val());
			}
			if ($("input[name='CDM_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='CDM_WHSS']").val());
			}
			if ($("input[name='YC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_WHSS']").val());
			}
			if ($("input[name='JM_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='JM_WHSS']").val());
			}
			if ($("input[name='YM_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YM_WHSS']").val());
			}
			if ($("input[name='SBYJC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='SBYJC_WHSS']").val());
			}
			if ($("input[name='TH_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='TH_WHSS']").val());
			}
			if ($("input[name='DXHC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='DXHC_WHSS']").val());
			}
			if ($("input[name='QTCH_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='QTCH_WHSS']").val());
			}
			if ($("input[name='DBB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='DBB_WHSS']").val());
			}
			if ($("input[name='XBB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='XBB_WHSS']").val());
			}
			if ($("input[name='HBB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='HBB_WHSS']").val());
			}
			if ($("input[name='YMWBMYBB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YMWBMYBB_WHSS']").val());
			}
			if ($("input[name='WKB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_WHSS']").val());
			}
			if ($("input[name='SHSB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='SHSB_WHSS']").val());
			}
			if ($("input[name='XB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='XB_WHSS']").val());
			}
			if ($("input[name='LHFB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='LHFB_WHSS']").val());
			}
			if ($("input[name='CSB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='CSB_WHSS']").val());
			}
			if ($("input[name='DFB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='DFB_WHSS']").val());
			}
			if ($("input[name='QTB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='QTB_WHSS']").val());
			}
			if (hz == "B") {
				if ($("input[name='DBB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='DBB_WHSS']").val());
				}
				if ($("input[name='XBB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='XBB_WHSS']").val());
				}
				if ($("input[name='HBB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='HBB_WHSS']").val());
				}
				if ($("input[name='YMWBMYBB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='YMWBMYBB_WHSS']").val());
				}
				if ($("input[name='WKB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='WKB_WHSS']").val());
				}
				if ($("input[name='SHSB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='SHSB_WHSS']").val());
				}
				if ($("input[name='XB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='XB_WHSS']").val());
				}
				if ($("input[name='LHFB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='LHFB_WHSS']").val());
				}
				if ($("input[name='CSB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='CSB_WHSS']").val());
				}
				if ($("input[name='DFB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='DFB_WHSS']").val());
				}
				if ($("input[name='QTB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='QTB_WHSS']").val());
				}
				$("input[name='BHHJ_WHSS']").val(bh);
			} else {
				if ($("input[name='YDYMM_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='YDYMM_WHSS']").val());
				}
				if ($("input[name='EDYMM_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='EDYMM_WHSS']").val());
				}
				if ($("input[name='SDYMM_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='SDYMM_WHSS']").val());
				}
				if ($("input[name='EDWYE_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='EDWYE_WHSS']").val());
				}
				if ($("input[name='EDNC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='EDNC_WHSS']").val());
				}
				if ($("input[name='SDNC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='SDNC_WHSS']").val());
				}
				if ($("input[name='EDMLC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='EDMLC_WHSS']").val());
				}
				if ($("input[name='SDMLC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='SDMLC_WHSS']").val());
				}
				if ($("input[name='FDMLC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='FDMLC_WHSS']").val());
				}
				if ($("input[name='CDM_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='CDM_WHSS']").val());
				}
				if ($("input[name='YC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='YC_WHSS']").val());
				}
				if ($("input[name='JM_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='JM_WHSS']").val());
				}
				if ($("input[name='YM_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='YM_WHSS']").val());
				}
				if ($("input[name='SBYJC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='SBYJC_WHSS']").val());
				}
				if ($("input[name='TH_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='TH_WHSS']").val());
				}
				if ($("input[name='DXHC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='DXHC_WHSS']").val());
				}
				if ($("input[name='QTCH_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='QTCH_WHSS']").val());
				}
				$("input[name='CHHJ_WHSS']").val(ch);
			}
			$("input[name='BCHJ_WHSS']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDYMM_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_WHSS']").val());
			}
			if ($("input[name='EDYMM_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_WHSS']").val());
			}
			if ($("input[name='SDYMM_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_WHSS']").val());
			}
			if ($("input[name='EDWYE_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDWYE_WHSS']").val());
			}
			if ($("input[name='EDNC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_WHSS']").val());
			}
			if ($("input[name='SDNC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_WHSS']").val());
			}
			if ($("input[name='EDMLC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDMLC_WHSS']").val());
			}
			if ($("input[name='SDMLC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDMLC_WHSS']").val());
			}
			if ($("input[name='FDMLC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='FDMLC_WHSS']").val());
			}
			if ($("input[name='CDM_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='CDM_WHSS']").val());
			}
			if ($("input[name='YC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_WHSS']").val());
			}
			if ($("input[name='JM_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='JM_WHSS']").val());
			}
			if ($("input[name='YM_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YM_WHSS']").val());
			}
			if ($("input[name='SBYJC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='SBYJC_WHSS']").val());
			}
			if ($("input[name='TH_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='TH_WHSS']").val());
			}
			if ($("input[name='DXHC_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='DXHC_WHSS']").val());
			}
			if ($("input[name='QTCH_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='QTCH_WHSS']").val());
			}
			if ($("input[name='DBB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='DBB_WHSS']").val());
			}
			if ($("input[name='XBB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='XBB_WHSS']").val());
			}
			if ($("input[name='HBB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='HBB_WHSS']").val());
			}
			if ($("input[name='YMWBMYBB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='YMWBMYBB_WHSS']").val());
			}
			if ($("input[name='WKB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_WHSS']").val());
			}
			if ($("input[name='SHSB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='SHSB_WHSS']").val());
			}
			if ($("input[name='XB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='XB_WHSS']").val());
			}
			if ($("input[name='LHFB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='LHFB_WHSS']").val());
			}
			if ($("input[name='CSB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='CSB_WHSS']").val());
			}
			if ($("input[name='DFB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='DFB_WHSS']").val());
			}
			if ($("input[name='QTB_WHSS']").val() != "") {
				zh = zh + parseFloat($("input[name='QTB_WHSS']").val());
			}
			if (hz == "B") {
				if ($("input[name='DBB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='DBB_WHSS']").val());
				}
				if ($("input[name='XBB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='XBB_WHSS']").val());
				}
				if ($("input[name='HBB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='HBB_WHSS']").val());
				}
				if ($("input[name='YMWBMYBB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='YMWBMYBB_WHSS']").val());
				}
				if ($("input[name='WKB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='WKB_WHSS']").val());
				}
				if ($("input[name='SHSB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='SHSB_WHSS']").val());
				}
				if ($("input[name='XB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='XB_WHSS']").val());
				}
				if ($("input[name='LHFB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='LHFB_WHSS']").val());
				}
				if ($("input[name='CSB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='CSB_WHSS']").val());
				}
				if ($("input[name='DFB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='DFB_WHSS']").val());
				}
				if ($("input[name='QTB_WHSS']").val() != "") {
					bh = bh + parseFloat($("input[name='QTB_WHSS']").val());
				}
				$("input[name='BHHJ_WHSS']").val(bh);
			} else {
				if ($("input[name='YDYMM_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='YDYMM_WHSS']").val());
				}
				if ($("input[name='EDYMM_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='EDYMM_WHSS']").val());
				}
				if ($("input[name='SDYMM_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='SDYMM_WHSS']").val());
				}
				if ($("input[name='EDWYE_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='EDWYE_WHSS']").val());
				}
				if ($("input[name='EDNC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='EDNC_WHSS']").val());
				}
				if ($("input[name='SDNC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='SDNC_WHSS']").val());
				}
				if ($("input[name='EDMLC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='EDMLC_WHSS']").val());
				}
				if ($("input[name='SDMLC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='SDMLC_WHSS']").val());
				}
				if ($("input[name='FDMLC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='FDMLC_WHSS']").val());
				}
				if ($("input[name='CDM_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='CDM_WHSS']").val());
				}
				if ($("input[name='YC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='YC_WHSS']").val());
				}
				if ($("input[name='JM_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='JM_WHSS']").val());
				}
				if ($("input[name='YM_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='YM_WHSS']").val());
				}
				if ($("input[name='SBYJC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='SBYJC_WHSS']").val());
				}
				if ($("input[name='TH_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='TH_WHSS']").val());
				}
				if ($("input[name='DXHC_WHSS']").val() != "") {
					ch = ch + parseFloat($("input[name='DXHC_WHSS']").val());
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