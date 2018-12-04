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
					if(rsbody.getString("YDYMM_FSSQ")!=null)
					{
					YDYMM_FSSQ = rsbody.getString("YDYMM_FSSQ").substring(0,10);
					}
					YDYMM_BZ = rsbody.getString("YDYMM_BZ")==null?"":rsbody.getString("YDYMM_BZ");
					EDYMM_FSCD = rsbody.getString("EDYMM_FSCD")==null?"":rsbody.getString("EDYMM_FSCD");
					EDYMM_FSMJ = rsbody.getString("EDYMM_FSMJ")==null?"":rsbody.getString("EDYMM_FSMJ");
					EDYMM_FZMJ = rsbody.getString("EDYMM_FZMJ")==null?"":rsbody.getString("EDYMM_FZMJ");
					EDYMM_SJSS = rsbody.getString("EDYMM_SJSS")==null?"":rsbody.getString("EDYMM_SJSS");
					EDYMM_WHSS = rsbody.getString("EDYMM_WHSS")==null?"":rsbody.getString("EDYMM_WHSS");
					EDYMM_FSQY = rsbody.getString("EDYMM_FSQY")==null?"":rsbody.getString("EDYMM_FSQY");
					if(rsbody.getString("EDYMM_FSSQ")!=null)
					{
					EDYMM_FSSQ = rsbody.getString("EDYMM_FSSQ").substring(0,10);
					}
					EDYMM_BZ = rsbody.getString("EDYMM_BZ")==null?"":rsbody.getString("EDYMM_BZ");
					SDYMM_FSCD = rsbody.getString("SDYMM_FSCD")==null?"":rsbody.getString("SDYMM_FSCD");
					SDYMM_FSMJ = rsbody.getString("SDYMM_FSMJ")==null?"":rsbody.getString("SDYMM_FSMJ");
					SDYMM_FZMJ = rsbody.getString("SDYMM_FZMJ")==null?"":rsbody.getString("SDYMM_FZMJ");
					SDYMM_SJSS = rsbody.getString("SDYMM_SJSS")==null?"":rsbody.getString("SDYMM_SJSS");
					SDYMM_WHSS = rsbody.getString("SDYMM_WHSS")==null?"":rsbody.getString("SDYMM_WHSS");
					SDYMM_FSQY = rsbody.getString("SDYMM_FSQY")==null?"":rsbody.getString("SDYMM_FSQY");
					if(rsbody.getString("SDYMM_FSSQ")!=null)
					{
					SDYMM_FSSQ = rsbody.getString("SDYMM_FSSQ").substring(0,10);
					}
					SDYMM_BZ = rsbody.getString("SDYMM_BZ")==null?"":rsbody.getString("SDYMM_BZ");
					EDWYE_FSCD = rsbody.getString("EDWYE_FSCD")==null?"":rsbody.getString("EDWYE_FSCD");
					EDWYE_FSMJ = rsbody.getString("EDWYE_FSMJ")==null?"":rsbody.getString("EDWYE_FSMJ");
					EDWYE_FZMJ = rsbody.getString("EDWYE_FZMJ")==null?"":rsbody.getString("EDWYE_FZMJ");
					EDWYE_SJSS = rsbody.getString("EDWYE_SJSS")==null?"":rsbody.getString("EDWYE_SJSS");
					EDWYE_WHSS = rsbody.getString("EDWYE_WHSS")==null?"":rsbody.getString("EDWYE_WHSS");
					EDWYE_FSQY = rsbody.getString("EDWYE_FSQY")==null?"":rsbody.getString("EDWYE_FSQY");
					if(rsbody.getString("EDWYE_FSSQ")!=null)
					{
					EDWYE_FSSQ = rsbody.getString("EDWYE_FSSQ").substring(0,10);
					}
					EDWYE_BZ = rsbody.getString("EDWYE_BZ")==null?"":rsbody.getString("EDWYE_BZ");
					EDNC_FSCD = rsbody.getString("EDNC_FSCD")==null?"":rsbody.getString("EDNC_FSCD");
					EDNC_FSMJ = rsbody.getString("EDNC_FSMJ")==null?"":rsbody.getString("EDNC_FSMJ");
					EDNC_FZMJ = rsbody.getString("EDNC_FZMJ")==null?"":rsbody.getString("EDNC_FZMJ");
					EDNC_SJSS = rsbody.getString("EDNC_SJSS")==null?"":rsbody.getString("EDNC_SJSS");
					EDNC_WHSS = rsbody.getString("EDNC_WHSS")==null?"":rsbody.getString("EDNC_WHSS");
					EDNC_FSQY = rsbody.getString("EDNC_FSQY")==null?"":rsbody.getString("EDNC_FSQY");
					if(rsbody.getString("EDNC_FSSQ")!=null)
					{
					EDNC_FSSQ = rsbody.getString("EDNC_FSSQ").substring(0,10);
					}
					EDNC_BZ = rsbody.getString("EDNC_BZ")==null?"":rsbody.getString("EDNC_BZ");
					SDNC_FSCD = rsbody.getString("SDNC_FSCD")==null?"":rsbody.getString("SDNC_FSCD");
					SDNC_FSMJ = rsbody.getString("SDNC_FSMJ")==null?"":rsbody.getString("SDNC_FSMJ");
					SDNC_FZMJ = rsbody.getString("SDNC_FZMJ")==null?"":rsbody.getString("SDNC_FZMJ");
					SDNC_SJSS = rsbody.getString("SDNC_SJSS")==null?"":rsbody.getString("SDNC_SJSS");
					SDNC_WHSS = rsbody.getString("SDNC_WHSS")==null?"":rsbody.getString("SDNC_WHSS");
					SDNC_FSQY = rsbody.getString("SDNC_FSQY")==null?"":rsbody.getString("SDNC_FSQY");
					if(rsbody.getString("SDNC_FSSQ")!=null)
					{
					SDNC_FSSQ = rsbody.getString("SDNC_FSSQ").substring(0,10);
					}
					SDNC_BZ = rsbody.getString("SDNC_BZ")==null?"":rsbody.getString("SDNC_BZ");
					EDMLC_FSCD = rsbody.getString("EDMLC_FSCD")==null?"":rsbody.getString("EDMLC_FSCD");
					EDMLC_FSMJ = rsbody.getString("EDMLC_FSMJ")==null?"":rsbody.getString("EDMLC_FSMJ");
					EDMLC_FZMJ = rsbody.getString("EDMLC_FZMJ")==null?"":rsbody.getString("EDMLC_FZMJ");
					EDMLC_SJSS = rsbody.getString("EDMLC_SJSS")==null?"":rsbody.getString("EDMLC_SJSS");
					EDMLC_WHSS = rsbody.getString("EDMLC_WHSS")==null?"":rsbody.getString("EDMLC_WHSS");
					EDMLC_FSQY = rsbody.getString("EDMLC_FSQY")==null?"":rsbody.getString("EDMLC_FSQY");
					if(rsbody.getString("EDMLC_FSSQ")!=null)
					{
					EDMLC_FSSQ = rsbody.getString("EDMLC_FSSQ").substring(0,10);
					}
					EDMLC_BZ = rsbody.getString("EDMLC_BZ")==null?"":rsbody.getString("EDMLC_BZ");
					SDMLC_FSCD = rsbody.getString("SDMLC_FSCD")==null?"":rsbody.getString("SDMLC_FSCD");
					SDMLC_FSMJ = rsbody.getString("SDMLC_FSMJ")==null?"":rsbody.getString("SDMLC_FSMJ");
					SDMLC_FZMJ = rsbody.getString("SDMLC_FZMJ")==null?"":rsbody.getString("SDMLC_FZMJ");
					SDMLC_SJSS = rsbody.getString("SDMLC_SJSS")==null?"":rsbody.getString("SDMLC_SJSS");
					SDMLC_WHSS = rsbody.getString("SDMLC_WHSS")==null?"":rsbody.getString("SDMLC_WHSS");
					SDMLC_FSQY = rsbody.getString("SDMLC_FSQY")==null?"":rsbody.getString("SDMLC_FSQY");
					if(rsbody.getString("SDMLC_FSSQ")!=null)
					{
					SDMLC_FSSQ = rsbody.getString("SDMLC_FSSQ").substring(0,10);
					}
					SDMLC_BZ = rsbody.getString("SDMLC_BZ")==null?"":rsbody.getString("SDMLC_BZ");
					FDMLC_FSCD = rsbody.getString("FDMLC_FSCD")==null?"":rsbody.getString("FDMLC_FSCD");
					FDMLC_FSMJ = rsbody.getString("FDMLC_FSMJ")==null?"":rsbody.getString("FDMLC_FSMJ");
					FDMLC_FZMJ = rsbody.getString("FDMLC_FZMJ")==null?"":rsbody.getString("FDMLC_FZMJ");
					FDMLC_SJSS = rsbody.getString("FDMLC_SJSS")==null?"":rsbody.getString("FDMLC_SJSS");
					FDMLC_WHSS = rsbody.getString("FDMLC_WHSS")==null?"":rsbody.getString("FDMLC_WHSS");
					FDMLC_FSQY = rsbody.getString("FDMLC_FSQY")==null?"":rsbody.getString("FDMLC_FSQY");
					if(rsbody.getString("FDMLC_FSSQ")!=null)
					{
					FDMLC_FSSQ = rsbody.getString("FDMLC_FSSQ").substring(0,10);
					}
					FDMLC_BZ = rsbody.getString("FDMLC_BZ")==null?"":rsbody.getString("FDMLC_BZ");
					CDM_FSCD = rsbody.getString("CDM_FSCD")==null?"":rsbody.getString("CDM_FSCD");
					CDM_FSMJ = rsbody.getString("CDM_FSMJ")==null?"":rsbody.getString("CDM_FSMJ");
					CDM_FZMJ = rsbody.getString("CDM_FZMJ")==null?"":rsbody.getString("CDM_FZMJ");
					CDM_SJSS = rsbody.getString("CDM_SJSS")==null?"":rsbody.getString("CDM_SJSS");
					CDM_WHSS = rsbody.getString("CDM_WHSS")==null?"":rsbody.getString("CDM_WHSS");
					CDM_FSQY = rsbody.getString("CDM_FSQY")==null?"":rsbody.getString("CDM_FSQY");
					if(rsbody.getString("CDM_FSSQ")!=null)
					{
					CDM_FSSQ = rsbody.getString("CDM_FSSQ").substring(0,10);
					}
					CDM_BZ = rsbody.getString("CDM_BZ")==null?"":rsbody.getString("CDM_BZ");
					YC_FSCD = rsbody.getString("YC_FSCD")==null?"":rsbody.getString("YC_FSCD");
					YC_FSMJ = rsbody.getString("YC_FSMJ")==null?"":rsbody.getString("YC_FSMJ");
					YC_FZMJ = rsbody.getString("YC_FZMJ")==null?"":rsbody.getString("YC_FZMJ");
					YC_SJSS = rsbody.getString("YC_SJSS")==null?"":rsbody.getString("YC_SJSS");
					YC_WHSS = rsbody.getString("YC_WHSS")==null?"":rsbody.getString("YC_WHSS");
					YC_FSQY = rsbody.getString("YC_FSQY")==null?"":rsbody.getString("YC_FSQY");
					if(rsbody.getString("YC_FSSQ")!=null)
					{
					YC_FSSQ = rsbody.getString("YC_FSSQ").substring(0,10);
					}
					YC_BZ = rsbody.getString("YC_BZ")==null?"":rsbody.getString("YC_BZ");
					JM_FSCD = rsbody.getString("JM_FSCD")==null?"":rsbody.getString("JM_FSCD");
					JM_FSMJ = rsbody.getString("JM_FSMJ")==null?"":rsbody.getString("JM_FSMJ");
					JM_FZMJ = rsbody.getString("JM_FZMJ")==null?"":rsbody.getString("JM_FZMJ");
					JM_SJSS = rsbody.getString("JM_SJSS")==null?"":rsbody.getString("JM_SJSS");
					JM_WHSS = rsbody.getString("JM_WHSS")==null?"":rsbody.getString("JM_WHSS");
					JM_FSQY = rsbody.getString("JM_FSQY")==null?"":rsbody.getString("JM_FSQY");
					if(rsbody.getString("JM_FSSQ")!=null)
					{
					JM_FSSQ = rsbody.getString("JM_FSSQ").substring(0,10);
					}
					JM_BZ = rsbody.getString("JM_BZ")==null?"":rsbody.getString("JM_BZ");
					YM_FSCD = rsbody.getString("YM_FSCD")==null?"":rsbody.getString("YM_FSCD");
					YM_FSMJ = rsbody.getString("YM_FSMJ")==null?"":rsbody.getString("YM_FSMJ");
					YM_FZMJ = rsbody.getString("YM_FZMJ")==null?"":rsbody.getString("YM_FZMJ");
					YM_SJSS = rsbody.getString("YM_SJSS")==null?"":rsbody.getString("YM_SJSS");
					YM_WHSS = rsbody.getString("YM_WHSS")==null?"":rsbody.getString("YM_WHSS");
					YM_FSQY = rsbody.getString("YM_FSQY")==null?"":rsbody.getString("YM_FSQY");
					if(rsbody.getString("YM_FSSQ")!=null)
					{
					YM_FSSQ = rsbody.getString("YM_FSSQ").substring(0,10);
					}
					YM_BZ = rsbody.getString("YM_BZ")==null?"":rsbody.getString("YM_BZ");
					SBYJC_FSCD = rsbody.getString("SBYJC_FSCD")==null?"":rsbody.getString("SBYJC_FSCD");
					SBYJC_FSMJ = rsbody.getString("SBYJC_FSMJ")==null?"":rsbody.getString("SBYJC_FSMJ");
					SBYJC_FZMJ = rsbody.getString("SBYJC_FZMJ")==null?"":rsbody.getString("SBYJC_FZMJ");
					SBYJC_SJSS = rsbody.getString("SBYJC_SJSS")==null?"":rsbody.getString("SBYJC_SJSS");
					SBYJC_WHSS = rsbody.getString("SBYJC_WHSS")==null?"":rsbody.getString("SBYJC_WHSS");
					SBYJC_FSQY = rsbody.getString("SBYJC_FSQY")==null?"":rsbody.getString("SBYJC_FSQY");
					if(rsbody.getString("SBYJC_FSSQ")!=null)
					{
					SBYJC_FSSQ = rsbody.getString("SBYJC_FSSQ").substring(0,10);
					}
					SBYJC_BZ = rsbody.getString("SBYJC_BZ")==null?"":rsbody.getString("SBYJC_BZ");
					TH_FSCD = rsbody.getString("TH_FSCD")==null?"":rsbody.getString("TH_FSCD");
					TH_FSMJ = rsbody.getString("TH_FSMJ")==null?"":rsbody.getString("TH_FSMJ");
					TH_FZMJ = rsbody.getString("TH_FZMJ")==null?"":rsbody.getString("TH_FZMJ");
					TH_SJSS = rsbody.getString("TH_SJSS")==null?"":rsbody.getString("TH_SJSS");
					TH_WHSS = rsbody.getString("TH_WHSS")==null?"":rsbody.getString("TH_WHSS");
					TH_FSQY = rsbody.getString("TH_FSQY")==null?"":rsbody.getString("TH_FSQY");
					if(rsbody.getString("TH_FSSQ")!=null)
					{
					TH_FSSQ = rsbody.getString("TH_FSSQ").substring(0,10);
					}
					TH_BZ = rsbody.getString("TH_BZ")==null?"":rsbody.getString("TH_BZ");
					DXHC_FSCD = rsbody.getString("DXHC_FSCD")==null?"":rsbody.getString("DXHC_FSCD");
					DXHC_FSMJ = rsbody.getString("DXHC_FSMJ")==null?"":rsbody.getString("DXHC_FSMJ");
					DXHC_FZMJ = rsbody.getString("DXHC_FZMJ")==null?"":rsbody.getString("DXHC_FZMJ");
					DXHC_SJSS = rsbody.getString("DXHC_SJSS")==null?"":rsbody.getString("DXHC_SJSS");
					DXHC_WHSS = rsbody.getString("DXHC_WHSS")==null?"":rsbody.getString("DXHC_WHSS");
					DXHC_FSQY = rsbody.getString("DXHC_FSQY")==null?"":rsbody.getString("DXHC_FSQY");
					if(rsbody.getString("DXHC_FSSQ")!=null)
					{
					DXHC_FSSQ = rsbody.getString("DXHC_FSSQ").substring(0,10);
					}
					DXHC_BZ = rsbody.getString("DXHC_BZ")==null?"":rsbody.getString("DXHC_BZ");
					QTCH_FSCD = rsbody.getString("QTCH_FSCD")==null?"":rsbody.getString("QTCH_FSCD");
					QTCH_FSMJ = rsbody.getString("QTCH_FSMJ")==null?"":rsbody.getString("QTCH_FSMJ");
					QTCH_FZMJ = rsbody.getString("QTCH_FZMJ")==null?"":rsbody.getString("QTCH_FZMJ");
					QTCH_SJSS = rsbody.getString("QTCH_SJSS")==null?"":rsbody.getString("QTCH_SJSS");
					QTCH_WHSS = rsbody.getString("QTCH_WHSS")==null?"":rsbody.getString("QTCH_WHSS");
					QTCH_FSQY = rsbody.getString("QTCH_FSQY")==null?"":rsbody.getString("QTCH_FSQY");
					if(rsbody.getString("QTCH_FSSQ")!=null)
					{
					QTCH_FSSQ = rsbody.getString("QTCH_FSSQ").substring(0,10);
					}
					QTCH_BZ = rsbody.getString("QTCH_BZ")==null?"":rsbody.getString("QTCH_BZ");
					CHHJ_FSCD = rsbody.getString("CHHJ_FSCD")==null?"":rsbody.getString("CHHJ_FSCD");
					CHHJ_FSMJ = rsbody.getString("CHHJ_FSMJ")==null?"":rsbody.getString("CHHJ_FSMJ");
					CHHJ_FZMJ = rsbody.getString("CHHJ_FZMJ")==null?"":rsbody.getString("CHHJ_FZMJ");
					CHHJ_SJSS = rsbody.getString("CHHJ_SJSS")==null?"":rsbody.getString("CHHJ_SJSS");
					CHHJ_WHSS = rsbody.getString("CHHJ_WHSS")==null?"":rsbody.getString("CHHJ_WHSS");
					CHHJ_FSQY = rsbody.getString("CHHJ_FSQY")==null?"":rsbody.getString("CHHJ_FSQY");
					if(rsbody.getString("CHHJ_FSSQ")!=null)
					{
					CHHJ_FSSQ = rsbody.getString("CHHJ_FSSQ").substring(0,10);
					}
					CHHJ_BZ = rsbody.getString("CHHJ_BZ")==null?"":rsbody.getString("CHHJ_BZ");
					DBB_FSCD = rsbody.getString("DBB_FSCD")==null?"":rsbody.getString("DBB_FSCD");
					DBB_FSMJ = rsbody.getString("DBB_FSMJ")==null?"":rsbody.getString("DBB_FSMJ");
					DBB_FZMJ = rsbody.getString("DBB_FZMJ")==null?"":rsbody.getString("DBB_FZMJ");
					DBB_SJSS = rsbody.getString("DBB_SJSS")==null?"":rsbody.getString("DBB_SJSS");
					DBB_WHSS = rsbody.getString("DBB_WHSS")==null?"":rsbody.getString("DBB_WHSS");
					DBB_FSQY = rsbody.getString("DBB_FSQY")==null?"":rsbody.getString("DBB_FSQY");
					if(rsbody.getString("DBB_FSSQ")!=null)
					{
					DBB_FSSQ = rsbody.getString("DBB_FSSQ").substring(0,10);
					}
					DBB_BZ = rsbody.getString("DBB_BZ")==null?"":rsbody.getString("DBB_BZ");
					XBB_FSCD = rsbody.getString("XBB_FSCD")==null?"":rsbody.getString("XBB_FSCD");
					XBB_FSMJ = rsbody.getString("XBB_FSMJ")==null?"":rsbody.getString("XBB_FSMJ");
					XBB_FZMJ = rsbody.getString("XBB_FZMJ")==null?"":rsbody.getString("XBB_FZMJ");
					XBB_SJSS = rsbody.getString("XBB_SJSS")==null?"":rsbody.getString("XBB_SJSS");
					XBB_WHSS = rsbody.getString("XBB_WHSS")==null?"":rsbody.getString("XBB_WHSS");
					XBB_FSQY = rsbody.getString("XBB_FSQY")==null?"":rsbody.getString("XBB_FSQY");
					if(rsbody.getString("XBB_FSSQ")!=null)
					{
					XBB_FSSQ = rsbody.getString("XBB_FSSQ").substring(0,10);
					}
					XBB_BZ = rsbody.getString("XBB_BZ")==null?"":rsbody.getString("XBB_BZ");
					HBB_FSCD = rsbody.getString("HBB_FSCD")==null?"":rsbody.getString("HBB_FSCD");
					HBB_FSMJ = rsbody.getString("HBB_FSMJ")==null?"":rsbody.getString("HBB_FSMJ");
					HBB_FZMJ = rsbody.getString("HBB_FZMJ")==null?"":rsbody.getString("HBB_FZMJ");
					HBB_SJSS = rsbody.getString("HBB_SJSS")==null?"":rsbody.getString("HBB_SJSS");
					HBB_WHSS = rsbody.getString("HBB_WHSS")==null?"":rsbody.getString("HBB_WHSS");
					HBB_FSQY = rsbody.getString("HBB_FSQY")==null?"":rsbody.getString("HBB_FSQY");
					if(rsbody.getString("HBB_FSSQ")!=null)
					{
					HBB_FSSQ = rsbody.getString("HBB_FSSQ").substring(0,10);
					}
					HBB_BZ = rsbody.getString("HBB_BZ")==null?"":rsbody.getString("HBB_BZ");
					YMWBMYBB_FSCD = rsbody.getString("YMWBMYBB_FSCD")==null?"":rsbody.getString("YMWBMYBB_FSCD");
					YMWBMYBB_FSMJ = rsbody.getString("YMWBMYBB_FSMJ")==null?"":rsbody.getString("YMWBMYBB_FSMJ");
					YMWBMYBB_FZMJ = rsbody.getString("YMWBMYBB_FZMJ")==null?"":rsbody.getString("YMWBMYBB_FZMJ");
					YMWBMYBB_SJSS = rsbody.getString("YMWBMYBB_SJSS")==null?"":rsbody.getString("YMWBMYBB_SJSS");
					YMWBMYBB_WHSS = rsbody.getString("YMWBMYBB_WHSS")==null?"":rsbody.getString("YMWBMYBB_WHSS");
					YMWBMYBB_FSQY = rsbody.getString("YMWBMYBB_FSQY")==null?"":rsbody.getString("YMWBMYBB_FSQY");
					if(rsbody.getString("YMWBMYBB_FSSQ")!=null)
					{
					YMWBMYBB_FSSQ = rsbody.getString("YMWBMYBB_FSSQ").substring(0,10);
					}
					YMWBMYBB_BZ = rsbody.getString("YMWBMYBB_BZ")==null?"":rsbody.getString("YMWBMYBB_BZ");
					WKB_FSCD = rsbody.getString("WKB_FSCD")==null?"":rsbody.getString("WKB_FSCD");
					WKB_FSMJ = rsbody.getString("WKB_FSMJ")==null?"":rsbody.getString("WKB_FSMJ");
					WKB_FZMJ = rsbody.getString("WKB_FZMJ")==null?"":rsbody.getString("WKB_FZMJ");
					WKB_SJSS = rsbody.getString("WKB_SJSS")==null?"":rsbody.getString("WKB_SJSS");
					WKB_WHSS = rsbody.getString("WKB_WHSS")==null?"":rsbody.getString("WKB_WHSS");
					WKB_FSQY = rsbody.getString("WKB_FSQY")==null?"":rsbody.getString("WKB_FSQY");
					if(rsbody.getString("WKB_FSSQ")!=null)
					{
					WKB_FSSQ = rsbody.getString("WKB_FSSQ").substring(0,10);
					}
					WKB_BZ = rsbody.getString("WKB_BZ")==null?"":rsbody.getString("WKB_BZ");
					SHSB_FSCD = rsbody.getString("SHSB_FSCD")==null?"":rsbody.getString("SHSB_FSCD");
					SHSB_FSMJ = rsbody.getString("SHSB_FSMJ")==null?"":rsbody.getString("SHSB_FSMJ");
					SHSB_FZMJ = rsbody.getString("SHSB_FZMJ")==null?"":rsbody.getString("SHSB_FZMJ");
					SHSB_SJSS = rsbody.getString("SHSB_SJSS")==null?"":rsbody.getString("SHSB_SJSS");
					SHSB_WHSS = rsbody.getString("SHSB_WHSS")==null?"":rsbody.getString("SHSB_WHSS");
					SHSB_FSQY = rsbody.getString("SHSB_FSQY")==null?"":rsbody.getString("SHSB_FSQY");
					if(rsbody.getString("SHSB_FSSQ")!=null)
					{
					SHSB_FSSQ = rsbody.getString("SHSB_FSSQ").substring(0,10);
					}
					SHSB_BZ = rsbody.getString("SHSB_BZ")==null?"":rsbody.getString("SHSB_BZ");
					XB_FSCD = rsbody.getString("XB_FSCD")==null?"":rsbody.getString("XB_FSCD");
					XB_FSMJ = rsbody.getString("XB_FSMJ")==null?"":rsbody.getString("XB_FSMJ");
					XB_FZMJ = rsbody.getString("XB_FZMJ")==null?"":rsbody.getString("XB_FZMJ");
					XB_SJSS = rsbody.getString("XB_SJSS")==null?"":rsbody.getString("XB_SJSS");
					XB_WHSS = rsbody.getString("XB_WHSS")==null?"":rsbody.getString("XB_WHSS");
					XB_FSQY = rsbody.getString("XB_FSQY")==null?"":rsbody.getString("XB_FSQY");
					if(rsbody.getString("XB_FSSQ")!=null)
					{
					XB_FSSQ = rsbody.getString("XB_FSSQ").substring(0,10);
					}
					XB_BZ = rsbody.getString("XB_BZ")==null?"":rsbody.getString("XB_BZ");
					LHFB_FSCD = rsbody.getString("LHFB_FSCD")==null?"":rsbody.getString("LHFB_FSCD");
					LHFB_FSMJ = rsbody.getString("LHFB_FSMJ")==null?"":rsbody.getString("LHFB_FSMJ");
					LHFB_FZMJ = rsbody.getString("LHFB_FZMJ")==null?"":rsbody.getString("LHFB_FZMJ");
					LHFB_SJSS = rsbody.getString("LHFB_SJSS")==null?"":rsbody.getString("LHFB_SJSS");
					LHFB_WHSS = rsbody.getString("LHFB_WHSS")==null?"":rsbody.getString("LHFB_WHSS");
					LHFB_FSQY = rsbody.getString("LHFB_FSQY")==null?"":rsbody.getString("LHFB_FSQY");
					if(rsbody.getString("LHFB_FSSQ")!=null)
					{
					LHFB_FSSQ = rsbody.getString("LHFB_FSSQ").substring(0,10);
					}
					LHFB_BZ = rsbody.getString("LHFB_BZ")==null?"":rsbody.getString("LHFB_BZ");
					CSB_FSCD = rsbody.getString("CSB_FSCD")==null?"":rsbody.getString("CSB_FSCD");
					CSB_FSMJ = rsbody.getString("CSB_FSMJ")==null?"":rsbody.getString("CSB_FSMJ");
					CSB_FZMJ = rsbody.getString("CSB_FZMJ")==null?"":rsbody.getString("CSB_FZMJ");
					CSB_SJSS = rsbody.getString("CSB_SJSS")==null?"":rsbody.getString("CSB_SJSS");
					CSB_WHSS = rsbody.getString("CSB_WHSS")==null?"":rsbody.getString("CSB_WHSS");
					CSB_FSQY = rsbody.getString("CSB_FSQY")==null?"":rsbody.getString("CSB_FSQY");
					if(rsbody.getString("CSB_FSSQ")!=null)
					{
					CSB_FSSQ = rsbody.getString("CSB_FSSQ").substring(0,10);
					}
					CSB_BZ = rsbody.getString("CSB_BZ")==null?"":rsbody.getString("CSB_BZ");
					DFB_FSCD = rsbody.getString("DFB_FSCD")==null?"":rsbody.getString("DFB_FSCD");
					DFB_FSMJ = rsbody.getString("DFB_FSMJ")==null?"":rsbody.getString("DFB_FSMJ");
					DFB_FZMJ = rsbody.getString("DFB_FZMJ")==null?"":rsbody.getString("DFB_FZMJ");
					DFB_SJSS = rsbody.getString("DFB_SJSS")==null?"":rsbody.getString("DFB_SJSS");
					DFB_WHSS = rsbody.getString("DFB_WHSS")==null?"":rsbody.getString("DFB_WHSS");
					DFB_FSQY = rsbody.getString("DFB_FSQY")==null?"":rsbody.getString("DFB_FSQY");
					if(rsbody.getString("DFB_FSSQ")!=null)
					{
					DFB_FSSQ = rsbody.getString("DFB_FSSQ").substring(0,10);
					}
					DFB_BZ = rsbody.getString("DFB_BZ")==null?"":rsbody.getString("DFB_BZ");
					QTB_FSCD = rsbody.getString("QTB_FSCD")==null?"":rsbody.getString("QTB_FSCD");
					QTB_FSMJ = rsbody.getString("QTB_FSMJ")==null?"":rsbody.getString("QTB_FSMJ");
					QTB_FZMJ = rsbody.getString("QTB_FZMJ")==null?"":rsbody.getString("QTB_FZMJ");
					QTB_SJSS = rsbody.getString("QTB_SJSS")==null?"":rsbody.getString("QTB_SJSS");
					QTB_WHSS = rsbody.getString("QTB_WHSS")==null?"":rsbody.getString("QTB_WHSS");
					QTB_FSQY = rsbody.getString("QTB_FSQY")==null?"":rsbody.getString("QTB_FSQY");
					if(rsbody.getString("QTB_FSSQ")!=null)
					{
					QTB_FSSQ = rsbody.getString("QTB_FSSQ").substring(0,10);
					}
					QTB_BZ = rsbody.getString("QTB_BZ")==null?"":rsbody.getString("QTB_BZ");
					BHHJ_FSCD = rsbody.getString("BHHJ_FSCD")==null?"":rsbody.getString("BHHJ_FSCD");
					BHHJ_FSMJ = rsbody.getString("BHHJ_FSMJ")==null?"":rsbody.getString("BHHJ_FSMJ");
					BHHJ_FZMJ = rsbody.getString("BHHJ_FZMJ")==null?"":rsbody.getString("BHHJ_FZMJ");
					BHHJ_SJSS = rsbody.getString("BHHJ_SJSS")==null?"":rsbody.getString("BHHJ_SJSS");
					BHHJ_WHSS = rsbody.getString("BHHJ_WHSS")==null?"":rsbody.getString("BHHJ_WHSS");
					BHHJ_FSQY = rsbody.getString("BHHJ_FSQY")==null?"":rsbody.getString("BHHJ_FSQY");
					if(rsbody.getString("BHHJ_FSSQ")!=null)
					{
					BHHJ_FSSQ = rsbody.getString("BHHJ_FSSQ").substring(0,10);
					}
					BHHJ_BZ = rsbody.getString("BHHJ_BZ")==null?"":rsbody.getString("BHHJ_BZ");
					BCHJ_FSCD = rsbody.getString("BCHJ_FSCD")==null?"":rsbody.getString("BCHJ_FSCD");
					BCHJ_FSMJ = rsbody.getString("BCHJ_FSMJ")==null?"":rsbody.getString("BCHJ_FSMJ");
					BCHJ_FZMJ = rsbody.getString("BCHJ_FZMJ")==null?"":rsbody.getString("BCHJ_FZMJ");
					BCHJ_SJSS = rsbody.getString("BCHJ_SJSS")==null?"":rsbody.getString("BCHJ_SJSS");
					BCHJ_WHSS = rsbody.getString("BCHJ_WHSS")==null?"":rsbody.getString("BCHJ_WHSS");
					BCHJ_FSQY = rsbody.getString("BCHJ_FSQY")==null?"":rsbody.getString("BCHJ_FSQY");
					if(rsbody.getString("BCHJ_FSSQ")!=null)
					{
					BCHJ_FSSQ = rsbody.getString("BCHJ_FSSQ").substring(0,10);
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
		<%
			if (!bbzt.equals("2") && !bbzt.equals("3") && !bbzt.equals("4")) {
		%>
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td colspan=5 rowspan=1
					style="text-align:center;font-size=30;width: ;height: "><b>玉米病虫害年度统计表(<%=rwsj%>)
				</b><br> <br></td>
			</tr>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">测报站点：<%=usebmmc%><input
					name="BMBM" type="hidden" value="<%=usebm%>" /></td>
				<td style="padding-left: 100px;padding-right: 100px;">调查时间：<input
					type="text" id="DCRQ" name="DCRQ"
					style="width:80;height: ;font-size:12" value="<%=DCRQ%>"
					class="Wdate" onFocus="WdatePicker({skin:'whyGreen'})" /></td>
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
					<td><select name="YDYMM_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="YDYMM_FSMJ" type="text"
						value="<%=YDYMM_FSMJ%>" alertname="一代玉米螟发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="YDYMM_FZMJ" type="text"
						value="<%=YDYMM_FZMJ%>" alertname="一代玉米螟防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="YDYMM_SJSS" type="text"
						value="<%=YDYMM_SJSS%>" alertname="一代玉米螟实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="YDYMM_WHSS" type="text"
						value="<%=YDYMM_WHSS%>" alertname="一代玉米螟挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="YDYMM_FSQY" type="text"
						value="<%=YDYMM_FSQY%>" /></td>
					<td><input style="width: 100%;" name="YDYMM_FSSQ" type="text"
						value="<%=YDYMM_FSSQ%>" 
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="YDYMM_BZ" type="text"
						value="<%=YDYMM_BZ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">二代玉米螟</td>
					<td><select name="EDYMM_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="EDYMM_FSMJ" type="text"
						value="<%=EDYMM_FSMJ%>" alertname="二代玉米螟发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="EDYMM_FZMJ" type="text"
						value="<%=EDYMM_FZMJ%>" alertname="二代玉米螟防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="EDYMM_SJSS" type="text"
						value="<%=EDYMM_SJSS%>" alertname="二代玉米螟实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="EDYMM_WHSS" type="text"
						value="<%=EDYMM_WHSS%>" alertname="二代玉米螟挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="EDYMM_FSQY" type="text"
						value="<%=EDYMM_FSQY%>" /></td>
					<td><input style="width: 100%;" name="EDYMM_FSSQ" type="text"
						value="<%=EDYMM_FSSQ%>"
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="EDYMM_BZ" type="text"
						value="<%=EDYMM_BZ%>" /></td>
				</tr>
				<tr>
					<td style="text-align: center;">三代玉米螟</td>
					<td><select name="SDYMM_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="SDYMM_FSMJ" type="text"
						value="<%=SDYMM_FSMJ%>" alertname="三代玉米螟发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="SDYMM_FZMJ" type="text"
						value="<%=SDYMM_FZMJ%>" alertname="三代玉米螟防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="SDYMM_SJSS" type="text"
						value="<%=SDYMM_SJSS%>" alertname="三代玉米螟实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="SDYMM_WHSS" type="text"
						value="<%=SDYMM_WHSS%>" alertname="三代玉米螟挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="SDYMM_FSQY" type="text"
						value="<%=SDYMM_FSQY%>" /></td>
					<td><input style="width: 100%;" name="SDYMM_FSSQ" type="text"
						value="<%=SDYMM_FSSQ%>" 
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="SDYMM_BZ" type="text"
						value="<%=SDYMM_BZ%>" /></td>
				</tr>
				<tr>
					<td style="text-align: center;">二点委夜蛾</td>
					<td><select name="EDWYE_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="EDWYE_FSMJ" type="text"
						value="<%=EDWYE_FSMJ%>" alertname="二点委夜蛾发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="EDWYE_FZMJ" type="text"
						value="<%=EDWYE_FZMJ%>" alertname="二点委夜蛾防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="EDWYE_SJSS" type="text"
						value="<%=EDWYE_SJSS%>" alertname="二点委夜蛾实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="EDWYE_WHSS" type="text"
						value="<%=EDWYE_WHSS%>" alertname="二点委夜蛾挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="EDWYE_FSQY" type="text"
						value="<%=EDWYE_FSQY%>" /></td>
					<td><input style="width: 100%;" name="EDWYE_FSSQ" type="text"
						value="<%=EDWYE_FSSQ%>" 
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="EDWYE_BZ" type="text"
						value="<%=EDWYE_BZ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">二代粘虫</td>
					<td><select name="EDNC_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="EDNC_FSMJ" type="text"
						value="<%=EDNC_FSMJ%>" alertname="二代粘虫发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="EDNC_FZMJ" type="text"
						value="<%=EDNC_FZMJ%>" alertname="二代粘虫防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="EDNC_SJSS" type="text"
						value="<%=EDNC_SJSS%>" alertname="二代粘虫实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="EDNC_WHSS" type="text"
						value="<%=EDNC_WHSS%>" alertname="二代粘虫挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="EDNC_FSQY" type="text"
						value="<%=EDNC_FSQY%>"/></td>
					<td><input style="width: 100%;" name="EDNC_FSSQ" type="text"
						value="<%=EDNC_FSSQ%>"
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="EDNC_BZ" type="text"
						value="<%=EDNC_BZ%>" /></td>
				</tr>
				<tr>
					<td style="text-align: center;">三代粘虫</td>
					<td><select name="SDNC_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="SDNC_FSMJ" type="text"
						value="<%=SDNC_FSMJ%>" alertname="三代粘虫发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="SDNC_FZMJ" type="text"
						value="<%=SDNC_FZMJ%>" alertname="三代粘虫防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="SDNC_SJSS" type="text"
						value="<%=SDNC_SJSS%>" alertname="三代粘虫实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="SDNC_WHSS" type="text"
						value="<%=SDNC_WHSS%>" alertname="三代粘虫挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="SDNC_FSQY" type="text"
						value="<%=SDNC_FSQY%>"/></td>
					<td><input style="width: 100%;" name="SDNC_FSSQ" type="text"
						value="<%=SDNC_FSSQ%>"
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="SDNC_BZ" type="text"
						value="<%=SDNC_BZ%>" /></td>
				</tr>
				<tr>
					<td style="text-align: center;">二代棉铃虫</td>
					<td><select name="EDMLC_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="EDMLC_FSMJ" type="text"
						value="<%=EDMLC_FSMJ%>" alertname="二代棉铃虫发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="EDMLC_FZMJ" type="text"
						value="<%=EDMLC_FZMJ%>" alertname="二代棉铃虫防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="EDMLC_SJSS" type="text"
						value="<%=EDMLC_SJSS%>" alertname="二代棉铃虫实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="EDMLC_WHSS" type="text"
						value="<%=EDMLC_WHSS%>" alertname="二代棉铃虫挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="EDMLC_FSQY" type="text"
						value="<%=EDMLC_FSQY%>"  /></td>
					<td><input style="width: 100%;" name="EDMLC_FSSQ" type="text"
						value="<%=EDMLC_FSSQ%>"
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="EDMLC_BZ" type="text"
						value="<%=EDMLC_BZ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">三代棉铃虫</td>
					<td><select name="SDMLC_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="SDMLC_FSMJ" type="text"
						value="<%=SDMLC_FSMJ%>" alertname="三代棉铃虫发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="SDMLC_FZMJ" type="text"
						value="<%=SDMLC_FZMJ%>" alertname="三代棉铃虫防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="SDMLC_SJSS" type="text"
						value="<%=SDMLC_SJSS%>" alertname="三代棉铃虫实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="SDMLC_WHSS" type="text"
						value="<%=SDMLC_WHSS%>" alertname="三代棉铃虫挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="SDMLC_FSQY" type="text"
						value="<%=SDMLC_FSQY%>"/></td>
					<td><input style="width: 100%;" name="SDMLC_FSSQ" type="text"
						value="<%=SDMLC_FSSQ%>"
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="SDMLC_BZ" type="text"
						value="<%=SDMLC_BZ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">四代棉铃虫</td>
					<td><select name="FDMLC_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="FDMLC_FSMJ" type="text"
						value="<%=FDMLC_FSMJ%>" alertname="四代棉铃虫发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="FDMLC_FZMJ" type="text"
						value="<%=FDMLC_FZMJ%>" alertname="四代棉铃虫防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="FDMLC_SJSS" type="text"
						value="<%=FDMLC_SJSS%>" alertname="四代棉铃虫实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="FDMLC_WHSS" type="text"
						value="<%=FDMLC_WHSS%>" alertname="四代棉铃虫挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="FDMLC_FSQY" type="text"
						value="<%=FDMLC_FSQY%>"/></td>
					<td><input style="width: 100%;" name="FDMLC_FSSQ" type="text"
						value="<%=FDMLC_FSSQ%>"
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="FDMLC_BZ" type="text"
						value="<%=FDMLC_BZ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">草地螟</td>
					<td><select name="CDM_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="CDM_FSMJ" type="text"
						value="<%=CDM_FSMJ%>" alertname="草地螟发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="CDM_FZMJ" type="text"
						value="<%=CDM_FZMJ%>" alertname="草地螟防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="CDM_SJSS" type="text"
						value="<%=CDM_SJSS%>" alertname="草地螟实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="CDM_WHSS" type="text"
						value="<%=CDM_WHSS%>" alertname="草地螟挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="CDM_FSQY" type="text"
						value="<%=CDM_FSQY%>"/></td>
					<td><input style="width: 100%;" name="CDM_FSSQ" type="text"
						value="<%=CDM_FSSQ%>"
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="CDM_BZ" type="text"
						value="<%=CDM_BZ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">蚜虫</td>
					<td><select name="YC_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="YC_FSMJ" type="text"
						value="<%=YC_FSMJ%>" alertname="蚜虫发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="YC_FZMJ" type="text"
						value="<%=YC_FZMJ%>" alertname="蚜虫防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="YC_SJSS" type="text"
						value="<%=YC_SJSS%>" alertname="蚜虫实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="YC_WHSS" type="text"
						value="<%=YC_WHSS%>" alertname="蚜虫挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="YC_FSQY" type="text"
						value="<%=YC_FSQY%>"/></td>
					<td><input style="width: 100%;" name="YC_FSSQ" type="text"
						value="<%=YC_FSSQ%>"
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="YC_BZ" type="text"
						value="<%=YC_BZ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">蓟马</td>
					<td><select name="JM_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="JM_FSMJ" type="text"
						value="<%=JM_FSMJ%>" alertname="蓟马发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="JM_FZMJ" type="text"
						value="<%=JM_FZMJ%>" alertname="蓟马防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="JM_SJSS" type="text"
						value="<%=JM_SJSS%>" alertname="蓟马实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="JM_WHSS" type="text"
						value="<%=JM_WHSS%>" alertname="蓟马挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="JM_FSQY" type="text"
						value="<%=JM_FSQY%>"/></td>
					<td><input style="width: 100%;" name="JM_FSSQ" type="text"
						value="<%=JM_FSSQ%>"
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="JM_BZ" type="text"
						value="<%=JM_BZ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">叶螨</td>
					<td><select name="YM_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="YM_FSMJ" type="text"
						value="<%=YM_FSMJ%>" alertname="叶螨发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="YM_FZMJ" type="text"
						value="<%=YM_FZMJ%>" alertname="叶螨防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="YM_SJSS" type="text"
						value="<%=YM_SJSS%>" alertname="叶螨实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="YM_WHSS" type="text"
						value="<%=YM_WHSS%>" alertname="叶螨挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="YM_FSQY" type="text"
						value="<%=YM_FSQY%>"/></td>
					<td><input style="width: 100%;" name="YM_FSSQ" type="text"
						value="<%=YM_FSSQ%>"
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="YM_BZ" type="text"
						value="<%=YM_BZ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">双斑萤叶甲</td>
					<td><select name="SBYJC_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="SBYJC_FSMJ" type="text"
						value="<%=SBYJC_FSMJ%>" alertname="双斑萤叶甲发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="SBYJC_FZMJ" type="text"
						value="<%=SBYJC_FZMJ%>" alertname="双斑萤叶甲防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="SBYJC_SJSS" type="text"
						value="<%=SBYJC_SJSS%>" alertname="双斑萤叶甲实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="SBYJC_WHSS" type="text"
						value="<%=SBYJC_WHSS%>" alertname="双斑萤叶甲挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="SBYJC_FSQY" type="text"
						value="<%=SBYJC_FSQY%>" /></td>
					<td><input style="width: 100%;" name="SBYJC_FSSQ" type="text"
						value="<%=SBYJC_FSSQ%>"
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="SBYJC_BZ" type="text"
						value="<%=SBYJC_BZ%>" /></td>
				</tr>
				<tr>
					<td style="text-align: center;">土蝗（玉米田）</td>
					<td><select name="TH_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="TH_FSMJ" type="text"
						value="<%=TH_FSMJ%>" alertname="土蝗（玉米田）发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="TH_FZMJ" type="text"
						value="<%=TH_FZMJ%>" alertname="土蝗（玉米田）防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="TH_SJSS" type="text"
						value="<%=TH_SJSS%>" alertname="土蝗（玉米田）实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="TH_WHSS" type="text"
						value="<%=TH_WHSS%>" alertname="土蝗（玉米田）挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="TH_FSQY" type="text"
						value="<%=TH_FSQY%>"/></td>
					<td><input style="width: 100%;" name="TH_FSSQ" type="text"
						value="<%=TH_FSSQ%>"
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="TH_BZ" type="text"
						value="<%=TH_BZ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">地下害虫</td>
					<td><select name="DXHC_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="DXHC_FSMJ" type="text"
						value="<%=DXHC_FSMJ%>" alertname="地下害虫发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="DXHC_FZMJ" type="text"
						value="<%=DXHC_FZMJ%>" alertname="地下害虫防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="DXHC_SJSS" type="text"
						value="<%=DXHC_SJSS%>" alertname="地下害虫实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="DXHC_WHSS" type="text"
						value="<%=DXHC_WHSS%>" alertname="地下害虫挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="DXHC_FSQY" type="text"
						value="<%=DXHC_FSQY%>"/></td>
					<td><input style="width: 100%;" name="DXHC_FSSQ" type="text"
						value="<%=DXHC_FSSQ%>" 
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="DXHC_BZ" type="text"
						value="<%=DXHC_BZ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">其他害虫</td>
					<td><select name="QTCH_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="QTCH_FSMJ" type="text"
						value="<%=QTCH_FSMJ%>" alertname="其他害虫发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="QTCH_FZMJ" type="text"
						value="<%=QTCH_FZMJ%>" alertname="其他害虫防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="QTCH_SJSS" type="text"
						value="<%=QTCH_SJSS%>" alertname="其他害虫实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="QTCH_WHSS" type="text"
						value="<%=QTCH_WHSS%>" alertname="其他害虫挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="QTCH_FSQY" type="text"
						value="<%=QTCH_FSQY%>"/></td>
					<td><input style="width: 100%;" name="QTCH_FSSQ" type="text"
						value="<%=QTCH_FSSQ%>"
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="QTCH_BZ" type="text"
						value="<%=QTCH_BZ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">虫害合计</td>
					<td style="text-align: center;">/</td>
					<td><input style="width: 100%;" name="CHHJ_FSMJ" type="text"
						value="<%=CHHJ_FSMJ%>" alertname="虫害合计发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="CHHJ_FZMJ" type="text"
						value="<%=CHHJ_FZMJ%>" alertname="虫害合计防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="CHHJ_SJSS" type="text"
						value="<%=CHHJ_SJSS%>" alertname="虫害合计实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="CHHJ_WHSS" type="text"
						value="<%=CHHJ_WHSS%>" alertname="虫害合计挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="CHHJ_FSQY" type="text"
						value="<%=CHHJ_FSQY%>"  /></td>
					<td><input style="width: 100%;" name="CHHJ_FSSQ" type="text"
						value="<%=CHHJ_FSSQ%>" 
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="CHHJ_BZ" type="text"
						value="<%=CHHJ_BZ%>" /></td>
				</tr>
				<tr>
					<td style="text-align: center;">大斑病</td>
					<td><select name="DBB_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="DBB_FSMJ" type="text"
						value="<%=DBB_FSMJ%>" alertname="大斑病发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="DBB_FZMJ" type="text"
						value="<%=DBB_FZMJ%>" alertname="大斑病防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="DBB_SJSS" type="text"
						value="<%=DBB_SJSS%>" alertname="大斑病实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="DBB_WHSS" type="text"
						value="<%=DBB_WHSS%>" alertname="大斑病挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="DBB_FSQY" type="text"
						value="<%=DBB_FSQY%>" /></td>
					<td><input style="width: 100%;" name="DBB_FSSQ" type="text"
						value="<%=DBB_FSSQ%>" 
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="DBB_BZ" type="text"
						value="<%=DBB_BZ%>" /></td>
				</tr>
				<tr>
					<td style="text-align: center;">小斑病</td>
					<td><select name="XBB_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="XBB_FSMJ" type="text"
						value="<%=XBB_FSMJ%>" alertname="小斑病发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="XBB_FZMJ" type="text"
						value="<%=XBB_FZMJ%>" alertname="小斑病防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="XBB_SJSS" type="text"
						value="<%=XBB_SJSS%>" alertname="小斑病实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="XBB_WHSS" type="text"
						value="<%=XBB_WHSS%>" alertname="小斑病挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="XBB_FSQY" type="text"
						value="<%=XBB_FSQY%>" /></td>
					<td><input style="width: 100%;" name="XBB_FSSQ" type="text"
						value="<%=XBB_FSSQ%>"
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="XBB_BZ" type="text"
						value="<%=XBB_BZ%>" /></td>
				</tr>
				<tr>
					<td style="text-align: center;">褐斑病</td>
					<td><select name="HBB_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="HBB_FSMJ" type="text"
						value="<%=HBB_FSMJ%>" alertname="褐斑病发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="HBB_FZMJ" type="text"
						value="<%=HBB_FZMJ%>" alertname="褐斑病防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="HBB_SJSS" type="text"
						value="<%=HBB_SJSS%>" alertname="褐斑病实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="HBB_WHSS" type="text"
						value="<%=HBB_WHSS%>" alertname="褐斑病挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="HBB_FSQY" type="text"
						value="<%=HBB_FSQY%>" /></td>
					<td><input style="width: 100%;" name="HBB_FSSQ" type="text"
						value="<%=HBB_FSSQ%>" 
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="HBB_BZ" type="text"
						value="<%=HBB_BZ%>" /></td>
				</tr>
				<tr>
					<td style="text-align: center;">玉米弯孢霉叶斑病</td>
					<td><select name="YMWBMYBB_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="YMWBMYBB_FSMJ" type="text"
						value="<%=YMWBMYBB_FSMJ%>" alertname="玉米弯孢霉叶斑病发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="YMWBMYBB_FZMJ" type="text"
						value="<%=YMWBMYBB_FZMJ%>" alertname="玉米弯孢霉叶斑病防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="YMWBMYBB_SJSS" type="text"
						value="<%=YMWBMYBB_SJSS%>" alertname="玉米弯孢霉叶斑病实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="YMWBMYBB_WHSS" type="text"
						value="<%=YMWBMYBB_WHSS%>" alertname="玉米弯孢霉叶斑病挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="YMWBMYBB_FSQY" type="text"
						value="<%=YMWBMYBB_FSQY%>" /></td>
					<td><input style="width: 100%;" name="YMWBMYBB_FSSQ" type="text"
						value="<%=YMWBMYBB_FSSQ%>" 
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="YMWBMYBB_BZ" type="text"
						value="<%=YMWBMYBB_BZ%>" /></td>
				</tr>
				<tr>
					<td style="text-align: center;">纹枯病</td>
					<td><select name="WKB_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="WKB_FSMJ" type="text"
						value="<%=WKB_FSMJ%>" alertname="纹枯病发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="WKB_FZMJ" type="text"
						value="<%=WKB_FZMJ%>" alertname="纹枯病防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="WKB_SJSS" type="text"
						value="<%=WKB_SJSS%>" alertname="纹枯病实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="WKB_WHSS" type="text"
						value="<%=WKB_WHSS%>" alertname="纹枯病挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="WKB_FSQY" type="text"
						value="<%=WKB_FSQY%>"  /></td>
					<td><input style="width: 100%;" name="WKB_FSSQ" type="text"
						value="<%=WKB_FSSQ%>" 
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="WKB_BZ" type="text"
						value="<%=WKB_BZ%>" /></td>
				</tr>
				<tr>
					<td style="text-align: center;">丝黑穗病</td>
					<td><select name="SHSB_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="SHSB_FSMJ" type="text"
						value="<%=SHSB_FSMJ%>" alertname="丝黑穗病发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="SHSB_FZMJ" type="text"
						value="<%=SHSB_FZMJ%>" alertname="丝黑穗病防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="SHSB_SJSS" type="text"
						value="<%=SHSB_SJSS%>" alertname="丝黑穗病实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="SHSB_WHSS" type="text"
						value="<%=SHSB_WHSS%>" alertname="丝黑穗病挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="SHSB_FSQY" type="text"
						value="<%=SHSB_FSQY%>" /></td>
					<td><input style="width: 100%;" name="SHSB_FSSQ" type="text"
						value="<%=SHSB_FSSQ%>" 
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="SHSB_BZ" type="text"
						value="<%=SHSB_BZ%>"  /></td>
				</tr>
				<tr>
					<td style="text-align: center;">锈病</td>
					<td><select name="XB_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="XB_FSMJ" type="text"
						value="<%=XB_FSMJ%>" alertname="锈病发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="XB_FZMJ" type="text"
						value="<%=XB_FZMJ%>" alertname="锈病防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="XB_SJSS" type="text"
						value="<%=XB_SJSS%>" alertname="锈病实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="XB_WHSS" type="text"
						value="<%=XB_WHSS%>" alertname="锈病挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="XB_FSQY" type="text"
						value="<%=XB_FSQY%>" /></td>
					<td><input style="width: 100%;" name="XB_FSSQ" type="text"
						value="<%=XB_FSSQ%>"
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="XB_BZ" type="text"
						value="<%=XB_BZ%>" /></td>
				</tr>
				<tr>
					<td style="text-align: center;">瘤黑粉病</td>
					<td><select name="LHFB_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="LHFB_FSMJ" type="text"
						value="<%=LHFB_FSMJ%>" alertname="瘤黑粉病发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="LHFB_FZMJ" type="text"
						value="<%=LHFB_FZMJ%>" alertname="瘤黑粉病防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="LHFB_SJSS" type="text"
						value="<%=LHFB_SJSS%>" alertname="瘤黑粉病实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="LHFB_WHSS" type="text"
						value="<%=LHFB_WHSS%>" alertname="瘤黑粉病挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="LHFB_FSQY" type="text"
						value="<%=LHFB_FSQY%>"  /></td>
					<td><input style="width: 100%;" name="LHFB_FSSQ" type="text"
						value="<%=LHFB_FSSQ%>"
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="LHFB_BZ" type="text"
						value="<%=LHFB_BZ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">粗缩病</td>
					<td><select name="CSB_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="CSB_FSMJ" type="text"
						value="<%=CSB_FSMJ%>" alertname="粗缩病发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="CSB_FZMJ" type="text"
						value="<%=CSB_FZMJ%>" alertname="粗缩病防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="CSB_SJSS" type="text"
						value="<%=CSB_SJSS%>" alertname="粗缩病实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="CSB_WHSS" type="text"
						value="<%=CSB_WHSS%>" alertname="粗缩病挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="CSB_FSQY" type="text"
						value="<%=CSB_FSQY%>"/></td>
					<td><input style="width: 100%;" name="CSB_FSSQ" type="text"
						value="<%=CSB_FSSQ%>"
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="CSB_BZ" type="text"
						value="<%=CSB_BZ%>"  /></td>
				</tr>
				<tr>
					<td style="text-align: center;">顶腐病</td>
					<td><select name="DFB_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="DFB_FSMJ" type="text"
						value="<%=DFB_FSMJ%>" alertname="顶腐病发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="DFB_FZMJ" type="text"
						value="<%=DFB_FZMJ%>" alertname="顶腐病防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="DFB_SJSS" type="text"
						value="<%=DFB_SJSS%>" alertname="顶腐病实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="DFB_WHSS" type="text"
						value="<%=DFB_WHSS%>" alertname="顶腐病挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="DFB_FSQY" type="text"
						value="<%=DFB_FSQY%>" /></td>
					<td><input style="width: 100%;" name="DFB_FSSQ" type="text"
						value="<%=DFB_FSSQ%>"
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="DFB_BZ" type="text"
						value="<%=DFB_BZ%>" /></td>
				</tr>
				<tr>
					<td style="text-align: center;">其他病害</td>
					<td><select name="QTB_FSCD"><option value="">请选择</option><%=onpent%></select></td>
					<td><input style="width: 100%;" name="QTB_FSMJ" type="text"
						value="<%=QTB_FSMJ%>" alertname="其他病害发生面积必须为数字" datatype="number"
						onkeyup="fsmj(this)" /></td>
					<td><input style="width: 100%;" name="QTB_FZMJ" type="text"
						value="<%=QTB_FZMJ%>" alertname="其他病害防治面积必须为数字" datatype="number"
						onkeyup="fzmj(this)" /></td>
					<td><input style="width: 100%;" name="QTB_SJSS" type="text"
						value="<%=QTB_SJSS%>" alertname="其他病害实际损失必须为数字" datatype="number"
						onkeyup="sjss(this)" /></td>
					<td><input style="width: 100%;" name="QTB_WHSS" type="text"
						value="<%=QTB_WHSS%>" alertname="其他病害挽回损失必须为数字" datatype="number"
						onkeyup="whss(this)" /></td>
					<td><input style="width: 100%;" name="QTB_FSQY" type="text"
						value="<%=QTB_FSQY%>" /></td>
					<td><input style="width: 100%;" name="QTB_FSSQ" type="text"
						value="<%=QTB_FSSQ%>"
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="QTB_BZ" type="text"
						value="<%=QTB_BZ%>"  /></td>
				</tr>
				<tr>
					<td style="text-align: center;">病害合计</td>
					<td style="text-align: center;">/</td>
					<td><input style="width: 100%;" name="BHHJ_FSMJ" type="text"
						value="<%=BHHJ_FSMJ%>" alertname="病害合计发生面积必须为数字" datatype="number" /></td>
					<td><input style="width: 100%;" name="BHHJ_FZMJ" type="text"
						value="<%=BHHJ_FZMJ%>" alertname="病害合计防治面积必须为数字" datatype="number" /></td>
					<td><input style="width: 100%;" name="BHHJ_SJSS" type="text"
						value="<%=BHHJ_SJSS%>" alertname="病害合计实际损失必须为数字" datatype="number" /></td>
					<td><input style="width: 100%;" name="BHHJ_WHSS" type="text"
						value="<%=BHHJ_WHSS%>" alertname="病害合计挽回损失必须为数字" datatype="number" /></td>
					<td><input style="width: 100%;" name="BHHJ_FSQY" type="text"
						value="<%=BHHJ_FSQY%>" /></td>
					<td><input style="width: 100%;" name="BHHJ_FSSQ" type="text"
						value="<%=BHHJ_FSSQ%>"
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="BHHJ_BZ" type="text"
						value="<%=BHHJ_BZ%>"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">病虫合计</td>
					<td style="text-align: center;">/</td>
					<td><input style="width: 100%;" name="BCHJ_FSMJ" type="text"
						value="<%=BCHJ_FSMJ%>" alertname="病虫合计发生面积必须为数字" datatype="number" /></td>
					<td><input style="width: 100%;" name="BCHJ_FZMJ" type="text"
						value="<%=BCHJ_FZMJ%>" alertname="病虫合计防治面积必须为数字" datatype="number" /></td>
					<td><input style="width: 100%;" name="BCHJ_SJSS" type="text"
						value="<%=BCHJ_SJSS%>" alertname="病虫合计实际损失必须为数字" datatype="number" /></td>
					<td><input style="width: 100%;" name="BCHJ_WHSS" type="text"
						value="<%=BCHJ_WHSS%>" alertname="病虫合计挽回损失必须为数字" datatype="number" /></td>
					<td><input style="width: 100%;" name="BCHJ_FSQY" type="text"
						value="<%=BCHJ_FSQY%>"  /></td>
					<td><input style="width: 100%;" name="BCHJ_FSSQ" type="text"
						value="<%=BCHJ_FSSQ%>" 
						class="Wdate" onFocus="WdatePicker()" /></td>
					<td><input style="width: 100%;" name="BCHJ_BZ" type="text"
						value="<%=BCHJ_BZ%>" /></td>
				</tr>
			</tbody>
			<tr>
				<td colspan=100 align="center">
					<%
						if (!bbzt.equals("2") && !bbzt.equals("3") && !bbzt.equals("4")) {
					%> <input type="button" value="保存" id="btnSave" onclick="zt(0)" />&nbsp;&nbsp;
					   <input type="button" value="提交" id="btnSubmit" onclick="zt(1)" />&nbsp;&nbsp;
					   <input type=button value="上载" id="btnUpload" />
					<%
						} else {
					%> <input type=button value="导出Excel" id="btnExport" onclick="dc()" />
					<%
						}
					%> 
			</tr>
		</table>
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">录入人员：<%=LRRY%></td>
				<td style="padding-left: 100px;padding-right: 100px;">录入日期：<%=LRRQ%></td>
			</tr>
		</table>
		<%
			} else {
		%>
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
			<tr>
				<td colspan=100 align="center">
					<%
						if (!bbzt.equals("2") && !bbzt.equals("3") && !bbzt.equals("4")) {
					%> <input type="button" value="保存" id="btnSave" onclick="zt(0)" />&nbsp;&nbsp;
					<input type="button" value="提交" id="btnSubmit" onclick="zt(1)" />
					<%
						} else {
					%> <input type=button value="导出Excel" id="btnExport" onclick="dc()" />
					<%
						}
					%> <!-- 
				<input type=button value="上载" id="btnUpload" /></td>
				 -->
			</tr>
		</table>
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">录入人员：<%=LRRY%></td>
				<td style="padding-left: 100px;padding-right: 100px;">录入日期：<%=LRRQ%></td>
			</tr>
		</table>
		<%
			}
		%>
	</form>
<div id="upLayer"
		style="display:none; width:300px; font-size:12px; border:#D8D8D8 4px solid;position:absolute; left:600px; top:100px; background-color:#F6F6F6">
		<form id="f2" name="f2"
			action="/insect/sjtb/xls_upload_n.jsp?jfid=<%=jfid %>&bbzt=<%=bbzt %>&kstbrq=<%=kstbrq %>&jztbrq=<%=jztbrq %>&lb=<%=lb %>&zbid=<%=zbid %>&rwid=<%=rwid %>&rwsj=<%=rwsj %>"
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
    	 alert("请选择Excel格式文件");
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