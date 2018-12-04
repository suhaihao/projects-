<%@page import="java.sql.PreparedStatement"%>
<%@page import="mt.database.extend.ExecuteConnection"%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%
	String bbmc = request.getParameter("bbmc");
	String bbbm = request.getParameter("bbbm");
	String bbbm_o = request.getParameter("bbbm_o");
	String bbzl = request.getParameter("bbzl");
	String jfid = request.getParameter("jfid");
	String zt = request.getParameter("zt");
	String[] bblb = request.getParameterValues("bblb");
	String jflb = "";
	if (bblb != null) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < bblb.length; i++) {
			sb.append(bblb[i] + ",");
		}
		sb.deleteCharAt(sb.length()-1);
		jflb = sb.toString();
	}
	String jz_title = request.getParameter("jz_title");
	String jz_subtitle = request.getParameter("jz_subtitle");
	String jz_tabtitle = request.getParameter("jz_tabtitle");
	String jz_tabbody = request.getParameter("jz_tabbody");
	String jz_tabend = request.getParameter("jz_tabend");
	
	String dx_title    = request.getParameter("dx_title");
	String dx_subtitle = request.getParameter("dx_subtitle");
	String dx_tabtitle = request.getParameter("dx_tabtitle");
	String dx_tabbody  = request.getParameter("dx_tabbody");
	String dx_tabend   = request.getParameter("dx_tabend");
	
	String kd_title    = request.getParameter("kd_title");
	String kd_subtitle = request.getParameter("kd_subtitle");
	String kd_tabtitle = request.getParameter("kd_tabtitle");
	String kd_tabbody  = request.getParameter("kd_tabbody");
	String kd_tabend   = request.getParameter("kd_tabend");
	
	String lrry = ((User)session.getAttribute("user")).getUserjfid();
	String lrrq = "sysdate";
	if (zt == null) zt = "0";
	
	ExecuteConnection ec = new ExecuteConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	//查询报表编码是否已存在
	String sql = "SELECT JFCODE FROM DBBZB WHERE JFCODE='" + bbbm + "'";
	if (bbbm_o != null && !"".equals(bbbm_o)) { // no modify bbbm
		sql = "SELECT JFCODE FROM DBBZB WHERE JFCODE='" + bbbm + "' AND JFCODE<>'" + bbbm_o + "'";
	}
	pstmt = ec.con.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if (rs.next()) {
		out.write("<script>alert('报表编码已存在');</script>");
		if (jfid == null || "".equals(jfid)) {
			out.write("<script>window.location='/insect/system/bb/add.jsp';</script>");
		} else {
			out.write("<script>window.location='/insect/system/bb/update.jsp?jfid=" + jfid + "';</script>");
		}
		rs.close();
		pstmt.close();
		ec.close();
		return;
	}
	if (jfid == null || "".equals(jfid)) {
		// 生成主键JFID
		sql = "SELECT MAX(TO_NUMBER(JFID))+1 FROM DBBZB";
		pstmt = ec.con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			jfid = rs.getString(1);
		}
		rs.close();
		
		sql = "INSERT INTO DBBZB (JFID, JFTABNAME, JFCODE, JFLISTER, JFLISTDATE, JFSTATE, " 
				+ "JFTITLESIZE, JFTITLEWEIGHT, JFTITLEWIDTH, JFSUBHEADSIZE, JFSUBHEADWEIGHT, JFSUBHEADWIDTH, JFTABHEADSIZE, " 
				+ "JFTABHEADWEIGHT, JFTABHEADWIDTH, JFTABBODYSIZE, JFTABBODYWEIGHT, JFTABBODYWIDTH, JFTABENDSIZE, JFTABENDWEIGHT, " 
				+ "JFTABENDWIDTH, JFTABSORT,JFLB) SELECT '" + jfid + "','" 
				+ bbmc + "','" + bbbm + "','" + lrry + "'," 
				+ lrrq + ",'" + zt + "','" + dx_title + "','" + jz_title + "','" + kd_title + "','" 
				+ dx_subtitle + "','" + jz_subtitle + "','" + kd_subtitle + "','" + dx_tabtitle + "','" 
				+ jz_tabtitle + "','" + kd_tabtitle + "','" + dx_tabbody + "','" + jz_tabbody + "','" 
				+ kd_tabbody + "','" + dx_tabend + "','" + jz_tabend + "','" + kd_tabend + "','" 
				+ bbzl + "','" + jflb + "' FROM DUAL";
	} else {
		sql = "UPDATE DBBZB SET JFTABNAME='" + bbmc + "', JFCODE='" + bbbm + "', JFSTATE='" + zt + "', " 
			+ "JFTITLESIZE='" + dx_title + "', JFTITLEWEIGHT='" + jz_title + "', JFTITLEWIDTH='" + kd_title 
			+ "', JFSUBHEADSIZE='" + dx_subtitle + "', JFSUBHEADWEIGHT='" + jz_subtitle + "', JFSUBHEADWIDTH='" 
			+ kd_subtitle + "', JFTABHEADSIZE='" + dx_tabtitle + "', " 
			+ "JFTABHEADWEIGHT='" + jz_tabtitle + "', JFTABHEADWIDTH='" + kd_tabtitle + "', JFTABBODYSIZE='" 
			+ dx_tabbody + "', JFTABBODYWEIGHT='" + jz_tabbody + "', JFTABBODYWIDTH='" + kd_tabbody + "', JFTABENDSIZE='" 
			+ dx_tabend + "', JFTABENDWEIGHT='" + jz_tabend + "', " 
			+ "JFTABENDWIDTH='" + kd_tabend + "', JFTABSORT='" + bbzl + "',JFLB='" + jflb + "' WHERE JFID='" + jfid + "'";
	}
	pstmt = ec.con.prepareStatement(sql);
	if (pstmt.executeUpdate() > 0) {
		ec.con.commit();
		out.write("<script>alert('保存成功！');window.location='/insect/system/bb/update.jsp?jfid=" + jfid + "';</script>");
	} else {
		ec.con.close();
		if (jfid == null || "".equals(jfid)) {
			out.write("<script>alert('保存失败！');window.location='/insect/system/bb/add.jsp';</script>");
		} else {
			out.write("<script>alert('保存失败！');window.location='/insect/system/bb/update.jsp?jfid=" + jfid + "';</script>");
		}
	}
	pstmt.close();
	ec.con.close();
%>