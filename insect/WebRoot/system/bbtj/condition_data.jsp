<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="mt.database.extend.ExecuteConnection"%>
<%@page import="java.sql.PreparedStatement"%>
	<%
		String dbbzb_tj_id = request.getParameter("jfdbbzb_tj_id");
		String[] jg_ids = request.getParameterValues("jfdbbzb_jg_id");
		String[] opts = request.getParameterValues("jfoperation");
		String sql = "delete from dtjbb_tj where jfdbbzb_tj_id='" + dbbzb_tj_id + "'";
		ExecuteConnection ec = new ExecuteConnection();
		PreparedStatement pstmt = ec.con.prepareStatement(sql);		
		if (pstmt.executeUpdate() >= 0) {
			for(int i=0; jg_ids != null && i<jg_ids.length; i++){
				sql = "insert into dtjbb_tj(jfid,JFDBBZB_TJ_ID,JFDBBZB_JG_ID,JFOPERATION) values(sequ_dtjbb_tj.nextval,'" 
						+ dbbzb_tj_id + "','" + jg_ids[i] + "','" + opts[i] + "')";
				pstmt = ec.con.prepareStatement(sql);
				pstmt.executeUpdate();
			}
			ec.commit();
			out.print("<script>window.close();opener.location.reload();</script>");
		} else {
			ec.rollback();
			out.print("<script>alert('±£¥Ê ß∞‹');window.close();</script>");
		}
		pstmt.close();
		ec.close();
	%>
