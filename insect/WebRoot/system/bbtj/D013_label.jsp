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
	String DC = (String) request.getAttribute("DC");
	if(DC!=null&&DC.equals("1"))
	{
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("content-disposition","attachment;filename=\"D"+zbid+".xls\"");//����
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
				String sql = "select * from D013 where jfid=" + jfid;
				pstmtbody = ecbody.con.prepareStatement(sql);
				rsbody = pstmtbody.executeQuery();
				while (rsbody.next()) {
					JFID = rsbody.getString("JFID")==null?"":rsbody.getString("JFID");
					CXYM_ZZMJ = rsbody.getString("CXYM_ZZMJ")==null?"":rsbody.getString("CXYM_ZZMJ");
					MJHJ_BCNZJ = rsbody.getString("MJHJ_BCNZJ")==null?"":rsbody.getString("MJHJ_BCNZJ");
					YJYMBH_BCNZJ = rsbody.getString("YJYMBH_BCNZJ")==null?"":rsbody.getString("YJYMBH_BCNZJ");
					ZYZZQY = rsbody.getString("ZYZZQY")==null?"":rsbody.getString("ZYZZQY");
					DQZTZS = rsbody.getString("DQZTZS")==null?"":rsbody.getString("DQZTZS");
					BSN = rsbody.getString("BSN")==null?"":rsbody.getString("BSN");
					YDYMM_FSCD = rsbody.getString("YDYMM_FSCD")==null?"":rsbody.getString("YDYMM_FSCD");
					YDYMM_FSMJ = rsbody.getString("YDYMM_FSMJ")==null?"":rsbody.getString("YDYMM_FSMJ");
					YDYMM_ZDFSQY = rsbody.getString("YDYMM_ZDFSQY")==null?"":rsbody.getString("YDYMM_ZDFSQY");
					YDYMM_FSCD_H = rsbody.getString("YDYMM_FSCD_H")==null?"":rsbody.getString("YDYMM_FSCD_H");
					YDYMM_FSMJ_H = rsbody.getString("YDYMM_FSMJ_H")==null?"":rsbody.getString("YDYMM_FSMJ_H");
					YDYMM_ZDFSQY_H = rsbody.getString("YDYMM_ZDFSQY_H")==null?"":rsbody.getString("YDYMM_ZDFSQY_H");
					EDYMM_FSCD = rsbody.getString("EDYMM_FSCD")==null?"":rsbody.getString("EDYMM_FSCD");
					EDYMM_FSMJ = rsbody.getString("EDYMM_FSMJ")==null?"":rsbody.getString("EDYMM_FSMJ");
					EDYMM_ZDFSQY = rsbody.getString("EDYMM_ZDFSQY")==null?"":rsbody.getString("EDYMM_ZDFSQY");
					EDYMM_FSCD_H = rsbody.getString("EDYMM_FSCD_H")==null?"":rsbody.getString("EDYMM_FSCD_H");
					EDYMM_FSMJ_H = rsbody.getString("EDYMM_FSMJ_H")==null?"":rsbody.getString("EDYMM_FSMJ_H");
					EDYMM_ZDFSQY_H = rsbody.getString("EDYMM_ZDFSQY_H")==null?"":rsbody.getString("EDYMM_ZDFSQY_H");
					SDYMM_FSCD = rsbody.getString("SDYMM_FSCD")==null?"":rsbody.getString("SDYMM_FSCD");
					SDYMM_FSMJ = rsbody.getString("SDYMM_FSMJ")==null?"":rsbody.getString("SDYMM_FSMJ");
					SDYMM_ZDFSQY = rsbody.getString("SDYMM_ZDFSQY")==null?"":rsbody.getString("SDYMM_ZDFSQY");
					SDYMM_FSCD_H = rsbody.getString("SDYMM_FSCD_H")==null?"":rsbody.getString("SDYMM_FSCD_H");
					SDYMM_FSMJ_H = rsbody.getString("SDYMM_FSMJ_H")==null?"":rsbody.getString("SDYMM_FSMJ_H");
					SDYMM_ZDFSQY_H = rsbody.getString("SDYMM_ZDFSQY_H")==null?"":rsbody.getString("SDYMM_ZDFSQY_H");
					EDWYE_FSCD = rsbody.getString("EDWYE_FSCD")==null?"":rsbody.getString("EDWYE_FSCD");
					EDWYE_FSMJ = rsbody.getString("EDWYE_FSMJ")==null?"":rsbody.getString("EDWYE_FSMJ");
					EDWYE_ZDFSQY = rsbody.getString("EDWYE_ZDFSQY")==null?"":rsbody.getString("EDWYE_ZDFSQY");
					EDWYE_FSCD_H = rsbody.getString("EDWYE_FSCD_H")==null?"":rsbody.getString("EDWYE_FSCD_H");
					EDWYE_FSMJ_H = rsbody.getString("EDWYE_FSMJ_H")==null?"":rsbody.getString("EDWYE_FSMJ_H");
					EDWYE_ZDFSQY_H = rsbody.getString("EDWYE_ZDFSQY_H")==null?"":rsbody.getString("EDWYE_ZDFSQY_H");
					EDNC_FSCD = rsbody.getString("EDNC_FSCD")==null?"":rsbody.getString("EDNC_FSCD");
					EDNC_FSMJ = rsbody.getString("EDNC_FSMJ")==null?"":rsbody.getString("EDNC_FSMJ");
					EDNC_ZDFSQY = rsbody.getString("EDNC_ZDFSQY")==null?"":rsbody.getString("EDNC_ZDFSQY");
					EDNC_FSCD_H = rsbody.getString("EDNC_FSCD_H")==null?"":rsbody.getString("EDNC_FSCD_H");
					EDNC_FSMJ_H = rsbody.getString("EDNC_FSMJ_H")==null?"":rsbody.getString("EDNC_FSMJ_H");
					EDNC_ZDFSQY_H = rsbody.getString("EDNC_ZDFSQY_H")==null?"":rsbody.getString("EDNC_ZDFSQY_H");
					SDNC_FSCD = rsbody.getString("SDNC_FSCD")==null?"":rsbody.getString("SDNC_FSCD");
					SDNC_FSMJ = rsbody.getString("SDNC_FSMJ")==null?"":rsbody.getString("SDNC_FSMJ");
					SDNC_ZDFSQY = rsbody.getString("SDNC_ZDFSQY")==null?"":rsbody.getString("SDNC_ZDFSQY");
					SDNC_FSCD_H = rsbody.getString("SDNC_FSCD_H")==null?"":rsbody.getString("SDNC_FSCD_H");
					SDNC_FSMJ_H = rsbody.getString("SDNC_FSMJ_H")==null?"":rsbody.getString("SDNC_FSMJ_H");
					SDNC_ZDFSQY_H = rsbody.getString("SDNC_ZDFSQY_H")==null?"":rsbody.getString("SDNC_ZDFSQY_H");
					SDMLC_FSCD = rsbody.getString("SDMLC_FSCD")==null?"":rsbody.getString("SDMLC_FSCD");
					SDMLC_FSMJ = rsbody.getString("SDMLC_FSMJ")==null?"":rsbody.getString("SDMLC_FSMJ");
					SDMLC_ZDFSQY = rsbody.getString("SDMLC_ZDFSQY")==null?"":rsbody.getString("SDMLC_ZDFSQY");
					SDMLC_FSCD_H = rsbody.getString("SDMLC_FSCD_H")==null?"":rsbody.getString("SDMLC_FSCD_H");
					SDMLC_FSMJ_H = rsbody.getString("SDMLC_FSMJ_H")==null?"":rsbody.getString("SDMLC_FSMJ_H");
					SDMLC_ZDFSQY_H = rsbody.getString("SDMLC_ZDFSQY_H")==null?"":rsbody.getString("SDMLC_ZDFSQY_H");
					CDM_FSCD = rsbody.getString("CDM_FSCD")==null?"":rsbody.getString("CDM_FSCD");
					CDM_FSMJ = rsbody.getString("CDM_FSMJ")==null?"":rsbody.getString("CDM_FSMJ");
					CDM_ZDFSQY = rsbody.getString("CDM_ZDFSQY")==null?"":rsbody.getString("CDM_ZDFSQY");
					CDM_FSCD_H = rsbody.getString("CDM_FSCD_H")==null?"":rsbody.getString("CDM_FSCD_H");
					CDM_FSMJ_H = rsbody.getString("CDM_FSMJ_H")==null?"":rsbody.getString("CDM_FSMJ_H");
					CDM_ZDFSQY_H = rsbody.getString("CDM_ZDFSQY_H")==null?"":rsbody.getString("CDM_ZDFSQY_H");
					YC_FSCD = rsbody.getString("YC_FSCD")==null?"":rsbody.getString("YC_FSCD");
					YC_FSMJ = rsbody.getString("YC_FSMJ")==null?"":rsbody.getString("YC_FSMJ");
					YC_ZDFSQY = rsbody.getString("YC_ZDFSQY")==null?"":rsbody.getString("YC_ZDFSQY");
					YC_FSCD_H = rsbody.getString("YC_FSCD_H")==null?"":rsbody.getString("YC_FSCD_H");
					YC_FSMJ_H = rsbody.getString("YC_FSMJ_H")==null?"":rsbody.getString("YC_FSMJ_H");
					YC_ZDFSQY_H = rsbody.getString("YC_ZDFSQY_H")==null?"":rsbody.getString("YC_ZDFSQY_H");
					JM_FSCD = rsbody.getString("JM_FSCD")==null?"":rsbody.getString("JM_FSCD");
					JM_FSMJ = rsbody.getString("JM_FSMJ")==null?"":rsbody.getString("JM_FSMJ");
					JM_ZDFSQY = rsbody.getString("JM_ZDFSQY")==null?"":rsbody.getString("JM_ZDFSQY");
					JM_FSCD_H = rsbody.getString("JM_FSCD_H")==null?"":rsbody.getString("JM_FSCD_H");
					JM_FSMJ_H = rsbody.getString("JM_FSMJ_H")==null?"":rsbody.getString("JM_FSMJ_H");
					JM_ZDFSQY_H = rsbody.getString("JM_ZDFSQY_H")==null?"":rsbody.getString("JM_ZDFSQY_H");
					YM_FSCD = rsbody.getString("YM_FSCD")==null?"":rsbody.getString("YM_FSCD");
					YM_FSMJ = rsbody.getString("YM_FSMJ")==null?"":rsbody.getString("YM_FSMJ");
					YM_ZDFSQY = rsbody.getString("YM_ZDFSQY")==null?"":rsbody.getString("YM_ZDFSQY");
					YM_FSCD_H = rsbody.getString("YM_FSCD_H")==null?"":rsbody.getString("YM_FSCD_H");
					YM_FSMJ_H = rsbody.getString("YM_FSMJ_H")==null?"":rsbody.getString("YM_FSMJ_H");
					YM_ZDFSQY_H = rsbody.getString("YM_ZDFSQY_H")==null?"":rsbody.getString("YM_ZDFSQY_H");
					SBYYJ_FSCD = rsbody.getString("SBYYJ_FSCD")==null?"":rsbody.getString("SBYYJ_FSCD");
					SBYYJ_FSMJ = rsbody.getString("SBYYJ_FSMJ")==null?"":rsbody.getString("SBYYJ_FSMJ");
					SBYYJ_ZDFSQY = rsbody.getString("SBYYJ_ZDFSQY")==null?"":rsbody.getString("SBYYJ_ZDFSQY");
					SBYYJ_FSCD_H = rsbody.getString("SBYYJ_FSCD_H")==null?"":rsbody.getString("SBYYJ_FSCD_H");
					SBYYJ_FSMJ_H = rsbody.getString("SBYYJ_FSMJ_H")==null?"":rsbody.getString("SBYYJ_FSMJ_H");
					SBYYJ_ZDFSQY_H = rsbody.getString("SBYYJ_ZDFSQY_H")==null?"":rsbody.getString("SBYYJ_ZDFSQY_H");
					TH_FSCD = rsbody.getString("TH_FSCD")==null?"":rsbody.getString("TH_FSCD");
					TH_FSMJ = rsbody.getString("TH_FSMJ")==null?"":rsbody.getString("TH_FSMJ");
					TH_ZDFSQY = rsbody.getString("TH_ZDFSQY")==null?"":rsbody.getString("TH_ZDFSQY");
					TH_FSCD_H = rsbody.getString("TH_FSCD_H")==null?"":rsbody.getString("TH_FSCD_H");
					TH_FSMJ_H = rsbody.getString("TH_FSMJ_H")==null?"":rsbody.getString("TH_FSMJ_H");
					TH_ZDFSQY_H = rsbody.getString("TH_ZDFSQY_H")==null?"":rsbody.getString("TH_ZDFSQY_H");
					DXHC_FSCD = rsbody.getString("DXHC_FSCD")==null?"":rsbody.getString("DXHC_FSCD");
					DXHC_FSMJ = rsbody.getString("DXHC_FSMJ")==null?"":rsbody.getString("DXHC_FSMJ");
					DXHC_ZDFSQY = rsbody.getString("DXHC_ZDFSQY")==null?"":rsbody.getString("DXHC_ZDFSQY");
					DXHC_FSCD_H = rsbody.getString("DXHC_FSCD_H")==null?"":rsbody.getString("DXHC_FSCD_H");
					DXHC_FSMJ_H = rsbody.getString("DXHC_FSMJ_H")==null?"":rsbody.getString("DXHC_FSMJ_H");
					DXHC_ZDFSQY_H = rsbody.getString("DXHC_ZDFSQY_H")==null?"":rsbody.getString("DXHC_ZDFSQY_H");
					QTHC_FSCD = rsbody.getString("QTHC_FSCD")==null?"":rsbody.getString("QTHC_FSCD");
					QTHC_FSMJ = rsbody.getString("QTHC_FSMJ")==null?"":rsbody.getString("QTHC_FSMJ");
					QTHC_ZDFSQY = rsbody.getString("QTHC_ZDFSQY")==null?"":rsbody.getString("QTHC_ZDFSQY");
					QTHC_FSCD_H = rsbody.getString("QTHC_FSCD_H")==null?"":rsbody.getString("QTHC_FSCD_H");
					QTHC_FSMJ_H = rsbody.getString("QTHC_FSMJ_H")==null?"":rsbody.getString("QTHC_FSMJ_H");
					QTHC_ZDFSQY_H = rsbody.getString("QTHC_ZDFSQY_H")==null?"":rsbody.getString("QTHC_ZDFSQY_H");
					CHHJ_FSCD = rsbody.getString("CHHJ_FSCD")==null?"":rsbody.getString("CHHJ_FSCD");
					CHHJ_FSMJ = rsbody.getString("CHHJ_FSMJ")==null?"":rsbody.getString("CHHJ_FSMJ");
					CHHJ_ZDFSQY = rsbody.getString("CHHJ_ZDFSQY")==null?"":rsbody.getString("CHHJ_ZDFSQY");
					CHHJ_FSCD_H = rsbody.getString("CHHJ_FSCD_H")==null?"":rsbody.getString("CHHJ_FSCD_H");
					CHHJ_FSMJ_H = rsbody.getString("CHHJ_FSMJ_H")==null?"":rsbody.getString("CHHJ_FSMJ_H");
					CHHJ_ZDFSQY_H = rsbody.getString("CHHJ_ZDFSQY_H")==null?"":rsbody.getString("CHHJ_ZDFSQY_H");
					DBB_FSCD = rsbody.getString("DBB_FSCD")==null?"":rsbody.getString("DBB_FSCD");
					DBB_FSMJ = rsbody.getString("DBB_FSMJ")==null?"":rsbody.getString("DBB_FSMJ");
					DBB_ZDFSQY = rsbody.getString("DBB_ZDFSQY")==null?"":rsbody.getString("DBB_ZDFSQY");
					DBB_FSCD_H = rsbody.getString("DBB_FSCD_H")==null?"":rsbody.getString("DBB_FSCD_H");
					DBB_FSMJ_H = rsbody.getString("DBB_FSMJ_H")==null?"":rsbody.getString("DBB_FSMJ_H");
					DBB_ZDFSQY_H = rsbody.getString("DBB_ZDFSQY_H")==null?"":rsbody.getString("DBB_ZDFSQY_H");
					XBB_FSCD = rsbody.getString("XBB_FSCD")==null?"":rsbody.getString("XBB_FSCD");
					XBB_FSMJ = rsbody.getString("XBB_FSMJ")==null?"":rsbody.getString("XBB_FSMJ");
					XBB_ZDFSQY = rsbody.getString("XBB_ZDFSQY")==null?"":rsbody.getString("XBB_ZDFSQY");
					XBB_FSCD_H = rsbody.getString("XBB_FSCD_H")==null?"":rsbody.getString("XBB_FSCD_H");
					XBB_FSMJ_H = rsbody.getString("XBB_FSMJ_H")==null?"":rsbody.getString("XBB_FSMJ_H");
					XBB_ZDFSQY_H = rsbody.getString("XBB_ZDFSQY_H")==null?"":rsbody.getString("XBB_ZDFSQY_H");
					HBB_FSCD = rsbody.getString("HBB_FSCD")==null?"":rsbody.getString("HBB_FSCD");
					HBB_FSMJ = rsbody.getString("HBB_FSMJ")==null?"":rsbody.getString("HBB_FSMJ");
					HBB_ZDFSQY = rsbody.getString("HBB_ZDFSQY")==null?"":rsbody.getString("HBB_ZDFSQY");
					HBB_FSCD_H = rsbody.getString("HBB_FSCD_H")==null?"":rsbody.getString("HBB_FSCD_H");
					HBB_FSMJ_H = rsbody.getString("HBB_FSMJ_H")==null?"":rsbody.getString("HBB_FSMJ_H");
					HBB_ZDFSQY_H = rsbody.getString("HBB_ZDFSQY_H")==null?"":rsbody.getString("HBB_ZDFSQY_H");
					YMWBMYBB_FSCD = rsbody.getString("YMWBMYBB_FSCD")==null?"":rsbody.getString("YMWBMYBB_FSCD");
					YMWBMYBB_FSMJ = rsbody.getString("YMWBMYBB_FSMJ")==null?"":rsbody.getString("YMWBMYBB_FSMJ");
					YMWBMYBB_ZDFSQY = rsbody.getString("YMWBMYBB_ZDFSQY")==null?"":rsbody.getString("YMWBMYBB_ZDFSQY");
					YMWBMYBB_FSCD_H = rsbody.getString("YMWBMYBB_FSCD_H")==null?"":rsbody.getString("YMWBMYBB_FSCD_H");
					YMWBMYBB_FSMJ_H = rsbody.getString("YMWBMYBB_FSMJ_H")==null?"":rsbody.getString("YMWBMYBB_FSMJ_H");
					YMWBMYBB_ZDFSQY_H = rsbody
							.getString("YMWBMYBB_ZDFSQY_H")==null?"":rsbody.getString("YMWBMYBB_ZDFSQY_H");
					WKB_FSCD = rsbody.getString("WKB_FSCD")==null?"":rsbody.getString("WKB_FSCD");
					WKB_FSMJ = rsbody.getString("WKB_FSMJ")==null?"":rsbody.getString("WKB_FSMJ");
					WKB_ZDFSQY = rsbody.getString("WKB_ZDFSQY")==null?"":rsbody.getString("WKB_ZDFSQY");
					WKB_FSCD_H = rsbody.getString("WKB_FSCD_H")==null?"":rsbody.getString("WKB_FSCD_H");
					WKB_FSMJ_H = rsbody.getString("WKB_FSMJ_H")==null?"":rsbody.getString("WKB_FSMJ_H");
					WKB_ZDFSQY_H = rsbody.getString("WKB_ZDFSQY_H")==null?"":rsbody.getString("WKB_ZDFSQY_H");
					SHSB_FSCD = rsbody.getString("SHSB_FSCD")==null?"":rsbody.getString("SHSB_FSCD");
					SHSB_FSMJ = rsbody.getString("SHSB_FSMJ")==null?"":rsbody.getString("SHSB_FSMJ");
					SHSB_ZDFSQY = rsbody.getString("SHSB_ZDFSQY")==null?"":rsbody.getString("SHSB_ZDFSQY");
					SHSB_FSCD_H = rsbody.getString("SHSB_FSCD_H")==null?"":rsbody.getString("SHSB_FSCD_H");
					SHSB_FSMJ_H = rsbody.getString("SHSB_FSMJ_H")==null?"":rsbody.getString("SHSB_FSMJ_H");
					SHSB_ZDFSQY_H = rsbody.getString("SHSB_ZDFSQY_H")==null?"":rsbody.getString("SHSB_ZDFSQY_H");
					XB_FSCD = rsbody.getString("XB_FSCD")==null?"":rsbody.getString("XB_FSCD");
					XB_FSMJ = rsbody.getString("XB_FSMJ")==null?"":rsbody.getString("XB_FSMJ");
					XB_ZDFSQY = rsbody.getString("XB_ZDFSQY")==null?"":rsbody.getString("XB_ZDFSQY");
					XB_FSCD_H = rsbody.getString("XB_FSCD_H")==null?"":rsbody.getString("XB_FSCD_H");
					XB_FSMJ_H = rsbody.getString("XB_FSMJ_H")==null?"":rsbody.getString("XB_FSMJ_H");
					XB_ZDFSQY_H = rsbody.getString("XB_ZDFSQY_H")==null?"":rsbody.getString("XB_ZDFSQY_H");
					LHFB_FSCD = rsbody.getString("LHFB_FSCD")==null?"":rsbody.getString("LHFB_FSCD");
					LHFB_FSMJ = rsbody.getString("LHFB_FSMJ")==null?"":rsbody.getString("LHFB_FSMJ");
					LHFB_ZDFSQY = rsbody.getString("LHFB_ZDFSQY")==null?"":rsbody.getString("LHFB_ZDFSQY");
					LHFB_FSCD_H = rsbody.getString("LHFB_FSCD_H")==null?"":rsbody.getString("LHFB_FSCD_H");
					LHFB_FSMJ_H = rsbody.getString("LHFB_FSMJ_H")==null?"":rsbody.getString("LHFB_FSMJ_H");
					LHFB_ZDFSQY_H = rsbody.getString("LHFB_ZDFSQY_H")==null?"":rsbody.getString("LHFB_ZDFSQY_H");
					CSB_FSCD = rsbody.getString("CSB_FSCD")==null?"":rsbody.getString("CSB_FSCD");
					CSB_FSMJ = rsbody.getString("CSB_FSMJ")==null?"":rsbody.getString("CSB_FSMJ");
					CSB_ZDFSQY = rsbody.getString("CSB_ZDFSQY")==null?"":rsbody.getString("CSB_ZDFSQY");
					CSB_FSCD_H = rsbody.getString("CSB_FSCD_H")==null?"":rsbody.getString("CSB_FSCD_H");
					CSB_FSMJ_H = rsbody.getString("CSB_FSMJ_H")==null?"":rsbody.getString("CSB_FSMJ_H");
					CSB_ZDFSQY_H = rsbody.getString("CSB_ZDFSQY_H")==null?"":rsbody.getString("CSB_ZDFSQY_H");
					DFB_FSCD = rsbody.getString("DFB_FSCD")==null?"":rsbody.getString("DFB_FSCD");
					DFB_FSMJ = rsbody.getString("DFB_FSMJ")==null?"":rsbody.getString("DFB_FSMJ");
					DFB_ZDFSQY = rsbody.getString("DFB_ZDFSQY")==null?"":rsbody.getString("DFB_ZDFSQY");
					DFB_FSCD_H = rsbody.getString("DFB_FSCD_H")==null?"":rsbody.getString("DFB_FSCD_H");
					DFB_FSMJ_H = rsbody.getString("DFB_FSMJ_H")==null?"":rsbody.getString("DFB_FSMJ_H");
					DFB_ZDFSQY_H = rsbody.getString("DFB_ZDFSQY_H")==null?"":rsbody.getString("DFB_ZDFSQY_H");
					QTB_FSCD = rsbody.getString("QTB_FSCD")==null?"":rsbody.getString("QTB_FSCD");
					QTB_FSMJ = rsbody.getString("QTB_FSMJ")==null?"":rsbody.getString("QTB_FSMJ");
					QTB_ZDFSQY = rsbody.getString("QTB_ZDFSQY")==null?"":rsbody.getString("QTB_ZDFSQY");
					QTB_FSCD_H = rsbody.getString("QTB_FSCD_H")==null?"":rsbody.getString("QTB_FSCD_H");
					QTB_FSMJ_H = rsbody.getString("QTB_FSMJ_H")==null?"":rsbody.getString("QTB_FSMJ_H");
					QTB_ZDFSQY_H = rsbody.getString("QTB_ZDFSQY_H")==null?"":rsbody.getString("QTB_ZDFSQY_H");
					BHHJ_FSCD = rsbody.getString("BHHJ_FSCD")==null?"":rsbody.getString("BHHJ_FSCD");
					BHHJ_FSMJ = rsbody.getString("BHHJ_FSMJ")==null?"":rsbody.getString("BHHJ_FSMJ");
					BHHJ_ZDFSQY = rsbody.getString("BHHJ_ZDFSQY")==null?"":rsbody.getString("BHHJ_ZDFSQY");
					BHHJ_FSCD_H = rsbody.getString("BHHJ_FSCD_H")==null?"":rsbody.getString("BHHJ_FSCD_H");
					BHHJ_FSMJ_H = rsbody.getString("BHHJ_FSMJ_H")==null?"":rsbody.getString("BHHJ_FSMJ_H");
					BHHJ_ZDFSQY_H = rsbody.getString("BHHJ_ZDFSQY_H")==null?"":rsbody.getString("BHHJ_ZDFSQY_H");
					BCHJ_FSCD = rsbody.getString("BCHJ_FSCD")==null?"":rsbody.getString("BCHJ_FSCD");
					BCHJ_FSMJ = rsbody.getString("BCHJ_FSMJ")==null?"":rsbody.getString("BCHJ_FSMJ");
					BCHJ_ZDFSQY = rsbody.getString("BCHJ_ZDFSQY")==null?"":rsbody.getString("BCHJ_ZDFSQY");
					BCHJ_FSCD_H = rsbody.getString("BCHJ_FSCD_H")==null?"":rsbody.getString("BCHJ_FSCD_H");
					BCHJ_FSMJ_H = rsbody.getString("BCHJ_FSMJ_H")==null?"":rsbody.getString("BCHJ_FSMJ_H");
					BCHJ_ZDFSQY_H = rsbody.getString("BCHJ_ZDFSQY_H")==null?"":rsbody.getString("BCHJ_ZDFSQY_H");
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
	<form id="f1" name="f1" action="/insect/tjbcsj_t.do?ACT_TYPE=Q<%=zbid%>"
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
					style="text-align:center;font-size=30;width: ;height: "><b>���ײ����к��ڷ�������Ԥ���(<%=rwsj%>)
				</b><br> <br></td>
			</tr>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">�ⱨվ�㣺<%=usebmmc%><input
					name="BMBM" type="hidden" value="<%=usebm%>" /></td>
				<td style="padding-left: 100px;padding-right: 100px;">�ϱ����ڣ�<label><%=DCRQ%></label></td>
			</tr>
		</table>
		<table border=1 borderColorDark=black borderColorLight=white
			cellpadding=1 cellspacing=1 align=center id=zg name=zg>
			<tbody id="zg_head">
				<tr>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>������������ֲ����ϼƣ���Ķ��</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>����ϼƱȳ����������ʣ�+ -����%��</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>Ԥ�����ײ��溦�°������巢���̶ȣ�����</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��Ҫ��ֲ����</b></td>
					<td colspan=2 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��ǰ���峤�ƣ��� �� �</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����꣨�� �أ�</b></td>
				</tr>
				<tr>
				<td colspan=1 rowspan=1><label><%=CXYM_ZZMJ%></label></td>
				<td><label><%=MJHJ_BCNZJ%></label></td>
				<td><label><%=YJYMBH_BCNZJ%>��</label></td>
				<td><label><%=ZYZZQY%></label></td>
				<td colspan=2 rowspan=1><label><%=DQZTZS%></label></td>
				<td><label><%=BSN%></label></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��������</b></td>
					<td colspan=3 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>ǰ�ڷ������ͳ��</b></td>
					<td colspan=3 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�к��ڷ�������Ԥ��</b></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����̶ȣ���)</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����������Ķ��</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�ص㷢������</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����̶ȣ���)</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����������Ķ��</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�ص㷢������</b></td>
				</tr>
			</tbody>
			<tbody id="zg_body">
				<tr>
					<td style="text-align: center;">һ��������</td>
					<td><label><%=YDYMM_FSCD%>��</label></td>
					<td><label><%=YDYMM_FSMJ%></label></td>
					<td><label><%=YDYMM_ZDFSQY%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=YDYMM_FSMJ_H%></label></td>
					<td><label><%=YDYMM_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">����������</td>
					<td style="text-align: center;">\</td>
					<td><label><%=EDYMM_FSMJ%></label></td>
					<td><label><%=EDYMM_ZDFSQY%></label></td>
					<td><label><%=EDYMM_FSCD_H%>��</label></td>
					<td><label><%=EDYMM_FSMJ_H%></label></td>
					<td><label><%=EDYMM_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">����������</td>
					<td style="text-align: center;">\</td>
					<td><label><%=SDYMM_FSMJ%></label></td>
					<td><label><%=SDYMM_ZDFSQY%></label></td>
					<td><label><%=SDYMM_FSCD_H%>��</label></td>
					<td><label><%=SDYMM_FSMJ_H%></label></td>
					<td><label><%=SDYMM_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">����ίҹ��</td>
					<td><label><%=EDWYE_FSCD%>��</label></td>
					<td><label><%=EDWYE_FSMJ%></label></td>
					<td><label><%=EDWYE_ZDFSQY%></label></td>
					<td><label><%=EDWYE_FSCD_H%>��</label></td>
					<td><label><%=EDWYE_FSMJ_H%></label></td>
					<td><label><%=EDWYE_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">����ճ��</td>
					<td><label><%=EDNC_FSCD%>��</label></td>
					<td><label><%=EDNC_FSMJ%></label></td>
					<td><label><%=EDNC_ZDFSQY%></label></td>
				    <td style="text-align: center;">\</td>
					<td><label><%=EDNC_FSMJ_H%></label></td>
					<td><label><%=EDNC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">����ճ��</td>
				    <td style="text-align: center;">\</td>
					<td><label><%=SDNC_FSMJ%></label></td>
					<td><label><%=SDNC_ZDFSQY%></label></td>
					<td><label><%=SDNC_FSCD_H%>��</label></td>
					<td><label><%=SDNC_FSMJ_H%></label></td>
					<td><label><%=SDNC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">���������</td>
					<td style="text-align: center;">\</td>
					<td><label><%=SDMLC_FSMJ%></label></td>
					<td><label><%=SDMLC_ZDFSQY%></label></td>
					<td><label><%=SDMLC_FSCD_H%>��</label></td>
					<td><label><%=SDMLC_FSMJ_H%></label></td>
					<td><label><%=SDMLC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">�ݵ���</td>
					<td><label><%=CDM_FSCD%>��</label></td>
					<td><label><%=CDM_FSMJ%></label></td>
					<td><label><%=CDM_ZDFSQY%></label></td>
					<td><label><%=CDM_FSCD_H%>��</label></td>
					<td><label><%=CDM_FSMJ_H%></label></td>
					<td><label><%=CDM_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">����</td>
					<td><label><%=YC_FSCD%>��</label></td>
					<td><label><%=YC_FSMJ%></label></td>
					<td><label><%=YC_ZDFSQY%></label></td>
					<td><label><%=YC_FSCD_H%>��</label></td>
					<td><label><%=YC_FSMJ_H%></label></td>
					<td><label><%=YC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">����</td>
					<td><label><%=JM_FSCD%>��</label></td>
					<td><label><%=JM_FSMJ%></label></td>
					<td><label><%=JM_ZDFSQY%></label></td>
					<td><label><%=JM_FSCD_H%>��</label></td>
					<td><label><%=JM_FSMJ_H%></label></td>
					<td><label><%=JM_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">Ҷ��</td>
					<td><label><%=YM_FSCD%>��</label></td>
					<td><label><%=YM_FSMJ%></label></td>
					<td><label><%=YM_ZDFSQY%></label></td>
					<td><label><%=YM_FSCD_H%>��</label></td>
					<td><label><%=YM_FSMJ_H%></label></td>
					<td><label><%=YM_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">˫��өҶ��</td>
					<td><label><%=SBYYJ_FSCD%>��</label></td>
					<td><label><%=SBYYJ_FSMJ%></label></td>
					<td><label><%=SBYYJ_ZDFSQY%></label></td>
					<td><label><%=SBYYJ_FSCD_H%>��</label></td>
					<td><label><%=SBYYJ_FSMJ_H%></label></td>
					<td><label><%=SBYYJ_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">���ȣ������</td>
					<td><label><%=TH_FSCD%>��</label></td>
					<td><label><%=TH_FSMJ%></label></td>
					<td><label><%=TH_ZDFSQY%></label></td>
					<td><label><%=TH_FSCD_H%>��</label></td>
					<td><label><%=TH_FSMJ_H%></label></td>
					<td><label><%=TH_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">���º���</td>
					<td><label><%=DXHC_FSCD%>��</label></td>
					<td><label><%=DXHC_FSMJ%></label></td>
					<td><label><%=DXHC_ZDFSQY%></label></td>
					<td><label><%=DXHC_FSCD_H%>��</label></td>
					<td><label><%=DXHC_FSMJ_H%></label></td>
					<td><label><%=DXHC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">��������</td>
					<td><label><%=QTHC_FSCD%>��</label></td>
					<td><label><%=QTHC_FSMJ%></label></td>
					<td><label><%=QTHC_ZDFSQY%></label></td>
					<td><label><%=QTHC_FSCD_H%>��</label></td>
					<td><label><%=QTHC_FSMJ_H%></label></td>
					<td><label><%=QTHC_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">�溦�ϼ�</td>
					<td style="text-align: center;">\</td>
					<td><label><%=CHHJ_FSMJ%></label></td>
					<td><label><%=CHHJ_ZDFSQY%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=CHHJ_FSMJ_H%></label></td>
					<td><label><%=CHHJ_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">��߲�</td>
					<td style="text-align: center;">\</td>
					<td><label><%=DBB_FSMJ%></label></td>
					<td><label><%=DBB_ZDFSQY%></label></td>
					<td><label><%=DBB_FSCD_H%>��</label></td>
					<td><label><%=DBB_FSMJ_H%></label></td>
					<td><label><%=DBB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">С�߲�</td>
					<td style="text-align: center;">\</td>
					<td><label><%=XBB_FSMJ%></label></td>
					<td><label><%=XBB_ZDFSQY%></label></td>
					<td><label><%=XBB_FSCD_H%>��</label></td>
					<td><label><%=XBB_FSMJ_H%></label></td>
					<td><label><%=XBB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">�ְ߲�</td>
					<td style="text-align: center;">\</td>
					<td><label><%=HBB_FSMJ%></label></td>
					<td><label><%=HBB_ZDFSQY%></label></td>
					<td><label><%=HBB_FSCD_H%>��</label></td>
					<td><label><%=HBB_FSMJ_H%></label></td>
					<td><label><%=HBB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">��������ùҶ�߲�</td>
					<td style="text-align: center;">\</td>
					<td><label><%=YMWBMYBB_FSMJ%></label></td>
					<td><label><%=YMWBMYBB_ZDFSQY%></label></td>
					<td><label><%=YMWBMYBB_FSCD_H%>��</label></td>
					<td><label><%=YMWBMYBB_FSMJ_H%></label></td>
					<td><label><%=YMWBMYBB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">�ƿݲ�</td>
					<td style="text-align: center;">\</td>
					<td><label><%=WKB_FSMJ%></label></td>
					<td><label><%=WKB_ZDFSQY%></label></td>
					<td><label><%=WKB_FSCD_H%>��</label></td>
					<td><label><%=WKB_FSMJ_H%></label></td>
					<td><label><%=WKB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">˿���벡</td>
					<td style="text-align: center;">\</td>
					<td><label><%=SHSB_FSMJ%></label></td>
					<td><label><%=SHSB_ZDFSQY%></label></td>
					<td><label><%=SHSB_FSCD_H%>��</label></td>
					<td><label><%=SHSB_FSMJ_H%></label></td>
					<td><label><%=SHSB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">�ⲡ</td>
					<td style="text-align: center;">\</td>
					<td><label><%=XB_FSMJ%></label></td>
					<td><label><%=XB_ZDFSQY%></label></td>
					<td><label><%=XB_FSCD_H%>��</label></td>
					<td><label><%=XB_FSMJ_H%></label></td>
					<td><label><%=XB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">���ڷ۲�</td>
					<td style="text-align: center;">\</td>
					<td><label><%=LHFB_FSMJ%></label></td>
					<td><label><%=LHFB_ZDFSQY%></label></td>
					<td><label><%=LHFB_FSCD_H%>��</label></td>
					<td><label><%=LHFB_FSMJ_H%></label></td>
					<td><label><%=LHFB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">������</td>
					<td style="text-align: center;">\</td>
					<td><label><%=CSB_FSMJ%></label></td>
					<td><label><%=CSB_ZDFSQY%></label></td>
					<td><label><%=CSB_FSCD_H%>��</label></td>
					<td><label><%=CSB_FSMJ_H%></label></td>
					<td><label><%=CSB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">������</td>
					<td style="text-align: center;">\</td>
					<td><label><%=DFB_FSMJ%></label></td>
					<td><label><%=DFB_ZDFSQY%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=DFB_FSMJ_H%></label></td>
					<td><label><%=DFB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">��������</td>
					<td style="text-align: center;">\</td>
					<td><label><%=QTB_FSMJ%></label></td>
					<td><label><%=QTB_ZDFSQY%></label></td>
					<td><label><%=QTB_FSCD_H%>��</label></td>
					<td><label><%=QTB_FSMJ_H%></label></td>
					<td><label><%=QTB_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">�����ϼ�</td>
					<td style="text-align: center;">\</td>
					<td><label><%=BHHJ_FSMJ%></label></td>
					<td><label><%=BHHJ_ZDFSQY%></label></td>
					<td style="text-align: center;">\</td>
					<td><label><%=BHHJ_FSMJ_H%></label></td>
					<td><label><%=BHHJ_ZDFSQY_H%></label></td>
				</tr>
				<tr>
					<td style="text-align: center;">����ϼ�</td>
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
				<td style="padding-left: 100px;padding-right: 100px;">¼����Ա��<%=LRRY%></td>
				<td style="padding-left: 100px;padding-right: 100px;">¼�����ڣ�<%=LRRQ%></td>
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
    function xzsel(name,val)
    {
    	if(val!="")
    	{
    	$("select[name='"+name+"']") .val(val);
    	}
    }
	$(function() {
		xzsel('YJYMBH_BCNZJ','<%=YJYMBH_BCNZJ%>');
		xzsel('YDYMM_FSCD','<%=YDYMM_FSCD%>');
		xzsel('EDYMM_FSCD_H','<%=EDYMM_FSCD_H%>');
		xzsel('SDYMM_FSCD_H','<%=SDYMM_FSCD_H%>');
		xzsel('EDWYE_FSCD','<%=EDWYE_FSCD%>');
		xzsel('EDWYE_FSCD_H','<%=EDWYE_FSCD_H%>');
		xzsel('EDNC_FSCD','<%=EDNC_FSCD%>');
		xzsel('SDNC_FSCD_H','<%=SDNC_FSCD_H%>');
		xzsel('SDMLC_FSCD_H','<%=SDMLC_FSCD_H%>');
		xzsel('CDM_FSCD','<%=CDM_FSCD%>');
		xzsel('CDM_FSCD_H','<%=CDM_FSCD_H%>');
		xzsel('YC_FSCD','<%=YC_FSCD%>');
		xzsel('YC_FSCD_H','<%=YC_FSCD_H%>');
		xzsel('JM_FSCD','<%=JM_FSCD%>');
		xzsel('JM_FSCD_H','<%=JM_FSCD_H%>');
		xzsel('YM_FSCD','<%=YM_FSCD%>');
		xzsel('YM_FSCD_H','<%=YM_FSCD_H%>');
		xzsel('SBYYJ_FSCD','<%=SBYYJ_FSCD%>');
		xzsel('SBYYJ_FSCD_H','<%=SBYYJ_FSCD_H%>');
		xzsel('TH_FSCD','<%=TH_FSCD%>');
		xzsel('TH_FSCD_H','<%=TH_FSCD_H%>');
		xzsel('DXHC_FSCD','<%=DXHC_FSCD%>');
		xzsel('DXHC_FSCD_H','<%=DXHC_FSCD_H%>');
		xzsel('QTHC_FSCD','<%=QTHC_FSCD%>');
		xzsel('QTHC_FSCD_H','<%=QTHC_FSCD_H%>');
		xzsel('DBB_FSCD_H','<%=DBB_FSCD_H%>');
		xzsel('XBB_FSCD_H','<%=XBB_FSCD_H%>');
		xzsel('HBB_FSCD_H','<%=HBB_FSCD_H%>');
		xzsel('YMWBMYBB_FSCD_H','<%=YMWBMYBB_FSCD_H%>');
		xzsel('WKB_FSCD_H','<%=WKB_FSCD_H%>');
		xzsel('SHSB_FSCD_H','<%=SHSB_FSCD_H%>');
		xzsel('XB_FSCD_H','<%=XB_FSCD_H%>');
		xzsel('LHFB_FSCD_H','<%=LHFB_FSCD_H%>');
		xzsel('CSB_FSCD_H','<%=CSB_FSCD_H%>');
		xzsel('QTB_FSCD_H','<%=QTB_FSCD_H%>');
    });
	function fsmj(obj) {
		var zh = 0.0;
		var zh_h = 0.0;
		var ch = 0.0;
		var ch_h = 0.0;
		var bh = 0.0;
		var bh_h = 0.0;
		var hz = obj.name.split("_")[0]
				.substr(obj.name.split("_")[0].length - 1);
		if (!isNaN(obj.value)) {
			if ($("input[name='YDYMM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_FSMJ']").val());
			}
			if ($("input[name='YDYMM_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='YDYMM_FSMJ_H']").val());
			}
			if ($("input[name='EDYMM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_FSMJ']").val());
			}
			if ($("input[name='EDYMM_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='EDYMM_FSMJ_H']").val());
			}
			if ($("input[name='SDYMM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_FSMJ']").val());
			}
			if ($("input[name='SDYMM_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='SDYMM_FSMJ_H']").val());
			}
			if ($("input[name='EDWYE_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDWYE_FSMJ']").val());
			}
			if ($("input[name='EDWYE_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='EDWYE_FSMJ_H']").val());
			}
			if ($("input[name='EDNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_FSMJ']").val());
			}
			if ($("input[name='EDNC_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='EDNC_FSMJ_H']").val());
			}
			if ($("input[name='SDNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_FSMJ']").val());
			}
			if ($("input[name='SDNC_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='SDNC_FSMJ_H']").val());
			}
			if ($("input[name='SDMLC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDMLC_FSMJ']").val());
			}
			if ($("input[name='SDMLC_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='SDMLC_FSMJ_H']").val());
			}
			if ($("input[name='CDM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='CDM_FSMJ']").val());
			}
			if ($("input[name='CDM_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='CDM_FSMJ_H']").val());
			}
			if ($("input[name='YC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_FSMJ']").val());
			}
			if ($("input[name='YC_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='YC_FSMJ_H']").val());
			}
			if ($("input[name='JM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='JM_FSMJ']").val());
			}
			if ($("input[name='JM_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='JM_FSMJ_H']").val());
			}
			if ($("input[name='YM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YM_FSMJ']").val());
			}
			if ($("input[name='YM_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='YM_FSMJ_H']").val());
			}
			if ($("input[name='SBYYJ_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SBYYJ_FSMJ']").val());
			}
			if ($("input[name='SBYYJ_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='SBYYJ_FSMJ_H']").val());
			}
			if ($("input[name='TH_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='TH_FSMJ']").val());
			}
			if ($("input[name='TH_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='TH_FSMJ_H']").val());
			}
			if ($("input[name='DXHC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DXHC_FSMJ']").val());
			}
			if ($("input[name='DXHC_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='DXHC_FSMJ_H']").val());
			}
			if ($("input[name='QTHC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTHC_FSMJ']").val());
			}
			if ($("input[name='QTHC_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='QTHC_FSMJ_H']").val());
			}
			if ($("input[name='DBB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DBB_FSMJ']").val());
			}
			if ($("input[name='DBB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='DBB_FSMJ_H']").val());
			}
			if ($("input[name='XBB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XBB_FSMJ']").val());
			}
			if ($("input[name='XBB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='XBB_FSMJ_H']").val());
			}
			if ($("input[name='HBB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='HBB_FSMJ']").val());
			}
			if ($("input[name='HBB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='HBB_FSMJ_H']").val());
			}
			if ($("input[name='YMWBMYBB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YMWBMYBB_FSMJ']").val());
			}
			if ($("input[name='YMWBMYBB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='YMWBMYBB_FSMJ_H']").val());
			}
			if ($("input[name='WKB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_FSMJ']").val());
			}
			if ($("input[name='WKB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='WKB_FSMJ_H']").val());
			}
			if ($("input[name='SHSB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SHSB_FSMJ']").val());
			}
			if ($("input[name='SHSB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='SHSB_FSMJ_H']").val());
			}
			if ($("input[name='XB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XB_FSMJ']").val());
			}
			if ($("input[name='XB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='XB_FSMJ_H']").val());
			}
			if ($("input[name='LHFB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='LHFB_FSMJ']").val());
			}
			if ($("input[name='LHFB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='LHFB_FSMJ_H']").val());
			}
			if ($("input[name='CSB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='CSB_FSMJ']").val());
			}
			if ($("input[name='CSB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='CSB_FSMJ_H']").val());
			}
			if ($("input[name='DFB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DFB_FSMJ']").val());
			}
			if ($("input[name='DFB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='DFB_FSMJ_H']").val());
			}
			if ($("input[name='QTB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTB_FSMJ']").val());
			}
			if ($("input[name='QTB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='QTB_FSMJ_H']").val());
			}
			
			if (hz == "B") {
				if ($("input[name='DBB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='DBB_FSMJ']").val());
				}
				if ($("input[name='DBB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='DBB_FSMJ_H']").val());
				}
				if ($("input[name='XBB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='XBB_FSMJ']").val());
				}
				if ($("input[name='XBB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='XBB_FSMJ_H']").val());
				}
				if ($("input[name='HBB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='HBB_FSMJ']").val());
				}
				if ($("input[name='HBB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='HBB_FSMJ_H']").val());
				}
				if ($("input[name='YMWBMYBB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='YMWBMYBB_FSMJ']").val());
				}
				if ($("input[name='YMWBMYBB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='YMWBMYBB_FSMJ_H']").val());
				}
				if ($("input[name='WKB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='WKB_FSMJ']").val());
				}
				if ($("input[name='WKB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='WKB_FSMJ_H']").val());
				}
				if ($("input[name='SHSB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='SHSB_FSMJ']").val());
				}
				if ($("input[name='SHSB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='SHSB_FSMJ_H']").val());
				}
				if ($("input[name='XB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='XB_FSMJ']").val());
				}
				if ($("input[name='XB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='XB_FSMJ_H']").val());
				}
				if ($("input[name='LHFB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='LHFB_FSMJ']").val());
				}
				if ($("input[name='LHFB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='LHFB_FSMJ_H']").val());
				}
				if ($("input[name='CSB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='CSB_FSMJ']").val());
				}
				if ($("input[name='CSB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='CSB_FSMJ_H']").val());
				}
				if ($("input[name='DFB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='DFB_FSMJ']").val());
				}
				if ($("input[name='DFB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='DFB_FSMJ_H']").val());
				}
				if ($("input[name='QTB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='QTB_FSMJ']").val());
				}
				if ($("input[name='QTB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='QTB_FSMJ_H']").val());
				}
				
				$("input[name='BHHJ_FSMJ']").val(bh);
				$("input[name='BHHJ_FSMJ_H']").val(bh_h);
			} else {
				if ($("input[name='YDYMM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YDYMM_FSMJ']").val());
				}
				if ($("input[name='YDYMM_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='YDYMM_FSMJ_H']").val());
				}
				if ($("input[name='EDYMM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDYMM_FSMJ']").val());
				}
				if ($("input[name='EDYMM_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='EDYMM_FSMJ_H']").val());
				}
				if ($("input[name='SDYMM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SDYMM_FSMJ']").val());
				}
				if ($("input[name='SDYMM_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='SDYMM_FSMJ_H']").val());
				}
				if ($("input[name='EDWYE_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDWYE_FSMJ']").val());
				}
				if ($("input[name='EDWYE_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='EDWYE_FSMJ_H']").val());
				}
				if ($("input[name='EDNC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDNC_FSMJ']").val());
				}
				if ($("input[name='EDNC_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='EDNC_FSMJ_H']").val());
				}
				if ($("input[name='SDNC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SDNC_FSMJ']").val());
				}
				if ($("input[name='SDNC_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='SDNC_FSMJ_H']").val());
				}
				if ($("input[name='SDMLC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SDMLC_FSMJ']").val());
				}
				if ($("input[name='SDMLC_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='SDMLC_FSMJ_H']").val());
				}
				if ($("input[name='CDM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='CDM_FSMJ']").val());
				}
				if ($("input[name='CDM_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='CDM_FSMJ_H']").val());
				}
				if ($("input[name='YC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YC_FSMJ']").val());
				}
				if ($("input[name='YC_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='YC_FSMJ_H']").val());
				}
				if ($("input[name='JM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='JM_FSMJ']").val());
				}
				if ($("input[name='JM_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='JM_FSMJ_H']").val());
				}
				if ($("input[name='YM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YM_FSMJ']").val());
				}
				if ($("input[name='YM_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='YM_FSMJ_H']").val());
				}
				if ($("input[name='SBYYJ_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SBYYJ_FSMJ']").val());
				}
				if ($("input[name='SBYYJ_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='SBYYJ_FSMJ_H']").val());
				}
				if ($("input[name='TH_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='TH_FSMJ']").val());
				}
				if ($("input[name='TH_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='TH_FSMJ_H']").val());
				}
				if ($("input[name='DXHC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='DXHC_FSMJ']").val());
				}
				if ($("input[name='DXHC_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='DXHC_FSMJ_H']").val());
				}
				if ($("input[name='QTHC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='QTHC_FSMJ']").val());
				}
				if ($("input[name='QTHC_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='QTHC_FSMJ_H']").val());
				}
				$("input[name='CHHJ_FSMJ']").val(ch);
				$("input[name='CHHJ_FSMJ_H']").val(ch_h);
			}
			$("input[name='BCHJ_FSMJ']").val(zh);
			$("input[name='BCHJ_FSMJ_H']").val(zh_h);
		} else {
			alert("����������");
			obj.value = "";
			if ($("input[name='YDYMM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_FSMJ']").val());
			}
			if ($("input[name='YDYMM_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='YDYMM_FSMJ_H']").val());
			}
			if ($("input[name='EDYMM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_FSMJ']").val());
			}
			if ($("input[name='EDYMM_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='EDYMM_FSMJ_H']").val());
			}
			if ($("input[name='SDYMM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_FSMJ']").val());
			}
			if ($("input[name='SDYMM_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='SDYMM_FSMJ_H']").val());
			}
			if ($("input[name='EDWYE_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDWYE_FSMJ']").val());
			}
			if ($("input[name='EDWYE_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='EDWYE_FSMJ_H']").val());
			}
			if ($("input[name='EDNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_FSMJ']").val());
			}
			if ($("input[name='EDNC_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='EDNC_FSMJ_H']").val());
			}
			if ($("input[name='SDNC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_FSMJ']").val());
			}
			if ($("input[name='SDNC_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='SDNC_FSMJ_H']").val());
			}
			if ($("input[name='SDMLC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDMLC_FSMJ']").val());
			}
			if ($("input[name='SDMLC_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='SDMLC_FSMJ_H']").val());
			}
			if ($("input[name='CDM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='CDM_FSMJ']").val());
			}
			if ($("input[name='CDM_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='CDM_FSMJ_H']").val());
			}
			if ($("input[name='YC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_FSMJ']").val());
			}
			if ($("input[name='YC_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='YC_FSMJ_H']").val());
			}
			if ($("input[name='JM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='JM_FSMJ']").val());
			}
			if ($("input[name='JM_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='JM_FSMJ_H']").val());
			}
			if ($("input[name='YM_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YM_FSMJ']").val());
			}
			if ($("input[name='YM_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='YM_FSMJ_H']").val());
			}
			if ($("input[name='SBYYJ_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SBYYJ_FSMJ']").val());
			}
			if ($("input[name='SBYYJ_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='SBYYJ_FSMJ_H']").val());
			}
			if ($("input[name='TH_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='TH_FSMJ']").val());
			}
			if ($("input[name='TH_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='TH_FSMJ_H']").val());
			}
			if ($("input[name='DXHC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DXHC_FSMJ']").val());
			}
			if ($("input[name='DXHC_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='DXHC_FSMJ_H']").val());
			}
			if ($("input[name='QTHC_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTHC_FSMJ']").val());
			}
			if ($("input[name='QTHC_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='QTHC_FSMJ_H']").val());
			}
			if ($("input[name='DBB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DBB_FSMJ']").val());
			}
			if ($("input[name='DBB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='DBB_FSMJ_H']").val());
			}
			if ($("input[name='XBB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XBB_FSMJ']").val());
			}
			if ($("input[name='XBB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='XBB_FSMJ_H']").val());
			}
			if ($("input[name='HBB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='HBB_FSMJ']").val());
			}
			if ($("input[name='HBB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='HBB_FSMJ_H']").val());
			}
			if ($("input[name='YMWBMYBB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='YMWBMYBB_FSMJ']").val());
			}
			if ($("input[name='YMWBMYBB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='YMWBMYBB_FSMJ_H']").val());
			}
			if ($("input[name='WKB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_FSMJ']").val());
			}
			if ($("input[name='WKB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='WKB_FSMJ_H']").val());
			}
			if ($("input[name='SHSB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='SHSB_FSMJ']").val());
			}
			if ($("input[name='SHSB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='SHSB_FSMJ_H']").val());
			}
			if ($("input[name='XB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='XB_FSMJ']").val());
			}
			if ($("input[name='XB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='XB_FSMJ_H']").val());
			}
			if ($("input[name='LHFB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='LHFB_FSMJ']").val());
			}
			if ($("input[name='LHFB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='LHFB_FSMJ_H']").val());
			}
			if ($("input[name='CSB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='CSB_FSMJ']").val());
			}
			if ($("input[name='CSB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='CSB_FSMJ_H']").val());
			}
			if ($("input[name='DFB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='DFB_FSMJ']").val());
			}
			if ($("input[name='DFB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='DFB_FSMJ_H']").val());
			}
			if ($("input[name='QTB_FSMJ']").val() != "") {
				zh = zh + parseFloat($("input[name='QTB_FSMJ']").val());
			}
			if ($("input[name='QTB_FSMJ_H']").val() != "") {
				zh_h = zh_h + parseFloat($("input[name='QTB_FSMJ_H']").val());
			}
			
			if (hz == "B") {
				if ($("input[name='DBB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='DBB_FSMJ']").val());
				}
				if ($("input[name='DBB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='DBB_FSMJ_H']").val());
				}
				if ($("input[name='XBB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='XBB_FSMJ']").val());
				}
				if ($("input[name='XBB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='XBB_FSMJ_H']").val());
				}
				if ($("input[name='HBB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='HBB_FSMJ']").val());
				}
				if ($("input[name='HBB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='HBB_FSMJ_H']").val());
				}
				if ($("input[name='YMWBMYBB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='YMWBMYBB_FSMJ']").val());
				}
				if ($("input[name='YMWBMYBB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='YMWBMYBB_FSMJ_H']").val());
				}
				if ($("input[name='WKB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='WKB_FSMJ']").val());
				}
				if ($("input[name='WKB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='WKB_FSMJ_H']").val());
				}
				if ($("input[name='SHSB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='SHSB_FSMJ']").val());
				}
				if ($("input[name='SHSB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='SHSB_FSMJ_H']").val());
				}
				if ($("input[name='XB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='XB_FSMJ']").val());
				}
				if ($("input[name='XB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='XB_FSMJ_H']").val());
				}
				if ($("input[name='LHFB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='LHFB_FSMJ']").val());
				}
				if ($("input[name='LHFB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='LHFB_FSMJ_H']").val());
				}
				if ($("input[name='CSB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='CSB_FSMJ']").val());
				}
				if ($("input[name='CSB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='CSB_FSMJ_H']").val());
				}
				if ($("input[name='DFB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='DFB_FSMJ']").val());
				}
				if ($("input[name='DFB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='DFB_FSMJ_H']").val());
				}
				if ($("input[name='QTB_FSMJ']").val() != "") {
					bh = bh + parseFloat($("input[name='QTB_FSMJ']").val());
				}
				if ($("input[name='QTB_FSMJ_H']").val() != "") {
					bh_h = bh_h + parseFloat($("input[name='QTB_FSMJ_H']").val());
				}
				
				$("input[name='BHHJ_FSMJ']").val(bh);
				$("input[name='BHHJ_FSMJ_H']").val(bh_h);
			} else {
				if ($("input[name='YDYMM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YDYMM_FSMJ']").val());
				}
				if ($("input[name='YDYMM_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='YDYMM_FSMJ_H']").val());
				}
				if ($("input[name='EDYMM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDYMM_FSMJ']").val());
				}
				if ($("input[name='EDYMM_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='EDYMM_FSMJ_H']").val());
				}
				if ($("input[name='SDYMM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SDYMM_FSMJ']").val());
				}
				if ($("input[name='SDYMM_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='SDYMM_FSMJ_H']").val());
				}
				if ($("input[name='EDWYE_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDWYE_FSMJ']").val());
				}
				if ($("input[name='EDWYE_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='EDWYE_FSMJ_H']").val());
				}
				if ($("input[name='EDNC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='EDNC_FSMJ']").val());
				}
				if ($("input[name='EDNC_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='EDNC_FSMJ_H']").val());
				}
				if ($("input[name='SDNC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SDNC_FSMJ']").val());
				}
				if ($("input[name='SDNC_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='SDNC_FSMJ_H']").val());
				}
				if ($("input[name='SDMLC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SDMLC_FSMJ']").val());
				}
				if ($("input[name='SDMLC_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='SDMLC_FSMJ_H']").val());
				}
				if ($("input[name='CDM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='CDM_FSMJ']").val());
				}
				if ($("input[name='CDM_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='CDM_FSMJ_H']").val());
				}
				if ($("input[name='YC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YC_FSMJ']").val());
				}
				if ($("input[name='YC_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='YC_FSMJ_H']").val());
				}
				if ($("input[name='JM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='JM_FSMJ']").val());
				}
				if ($("input[name='JM_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='JM_FSMJ_H']").val());
				}
				if ($("input[name='YM_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='YM_FSMJ']").val());
				}
				if ($("input[name='YM_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='YM_FSMJ_H']").val());
				}
				if ($("input[name='SBYYJ_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='SBYYJ_FSMJ']").val());
				}
				if ($("input[name='SBYYJ_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='SBYYJ_FSMJ_H']").val());
				}
				if ($("input[name='TH_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='TH_FSMJ']").val());
				}
				if ($("input[name='TH_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='TH_FSMJ_H']").val());
				}
				if ($("input[name='DXHC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='DXHC_FSMJ']").val());
				}
				if ($("input[name='DXHC_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='DXHC_FSMJ_H']").val());
				}
				if ($("input[name='QTHC_FSMJ']").val() != "") {
					ch = ch + parseFloat($("input[name='QTHC_FSMJ']").val());
				}
				if ($("input[name='QTHC_FSMJ_H']").val() != "") {
					ch_h = ch_h + parseFloat($("input[name='QTHC_FSMJ_H']").val());
				}
				$("input[name='CHHJ_FSMJ']").val(ch);
				$("input[name='CHHJ_FSMJ_H']").val(ch_h);
			}
			$("input[name='BCHJ_FSMJ']").val(zh);
			$("input[name='BCHJ_FSMJ_H']").val(zh_h);
		}
	}
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