<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="mt.database.extend.ExecuteConnection"%>
<%@page import="java.sql.PreparedStatement"%>
	<%
		String dbbzb_cx_id = request.getParameter("jfdbbzb_cx_id");
		String[] jg_ids = request.getParameterValues("jfdbbzb_jg_id");
		String[] opts = request.getParameterValues("jfdownup");
		String sql = "delete from dbbzb_cx_px where jfdbbzb_cx_id='" + dbbzb_cx_id + "'";
		ExecuteConnection ec = new ExecuteConnection();
		PreparedStatement pstmt = ec.con.prepareStatement(sql);
		if (pstmt.executeUpdate() >= 0) {
			for(int i=0; jg_ids != null && i<jg_ids.length; i++){
				sql = "insert into dbbzb_cx_px(jfid,JFDBBZB_CX_ID,JFDBBZB_JG_ID,JFDOWNUP) values(sequ_dbbzb_cx_px.nextval,'" 
						+ dbbzb_cx_id + "','" + jg_ids[i] + "','" + opts[i] + "')";
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
