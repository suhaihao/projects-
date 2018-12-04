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
		String YC_BZCD = "";
		String YC_XZCD = "";
		String YC_DQFS = "";
		String YC_DQTB_FS = "";
		String YC_BZFS = "";
		String YC_LJFS = "";
		String YC_LJTB_SQ = "";
		String YC_LJTB_SZ = "";
		String YC_DQFZ = "";
		String YC_DQTB_FZ = "";
		String YC_BZWC = "";
		String YC_LJFZ = "";
		String YC_LJTB_FZ = "";
		String YC_FZXG = "";
		String YC_RXFZ = "";
		String YC_PJMD = "";
		String YC_ZGMD = "";
		String YC_FSQY = "";
		String XJC_BZCD = "";
		String XJC_XZCD = "";
		String XJC_DQFS = "";
		String XJC_DQTB_FS = "";
		String XJC_BZFS = "";
		String XJC_LJFS = "";
		String XJC_LJTB_SQ = "";
		String XJC_LJTB_SZ = "";
		String XJC_DQFZ = "";
		String XJC_DQTB_FZ = "";
		String XJC_BZWC = "";
		String XJC_LJFZ = "";
		String XJC_LJTB_FZ = "";
		String XJC_FZXG = "";
		String XJC_RXFZ = "";
		String XJC_FSQY = "";
		String MZZ_BZCD = "";
		String MZZ_XZCD = "";
		String MZZ_DQFS = "";
		String MZZ_DQTB_FS = "";
		String MZZ_BZFS = "";
		String MZZ_LJFS = "";
		String MZZ_LJTB_SQ = "";
		String MZZ_LJTB_SZ = "";
		String MZZ_DQFZ = "";
		String MZZ_DQTB_FZ = "";
		String MZZ_BZWC = "";
		String MZZ_LJFZ = "";
		String MZZ_LJTB_FZ = "";
		String MZZ_FZXG = "";
		String MZZ_RXFZ = "";
		String MZZ_PJMD = "";
		String MZZ_ZGMD = "";
		String MZZ_FSQY = "";
		String TXB_BZCD = "";
		String TXB_XZCD = "";
		String TXB_DQFS = "";
		String TXB_DQTB_FS = "";
		String TXB_BZFS = "";
		String TXB_LJFS = "";
		String TXB_LJTB_SQ = "";
		String TXB_LJTB_SZ = "";
		String TXB_DQFZ = "";
		String TXB_DQTB_FZ = "";
		String TXB_BZWC = "";
		String TXB_LJFZ = "";
		String TXB_LJTB_FZ = "";
		String TXB_FZXG = "";
		String TXB_RXFZ = "";
		String TXB_PJMD = "";
		String TXB_ZGMD = "";
		String TXB_FSQY = "";
		String BFB_BZCD = "";
		String BFB_XZCD = "";
		String BFB_DQFS = "";
		String BFB_DQTB_FS = "";
		String BFB_BZFS = "";
		String BFB_LJFS = "";
		String BFB_LJTB_SQ = "";
		String BFB_LJTB_SZ = "";
		String BFB_DQFZ = "";
		String BFB_DQTB_FZ = "";
		String BFB_BZWC = "";
		String BFB_LJFZ = "";
		String BFB_LJTB_FZ = "";
		String BFB_FZXG = "";
		String BFB_RXFZ = "";
		String BFB_PJMD = "";
		String BFB_ZGMD = "";
		String BFB_FSQY = "";
		String WKB_BZCD = "";
		String WKB_XZCD = "";
		String WKB_DQFS = "";
		String WKB_DQTB_FS = "";
		String WKB_BZFS = "";
		String WKB_LJFS = "";
		String WKB_LJTB_SQ = "";
		String WKB_LJTB_SZ = "";
		String WKB_DQFZ = "";
		String WKB_DQTB_FZ = "";
		String WKB_BZWC = "";
		String WKB_LJFZ = "";
		String WKB_LJTB_FZ = "";
		String WKB_FZXG = "";
		String WKB_RXFZ = "";
		String WKB_PJMD = "";
		String WKB_ZGMD = "";
		String WKB_FSQY = "";
		String CMB_BZCD = "";
		String CMB_XZCD = "";
		String CMB_DQFS = "";
		String CMB_DQTB_FS = "";
		String CMB_BZFS = "";
		String CMB_LJFS = "";
		String CMB_LJTB_SQ = "";
		String CMB_LJTB_SZ = "";
		String CMB_DQFZ = "";
		String CMB_DQTB_FZ = "";
		String CMB_BZWC = "";
		String CMB_LJFZ = "";
		String CMB_LJTB_FZ = "";
		String CMB_FZXG = "";
		String CMB_RXFZ = "";
		String CMB_PJMD = "";
		String CMB_ZGMD = "";
		String CMB_FSQY = "";
		String SYQ = "";
		String FSQK = "";
		String FKQK = "";
		String FKFX = "";
		String HJ_BZCD = "";
		String HJ_XZCD = "";
		String HJ_DQFS = "";
		String HJ_DQTB_FS = "";
		String HJ_BZFS = "";
		String HJ_LJFS = "";
		String HJ_LJTB_SQ = "";
		String HJ_LJTB_SZ = "";
		String HJ_DQFZ = "";
		String HJ_DQTB_FZ = "";
		String HJ_BZWC = "";
		String HJ_LJFZ = "";
		String HJ_LJTB_FZ = "";
		String HJ_FZXG = "";
		String HJ_RXFZ = "";
		String HJ_PJMD = "";
		String HJ_ZGMD = "";
		String HJ_FSQY = "";
		String JFNO = "";
		String KSTBRQ = "";
		String JZTBRQ = "";
		String BBLX = "";
		String LRRQ = "";
		String LRRY = "";
		String RWSJ = "";
		String DCRQ = "";
		String XJC_PJMD_YC = "";
		String XJC_ZGMD_YC = "";
		String XJC_PJMD_CC = "";
		String XJC_ZGMD_CC = "";
		String XJC_PJMD_WHL = "";
		String XJC_ZGMD_WHL = "";
		String XJC_PJMD_BHCL = "";
		String XJC_ZGMD_BHCL = "";
			ExecuteConnection ecbody = new ExecuteConnection();
			PreparedStatement pstmtbody = null;
			ResultSet rsbody = null;
			try {
				String sql = "select "
						     +"sum(YC_DQFS) YC_DQFS,"
					         +"sum(XJC_DQFS) XJC_DQFS,"
					         +"sum(MZZ_DQFS) MZZ_DQFS,"
					         +"sum(TXB_DQFS) TXB_DQFS,"
					         +"sum(BFB_DQFS) BFB_DQFS,"
					         +"sum(WKB_DQFS) WKB_DQFS,"
					         +"sum(CMB_DQFS) CMB_DQFS,"
					         +"sum(HJ_DQFS) HJ_DQFS,"
						     +"sum(YC_BZFS) YC_BZFS,"
					         +"sum(XJC_BZFS) XJC_BZFS,"
					         +"sum(MZZ_BZFS) MZZ_BZFS,"
					         +"sum(TXB_BZFS) TXB_BZFS,"
					         +"sum(BFB_BZFS) BFB_BZFS,"
					         +"sum(WKB_BZFS) WKB_BZFS,"
					         +"sum(CMB_BZFS) CMB_BZFS,"
					         +"sum(HJ_BZFS) HJ_BZFS,"
						     +"sum(YC_LJFS) YC_LJFS,"
					         +"sum(MZZ_LJFS) MZZ_LJFS,"
					         +"sum(TXB_LJFS) TXB_LJFS,"
					         +"sum(BFB_LJFS) BFB_LJFS,"
					         +"sum(WKB_LJFS) WKB_LJFS,"
					         +"sum(CMB_LJFS) CMB_LJFS,"
					         +"sum(HJ_LJFS) HJ_LJFS,"
						     +"sum(YC_DQFZ) YC_DQFZ,"
					         +"sum(XJC_DQFZ) XJC_DQFZ,"
					         +"sum(MZZ_DQFZ) MZZ_DQFZ,"
					         +"sum(TXB_DQFZ) TXB_DQFZ,"
					         +"sum(BFB_DQFZ) BFB_DQFZ,"
					         +"sum(WKB_DQFZ) WKB_DQFZ,"
					         +"sum(CMB_DQFZ) CMB_DQFZ,"
					         +"sum(HJ_DQFZ) HJ_DQFZ,"
						     +"sum(YC_BZWC) YC_BZWC,"
					         +"sum(XJC_BZWC) XJC_BZWC,"
					         +"sum(MZZ_BZWC) MZZ_BZWC,"
					         +"sum(TXB_BZWC) TXB_BZWC,"
					         +"sum(BFB_BZWC) BFB_BZWC,"
					         +"sum(WKB_BZWC) WKB_BZWC,"
					         +"sum(CMB_BZWC) CMB_BZWC,"
					         +"sum(HJ_BZWC) HJ_BZWC,"
						     +"sum(YC_LJFZ) YC_LJFZ,"
					         +"sum(XJC_LJFZ) XJC_LJFZ,"
					         +"sum(MZZ_LJFZ) MZZ_LJFZ,"
					         +"sum(TXB_LJFZ) TXB_LJFZ,"
					         +"sum(BFB_LJFZ) BFB_LJFZ,"
					         +"sum(WKB_LJFZ) WKB_LJFZ,"
					         +"sum(CMB_LJFZ) CMB_LJFZ,"
					         +"sum(HJ_LJFZ) HJ_LJFZ,"
						     +"trunc(avg(YC_FZXG),2) YC_FZXG,"
					         +"trunc(avg(XJC_FZXG),2) XJC_FZXG,"
					         +"trunc(avg(MZZ_FZXG),2) MZZ_FZXG,"
					         +"trunc(avg(TXB_FZXG),2) TXB_FZXG,"
					         +"trunc(avg(BFB_FZXG),2) BFB_FZXG,"
					         +"trunc(avg(WKB_FZXG),2) WKB_FZXG,"
					         +"trunc(avg(CMB_FZXG),2) CMB_FZXG,"
					         +"trunc(avg(HJ_FZXG),2) HJ_FZXG,"
						     +"sum(YC_RXFZ) YC_RXFZ,"
					         +"sum(XJC_RXFZ) XJC_RXFZ,"
					         +"sum(MZZ_RXFZ) MZZ_RXFZ,"
					         +"sum(TXB_RXFZ) TXB_RXFZ,"
					         +"sum(BFB_RXFZ) BFB_RXFZ,"
					         +"sum(WKB_RXFZ) WKB_RXFZ,"
					         +"sum(CMB_RXFZ) CMB_RXFZ,"
					         +"sum(HJ_RXFZ) HJ_RXFZ,"
						     +"trunc(avg(YC_PJMD),2) YC_PJMD,"
					         +"trunc(avg(XJC_PJMD_YC),2) XJC_PJMD_YC,"
					         +"trunc(avg(XJC_PJMD_CC),2) XJC_PJMD_CC,"
					         +"trunc(avg(XJC_PJMD_WHL),2) XJC_PJMD_WHL,"
					         +"trunc(avg(XJC_PJMD_BHCL),2) XJC_PJMD_BHCL,"
					         +"trunc(avg(MZZ_PJMD),2) MZZ_PJMD,"
					         +"trunc(avg(TXB_PJMD),2) TXB_PJMD,"
					         +"trunc(avg(BFB_PJMD),2) BFB_PJMD,"
					         +"trunc(avg(WKB_PJMD),2) WKB_PJMD,"
					         +"trunc(avg(CMB_PJMD),2) CMB_PJMD,"
						     +"max(YC_ZGMD) YC_ZGMD,"
					         +"max(XJC_ZGMD_YC) XJC_ZGMD_YC,"
					         +"max(XJC_ZGMD_CC) XJC_ZGMD_CC,"
					         +"max(XJC_ZGMD_WHL) XJC_ZGMD_WHL,"
					         +"max(XJC_ZGMD_BHCL) XJC_ZGMD_BHCL,"
					         +"max(MZZ_ZGMD) MZZ_ZGMD,"
					         +"max(TXB_ZGMD) TXB_ZGMD,"
					         +"max(BFB_ZGMD) BFB_ZGMD,"
					         +"max(WKB_ZGMD) WKB_ZGMD,"
					         +"max(CMB_ZGMD) CMB_ZGMD"
					         +" from D001 "
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
					         YC_DQFS=rsbody.getString("YC_DQFS")==null?"":rsbody.getString("YC_DQFS");
					         XJC_DQFS=rsbody.getString("XJC_DQFS")==null?"":rsbody.getString("XJC_DQFS");
					         MZZ_DQFS=rsbody.getString("MZZ_DQFS")==null?"":rsbody.getString("MZZ_DQFS");
					         TXB_DQFS=rsbody.getString("TXB_DQFS")==null?"":rsbody.getString("TXB_DQFS");
					         BFB_DQFS=rsbody.getString("BFB_DQFS")==null?"":rsbody.getString("BFB_DQFS");
					         WKB_DQFS=rsbody.getString("WKB_DQFS")==null?"":rsbody.getString("WKB_DQFS");
					         CMB_DQFS=rsbody.getString("CMB_DQFS")==null?"":rsbody.getString("CMB_DQFS");
					         HJ_DQFS=rsbody.getString("HJ_DQFS")==null?"":rsbody.getString("HJ_DQFS");
						     YC_BZFS=rsbody.getString("YC_BZFS")==null?"":rsbody.getString("YC_BZFS");
					         XJC_BZFS=rsbody.getString("XJC_BZFS")==null?"":rsbody.getString("XJC_BZFS");
					         MZZ_BZFS=rsbody.getString("MZZ_BZFS")==null?"":rsbody.getString("MZZ_BZFS");
					         TXB_BZFS=rsbody.getString("TXB_BZFS")==null?"":rsbody.getString("TXB_BZFS");
					         BFB_BZFS=rsbody.getString("BFB_BZFS")==null?"":rsbody.getString("BFB_BZFS");
					         WKB_BZFS=rsbody.getString("WKB_BZFS")==null?"":rsbody.getString("WKB_BZFS");
					         CMB_BZFS=rsbody.getString("CMB_BZFS")==null?"":rsbody.getString("CMB_BZFS");
					         HJ_BZFS=rsbody.getString("HJ_BZFS")==null?"":rsbody.getString("HJ_BZFS");
						     YC_LJFS=rsbody.getString("YC_LJFS")==null?"":rsbody.getString("YC_LJFS");
					         MZZ_LJFS=rsbody.getString("MZZ_LJFS")==null?"":rsbody.getString("MZZ_LJFS");
					         TXB_LJFS=rsbody.getString("TXB_LJFS")==null?"":rsbody.getString("TXB_LJFS");
					         BFB_LJFS=rsbody.getString("BFB_LJFS")==null?"":rsbody.getString("BFB_LJFS");
					         WKB_LJFS=rsbody.getString("WKB_LJFS")==null?"":rsbody.getString("WKB_LJFS");
					         CMB_LJFS=rsbody.getString("CMB_LJFS")==null?"":rsbody.getString("CMB_LJFS");
					         HJ_LJFS=rsbody.getString("HJ_LJFS")==null?"":rsbody.getString("HJ_LJFS");
						     YC_DQFZ=rsbody.getString("YC_DQFZ")==null?"":rsbody.getString("YC_DQFZ");
					         XJC_DQFZ=rsbody.getString("XJC_DQFZ")==null?"":rsbody.getString("XJC_DQFZ");
					         MZZ_DQFZ=rsbody.getString("MZZ_DQFZ")==null?"":rsbody.getString("MZZ_DQFZ");
					         TXB_DQFZ=rsbody.getString("TXB_DQFZ")==null?"":rsbody.getString("TXB_DQFZ");
					         BFB_DQFZ=rsbody.getString("BFB_DQFZ")==null?"":rsbody.getString("BFB_DQFZ");
					         WKB_DQFZ=rsbody.getString("WKB_DQFZ")==null?"":rsbody.getString("WKB_DQFZ");
					         CMB_DQFZ=rsbody.getString("CMB_DQFZ")==null?"":rsbody.getString("CMB_DQFZ");
					         HJ_DQFZ=rsbody.getString("HJ_DQFZ")==null?"":rsbody.getString("HJ_DQFZ");
						     YC_BZWC=rsbody.getString("YC_BZWC")==null?"":rsbody.getString("YC_BZWC");
					         XJC_BZWC=rsbody.getString("XJC_BZWC")==null?"":rsbody.getString("XJC_BZWC");
					         MZZ_BZWC=rsbody.getString("MZZ_BZWC")==null?"":rsbody.getString("MZZ_BZWC");
					         TXB_BZWC=rsbody.getString("TXB_BZWC")==null?"":rsbody.getString("TXB_BZWC");
					         BFB_BZWC=rsbody.getString("BFB_BZWC")==null?"":rsbody.getString("BFB_BZWC");
					         WKB_BZWC=rsbody.getString("WKB_BZWC")==null?"":rsbody.getString("WKB_BZWC");
					         CMB_BZWC=rsbody.getString("CMB_BZWC")==null?"":rsbody.getString("CMB_BZWC");
					         HJ_BZWC=rsbody.getString("HJ_BZWC")==null?"":rsbody.getString("HJ_BZWC");
						     YC_LJFZ=rsbody.getString("YC_LJFZ")==null?"":rsbody.getString("YC_LJFZ");
					         XJC_LJFZ=rsbody.getString("XJC_LJFZ")==null?"":rsbody.getString("XJC_LJFZ");
					         MZZ_LJFZ=rsbody.getString("MZZ_LJFZ")==null?"":rsbody.getString("MZZ_LJFZ");
					         TXB_LJFZ=rsbody.getString("TXB_LJFZ")==null?"":rsbody.getString("TXB_LJFZ");
					         BFB_LJFZ=rsbody.getString("BFB_LJFZ")==null?"":rsbody.getString("BFB_LJFZ");
					         WKB_LJFZ=rsbody.getString("WKB_LJFZ")==null?"":rsbody.getString("WKB_LJFZ");
					         CMB_LJFZ=rsbody.getString("CMB_LJFZ")==null?"":rsbody.getString("CMB_LJFZ");
					         HJ_LJFZ=rsbody.getString("HJ_LJFZ")==null?"":rsbody.getString("HJ_LJFZ");
						     YC_FZXG=rsbody.getString("YC_FZXG")==null?"":rsbody.getString("YC_FZXG");
					         XJC_FZXG=rsbody.getString("XJC_FZXG")==null?"":rsbody.getString("XJC_FZXG");
					         MZZ_FZXG=rsbody.getString("MZZ_FZXG")==null?"":rsbody.getString("MZZ_FZXG");
					         TXB_FZXG=rsbody.getString("TXB_FZXG")==null?"":rsbody.getString("TXB_FZXG");
					         BFB_FZXG=rsbody.getString("BFB_FZXG")==null?"":rsbody.getString("BFB_FZXG");
					         WKB_FZXG=rsbody.getString("WKB_FZXG")==null?"":rsbody.getString("WKB_FZXG");
					         CMB_FZXG=rsbody.getString("CMB_FZXG")==null?"":rsbody.getString("CMB_FZXG");
					         HJ_FZXG=rsbody.getString("HJ_FZXG")==null?"":rsbody.getString("HJ_FZXG");
						     YC_RXFZ=rsbody.getString("YC_RXFZ")==null?"":rsbody.getString("YC_RXFZ");
					         XJC_RXFZ=rsbody.getString("XJC_RXFZ")==null?"":rsbody.getString("XJC_RXFZ");
					         MZZ_RXFZ=rsbody.getString("MZZ_RXFZ")==null?"":rsbody.getString("MZZ_RXFZ");
					         TXB_RXFZ=rsbody.getString("TXB_RXFZ")==null?"":rsbody.getString("TXB_RXFZ");
					         BFB_RXFZ=rsbody.getString("BFB_RXFZ")==null?"":rsbody.getString("BFB_RXFZ");
					         WKB_RXFZ=rsbody.getString("WKB_RXFZ")==null?"":rsbody.getString("WKB_RXFZ");
					         CMB_RXFZ=rsbody.getString("CMB_RXFZ")==null?"":rsbody.getString("CMB_RXFZ");
					         HJ_RXFZ=rsbody.getString("HJ_RXFZ")==null?"":rsbody.getString("HJ_RXFZ");
						     YC_PJMD=rsbody.getString("YC_PJMD")==null?"":rsbody.getString("YC_PJMD");
					         XJC_PJMD_YC=rsbody.getString("XJC_PJMD_YC")==null?"":rsbody.getString("XJC_PJMD_YC");
					         XJC_PJMD_CC=rsbody.getString("XJC_PJMD_CC")==null?"":rsbody.getString("XJC_PJMD_CC");
					         XJC_PJMD_WHL=rsbody.getString("XJC_PJMD_WHL")==null?"":rsbody.getString("XJC_PJMD_WHL");
					         XJC_PJMD_BHCL=rsbody.getString("XJC_PJMD_BHCL")==null?"":rsbody.getString("XJC_PJMD_BHCL");
					         MZZ_PJMD=rsbody.getString("MZZ_PJMD")==null?"":rsbody.getString("MZZ_PJMD");
					         TXB_PJMD=rsbody.getString("TXB_PJMD")==null?"":rsbody.getString("TXB_PJMD");
					         BFB_PJMD=rsbody.getString("BFB_PJMD")==null?"":rsbody.getString("BFB_PJMD");
					         WKB_PJMD=rsbody.getString("WKB_PJMD")==null?"":rsbody.getString("WKB_PJMD");
					         CMB_PJMD=rsbody.getString("CMB_PJMD")==null?"":rsbody.getString("CMB_PJMD");
						     YC_ZGMD=rsbody.getString("YC_ZGMD")==null?"":rsbody.getString("YC_ZGMD");
					         XJC_ZGMD_YC=rsbody.getString("XJC_ZGMD_YC")==null?"":rsbody.getString("XJC_ZGMD_YC");
					         XJC_ZGMD_CC=rsbody.getString("XJC_ZGMD_CC")==null?"":rsbody.getString("XJC_ZGMD_CC");
					         XJC_ZGMD_WHL=rsbody.getString("XJC_ZGMD_WHL")==null?"":rsbody.getString("XJC_ZGMD_WHL");
					         XJC_ZGMD_BHCL=rsbody.getString("XJC_ZGMD_BHCL")==null?"":rsbody.getString("XJC_ZGMD_BHCL");
					         MZZ_ZGMD=rsbody.getString("MZZ_ZGMD")==null?"":rsbody.getString("MZZ_ZGMD");
					         TXB_ZGMD=rsbody.getString("TXB_ZGMD")==null?"":rsbody.getString("TXB_ZGMD");
					         BFB_ZGMD=rsbody.getString("BFB_ZGMD")==null?"":rsbody.getString("BFB_ZGMD");
					         WKB_ZGMD=rsbody.getString("WKB_ZGMD")==null?"":rsbody.getString("WKB_ZGMD");
					         CMB_ZGMD=rsbody.getString("CMB_ZGMD")==null?"":rsbody.getString("CMB_ZGMD");
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
					style="text-align:center;font-size=30;width: ;height: "><b>小麦病虫周报表</b><br>
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
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>病虫名称</b></td>
					<td colspan=2 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>发生程度</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>当前发生面积</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>当前发生面积比上年同期增减%</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>本周新增发生面积</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>累计发生面积</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>累计发生面积比上年同期增减%</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>累计发生面积比上周增加%</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>当前需防治面积</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>当前需防治面积比上年同期增减%</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>本周完成防治面积</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>累计防治面积</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>累计防治面积比上年同期增减%</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>防治效果%</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>当前仍需防治面积</b></td>
					<td colspan=2 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>平均密度</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>最高密度</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>主要发生区域</b></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>本周</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>下周</b></td>
				</tr>
			</tbody>
			<tbody id="zg_body">
				<tr>
					<td>合计</td>
					<td style="text-align: center;">\</td>
					<td style="text-align: center;">\</td>
					<td><label><%=HJ_DQFS%></label></td>
					<td><label><%=HJ_DQTB_FS%></label></td>
					<td><label><%=HJ_BZFS%></label></td>
					<td><label><%=HJ_LJFS%></label></td>
					<td><label><%=HJ_LJTB_SQ%></label></td>
					<td><label><%=HJ_LJTB_SZ%></label></td>
					<td><label><%=HJ_DQFZ%></label></td>
					<td><label><%=HJ_DQTB_FZ%></label></td>
					<td><label><%=HJ_BZWC%></label></td>
					<td><label><%=HJ_LJFZ%></label></td>
					<td><label><%=HJ_LJTB_FZ%></label></td>
					<td><label><%=HJ_FZXG%></label></td>
					<td><label><%=HJ_RXFZ%></label></td>
					<td colspan="2"><label><%=HJ_PJMD%></label></td>
					<td><label><%=HJ_ZGMD%></label></td>
					<td><label><%=HJ_FSQY%></label></td>
				</tr>
				<tr>
					<td>蚜虫</td>
					<td><label><%=YC_BZCD%></label></td>
					<td><label><%=YC_XZCD%></label></td>
					<td><label><%=YC_DQFS%></label></td>
					<td><label><%=YC_DQTB_FS%></label></td>
					<td><label><%=YC_BZFS%></label></td>
					<td><label><%=YC_LJFS%></label></td>
					<td><label><%=YC_LJTB_SQ%></label></td>
					<td><label><%=YC_LJTB_SZ%></label></td>
					<td><label><%=YC_DQFZ%></label></td>
					<td><label><%=YC_DQTB_FZ%></label></td>
					<td><label><%=YC_BZWC%></label></td>
					<td><label><%=YC_LJFZ%></label></td>
					<td><label><%=YC_LJTB_FZ%></label></td>
					<td><label><%=YC_FZXG%></label></td>
					<td><label><%=YC_RXFZ%></label></td>
					<td>百株蚜量(头/百株)</td>
					<td><label><%=YC_PJMD%></label></td>
					<td><label><%=YC_ZGMD%></label></td>
					<td><label><%=YC_FSQY%></label></td>
				</tr>
				<tr>
					<td rowspan="5">吸浆虫</td>
					<td rowspan="5"><label><%=XJC_BZCD%></label></td>
					<td rowspan="5"><label><%=XJC_XZCD%></label></td>
					<td rowspan="5"><label><%=XJC_DQFS%></label></td>
					<td rowspan="5"><label><%=XJC_DQTB_FS%></label></td>
					<td rowspan="5"><label><%=XJC_BZFS%></label></td>
					<td rowspan="5"><label><%=XJC_LJFS%></label></td>
					<td rowspan="5"><label><%=XJC_LJTB_SQ%></label></td>
					<td rowspan="5"><label><%=XJC_LJTB_SZ%></label></td>
					<td rowspan="5"><label><%=XJC_DQFZ%></label></td>
					<td rowspan="5"><label><%=XJC_DQTB_FZ%></label></td>
					<td rowspan="5"><label><%=XJC_BZWC%></label></td>
					<td rowspan="5"><label><%=XJC_LJFZ%></label></td>
					<td rowspan="5"><label><%=XJC_LJTB_FZ%></label></td>
					<td rowspan="5"><label><%=XJC_FZXG%></label></td>
					<td rowspan="5"><label><%=XJC_RXFZ%></label></td>
				</tr>
				<tr>
					<td>幼虫淘土：每样方虫量（头/样方）</td>
					<td><label><%=XJC_PJMD_YC%></label></td>
					<td><label><%=XJC_ZGMD_YC%></label></td>
					<td rowspan="4"><label><%=XJC_FSQY%></label></td>
				</tr>
				<tr>
					<td>成虫：百复网虫量（头/百复网）</td>
					<td><label><%=XJC_PJMD_CC%></label></td>
					<td><label><%=XJC_ZGMD_CC%></label></td>
				</tr>
				<tr>
					<td>危害期：虫穗率（%）</td>
					<td><label><%=XJC_PJMD_WHL%></label></td>
					<td><label><%=XJC_ZGMD_WHL%></label></td>
				</tr>
				<tr>
					<td>危害期：百穗虫量（头/百穗）</td>
					<td><label><%=XJC_PJMD_BHCL%></label></td>
					<td><label><%=XJC_ZGMD_BHCL%></label></td>
				</tr>
				<tr>
					<td>麦蜘蛛</td>
					<td><label><%=MZZ_BZCD%></label></td>
					<td><label><%=MZZ_XZCD%></label></td>
					<td><label><%=MZZ_DQFS%></label></td>
					<td><label><%=MZZ_DQTB_FS%></label></td>
					<td><label><%=MZZ_BZFS%></label></td>
					<td><label><%=MZZ_LJFS%></label></td>
					<td><label><%=MZZ_LJTB_SQ%></label></td>
					<td><label><%=MZZ_LJTB_SZ%></label></td>
					<td><label><%=MZZ_DQFZ%></label></td>
					<td><label><%=MZZ_DQTB_FZ%></label></td>
					<td><label><%=MZZ_BZWC%></label></td>
					<td><label><%=MZZ_LJFZ%></label></td>
					<td><label><%=MZZ_LJTB_FZ%></label></td>
					<td><label><%=MZZ_FZXG%></label></td>
					<td><label><%=MZZ_RXFZ%></label></td>
					<td>每尺单行虫量（头/尺/行）</td>
					<td><label><%=MZZ_PJMD%></label></td>
					<td><label><%=MZZ_ZGMD%></label></td>
					<td><label><%=MZZ_FSQY%></label></td>
				</tr>
				<tr>
					<td>条锈病</td>
					<td><label><%=TXB_BZCD%></label></td>
					<td><label><%=TXB_XZCD%></label></td>
					<td><label><%=TXB_DQFS%></label></td>
					<td><label><%=TXB_DQTB_FS%></label></td>
					<td><label><%=TXB_BZFS%></label></td>
					<td><label><%=TXB_LJFS%></label></td>
					<td><label><%=TXB_LJTB_SQ%></label></td>
					<td><label><%=TXB_LJTB_SZ%></label></td>
					<td><label><%=TXB_DQFZ%></label></td>
					<td><label><%=TXB_DQTB_FZ%></label></td>
					<td><label><%=TXB_BZWC%></label></td>
					<td><label><%=TXB_LJFZ%></label></td>
					<td><label><%=TXB_LJTB_FZ%></label></td>
					<td><label><%=TXB_FZXG%></label></td>
					<td><label><%=TXB_RXFZ%></label></td>
					<td>病叶率（%）</td>
					<td><label><%=TXB_PJMD%></label></td>
					<td><label><%=TXB_ZGMD%></label></td>
					<td><label><%=TXB_FSQY%></label></td>
				</tr>
				<tr>
					<td>白粉病</td>
					<td><label><%=BFB_BZCD%></label></td>
					<td><label><%=BFB_XZCD%></label></td>
					<td><label><%=BFB_DQFS%></label></td>
					<td><label><%=BFB_DQTB_FS%></label></td>
					<td><label><%=BFB_BZFS%></label></td>
					<td><label><%=BFB_LJFS%></label></td>
					<td><label><%=BFB_LJTB_SQ%></label></td>
					<td><label><%=BFB_LJTB_SZ%></label></td>
					<td><label><%=BFB_DQFZ%></label></td>
					<td><label><%=BFB_DQTB_FZ%></label></td>
					<td><label><%=BFB_BZWC%></label></td>
					<td><label><%=BFB_LJFZ%></label></td>
					<td><label><%=BFB_LJTB_FZ%></label></td>
					<td><label><%=BFB_FZXG%></label></td>
					<td><label><%=BFB_RXFZ%></label></td>
					<td>病叶率（%）</td>
					<td><label><%=BFB_PJMD%></label></td>
					<td><label><%=BFB_ZGMD%></label></td>
					<td><label><%=BFB_FSQY%></label></td>
				</tr>
				<tr>
					<td>纹枯病</td>
					<td><label><%=WKB_BZCD%></label></td>
					<td><label><%=WKB_XZCD%></label></td>
					<td><label><%=WKB_DQFS%></label></td>
					<td><label><%=WKB_DQTB_FS%></label></td>
					<td><label><%=WKB_BZFS%></label></td>
					<td><label><%=WKB_LJFS%></label></td>
					<td><label><%=WKB_LJTB_SQ%></label></td>
					<td><label><%=WKB_LJTB_SZ%></label></td>
					<td><label><%=WKB_DQFZ%></label></td>
					<td><label><%=WKB_DQTB_FZ%></label></td>
					<td><label><%=WKB_BZWC%></label></td>
					<td><label><%=WKB_LJFZ%></label></td>
					<td><label><%=WKB_LJTB_FZ%></label></td>
					<td><label><%=WKB_FZXG%></label></td>
					<td><label><%=WKB_RXFZ%></label></td>
					<td>病株率（%）</td>
					<td><label><%=WKB_PJMD%></label></td>
					<td><label><%=WKB_ZGMD%></label></td>
					<td><label><%=WKB_FSQY%></label></td>
				</tr>
				<tr>
					<td>赤霉病</td>
					<td><label><%=CMB_BZCD%></label></td>
					<td><label><%=CMB_XZCD%></label></td>
					<td><label><%=CMB_DQFS%></label></td>
					<td><label><%=CMB_DQTB_FS%></label></td>
					<td><label><%=CMB_BZFS%></label></td>
					<td><label><%=CMB_LJFS%></label></td>
					<td><label><%=CMB_LJTB_SQ%></label></td>
					<td><label><%=CMB_LJTB_SZ%></label></td>
					<td><label><%=CMB_DQFZ%></label></td>
					<td><label><%=CMB_DQTB_FZ%></label></td>
					<td><label><%=CMB_BZWC%></label></td>
					<td><label><%=CMB_LJFZ%></label></td>
					<td><label><%=CMB_LJTB_FZ%></label></td>
					<td><label><%=CMB_FZXG%></label></td>
					<td><label><%=CMB_RXFZ%></label></td>
					<td>病穗率（%）</td>
					<td><label><%=CMB_PJMD%></label></td>
					<td><label><%=CMB_ZGMD%></label></td>
					<td><label><%=CMB_FSQY%></label></td>
				</tr>
			</tbody>
			<tr>
				<td>小麦生育期</td>
				<td colspan="19"><label><%=SYQ%></label></td>
			</tr>
			<tr>
				<td>发生情况概况</td>
				<td colspan="19"><label><%=FSQK%></label></td>
			</tr>
			<tr>
				<td>防控情况概况</td>
				<td colspan="19"><label><%=FKQK%></label></td>
			</tr>
			<tr>
				<td>下阶段发生防控形势分析</td>
				<td colspan="19"><label><%=FKFX%></label></td>
			</tr>
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