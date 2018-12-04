package com.jf.bchyj.qxzl;


import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;

import com.jf.bchyj.bean.User;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;
import mt.database.extend.ExecuteConnection;

public class QxzlAction extends InitAction {

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

	protected void insert(ServletObject so) {
		String JFSTATIONCODE = so.httpServletRequest.getParameter("JFSTATIONCODE");
		String jfdate = so.httpServletRequest.getParameter("jfdate");
		String JFPP = so.httpServletRequest.getParameter("JFPP");
		String JFTT = so.httpServletRequest.getParameter("JFTT");
		String JFTMAX = so.httpServletRequest.getParameter("JFTMAX");
		String JFTMIN = so.httpServletRequest.getParameter("JFTMIN");
		String JFRH = so.httpServletRequest.getParameter("JFRH");
		String JFRR = so.httpServletRequest.getParameter("JFRR");
		String JFFMAX = so.httpServletRequest.getParameter("JFFMAX");
		String JFDD = so.httpServletRequest.getParameter("JFDD");
		String JFFF = so.httpServletRequest.getParameter("JFFF");
		String JFDK0 = so.httpServletRequest.getParameter("JFDK0");
		String JFDMAX = so.httpServletRequest.getParameter("JFDMAX");
		String JFDMIN = so.httpServletRequest.getParameter("JFDMIN");
		String JFDK5 = so.httpServletRequest.getParameter("JFDK5");
		String JFDK10 = so.httpServletRequest.getParameter("JFDK10");
		String JFDK15 = so.httpServletRequest.getParameter("JFDK15");
		String JFDK20 = so.httpServletRequest.getParameter("JFDK20");
		String JFS = so.httpServletRequest.getParameter("JFS");
		
		String sql = "INSERT INTO DQXSJ(JFID,JFSTATIONCODE,jfdate,JFPP,JFTT,JFTMAX,JFTMIN,JFRH,JFRR,JFFMAX,JFDD,JFFF,JFDK0,JFDMAX,JFDMIN,JFDK5,JFDK10,JFDK15,JFDK20,JFS) VALUES(SEQU_DQXSJ.NEXTVAL,'" 
			+ JFSTATIONCODE + "','" + jfdate + "','"+JFPP+"','" + JFTT + "','" + JFTMAX + "','" + JFTMIN + "','" + JFRH + "','" + JFRR + "','" + JFFMAX + "','" + JFDD + "','" + JFFF + "','" + JFDK0 + "','" + JFDMAX + "','" + JFDMIN + "','" + JFDK5 + "','" + JFDK10 + "','" + JFDK15 + "','" + JFDK20 + "','" + JFS + "')";
		int c = so.dc.pjdo.execute(sql);
		if (c > 0) {
			so.httpServletRequest.setAttribute("Message", "提交成功！");
			so.setActForward("INSERT");
		} else {
			so.httpServletRequest.setAttribute("Message", "数据插入失败！");
            return;
		}
	}

	protected void update(ServletObject servletObject) {
	      HttpServletRequest httpServletRequest = servletObject.httpServletRequest;
	      javax.servlet.http.HttpSession session = null;
	      session = servletObject.httpServletRequest.getSession();
	    String sql = "";
		String JFSTATIONCODE = httpServletRequest.getParameter("d:JFSTATIONCODE:str:s");
		String jfdate = httpServletRequest.getParameter("d:jfdate:str:s");
		String JFPP = httpServletRequest.getParameter("d:JFPP:str:s");
		String JFTT = httpServletRequest.getParameter("d:JFTT:str:s");
		String JFTMAX = httpServletRequest.getParameter("d:JFTMAX:str:s");
		String JFTMIN = httpServletRequest.getParameter("d:JFTMIN:str:s");
		String JFRH = httpServletRequest.getParameter("d:JFRH:str:s");
		String JFRR = httpServletRequest.getParameter("d:JFRR:str:s");
		String JFFMAX = httpServletRequest.getParameter("d:JFFMAX:str:s");
		String JFDD = httpServletRequest.getParameter("d:JFDD:str:s");
		String JFFF = httpServletRequest.getParameter("d:JFFF:str:s");
		String JFDK0 = httpServletRequest.getParameter("d:JFDK0:str:s");
		String JFDMAX = httpServletRequest.getParameter("d:JFDMAX:str:s");
		String JFDMIN = httpServletRequest.getParameter("d:JFDMIN:str:s");
		String JFDK5 = httpServletRequest.getParameter("d:JFDK5:str:s");
		String JFDK10 = httpServletRequest.getParameter("d:JFDK10:str:s");
		String JFDK15 = httpServletRequest.getParameter("d:JFDK15:str:s");
		String JFDK20 = httpServletRequest.getParameter("d:JFDK20:str:s");
		String JFS = httpServletRequest.getParameter("d:JFS:str:s");
	    String jfid = httpServletRequest.getParameter("d:jfid:str:P");
	 

	    sql = "update DQXSJ set JFSTATIONCODE='"+JFSTATIONCODE+"',\n";
	    sql +="jfdate='"+jfdate+"',JFPP='"+JFPP+"',JFTT='"+JFTT+"',\n";
	    sql +="JFTMAX='"+JFTMAX+"',JFTMIN='"+JFTMIN+"',JFRH='"+JFRH+"',\n";
	    sql +="JFRR='"+JFRR+"',JFFMAX='"+JFFMAX+"',JFDD='"+JFDD+"',\n";
	    sql +="JFFF='"+JFFF+"',JFDK0='"+JFDK0+"',JFDMAX='"+JFDMAX+"',\n";
	    sql +="JFDMIN='"+JFDMIN+"',JFDK5='"+JFDK5+"',JFDK10='"+JFDK10+"',\n";
	    sql +="JFDK15='"+JFDK15+"',JFDK20='"+JFDK20+"',JFS='"+JFS+"'\n";
	    sql +=" where jfid='"+jfid+"'";
	    if(servletObject.dc.pjdo.execute(sql)>0){
	        servletObject.dc.pjdo.dbConn.commit();
	        httpServletRequest.setAttribute("jfid", jfid);
		    httpServletRequest.setAttribute("Message", "保存数据成功!");

	    }else{
	      servletObject.dc.ec.rollback();
	      httpServletRequest.setAttribute("Message", "保存数据失败!");
	      return;
	    }		
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
		if ("DELETE".equals(forward)) {
			String sql = "";
			String[] jfids = so.httpServletRequest.getParameterValues("chkdel");
			ExecuteConnection ec = new ExecuteConnection();
			Statement stmt = null;
			try {
				ec.con.setAutoCommit(false); // 取消自动提交
				stmt = ec.con.createStatement();
				boolean err = false; // 是否成功标志
				for (int i = 0; i < jfids.length; i++) {
					sql = "DELETE FROM DQXSJ WHERE JFID='" + jfids[i] + "'";
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
