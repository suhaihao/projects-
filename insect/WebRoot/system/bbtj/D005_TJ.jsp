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
		String LRRQ = "";
		String LRRY = "";
		String RWSJ = "";
		String DCRQ = "";
			ExecuteConnection ecbody = new ExecuteConnection();
			PreparedStatement pstmtbody = null;
			ResultSet rsbody = null;
			try {
				String sql ="select "
						  +"sum(YDYMM_FSMJ) YDYMM_FSMJ,"
						  +"sum(EDYMM_FSMJ) EDYMM_FSMJ,"
						  +"sum(SDYMM_FSMJ) SDYMM_FSMJ,"
						  +"sum(EDWYE_FSMJ) EDWYE_FSMJ,"
						  +"sum(EDNC_FSMJ) EDNC_FSMJ,"
						  +"sum(SDNC_FSMJ) SDNC_FSMJ,"
						  +"sum(EDMLC_FSMJ) EDMLC_FSMJ,"
						  +"sum(SDMLC_FSMJ) SDMLC_FSMJ,"
						  +"sum(FDMLC_FSMJ) FDMLC_FSMJ,"
						  +"sum(CDM_FSMJ) CDM_FSMJ,"
						  +"sum(YC_FSMJ) YC_FSMJ,"
						  +"sum(JM_FSMJ) JM_FSMJ,"
						  +"sum(YM_FSMJ) YM_FSMJ,"
						  +"sum(SBYJC_FSMJ) SBYJC_FSMJ,"
						  +"sum(TH_FSMJ) TH_FSMJ,"
						  +"sum(DXHC_FSMJ) DXHC_FSMJ,"
						  +"sum(QTCH_FSMJ) QTCH_FSMJ,"
						  +"sum(CHHJ_FSMJ) CHHJ_FSMJ,"
						  +"sum(DBB_FSMJ) DBB_FSMJ,"
						  +"sum(XBB_FSMJ) XBB_FSMJ,"
						  +"sum(HBB_FSMJ) HBB_FSMJ,"
						  +"sum(YMWBMYBB_FSMJ) YMWBMYBB_FSMJ,"
						  +"sum(WKB_FSMJ) WKB_FSMJ,"
						  +"sum(SHSB_FSMJ) SHSB_FSMJ,"
						  +"sum(XB_FSMJ) XB_FSMJ,"
						  +"sum(LHFB_FSMJ) LHFB_FSMJ,"
						  +"sum(CSB_FSMJ) CSB_FSMJ,"
						  +"sum(DFB_FSMJ) DFB_FSMJ,"
						  +"sum(QTB_FSMJ) QTB_FSMJ,"
						  +"sum(BHHJ_FSMJ) BHHJ_FSMJ,"
						  +"sum(BCHJ_FSMJ) BCHJ_FSMJ,"
						  +"sum(YDYMM_FZMJ) YDYMM_FZMJ,"
						  +"sum(EDYMM_FZMJ) EDYMM_FZMJ,"
						  +"sum(SDYMM_FZMJ) SDYMM_FZMJ,"
						  +"sum(EDWYE_FZMJ) EDWYE_FZMJ,"
						  +"sum(EDNC_FZMJ) EDNC_FZMJ,"
						  +"sum(SDNC_FZMJ) SDNC_FZMJ,"
						  +"sum(EDMLC_FZMJ) EDMLC_FZMJ,"
						  +"sum(SDMLC_FZMJ) SDMLC_FZMJ,"
						  +"sum(FDMLC_FZMJ) FDMLC_FZMJ,"
						  +"sum(CDM_FZMJ) CDM_FZMJ,"
						  +"sum(YC_FZMJ) YC_FZMJ,"
						  +"sum(JM_FZMJ) JM_FZMJ,"
						  +"sum(YM_FZMJ) YM_FZMJ,"
						  +"sum(SBYJC_FZMJ) SBYJC_FZMJ,"
						  +"sum(TH_FZMJ) TH_FZMJ,"
						  +"sum(DXHC_FZMJ) DXHC_FZMJ,"
						  +"sum(QTCH_FZMJ) QTCH_FZMJ,"
						  +"sum(CHHJ_FZMJ) CHHJ_FZMJ,"
						  +"sum(DBB_FZMJ) DBB_FZMJ,"
						  +"sum(XBB_FZMJ) XBB_FZMJ,"
						  +"sum(HBB_FZMJ) HBB_FZMJ,"
						  +"sum(YMWBMYBB_FZMJ) YMWBMYBB_FZMJ,"
						  +"sum(WKB_FZMJ) WKB_FZMJ,"
						  +"sum(SHSB_FZMJ) SHSB_FZMJ,"
						  +"sum(XB_FZMJ) XB_FZMJ,"
						  +"sum(LHFB_FZMJ) LHFB_FZMJ,"
						  +"sum(CSB_FZMJ) CSB_FZMJ,"
						  +"sum(DFB_FZMJ) DFB_FZMJ,"
						  +"sum(QTB_FZMJ) QTB_FZMJ,"
						  +"sum(BHHJ_FZMJ) BHHJ_FZMJ,"
						  +"sum(BCHJ_FZMJ) BCHJ_FZMJ,"
						  +"sum(YDYMM_SJSS) YDYMM_SJSS,"
						  +"sum(EDYMM_SJSS) EDYMM_SJSS,"
						  +"sum(SDYMM_SJSS) SDYMM_SJSS,"
						  +"sum(EDWYE_SJSS) EDWYE_SJSS,"
						  +"sum(EDNC_SJSS) EDNC_SJSS,"
						  +"sum(SDNC_SJSS) SDNC_SJSS,"
						  +"sum(EDMLC_SJSS) EDMLC_SJSS,"
						  +"sum(SDMLC_SJSS) SDMLC_SJSS,"
						  +"sum(FDMLC_SJSS) FDMLC_SJSS,"
						  +"sum(CDM_SJSS) CDM_SJSS,"
						  +"sum(YC_SJSS) YC_SJSS,"
						  +"sum(JM_SJSS) JM_SJSS,"
						  +"sum(YM_SJSS) YM_SJSS,"
						  +"sum(SBYJC_SJSS) SBYJC_SJSS,"
						  +"sum(TH_SJSS) TH_SJSS,"
						  +"sum(DXHC_SJSS) DXHC_SJSS,"
						  +"sum(QTCH_SJSS) QTCH_SJSS,"
						  +"sum(CHHJ_SJSS) CHHJ_SJSS,"
						  +"sum(DBB_SJSS) DBB_SJSS,"
						  +"sum(XBB_SJSS) XBB_SJSS,"
						  +"sum(HBB_SJSS) HBB_SJSS,"
						  +"sum(YMWBMYBB_SJSS) YMWBMYBB_SJSS,"
						  +"sum(WKB_SJSS) WKB_SJSS,"
						  +"sum(SHSB_SJSS) SHSB_SJSS,"
						  +"sum(XB_SJSS) XB_SJSS,"
						  +"sum(LHFB_SJSS) LHFB_SJSS,"
						  +"sum(CSB_SJSS) CSB_SJSS,"
						  +"sum(DFB_SJSS) DFB_SJSS,"
						  +"sum(QTB_SJSS) QTB_SJSS,"
						  +"sum(BHHJ_SJSS) BHHJ_SJSS,"
						  +"sum(BCHJ_SJSS) BCHJ_SJSS,"
						  +"sum(YDYMM_WHSS) YDYMM_WHSS,"
						  +"sum(EDYMM_WHSS) EDYMM_WHSS,"
						  +"sum(SDYMM_WHSS) SDYMM_WHSS,"
						  +"sum(EDWYE_WHSS) EDWYE_WHSS,"
						  +"sum(EDNC_WHSS) EDNC_WHSS,"
						  +"sum(SDNC_WHSS) SDNC_WHSS,"
						  +"sum(EDMLC_WHSS) EDMLC_WHSS,"
						  +"sum(SDMLC_WHSS) SDMLC_WHSS,"
						  +"sum(FDMLC_WHSS) FDMLC_WHSS,"
						  +"sum(CDM_WHSS) CDM_WHSS,"
						  +"sum(YC_WHSS) YC_WHSS,"
						  +"sum(JM_WHSS) JM_WHSS,"
						  +"sum(YM_WHSS) YM_WHSS,"
						  +"sum(SBYJC_WHSS) SBYJC_WHSS,"
						  +"sum(TH_WHSS) TH_WHSS,"
						  +"sum(DXHC_WHSS) DXHC_WHSS,"
						  +"sum(QTCH_WHSS) QTCH_WHSS,"
						  +"sum(CHHJ_WHSS) CHHJ_WHSS,"
						  +"sum(DBB_WHSS) DBB_WHSS,"
						  +"sum(XBB_WHSS) XBB_WHSS,"
						  +"sum(HBB_WHSS) HBB_WHSS,"
						  +"sum(YMWBMYBB_WHSS) YMWBMYBB_WHSS,"
						  +"sum(WKB_WHSS) WKB_WHSS,"
						  +"sum(SHSB_WHSS) SHSB_WHSS,"
						  +"sum(XB_WHSS) XB_WHSS,"
						  +"sum(LHFB_WHSS) LHFB_WHSS,"
						  +"sum(CSB_WHSS) CSB_WHSS,"
						  +"sum(DFB_WHSS) DFB_WHSS,"
						  +"sum(QTB_WHSS) QTB_WHSS,"
						  +"sum(BHHJ_WHSS) BHHJ_WHSS,"
						  +"sum(BCHJ_WHSS) BCHJ_WHSS"
						  +" from D005 "
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
					YDYMM_FSMJ = rsbody.getString("YDYMM_FSMJ")==null?"":rsbody.getString("YDYMM_FSMJ");
					YDYMM_FZMJ = rsbody.getString("YDYMM_FZMJ")==null?"":rsbody.getString("YDYMM_FZMJ");
					YDYMM_SJSS = rsbody.getString("YDYMM_SJSS")==null?"":rsbody.getString("YDYMM_SJSS");
					YDYMM_WHSS = rsbody.getString("YDYMM_WHSS")==null?"":rsbody.getString("YDYMM_WHSS");
					EDYMM_FSMJ = rsbody.getString("EDYMM_FSMJ")==null?"":rsbody.getString("EDYMM_FSMJ");
					EDYMM_FZMJ = rsbody.getString("EDYMM_FZMJ")==null?"":rsbody.getString("EDYMM_FZMJ");
					EDYMM_SJSS = rsbody.getString("EDYMM_SJSS")==null?"":rsbody.getString("EDYMM_SJSS");
					EDYMM_WHSS = rsbody.getString("EDYMM_WHSS")==null?"":rsbody.getString("EDYMM_WHSS");
					SDYMM_FSMJ = rsbody.getString("SDYMM_FSMJ")==null?"":rsbody.getString("SDYMM_FSMJ");
					SDYMM_FZMJ = rsbody.getString("SDYMM_FZMJ")==null?"":rsbody.getString("SDYMM_FZMJ");
					SDYMM_SJSS = rsbody.getString("SDYMM_SJSS")==null?"":rsbody.getString("SDYMM_SJSS");
					SDYMM_WHSS = rsbody.getString("SDYMM_WHSS")==null?"":rsbody.getString("SDYMM_WHSS");
					EDWYE_FSMJ = rsbody.getString("EDWYE_FSMJ")==null?"":rsbody.getString("EDWYE_FSMJ");
					EDWYE_FZMJ = rsbody.getString("EDWYE_FZMJ")==null?"":rsbody.getString("EDWYE_FZMJ");
					EDWYE_SJSS = rsbody.getString("EDWYE_SJSS")==null?"":rsbody.getString("EDWYE_SJSS");
					EDWYE_WHSS = rsbody.getString("EDWYE_WHSS")==null?"":rsbody.getString("EDWYE_WHSS");
					EDNC_FSMJ = rsbody.getString("EDNC_FSMJ")==null?"":rsbody.getString("EDNC_FSMJ");
					EDNC_FZMJ = rsbody.getString("EDNC_FZMJ")==null?"":rsbody.getString("EDNC_FZMJ");
					EDNC_SJSS = rsbody.getString("EDNC_SJSS")==null?"":rsbody.getString("EDNC_SJSS");
					EDNC_WHSS = rsbody.getString("EDNC_WHSS")==null?"":rsbody.getString("EDNC_WHSS");
					SDNC_FSMJ = rsbody.getString("SDNC_FSMJ")==null?"":rsbody.getString("SDNC_FSMJ");
					SDNC_FZMJ = rsbody.getString("SDNC_FZMJ")==null?"":rsbody.getString("SDNC_FZMJ");
					SDNC_SJSS = rsbody.getString("SDNC_SJSS")==null?"":rsbody.getString("SDNC_SJSS");
					SDNC_WHSS = rsbody.getString("SDNC_WHSS")==null?"":rsbody.getString("SDNC_WHSS");
					EDMLC_FSMJ = rsbody.getString("EDMLC_FSMJ")==null?"":rsbody.getString("EDMLC_FSMJ");
					EDMLC_FZMJ = rsbody.getString("EDMLC_FZMJ")==null?"":rsbody.getString("EDMLC_FZMJ");
					EDMLC_SJSS = rsbody.getString("EDMLC_SJSS")==null?"":rsbody.getString("EDMLC_SJSS");
					EDMLC_WHSS = rsbody.getString("EDMLC_WHSS")==null?"":rsbody.getString("EDMLC_WHSS");
					SDMLC_FSMJ = rsbody.getString("SDMLC_FSMJ")==null?"":rsbody.getString("SDMLC_FSMJ");
					SDMLC_FZMJ = rsbody.getString("SDMLC_FZMJ")==null?"":rsbody.getString("SDMLC_FZMJ");
					SDMLC_SJSS = rsbody.getString("SDMLC_SJSS")==null?"":rsbody.getString("SDMLC_SJSS");
					SDMLC_WHSS = rsbody.getString("SDMLC_WHSS")==null?"":rsbody.getString("SDMLC_WHSS");
					FDMLC_FSMJ = rsbody.getString("FDMLC_FSMJ")==null?"":rsbody.getString("FDMLC_FSMJ");
					FDMLC_FZMJ = rsbody.getString("FDMLC_FZMJ")==null?"":rsbody.getString("FDMLC_FZMJ");
					FDMLC_SJSS = rsbody.getString("FDMLC_SJSS")==null?"":rsbody.getString("FDMLC_SJSS");
					FDMLC_WHSS = rsbody.getString("FDMLC_WHSS")==null?"":rsbody.getString("FDMLC_WHSS");
					CDM_FSMJ = rsbody.getString("CDM_FSMJ")==null?"":rsbody.getString("CDM_FSMJ");
					CDM_FZMJ = rsbody.getString("CDM_FZMJ")==null?"":rsbody.getString("CDM_FZMJ");
					CDM_SJSS = rsbody.getString("CDM_SJSS")==null?"":rsbody.getString("CDM_SJSS");
					CDM_WHSS = rsbody.getString("CDM_WHSS")==null?"":rsbody.getString("CDM_WHSS");
					YC_FSMJ = rsbody.getString("YC_FSMJ")==null?"":rsbody.getString("YC_FSMJ");
					YC_FZMJ = rsbody.getString("YC_FZMJ")==null?"":rsbody.getString("YC_FZMJ");
					YC_SJSS = rsbody.getString("YC_SJSS")==null?"":rsbody.getString("YC_SJSS");
					YC_WHSS = rsbody.getString("YC_WHSS")==null?"":rsbody.getString("YC_WHSS");
					JM_FSMJ = rsbody.getString("JM_FSMJ")==null?"":rsbody.getString("JM_FSMJ");
					JM_FZMJ = rsbody.getString("JM_FZMJ")==null?"":rsbody.getString("JM_FZMJ");
					JM_SJSS = rsbody.getString("JM_SJSS")==null?"":rsbody.getString("JM_SJSS");
					JM_WHSS = rsbody.getString("JM_WHSS")==null?"":rsbody.getString("JM_WHSS");
					YM_FSMJ = rsbody.getString("YM_FSMJ")==null?"":rsbody.getString("YM_FSMJ");
					YM_FZMJ = rsbody.getString("YM_FZMJ")==null?"":rsbody.getString("YM_FZMJ");
					YM_SJSS = rsbody.getString("YM_SJSS")==null?"":rsbody.getString("YM_SJSS");
					YM_WHSS = rsbody.getString("YM_WHSS")==null?"":rsbody.getString("YM_WHSS");
					SBYJC_FSMJ = rsbody.getString("SBYJC_FSMJ")==null?"":rsbody.getString("SBYJC_FSMJ");
					SBYJC_FZMJ = rsbody.getString("SBYJC_FZMJ")==null?"":rsbody.getString("SBYJC_FZMJ");
					SBYJC_SJSS = rsbody.getString("SBYJC_SJSS")==null?"":rsbody.getString("SBYJC_SJSS");
					SBYJC_WHSS = rsbody.getString("SBYJC_WHSS")==null?"":rsbody.getString("SBYJC_WHSS");
					TH_FSMJ = rsbody.getString("TH_FSMJ")==null?"":rsbody.getString("TH_FSMJ");
					TH_FZMJ = rsbody.getString("TH_FZMJ")==null?"":rsbody.getString("TH_FZMJ");
					TH_SJSS = rsbody.getString("TH_SJSS")==null?"":rsbody.getString("TH_SJSS");
					TH_WHSS = rsbody.getString("TH_WHSS")==null?"":rsbody.getString("TH_WHSS");
					DXHC_FSMJ = rsbody.getString("DXHC_FSMJ")==null?"":rsbody.getString("DXHC_FSMJ");
					DXHC_FZMJ = rsbody.getString("DXHC_FZMJ")==null?"":rsbody.getString("DXHC_FZMJ");
					DXHC_SJSS = rsbody.getString("DXHC_SJSS")==null?"":rsbody.getString("DXHC_SJSS");
					DXHC_WHSS = rsbody.getString("DXHC_WHSS")==null?"":rsbody.getString("DXHC_WHSS");
					QTCH_FSMJ = rsbody.getString("QTCH_FSMJ")==null?"":rsbody.getString("QTCH_FSMJ");
					QTCH_FZMJ = rsbody.getString("QTCH_FZMJ")==null?"":rsbody.getString("QTCH_FZMJ");
					QTCH_SJSS = rsbody.getString("QTCH_SJSS")==null?"":rsbody.getString("QTCH_SJSS");
					QTCH_WHSS = rsbody.getString("QTCH_WHSS")==null?"":rsbody.getString("QTCH_WHSS");
					CHHJ_FSMJ = rsbody.getString("CHHJ_FSMJ")==null?"":rsbody.getString("CHHJ_FSMJ");
					CHHJ_FZMJ = rsbody.getString("CHHJ_FZMJ")==null?"":rsbody.getString("CHHJ_FZMJ");
					CHHJ_SJSS = rsbody.getString("CHHJ_SJSS")==null?"":rsbody.getString("CHHJ_SJSS");
					CHHJ_WHSS = rsbody.getString("CHHJ_WHSS")==null?"":rsbody.getString("CHHJ_WHSS");
					DBB_FSMJ = rsbody.getString("DBB_FSMJ")==null?"":rsbody.getString("DBB_FSMJ");
					DBB_FZMJ = rsbody.getString("DBB_FZMJ")==null?"":rsbody.getString("DBB_FZMJ");
					DBB_SJSS = rsbody.getString("DBB_SJSS")==null?"":rsbody.getString("DBB_SJSS");
					DBB_WHSS = rsbody.getString("DBB_WHSS")==null?"":rsbody.getString("DBB_WHSS");
					XBB_FSMJ = rsbody.getString("XBB_FSMJ")==null?"":rsbody.getString("XBB_FSMJ");
					XBB_FZMJ = rsbody.getString("XBB_FZMJ")==null?"":rsbody.getString("XBB_FZMJ");
					XBB_SJSS = rsbody.getString("XBB_SJSS")==null?"":rsbody.getString("XBB_SJSS");
					XBB_WHSS = rsbody.getString("XBB_WHSS")==null?"":rsbody.getString("XBB_WHSS");
					HBB_FSMJ = rsbody.getString("HBB_FSMJ")==null?"":rsbody.getString("HBB_FSMJ");
					HBB_FZMJ = rsbody.getString("HBB_FZMJ")==null?"":rsbody.getString("HBB_FZMJ");
					HBB_SJSS = rsbody.getString("HBB_SJSS")==null?"":rsbody.getString("HBB_SJSS");
					HBB_WHSS = rsbody.getString("HBB_WHSS")==null?"":rsbody.getString("HBB_WHSS");
					YMWBMYBB_FSMJ = rsbody.getString("YMWBMYBB_FSMJ")==null?"":rsbody.getString("YMWBMYBB_FSMJ");
					YMWBMYBB_FZMJ = rsbody.getString("YMWBMYBB_FZMJ")==null?"":rsbody.getString("YMWBMYBB_FZMJ");
					YMWBMYBB_SJSS = rsbody.getString("YMWBMYBB_SJSS")==null?"":rsbody.getString("YMWBMYBB_SJSS");
					YMWBMYBB_WHSS = rsbody.getString("YMWBMYBB_WHSS")==null?"":rsbody.getString("YMWBMYBB_WHSS");
					WKB_FSMJ = rsbody.getString("WKB_FSMJ")==null?"":rsbody.getString("WKB_FSMJ");
					WKB_FZMJ = rsbody.getString("WKB_FZMJ")==null?"":rsbody.getString("WKB_FZMJ");
					WKB_SJSS = rsbody.getString("WKB_SJSS")==null?"":rsbody.getString("WKB_SJSS");
					WKB_WHSS = rsbody.getString("WKB_WHSS")==null?"":rsbody.getString("WKB_WHSS");
					SHSB_FSMJ = rsbody.getString("SHSB_FSMJ")==null?"":rsbody.getString("SHSB_FSMJ");
					SHSB_FZMJ = rsbody.getString("SHSB_FZMJ")==null?"":rsbody.getString("SHSB_FZMJ");
					SHSB_SJSS = rsbody.getString("SHSB_SJSS")==null?"":rsbody.getString("SHSB_SJSS");
					SHSB_WHSS = rsbody.getString("SHSB_WHSS")==null?"":rsbody.getString("SHSB_WHSS");
					XB_FSMJ = rsbody.getString("XB_FSMJ")==null?"":rsbody.getString("XB_FSMJ");
					XB_FZMJ = rsbody.getString("XB_FZMJ")==null?"":rsbody.getString("XB_FZMJ");
					XB_SJSS = rsbody.getString("XB_SJSS")==null?"":rsbody.getString("XB_SJSS");
					XB_WHSS = rsbody.getString("XB_WHSS")==null?"":rsbody.getString("XB_WHSS");
					LHFB_FSMJ = rsbody.getString("LHFB_FSMJ")==null?"":rsbody.getString("LHFB_FSMJ");
					LHFB_FZMJ = rsbody.getString("LHFB_FZMJ")==null?"":rsbody.getString("LHFB_FZMJ");
					LHFB_SJSS = rsbody.getString("LHFB_SJSS")==null?"":rsbody.getString("LHFB_SJSS");
					LHFB_WHSS = rsbody.getString("LHFB_WHSS")==null?"":rsbody.getString("LHFB_WHSS");
					CSB_FSMJ = rsbody.getString("CSB_FSMJ")==null?"":rsbody.getString("CSB_FSMJ");
					CSB_FZMJ = rsbody.getString("CSB_FZMJ")==null?"":rsbody.getString("CSB_FZMJ");
					CSB_SJSS = rsbody.getString("CSB_SJSS")==null?"":rsbody.getString("CSB_SJSS");
					CSB_WHSS = rsbody.getString("CSB_WHSS")==null?"":rsbody.getString("CSB_WHSS");
					DFB_FSMJ = rsbody.getString("DFB_FSMJ")==null?"":rsbody.getString("DFB_FSMJ");
					DFB_FZMJ = rsbody.getString("DFB_FZMJ")==null?"":rsbody.getString("DFB_FZMJ");
					DFB_SJSS = rsbody.getString("DFB_SJSS")==null?"":rsbody.getString("DFB_SJSS");
					DFB_WHSS = rsbody.getString("DFB_WHSS")==null?"":rsbody.getString("DFB_WHSS");
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
	<form id="f1" name="f1" action=""
		method="post">
        <table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td colspan=5 rowspan=1
					style="text-align:center;font-size=30;width: ;height: "><b>玉米病虫害年度统计表
				</b><br> <br></td>
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
					<td><label><%=YDYMM_FSCD%></label></td>
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
					<td><label><%=EDYMM_FSCD%></label></td>
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
					<td><label><%=SDYMM_FSCD%></label></td>
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
					<td><label><%=EDWYE_FSCD%></label></td>
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
					<td><label><%=EDNC_FSCD%></label></td>
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
					<td><label><%=SDNC_FSCD%></label></td>
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
					<td><label><%=EDMLC_FSCD%></label></td>
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
					<td><label><%=SDMLC_FSCD%></label></td>
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
					<td><label><%=FDMLC_FSCD%></label></td>
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
					<td><label><%=CDM_FSCD%></label></td>
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
					<td><label><%=YC_FSCD%></label></td>
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
					<td><label><%=JM_FSCD%></label></td>
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
					<td><label><%=YM_FSCD%></label></td>
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
					<td><label><%=SBYJC_FSCD%></label></td>
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
					<td><label><%=TH_FSCD%></label></td>
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
					<td><label><%=DXHC_FSCD%></label></td>
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
					<td><label><%=QTCH_FSCD%></label></td>
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
					<td><label><%=DBB_FSCD%></label></td>
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
					<td><label><%=XBB_FSCD%></label></td>
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
					<td><label><%=HBB_FSCD%></label></td>
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
					<td><label><%=YMWBMYBB_FSCD%></label></td>
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
					<td><label><%=WKB_FSCD%></label></td>
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
					<td><label><%=SHSB_FSCD%></label></td>
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
					<td><label><%=XB_FSCD%></label></td>
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
					<td><label><%=LHFB_FSCD%></label></td>
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
					<td><label><%=CSB_FSCD%></label></td>
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
					<td><label><%=DFB_FSCD%></label></td>
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
					<td><label><%=QTB_FSCD%></label></td>
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