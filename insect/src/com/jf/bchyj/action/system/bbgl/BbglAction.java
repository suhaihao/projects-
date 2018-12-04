package com.jf.bchyj.action.system.bbgl;

import java.sql.SQLException;
import java.sql.Statement;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;
import mt.database.extend.ExecuteConnection;

public class BbglAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String zbid = so.httpServletRequest.getParameter("zbid"); // 主表id
		String jflb = so.httpServletRequest.getParameter("jflb"); // 类别  
		String bbbm = so.httpServletRequest.getParameter("bbbm"); // 报表编码
		String bbmc = so.httpServletRequest.getParameter("bbmc"); // 报表名称
		String zt = so.httpServletRequest.getParameter("zt"); // 状态
		String sql = "SELECT JFID,JFTABNAME,JFCODE,JFPLANTSORT,JFWORMSORT,F_GET_MC('RYBM', JFLISTER) ZBR," + 
			"TO_CHAR(JFLISTDATE, 'YYYY-MM-DD') ZBRQ,DECODE(JFSTATE, '0', '初始', '1', '发布', '2', '归档', '') JFSTATE,DECODE(JFSTATE, '0', '','disabled') DEL" + 
			" FROM DBBZB WHERE 1=1";
		/*if (jflb != null) { // 预留类别为多选情况
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < jflb.length; i++) {
				sb.append(jflb[i] + ",");
			}
			sb.deleteCharAt(sb.length()-1);
			sql = sql + " and jflb like '%" + sb.toString() + "%'";
		}*/
		if (jflb != null && !"".equals(jflb)) {
			sql = sql + " and jflb like '%" + jflb + "%'";
		}
		if (bbbm != null && !"".equals(bbbm)) {
			sql = sql + " and jfcode like '%" + bbbm + "%'";
		}
		if (bbmc != null && !"".equals(bbmc)) {
			sql = sql + " and jftabname like '%" + bbmc + "%'";
		}
		if (zt != null && !"".equals(zt)) {
			sql = sql + " and jfstate='" + zt + "'";
		}
		sql += " ORDER BY JFCODE";
		so.httpServletRequest.setAttribute("SYSBBGL_ZBID", zbid);
		ContainDivPage cdp = new ContainDivPage();
		cdp.sqlselect = sql;
		cdp.sqlWhole = sql;
		so.getSession().setAttribute(
				so.actionMapping.findForward(switchForward(so.getActForward()))
						.getPath() + "_sql", cdp);
		
	}

	protected void insert(ServletObject so) {
		/*String jfcode = so.httpServletRequest.getParameter("jfcode");
		String jfname = so.httpServletRequest.getParameter("jfname");
		String jfdbbzb_id = so.httpServletRequest.getParameter("jfdbbzb_id");
		String jfyesno = so.httpServletRequest.getParameter("jfyesno");
		String jfattribute = so.httpServletRequest.getParameter("jfattribute");
		String jftjpj = so.httpServletRequest.getParameter("jftjpj");
		String jftjhj = so.httpServletRequest.getParameter("jftjhj");
		String zt = so.httpServletRequest.getParameter("zt");
		String lrry = ((User) so.getSession().getAttribute("user")).getUserid();
		String jfid = getSequence(so, "DTJBB");
		if (null == jftjpj) jftjpj = "";
		if (null == jftjhj) jftjhj = "";
		so.httpServletRequest.setAttribute("jfid", jfid);
		String sql = "INSERT INTO DTJBB(JFID,JFCODE,JFNAME,JFDBBZB_ID,JFLISTER,JFLISTDATE,JFYESNO,JFSTATE,JFATTRIBUTE,JFTJPJ,JFTJHZ) VALUES('" 
			+ jfid + "','" + jfcode + "','" + jfname + "','" + jfdbbzb_id + "','" + lrry 
			+ "',SYSDATE,'" + jfyesno + "','" + zt + "','" + jfattribute + "','" + jftjpj + "','" + jftjhj + "')";
		int c = so.dc.pjdo.execute(sql);
		if (c > 0) {
			so.setActForward("MODIFY");
		} else {
			so.setActForward("ADD");
		}
		other(so);*/
	}

	protected void update(ServletObject so) {
		/*String jfid = so.httpServletRequest.getParameter("jfid");
		String jfcode = so.httpServletRequest.getParameter("jfcode");
		String jfname = so.httpServletRequest.getParameter("jfname");
		String jfdbbzb_id = so.httpServletRequest.getParameter("d:jfdbbzb_id:str:s");
		String jfyesno = so.httpServletRequest.getParameter("d:jfyesno:str:s");
		String jfattribute = so.httpServletRequest.getParameter("d:jfattribute:str:s");
		String jftjpj = so.httpServletRequest.getParameter("jftjpj");
		String jftjhj = so.httpServletRequest.getParameter("jftjhj");
		String zt = so.httpServletRequest.getParameter("zt");
		if (null == jftjpj) jftjpj = "";
		if (null == jftjhj) jftjhj = "";
		String sql = "UPDATE DTJBB SET JFCODE='" + jfcode + "',JFNAME='" + jfname 
			+ "',JFDBBZB_ID='" + jfdbbzb_id + "',JFATTRIBUTE='" + jfattribute 
			+ "',JFYESNO='" + jfyesno + "',JFSTATE='" + zt + "',JFTJPJ='" 
			+ jftjpj + "',JFTJHZ='" + jftjhj + "' WHERE JFID='" + jfid + "'";
		if (so.dc.pjdo.execute(sql) > 0) {
			so.httpServletRequest.setAttribute("Message", "保存成功！");
		} else {
			so.httpServletRequest.setAttribute("Message", "保存失败！");
		}
		so.httpServletRequest.setAttribute("jfid", jfid);
		so.setActForward("MODIFY");
		other(so);*/
	}

	protected void other(ServletObject so) {
		String forward = so.getActForward();
		if ("DEL".equals(forward)) {
			String sql = "";
			String[] jfids = so.httpServletRequest.getParameterValues("chkdel");
			ExecuteConnection ec = new ExecuteConnection();
			Statement stmt = null;
			try {
				ec.con.setAutoCommit(false); // 取消自动提交
				stmt = ec.con.createStatement();
				boolean err = false; // 是否成功标志
				for (int i = 0; i < jfids.length; i++) {
					sql = "DELETE FROM DBBZB WHERE JFSTATE='0' AND JFID='" + jfids[i] + "'";
					if (stmt.executeUpdate(sql) <= 0) {
						err = true;
					}
				}
				if (!err) {
					ec.commit();
					so.httpServletRequest.setAttribute("Message", "删除成功！");
				} else {
					ec.rollback();
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
		}
	}

}
