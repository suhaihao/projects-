<%@page import="mt.database.extend.ExecuteConnection"%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="java.sql.Statement"%>
<%
	String act = request.getParameter("act");
	String zbid = request.getParameter("zbid");
	String colvest = request.getParameter("jfcolvest");

	ExecuteConnection ec = new ExecuteConnection();
	Statement stmt = ec.con.createStatement();
	if ("save".equals(act)) { // save
		String[] jfid = request.getParameterValues("jfid");
		String[] lbm = request.getParameterValues("lbm");
		String[] lmc = request.getParameterValues("lmc");
		String[] lg = request.getParameterValues("lg");
		String[] lk = request.getParameterValues("lk");
		String[] llsx = request.getParameterValues("llsx");
		String[] lhsx = request.getParameterValues("lhsx");
		String[] lls = request.getParameterValues("lls");
		String[] lhs = request.getParameterValues("lhs");
		String[] lbs = request.getParameterValues("lbs");
		String[] lsx = request.getParameterValues("lsx");
		String[] lsfjb = request.getParameterValues("lsfjb");
		String[] lgs = request.getParameterValues("lgs");
		String sfh = request.getParameter("sfh"); // 0:列定义;1:行定义

		ec.con.setAutoCommit(false);
		String sql = "";
		boolean err = false;
		if ("1".equals(sfh)) {
			String[] jfid2 = request.getParameterValues("jfid2");
			String[] lbm2 = request.getParameterValues("lbm2");
			String[] lmc2 = request.getParameterValues("lmc2");
			String[] lg2 = request.getParameterValues("lg2");
			String[] lk2 = request.getParameterValues("lk2");
			String[] llsx2 = request.getParameterValues("llsx2");
			String[] lhsx2 = request.getParameterValues("lhsx2");
			String[] lls2 = request.getParameterValues("lls2");
			String[] lhs2 = request.getParameterValues("lhs2");
			String[] lbs2 = request.getParameterValues("lbs2");
			String[] lsx2 = request.getParameterValues("lsx2");
			String[] lsfjb2 = request.getParameterValues("lsfjb2");
			String[] lgs2 = request.getParameterValues("lgs2");
			for (int i = 0; jfid2 !=null && i < jfid2.length; i++) {
				if ("".equals(jfid2[i]) || jfid2[i] == null) {
					sql = "INSERT INTO DBBZB_GS_H (JFID, JFDBBZB_ID, JFCOLNAME, JFCOLCODE, JFCOLWIDTH, JFCOLHEIGHT, JFCOLNUMBER, JFCOLROWS, JFCOLORDER, JFCOLROWORD, JFCOLID, JFCOLATTR, JFBASECOL, JFCOLVEST) VALUES (SEQU_DBBZB_GS_H.NEXTVAL,'" 
						+ zbid + "','" + lmc2[i] + "','" + lbm2[i] + "','" + lk2[i] + "','" + lg2[i] + "','" + lls2[i] + "','" + lhs2[i] + "','" + llsx2[i] + "','" + lhsx2[i] + "','" + lbs2[i] + "','" + lsx2[i] + "','" + lsfjb2[i] + "','" + lgs2[i] + "')";
				} else {
					sql = "UPDATE DBBZB_GS_H SET JFCOLNAME='" + lmc2[i] + "', JFCOLCODE='" + lbm2[i] 
						+ "', JFCOLWIDTH='" + lk2[i] + "', JFCOLHEIGHT='" + lg2[i] + "', JFCOLNUMBER='" + lls2[i] 
						+ "', JFCOLROWS='" + lhs2[i] + "', JFCOLORDER='" + llsx2[i] + "', JFCOLROWORD='" + lhsx2[i] 
						+ "', JFCOLID='" + lbs2[i] + "', JFCOLATTR='" + lsx2[i] + "', JFBASECOL='" + lsfjb2[i] 
						+ "', JFCOLVEST='" + lgs2[i] + "' WHERE JFID='" + jfid2[i] + "'";
				}
				if (stmt.executeUpdate(sql) <= 0) {
					err = true;
					break;
				}
			}
		} else {
			for (int i = 0; jfid !=null && i < jfid.length; i++) {
				if ("".equals(jfid[i]) || jfid[i] == null) {
					sql = "INSERT INTO DBBZB_GS (JFID, JFDBBZB_ID, JFCOLNAME, JFCOLCODE, JFCOLWIDTH, JFCOLHEIGHT, JFCOLNUMBER, JFCOLROWS, JFCOLORDER, JFCOLROWORD, JFCOLID, JFCOLATTR, JFBASECOL, JFCOLVEST) VALUES (SEQU_DBBZB_GS.NEXTVAL,'" 
						+ zbid + "','" + lmc[i] + "','" + lbm[i] + "','" + lk[i] + "','" + lg[i] + "','" + lls[i] + "','" + lhs[i] + "','" + llsx[i] + "','" + lhsx[i] + "','" + lbs[i] + "','" + lsx[i] + "','" + lsfjb[i] + "','" + lgs[i] + "')";
				} else {
					sql = "UPDATE DBBZB_GS SET JFCOLNAME='" + lmc[i] + "', JFCOLCODE='" + lbm[i] 
						+ "', JFCOLWIDTH='" + lk[i] + "', JFCOLHEIGHT='" + lg[i] + "', JFCOLNUMBER='" + lls[i] 
						+ "', JFCOLROWS='" + lhs[i] + "', JFCOLORDER='" + llsx[i] + "', JFCOLROWORD='" + lhsx[i] 
						+ "', JFCOLID='" + lbs[i] + "', JFCOLATTR='" + lsx[i] + "', JFBASECOL='" + lsfjb[i] 
						+ "', JFCOLVEST='" + lgs[i] + "' WHERE JFID='" + jfid[i] + "'";
				}
				if (stmt.executeUpdate(sql) <= 0) {
					err = true;
					break;
				}
			}
		}
		if (!err) {
			ec.commit();
			out.write("<script>alert('保存成功!');window.location='/insect/system/bb/list2.jsp?zbid=" 
					+ zbid + "&jfcolvest=" + colvest + "';</script>");
		} else {
			ec.rollback();
			out.write("<script>alert('保存失败!');window.location='/insect/system/bb/list2.jsp?zbid=" 
					+ zbid + "&jfcolvest=" + colvest + "';</script>");
		}
		ec.con.setAutoCommit(true);
	} else if ("delcr".equals(act)) { // delete
		String id = request.getParameter("delid");
		String dt = request.getParameter("dt"); // delete type. c:column; r:row
		String sql = "DELETE FROM DBBZB_GS_H WHERE 1=2";
		if ("c".equals(dt)) { // delete column
			sql = "DELETE FROM DBBZB_GS WHERE JFID='" + id + "'";
		} else if ("r".equals(dt)) { // delete row
			sql = "DELETE FROM DBBZB_GS_H WHERE JFID='" + id + "'";
		}
		if (stmt.executeUpdate(sql) > 0) {
			out.write("<script>alert('删除成功!');window.location='/insect/system/bb/list2.jsp?zbid=" 
					+ zbid + "&jfcolvest=" + colvest + "';</script>");
		} else {
			out.write("<script>alert('删除成功!');window.location='/insect/system/bb/list2.jsp?zbid=" 
					+ zbid + "&jfcolvest=" + colvest + "';</script>");
		}
	}
	stmt.close();
	ec.close();
%>