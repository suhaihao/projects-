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
		String CXYM_ZZMJ = "";
		String MJHJ_BCNZJ = "";
		String YJYMBH_BCNZJ = "";
		String ZYZZQY = "";
		String DQZTZS = "";
		String BSN = "";
		String YDYMM_FSCD = "";
		String YDYMM_FSMJ = "";
		String YDYMM_ZDFSQY = "";
		String YDYMM_FSCD_H = "";
		String YDYMM_FSMJ_H = "";
		String YDYMM_ZDFSQY_H = "";
		String EDYMM_FSCD = "";
		String EDYMM_FSMJ = "";
		String EDYMM_ZDFSQY = "";
		String EDYMM_FSCD_H = "";
		String EDYMM_FSMJ_H = "";
		String EDYMM_ZDFSQY_H = "";
		String SDYMM_FSCD = "";
		String SDYMM_FSMJ = "";
		String SDYMM_ZDFSQY = "";
		String SDYMM_FSCD_H = "";
		String SDYMM_FSMJ_H = "";
		String SDYMM_ZDFSQY_H = "";
		String EDWYE_FSCD = "";
		String EDWYE_FSMJ = "";
		String EDWYE_ZDFSQY = "";
		String EDWYE_FSCD_H = "";
		String EDWYE_FSMJ_H = "";
		String EDWYE_ZDFSQY_H = "";
		String EDNC_FSCD = "";
		String EDNC_FSMJ = "";
		String EDNC_ZDFSQY = "";
		String EDNC_FSCD_H = "";
		String EDNC_FSMJ_H = "";
		String EDNC_ZDFSQY_H = "";
		String SDNC_FSCD = "";
		String SDNC_FSMJ = "";
		String SDNC_ZDFSQY = "";
		String SDNC_FSCD_H = "";
		String SDNC_FSMJ_H = "";
		String SDNC_ZDFSQY_H = "";
		String SDMLC_FSCD = "";
		String SDMLC_FSMJ = "";
		String SDMLC_ZDFSQY = "";
		String SDMLC_FSCD_H = "";
		String SDMLC_FSMJ_H = "";
		String SDMLC_ZDFSQY_H = "";
		String CDM_FSCD = "";
		String CDM_FSMJ = "";
		String CDM_ZDFSQY = "";
		String CDM_FSCD_H = "";
		String CDM_FSMJ_H = "";
		String CDM_ZDFSQY_H = "";
		String YC_FSCD = "";
		String YC_FSMJ = "";
		String YC_ZDFSQY = "";
		String YC_FSCD_H = "";
		String YC_FSMJ_H = "";
		String YC_ZDFSQY_H = "";
		String JM_FSCD = "";
		String JM_FSMJ = "";
		String JM_ZDFSQY = "";
		String JM_FSCD_H = "";
		String JM_FSMJ_H = "";
		String JM_ZDFSQY_H = "";
		String YM_FSCD = "";
		String YM_FSMJ = "";
		String YM_ZDFSQY = "";
		String YM_FSCD_H = "";
		String YM_FSMJ_H = "";
		String YM_ZDFSQY_H = "";
		String SBYYJ_FSCD = "";
		String SBYYJ_FSMJ = "";
		String SBYYJ_ZDFSQY = "";
		String SBYYJ_FSCD_H = "";
		String SBYYJ_FSMJ_H = "";
		String SBYYJ_ZDFSQY_H = "";
		String TH_FSCD = "";
		String TH_FSMJ = "";
		String TH_ZDFSQY = "";
		String TH_FSCD_H = "";
		String TH_FSMJ_H = "";
		String TH_ZDFSQY_H = "";
		String DXHC_FSCD = "";
		String DXHC_FSMJ = "";
		String DXHC_ZDFSQY = "";
		String DXHC_FSCD_H = "";
		String DXHC_FSMJ_H = "";
		String DXHC_ZDFSQY_H = "";
		String QTHC_FSCD = "";
		String QTHC_FSMJ = "";
		String QTHC_ZDFSQY = "";
		String QTHC_FSCD_H = "";
		String QTHC_FSMJ_H = "";
		String QTHC_ZDFSQY_H = "";
		String CHHJ_FSCD = "";
		String CHHJ_FSMJ = "";
		String CHHJ_ZDFSQY = "";
		String CHHJ_FSCD_H = "";
		String CHHJ_FSMJ_H = "";
		String CHHJ_ZDFSQY_H = "";
		String DBB_FSCD = "";
		String DBB_FSMJ = "";
		String DBB_ZDFSQY = "";
		String DBB_FSCD_H = "";
		String DBB_FSMJ_H = "";
		String DBB_ZDFSQY_H = "";
		String XBB_FSCD = "";
		String XBB_FSMJ = "";
		String XBB_ZDFSQY = "";
		String XBB_FSCD_H = "";
		String XBB_FSMJ_H = "";
		String XBB_ZDFSQY_H = "";
		String HBB_FSCD = "";
		String HBB_FSMJ = "";
		String HBB_ZDFSQY = "";
		String HBB_FSCD_H = "";
		String HBB_FSMJ_H = "";
		String HBB_ZDFSQY_H = "";
		String YMWBMYBB_FSCD = "";
		String YMWBMYBB_FSMJ = "";
		String YMWBMYBB_ZDFSQY = "";
		String YMWBMYBB_FSCD_H = "";
		String YMWBMYBB_FSMJ_H = "";
		String YMWBMYBB_ZDFSQY_H = "";
		String WKB_FSCD = "";
		String WKB_FSMJ = "";
		String WKB_ZDFSQY = "";
		String WKB_FSCD_H = "";
		String WKB_FSMJ_H = "";
		String WKB_ZDFSQY_H = "";
		String SHSB_FSCD = "";
		String SHSB_FSMJ = "";
		String SHSB_ZDFSQY = "";
		String SHSB_FSCD_H = "";
		String SHSB_FSMJ_H = "";
		String SHSB_ZDFSQY_H = "";
		String XB_FSCD = "";
		String XB_FSMJ = "";
		String XB_ZDFSQY = "";
		String XB_FSCD_H = "";
		String XB_FSMJ_H = "";
		String XB_ZDFSQY_H = "";
		String LHFB_FSCD = "";
		String LHFB_FSMJ = "";
		String LHFB_ZDFSQY = "";
		String LHFB_FSCD_H = "";
		String LHFB_FSMJ_H = "";
		String LHFB_ZDFSQY_H = "";
		String CSB_FSCD = "";
		String CSB_FSMJ = "";
		String CSB_ZDFSQY = "";
		String CSB_FSCD_H = "";
		String CSB_FSMJ_H = "";
		String CSB_ZDFSQY_H = "";
		String DFB_FSCD = "";
		String DFB_FSMJ = "";
		String DFB_ZDFSQY = "";
		String DFB_FSCD_H = "";
		String DFB_FSMJ_H = "";
		String DFB_ZDFSQY_H = "";
		String QTB_FSCD = "";
		String QTB_FSMJ = "";
		String QTB_ZDFSQY = "";
		String QTB_FSCD_H = "";
		String QTB_FSMJ_H = "";
		String QTB_ZDFSQY_H = "";
		String BHHJ_FSCD = "";
		String BHHJ_FSMJ = "";
		String BHHJ_ZDFSQY = "";
		String BHHJ_FSCD_H = "";
		String BHHJ_FSMJ_H = "";
		String BHHJ_ZDFSQY_H = "";
		String BCHJ_FSCD = "";
		String BCHJ_FSMJ = "";
		String BCHJ_ZDFSQY = "";
		String BCHJ_FSCD_H = "";
		String BCHJ_FSMJ_H = "";
		String BCHJ_ZDFSQY_H = "";
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
					        +"sum(CXYM_ZZMJ) CXYM_ZZMJ,"
					        +"sum(YDYMM_FSMJ) YDYMM_FSMJ,"
					        +"sum(EDYMM_FSMJ) EDYMM_FSMJ,"
					        +"sum(SDYMM_FSMJ) SDYMM_FSMJ,"
					        +"sum(EDWYE_FSMJ) EDWYE_FSMJ,"
					        +"sum(EDNC_FSMJ) EDNC_FSMJ,"
					        +"sum(SDNC_FSMJ) SDNC_FSMJ,"
					        +"sum(SDMLC_FSMJ) SDMLC_FSMJ,"
					        +"sum(CDM_FSMJ) CDM_FSMJ,"
					        +"sum(YC_FSMJ) YC_FSMJ,"
					        +"sum(JM_FSMJ) JM_FSMJ,"
					        +"sum(YM_FSMJ) YM_FSMJ,"
					        +"sum(SBYYJ_FSMJ) SBYYJ_FSMJ,"
					        +"sum(TH_FSMJ) TH_FSMJ,"
					        +"sum(DXHC_FSMJ) DXHC_FSMJ,"
					        +"sum(QTHC_FSMJ) QTHC_FSMJ,"
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
					        +"sum(YDYMM_FSMJ_H) YDYMM_FSMJ_H,"
					        +"sum(EDYMM_FSMJ_H) EDYMM_FSMJ_H,"
					        +"sum(SDYMM_FSMJ_H) SDYMM_FSMJ_H,"
					        +"sum(EDWYE_FSMJ_H) EDWYE_FSMJ_H,"
					        +"sum(EDNC_FSMJ_H) EDNC_FSMJ_H,"
					        +"sum(SDNC_FSMJ_H) SDNC_FSMJ_H,"
					        +"sum(SDMLC_FSMJ_H) SDMLC_FSMJ_H,"
					        +"sum(CDM_FSMJ_H) CDM_FSMJ_H,"
					        +"sum(YC_FSMJ_H) YC_FSMJ_H,"
					        +"sum(JM_FSMJ_H) JM_FSMJ_H,"
					        +"sum(YM_FSMJ_H) YM_FSMJ_H,"
					        +"sum(SBYYJ_FSMJ_H) SBYYJ_FSMJ_H,"
					        +"sum(TH_FSMJ_H) TH_FSMJ_H,"
					        +"sum(DXHC_FSMJ_H) DXHC_FSMJ_H,"
					        +"sum(QTHC_FSMJ_H) QTHC_FSMJ_H,"
					        +"sum(CHHJ_FSMJ_H) CHHJ_FSMJ_H,"
					        +"sum(DBB_FSMJ_H) DBB_FSMJ_H,"
					        +"sum(XBB_FSMJ_H) XBB_FSMJ_H,"
					        +"sum(HBB_FSMJ_H) HBB_FSMJ_H,"
					        +"sum(YMWBMYBB_FSMJ_H) YMWBMYBB_FSMJ_H,"
					        +"sum(WKB_FSMJ_H) WKB_FSMJ_H,"
					        +"sum(SHSB_FSMJ_H) SHSB_FSMJ_H,"
					        +"sum(XB_FSMJ_H) XB_FSMJ_H,"
					        +"sum(LHFB_FSMJ_H) LHFB_FSMJ_H,"
					        +"sum(CSB_FSMJ_H) CSB_FSMJ_H,"
					        +"sum(DFB_FSMJ_H) DFB_FSMJ_H,"
					        +"sum(QTB_FSMJ_H) QTB_FSMJ_H,"
					        +"sum(BHHJ_FSMJ_H) BHHJ_FSMJ_H,"
					        +"sum(BCHJ_FSMJ_H) BCHJ_FSMJ_H"
					    	+" from D013 "
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
					CXYM_ZZMJ = rsbody.getString("CXYM_ZZMJ")==null?"":rsbody.getString("CXYM_ZZMJ");
					YDYMM_FSMJ = rsbody.getString("YDYMM_FSMJ")==null?"":rsbody.getString("YDYMM_FSMJ");
					YDYMM_FSMJ_H = rsbody.getString("YDYMM_FSMJ_H")==null?"":rsbody.getString("YDYMM_FSMJ_H");
					EDYMM_FSMJ = rsbody.getString("EDYMM_FSMJ")==null?"":rsbody.getString("EDYMM_FSMJ");
					EDYMM_FSMJ_H = rsbody.getString("EDYMM_FSMJ_H")==null?"":rsbody.getString("EDYMM_FSMJ_H");
					SDYMM_FSMJ = rsbody.getString("SDYMM_FSMJ")==null?"":rsbody.getString("SDYMM_FSMJ");
					SDYMM_FSMJ_H = rsbody.getString("SDYMM_FSMJ_H")==null?"":rsbody.getString("SDYMM_FSMJ_H");
					EDWYE_FSMJ = rsbody.getString("EDWYE_FSMJ")==null?"":rsbody.getString("EDWYE_FSMJ");
					EDWYE_FSMJ_H = rsbody.getString("EDWYE_FSMJ_H")==null?"":rsbody.getString("EDWYE_FSMJ_H");
					EDNC_FSMJ = rsbody.getString("EDNC_FSMJ")==null?"":rsbody.getString("EDNC_FSMJ");
					EDNC_FSMJ_H = rsbody.getString("EDNC_FSMJ_H")==null?"":rsbody.getString("EDNC_FSMJ_H");
					SDNC_FSMJ = rsbody.getString("SDNC_FSMJ")==null?"":rsbody.getString("SDNC_FSMJ");
					SDNC_FSMJ_H = rsbody.getString("SDNC_FSMJ_H")==null?"":rsbody.getString("SDNC_FSMJ_H");
					SDMLC_FSMJ = rsbody.getString("SDMLC_FSMJ")==null?"":rsbody.getString("SDMLC_FSMJ");
					SDMLC_FSMJ_H = rsbody.getString("SDMLC_FSMJ_H")==null?"":rsbody.getString("SDMLC_FSMJ_H");
					CDM_FSMJ = rsbody.getString("CDM_FSMJ")==null?"":rsbody.getString("CDM_FSMJ");
					CDM_FSMJ_H = rsbody.getString("CDM_FSMJ_H")==null?"":rsbody.getString("CDM_FSMJ_H");
					YC_FSMJ = rsbody.getString("YC_FSMJ")==null?"":rsbody.getString("YC_FSMJ");
					YC_FSMJ_H = rsbody.getString("YC_FSMJ_H")==null?"":rsbody.getString("YC_FSMJ_H");
					JM_FSMJ = rsbody.getString("JM_FSMJ")==null?"":rsbody.getString("JM_FSMJ");
					JM_FSMJ_H = rsbody.getString("JM_FSMJ_H")==null?"":rsbody.getString("JM_FSMJ_H");
					YM_FSMJ = rsbody.getString("YM_FSMJ")==null?"":rsbody.getString("YM_FSMJ");
					YM_FSMJ_H = rsbody.getString("YM_FSMJ_H")==null?"":rsbody.getString("YM_FSMJ_H");
					SBYYJ_FSMJ = rsbody.getString("SBYYJ_FSMJ")==null?"":rsbody.getString("SBYYJ_FSMJ");
					SBYYJ_FSMJ_H = rsbody.getString("SBYYJ_FSMJ_H")==null?"":rsbody.getString("SBYYJ_FSMJ_H");
					TH_FSMJ = rsbody.getString("TH_FSMJ")==null?"":rsbody.getString("TH_FSMJ");
					TH_FSMJ_H = rsbody.getString("TH_FSMJ_H")==null?"":rsbody.getString("TH_FSMJ_H");
					DXHC_FSMJ = rsbody.getString("DXHC_FSMJ")==null?"":rsbody.getString("DXHC_FSMJ");
					DXHC_FSMJ_H = rsbody.getString("DXHC_FSMJ_H")==null?"":rsbody.getString("DXHC_FSMJ_H");
					QTHC_FSMJ = rsbody.getString("QTHC_FSMJ")==null?"":rsbody.getString("QTHC_FSMJ");
					QTHC_FSMJ_H = rsbody.getString("QTHC_FSMJ_H")==null?"":rsbody.getString("QTHC_FSMJ_H");
					CHHJ_FSMJ = rsbody.getString("CHHJ_FSMJ")==null?"":rsbody.getString("CHHJ_FSMJ");
					CHHJ_FSMJ_H = rsbody.getString("CHHJ_FSMJ_H")==null?"":rsbody.getString("CHHJ_FSMJ_H");
					DBB_FSMJ = rsbody.getString("DBB_FSMJ")==null?"":rsbody.getString("DBB_FSMJ");
					DBB_FSMJ_H = rsbody.getString("DBB_FSMJ_H")==null?"":rsbody.getString("DBB_FSMJ_H");
					XBB_FSMJ = rsbody.getString("XBB_FSMJ")==null?"":rsbody.getString("XBB_FSMJ");
					XBB_FSMJ_H = rsbody.getString("XBB_FSMJ_H")==null?"":rsbody.getString("XBB_FSMJ_H");
					HBB_FSMJ = rsbody.getString("HBB_FSMJ")==null?"":rsbody.getString("HBB_FSMJ");
					HBB_FSMJ_H = rsbody.getString("HBB_FSMJ_H")==null?"":rsbody.getString("HBB_FSMJ_H");
					YMWBMYBB_FSMJ = rsbody.getString("YMWBMYBB_FSMJ")==null?"":rsbody.getString("YMWBMYBB_FSMJ");
					YMWBMYBB_FSMJ_H = rsbody.getString("YMWBMYBB_FSMJ_H")==null?"":rsbody.getString("YMWBMYBB_FSMJ_H");
					WKB_FSMJ = rsbody.getString("WKB_FSMJ")==null?"":rsbody.getString("WKB_FSMJ");
					WKB_FSMJ_H = rsbody.getString("WKB_FSMJ_H")==null?"":rsbody.getString("WKB_FSMJ_H");
					SHSB_FSMJ = rsbody.getString("SHSB_FSMJ")==null?"":rsbody.getString("SHSB_FSMJ");
					SHSB_FSMJ_H = rsbody.getString("SHSB_FSMJ_H")==null?"":rsbody.getString("SHSB_FSMJ_H");
					XB_FSMJ = rsbody.getString("XB_FSMJ")==null?"":rsbody.getString("XB_FSMJ");
					XB_FSMJ_H = rsbody.getString("XB_FSMJ_H")==null?"":rsbody.getString("XB_FSMJ_H");
					LHFB_FSMJ = rsbody.getString("LHFB_FSMJ")==null?"":rsbody.getString("LHFB_FSMJ");
					LHFB_FSMJ_H = rsbody.getString("LHFB_FSMJ_H")==null?"":rsbody.getString("LHFB_FSMJ_H");
					CSB_FSMJ = rsbody.getString("CSB_FSMJ")==null?"":rsbody.getString("CSB_FSMJ");
					CSB_FSMJ_H = rsbody.getString("CSB_FSMJ_H")==null?"":rsbody.getString("CSB_FSMJ_H");
					DFB_FSMJ = rsbody.getString("DFB_FSMJ")==null?"":rsbody.getString("DFB_FSMJ");
					DFB_FSMJ_H = rsbody.getString("DFB_FSMJ_H")==null?"":rsbody.getString("DFB_FSMJ_H");
					QTB_FSMJ = rsbody.getString("QTB_FSMJ")==null?"":rsbody.getString("QTB_FSMJ");
					QTB_FSMJ_H = rsbody.getString("QTB_FSMJ_H")==null?"":rsbody.getString("QTB_FSMJ_H");
					BHHJ_FSMJ = rsbody.getString("BHHJ_FSMJ")==null?"":rsbody.getString("BHHJ_FSMJ");
					BHHJ_FSMJ_H = rsbody.getString("BHHJ_FSMJ_H")==null?"":rsbody.getString("BHHJ_FSMJ_H");
					BCHJ_FSMJ = rsbody.getString("BCHJ_FSMJ")==null?"":rsbody.getString("BCHJ_FSMJ");
					BCHJ_FSMJ_H = rsbody.getString("BCHJ_FSMJ_H")==null?"":rsbody.getString("BCHJ_FSMJ_H");
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
					style="text-align:center;font-size=30;width: ;height: "><b>玉米病虫中后期发生趋势预测表
				</b><br> <br></td>
			</tr>
		</table>
		<table border=1 borderColorDark=black borderColorLight=white
			cellpadding=1 cellspacing=1 align=center id=zg name=zg>
			<tbody id="zg_head">
				<tr>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>春、夏玉米种植面积合计（万亩）</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>面积合计比常年增减比率（+ -）（%）</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>预计玉米病虫害下半年总体发生程度（）</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>主要种植区域</b></td>
					<td colspan=2 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>当前总体长势（好 中 差）</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>比上年（轻 重）</b></td>
				</tr>
				<tr>
				<td colspan=1 rowspan=1><label><%=CXYM_ZZMJ%></label></td>
				<td><label><%=MJHJ_BCNZJ%></label></td>
				<td><label><%=YJYMBH_BCNZJ%></label></td>
				<td><label><%=ZYZZQY%></label></td>
				<td colspan=2 rowspan=1><label><%=DQZTZS%></label></td>
				<td><label><%=BSN%></label></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>病虫名称</b></td>
					<td colspan=3 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>前期发生情况统计</b></td>
					<td colspan=3 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>中后期发生趋势预测</b></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>发生程度（级)</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>发生面积（万亩）</b></td>
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
					<td style="text-align: center;">一代玉米螟</td>
					<td><label><%=YDYMM_FSCD%></label></td>
					<td><label><%=YDYMM_FSMJ%></label></td>
					<td><label><%=YDYMM_ZDFSQY%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=YDYMM_FSMJ_H%></label></td>
					<td><label><%=YDYMM_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">二代玉米螟</td>
					<td style="text-align: center;">\</td>
					<td><label><%=EDYMM_FSMJ%></label></td>
					<td><label><%=EDYMM_ZDFSQY%></label></td>
					<td><label><%=EDYMM_FSCD_H%></label></td>
					<td><label><%=EDYMM_FSMJ_H%></label></td>
					<td><label><%=EDYMM_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">三代玉米螟</td>
					<td style="text-align: center;">\</td>
					<td><label><%=SDYMM_FSMJ%></label></td>
					<td><label><%=SDYMM_ZDFSQY%></label></td>
					<td><label><%=SDYMM_FSCD_H%></label></td>
					<td><label><%=SDYMM_FSMJ_H%></label></td>
					<td><label><%=SDYMM_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">二点委夜蛾</td>
					<td><label><%=EDWYE_FSCD%></label></td>
					<td><label><%=EDWYE_FSMJ%></label></td>
					<td><label><%=EDWYE_ZDFSQY%></label></td>
					<td><label><%=EDWYE_FSCD_H%></label></td>
					<td><label><%=EDWYE_FSMJ_H%></label></td>
					<td><label><%=EDWYE_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">二代粘虫</td>
					<td><label><%=EDNC_FSCD%></label></td>
					<td><label><%=EDNC_FSMJ%></label></td>
					<td><label><%=EDNC_ZDFSQY%></label></td>
				    <td style="text-align: center;">\</td>
					<td><label><%=EDNC_FSMJ_H%></label></td>
					<td><label><%=EDNC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">三代粘虫</td>
				    <td style="text-align: center;">\</td>
					<td><label><%=SDNC_FSMJ%></label></td>
					<td><label><%=SDNC_ZDFSQY%></label></td>
					<td><label><%=SDNC_FSCD_H%></label></td>
					<td><label><%=SDNC_FSMJ_H%></label></td>
					<td><label><%=SDNC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">三代棉铃虫</td>
					<td style="text-align: center;">\</td>
					<td><label><%=SDMLC_FSMJ%></label></td>
					<td><label><%=SDMLC_ZDFSQY%></label></td>
					<td><label><%=SDMLC_FSCD_H%></label></td>
					<td><label><%=SDMLC_FSMJ_H%></label></td>
					<td><label><%=SDMLC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">草地螟</td>
					<td><label><%=CDM_FSCD%></label></td>
					<td><label><%=CDM_FSMJ%></label></td>
					<td><label><%=CDM_ZDFSQY%></label></td>
					<td><label><%=CDM_FSCD_H%></label></td>
					<td><label><%=CDM_FSMJ_H%></label></td>
					<td><label><%=CDM_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">蚜虫</td>
					<td><label><%=YC_FSCD%></label></td>
					<td><label><%=YC_FSMJ%></label></td>
					<td><label><%=YC_ZDFSQY%></label></td>
					<td><label><%=YC_FSCD_H%></label></td>
					<td><label><%=YC_FSMJ_H%></label></td>
					<td><label><%=YC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">蓟马</td>
					<td><label><%=JM_FSCD%></label></td>
					<td><label><%=JM_FSMJ%></label></td>
					<td><label><%=JM_ZDFSQY%></label></td>
					<td><label><%=JM_FSCD_H%></label></td>
					<td><label><%=JM_FSMJ_H%></label></td>
					<td><label><%=JM_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">叶螨</td>
					<td><label><%=YM_FSCD%></label></td>
					<td><label><%=YM_FSMJ%></label></td>
					<td><label><%=YM_ZDFSQY%></label></td>
					<td><label><%=YM_FSCD_H%></label></td>
					<td><label><%=YM_FSMJ_H%></label></td>
					<td><label><%=YM_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">双斑萤叶甲</td>
					<td><label><%=SBYYJ_FSCD%></label></td>
					<td><label><%=SBYYJ_FSMJ%></label></td>
					<td><label><%=SBYYJ_ZDFSQY%></label></td>
					<td><label><%=SBYYJ_FSCD_H%></label></td>
					<td><label><%=SBYYJ_FSMJ_H%></label></td>
					<td><label><%=SBYYJ_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">土蝗（玉米田）</td>
					<td><label><%=TH_FSCD%></label></td>
					<td><label><%=TH_FSMJ%></label></td>
					<td><label><%=TH_ZDFSQY%></label></td>
					<td><label><%=TH_FSCD_H%></label></td>
					<td><label><%=TH_FSMJ_H%></label></td>
					<td><label><%=TH_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">地下害虫</td>
					<td><label><%=DXHC_FSCD%></label></td>
					<td><label><%=DXHC_FSMJ%></label></td>
					<td><label><%=DXHC_ZDFSQY%></label></td>
					<td><label><%=DXHC_FSCD_H%></label></td>
					<td><label><%=DXHC_FSMJ_H%></label></td>
					<td><label><%=DXHC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">其他害虫</td>
					<td><label><%=QTHC_FSCD%></label></td>
					<td><label><%=QTHC_FSMJ%></label></td>
					<td><label><%=QTHC_ZDFSQY%></label></td>
					<td><label><%=QTHC_FSCD_H%></label></td>
					<td><label><%=QTHC_FSMJ_H%></label></td>
					<td><label><%=QTHC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">虫害合计</td>
					<td style="text-align: center;">\</td>
					<td><label><%=CHHJ_FSMJ%></label></td>
					<td><label><%=CHHJ_ZDFSQY%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=CHHJ_FSMJ_H%></label></td>
					<td><label><%=CHHJ_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">大斑病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=DBB_FSMJ%></label></td>
					<td><label><%=DBB_ZDFSQY%></label></td>
					<td><label><%=DBB_FSCD_H%></label></td>
					<td><label><%=DBB_FSMJ_H%></label></td>
					<td><label><%=DBB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">小斑病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=XBB_FSMJ%></label></td>
					<td><label><%=XBB_ZDFSQY%></label></td>
					<td><label><%=XBB_FSCD_H%></label></td>
					<td><label><%=XBB_FSMJ_H%></label></td>
					<td><label><%=XBB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">褐斑病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=HBB_FSMJ%></label></td>
					<td><label><%=HBB_ZDFSQY%></label></td>
					<td><label><%=HBB_FSCD_H%></label></td>
					<td><label><%=HBB_FSMJ_H%></label></td>
					<td><label><%=HBB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">玉米弯孢霉叶斑病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=YMWBMYBB_FSMJ%></label></td>
					<td><label><%=YMWBMYBB_ZDFSQY%></label></td>
					<td><label><%=YMWBMYBB_FSCD_H%></label></td>
					<td><label><%=YMWBMYBB_FSMJ_H%></label></td>
					<td><label><%=YMWBMYBB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">纹枯病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=WKB_FSMJ%></label></td>
					<td><label><%=WKB_ZDFSQY%></label></td>
					<td><label><%=WKB_FSCD_H%></label></td>
					<td><label><%=WKB_FSMJ_H%></label></td>
					<td><label><%=WKB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">丝黑穗病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=SHSB_FSMJ%></label></td>
					<td><label><%=SHSB_ZDFSQY%></label></td>
					<td><label><%=SHSB_FSCD_H%></label></td>
					<td><label><%=SHSB_FSMJ_H%></label></td>
					<td><label><%=SHSB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">锈病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=XB_FSMJ%></label></td>
					<td><label><%=XB_ZDFSQY%></label></td>
					<td><label><%=XB_FSCD_H%></label></td>
					<td><label><%=XB_FSMJ_H%></label></td>
					<td><label><%=XB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">瘤黑粉病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=LHFB_FSMJ%></label></td>
					<td><label><%=LHFB_ZDFSQY%></label></td>
					<td><label><%=LHFB_FSCD_H%></label></td>
					<td><label><%=LHFB_FSMJ_H%></label></td>
					<td><label><%=LHFB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">粗缩病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=CSB_FSMJ%></label></td>
					<td><label><%=CSB_ZDFSQY%></label></td>
					<td><label><%=CSB_FSCD_H%></label></td>
					<td><label><%=CSB_FSMJ_H%></label></td>
					<td><label><%=CSB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">顶腐病</td>
					<td style="text-align: center;">\</td>
					<td><label><%=DFB_FSMJ%></label></td>
					<td><label><%=DFB_ZDFSQY%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=DFB_FSMJ_H%></label></td>
					<td><label><%=DFB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">其他病害</td>
					<td style="text-align: center;">\</td>
					<td><label><%=QTB_FSMJ%></label></td>
					<td><label><%=QTB_ZDFSQY%></label></td>
					<td><label><%=QTB_FSCD_H%></label></td>
					<td><label><%=QTB_FSMJ_H%></label></td>
					<td><label><%=QTB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">病害合计</td>
					<td style="text-align: center;">\</td>
					<td><label><%=BHHJ_FSMJ%></label></td>
					<td><label><%=BHHJ_ZDFSQY%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=BHHJ_FSMJ_H%></label></td>
					<td><label><%=BHHJ_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">病虫合计</td>
					<td style="text-align: center;">\</td>
					<td><label><%=BCHJ_FSMJ%></label></td>
					<td><label><%=BCHJ_ZDFSQY%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=BCHJ_FSMJ_H%></label></td>
					<td><label><%=BCHJ_ZDFSQY_H%></label></td>
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