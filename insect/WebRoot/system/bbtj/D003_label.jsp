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
	    
	    String YDD_BZCD="";
	    String YDD_XZCD="";
	    String YDD_DQFS="";
	    String YDD_DQTB_FS="";
	    String YDD_BZFS="";
	    String YDD_LJFS="";
	    String YDD_LJTB_SQ="";
	    String YDD_LJTB_SZ="";
	    String YDD_DQFZ="";
	    String YDD_DQTB_FZ="";
	    String YDD_BZWC="";
	    String YDD_LJFZ="";
	    String YDD_LJTB_FZ="";
	    String YDD_FZXG="";
	    String YDD_RXFZ="";
	    String YDD_PJMD="";
	    String YDD_ZGMD="";
	    String YDD_FSQY="";
	    String YD_BZCD="";
	    String YD_XZCD="";
	    String YD_DQFS="";
	    String YD_DQTB_FS="";
	    String YD_BZFS="";
	    String YD_LJFS="";
	    String YD_LJTB_SQ="";
	    String YD_LJTB_SZ="";
	    String YD_DQFZ="";
	    String YD_DQTB_FZ="";
	    String YD_BZWC="";
	    String YD_LJFZ="";
	    String YD_LJTB_FZ="";
	    String YD_FZXG="";
	    String YD_RXFZ="";
	    String YD_PJMD="";
	    String YD_ZGMD="";
	    String YD_FSQY="";
	    String ED_BZCD="";
	    String ED_XZCD="";
	    String ED_DQFS="";
	    String ED_DQTB_FS="";
	    String ED_BZFS="";
	    String ED_LJFS="";
	    String ED_LJTB_SQ="";
	    String ED_LJTB_SZ="";
	    String ED_DQFZ="";
	    String ED_DQTB_FZ="";
	    String ED_BZWC="";
	    String ED_LJFZ="";
	    String ED_LJTB_FZ="";
	    String ED_FZXG="";
	    String ED_RXFZ="";
	    String ED_PJMD="";
	    String ED_ZGMD="";
	    String ED_FSQY="";
	    String YDYDD_BZCD="";
	    String YDYDD_XZCD="";
	    String YDYDD_DQFS="";
	    String YDYDD_DQTB_FS="";
	    String YDYDD_BZFS="";
	    String YDYDD_LJFS="";
	    String YDYDD_LJTB_SQ="";
	    String YDYDD_LJTB_SZ="";
	    String YDYDD_DQFZ="";
	    String YDYDD_DQTB_FZ="";
	    String YDYDD_BZWC="";
	    String YDYDD_LJFZ="";
	    String YDYDD_LJTB_FZ="";
	    String YDYDD_FZXG="";
	    String YDYDD_RXFZ="";
	    String YDYDD_PJMD="";
	    String YDYDD_ZGMD="";
	    String YDYDD_FSQY="";
	    String EDYDD_BZCD="";
	    String EDYDD_XZCD="";
	    String EDYDD_DQFS="";
	    String EDYDD_DQTB_FS="";
	    String EDYDD_BZFS="";
	    String EDYDD_LJFS="";
	    String EDYDD_LJTB_SQ="";
	    String EDYDD_LJTB_SZ="";
	    String EDYDD_DQFZ="";
	    String EDYDD_DQTB_FZ="";
	    String EDYDD_BZWC="";
	    String EDYDD_LJFZ="";
	    String EDYDD_LJTB_FZ="";
	    String EDYDD_FZXG="";
	    String EDYDD_RXFZ="";
	    String EDYDD_PJMD="";
	    String EDYDD_ZGMD="";
	    String EDYDD_FSQY="";
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
		if (!bbzt.equals("0")) {
			ExecuteConnection ecbody = new ExecuteConnection();
			PreparedStatement pstmtbody = null;
			ResultSet rsbody = null;
			try {
				String sql = "select * from D003 where jfid=" + jfid;
				pstmtbody = ecbody.con.prepareStatement(sql);
				rsbody = pstmtbody.executeQuery();
				while (rsbody.next()) {
					JFID = rsbody.getString("JFID")==null?"":rsbody.getString("JFID");
					YDD_BZCD = rsbody.getString("YDD_BZCD")==null?"":rsbody.getString("YDD_BZCD");
					YDD_XZCD = rsbody.getString("YDD_XZCD")==null?"":rsbody.getString("YDD_XZCD");
					YDD_DQFS = rsbody.getString("YDD_DQFS")==null?"":rsbody.getString("YDD_DQFS");
					YDD_DQTB_FS = rsbody.getString("YDD_DQTB_FS")==null?"":rsbody.getString("YDD_DQTB_FS");
					YDD_BZFS = rsbody.getString("YDD_BZFS")==null?"":rsbody.getString("YDD_BZFS");
					YDD_LJFS = rsbody.getString("YDD_LJFS")==null?"":rsbody.getString("YDD_LJFS");
					YDD_LJTB_SQ = rsbody.getString("YDD_LJTB_SQ")==null?"":rsbody.getString("YDD_LJTB_SQ");
					YDD_LJTB_SZ = rsbody.getString("YDD_LJTB_SZ")==null?"":rsbody.getString("YDD_LJTB_SZ");
					YDD_DQFZ = rsbody.getString("YDD_DQFZ")==null?"":rsbody.getString("YDD_DQFZ");
					YDD_DQTB_FZ = rsbody.getString("YDD_DQTB_FZ")==null?"":rsbody.getString("YDD_DQTB_FZ");
					YDD_BZWC = rsbody.getString("YDD_BZWC")==null?"":rsbody.getString("YDD_BZWC");
					YDD_LJFZ = rsbody.getString("YDD_LJFZ")==null?"":rsbody.getString("YDD_LJFZ");
					YDD_LJTB_FZ = rsbody.getString("YDD_LJTB_FZ")==null?"":rsbody.getString("YDD_LJTB_FZ");
					YDD_FZXG = rsbody.getString("YDD_FZXG")==null?"":rsbody.getString("YDD_FZXG");
					YDD_RXFZ = rsbody.getString("YDD_RXFZ")==null?"":rsbody.getString("YDD_RXFZ");
					YDD_PJMD = rsbody.getString("YDD_PJMD")==null?"":rsbody.getString("YDD_PJMD");
					YDD_ZGMD = rsbody.getString("YDD_ZGMD")==null?"":rsbody.getString("YDD_ZGMD");
					YDD_FSQY = rsbody.getString("YDD_FSQY")==null?"":rsbody.getString("YDD_FSQY");
					YD_BZCD = rsbody.getString("YD_BZCD")==null?"":rsbody.getString("YD_BZCD");
					YD_XZCD = rsbody.getString("YD_XZCD")==null?"":rsbody.getString("YD_XZCD");
					YD_DQFS = rsbody.getString("YD_DQFS")==null?"":rsbody.getString("YD_DQFS");
					YD_DQTB_FS = rsbody.getString("YD_DQTB_FS")==null?"":rsbody.getString("YD_DQTB_FS");
					YD_BZFS = rsbody.getString("YD_BZFS")==null?"":rsbody.getString("YD_BZFS");
					YD_LJFS = rsbody.getString("YD_LJFS")==null?"":rsbody.getString("YD_LJFS");
					YD_LJTB_SQ = rsbody.getString("YD_LJTB_SQ")==null?"":rsbody.getString("YD_LJTB_SQ");
					YD_LJTB_SZ = rsbody.getString("YD_LJTB_SZ")==null?"":rsbody.getString("YD_LJTB_SZ");
					YD_DQFZ = rsbody.getString("YD_DQFZ")==null?"":rsbody.getString("YD_DQFZ");
					YD_DQTB_FZ = rsbody.getString("YD_DQTB_FZ")==null?"":rsbody.getString("YD_DQTB_FZ");
					YD_BZWC = rsbody.getString("YD_BZWC")==null?"":rsbody.getString("YD_BZWC");
					YD_LJFZ = rsbody.getString("YD_LJFZ")==null?"":rsbody.getString("YD_LJFZ");
					YD_LJTB_FZ = rsbody.getString("YD_LJTB_FZ")==null?"":rsbody.getString("YD_LJTB_FZ");
					YD_FZXG = rsbody.getString("YD_FZXG")==null?"":rsbody.getString("YD_FZXG");
					YD_RXFZ = rsbody.getString("YD_RXFZ")==null?"":rsbody.getString("YD_RXFZ");
					YD_PJMD = rsbody.getString("YD_PJMD")==null?"":rsbody.getString("YD_PJMD");
					YD_ZGMD = rsbody.getString("YD_ZGMD")==null?"":rsbody.getString("YD_ZGMD");
					YD_FSQY = rsbody.getString("YD_FSQY")==null?"":rsbody.getString("YD_FSQY");
					ED_BZCD = rsbody.getString("ED_BZCD")==null?"":rsbody.getString("ED_BZCD");
					ED_XZCD = rsbody.getString("ED_XZCD")==null?"":rsbody.getString("ED_XZCD");
					ED_DQFS = rsbody.getString("ED_DQFS")==null?"":rsbody.getString("ED_DQFS");
					ED_DQTB_FS = rsbody.getString("ED_DQTB_FS")==null?"":rsbody.getString("ED_DQTB_FS");
					ED_BZFS = rsbody.getString("ED_BZFS")==null?"":rsbody.getString("ED_BZFS");
					ED_LJFS = rsbody.getString("ED_LJFS")==null?"":rsbody.getString("ED_LJFS");
					ED_LJTB_SQ = rsbody.getString("ED_LJTB_SQ")==null?"":rsbody.getString("ED_LJTB_SQ");
					ED_LJTB_SZ = rsbody.getString("ED_LJTB_SZ")==null?"":rsbody.getString("ED_LJTB_SZ");
					ED_DQFZ = rsbody.getString("ED_DQFZ")==null?"":rsbody.getString("ED_DQFZ");
					ED_DQTB_FZ = rsbody.getString("ED_DQTB_FZ")==null?"":rsbody.getString("ED_DQTB_FZ");
					ED_BZWC = rsbody.getString("ED_BZWC")==null?"":rsbody.getString("ED_BZWC");
					ED_LJFZ = rsbody.getString("ED_LJFZ")==null?"":rsbody.getString("ED_LJFZ");
					ED_LJTB_FZ = rsbody.getString("ED_LJTB_FZ")==null?"":rsbody.getString("ED_LJTB_FZ");
					ED_FZXG = rsbody.getString("ED_FZXG")==null?"":rsbody.getString("ED_FZXG");
					ED_RXFZ = rsbody.getString("ED_RXFZ")==null?"":rsbody.getString("ED_RXFZ");
					ED_PJMD = rsbody.getString("ED_PJMD")==null?"":rsbody.getString("ED_PJMD");
					ED_ZGMD = rsbody.getString("ED_ZGMD")==null?"":rsbody.getString("ED_ZGMD");
					ED_FSQY = rsbody.getString("ED_FSQY")==null?"":rsbody.getString("ED_FSQY");
					YDYDD_BZCD = rsbody.getString("YDYDD_BZCD")==null?"":rsbody.getString("YDYDD_BZCD");
					YDYDD_XZCD = rsbody.getString("YDYDD_XZCD")==null?"":rsbody.getString("YDYDD_XZCD");
					YDYDD_DQFS = rsbody.getString("YDYDD_DQFS")==null?"":rsbody.getString("YDYDD_DQFS");
					YDYDD_DQTB_FS = rsbody.getString("YDYDD_DQTB_FS")==null?"":rsbody.getString("YDYDD_DQTB_FS");
					YDYDD_BZFS = rsbody.getString("YDYDD_BZFS")==null?"":rsbody.getString("YDYDD_BZFS");
					YDYDD_LJFS = rsbody.getString("YDYDD_LJFS")==null?"":rsbody.getString("YDYDD_LJFS");
					YDYDD_LJTB_SQ = rsbody.getString("YDYDD_LJTB_SQ")==null?"":rsbody.getString("YDYDD_LJTB_SQ");
					YDYDD_LJTB_SZ = rsbody.getString("YDYDD_LJTB_SZ")==null?"":rsbody.getString("YDYDD_LJTB_SZ");
					YDYDD_DQFZ = rsbody.getString("YDYDD_DQFZ")==null?"":rsbody.getString("YDYDD_DQFZ");
					YDYDD_DQTB_FZ = rsbody.getString("YDYDD_DQTB_FZ")==null?"":rsbody.getString("YDYDD_DQTB_FZ");
					YDYDD_BZWC = rsbody.getString("YDYDD_BZWC")==null?"":rsbody.getString("YDYDD_BZWC");
					YDYDD_LJFZ = rsbody.getString("YDYDD_LJFZ")==null?"":rsbody.getString("YDYDD_LJFZ");
					YDYDD_LJTB_FZ = rsbody.getString("YDYDD_LJTB_FZ")==null?"":rsbody.getString("YDYDD_LJTB_FZ");
					YDYDD_FZXG = rsbody.getString("YDYDD_FZXG")==null?"":rsbody.getString("YDYDD_FZXG");
					YDYDD_RXFZ = rsbody.getString("YDYDD_RXFZ")==null?"":rsbody.getString("YDYDD_RXFZ");
					YDYDD_PJMD = rsbody.getString("YDYDD_PJMD")==null?"":rsbody.getString("YDYDD_PJMD");
					YDYDD_ZGMD = rsbody.getString("YDYDD_ZGMD")==null?"":rsbody.getString("YDYDD_ZGMD");
					YDYDD_FSQY = rsbody.getString("YDYDD_FSQY")==null?"":rsbody.getString("YDYDD_FSQY");
					EDYDD_BZCD = rsbody.getString("EDYDD_BZCD")==null?"":rsbody.getString("EDYDD_BZCD");
					EDYDD_XZCD = rsbody.getString("EDYDD_XZCD")==null?"":rsbody.getString("EDYDD_XZCD");
					EDYDD_DQFS = rsbody.getString("EDYDD_DQFS")==null?"":rsbody.getString("EDYDD_DQFS");
					EDYDD_DQTB_FS = rsbody.getString("EDYDD_DQTB_FS")==null?"":rsbody.getString("EDYDD_DQTB_FS");
					EDYDD_BZFS = rsbody.getString("EDYDD_BZFS")==null?"":rsbody.getString("EDYDD_BZFS");
					EDYDD_LJFS = rsbody.getString("EDYDD_LJFS")==null?"":rsbody.getString("EDYDD_LJFS");
					EDYDD_LJTB_SQ = rsbody.getString("EDYDD_LJTB_SQ")==null?"":rsbody.getString("EDYDD_LJTB_SQ");
					EDYDD_LJTB_SZ = rsbody.getString("EDYDD_LJTB_SZ")==null?"":rsbody.getString("EDYDD_LJTB_SZ");
					EDYDD_DQFZ = rsbody.getString("EDYDD_DQFZ")==null?"":rsbody.getString("EDYDD_DQFZ");
					EDYDD_DQTB_FZ = rsbody.getString("EDYDD_DQTB_FZ")==null?"":rsbody.getString("EDYDD_DQTB_FZ");
					EDYDD_BZWC = rsbody.getString("EDYDD_BZWC")==null?"":rsbody.getString("EDYDD_BZWC");
					EDYDD_LJFZ = rsbody.getString("EDYDD_LJFZ")==null?"":rsbody.getString("EDYDD_LJFZ");
					EDYDD_LJTB_FZ = rsbody.getString("EDYDD_LJTB_FZ")==null?"":rsbody.getString("EDYDD_LJTB_FZ");
					EDYDD_FZXG = rsbody.getString("EDYDD_FZXG")==null?"":rsbody.getString("EDYDD_FZXG");
					EDYDD_RXFZ = rsbody.getString("EDYDD_RXFZ")==null?"":rsbody.getString("EDYDD_RXFZ");
					EDYDD_PJMD = rsbody.getString("EDYDD_PJMD")==null?"":rsbody.getString("EDYDD_PJMD");
					EDYDD_ZGMD = rsbody.getString("EDYDD_ZGMD")==null?"":rsbody.getString("EDYDD_ZGMD");
					EDYDD_FSQY = rsbody.getString("EDYDD_FSQY")==null?"":rsbody.getString("EDYDD_FSQY");
					SYQ = rsbody.getString("SYQ")==null?"":rsbody.getString("SYQ");
					FSQK = rsbody.getString("FSQK")==null?"":rsbody.getString("FSQK");
					FKQK = rsbody.getString("FKQK")==null?"":rsbody.getString("FKQK");
					FKFX = rsbody.getString("FKFX")==null?"":rsbody.getString("FKFX");
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
					style="text-align:center;font-size=30;width: ;height: "><b>草地螟周报表(<%=rwsj %>)</b><br>
					<br></td>
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
					<td>越冬代成虫</td>
					<td><label><%=YDD_BZCD%>级</label></td>
					<td><label><%=YDD_XZCD%>级</label></td>
					<td><label><%=YDD_DQFS%></label></td>
					<td><label><%=YDD_DQTB_FS%></label></td>
					<td><label><%=YDD_BZFS%></label></td>
					<td><label><%=YDD_LJFS%></label></td>
					<td><label><%=YDD_LJTB_SQ%></label></td>
					<td><label><%=YDD_LJTB_SZ%></label></td>
					<td><label><%=YDD_DQFZ%></label></td>
					<td><label><%=YDD_DQTB_FZ%></label></td>
					<td><label><%=YDD_BZWC%></label></td>
					<td><label><%=YDD_LJFZ%></label></td>
					<td><label><%=YDD_LJTB_FZ%></label></td>
					<td><label><%=YDD_FZXG%></label></td>
					<td><label><%=YDD_RXFZ%></label></td>
					<td>平均百步惊蛾（头）</td>
					<td><label><%=YDD_PJMD%></label></td>
					<td><label><%=YDD_ZGMD%></label></td>
					<td><label><%=YDD_FSQY%></label></td>
				</tr>
				<tr>
					<td>一代成虫</td>
					<td><label><%=YD_BZCD%>级</label></td>
					<td><label><%=YD_XZCD%>级</label></td>
					<td><label><%=YD_DQFS%></label></td>
					<td><label><%=YD_DQTB_FS%></label></td>
					<td><label><%=YD_BZFS%></label></td>
					<td><label><%=YD_LJFS%></label></td>
					<td><label><%=YD_LJTB_SQ%></label></td>
					<td><label><%=YD_LJTB_SZ%></label></td>
					<td><label><%=YD_DQFZ%></label></td>
					<td><label><%=YD_DQTB_FZ%></label></td>
					<td><label><%=YD_BZWC%></label></td>
					<td><label><%=YD_LJFZ%></label></td>
					<td><label><%=YD_LJTB_FZ%></label></td>
					<td><label><%=YD_FZXG%></label></td>
					<td><label><%=YD_RXFZ%></label></td>
					<td>平均百步惊蛾（头）</td>
					<td><label><%=YD_PJMD%></label></td>
					<td><label><%=YD_ZGMD%></label></td>
					<td><label><%=YD_FSQY%></label></td>
				</tr>
				<tr>
					<td>二代成虫</td>
					<td><label><%=ED_BZCD%>级</label></td>
					<td><label><%=ED_XZCD%>级</label></td>
					<td><label><%=ED_DQFS%></label></td>
					<td><label><%=ED_DQTB_FS%></label></td>
					<td><label><%=ED_BZFS%></label></td>
					<td><label><%=ED_LJFS%></label></td>
					<td><label><%=ED_LJTB_SQ%></label></td>
					<td><label><%=ED_LJTB_SZ%></label></td>
					<td><label><%=ED_DQFZ%></label></td>
					<td><label><%=ED_DQTB_FZ%></label></td>
					<td><label><%=ED_BZWC%></label></td>
					<td><label><%=ED_LJFZ%></label></td>
					<td><label><%=ED_LJTB_FZ%></label></td>
					<td><label><%=ED_FZXG%></label></td>
					<td><label><%=ED_RXFZ%></label></td>
					<td>平均百步惊蛾（头）</td>
					<td><label><%=ED_PJMD%></label></td>
					<td><label><%=ED_ZGMD%></label></td>
					<td><label><%=ED_FSQY%></label></td>
				</tr>
				<tr>
					<td>一代幼虫</td>
					<td><label><%=YDYDD_BZCD%>级</label></td>
					<td><label><%=YDYDD_XZCD%>级</label></td>
					<td><label><%=YDYDD_DQFS%></label></td>
					<td><label><%=YDYDD_DQTB_FS%></label></td>
					<td><label><%=YDYDD_BZFS%></label></td>
					<td><label><%=YDYDD_LJFS%></label></td>
					<td><label><%=YDYDD_LJTB_SQ%></label></td>
					<td><label><%=YDYDD_LJTB_SZ%></label></td>
					<td><label><%=YDYDD_DQFZ%></label></td>
					<td><label><%=YDYDD_DQTB_FZ%></label></td>
					<td><label><%=YDYDD_BZWC%></label></td>
					<td><label><%=YDYDD_LJFZ%></label></td>
					<td><label><%=YDYDD_LJTB_FZ%></label></td>
					<td><label><%=YDYDD_FZXG%></label></td>
					<td><label><%=YDYDD_RXFZ%></label></td>
					<td>幼虫平均数量（头/m2）</td>
					<td><label><%=YDYDD_PJMD%></label></td>
					<td><label><%=YDYDD_ZGMD%></label></td>
					<td><label><%=YDYDD_FSQY%></label></td>
				</tr>
				<tr>
					<td>二代幼虫</td>
					<td><label><%=EDYDD_BZCD%>级</label></td>
					<td><label><%=EDYDD_XZCD%>级</label></td>
					<td><label><%=EDYDD_DQFS%></label></td>
					<td><label><%=EDYDD_DQTB_FS%></label></td>
					<td><label><%=EDYDD_BZFS%></label></td>
					<td><label><%=EDYDD_LJFS%></label></td>
					<td><label><%=EDYDD_LJTB_SQ%></label></td>
					<td><label><%=EDYDD_LJTB_SZ%></label></td>
					<td><label><%=EDYDD_DQFZ%></label></td>
					<td><label><%=EDYDD_DQTB_FZ%></label></td>
					<td><label><%=EDYDD_BZWC%></label></td>
					<td><label><%=EDYDD_LJFZ%></label></td>
					<td><label><%=EDYDD_LJTB_FZ%></label></td>
					<td><label><%=EDYDD_FZXG%></label></td>
					<td><label><%=EDYDD_RXFZ%></label></td>
					<td>幼虫平均数量（头/m2）</td>
					<td><label><%=EDYDD_PJMD%></label></td>
					<td><label><%=EDYDD_ZGMD%></label></td>
					<td><label><%=EDYDD_FSQY%></label></td>
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
		xzsel('YDD_BZCD','<%=YDD_BZCD%>');
		xzsel('YDD_XZCD','<%=YDD_XZCD%>');
		xzsel('YD_BZCD','<%=YD_BZCD%>');
		xzsel('YD_XZCD','<%=YD_XZCD%>');
		xzsel('ED_BZCD','<%=ED_BZCD%>');
		xzsel('ED_XZCD','<%=ED_XZCD%>');
		xzsel('YDYDD_BZCD','<%=YDYDD_BZCD%>');
		xzsel('YDYDD_XZCD','<%=YDYDD_XZCD%>');
		xzsel('EDYDD_BZCD','<%=EDYDD_BZCD%>');
		xzsel('EDYDD_XZCD','<%=EDYDD_XZCD%>');
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
			if ($("input[name='YDD_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDD_DQFS']").val());
			}
			if ($("input[name='YD_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YD_DQFS']").val());
			}
			if ($("input[name='ED_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='ED_DQFS']").val());
			}
			if ($("input[name='YDYDD_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYDD_DQFS']").val());
			}
			if ($("input[name='EDYDD_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYDD_DQFS']").val());
			}
			$("input[name='HJ_DQFS']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDD_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDD_DQFS']").val());
			}
			if ($("input[name='YD_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YD_DQFS']").val());
			}
			if ($("input[name='ED_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='ED_DQFS']").val());
			}
			if ($("input[name='YDYDD_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYDD_DQFS']").val());
			}
			if ($("input[name='EDYDD_DQFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYDD_DQFS']").val());
			}
			$("input[name='HJ_DQFS']").val(zh);
		}
	}
	function bzfs(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YDD_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDD_BZFS']").val());
			}
			if ($("input[name='YD_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YD_BZFS']").val());
			}
			if ($("input[name='ED_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='ED_BZFS']").val());
			}
			if ($("input[name='YDYDD_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYDD_BZFS']").val());
			}
			if ($("input[name='EDYDD_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYDD_BZFS']").val());
			}
			$("input[name='HJ_BZFS']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDD_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDD_BZFS']").val());
			}
			if ($("input[name='YD_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YD_BZFS']").val());
			}
			if ($("input[name='ED_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='ED_BZFS']").val());
			}
			if ($("input[name='YDYDD_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYDD_BZFS']").val());
			}
			if ($("input[name='EDYDD_BZFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYDD_BZFS']").val());
			}
			$("input[name='HJ_BZFS']").val(zh);
		}
	}
	function ljfs(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YDD_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDD_LJFS']").val());
			}
			if ($("input[name='YD_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YD_LJFS']").val());
			}
			if ($("input[name='ED_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='ED_LJFS']").val());
			}
			if ($("input[name='YDYDD_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYDD_LJFS']").val());
			}
			if ($("input[name='EDYDD_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYDD_LJFS']").val());
			}
			$("input[name='HJ_LJFS']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDD_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDD_LJFS']").val());
			}
			if ($("input[name='YD_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YD_LJFS']").val());
			}
			if ($("input[name='ED_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='ED_LJFS']").val());
			}
			if ($("input[name='YDYDD_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYDD_LJFS']").val());
			}
			if ($("input[name='EDYDD_LJFS']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYDD_LJFS']").val());
			}
			$("input[name='HJ_LJFS']").val(zh);
		}
	}
	function dqfz(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YDD_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDD_DQFZ']").val());
			}
			if ($("input[name='YD_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YD_DQFZ']").val());
			}
			if ($("input[name='ED_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='ED_DQFZ']").val());
			}
			if ($("input[name='YDYDD_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYDD_DQFZ']").val());
			}
			if ($("input[name='EDYDD_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYDD_DQFZ']").val());
			}
			$("input[name='HJ_DQFZ']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDD_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDD_DQFZ']").val());
			}
			if ($("input[name='YD_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YD_DQFZ']").val());
			}
			if ($("input[name='ED_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='ED_DQFZ']").val());
			}
			if ($("input[name='YDYDD_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYDD_DQFZ']").val());
			}
			if ($("input[name='EDYDD_DQFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYDD_DQFZ']").val());
			}
			$("input[name='HJ_DQFZ']").val(zh);
		}
	}
	function bzwc(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YDD_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='YDD_BZWC']").val());
			}
			if ($("input[name='YD_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='YD_BZWC']").val());
			}
			if ($("input[name='ED_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='ED_BZWC']").val());
			}
			if ($("input[name='YDYDD_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYDD_BZWC']").val());
			}
			if ($("input[name='EDYDD_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYDD_BZWC']").val());
			}
			$("input[name='HJ_BZWC']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDD_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='YDD_BZWC']").val());
			}
			if ($("input[name='YD_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='YD_BZWC']").val());
			}
			if ($("input[name='ED_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='ED_BZWC']").val());
			}
			if ($("input[name='YDYDD_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYDD_BZWC']").val());
			}
			if ($("input[name='EDYDD_BZWC']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYDD_BZWC']").val());
			}
			$("input[name='HJ_BZWC']").val(zh);
		}
	}
	function ljfz(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YDD_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDD_LJFZ']").val());
			}
			if ($("input[name='YD_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YD_LJFZ']").val());
			}
			if ($("input[name='ED_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='ED_LJFZ']").val());
			}
			if ($("input[name='YDYDD_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYDD_LJFZ']").val());
			}
			if ($("input[name='EDYDD_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYDD_LJFZ']").val());
			}
			$("input[name='HJ_LJFZ']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDD_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDD_LJFZ']").val());
			}
			if ($("input[name='YD_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YD_LJFZ']").val());
			}
			if ($("input[name='ED_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='ED_LJFZ']").val());
			}
			if ($("input[name='YDYDD_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYDD_LJFZ']").val());
			}
			if ($("input[name='EDYDD_LJFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYDD_LJFZ']").val());
			}
			$("input[name='HJ_LJFZ']").val(zh);
		}
	}
	function rxfz(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YDD_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDD_RXFZ']").val());
			}
			if ($("input[name='YD_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YD_RXFZ']").val());
			}
			if ($("input[name='ED_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='ED_RXFZ']").val());
			}
			if ($("input[name='YDYDD_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYDD_RXFZ']").val());
			}
			if ($("input[name='EDYDD_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYDD_RXFZ']").val());
			}
			$("input[name='HJ_RXFZ']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDD_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDD_RXFZ']").val());
			}
			if ($("input[name='YD_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YD_RXFZ']").val());
			}
			if ($("input[name='ED_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='ED_RXFZ']").val());
			}
			if ($("input[name='YDYDD_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYDD_RXFZ']").val());
			}
			if ($("input[name='EDYDD_RXFZ']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYDD_RXFZ']").val());
			}
			$("input[name='HJ_RXFZ']").val(zh);
		}
	}
	function pjmd(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YDD_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='YDD_PJMD']").val());
			}
			if ($("input[name='YD_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='YD_PJMD']").val());
			}
			if ($("input[name='ED_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='ED_PJMD']").val());
			}
			if ($("input[name='YDYDD_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYDD_PJMD']").val());
			}
			if ($("input[name='EDYDD_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYDD_PJMD']").val());
			}
			$("input[name='HJ_PJMD']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDD_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='YDD_PJMD']").val());
			}
			if ($("input[name='YD_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='YD_PJMD']").val());
			}
			if ($("input[name='ED_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='ED_PJMD']").val());
			}
			if ($("input[name='YDYDD_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYDD_PJMD']").val());
			}
			if ($("input[name='EDYDD_PJMD']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYDD_PJMD']").val());
			}
			$("input[name='HJ_PJMD']").val(zh);
		}
	}
	function zgmd(obj) {
		var zh = 0.0;
		if (!isNaN(obj.value)) {
			if ($("input[name='YDD_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='YDD_ZGMD']").val());
			}
			if ($("input[name='YD_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='YD_ZGMD']").val());
			}
			if ($("input[name='ED_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='ED_ZGMD']").val());
			}
			if ($("input[name='YDYDD_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYDD_ZGMD']").val());
			}
			if ($("input[name='EDYDD_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYDD_ZGMD']").val());
			}
			$("input[name='HJ_ZGMD']").val(zh);
		} else {
			alert("请输入数字");
			obj.value = "";
			if ($("input[name='YDD_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='YDD_ZGMD']").val());
			}
			if ($("input[name='YD_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='YD_ZGMD']").val());
			}
			if ($("input[name='ED_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='ED_ZGMD']").val());
			}
			if ($("input[name='YDYDD_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='YDYDD_ZGMD']").val());
			}
			if ($("input[name='EDYDD_ZGMD']").val() != "") {
				zh = zh + parseFloat($("input[name='EDYDD_ZGMD']").val());
			}
			$("input[name='HJ_ZGMD']").val(zh);
		}
	}
</script>
</html>