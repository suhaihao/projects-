package com.jf.bchyj.tzgg;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ContainUpdateSql;
import mt.controller.base.ServletObject;

public class TzggAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String bt = so.httpServletRequest.getParameter("bt");
		String gjc = so.httpServletRequest.getParameter("gjc");
		String lrrq_b = so.httpServletRequest.getParameter("lrrq_b");
		String lrrq_e = so.httpServletRequest.getParameter("lrrq_e");
		String sql = "SELECT JFID,bt,gjc,to_char(fbrq,'yyyy-mm-dd hh24:mi:ss') fbrq,decode(zt,'0','³õÊ¼','1','Ìá½»') zt,zt ztbm FROM dtzgg WHERE zt='1' ";
		if(bt == null){bt="";}
		if(gjc == null){gjc="";}
		if(lrrq_b == null){lrrq_b="";}
		if(lrrq_e == null){lrrq_e="";}
		if (bt.length()>0) { // 
			sql +=  " and bt like '%"+bt+"%'";
		}
		if (gjc.length()>0) { // 
			sql +=  " and gjc like '%"+gjc+"%'";
		}
		if (lrrq_b.length()>0) { // 
			sql +=  " and fbrq >= to_date('"+lrrq_b+"','yyyy-mm-dd')";
		}
		if (lrrq_e.length()>0) { // 
			sql +=  " and fbrq < to_date('"+lrrq_e+"','yyyy-mm-dd')+1";
		}
		sql += " ORDER BY fbrq desc";
	      javax.servlet.http.HttpSession session = so.httpServletRequest.getSession(true);
	      ContainDivPage cdp = new ContainDivPage();
	      cdp.sqlWhole = sql;
	      cdp.sqlsort = "";
	      cdp.sqlselect = sql;
	      session.setAttribute(so.actionMapping.findForward(switchForward(
	    		  so.actForward)).getPath() + "_sql", cdp);
		
	}



	protected void other(ServletObject so) {
		String forward = so.getActForward();
	    HttpServletRequest req = so.httpServletRequest;
	    HttpServletResponse resp = so.httpServletResponse;
	    String id = req.getParameter("id");
	    PrintWriter out = null;
	    try {
	      out = resp.getWriter();
	    } catch (IOException e) {
	      e.printStackTrace();
	    }
		if ("DETAIL".equals(forward)) {
		      String sql = "SELECT JFID,BT,gjc,zw,F_GET_MC('RYBM',LRRY)LRRY,TO_CHAR(fbrq,'YYYY-MM-DD')fbrq,ZT FROM dtzgg WHERE JFID='" + id + "'";
		      String sql_fj = "SELECT JFID,LJ,mc WJM FROM dtzgg_FJ WHERE dtzgg_JFID='" + id + "'";
		      req.setAttribute("ID", id);
		      ContainUpdateSql cus = new ContainUpdateSql();
		      cus.masteSql = sql;
		      cus.detail1Sql = sql_fj;
		      so.getSession().setAttribute(
		        so.actionMapping.findForward(
		        switchForward(so.actForward)).getPath() + 
		        "_updatesql", cus);
		}
	}

}
