package com.jf.bchyj.action.system.bbtj;

import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;
import mt.database.extend.ExecuteConnection;

/**
 * 表头定义类
 *
 */
public class BbtjHeadAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String dtjbb_id = so.httpServletRequest.getParameter("dtjbb_id"); // DTJBB.JFID
		String dbbzb_id = so.httpServletRequest.getParameter("dbbzb_id"); // DBBZB.JFID
		if (dtjbb_id == null) {
			dtjbb_id = (String) so.httpServletRequest.getAttribute("DTJBB_ID");
		}
		if (dbbzb_id == null) {
			dbbzb_id = (String) so.httpServletRequest.getAttribute("DBBZB_ID");
		}
		so.httpServletRequest.setAttribute("DTJBB_ID", dtjbb_id);
		so.httpServletRequest.setAttribute("DBBZB_ID", dbbzb_id);
		String sql = "SELECT JFID,JFCOLCODE,JFCOLNAME,JFCOLHEIGHT,JFCOLWIDTH,JFCOLORDER,JFCOLROWORD,JFCOLNUMBER,JFCOLROWS,JFCOLATTR FROM DBBTJBT WHERE JFDBBZB_ID='" + dtjbb_id + "'";
		
		sql += " ORDER BY JFCOLROWORD,JFCOLORDER";
		ContainDivPage cdp = new ContainDivPage();
		cdp.sqlselect = sql;
		cdp.sqlWhole = sql;
		so.getSession().setAttribute(
				so.actionMapping.findForward(switchForward(so.getActForward()))
						.getPath() + "_sql", cdp);
	}

	protected void update(ServletObject so) {
		HttpServletRequest request = so.httpServletRequest;
		String dtjbb_id = request.getParameter("dtjbb_id"); // DTJBB.JFID
		String[] jfid = request.getParameterValues("jfid");
		String[] lbm = request.getParameterValues("lbm");
		String[] lmc = request.getParameterValues("lmc");
		String[] lg = request.getParameterValues("lg");
		String[] lk = request.getParameterValues("lk");
		String[] llsx = request.getParameterValues("llsx");
		String[] lhsx = request.getParameterValues("lhsx");
		String[] lls = request.getParameterValues("lls");
		String[] lhs = request.getParameterValues("lhs");
		String[] lsx = request.getParameterValues("lsx");
		so.httpServletRequest.setAttribute("DTJBB_ID", dtjbb_id);
		String sql = "";
		boolean err = false;
		ExecuteConnection ec = new ExecuteConnection();
		Statement stmt = null;
		try {
			stmt = ec.con.createStatement();
			for (int i = 0; jfid !=null && i < jfid.length; i++) {
				if ("".equals(jfid[i]) || jfid[i] == null) { // 添加
					sql = "INSERT INTO DBBTJBT (JFID,JFDBBZB_ID,JFCOLCODE,JFCOLNAME,JFCOLWIDTH,JFCOLHEIGHT,JFCOLORDER,JFCOLROWORD,JFCOLNUMBER,JFCOLROWS,JFCOLATTR) VALUES (SEQU_DBBTJBT.NEXTVAL,'" 
						+ dtjbb_id + "','" + lbm[i] + "','" + lmc[i] + "','" + lk[i] + "','" + lg[i] + "','" 
						+ llsx[i] + "','" + lhsx[i] + "','" + lls[i] + "','" + lhs[i] + "','" + lsx[i] + "')";
					
				} else { // 修改
					sql = "UPDATE DBBTJBT SET JFCOLNAME='" + lmc[i] + "', JFCOLCODE='" + lbm[i] 
						+ "', JFCOLWIDTH='" + lk[i] + "', JFCOLHEIGHT='" + lg[i] + "', JFCOLNUMBER='" + lls[i] 
						+ "', JFCOLROWS='" + lhs[i] + "', JFCOLORDER='" + llsx[i] + "', JFCOLROWORD='" + lhsx[i] 
						+ "', JFCOLATTR='" + lsx[i] + "' WHERE JFID='" + jfid[i] + "'";
				}
				if (stmt.executeUpdate(sql) <= 0) {
					err = true;
					break;
				}
			}
			if (err) {
				so.httpServletRequest.setAttribute("Message", "保存失败！");
			} else {
				so.httpServletRequest.setAttribute("Message", "保存成功！");
			}
			so.setActForward("QUERY");
			actionQuery(so);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(stmt != null) stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			ec.close();
		}
	}

	protected void other(ServletObject so) {
		String forward = so.getActForward();
		String btjfid = so.httpServletRequest.getParameter("id");
		String dtjbb_id = so.httpServletRequest.getParameter("dtjbb_id"); // DTJBB.JFID
		String dbbzb_id = so.httpServletRequest.getParameter("dbbzb_id"); // DBBZB.JFID
		so.httpServletRequest.setAttribute("DTJBB_ID", dtjbb_id);
		so.httpServletRequest.setAttribute("DBBZB_ID", dbbzb_id);
		if ("DEL".equals(forward)) { // 删除一行
			String sql = "DELETE FROM DBBTJBT WHERE JFID='" + btjfid + "'";
			ExecuteConnection ec = new ExecuteConnection();
			Statement stmt = null;
			try {
				stmt = ec.con.createStatement();
				if (stmt.executeUpdate(sql) > 0) {
					so.httpServletRequest.setAttribute("Message", "删除成功！");
				} else {
					so.httpServletRequest.setAttribute("Message", "删除失败！");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					ec.con.setAutoCommit(true);
					if(stmt != null) stmt.close();
					ec.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			so.setActForward("QUERY");
			actionQuery(so);
		} else if ("QUERY2".equals(forward)) { // 取源表头数据
			String sql = "SELECT '' JFID,JFCOLCODE,JFCOLNAME,JFCOLHEIGHT,JFCOLWIDTH,JFCOLORDER,JFCOLROWORD,JFCOLNUMBER,JFCOLROWS,JFCOLATTR FROM DBBZB_GS WHERE JFCOLVEST='1' AND JFDBBZB_ID='" + dbbzb_id + "'";
			
			sql += " ORDER BY JFCOLROWORD,JFCOLORDER";
			ContainDivPage cdp = new ContainDivPage();
			cdp.sqlselect = sql;
			cdp.sqlWhole = sql;
			so.getSession().setAttribute(
					so.actionMapping.findForward(switchForward(so.getActForward()))
							.getPath() + "_sql", cdp);
		} else if ("SAVEOLD".equals(forward)) { // 保存源表头
			HttpServletRequest request = so.httpServletRequest;
			String[] jfid = request.getParameterValues("jfid");
			String[] lbm = request.getParameterValues("lbm");
			String[] lmc = request.getParameterValues("lmc");
			String[] lg = request.getParameterValues("lg");
			String[] lk = request.getParameterValues("lk");
			String[] llsx = request.getParameterValues("llsx");
			String[] lhsx = request.getParameterValues("lhsx");
			String[] lls = request.getParameterValues("lls");
			String[] lhs = request.getParameterValues("lhs");
			String[] lsx = request.getParameterValues("lsx");
			
			String sql = "";
			boolean err = false;
			ExecuteConnection ec = new ExecuteConnection();
			Statement stmt = null;
			try {
				stmt = ec.con.createStatement();
				stmt.executeUpdate("DELETE FROM DBBTJBT WHERE JFDBBZB_ID='" + dtjbb_id + "'");
				for (int i = 0; jfid !=null && i < jfid.length; i++) {
					sql = "INSERT INTO DBBTJBT (JFID,JFDBBZB_ID,JFCOLCODE,JFCOLNAME,JFCOLWIDTH,JFCOLHEIGHT,JFCOLORDER,JFCOLROWORD,JFCOLNUMBER,JFCOLROWS,JFCOLATTR) VALUES (SEQU_DBBTJBT.NEXTVAL,'" 
						+ dtjbb_id + "','" + lbm[i] + "','" + lmc[i] + "','" + lk[i] + "','" + lg[i] + "','" 
						+ llsx[i] + "','" + lhsx[i] + "','" + lls[i] + "','" + lhs[i] + "','" + lsx[i] + "')";
					if (stmt.executeUpdate(sql) <= 0) {
						err = true;
						break;
					}
				}
				if (err) {
					so.httpServletRequest.setAttribute("Message", "保存失败！");
				} else {
					so.httpServletRequest.setAttribute("Message", "保存成功！");
				}
				so.setActForward("QUERY");
				actionQuery(so);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(stmt != null) stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				ec.close();
			}
		}
	}

}
