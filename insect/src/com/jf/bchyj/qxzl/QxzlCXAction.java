package com.jf.bchyj.qxzl;




import java.sql.SQLException;
import java.sql.Statement;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;
import mt.database.extend.ExecuteConnection;

public class QxzlCXAction extends InitAction {
	protected void actionQuery(ServletObject so) {
		String JFSTATIONCODE = so.httpServletRequest.getParameter("JFSTATIONCODE");
		String lrrq_b = so.httpServletRequest.getParameter("lrrq_b");
		String lrrq_e = so.httpServletRequest.getParameter("lrrq_e");
		String sql = "SELECT JFID,f_get_mc('ZDBM',JFSTATIONCODE) JFSTATIONCODE,JFDATE,JFTT,JFRH,JFS FROM DQXSJ WHERE 1=1 ";
		if(JFSTATIONCODE == null){JFSTATIONCODE="";}
		if(lrrq_b == null){lrrq_b="";}
		if(lrrq_e == null){lrrq_e="";}
		if (JFSTATIONCODE.length()>0) { //
			sql +=  " and JFSTATIONCODE = '"+JFSTATIONCODE+"'";
		}
		if (lrrq_b.length()>0) { // 
			sql +=  " and JFDATE >= to_char(to_date('"+lrrq_b+"','yyyy-mm-dd'),'yyyymmdd')";
		}else{
			sql +=  " and substr(jfdate,1,6) = to_char(sysdate,'yyyymm') ";
		}
		if (lrrq_e.length()>0) { // 
			sql +=  " and JFDATE < to_char(to_date('"+lrrq_b+"','yyyy-mm-dd')+1,'yyyymmdd')";
		}
		sql += " ORDER BY JFDATE";
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
		if ("DETAIL".equals(forward)) {
			String jfid = so.httpServletRequest.getParameter("jfid");
			String sql = "SELECT JFID,JFSTATIONCODE,jfdate,JFPP,JFTT,JFTMAX,JFTMIN,JFRH,JFRR,JFFMAX,JFDD,JFFF,JFDK0,JFDMAX,JFDMIN,JFDK5,JFDK10,JFDK15,JFDK20,JFS FROM DQXSJ WHERE jfid='"+jfid+"' ";
			so.setActForward("DETAIL");
			ContainDivPage cdp = new ContainDivPage();
		      cdp.sqlWhole = sql;
		      cdp.sqlsort = "";
		      cdp.sqlselect = sql;
		      so.httpServletRequest.getSession().setAttribute(so.actionMapping.findForward(switchForward(
		    		  so.actForward)).getPath() + "_sql", cdp);	
		}
	}
}
