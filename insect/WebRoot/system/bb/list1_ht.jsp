<%@page import="java.sql.Statement"%>
<%@page import="mt.database.extend.ExecuteConnection"%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	String act = request.getParameter("act");
	String zbid = request.getParameter("zbid");
	String colvest = request.getParameter("jfcolvest");
	ExecuteConnection ec = new ExecuteConnection();
	Statement stmt = ec.con.createStatement();
	if ("save".equals(act)) { // save 
		String[] jfid = request.getParameterValues("jfid");
		String[] lmc = request.getParameterValues("lmc");
		String[] lbm = request.getParameterValues("lbm");
		String[] llx = request.getParameterValues("llx");
		String[] lc = request.getParameterValues("lc");
		String[] lxsws = request.getParameterValues("lxsws");
		String[] lnull = request.getParameterValues("lnull");
		String[] lgs = request.getParameterValues("lgs");
		String[] lclfs = request.getParameterValues("lclfs");
		String[] lclff = request.getParameterValues("lclff");
		String[] ljsgx = request.getParameterValues("ljsgx");
		String[] ljygx = request.getParameterValues("ljygx");
		String[] ljyts = request.getParameterValues("ljyts");
		//新添获得级联
		String[] dy_jl_col = request.getParameterValues("dy_jl_col");
		
		ec.con.setAutoCommit(false);
		String sql = "";
		boolean err = false;
		for (int i = 0; jfid !=null && i < jfid.length; i++) {
			if ("".equals(jfid[i]) || jfid[i] == null) {
				sql = "INSERT INTO DBBZB_JG (JFID, JFDBBZB_ID, JFCOLNAME, JFCOLID, JFCOLSTYLE, JFDECINUM, JFCOLLENGTH, " 
					+ "JFCOLVEST, JFCOLFASHION, JFCOLMEANS, JFCOLCOUNT, JFNULL,JFCOLJYGX,JFCOLJYTS,DY_JL_COL) VALUES (SEQU_DBBZB_JG.NEXTVAL,'" 
					+ zbid + "','" + lmc[i] + "','" + lbm[i] + "','" + llx[i] + "','" + lxsws[i] + "','" 
					+ lc[i] + "','" + lgs[i] + "','" + lclfs[i] + "','" + lclff[i] + "','" 
					+ ljsgx[i] + "','" + lnull[i] + "','" + ljygx[i] + "','" + ljyts[i] + "','"+dy_jl_col[i]+"')";
			} else {
				sql = "UPDATE DBBZB_JG SET JFCOLNAME='" + lmc[i] + "', JFCOLID='" + lbm[i] 
					+ "', JFCOLSTYLE='" + llx[i] + "', JFDECINUM='" + lxsws[i] + "', JFCOLLENGTH='" 
					+ lc[i] + "',JFCOLVEST='" + lgs[i] + "', JFCOLFASHION='" + lclfs[i] 
					+ "', JFCOLMEANS='" + lclff[i] + "', JFCOLCOUNT='" + ljsgx[i] + "', JFNULL='" 
					+ lnull[i] + "',JFCOLJYGX='" + ljygx[i] + "',JFCOLJYTS='" + ljyts[i] 
					+ "',DY_JL_COL='"+dy_jl_col[i]+"' WHERE JFID='" + jfid[i] + "'";
			}
			if (stmt.executeUpdate(sql) <= 0) {
				err = true;
				break;
			}
		}
		if (!err) {
			ec.con.commit();
			out.write("<script>alert('保存成功!');window.location='/insect/system/bb/list1.jsp?zbid=" + zbid + "&jfcolvest=" + colvest + "';</script>");
		} else {
			ec.con.rollback();
			out.write("<script>alert('保存成功!');window.location='/insect/system/bb/list1.jsp?zbid=" + zbid + "&jfcolvest=" + colvest + "';</script>");
		}
		ec.con.setAutoCommit(true);
	} else if ("deljg".equals(act)) { // delete
		String id = request.getParameter("delid");
		String sql = "DELETE FROM DBBZB_JG WHERE JFID='" + id + "'";
		if (stmt.executeUpdate(sql) > 0) {
			out.write("<script>alert('删除成功!');window.location='/insect/system/bb/list1.jsp?zbid=" + zbid + "&jfcolvest=" + colvest + "';</script>");
		} else {
			out.write("<script>alert('删除成功!');window.location='/insect/system/bb/list1.jsp?zbid=" + zbid + "&jfcolvest=" + colvest + "';</script>");
		}
	}
	stmt.close();
	ec.con.close();
%>