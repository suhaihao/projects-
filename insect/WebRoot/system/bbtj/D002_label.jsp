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
		String YDYMM_BZCD="";
		String YDYMM_XZCD="";
		String YDYMM_DQFS="";
		String YDYMM_DQTB_FS="";
		String YDYMM_BZFS="";
		String YDYMM_LJFS="";
		String YDYMM_LJTB_SQ="";
		String YDYMM_LJTB_SZ="";
		String YDYMM_DQFZ="";
		String YDYMM_DQTB_FZ="";
		String YDYMM_BZWC="";
		String YDYMM_LJFZ="";
		String YDYMM_LJTB_FZ="";
		String YDYMM_FZXG="";
		String YDYMM_RXFZ="";
		String YDYMM_PJMD_BH="";
		String YDYMM_ZGMD_BH="";
		String YDYMM_FSQY="";
		String EDYMM_BZCD="";
		String EDYMM_XZCD="";
		String EDYMM_DQFS="";
		String EDYMM_DQTB_FS="";
		String EDYMM_BZFS="";
		String EDYMM_LJFS="";
		String EDYMM_LJTB_SQ="";
		String EDYMM_LJTB_SZ="";
		String EDYMM_DQFZ="";
		String EDYMM_DQTB_FZ="";
		String EDYMM_BZWC="";
		String EDYMM_LJFZ="";
		String EDYMM_LJTB_FZ="";
		String EDYMM_FZXG="";
		String EDYMM_RXFZ="";
		String EDYMM_PJMD_BH="";
		String EDYMM_ZGMD_BH="";
		String EDYMM_FSQY="";
		String SDYMM_BZCD="";
		String SDYMM_XZCD="";
		String SDYMM_DQFS="";
		String SDYMM_DQTB_FS="";
		String SDYMM_BZFS="";
		String SDYMM_LJFS="";
		String SDYMM_LJTB_SQ="";
		String SDYMM_LJTB_SZ="";
		String SDYMM_DQFZ="";
		String SDYMM_DQTB_FZ="";
		String SDYMM_BZWC="";
		String SDYMM_LJFZ="";
		String SDYMM_LJTB_FZ="";
		String SDYMM_FZXG="";
		String SDYMM_RXFZ="";
		String SDYMM_PJMD_BH="";
		String SDYMM_ZGMD_BH="";
		String SDYMM_FSQY="";
		String EDNC_BZCD="";
		String EDNC_XZCD="";
		String EDNC_DQFS="";
		String EDNC_DQTB_FS="";
		String EDNC_BZFS="";
		String EDNC_LJFS="";
		String EDNC_LJTB_SQ="";
		String EDNC_LJTB_SZ="";
		String EDNC_DQFZ="";
		String EDNC_DQTB_FZ="";
		String EDNC_BZWC="";
		String EDNC_LJFZ="";
		String EDNC_LJTB_FZ="";
		String EDNC_FZXG="";
		String EDNC_RXFZ="";
		String EDNC_PJMD_YM="";
		String EDNC_ZGMD_YM="";
		String EDNC_FSQY="";
		String SDNC_BZCD="";
		String SDNC_XZCD="";
		String SDNC_DQFS="";
		String SDNC_DQTB_FS="";
		String SDNC_BZFS="";
		String SDNC_LJFS="";
		String SDNC_LJTB_SQ="";
		String SDNC_LJTB_SZ="";
		String SDNC_DQFZ="";
		String SDNC_DQTB_FZ="";
		String SDNC_BZWC="";
		String SDNC_LJFZ="";
		String SDNC_LJTB_FZ="";
		String SDNC_FZXG="";
		String SDNC_RXFZ="";
		String SDNC_PJMD_YM="";
		String SDNC_ZGMD_YM="";
		String SDNC_FSQY="";
		String YC_BZCD="";
		String YC_XZCD="";
		String YC_DQFS="";
		String YC_DQTB_FS="";
		String YC_BZFS="";
		String YC_LJFS="";
		String YC_LJTB_SQ="";
		String YC_LJTB_SZ="";
		String YC_DQFZ="";
		String YC_DQTB_FZ="";
		String YC_BZWC="";
		String YC_LJFZ="";
		String YC_LJTB_FZ="";
		String YC_FZXG="";
		String YC_RXFZ="";
		String YC_PJMD="";
		String YC_ZGMD="";
		String YC_FSQY="";
		String EDMLC_BZCD="";
		String EDMLC_XZCD="";
		String EDMLC_DQFS="";
		String EDMLC_DQTB_FS="";
		String EDMLC_BZFS="";
		String EDMLC_LJFS="";
		String EDMLC_LJTB_SQ="";
		String EDMLC_LJTB_SZ="";
		String EDMLC_DQFZ="";
		String EDMLC_DQTB_FZ="";
		String EDMLC_BZWC="";
		String EDMLC_LJFZ="";
		String EDMLC_LJTB_FZ="";
		String EDMLC_FZXG="";
		String EDMLC_RXFZ="";
		String EDMLC_PJMD="";
		String EDMLC_ZGMD="";
		String EDMLC_FSQY="";
		String SDMLC_BZCD="";
		String SDMLC_XZCD="";
		String SDMLC_DQFS="";
		String SDMLC_DQTB_FS="";
		String SDMLC_BZFS="";
		String SDMLC_LJFS="";
		String SDMLC_LJTB_SQ="";
		String SDMLC_LJTB_SZ="";
		String SDMLC_DQFZ="";
		String SDMLC_DQTB_FZ="";
		String SDMLC_BZWC="";
		String SDMLC_LJFZ="";
		String SDMLC_LJTB_FZ="";
		String SDMLC_FZXG="";
		String SDMLC_RXFZ="";
		String SDMLC_PJMD="";
		String SDMLC_ZGMD="";
		String SDMLC_FSQY="";
		String FDMLC_BZCD="";
		String FDMLC_XZCD="";
		String FDMLC_DQFS="";
		String FDMLC_DQTB_FS="";
		String FDMLC_BZFS="";
		String FDMLC_LJFS="";
		String FDMLC_LJTB_SQ="";
		String FDMLC_LJTB_SZ="";
		String FDMLC_DQFZ="";
		String FDMLC_DQTB_FZ="";
		String FDMLC_BZWC="";
		String FDMLC_LJFZ="";
		String FDMLC_LJTB_FZ="";
		String FDMLC_FZXG="";
		String FDMLC_RXFZ="";
		String FDMLC_PJMD="";
		String FDMLC_ZGMD="";
		String FDMLC_FSQY="";
		String DBB_BZCD="";
		String DBB_XZCD="";
		String DBB_DQFS="";
		String DBB_DQTB_FS="";
		String DBB_BZFS="";
		String DBB_LJFS="";
		String DBB_LJTB_SQ="";
		String DBB_LJTB_SZ="";
		String DBB_DQFZ="";
		String DBB_DQTB_FZ="";
		String DBB_BZWC="";
		String DBB_LJFZ="";
		String DBB_LJTB_FZ="";
		String DBB_FZXG="";
		String DBB_RXFZ="";
		String DBB_PJMD="";
		String DBB_ZGMD="";
		String DBB_FSQY="";
		String XBB_BZCD="";
		String XBB_XZCD="";
		String XBB_DQFS="";
		String XBB_DQTB_FS="";
		String XBB_BZFS="";
		String XBB_LJFS="";
		String XBB_LJTB_SQ="";
		String XBB_LJTB_SZ="";
		String XBB_DQFZ="";
		String XBB_DQTB_FZ="";
		String XBB_BZWC="";
		String XBB_LJFZ="";
		String XBB_LJTB_FZ="";
		String XBB_FZXG="";
		String XBB_RXFZ="";
		String XBB_PJMD="";
		String XBB_ZGMD="";
		String XBB_FSQY="";
		String HBB_BZCD="";
		String HBB_XZCD="";
		String HBB_DQFS="";
		String HBB_DQTB_FS="";
		String HBB_BZFS="";
		String HBB_LJFS="";
		String HBB_LJTB_SQ="";
		String HBB_LJTB_SZ="";
		String HBB_DQFZ="";
		String HBB_DQTB_FZ="";
		String HBB_BZWC="";
		String HBB_LJFZ="";
		String HBB_LJTB_FZ="";
		String HBB_FZXG="";
		String HBB_RXFZ="";
		String HBB_PJMD="";
		String HBB_ZGMD="";
		String HBB_FSQY="";
		String XB_BZCD="";
		String XB_XZCD="";
		String XB_DQFS="";
		String XB_DQTB_FS="";
		String XB_BZFS="";
		String XB_LJFS="";
		String XB_LJTB_SQ="";
		String XB_LJTB_SZ="";
		String XB_DQFZ="";
		String XB_DQTB_FZ="";
		String XB_BZWC="";
		String XB_LJFZ="";
		String XB_LJTB_FZ="";
		String XB_FZXG="";
		String XB_RXFZ="";
		String XB_PJMD="";
		String XB_ZGMD="";
		String XB_FSQY="";
		String SYQ="";
		String FSQK="";
		String FKQK="";
		String FKFX="";
		String HJ_BZCD="";
		String HJ_XZCD="";
		String HJ_DQFS="";
		String HJ_DQTB_FS="";
		String HJ_BZFS="";
		String HJ_LJFS="";
		String HJ_LJTB_SQ="";
		String HJ_LJTB_SZ="";
		String HJ_DQFZ="";
		String HJ_DQTB_FZ="";
		String HJ_BZWC="";
		String HJ_LJFZ="";
		String HJ_LJTB_FZ="";
		String HJ_FZXG="";
		String HJ_RXFZ="";
		String HJ_PJMD="";
		String HJ_ZGMD="";
		String HJ_FSQY="";
		String JFNO="";
		String KSTBRQ="";
		String JZTBRQ="";
		String BBLX="";
		String BMBM="";
		String LRRQ="";
		String LRRY="";
		String RWSJ="";
		String ZT="";
		String DCRQ="";
		String YDYMM_PJMD_BZ="";
		String YDYMM_ZGMD_BZ="";
		String EDYMM_PJMD_BZ="";
		String EDYMM_ZGMD_BZ="";
		String SDYMM_PJMD_BZ="";
		String SDYMM_ZGMD_BZ="";
		String EDNC_PJMD_QT="";
		String EDNC_ZGMD_QT="";
		String SDNC_PJMD_QT="";
		String SDNC_ZGMD_QT="";
		if (!bbzt.equals("0")) {
			ExecuteConnection ecbody = new ExecuteConnection();
			PreparedStatement pstmtbody = null;
			ResultSet rsbody = null;
			try {
				String sql = "select * from D002 where jfid=" + jfid;
				pstmtbody = ecbody.con.prepareStatement(sql);
				rsbody = pstmtbody.executeQuery();
				while (rsbody.next()) {
					HJ_DQFS=rsbody.getString("HJ_DQFS")==null?"":rsbody.getString("HJ_DQFS");
					HJ_DQTB_FS=rsbody.getString("HJ_DQTB_FS")==null?"":rsbody.getString("HJ_DQTB_FS");
					HJ_BZFS=rsbody.getString("HJ_BZFS")==null?"":rsbody.getString("HJ_BZFS");
					HJ_LJFS=rsbody.getString("HJ_LJFS")==null?"":rsbody.getString("HJ_LJFS");
					HJ_LJTB_SQ=rsbody.getString("HJ_LJTB_SQ")==null?"":rsbody.getString("HJ_LJTB_SQ");
					HJ_LJTB_SZ=rsbody.getString("HJ_LJTB_SZ")==null?"":rsbody.getString("HJ_LJTB_SZ");
					HJ_DQFZ=rsbody.getString("HJ_DQFZ")==null?"":rsbody.getString("HJ_DQFZ");
					HJ_DQTB_FZ=rsbody.getString("HJ_DQTB_FZ")==null?"":rsbody.getString("HJ_DQTB_FZ");
					HJ_BZWC=rsbody.getString("HJ_BZWC")==null?"":rsbody.getString("HJ_BZWC");
					HJ_LJFZ=rsbody.getString("HJ_LJFZ")==null?"":rsbody.getString("HJ_LJFZ");
					HJ_LJTB_FZ=rsbody.getString("HJ_LJTB_FZ")==null?"":rsbody.getString("HJ_LJTB_FZ");
					HJ_FZXG=rsbody.getString("HJ_FZXG")==null?"":rsbody.getString("HJ_FZXG");
					HJ_RXFZ=rsbody.getString("HJ_RXFZ")==null?"":rsbody.getString("HJ_RXFZ");
					HJ_PJMD=rsbody.getString("HJ_PJMD")==null?"":rsbody.getString("HJ_PJMD");
					HJ_ZGMD=rsbody.getString("HJ_ZGMD")==null?"":rsbody.getString("HJ_ZGMD");
					HJ_FSQY=rsbody.getString("HJ_FSQY")==null?"":rsbody.getString("HJ_FSQY");
					YDYMM_DQFS=rsbody.getString("YDYMM_DQFS")==null?"":rsbody.getString("YDYMM_DQFS");
					YDYMM_DQTB_FS=rsbody.getString("YDYMM_DQTB_FS")==null?"":rsbody.getString("YDYMM_DQTB_FS");
					YDYMM_BZFS=rsbody.getString("YDYMM_BZFS")==null?"":rsbody.getString("YDYMM_BZFS");
					YDYMM_LJFS=rsbody.getString("YDYMM_LJFS")==null?"":rsbody.getString("YDYMM_LJFS");
					YDYMM_LJTB_SQ=rsbody.getString("YDYMM_LJTB_SQ")==null?"":rsbody.getString("YDYMM_LJTB_SQ");
					YDYMM_LJTB_SZ=rsbody.getString("YDYMM_LJTB_SZ")==null?"":rsbody.getString("YDYMM_LJTB_SZ");
					YDYMM_DQFZ=rsbody.getString("YDYMM_DQFZ")==null?"":rsbody.getString("YDYMM_DQFZ");
					YDYMM_DQTB_FZ=rsbody.getString("YDYMM_DQTB_FZ")==null?"":rsbody.getString("YDYMM_DQTB_FZ");
					YDYMM_BZWC=rsbody.getString("YDYMM_BZWC")==null?"":rsbody.getString("YDYMM_BZWC");
					YDYMM_LJFZ=rsbody.getString("YDYMM_LJFZ")==null?"":rsbody.getString("YDYMM_LJFZ");
					YDYMM_LJTB_FZ=rsbody.getString("YDYMM_LJTB_FZ")==null?"":rsbody.getString("YDYMM_LJTB_FZ");
					YDYMM_FZXG=rsbody.getString("YDYMM_FZXG")==null?"":rsbody.getString("YDYMM_FZXG");
					YDYMM_RXFZ=rsbody.getString("YDYMM_RXFZ")==null?"":rsbody.getString("YDYMM_RXFZ");
					YDYMM_PJMD_BH=rsbody.getString("YDYMM_PJMD_BH")==null?"":rsbody.getString("YDYMM_PJMD_BH");
					YDYMM_ZGMD_BH=rsbody.getString("YDYMM_ZGMD_BH")==null?"":rsbody.getString("YDYMM_ZGMD_BH");
					YDYMM_FSQY=rsbody.getString("YDYMM_FSQY")==null?"":rsbody.getString("YDYMM_FSQY");
					YDYMM_PJMD_BZ=rsbody.getString("YDYMM_PJMD_BZ")==null?"":rsbody.getString("YDYMM_PJMD_BZ");
					YDYMM_ZGMD_BZ=rsbody.getString("YDYMM_ZGMD_BZ")==null?"":rsbody.getString("YDYMM_ZGMD_BZ");
					EDYMM_BZCD=rsbody.getString("EDYMM_BZCD")==null?"":rsbody.getString("EDYMM_BZCD");
					EDYMM_XZCD=rsbody.getString("EDYMM_XZCD")==null?"":rsbody.getString("EDYMM_XZCD");
					EDYMM_DQFS=rsbody.getString("EDYMM_DQFS")==null?"":rsbody.getString("EDYMM_DQFS");
					EDYMM_DQTB_FS=rsbody.getString("EDYMM_DQTB_FS")==null?"":rsbody.getString("EDYMM_DQTB_FS");
					EDYMM_BZFS=rsbody.getString("EDYMM_BZFS")==null?"":rsbody.getString("EDYMM_BZFS");
					EDYMM_LJFS=rsbody.getString("EDYMM_LJFS")==null?"":rsbody.getString("EDYMM_LJFS");
					EDYMM_LJTB_SQ=rsbody.getString("EDYMM_LJTB_SQ")==null?"":rsbody.getString("EDYMM_LJTB_SQ");
					EDYMM_LJTB_SZ=rsbody.getString("EDYMM_LJTB_SZ")==null?"":rsbody.getString("EDYMM_LJTB_SZ");
					EDYMM_DQFZ=rsbody.getString("EDYMM_DQFZ")==null?"":rsbody.getString("EDYMM_DQFZ");
					EDYMM_DQTB_FZ=rsbody.getString("EDYMM_DQTB_FZ")==null?"":rsbody.getString("EDYMM_DQTB_FZ");
					EDYMM_BZWC=rsbody.getString("EDYMM_BZWC")==null?"":rsbody.getString("EDYMM_BZWC");
					EDYMM_LJFZ=rsbody.getString("EDYMM_LJFZ")==null?"":rsbody.getString("EDYMM_LJFZ");
					EDYMM_LJTB_FZ=rsbody.getString("EDYMM_LJTB_FZ")==null?"":rsbody.getString("EDYMM_LJTB_FZ");
					EDYMM_FZXG=rsbody.getString("EDYMM_FZXG")==null?"":rsbody.getString("EDYMM_FZXG");
					EDYMM_RXFZ=rsbody.getString("EDYMM_RXFZ")==null?"":rsbody.getString("EDYMM_RXFZ");
					EDYMM_PJMD_BH=rsbody.getString("EDYMM_PJMD_BH")==null?"":rsbody.getString("EDYMM_PJMD_BH");
					EDYMM_ZGMD_BH=rsbody.getString("EDYMM_ZGMD_BH")==null?"":rsbody.getString("EDYMM_ZGMD_BH");
					EDYMM_FSQY=rsbody.getString("EDYMM_FSQY")==null?"":rsbody.getString("EDYMM_FSQY");
					EDYMM_PJMD_BZ=rsbody.getString("EDYMM_PJMD_BZ")==null?"":rsbody.getString("EDYMM_PJMD_BZ");
					EDYMM_ZGMD_BZ=rsbody.getString("EDYMM_ZGMD_BZ")==null?"":rsbody.getString("EDYMM_ZGMD_BZ");
					SDYMM_BZCD=rsbody.getString("SDYMM_BZCD")==null?"":rsbody.getString("SDYMM_BZCD");
					SDYMM_XZCD=rsbody.getString("SDYMM_XZCD")==null?"":rsbody.getString("SDYMM_XZCD");
					SDYMM_DQFS=rsbody.getString("SDYMM_DQFS")==null?"":rsbody.getString("SDYMM_DQFS");
					SDYMM_DQTB_FS=rsbody.getString("SDYMM_DQTB_FS")==null?"":rsbody.getString("SDYMM_DQTB_FS");
					SDYMM_BZFS=rsbody.getString("SDYMM_BZFS")==null?"":rsbody.getString("SDYMM_BZFS");
					SDYMM_LJFS=rsbody.getString("SDYMM_LJFS")==null?"":rsbody.getString("SDYMM_LJFS");
					SDYMM_LJTB_SQ=rsbody.getString("SDYMM_LJTB_SQ")==null?"":rsbody.getString("SDYMM_LJTB_SQ");
					SDYMM_LJTB_SZ=rsbody.getString("SDYMM_LJTB_SZ")==null?"":rsbody.getString("SDYMM_LJTB_SZ");
					SDYMM_DQFZ=rsbody.getString("SDYMM_DQFZ")==null?"":rsbody.getString("SDYMM_DQFZ");
					SDYMM_DQTB_FZ=rsbody.getString("SDYMM_DQTB_FZ")==null?"":rsbody.getString("SDYMM_DQTB_FZ");
					SDYMM_BZWC=rsbody.getString("SDYMM_BZWC")==null?"":rsbody.getString("SDYMM_BZWC");
					SDYMM_LJFZ=rsbody.getString("SDYMM_LJFZ")==null?"":rsbody.getString("SDYMM_LJFZ");
					SDYMM_LJTB_FZ=rsbody.getString("SDYMM_LJTB_FZ")==null?"":rsbody.getString("SDYMM_LJTB_FZ");
					SDYMM_FZXG=rsbody.getString("SDYMM_FZXG")==null?"":rsbody.getString("SDYMM_FZXG");
					SDYMM_RXFZ=rsbody.getString("SDYMM_RXFZ")==null?"":rsbody.getString("SDYMM_RXFZ");
					SDYMM_PJMD_BH=rsbody.getString("SDYMM_PJMD_BH")==null?"":rsbody.getString("SDYMM_PJMD_BH");
					SDYMM_ZGMD_BH=rsbody.getString("SDYMM_ZGMD_BH")==null?"":rsbody.getString("SDYMM_ZGMD_BH");
					SDYMM_FSQY=rsbody.getString("SDYMM_FSQY")==null?"":rsbody.getString("SDYMM_FSQY");
					SDYMM_FSQY=rsbody.getString("SDYMM_FSQY")==null?"":rsbody.getString("SDYMM_FSQY");
					SDYMM_PJMD_BZ=rsbody.getString("SDYMM_PJMD_BZ")==null?"":rsbody.getString("SDYMM_PJMD_BZ");
					SDYMM_ZGMD_BZ=rsbody.getString("SDYMM_ZGMD_BZ")==null?"":rsbody.getString("SDYMM_ZGMD_BZ");
					EDNC_BZCD=rsbody.getString("EDNC_BZCD")==null?"":rsbody.getString("EDNC_BZCD");
					EDNC_XZCD=rsbody.getString("EDNC_XZCD")==null?"":rsbody.getString("EDNC_XZCD");
					EDNC_DQFS=rsbody.getString("EDNC_DQFS")==null?"":rsbody.getString("EDNC_DQFS");
					EDNC_DQTB_FS=rsbody.getString("EDNC_DQTB_FS")==null?"":rsbody.getString("EDNC_DQTB_FS");
					EDNC_BZFS=rsbody.getString("EDNC_BZFS")==null?"":rsbody.getString("EDNC_BZFS");
					EDNC_LJFS=rsbody.getString("EDNC_LJFS")==null?"":rsbody.getString("EDNC_LJFS");
					EDNC_LJTB_SQ=rsbody.getString("EDNC_LJTB_SQ")==null?"":rsbody.getString("EDNC_LJTB_SQ");
					EDNC_LJTB_SZ=rsbody.getString("EDNC_LJTB_SZ")==null?"":rsbody.getString("EDNC_LJTB_SZ");
					EDNC_DQFZ=rsbody.getString("EDNC_DQFZ")==null?"":rsbody.getString("EDNC_DQFZ");
					EDNC_DQTB_FZ=rsbody.getString("EDNC_DQTB_FZ")==null?"":rsbody.getString("EDNC_DQTB_FZ");
					EDNC_BZWC=rsbody.getString("EDNC_BZWC")==null?"":rsbody.getString("EDNC_BZWC");
					EDNC_LJFZ=rsbody.getString("EDNC_LJFZ")==null?"":rsbody.getString("EDNC_LJFZ");
					EDNC_LJTB_FZ=rsbody.getString("EDNC_LJTB_FZ")==null?"":rsbody.getString("EDNC_LJTB_FZ");
					EDNC_FSQY=rsbody.getString("EDNC_FSQY")==null?"":rsbody.getString("EDNC_FSQY");
					SDNC_BZCD=rsbody.getString("SDNC_BZCD")==null?"":rsbody.getString("SDNC_BZCD");
					SDNC_XZCD=rsbody.getString("SDNC_XZCD")==null?"":rsbody.getString("SDNC_XZCD");
					SDNC_DQFS=rsbody.getString("SDNC_DQFS")==null?"":rsbody.getString("SDNC_DQFS");
					SDNC_DQTB_FS=rsbody.getString("SDNC_DQTB_FS")==null?"":rsbody.getString("SDNC_DQTB_FS");
					SDNC_BZFS=rsbody.getString("SDNC_BZFS")==null?"":rsbody.getString("SDNC_BZFS");
					SDNC_LJFS=rsbody.getString("SDNC_LJFS")==null?"":rsbody.getString("SDNC_LJFS");
					SDNC_LJTB_SQ=rsbody.getString("SDNC_LJTB_SQ")==null?"":rsbody.getString("SDNC_LJTB_SQ");
					SDNC_LJTB_SZ=rsbody.getString("SDNC_LJTB_SZ")==null?"":rsbody.getString("SDNC_LJTB_SZ");
					SDNC_DQFZ=rsbody.getString("SDNC_DQFZ")==null?"":rsbody.getString("SDNC_DQFZ");
					SDNC_DQTB_FZ=rsbody.getString("SDNC_DQTB_FZ")==null?"":rsbody.getString("SDNC_DQTB_FZ");
					SDNC_BZWC=rsbody.getString("SDNC_BZWC")==null?"":rsbody.getString("SDNC_BZWC");
					SDNC_LJFZ=rsbody.getString("SDNC_LJFZ")==null?"":rsbody.getString("SDNC_LJFZ");
					SDNC_LJTB_FZ=rsbody.getString("SDNC_LJTB_FZ")==null?"":rsbody.getString("SDNC_LJTB_FZ");
					SDNC_FSQY=rsbody.getString("SDNC_FSQY")==null?"":rsbody.getString("SDNC_FSQY");
					YC_BZCD=rsbody.getString("YC_BZCD")==null?"":rsbody.getString("YC_BZCD");
					YC_XZCD=rsbody.getString("YC_XZCD")==null?"":rsbody.getString("YC_XZCD");
					YC_DQFS=rsbody.getString("YC_DQFS")==null?"":rsbody.getString("YC_DQFS");
					YC_DQTB_FS=rsbody.getString("YC_DQTB_FS")==null?"":rsbody.getString("YC_DQTB_FS");
					YC_BZFS=rsbody.getString("YC_BZFS")==null?"":rsbody.getString("YC_BZFS");
					YC_LJFS=rsbody.getString("YC_LJFS")==null?"":rsbody.getString("YC_LJFS");
					YC_LJTB_SQ=rsbody.getString("YC_LJTB_SQ")==null?"":rsbody.getString("YC_LJTB_SQ");
					YC_LJTB_SZ=rsbody.getString("YC_LJTB_SZ")==null?"":rsbody.getString("YC_LJTB_SZ");
					YC_DQFZ=rsbody.getString("YC_DQFZ")==null?"":rsbody.getString("YC_DQFZ");
					YC_DQTB_FZ=rsbody.getString("YC_DQTB_FZ")==null?"":rsbody.getString("YC_DQTB_FZ");
					YC_BZWC=rsbody.getString("YC_BZWC")==null?"":rsbody.getString("YC_BZWC");
					YC_LJFZ=rsbody.getString("YC_LJFZ")==null?"":rsbody.getString("YC_LJFZ");
					YC_LJTB_FZ=rsbody.getString("YC_LJTB_FZ")==null?"":rsbody.getString("YC_LJTB_FZ");
					YC_FSQY=rsbody.getString("YC_FSQY")==null?"":rsbody.getString("YC_FSQY");
					EDMLC_BZCD=rsbody.getString("EDMLC_BZCD")==null?"":rsbody.getString("EDMLC_BZCD");
					EDMLC_XZCD=rsbody.getString("EDMLC_XZCD")==null?"":rsbody.getString("EDMLC_XZCD");
					EDMLC_DQFS=rsbody.getString("EDMLC_DQFS")==null?"":rsbody.getString("EDMLC_DQFS");
					EDMLC_DQTB_FS=rsbody.getString("EDMLC_DQTB_FS")==null?"":rsbody.getString("EDMLC_DQTB_FS");
					EDMLC_BZFS=rsbody.getString("EDMLC_BZFS")==null?"":rsbody.getString("EDMLC_BZFS");
					EDMLC_LJFS=rsbody.getString("EDMLC_LJFS")==null?"":rsbody.getString("EDMLC_LJFS");
					EDMLC_LJTB_SQ=rsbody.getString("EDMLC_LJTB_SQ")==null?"":rsbody.getString("EDMLC_LJTB_SQ");
					EDMLC_LJTB_SZ=rsbody.getString("EDMLC_LJTB_SZ")==null?"":rsbody.getString("EDMLC_LJTB_SZ");
					EDMLC_DQFZ=rsbody.getString("EDMLC_DQFZ")==null?"":rsbody.getString("EDMLC_DQFZ");
					EDMLC_DQTB_FZ=rsbody.getString("EDMLC_DQTB_FZ")==null?"":rsbody.getString("EDMLC_DQTB_FZ");
					EDMLC_BZWC=rsbody.getString("EDMLC_BZWC")==null?"":rsbody.getString("EDMLC_BZWC");
					EDMLC_LJFZ=rsbody.getString("EDMLC_LJFZ")==null?"":rsbody.getString("EDMLC_LJFZ");
					EDMLC_LJTB_FZ=rsbody.getString("EDMLC_LJTB_FZ")==null?"":rsbody.getString("EDMLC_LJTB_FZ");
					EDMLC_FSQY=rsbody.getString("EDMLC_FSQY")==null?"":rsbody.getString("EDMLC_FSQY");
					SDMLC_FSQY=rsbody.getString("SDMLC_FSQY")==null?"":rsbody.getString("SDMLC_FSQY");
					FDMLC_FSQY=rsbody.getString("FDMLC_FSQY")==null?"":rsbody.getString("FDMLC_FSQY");
					DBB_FSQY=rsbody.getString("DBB_FSQY")==null?"":rsbody.getString("DBB_FSQY");
					XBB_FSQY=rsbody.getString("XBB_FSQY")==null?"":rsbody.getString("XBB_FSQY");
					HBB_FSQY=rsbody.getString("HBB_FSQY")==null?"":rsbody.getString("HBB_FSQY");
					XB_FSQY=rsbody.getString("XB_FSQY")==null?"":rsbody.getString("XB_FSQY");
					SYQ=rsbody.getString("SYQ")==null?"":rsbody.getString("SYQ");
					FSQK=rsbody.getString("FSQK")==null?"":rsbody.getString("FSQK");
					FKQK=rsbody.getString("FKQK")==null?"":rsbody.getString("FKQK");
					FKFX=rsbody.getString("FKFX")==null?"":rsbody.getString("FKFX");
					LRRY=rsbody.getString("LRRY")==null?"":rsbody.getString("LRRY");
					LRRQ = rsbody.getString("LRRQ").substring(0, rsbody.getString("LRRQ").length()-2);
					DCRQ = rsbody.getString("DCRQ").substring(0, rsbody.getString("DCRQ").length()-10);
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
		<input name="DC" type="hidden" value="" />
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
					style="text-align:center;font-size=30;width: ;height: "><b>玉米病虫周报表(<%=rwsj %>)</b><br>
					<br></td>
			</tr>
			<tr>
				<td style="padding-left: 100px;padding-right: 100px;">测报站点：<%=usebmmc%><input
					name="BMBM" type="hidden" value="<%=usebm%>" /></td>
				<td style="padding-left: 100px;padding-right: 100px;">调查时间：<label><%=DCRQ%></label>
				</td>
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
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
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
					<td rowspan="3">一代玉米螟</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3"><label><%=YDYMM_DQFS%></label></td>
					<td rowspan="3"><label><%=YDYMM_DQTB_FS%></label></td>
					<td rowspan="3"><label><%=YDYMM_BZFS%></label></td>
					<td rowspan="3"><label><%=YDYMM_LJFS%></label></td>
					<td rowspan="3"><label><%=YDYMM_LJTB_SQ%></label></td>
					<td rowspan="3"><label><%=YDYMM_LJTB_SZ%></label></td>
					<td rowspan="3"><label><%=YDYMM_DQFZ%></label></td>
					<td rowspan="3"><label><%=YDYMM_DQTB_FZ%></label></td>
					<td rowspan="3"><label><%=YDYMM_BZWC%></label></td>
					<td rowspan="3"><label><%=YDYMM_LJFZ%></label></td>
					<td rowspan="3"><label><%=YDYMM_LJTB_FZ%></label></td>
					<td rowspan="3"><label><%=YDYMM_FZXG%></label></td>
					<td rowspan="3"><label><%=YDYMM_RXFZ%></label></td>
				</tr>
				<tr>
				    <td rowspan="1">被害株率（%）</td>
				    <td rowspan="1"><label><%=YDYMM_PJMD_BH%></label></td>
				    <td rowspan="1"><label><%=YDYMM_ZGMD_BH%></label></td>
					<td rowspan="2"><label><%=YDYMM_FSQY%></label></td>
				</tr>
				<tr>
				    <td rowspan="1">百株蚜量(头/百株)</td>
				    <td rowspan="1"><label><%=YDYMM_PJMD_BZ%></label></td>
				    <td rowspan="1"><label><%=YDYMM_ZGMD_BZ%></label></td>
				</tr>
				<tr>
					<td rowspan="3">二代玉米螟</td>
					<td rowspan="3"><label><%=EDYMM_BZCD%>级</label></td>
					<td rowspan="3"><label><%=EDYMM_XZCD%>级</label></td>
					<td rowspan="3"><label><%=EDYMM_DQFS%></label></td>
					<td rowspan="3"><label><%=EDYMM_DQTB_FS%></label></td>
					<td rowspan="3"><label><%=EDYMM_BZFS%></label></td>
					<td rowspan="3"><label><%=EDYMM_LJFS%></label></td>
					<td rowspan="3"><label><%=EDYMM_LJTB_SQ%></label></td>
					<td rowspan="3"><label><%=EDYMM_LJTB_SZ%></label></td>
					<td rowspan="3"><label><%=EDYMM_DQFZ%></label></td>
					<td rowspan="3"><label><%=EDYMM_DQTB_FZ%></label></td>
					<td rowspan="3"><label><%=EDYMM_BZWC%></label></td>
					<td rowspan="3"><label><%=EDYMM_LJFZ%></label></td>
					<td rowspan="3"><label><%=EDYMM_LJTB_FZ%></label></td>
					<td rowspan="3"><label><%=EDYMM_FZXG%></label></td>
					<td rowspan="3"><label><%=EDYMM_RXFZ%></label></td>
				</tr>
				<tr>
				    <td rowspan="1">被害株率（%）</td>
				    <td rowspan="1"><label><%=EDYMM_PJMD_BH%></label></td>
				    <td rowspan="1"><label><%=EDYMM_ZGMD_BH%></label></td>
					<td rowspan="2"><label><%=EDYMM_FSQY%></label></td>
				</tr>
				<tr>
				    <td rowspan="1">百株蚜量(头/百株)</td>
				    <td rowspan="1"><label><%=EDYMM_PJMD_BZ%></label></td>
				    <td rowspan="1"><label><%=EDYMM_ZGMD_BZ%></label></td>
				</tr>
				<tr>
					<td rowspan="3">三代玉米螟</td>
					<td rowspan="3"><label><%=SDYMM_BZCD%>级</label></td>
					<td rowspan="3"><label><%=SDYMM_XZCD%>级</label></td>
					<td rowspan="3"><label><%=SDYMM_DQFS%></label></td>
					<td rowspan="3"><label><%=SDYMM_DQTB_FS%></label></td>
					<td rowspan="3"><label><%=SDYMM_BZFS%></label></td>
					<td rowspan="3"><label><%=SDYMM_LJFS%></label></td>
					<td rowspan="3"><label><%=SDYMM_LJTB_SQ%></label></td>
					<td rowspan="3"><label><%=SDYMM_LJTB_SZ%></label></td>
					<td rowspan="3"><label><%=SDYMM_DQFZ%></label></td>
					<td rowspan="3"><label><%=SDYMM_DQTB_FZ%></label></td>
					<td rowspan="3"><label><%=SDYMM_BZWC%></label></td>
					<td rowspan="3"><label><%=SDYMM_LJFZ%></label></td>
					<td rowspan="3"><label><%=SDYMM_LJTB_FZ%></label></td>
					<td rowspan="3"><label><%=SDYMM_FZXG%></label></td>
					<td rowspan="3"><label><%=SDYMM_RXFZ%></label></td>
				</tr>
				<tr>
				    <td rowspan="1">被害株率（%）</td>
				    <td rowspan="1"><label><%=SDYMM_PJMD_BH%></label></td>
				    <td rowspan="1"><label><%=SDYMM_ZGMD_BH%></label></td>
					<td rowspan="2"><label><%=SDYMM_FSQY%></label></td>
				</tr>
				<tr>
				    <td rowspan="1">百株蚜量(头/百株)</td>
				    <td rowspan="1"><label><%=SDYMM_PJMD_BZ%></label></td>
				    <td rowspan="1"><label><%=SDYMM_ZGMD_BZ%></label></td>
				</tr>
				<tr>
					<td rowspan="3">二代粘虫</td>
					<td rowspan="3"><label><%=EDNC_BZCD%>级</label></td>
					<td rowspan="3"><label><%=EDNC_XZCD%>级</label></td>
					<td rowspan="3"><label><%=EDNC_DQFS%></label></td>
					<td rowspan="3"><label><%=EDNC_DQTB_FS%></label></td>
					<td rowspan="3"><label><%=EDNC_BZFS%></label></td>
					<td rowspan="3"><label><%=EDNC_LJFS%></label></td>
					<td rowspan="3"><label><%=EDNC_LJTB_SQ%></label></td>
					<td rowspan="3"><label><%=EDNC_LJTB_SZ%></label></td>
					<td rowspan="3"><label><%=EDNC_DQFZ%></label></td>
					<td rowspan="3"><label><%=EDNC_DQTB_FZ%></label></td>
					<td rowspan="3"><label><%=EDNC_BZWC%></label></td>
					<td rowspan="3"><label><%=EDNC_LJFZ%></label></td>
					<td rowspan="3"><label><%=EDNC_LJTB_FZ%></label></td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
				</tr>
				<tr>
				    <td rowspan="1">被害株率（%）</td>
				    <td rowspan="1" style="text-align: center;">/</td>
				    <td rowspan="1" style="text-align: center;">/</td>
					<td rowspan="2"><label><%=EDNC_FSQY%></label></td>
				</tr>
				<tr>
				    <td rowspan="1">百株蚜量(头/百株)</td>
				    <td rowspan="1" style="text-align: center;">/</td>
				    <td rowspan="1" style="text-align: center;">/</td>
				</tr>
				<tr>
					<td rowspan="3">三代粘虫</td>
					<td rowspan="3"><label><%=SDNC_BZCD%>级</label></td>
					<td rowspan="3"><label><%=SDNC_XZCD%>级</label></td>
					<td rowspan="3"><label><%=SDNC_DQFS%></label></td>
					<td rowspan="3"><label><%=SDNC_DQTB_FS%></label></td>
					<td rowspan="3"><label><%=SDNC_BZFS%></label></td>
					<td rowspan="3"><label><%=SDNC_LJFS%></label></td>
					<td rowspan="3"><label><%=SDNC_LJTB_SQ%></label></td>
					<td rowspan="3"><label><%=SDNC_LJTB_SZ%></label></td>
					<td rowspan="3"><label><%=SDNC_DQFZ%></label></td>
					<td rowspan="3"><label><%=SDNC_DQTB_FZ%></label></td>
					<td rowspan="3"><label><%=SDNC_BZWC%></label></td>
					<td rowspan="3"><label><%=SDNC_LJFZ%></label></td>
					<td rowspan="3"><label><%=SDNC_LJTB_FZ%></label></td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
				</tr>
				<tr>
				    <td rowspan="1">被害株率（%）</td>
				    <td rowspan="1" style="text-align: center;">/</td>
				    <td rowspan="1" style="text-align: center;">/</td>
					<td rowspan="2"><label><%=SDNC_FSQY%></label></td>
				</tr>
				<tr>
				    <td rowspan="1">百株蚜量(头/百株)</td>
				    <td rowspan="1" style="text-align: center;">/</td>
				    <td rowspan="1" style="text-align: center;">/</td>
				</tr>
				<tr>
					<td>蚜虫</td>
					<td><label><%=YC_BZCD%>级</label></td>
					<td><label><%=YC_XZCD%>级</label></td>
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
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td>百株蚜量(头/百株)</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td><label><%=YC_FSQY%></label></td>
				</tr>
				<tr>
					<td>二代棉铃虫</td>
					<td><label><%=EDMLC_BZCD%>级</label></td>
					<td><label><%=EDMLC_XZCD%>级</label></td>
					<td><label><%=EDMLC_DQFS%></label></td>
					<td><label><%=EDMLC_DQTB_FS%></label></td>
					<td><label><%=EDMLC_BZFS%></label></td>
					<td><label><%=EDMLC_LJFS%></label></td>
					<td><label><%=EDMLC_LJTB_SQ%></label></td>
					<td><label><%=EDMLC_LJTB_SZ%></label></td>
					<td><label><%=EDMLC_DQFZ%></label></td>
					<td><label><%=EDMLC_DQTB_FZ%></label></td>
					<td><label><%=EDMLC_BZWC%></label></td>
					<td><label><%=EDMLC_LJFZ%></label></td>
					<td><label><%=EDMLC_LJTB_FZ%></label></td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td>被害株率（%）</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td><label><%=EDMLC_FSQY%></label></td>
				</tr>
				<tr>
					<td>三代棉铃虫</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td>被害株率（%）</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td><label><%=SDMLC_FSQY%></label></td>
				</tr>
				<tr>
					<td>四代棉铃虫</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td>被害株率（%）</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td><label><%=FDMLC_FSQY%></label></td>
				</tr>
				<tr>
					<td rowspan="3">大斑病</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
				    <td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
				</tr>
				<tr>
				    <td rowspan="1">病株率（%）</td>
				    <td rowspan="1" style="text-align: center;">/</td>
					<td rowspan="1" style="text-align: center;">/</td>
					<td rowspan="2"><label><%=DBB_FSQY%></label></td>
				</tr>
				<tr>
				    <td rowspan="1">病叶率（%）</td>
				    <td rowspan="1" style="text-align: center;">/</td>
					<td rowspan="1" style="text-align: center;">/</td>
				</tr>
				<tr>
					<td rowspan="3">小斑病</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
				    <td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
				</tr>
				<tr>
				    <td rowspan="1">病株率（%）</td>
				    <td rowspan="1" style="text-align: center;">/</td>
					<td rowspan="1" style="text-align: center;">/</td>
					<td rowspan="2"><label><%=XBB_FSQY%></label></td>
				</tr>
				<tr>
				    <td rowspan="1">病叶率（%）</td>
				    <td rowspan="1" style="text-align: center;">/</td>
					<td rowspan="1" style="text-align: center;">/</td>
				</tr>
				<tr>
					<td rowspan="3">褐斑病</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
				    <td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
				</tr>
				<tr>
				    <td rowspan="1">病株率（%）</td>
				    <td rowspan="1" style="text-align: center;">/</td>
					<td rowspan="1" style="text-align: center;">/</td>
					<td rowspan="2"><label><%=HBB_FSQY%></label></td>
				</tr>
				<tr>
				    <td rowspan="1">病叶率（%）</td>
				    <td rowspan="1" style="text-align: center;">/</td>
					<td rowspan="1" style="text-align: center;">/</td>
				</tr>
				<tr>
					<td rowspan="3">锈病</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
				    <td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
					<td rowspan="3" style="text-align: center;">/</td>
				</tr>
				<tr>
				    <td rowspan="1">病株率（%）</td>
				    <td rowspan="1" style="text-align: center;">/</td>
					<td rowspan="1" style="text-align: center;">/</td>
					<td rowspan="2"><label><%=XB_FSQY%></label></td>
				</tr>
				<tr>
				    <td rowspan="1">病叶率（%）</td>
				    <td rowspan="1" style="text-align: center;">/</td>
					<td rowspan="1" style="text-align: center;">/</td>
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
				<td style="padding-left: 100px;padding-right: 100px;">录入人员：<%=LRRY %></td>
				<td style="padding-left: 100px;padding-right: 100px;">录入日期：<%=LRRQ %></td>
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
		xzsel('EDYMM_BZCD','<%=EDYMM_BZCD%>');
		xzsel('EDYMM_XZCD','<%=EDYMM_XZCD%>');
		xzsel('SDYMM_BZCD','<%=SDYMM_BZCD%>');
		xzsel('SDYMM_XZCD','<%=SDYMM_XZCD%>');
		xzsel('EDNC_BZCD','<%=EDNC_BZCD%>');
		xzsel('EDNC_XZCD','<%=EDNC_XZCD%>');
		xzsel('SDNC_BZCD','<%=SDNC_BZCD%>');
		xzsel('SDNC_XZCD','<%=SDNC_XZCD%>');
		xzsel('YC_BZCD','<%=YC_BZCD%>');
		xzsel('YC_XZCD','<%=YC_XZCD%>');
		xzsel('EDMLC_BZCD','<%=EDMLC_BZCD%>');
		xzsel('EDMLC_XZCD','<%=EDMLC_XZCD%>');
    });
	function zt(zt) {
		$("input[name='ZT']").val(zt);
		if (jysz()) {
			$("#f1").submit();
		}
	}
	function dc() {
		$("#f1").attr("action","/insect/ymscExcel.do?ACT_TYPE=Q<%=zbid%>");  
		if (jysz()) {
			$("#f1").submit();
		}
	}
	function dqfsmj(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YDYMM_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_DQFS']").val());
			}
			if ($("input[name='EDYMM_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_DQFS']").val());
			}
			if ($("input[name='SDYMM_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_DQFS']").val());
			}
			if ($("input[name='EDNC_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_DQFS']").val());
			}
			if ($("input[name='SDNC_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_DQFS']").val());
			}
			if ($("input[name='YC_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_DQFS']").val());
			}
			if ($("input[name='EDMLC_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDMLC_DQFS']").val());
			}
			$("input[name='HJ_DQFS']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDYMM_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_DQFS']").val());
			}
			if ($("input[name='EDYMM_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_DQFS']").val());
			}
			if ($("input[name='SDYMM_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_DQFS']").val());
			}
			if ($("input[name='EDNC_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_DQFS']").val());
			}
			if ($("input[name='BFB_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='BFB_DQFS']").val());
			}
			if ($("input[name='SDNC_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_DQFS']").val());
			}
			if ($("input[name='YC_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_DQFS']").val());
			}
			if ($("input[name='EDMLC_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDMLC_DQFS']").val());
			}
			$("input[name='HJ_DQFS']").val(zh);
		}
	}
	function bzfs(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YDYMM_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_BZFS']").val());
			}
			if ($("input[name='EDYMM_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_BZFS']").val());
			}
			if ($("input[name='SDYMM_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_BZFS']").val());
			}
			if ($("input[name='EDNC_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_BZFS']").val());
			}
			if ($("input[name='SDNC_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_BZFS']").val());
			}
			if ($("input[name='YC_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_BZFS']").val());
			}
			if ($("input[name='EDMLC_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDMLC_BZFS']").val());
			}
			$("input[name='HJ_BZFS']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDYMM_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_BZFS']").val());
			}
			if ($("input[name='EDYMM_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_BZFS']").val());
			}
			if ($("input[name='SDYMM_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_BZFS']").val());
			}
			if ($("input[name='EDNC_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_BZFS']").val());
			}
			if ($("input[name='SDNC_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_BZFS']").val());
			}
			if ($("input[name='YC_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_BZFS']").val());
			}
			if ($("input[name='EDMLC_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDMLC_BZFS']").val());
			}
			$("input[name='HJ_BZFS']").val(zh);
		}
	}
	function ljfs(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YDYMM_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_LJFS']").val());
			}
			if ($("input[name='EDYMM_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_LJFS']").val());
			}
			if ($("input[name='SDYMM_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_LJFS']").val());
			}
			if ($("input[name='EDNC_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_LJFS']").val());
			}
			if ($("input[name='SDNC_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_LJFS']").val());
			}
			if ($("input[name='YC_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_LJFS']").val());
			}
			if ($("input[name='EDMLC_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDMLC_LJFS']").val());
			}
			$("input[name='HJ_LJFS']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDYMM_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_LJFS']").val());
			}
			if ($("input[name='EDYMM_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_LJFS']").val());
			}
			if ($("input[name='SDYMM_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_LJFS']").val());
			}
			if ($("input[name='EDNC_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_LJFS']").val());
			}
			if ($("input[name='SDNC_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_LJFS']").val());
			}
			if ($("input[name='YC_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_LJFS']").val());
			}
			if ($("input[name='EDMLC_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDMLC_LJFS']").val());
			}
			$("input[name='HJ_LJFS']").val(zh);
		}
	}
	function dqfz(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YDYMM_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_DQFZ']").val());
			}
			if ($("input[name='EDYMM_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_DQFZ']").val());
			}
			if ($("input[name='SDYMM_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_DQFZ']").val());
			}
			if ($("input[name='EDNC_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_DQFZ']").val());
			}
			if ($("input[name='SDNC_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_DQFZ']").val());
			}
			if ($("input[name='YC_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_DQFZ']").val());
			}
			if ($("input[name='EDMLC_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDMLC_DQFZ']").val());
			}
			$("input[name='HJ_DQFZ']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDYMM_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_DQFZ']").val());
			}
			if ($("input[name='EDYMM_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_DQFZ']").val());
			}
			if ($("input[name='SDYMM_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_DQFZ']").val());
			}
			if ($("input[name='EDNC_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_DQFZ']").val());
			}
			if ($("input[name='SDNC_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_DQFZ']").val());
			}
			if ($("input[name='YC_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_DQFZ']").val());
			}
			if ($("input[name='EDMLC_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDMLC_DQFZ']").val());
			}
			$("input[name='HJ_DQFZ']").val(zh);
		}
	}
	function bzwc(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YDYMM_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_BZWC']").val());
			}
			if ($("input[name='EDYMM_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_BZWC']").val());
			}
			if ($("input[name='SDYMM_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_BZWC']").val());
			}
			if ($("input[name='EDNC_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_BZWC']").val());
			}
			if ($("input[name='SDNC_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_BZWC']").val());
			}
			if ($("input[name='YC_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_BZWC']").val());
			}
			if ($("input[name='EDMLC_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='EDMLC_BZWC']").val());
			}
			$("input[name='HJ_BZWC']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDYMM_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_BZWC']").val());
			}
			if ($("input[name='EDYMM_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_BZWC']").val());
			}
			if ($("input[name='SDYMM_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_BZWC']").val());
			}
			if ($("input[name='EDNC_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_BZWC']").val());
			}
			if ($("input[name='SDNC_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_BZWC']").val());
			}
			if ($("input[name='YC_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_BZWC']").val());
			}
			if ($("input[name='EDMLC_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='EDMLC_BZWC']").val());
			}
			$("input[name='HJ_BZWC']").val(zh);
		}
	}
	function ljfz(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YDYMM_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_LJFZ']").val());
			}
			if ($("input[name='EDYMM_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_LJFZ']").val());
			}
			if ($("input[name='SDYMM_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_LJFZ']").val());
			}
			if ($("input[name='EDNC_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_LJFZ']").val());
			}
			if ($("input[name='SDNC_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_LJFZ']").val());
			}
			if ($("input[name='YC_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_LJFZ']").val());
			}
			if ($("input[name='EDMLC_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDMLC_LJFZ']").val());
			}
			$("input[name='HJ_LJFZ']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDYMM_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_LJFZ']").val());
			}
			if ($("input[name='EDYMM_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_LJFZ']").val());
			}
			if ($("input[name='SDYMM_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_LJFZ']").val());
			}
			if ($("input[name='EDNC_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDNC_LJFZ']").val());
			}
			if ($("input[name='SDNC_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDNC_LJFZ']").val());
			}
			if ($("input[name='YC_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YC_LJFZ']").val());
			}
			if ($("input[name='EDMLC_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDMLC_LJFZ']").val());
			}
			$("input[name='HJ_LJFZ']").val(zh);
		}
	}
	function rxfz(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YDYMM_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_RXFZ']").val());
			}
			if ($("input[name='EDYMM_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_RXFZ']").val());
			}
			if ($("input[name='SDYMM_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_RXFZ']").val());
			}
			$("input[name='HJ_RXFZ']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDYMM_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_RXFZ']").val());
			}
			if ($("input[name='EDYMM_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_RXFZ']").val());
			}
			if ($("input[name='SDYMM_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_RXFZ']").val());
			}
			$("input[name='HJ_RXFZ']").val(zh);
		}
	}
	function pjmd(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YDYMM_PJMD_BH']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_PJMD_BH']").val());
			}
			if ($("input[name='YDYMM_PJMD_BZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_PJMD_BZ']").val());
			}
			if ($("input[name='EDYMM_PJMD_BH']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_PJMD_BH']").val());
			}
			if ($("input[name='EDYMM_PJMD_BZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_PJMD_BZ']").val());
			}
			if ($("input[name='SDYMM_PJMD_BH']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_PJMD_BH']").val());
			}
			if ($("input[name='SDYMM_PJMD_BZ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_PJMD_BZ']").val());
			}
			$("input[name='HJ_PJMD']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDYMM_PJMD_BH']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_PJMD_BH']").val());
			}
			if ($("input[name='YDYMM_PJMD_BZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_PJMD_BZ']").val());
			}
			if ($("input[name='EDYMM_PJMD_BH']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_PJMD_BH']").val());
			}
			if ($("input[name='EDYMM_PJMD_BZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_PJMD_BZ']").val());
			}
			if ($("input[name='SDYMM_PJMD_BH']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_PJMD_BH']").val());
			}
			if ($("input[name='SDYMM_PJMD_BZ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_PJMD_BZ']").val());
			}
			$("input[name='HJ_PJMD']").val(zh);
		}
	}
	function zgmd(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YDYMM_ZGMD_BH']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_ZGMD_BH']").val());
			}
			if ($("input[name='YDYMM_ZGMD_BZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_ZGMD_BZ']").val());
			}
			if ($("input[name='EDYMM_ZGMD_BH']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_ZGMD_BH']").val());
			}
			if ($("input[name='EDYMM_ZGMD_BZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_ZGMD_BZ']").val());
			}
			if ($("input[name='SDYMM_ZGMD_BH']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_ZGMD_BH']").val());
			}
			if ($("input[name='SDYMM_ZGMD_BZ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_ZGMD_BZ']").val());
			}
			$("input[name='HJ_ZGMD']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDYMM_ZGMD_BH']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_ZGMD_BH']").val());
			}
			if ($("input[name='YDYMM_ZGMD_BZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYMM_ZGMD_BZ']").val());
			}
			if ($("input[name='EDYMM_ZGMD_BH']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_ZGMD_BH']").val());
			}
			if ($("input[name='EDYMM_ZGMD_BZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYMM_ZGMD_BZ']").val());
			}
			if ($("input[name='SDYMM_ZGMD_BH']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_ZGMD_BH']").val());
			}
			if ($("input[name='SDYMM_ZGMD_BZ']").val() != "") {
				zh = zh + parseFloat($("input[name='SDYMM_ZGMD_BZ']").val());
			}
			$("input[name='HJ_ZGMD']").val(zh);
		}
	}
</script>
</html>