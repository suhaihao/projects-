package com.jf.bchyj.cbgf;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jf.bchyj.bean.User;
import com.jf.bchyj.common.zjz_upload.DeleteFile;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ContainUpdateSql;
import mt.controller.base.ServletObject;

public class CbgfQueryAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String lb = so.httpServletRequest.getParameter("lb");
		String lx = so.httpServletRequest.getParameter("lx");
		String ly = so.httpServletRequest.getParameter("ly");
		String zz = so.httpServletRequest.getParameter("zz");
		String lrrq_b = so.httpServletRequest.getParameter("lrrq_b");
		String lrrq_e = so.httpServletRequest.getParameter("lrrq_e");
		String sql = "SELECT JFID,decode(lb,'01','北京','02','全国') lb,decode(lx,'01','国标','02','行标','03','地标','04','测报办法') lx,bt,ly,to_char(fbrq,'yyyy-mm-dd hh24:mi:ss') fbrq,decode(zt,'0','初始','1','提交') zt,zt ztbm FROM dcbgf WHERE zt='1' ";
		if(lb == null){lb="";}
		if(lx == null){lx="";}
		if(ly == null){ly="";}
		if(zz == null){zz="";}
		if(lrrq_b == null){lrrq_b="";}
		if(lrrq_e == null){lrrq_e="";}
		if (lb.length()>0) { //
			sql +=  " and lb = '"+lb+"'";
		}
		if (lx.length()>0) { //
			sql +=  " and lx = '"+lx+"'";
		}
		if (ly.length()>0) { // 
			sql +=  " and ly like '%"+ly+"%'";
		}
		if (zz.length()>0) { // 
			sql +=  " and zz like '%"+zz+"%'";
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
		      String sql = "SELECT JFID,decode(lb,'01','北京','02','全国') lbmc,decode(lx,'01','国标','02','行标','03','地标','04','测报办法') lxmc,lb,lx,BT,ly,zz,zw,F_GET_MC('RYBM',LRRY)LRRY,TO_CHAR(fbrq,'YYYY-MM-DD')fbrq,ZT FROM dcbgf WHERE JFID='" + id + "'";
		      String sql_fj = "SELECT JFID,LJ,mc WJM FROM Dcbgf_FJ WHERE dcbgf_JFID='" + id + "'";
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
