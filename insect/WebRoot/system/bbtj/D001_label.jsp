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
		String BMBM = "";
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
		if (!bbzt.equals("0")) {
			ExecuteConnection ecbody = new ExecuteConnection();
			PreparedStatement pstmtbody = null;
			ResultSet rsbody = null;
			try {
				String sql = "select * from D001 where jfid=" + jfid;
				pstmtbody = ecbody.con.prepareStatement(sql);
				rsbody = pstmtbody.executeQuery();
				while (rsbody.next()) {
					JFID = rsbody.getString("JFID")==null?"":rsbody.getString("JFID");
					YC_BZCD = rsbody.getString("YC_BZCD")==null?"":rsbody.getString("YC_BZCD");
					YC_XZCD = rsbody.getString("YC_XZCD")==null?"":rsbody.getString("YC_XZCD");
					YC_DQFS = rsbody.getString("YC_DQFS")==null?"":rsbody.getString("YC_DQFS");
					YC_DQTB_FS = rsbody.getString("YC_DQTB_FS")==null?"":rsbody.getString("YC_DQTB_FS");
					YC_BZFS = rsbody.getString("YC_BZFS")==null?"":rsbody.getString("YC_BZFS");
					YC_LJFS = rsbody.getString("YC_LJFS")==null?"":rsbody.getString("YC_LJFS");
					YC_LJTB_SQ = rsbody.getString("YC_LJTB_SQ")==null?"":rsbody.getString("YC_LJTB_SQ");
					YC_LJTB_SZ = rsbody.getString("YC_LJTB_SZ")==null?"":rsbody.getString("YC_LJTB_SZ");
					YC_DQFZ = rsbody.getString("YC_DQFZ")==null?"":rsbody.getString("YC_DQFZ");
					YC_DQTB_FZ = rsbody.getString("YC_DQTB_FZ")==null?"":rsbody.getString("YC_DQTB_FZ");
					YC_BZWC = rsbody.getString("YC_BZWC")==null?"":rsbody.getString("YC_BZWC");
					YC_LJFZ = rsbody.getString("YC_LJFZ")==null?"":rsbody.getString("YC_LJFZ");
					YC_LJTB_FZ = rsbody.getString("YC_LJTB_FZ")==null?"":rsbody.getString("YC_LJTB_FZ");
					YC_FZXG = rsbody.getString("YC_FZXG")==null?"":rsbody.getString("YC_FZXG");
					YC_RXFZ = rsbody.getString("YC_RXFZ")==null?"":rsbody.getString("YC_RXFZ");
					YC_PJMD = rsbody.getString("YC_PJMD")==null?"":rsbody.getString("YC_PJMD");
					YC_ZGMD = rsbody.getString("YC_ZGMD")==null?"":rsbody.getString("YC_ZGMD");
					YC_FSQY = rsbody.getString("YC_FSQY")==null?"":rsbody.getString("YC_FSQY");
					XJC_BZCD = rsbody.getString("XJC_BZCD")==null?"":rsbody.getString("XJC_BZCD");
					XJC_XZCD = rsbody.getString("XJC_XZCD")==null?"":rsbody.getString("XJC_XZCD");
					XJC_DQFS = rsbody.getString("XJC_DQFS")==null?"":rsbody.getString("XJC_DQFS");
					XJC_DQTB_FS = rsbody.getString("XJC_DQTB_FS")==null?"":rsbody.getString("XJC_DQTB_FS");
					XJC_BZFS = rsbody.getString("XJC_BZFS")==null?"":rsbody.getString("XJC_BZFS");
					XJC_LJFS = rsbody.getString("XJC_LJFS")==null?"":rsbody.getString("XJC_LJFS");
					XJC_LJTB_SQ = rsbody.getString("XJC_LJTB_SQ")==null?"":rsbody.getString("XJC_LJTB_SQ");
					XJC_LJTB_SZ = rsbody.getString("XJC_LJTB_SZ")==null?"":rsbody.getString("XJC_LJTB_SZ");
					XJC_DQFZ = rsbody.getString("XJC_DQFZ")==null?"":rsbody.getString("XJC_DQFZ");
					XJC_DQTB_FZ = rsbody.getString("XJC_DQTB_FZ")==null?"":rsbody.getString("XJC_DQTB_FZ");
					XJC_BZWC = rsbody.getString("XJC_BZWC")==null?"":rsbody.getString("XJC_BZWC");
					XJC_LJFZ = rsbody.getString("XJC_LJFZ")==null?"":rsbody.getString("XJC_LJFZ");
					XJC_LJTB_FZ = rsbody.getString("XJC_LJTB_FZ")==null?"":rsbody.getString("XJC_LJTB_FZ");
					XJC_FZXG = rsbody.getString("XJC_FZXG")==null?"":rsbody.getString("XJC_FZXG");
					XJC_RXFZ = rsbody.getString("XJC_RXFZ")==null?"":rsbody.getString("XJC_RXFZ");
					XJC_FSQY = rsbody.getString("XJC_FSQY")==null?"":rsbody.getString("XJC_FSQY");
					MZZ_BZCD = rsbody.getString("MZZ_BZCD")==null?"":rsbody.getString("MZZ_BZCD");
					MZZ_XZCD = rsbody.getString("MZZ_XZCD")==null?"":rsbody.getString("MZZ_XZCD");
					MZZ_DQFS = rsbody.getString("MZZ_DQFS")==null?"":rsbody.getString("MZZ_DQFS");
					MZZ_DQTB_FS = rsbody.getString("MZZ_DQTB_FS")==null?"":rsbody.getString("MZZ_DQTB_FS");
					MZZ_BZFS = rsbody.getString("MZZ_BZFS")==null?"":rsbody.getString("MZZ_BZFS");
					MZZ_LJFS = rsbody.getString("MZZ_LJFS")==null?"":rsbody.getString("MZZ_LJFS");
					MZZ_LJTB_SQ = rsbody.getString("MZZ_LJTB_SQ")==null?"":rsbody.getString("MZZ_LJTB_SQ");
					MZZ_LJTB_SZ = rsbody.getString("MZZ_LJTB_SZ")==null?"":rsbody.getString("MZZ_LJTB_SZ");
					MZZ_DQFZ = rsbody.getString("MZZ_DQFZ")==null?"":rsbody.getString("MZZ_DQFZ");
					MZZ_DQTB_FZ = rsbody.getString("MZZ_DQTB_FZ")==null?"":rsbody.getString("MZZ_DQTB_FZ");
					MZZ_BZWC = rsbody.getString("MZZ_BZWC")==null?"":rsbody.getString("MZZ_BZWC");
					MZZ_LJFZ = rsbody.getString("MZZ_LJFZ")==null?"":rsbody.getString("MZZ_LJFZ");
					MZZ_LJTB_FZ = rsbody.getString("MZZ_LJTB_FZ")==null?"":rsbody.getString("MZZ_LJTB_FZ");
					MZZ_FZXG = rsbody.getString("MZZ_FZXG")==null?"":rsbody.getString("MZZ_FZXG");
					MZZ_RXFZ = rsbody.getString("MZZ_RXFZ")==null?"":rsbody.getString("MZZ_RXFZ");
					MZZ_PJMD = rsbody.getString("MZZ_PJMD")==null?"":rsbody.getString("MZZ_PJMD");
					MZZ_ZGMD = rsbody.getString("MZZ_ZGMD")==null?"":rsbody.getString("MZZ_ZGMD");
					MZZ_FSQY = rsbody.getString("MZZ_FSQY")==null?"":rsbody.getString("MZZ_FSQY");
					TXB_BZCD = rsbody.getString("TXB_BZCD")==null?"":rsbody.getString("TXB_BZCD");
					TXB_XZCD = rsbody.getString("TXB_XZCD")==null?"":rsbody.getString("TXB_XZCD");
					TXB_DQFS = rsbody.getString("TXB_DQFS")==null?"":rsbody.getString("TXB_DQFS");
					TXB_DQTB_FS = rsbody.getString("TXB_DQTB_FS")==null?"":rsbody.getString("TXB_DQTB_FS");
					TXB_BZFS = rsbody.getString("TXB_BZFS")==null?"":rsbody.getString("TXB_BZFS");
					TXB_LJFS = rsbody.getString("TXB_LJFS")==null?"":rsbody.getString("TXB_LJFS");
					TXB_LJTB_SQ = rsbody.getString("TXB_LJTB_SQ")==null?"":rsbody.getString("TXB_LJTB_SQ");
					TXB_LJTB_SZ = rsbody.getString("TXB_LJTB_SZ")==null?"":rsbody.getString("TXB_LJTB_SZ");
					TXB_DQFZ = rsbody.getString("TXB_DQFZ")==null?"":rsbody.getString("TXB_DQFZ");
					TXB_DQTB_FZ = rsbody.getString("TXB_DQTB_FZ")==null?"":rsbody.getString("TXB_DQTB_FZ");
					TXB_BZWC = rsbody.getString("TXB_BZWC")==null?"":rsbody.getString("TXB_BZWC");
					TXB_LJFZ = rsbody.getString("TXB_LJFZ")==null?"":rsbody.getString("TXB_LJFZ");
					TXB_LJTB_FZ = rsbody.getString("TXB_LJTB_FZ")==null?"":rsbody.getString("TXB_LJTB_FZ");
					TXB_FZXG = rsbody.getString("TXB_FZXG")==null?"":rsbody.getString("TXB_FZXG");
					TXB_RXFZ = rsbody.getString("TXB_RXFZ")==null?"":rsbody.getString("TXB_RXFZ");
					TXB_PJMD = rsbody.getString("TXB_PJMD")==null?"":rsbody.getString("TXB_PJMD");
					TXB_ZGMD = rsbody.getString("TXB_ZGMD")==null?"":rsbody.getString("TXB_ZGMD");
					TXB_FSQY = rsbody.getString("TXB_FSQY")==null?"":rsbody.getString("TXB_FSQY");
					BFB_BZCD = rsbody.getString("BFB_BZCD")==null?"":rsbody.getString("BFB_BZCD");
					BFB_XZCD = rsbody.getString("BFB_XZCD")==null?"":rsbody.getString("BFB_XZCD");
					BFB_DQFS = rsbody.getString("BFB_DQFS")==null?"":rsbody.getString("BFB_DQFS");
					BFB_DQTB_FS = rsbody.getString("BFB_DQTB_FS")==null?"":rsbody.getString("BFB_DQTB_FS");
					BFB_BZFS = rsbody.getString("BFB_BZFS")==null?"":rsbody.getString("BFB_BZFS");
					BFB_LJFS = rsbody.getString("BFB_LJFS")==null?"":rsbody.getString("BFB_LJFS");
					BFB_LJTB_SQ = rsbody.getString("BFB_LJTB_SQ")==null?"":rsbody.getString("BFB_LJTB_SQ");
					BFB_LJTB_SZ = rsbody.getString("BFB_LJTB_SZ")==null?"":rsbody.getString("BFB_LJTB_SZ");
					BFB_DQFZ = rsbody.getString("BFB_DQFZ")==null?"":rsbody.getString("BFB_DQFZ");
					BFB_DQTB_FZ = rsbody.getString("BFB_DQTB_FZ")==null?"":rsbody.getString("BFB_DQTB_FZ");
					BFB_BZWC = rsbody.getString("BFB_BZWC")==null?"":rsbody.getString("BFB_BZWC");
					BFB_LJFZ = rsbody.getString("BFB_LJFZ")==null?"":rsbody.getString("BFB_LJFZ");
					BFB_LJTB_FZ = rsbody.getString("BFB_LJTB_FZ")==null?"":rsbody.getString("BFB_LJTB_FZ");
					BFB_FZXG = rsbody.getString("BFB_FZXG")==null?"":rsbody.getString("BFB_FZXG");
					BFB_RXFZ = rsbody.getString("BFB_RXFZ")==null?"":rsbody.getString("BFB_RXFZ");
					BFB_PJMD = rsbody.getString("BFB_PJMD")==null?"":rsbody.getString("BFB_PJMD");
					BFB_ZGMD = rsbody.getString("BFB_ZGMD")==null?"":rsbody.getString("BFB_ZGMD");
					BFB_FSQY = rsbody.getString("BFB_FSQY")==null?"":rsbody.getString("BFB_FSQY");
					WKB_BZCD = rsbody.getString("WKB_BZCD")==null?"":rsbody.getString("WKB_BZCD");
					WKB_XZCD = rsbody.getString("WKB_XZCD")==null?"":rsbody.getString("WKB_XZCD");
					WKB_DQFS = rsbody.getString("WKB_DQFS")==null?"":rsbody.getString("WKB_DQFS");
					WKB_DQTB_FS = rsbody.getString("WKB_DQTB_FS")==null?"":rsbody.getString("WKB_DQTB_FS");
					WKB_BZFS = rsbody.getString("WKB_BZFS")==null?"":rsbody.getString("WKB_BZFS");
					WKB_LJFS = rsbody.getString("WKB_LJFS")==null?"":rsbody.getString("WKB_LJFS");
					WKB_LJTB_SQ = rsbody.getString("WKB_LJTB_SQ")==null?"":rsbody.getString("WKB_LJTB_SQ");
					WKB_LJTB_SZ = rsbody.getString("WKB_LJTB_SZ")==null?"":rsbody.getString("WKB_LJTB_SZ");
					WKB_DQFZ = rsbody.getString("WKB_DQFZ")==null?"":rsbody.getString("WKB_DQFZ");
					WKB_DQTB_FZ = rsbody.getString("WKB_DQTB_FZ")==null?"":rsbody.getString("WKB_DQTB_FZ");
					WKB_BZWC = rsbody.getString("WKB_BZWC")==null?"":rsbody.getString("WKB_BZWC");
					WKB_LJFZ = rsbody.getString("WKB_LJFZ")==null?"":rsbody.getString("WKB_LJFZ");
					WKB_LJTB_FZ = rsbody.getString("WKB_LJTB_FZ")==null?"":rsbody.getString("WKB_LJTB_FZ");
					WKB_FZXG = rsbody.getString("WKB_FZXG")==null?"":rsbody.getString("WKB_FZXG");
					WKB_RXFZ = rsbody.getString("WKB_RXFZ")==null?"":rsbody.getString("WKB_RXFZ");
					WKB_PJMD = rsbody.getString("WKB_PJMD")==null?"":rsbody.getString("WKB_PJMD");
					WKB_ZGMD = rsbody.getString("WKB_ZGMD")==null?"":rsbody.getString("WKB_ZGMD");
					WKB_FSQY = rsbody.getString("WKB_FSQY")==null?"":rsbody.getString("WKB_FSQY");
					CMB_BZCD = rsbody.getString("CMB_BZCD")==null?"":rsbody.getString("CMB_BZCD");
					CMB_XZCD = rsbody.getString("CMB_XZCD")==null?"":rsbody.getString("CMB_XZCD");
					CMB_DQFS = rsbody.getString("CMB_DQFS")==null?"":rsbody.getString("CMB_DQFS");
					CMB_DQTB_FS = rsbody.getString("CMB_DQTB_FS")==null?"":rsbody.getString("CMB_DQTB_FS");
					CMB_BZFS = rsbody.getString("CMB_BZFS")==null?"":rsbody.getString("CMB_BZFS");
					CMB_LJFS = rsbody.getString("CMB_LJFS")==null?"":rsbody.getString("CMB_LJFS");
					CMB_LJTB_SQ = rsbody.getString("CMB_LJTB_SQ")==null?"":rsbody.getString("CMB_LJTB_SQ");
					CMB_LJTB_SZ = rsbody.getString("CMB_LJTB_SZ")==null?"":rsbody.getString("CMB_LJTB_SZ");
					CMB_DQFZ = rsbody.getString("CMB_DQFZ")==null?"":rsbody.getString("CMB_DQFZ");
					CMB_DQTB_FZ = rsbody.getString("CMB_DQTB_FZ")==null?"":rsbody.getString("CMB_DQTB_FZ");
					CMB_BZWC = rsbody.getString("CMB_BZWC")==null?"":rsbody.getString("CMB_BZWC");
					CMB_LJFZ = rsbody.getString("CMB_LJFZ")==null?"":rsbody.getString("CMB_LJFZ");
					CMB_LJTB_FZ = rsbody.getString("CMB_LJTB_FZ")==null?"":rsbody.getString("CMB_LJTB_FZ");
					CMB_FZXG = rsbody.getString("CMB_FZXG")==null?"":rsbody.getString("CMB_FZXG");
					CMB_RXFZ = rsbody.getString("CMB_RXFZ")==null?"":rsbody.getString("CMB_RXFZ");
					CMB_PJMD = rsbody.getString("CMB_PJMD")==null?"":rsbody.getString("CMB_PJMD");
					CMB_ZGMD = rsbody.getString("CMB_ZGMD")==null?"":rsbody.getString("CMB_ZGMD");
					CMB_FSQY = rsbody.getString("CMB_FSQY")==null?"":rsbody.getString("CMB_FSQY");
					SYQ = rsbody.getString("SYQ")==null?"":rsbody.getString("SYQ");
					FSQK = rsbody.getString("FSQK")==null?"":rsbody.getString("FSQK");
					FKQK = rsbody.getString("FKQK")==null?"":rsbody.getString("FKQK");
					FKFX = rsbody.getString("FKFX")==null?"":rsbody.getString("FKFX");
					HJ_BZCD = rsbody.getString("HJ_BZCD")==null?"":rsbody.getString("HJ_BZCD");
					HJ_XZCD = rsbody.getString("HJ_XZCD")==null?"":rsbody.getString("HJ_XZCD");
					HJ_DQFS = rsbody.getString("HJ_DQFS")==null?"":rsbody.getString("HJ_DQFS");
					HJ_LJFS = rsbody.getString("HJ_LJFS")==null?"":rsbody.getString("HJ_LJFS");
					HJ_DQTB_FS = rsbody.getString("HJ_DQTB_FS")==null?"":rsbody.getString("HJ_DQTB_FS");
					HJ_BZFS = rsbody.getString("HJ_BZFS")==null?"":rsbody.getString("HJ_BZFS");
					HJ_LJTB_SQ = rsbody.getString("HJ_LJTB_SQ")==null?"":rsbody.getString("HJ_LJTB_SQ");
					HJ_LJTB_SZ = rsbody.getString("HJ_LJTB_SZ")==null?"":rsbody.getString("HJ_LJTB_SZ");
					HJ_DQFZ = rsbody.getString("HJ_DQFZ")==null?"":rsbody.getString("HJ_DQFZ");
					HJ_DQTB_FZ = rsbody.getString("HJ_DQTB_FZ")==null?"":rsbody.getString("HJ_DQTB_FZ");
					HJ_BZWC = rsbody.getString("HJ_BZWC")==null?"":rsbody.getString("HJ_BZWC");
					HJ_LJFZ = rsbody.getString("HJ_LJFZ")==null?"":rsbody.getString("HJ_LJFZ");
					HJ_LJTB_FZ = rsbody.getString("HJ_LJTB_FZ")==null?"":rsbody.getString("HJ_LJTB_FZ");
					HJ_FZXG = rsbody.getString("HJ_FZXG")==null?"":rsbody.getString("HJ_FZXG");
					HJ_RXFZ = rsbody.getString("HJ_RXFZ")==null?"":rsbody.getString("HJ_RXFZ");
					HJ_PJMD = rsbody.getString("HJ_PJMD")==null?"":rsbody.getString("HJ_PJMD");
					HJ_ZGMD = rsbody.getString("HJ_ZGMD")==null?"":rsbody.getString("HJ_ZGMD");
					HJ_FSQY = rsbody.getString("HJ_FSQY")==null?"":rsbody.getString("HJ_FSQY");
					JFNO = rsbody.getString("JFNO")==null?"":rsbody.getString("JFNO");
					KSTBRQ = rsbody.getString("KSTBRQ")==null?"":rsbody.getString("KSTBRQ");
					JZTBRQ = rsbody.getString("JZTBRQ")==null?"":rsbody.getString("JZTBRQ");
					BBLX = rsbody.getString("BBLX")==null?"":rsbody.getString("BBLX");
					BMBM = rsbody.getString("BMBM")==null?"":rsbody.getString("BMBM");
					LRRY = rsbody.getString("LRRY")==null?"":rsbody.getString("LRRY");
					RWSJ = rsbody.getString("RWSJ")==null?"":rsbody.getString("RWSJ");
					LRRQ = rsbody.getString("LRRQ").substring(0, rsbody.getString("LRRQ").length()-2)==null?"":rsbody.getString("LRRQ");
					DCRQ = rsbody.getString("DCRQ").substring(0, rsbody.getString("DCRQ").length()-10)==null?"":rsbody.getString("DCRQ");
					XJC_PJMD_YC = rsbody.getString("XJC_PJMD_YC")==null?"":rsbody.getString("XJC_PJMD_YC");
					XJC_ZGMD_YC = rsbody.getString("XJC_ZGMD_YC")==null?"":rsbody.getString("XJC_ZGMD_YC");
					XJC_PJMD_CC = rsbody.getString("XJC_PJMD_CC")==null?"":rsbody.getString("XJC_PJMD_CC");
					XJC_ZGMD_CC = rsbody.getString("XJC_ZGMD_CC")==null?"":rsbody.getString("XJC_ZGMD_CC");
					XJC_PJMD_WHL = rsbody.getString("XJC_PJMD_WHL")==null?"":rsbody.getString("XJC_PJMD_WHL");
					XJC_ZGMD_WHL = rsbody.getString("XJC_ZGMD_WHL")==null?"":rsbody.getString("XJC_ZGMD_WHL");
					XJC_PJMD_BHCL = rsbody.getString("XJC_PJMD_BHCL")==null?"":rsbody.getString("XJC_PJMD_BHCL");
					XJC_ZGMD_BHCL = rsbody.getString("XJC_ZGMD_BHCL")==null?"":rsbody.getString("XJC_ZGMD_BHCL");
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
		<input name="JFID" type="hidden" value="<%=jfid%>" />
		<input name="KSTBRQ" type="hidden" value="<%=kstbrq%>" /> 
		<input name="RWSJ" type="hidden" value="<%=rwsj%>" /> 
		<input name="JZTBRQ" type="hidden" value="<%=jztbrq%>" /> 
		<input name="lb" type="hidden" value="<%=lb%>" /> 
		<input name="zbid" type="hidden" value="<%=zbid%>" />
		<input name="rwid" type="hidden" value="<%=rwid%>" />
		<input name="ZT" type="hidden" value="0" />
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td colspan=5 rowspan=1
					style="text-align:center;font-size=30;width: ;height: "><b>С�󲡳��ܱ���(<%=rwsj %>)</b><br>
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
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��������</b></td>
					<td colspan=2 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�����̶�</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��ǰ�������</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��ǰ�������������ͬ������%</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>���������������</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�ۼƷ������</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�ۼƷ������������ͬ������%</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�ۼƷ����������������%</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��ǰ��������</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��ǰ��������������ͬ������%</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>������ɷ������</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�ۼƷ������</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>�ۼƷ������������ͬ������%</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>����Ч��%</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��ǰ����������</b></td>
					<td colspan=2 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>ƽ���ܶ�</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>����ܶ�</b></td>
					<td colspan=1 rowspan=2
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>��Ҫ��������</b></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>����</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>����</b></td>
				</tr>
			</tbody>
			<tbody id="zg_body">
				<tr>
					<td>�ϼ�</td>
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
					<td>����</td>
					<td><label><%=YC_BZCD%>��</label></td>
					<td><label><%=YC_XZCD%>��</label></td>
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
					<td>��������(ͷ/����)</td>
					<td><label><%=YC_PJMD%></label></td>
					<td><label><%=YC_ZGMD%></label></td>
					<td><label><%=YC_FSQY%></label></td>
				</tr>
				<tr>
					<td rowspan="5">������</td>
					<td rowspan="5"><label><%=XJC_BZCD%>��</label></td>
					<td rowspan="5"><label><%=XJC_XZCD%>��</label></td>
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
					<td>�׳�������ÿ����������ͷ/������</td>
					<td><label><%=XJC_PJMD_YC%></label></td>
					<td><label><%=XJC_ZGMD_YC%></label></td>
					<td rowspan="4"><label><%=XJC_FSQY%></label></td>
				</tr>
				<tr>
					<td>�ɳ棺�ٸ���������ͷ/�ٸ�����</td>
					<td><label><%=XJC_PJMD_CC%></label></td>
					<td><label><%=XJC_ZGMD_CC%></label></td>
				</tr>
				<tr>
					<td>Σ���ڣ������ʣ�%��</td>
					<td><label><%=XJC_PJMD_WHL%></label></td>
					<td><label><%=XJC_ZGMD_WHL%></label></td>
				</tr>
				<tr>
					<td>Σ���ڣ����������ͷ/���룩</td>
					<td><label><%=XJC_PJMD_BHCL%></label></td>
					<td><label><%=XJC_ZGMD_BHCL%></label></td>
				</tr>
				<tr>
					<td>��֩��</td>
					<td><label><%=MZZ_BZCD%>��</label></td>
					<td><label><%=MZZ_XZCD%>��</label></td>
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
					<td>ÿ�ߵ��г�����ͷ/��/�У�</td>
					<td><label><%=MZZ_PJMD%></label></td>
					<td><label><%=MZZ_ZGMD%></label></td>
					<td><label><%=MZZ_FSQY%></label></td>
				</tr>
				<tr>
					<td>���ⲡ</td>
					<td><label><%=TXB_BZCD%>��</label></td>
					<td><label><%=TXB_XZCD%>��</label></td>
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
					<td>��Ҷ�ʣ�%��</td>
					<td><label><%=TXB_PJMD%></label></td>
					<td><label><%=TXB_ZGMD%></label></td>
					<td><label><%=TXB_FSQY%></label></td>
				</tr>
				<tr>
					<td>�׷۲�</td>
					<td><label><%=BFB_BZCD%>��</label></td>
					<td><label><%=BFB_XZCD%>��</label></td>
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
					<td>��Ҷ�ʣ�%��</td>
					<td><label><%=BFB_PJMD%></label></td>
					<td><label><%=BFB_ZGMD%></label></td>
					<td><label><%=BFB_FSQY%></label></td>
				</tr>
				<tr>
					<td>�ƿݲ�</td>
					<td><label><%=WKB_BZCD%>��</label></td>
					<td><label><%=WKB_XZCD%>��</label></td>
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
					<td>�����ʣ�%��</td>
					<td><label><%=WKB_PJMD%></label></td>
					<td><label><%=WKB_ZGMD%></label></td>
					<td><label><%=WKB_FSQY%></label></td>
				</tr>
				<tr>
					<td>��ù��</td>
					<td><label><%=CMB_BZCD%>��</label></td>
					<td><label><%=CMB_XZCD%>��</label></td>
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
					<td>�����ʣ�%��</td>
					<td><label><%=CMB_PJMD%></label></td>
					<td><label><%=CMB_ZGMD%></label></td>
					<td><label><%=CMB_FSQY%></label></td>
				</tr>
			</tbody>
			<tr>
				<td>С��������</td>
				<td colspan="19"><label><%=SYQ%></label></td>
			</tr>
			<tr>
				<td>��������ſ�</td>
				<td colspan="19"><label><%=FSQK%></label></td>
			</tr>
			<tr>
				<td>��������ſ�</td>
				<td colspan="19"><label><%=FKQK%></label></td>
			</tr>
			<tr>
				<td>�½׶η����������Ʒ���</td>
				<td colspan="19"><label><%=FKFX%></label></td>
			</tr>
		</table>
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">¼����Ա��<%=LRRY %></td>
				<td style="padding-left: 100px;padding-right: 100px;">¼�����ڣ�<%=LRRQ %></td>
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
		xzsel('YC_BZCD','<%=YC_BZCD%>');
		xzsel('YC_XZCD','<%=YC_XZCD%>');
		xzsel('XJC_BZCD','<%=XJC_BZCD%>');
		xzsel('XJC_XZCD','<%=XJC_XZCD%>');
		xzsel('MZZ_BZCD','<%=MZZ_BZCD%>');
		xzsel('MZZ_XZCD','<%=MZZ_XZCD%>');
		xzsel('TXB_BZCD','<%=TXB_BZCD%>');
		xzsel('TXB_XZCD','<%=TXB_XZCD%>');
		xzsel('BFB_BZCD','<%=BFB_BZCD%>');
		xzsel('BFB_XZCD','<%=BFB_XZCD%>');
		xzsel('WKB_BZCD','<%=WKB_BZCD%>');
		xzsel('WKB_XZCD','<%=WKB_XZCD%>');
		xzsel('CMB_BZCD','<%=CMB_BZCD%>');
		xzsel('CMB_XZCD','<%=CMB_XZCD%>');
    });
	function zt(zt) {
		$("input[name='ZT']").val(zt);
		if (jysz()) {
			$("#f1").submit();
		}
	}
	function dc() {
		if (jysz()) {
			$("#f1").submit();
		}
	}
	function dqfsmj(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YC_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_DQFS']").val());
			}
			if ($("input[name='XJC_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_DQFS']").val());
			}
			if ($("input[name='MZZ_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_DQFS']").val());
			}
			if ($("input[name='TXB_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_DQFS']").val());
			}
			if ($("input[name='BFB_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_DQFS']").val());
			}
			if ($("input[name='WKB_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_DQFS']").val());
			}
			if ($("input[name='CMB_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_DQFS']").val());
			}
			$("input[name='HJ_DQFS']").val(zh);
		} else {
			alert("����������");
			obj.value = "";
			if ($("input[name='YC_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_DQFS']").val());
			}
			if ($("input[name='XJC_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_DQFS']").val());
			}
			if ($("input[name='MZZ_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_DQFS']").val());
			}
			if ($("input[name='TXB_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_DQFS']").val());
			}
			if ($("input[name='BFB_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_DQFS']").val());
			}
			if ($("input[name='WKB_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_DQFS']").val());
			}
			if ($("input[name='CMB_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_DQFS']").val());
			}
			$("input[name='HJ_DQFS']").val(zh);
		}
	}
	function bzfs(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YC_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_BZFS']").val());
			}
			if ($("input[name='XJC_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_BZFS']").val());
			}
			if ($("input[name='MZZ_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_BZFS']").val());
			}
			if ($("input[name='TXB_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_BZFS']").val());
			}
			if ($("input[name='BFB_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_BZFS']").val());
			}
			if ($("input[name='WKB_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_BZFS']").val());
			}
			if ($("input[name='CMB_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_BZFS']").val());
			}
			$("input[name='HJ_BZFS']").val(zh);
		} else {
			alert("����������");
			obj.value = "";
			if ($("input[name='YC_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_BZFS']").val());
			}
			if ($("input[name='XJC_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_BZFS']").val());
			}
			if ($("input[name='MZZ_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_BZFS']").val());
			}
			if ($("input[name='TXB_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_BZFS']").val());
			}
			if ($("input[name='BFB_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_BZFS']").val());
			}
			if ($("input[name='WKB_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_BZFS']").val());
			}
			if ($("input[name='CMB_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_BZFS']").val());
			}
			$("input[name='HJ_BZFS']").val(zh);
		}
	}
	function ljfs(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YC_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_LJFS']").val());
			}
			if ($("input[name='XJC_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_LJFS']").val());
			}
			if ($("input[name='MZZ_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_LJFS']").val());
			}
			if ($("input[name='TXB_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_LJFS']").val());
			}
			if ($("input[name='BFB_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_LJFS']").val());
			}
			if ($("input[name='WKB_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_LJFS']").val());
			}
			if ($("input[name='CMB_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_LJFS']").val());
			}
			$("input[name='HJ_LJFS']").val(zh);
		} else {
			alert("����������");
			obj.value = "";
			if ($("input[name='YC_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_LJFS']").val());
			}
			if ($("input[name='XJC_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_LJFS']").val());
			}
			if ($("input[name='MZZ_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_LJFS']").val());
			}
			if ($("input[name='TXB_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_LJFS']").val());
			}
			if ($("input[name='BFB_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_LJFS']").val());
			}
			if ($("input[name='WKB_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_LJFS']").val());
			}
			if ($("input[name='CMB_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_LJFS']").val());
			}
			$("input[name='HJ_LJFS']").val(zh);
		}
	}
	function dqfz(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YC_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_DQFZ']").val());
			}
			if ($("input[name='XJC_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_DQFZ']").val());
			}
			if ($("input[name='MZZ_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_DQFZ']").val());
			}
			if ($("input[name='TXB_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_DQFZ']").val());
			}
			if ($("input[name='BFB_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_DQFZ']").val());
			}
			if ($("input[name='WKB_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_DQFZ']").val());
			}
			if ($("input[name='CMB_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_DQFZ']").val());
			}
			$("input[name='HJ_DQFZ']").val(zh);
		} else {
			alert("����������");
			obj.value = "";
			if ($("input[name='YC_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_DQFZ']").val());
			}
			if ($("input[name='XJC_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_DQFZ']").val());
			}
			if ($("input[name='MZZ_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_DQFZ']").val());
			}
			if ($("input[name='TXB_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_DQFZ']").val());
			}
			if ($("input[name='BFB_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_DQFZ']").val());
			}
			if ($("input[name='WKB_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_DQFZ']").val());
			}
			if ($("input[name='CMB_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_DQFZ']").val());
			}
			$("input[name='HJ_DQFZ']").val(zh);
		}
	}
	function bzwc(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YC_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_BZWC']").val());
			}
			if ($("input[name='XJC_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_BZWC']").val());
			}
			if ($("input[name='MZZ_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_BZWC']").val());
			}
			if ($("input[name='TXB_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_BZWC']").val());
			}
			if ($("input[name='BFB_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_BZWC']").val());
			}
			if ($("input[name='WKB_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_BZWC']").val());
			}
			if ($("input[name='CMB_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_BZWC']").val());
			}
			$("input[name='HJ_BZWC']").val(zh);
		} else {
			alert("����������");
			obj.value = "";
			if ($("input[name='YC_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_BZWC']").val());
			}
			if ($("input[name='XJC_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_BZWC']").val());
			}
			if ($("input[name='MZZ_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_BZWC']").val());
			}
			if ($("input[name='TXB_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_BZWC']").val());
			}
			if ($("input[name='BFB_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_BZWC']").val());
			}
			if ($("input[name='WKB_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_BZWC']").val());
			}
			if ($("input[name='CMB_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_BZWC']").val());
			}
			$("input[name='HJ_BZWC']").val(zh);
		}
	}
	function ljfz(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YC_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_LJFZ']").val());
			}
			if ($("input[name='XJC_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_LJFZ']").val());
			}
			if ($("input[name='MZZ_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_LJFZ']").val());
			}
			if ($("input[name='TXB_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_LJFZ']").val());
			}
			if ($("input[name='BFB_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_LJFZ']").val());
			}
			if ($("input[name='WKB_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_LJFZ']").val());
			}
			if ($("input[name='CMB_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_LJFZ']").val());
			}
			$("input[name='HJ_LJFZ']").val(zh);
		} else {
			alert("����������");
			obj.value = "";
			if ($("input[name='YC_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_LJFZ']").val());
			}
			if ($("input[name='XJC_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_LJFZ']").val());
			}
			if ($("input[name='MZZ_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_LJFZ']").val());
			}
			if ($("input[name='TXB_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_LJFZ']").val());
			}
			if ($("input[name='BFB_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_LJFZ']").val());
			}
			if ($("input[name='WKB_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_LJFZ']").val());
			}
			if ($("input[name='CMB_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_LJFZ']").val());
			}
			$("input[name='HJ_LJFZ']").val(zh);
		}
	}
	function rxfz(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YC_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_RXFZ']").val());
			}
			if ($("input[name='XJC_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_RXFZ']").val());
			}
			if ($("input[name='MZZ_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_RXFZ']").val());
			}
			if ($("input[name='TXB_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_RXFZ']").val());
			}
			if ($("input[name='BFB_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_RXFZ']").val());
			}
			if ($("input[name='WKB_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_RXFZ']").val());
			}
			if ($("input[name='CMB_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_RXFZ']").val());
			}
			$("input[name='HJ_RXFZ']").val(zh);
		} else {
			alert("����������");
			obj.value = "";
			if ($("input[name='YC_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_RXFZ']").val());
			}
			if ($("input[name='XJC_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_RXFZ']").val());
			}
			if ($("input[name='MZZ_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_RXFZ']").val());
			}
			if ($("input[name='TXB_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_RXFZ']").val());
			}
			if ($("input[name='BFB_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_RXFZ']").val());
			}
			if ($("input[name='WKB_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_RXFZ']").val());
			}
			if ($("input[name='CMB_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_RXFZ']").val());
			}
			$("input[name='HJ_RXFZ']").val(zh);
		}
	}
	function pjmd(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YC_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_PJMD']").val());
			}
			if ($("input[name='XJC_PJMD_YC']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_PJMD_YC']").val());
			}
			if ($("input[name='XJC_PJMD_CC']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_PJMD_CC']").val());
			}
			if ($("input[name='XJC_PJMD_WHL']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_PJMD_WHL']").val());
			}
			if ($("input[name='XJC_PJMD_WHT']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_PJMD_WHT']").val());
			}
			if ($("input[name='MZZ_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_PJMD']").val());
			}
			if ($("input[name='TXB_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_PJMD']").val());
			}
			if ($("input[name='BFB_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_PJMD']").val());
			}
			if ($("input[name='WKB_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_PJMD']").val());
			}
			if ($("input[name='CMB_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_PJMD']").val());
			}
			$("input[name='HJ_PJMD']").val(zh);
		} else {
			alert("����������");
			obj.value = "";
			if ($("input[name='YC_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_PJMD']").val());
			}
			if ($("input[name='XJC_PJMD_YC']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_PJMD_YC']").val());
			}
			if ($("input[name='XJC_PJMD_CC']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_PJMD_CC']").val());
			}
			if ($("input[name='XJC_PJMD_WHL']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_PJMD_WHL']").val());
			}
			if ($("input[name='XJC_PJMD_WHT']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_PJMD_WHT']").val());
			}
			if ($("input[name='MZZ_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_PJMD']").val());
			}
			if ($("input[name='TXB_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_PJMD']").val());
			}
			if ($("input[name='BFB_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_PJMD']").val());
			}
			if ($("input[name='WKB_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_PJMD']").val());
			}
			if ($("input[name='CMB_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_PJMD']").val());
			}
			$("input[name='HJ_PJMD']").val(zh);
		}
	}
	function zgmd(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YC_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_ZGMD']").val());
			}
			if ($("input[name='XJC_ZGMD_YC']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_ZGMD_YC']").val());
			}
			if ($("input[name='XJC_ZGMD_CC']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_ZGMD_CC']").val());
			}
			if ($("input[name='XJC_ZGMD_WHL']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_ZGMD_WHL']").val());
			}
			if ($("input[name='XJC_ZGMD_WHT']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_ZGMD_WHT']").val());
			}
			if ($("input[name='MZZ_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_ZGMD']").val());
			}
			if ($("input[name='TXB_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_ZGMD']").val());
			}
			if ($("input[name='BFB_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_ZGMD']").val());
			}
			if ($("input[name='WKB_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_ZGMD']").val());
			}
			if ($("input[name='CMB_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_ZGMD']").val());
			}
			$("input[name='HJ_ZGMD']").val(zh);
		} else {
			alert("����������");
			obj.value = "";
			if ($("input[name='YC_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_ZGMD']").val());
			}
			if ($("input[name='XJC_ZGMD_YC']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_ZGMD_YC']").val());
			}
			if ($("input[name='XJC_ZGMD_CC']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_ZGMD_CC']").val());
			}
			if ($("input[name='XJC_ZGMD_WHL']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_ZGMD_WHL']").val());
			}
			if ($("input[name='XJC_ZGMD_WHT']").val() != "") {
				zh = zh + parseFloat($("input[name='XJC_ZGMD_WHT']").val());
			}
			if ($("input[name='MZZ_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='MZZ_ZGMD']").val());
			}
			if ($("input[name='TXB_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='TXB_ZGMD']").val());
			}
			if ($("input[name='BFB_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_ZGMD']").val());
			}
			if ($("input[name='WKB_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='WKB_ZGMD']").val());
			}
			if ($("input[name='CMB_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='CMB_ZGMD']").val());
			}
			$("input[name='HJ_ZGMD']").val(zh);
		}
	}
</script>
</html>