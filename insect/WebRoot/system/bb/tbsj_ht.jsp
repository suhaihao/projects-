<%@ page language="java" pageEncoding="GBK"%>
<%@page import="mt.database.extend.ExecuteConnection"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%@page import="java.sql.Statement"%>
<%
	String act = request.getParameter("act");
	ExecuteConnection ec = new ExecuteConnection();
	Statement stmt = ec.con.createStatement();
	String sql = "";
	String zbid = request.getParameter("zbid");
	if ("save".equals(act)) { // add, update
		String[] tbrqs = request.getParameterValues("tbrq");
		String[] kststs = request.getParameterValues("kststs");
		String[] kstbts = request.getParameterValues("kstbts");
		String[] jztbts = request.getParameterValues("jztbts");
		String[] jzcbts = request.getParameterValues("jzcbts");
		String[] jfids = request.getParameterValues("jfid");
		User user = (User) session.getAttribute("user");
		
		ec.con.setAutoCommit(false);
		boolean err = false;
		for (int i = 0; jfids != null && i < jfids.length; i++) {
			if ("".equals(jfids[i]) || jfids[i] == null) { // add
				sql = "INSERT INTO DBBZB_TBRQ (JFID,JFDBBZB_ID,TBRQ,KSTSTS,KSTBTS,JZTBTS,JZCBTS,DYBM,LRRQ,LRRY) VALUES (SEQU_DBBZB_TBRQ.NEXTVAL,'" 
						+ zbid + "',TO_DATE('" + tbrqs[i] + "','YYYY-MM-DD'),'" + kststs[i] + "','" + kstbts[i] + "','" + jztbts[i] 
						+ "','" + jzcbts[i] + "','D" + zbid + "_HEAD',SYSDATE,'" + user.getUserid() + "')";
			} else { // update
				sql = "UPDATE DBBZB_TBRQ SET TBRQ=TO_DATE('" + tbrqs[i] + "','YYYY-MM-DD'),KSTSTS='" + kststs[i] + "',KSTBTS='" 
					+ kstbts[i] + "',JZTBTS='" + jztbts[i] + "',JZCBTS='" + jzcbts[i] + "' WHERE JFID='" + jfids[i] + "'";
			}
			if (stmt.executeUpdate(sql) <= 0) {
				err = true;
				break;
			}
		}
		if (!err) {
			ec.con.commit();
			out.write("<script>alert('±£´æ³É¹¦£¡');window.location='/insect/system/bb/tbsj.jsp?id=" + zbid + "';</script>");
		} else {
			ec.con.rollback();
			out.write("<script>alert('±£´æÊ§°Ü£¡');window.location='/insect/system/bb/tbsj.jsp?id=" + zbid + "';</script>");
		}
		ec.con.setAutoCommit(true);
		stmt.close();
		ec.close();
	} else if ("del".equals(act)) { // delete
		String jfid = request.getParameter("id");
		sql = "DELETE FROM DBBZB_TBRQ WHERE JFID='" + jfid + "'";
		if (stmt.executeUpdate(sql) > 0) {
			ec.con.commit();
			out.write("<script>alert('É¾³ý³É¹¦£¡');window.location='/insect/system/bb/tbsj.jsp?id=" + zbid + "';</script>");
		} else {
			ec.con.rollback();
			out.write("<script>alert('É¾³ýÊ§°Ü£¡');window.location='/insect/system/bb/tbsj.jsp?id=" + zbid + "';</script>");
		}
	}
%>