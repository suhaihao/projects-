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
			ExecuteConnection ecbody = new ExecuteConnection();
			PreparedStatement pstmtbody = null;
			ResultSet rsbody = null;
			try {
				String sql = "select "
						    +"sum(YDYMM_DQFS) YDYMM_DQFS,"
						    +"sum(EDYMM_DQFS) EDYMM_DQFS,"
						    +"sum(SDYMM_DQFS) SDYMM_DQFS,"
						    +"sum(EDNC_DQFS) EDNC_DQFS,"
						    +"sum(SDNC_DQFS) SDNC_DQFS,"
						    +"sum(YC_DQFS) YC_DQFS,"
						    +"sum(EDMLC_DQFS) EDMLC_DQFS,"
						    +"sum(HJ_DQFS) HJ_DQFS,"
						    +"sum(YDYMM_BZFS) YDYMM_BZFS,"
						    +"sum(EDYMM_BZFS) EDYMM_BZFS,"
						    +"sum(SDYMM_BZFS) SDYMM_BZFS,"
						    +"sum(EDNC_BZFS) EDNC_BZFS,"
						    +"sum(SDNC_BZFS) SDNC_BZFS,"
						    +"sum(YC_BZFS) YC_BZFS,"
						    +"sum(EDMLC_BZFS) EDMLC_BZFS,"
						    +"sum(HJ_BZFS) HJ_BZFS,"
						    +"sum(YDYMM_LJFS) YDYMM_LJFS,"
						    +"sum(EDYMM_LJFS) EDYMM_LJFS,"
						    +"sum(SDYMM_LJFS) SDYMM_LJFS,"
						    +"sum(EDNC_LJFS) EDNC_LJFS,"
						    +"sum(SDNC_LJFS) SDNC_LJFS,"
						    +"sum(YC_LJFS) YC_LJFS,"
						    +"sum(EDMLC_LJFS) EDMLC_LJFS,"
						    +"sum(HJ_LJFS) HJ_LJFS,"
						    +"sum(YDYMM_DQFZ) YDYMM_DQFZ,"
						    +"sum(EDYMM_DQFZ) EDYMM_DQFZ,"
						    +"sum(SDYMM_DQFZ) SDYMM_DQFZ,"
						    +"sum(EDNC_DQFZ) EDNC_DQFZ,"
						    +"sum(SDNC_DQFZ) SDNC_DQFZ,"
						    +"sum(YC_DQFZ) YC_DQFZ,"
						    +"sum(EDMLC_DQFZ) EDMLC_DQFZ,"
						    +"sum(HJ_DQFZ) HJ_DQFZ,"
						    +"sum(YDYMM_BZWC) YDYMM_BZWC,"
						    +"sum(EDYMM_BZWC) EDYMM_BZWC,"
						    +"sum(SDYMM_BZWC) SDYMM_BZWC,"
						    +"sum(EDNC_BZWC) EDNC_BZWC,"
						    +"sum(SDNC_BZWC) SDNC_BZWC,"
						    +"sum(YC_BZWC) YC_BZWC,"
						    +"sum(EDMLC_BZWC) EDMLC_BZWC,"
						    +"sum(HJ_BZWC) HJ_BZWC,"
						    +"sum(YDYMM_LJFZ) YDYMM_LJFZ,"
						    +"sum(EDYMM_LJFZ) EDYMM_LJFZ,"
						    +"sum(SDYMM_LJFZ) SDYMM_LJFZ,"
						    +"sum(EDNC_LJFZ) EDNC_LJFZ,"
						    +"sum(SDNC_LJFZ) SDNC_LJFZ,"
						    +"sum(YC_LJFZ) YC_LJFZ,"
						    +"sum(EDMLC_LJFZ) EDMLC_LJFZ,"
						    +"sum(HJ_LJFZ) HJ_LJFZ,"
						    +"trunc(avg(YDYMM_FZXG),2) YDYMM_FZXG,"
						    +"trunc(avg(EDYMM_FZXG),2) EDYMM_FZXG,"
						    +"trunc(avg(SDYMM_FZXG),2) SDYMM_FZXG,"
						    +"trunc(avg(HJ_FZXG),2) HJ_FZXG,"
						    +"sum(YDYMM_RXFZ) YDYMM_RXFZ,"
						    +"sum(EDYMM_RXFZ) EDYMM_RXFZ,"
						    +"sum(SDYMM_RXFZ) SDYMM_RXFZ,"
						    +"sum(HJ_RXFZ) HJ_RXFZ,"
						    +"trunc(avg(YDYMM_PJMD_BH),2) YDYMM_PJMD_BH,"
						    +"trunc(avg(EDYMM_PJMD_BH),2) EDYMM_PJMD_BH,"
						    +"trunc(avg(SDYMM_PJMD_BH),2) SDYMM_PJMD_BH,"
						    +"trunc(avg(YDYMM_PJMD_BZ),2) YDYMM_PJMD_BZ,"
						    +"trunc(avg(EDYMM_PJMD_BZ),2) EDYMM_PJMD_BZ,"
						    +"trunc(avg(SDYMM_PJMD_BZ),2) SDYMM_PJMD_BZ,"
						    +"max(YDYMM_ZGMD_BH) YDYMM_ZGMD_BH,"
							+"max(EDYMM_ZGMD_BH) EDYMM_ZGMD_BH,"
							+"max(SDYMM_ZGMD_BH) SDYMM_ZGMD_BH,"
						    +"max(YDYMM_ZGMD_BZ) YDYMM_ZGMD_BZ,"
							+"max(EDYMM_ZGMD_BZ) EDYMM_ZGMD_BZ,"
							+"max(SDYMM_ZGMD_BZ) SDYMM_ZGMD_BZ"
				            +" from D002 "
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
					HJ_DQFS=rsbody.getString("HJ_DQFS")==null?"":rsbody.getString("HJ_DQFS");
					HJ_BZFS=rsbody.getString("HJ_BZFS")==null?"":rsbody.getString("HJ_BZFS");
					HJ_LJFS=rsbody.getString("HJ_LJFS")==null?"":rsbody.getString("HJ_LJFS");
					HJ_DQFZ=rsbody.getString("HJ_DQFZ")==null?"":rsbody.getString("HJ_DQFZ");
					HJ_BZWC=rsbody.getString("HJ_BZWC")==null?"":rsbody.getString("HJ_BZWC");
					HJ_LJFZ=rsbody.getString("HJ_LJFZ")==null?"":rsbody.getString("HJ_LJFZ");
					HJ_FZXG=rsbody.getString("HJ_FZXG")==null?"":rsbody.getString("HJ_FZXG");
					HJ_RXFZ=rsbody.getString("HJ_RXFZ")==null?"":rsbody.getString("HJ_RXFZ");
					YDYMM_DQFS=rsbody.getString("YDYMM_DQFS")==null?"":rsbody.getString("YDYMM_DQFS");
					YDYMM_BZFS=rsbody.getString("YDYMM_BZFS")==null?"":rsbody.getString("YDYMM_BZFS");
					YDYMM_LJFS=rsbody.getString("YDYMM_LJFS")==null?"":rsbody.getString("YDYMM_LJFS");
					YDYMM_DQFZ=rsbody.getString("YDYMM_DQFZ")==null?"":rsbody.getString("YDYMM_DQFZ");
					YDYMM_BZWC=rsbody.getString("YDYMM_BZWC")==null?"":rsbody.getString("YDYMM_BZWC");
					YDYMM_LJFZ=rsbody.getString("YDYMM_LJFZ")==null?"":rsbody.getString("YDYMM_LJFZ");
					YDYMM_FZXG=rsbody.getString("YDYMM_FZXG")==null?"":rsbody.getString("YDYMM_FZXG");
					YDYMM_RXFZ=rsbody.getString("YDYMM_RXFZ")==null?"":rsbody.getString("YDYMM_RXFZ");
					YDYMM_PJMD_BH=rsbody.getString("YDYMM_PJMD_BH")==null?"":rsbody.getString("YDYMM_PJMD_BH");
					YDYMM_ZGMD_BH=rsbody.getString("YDYMM_ZGMD_BH")==null?"":rsbody.getString("YDYMM_ZGMD_BH");
					YDYMM_PJMD_BZ=rsbody.getString("YDYMM_PJMD_BZ")==null?"":rsbody.getString("YDYMM_PJMD_BZ");
					YDYMM_ZGMD_BZ=rsbody.getString("YDYMM_ZGMD_BZ")==null?"":rsbody.getString("YDYMM_ZGMD_BZ");
					EDYMM_DQFS=rsbody.getString("EDYMM_DQFS")==null?"":rsbody.getString("EDYMM_DQFS");
					EDYMM_BZFS=rsbody.getString("EDYMM_BZFS")==null?"":rsbody.getString("EDYMM_BZFS");
					EDYMM_LJFS=rsbody.getString("EDYMM_LJFS")==null?"":rsbody.getString("EDYMM_LJFS");
					EDYMM_DQFZ=rsbody.getString("EDYMM_DQFZ")==null?"":rsbody.getString("EDYMM_DQFZ");
					EDYMM_BZWC=rsbody.getString("EDYMM_BZWC")==null?"":rsbody.getString("EDYMM_BZWC");
					EDYMM_LJFZ=rsbody.getString("EDYMM_LJFZ")==null?"":rsbody.getString("EDYMM_LJFZ");
					EDYMM_FZXG=rsbody.getString("EDYMM_FZXG")==null?"":rsbody.getString("EDYMM_FZXG");
					EDYMM_RXFZ=rsbody.getString("EDYMM_RXFZ")==null?"":rsbody.getString("EDYMM_RXFZ");
					EDYMM_PJMD_BH=rsbody.getString("EDYMM_PJMD_BH")==null?"":rsbody.getString("EDYMM_PJMD_BH");
					EDYMM_ZGMD_BH=rsbody.getString("EDYMM_ZGMD_BH")==null?"":rsbody.getString("EDYMM_ZGMD_BH");
					EDYMM_PJMD_BZ=rsbody.getString("EDYMM_PJMD_BZ")==null?"":rsbody.getString("EDYMM_PJMD_BZ");
					EDYMM_ZGMD_BZ=rsbody.getString("EDYMM_ZGMD_BZ")==null?"":rsbody.getString("EDYMM_ZGMD_BZ");
					SDYMM_DQFS=rsbody.getString("SDYMM_DQFS")==null?"":rsbody.getString("SDYMM_DQFS");
					SDYMM_BZFS=rsbody.getString("SDYMM_BZFS")==null?"":rsbody.getString("SDYMM_BZFS");
					SDYMM_LJFS=rsbody.getString("SDYMM_LJFS")==null?"":rsbody.getString("SDYMM_LJFS");
					SDYMM_DQFZ=rsbody.getString("SDYMM_DQFZ")==null?"":rsbody.getString("SDYMM_DQFZ");
					SDYMM_BZWC=rsbody.getString("SDYMM_BZWC")==null?"":rsbody.getString("SDYMM_BZWC");
					SDYMM_LJFZ=rsbody.getString("SDYMM_LJFZ")==null?"":rsbody.getString("SDYMM_LJFZ");
					SDYMM_FZXG=rsbody.getString("SDYMM_FZXG")==null?"":rsbody.getString("SDYMM_FZXG");
					SDYMM_RXFZ=rsbody.getString("SDYMM_RXFZ")==null?"":rsbody.getString("SDYMM_RXFZ");
					SDYMM_PJMD_BH=rsbody.getString("SDYMM_PJMD_BH")==null?"":rsbody.getString("SDYMM_PJMD_BH");
					SDYMM_ZGMD_BH=rsbody.getString("SDYMM_ZGMD_BH")==null?"":rsbody.getString("SDYMM_ZGMD_BH");
					SDYMM_PJMD_BZ=rsbody.getString("SDYMM_PJMD_BZ")==null?"":rsbody.getString("SDYMM_PJMD_BZ");
					SDYMM_ZGMD_BZ=rsbody.getString("SDYMM_ZGMD_BZ")==null?"":rsbody.getString("SDYMM_ZGMD_BZ");
					EDNC_DQFS=rsbody.getString("EDNC_DQFS")==null?"":rsbody.getString("EDNC_DQFS");
					EDNC_BZFS=rsbody.getString("EDNC_BZFS")==null?"":rsbody.getString("EDNC_BZFS");
					EDNC_LJFS=rsbody.getString("EDNC_LJFS")==null?"":rsbody.getString("EDNC_LJFS");
					EDNC_DQFZ=rsbody.getString("EDNC_DQFZ")==null?"":rsbody.getString("EDNC_DQFZ");
					EDNC_BZWC=rsbody.getString("EDNC_BZWC")==null?"":rsbody.getString("EDNC_BZWC");
					EDNC_LJFZ=rsbody.getString("EDNC_LJFZ")==null?"":rsbody.getString("EDNC_LJFZ");
					SDNC_DQFS=rsbody.getString("SDNC_DQFS")==null?"":rsbody.getString("SDNC_DQFS");
					SDNC_BZFS=rsbody.getString("SDNC_BZFS")==null?"":rsbody.getString("SDNC_BZFS");
					SDNC_LJFS=rsbody.getString("SDNC_LJFS")==null?"":rsbody.getString("SDNC_LJFS");
					SDNC_DQFZ=rsbody.getString("SDNC_DQFZ")==null?"":rsbody.getString("SDNC_DQFZ");
					SDNC_BZWC=rsbody.getString("SDNC_BZWC")==null?"":rsbody.getString("SDNC_BZWC");
					SDNC_LJFZ=rsbody.getString("SDNC_LJFZ")==null?"":rsbody.getString("SDNC_LJFZ");
					YC_DQFS=rsbody.getString("YC_DQFS")==null?"":rsbody.getString("YC_DQFS");
					YC_BZFS=rsbody.getString("YC_BZFS")==null?"":rsbody.getString("YC_BZFS");
					YC_LJFS=rsbody.getString("YC_LJFS")==null?"":rsbody.getString("YC_LJFS");
					YC_DQFZ=rsbody.getString("YC_DQFZ")==null?"":rsbody.getString("YC_DQFZ");
					YC_BZWC=rsbody.getString("YC_BZWC")==null?"":rsbody.getString("YC_BZWC");
					YC_LJFZ=rsbody.getString("YC_LJFZ")==null?"":rsbody.getString("YC_LJFZ");
					EDMLC_DQFS=rsbody.getString("EDMLC_DQFS")==null?"":rsbody.getString("EDMLC_DQFS");
					EDMLC_BZFS=rsbody.getString("EDMLC_BZFS")==null?"":rsbody.getString("EDMLC_BZFS");
					EDMLC_LJFS=rsbody.getString("EDMLC_LJFS")==null?"":rsbody.getString("EDMLC_LJFS");
					EDMLC_DQFZ=rsbody.getString("EDMLC_DQFZ")==null?"":rsbody.getString("EDMLC_DQFZ");
					EDMLC_BZWC=rsbody.getString("EDMLC_BZWC")==null?"":rsbody.getString("EDMLC_BZWC");
					EDMLC_LJFZ=rsbody.getString("EDMLC_LJFZ")==null?"":rsbody.getString("EDMLC_LJFZ");
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
					style="text-align:center;font-size=30;width: ;height: "><b>玉米病虫周报表</b><br>
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
					<td rowspan="3"><label><%=EDYMM_BZCD%></label></td>
					<td rowspan="3"><label><%=EDYMM_XZCD%></label></td>
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
					<td rowspan="3"><label><%=SDYMM_BZCD%></label></td>
					<td rowspan="3"><label><%=SDYMM_XZCD%></label></td>
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
					<td rowspan="3"><label><%=EDNC_BZCD%></label></td>
					<td rowspan="3"><label><%=EDNC_XZCD%></label></td>
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
					<td rowspan="3"><label><%=SDNC_BZCD%></label></td>
					<td rowspan="3"><label><%=SDNC_XZCD%></label></td>
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
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td>百株蚜量(头/百株)</td>
					<td style="text-align: center;">/</td>
					<td style="text-align: center;">/</td>
					<td><label><%=YC_FSQY%></label></td>
				</tr>
				<tr>
					<td>二代棉铃虫</td>
					<td><label><%=EDMLC_BZCD%></label></td>
					<td><label><%=EDMLC_XZCD%></label></td>
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