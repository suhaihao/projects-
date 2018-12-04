package com.jf.bchyj.action.system.dygl;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import com.jf.bchyj.bean.User;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;

public class DyglAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String bmbm = so.httpServletRequest.getParameter("bmbm");
		String bmmc = so.httpServletRequest.getParameter("bmmc");
		String bmsx = so.httpServletRequest.getParameter("bmsx");
		String zt = so.httpServletRequest.getParameter("zt");
		String sql = "SELECT JFID,JFREGCODE,JFREGNAME,decode(JFREGPROP,'0','近郊区','1','远郊区') JFREGPROP,decode(JFSTATE,'0','废弃','1','使用') JFSTATE FROM Dsys06 WHERE 1=1 ";
		if(bmbm == null){bmbm="";}
		if(bmmc == null){bmmc="";}
		if(bmsx == null){bmsx="";}
		if(zt == null){zt="";}
		if (bmbm.length()>0) { //
			sql +=  " and JFREGCODE like '"+bmbm+"%'";
		}
		if (bmmc.length()>0) { // 
			sql +=  " and JFREGNAME like '%"+bmmc+"%'";
		}
		if (bmsx.length()>0) { // 
			sql +=  " and JFREGPROP = '"+bmsx+"'";
		}
		if (zt.length()>0) { // 
			sql +=  " and JFSTATE = '"+zt+"'";
		}
		sql += " ORDER BY JFREGCODE";
	      javax.servlet.http.HttpSession session = so.httpServletRequest.getSession(true);
	      ContainDivPage cdp = new ContainDivPage();
	      cdp.sqlWhole = sql;
	      cdp.sqlsort = "";
	      cdp.sqlselect = sql;
	      session.setAttribute(so.actionMapping.findForward(switchForward(
	    		  so.actForward)).getPath() + "_sql", cdp);
		
	}

	protected void insert(ServletObject so) {
		String bmbm = so.httpServletRequest.getParameter("bmbm");
		String bmmc = so.httpServletRequest.getParameter("bmmc");
		String bmsx = so.httpServletRequest.getParameter("bmsx");
		String zt = so.httpServletRequest.getParameter("zt");
		String bz = so.httpServletRequest.getParameter("bz");
		String lrry = ((User) so.getSession().getAttribute("user")).getUserid();
		String sql_temp="select * from dsys06 where JFREGCODE='"+bmbm+"'";
		int c = so.dc.pjdo.execute(sql_temp);
		if (c > 0) {
			so.httpServletRequest.setAttribute("Message", "部门编码已存在！");
            return;
		} 
		String sql = "INSERT INTO dsys06(JFID,JFREGCODE,JFREGNAME,JFREGPROP,JFSTATE,JFREMARK) VALUES(SEQU_DSYS06.NEXTVAL,'" 
			+ bmbm + "','" + bmmc + "','" + bmsx + "','"+zt+"','" + bz + "')";
		 c = so.dc.pjdo.execute(sql);
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
	    String JFDEPTCODE = httpServletRequest.getParameter("d_hy_zx:JFREGCODE:str:s");
	    String JFDEPTNAME = httpServletRequest.getParameter("dfirm_zhg:JFREGNAME:str:s");
	    String JFDEPTPROP = httpServletRequest.getParameter("dfirm_zhg:JFREGPROP:str:s");
	    String JFSTATE = httpServletRequest.getParameter("dfirm_zhg:JFSTATE:str:s");
	    String JFREMARK = httpServletRequest.getParameter("dfirm_zhg:JFREMARK:str:s");
	    String jfid = httpServletRequest.getParameter("dfirm_zhg:jfid:str:s");
	 

	    sql = "update dsys06 set JFREGNAME='"+JFDEPTNAME+"',\n";
	    sql +="JFREGPROP='"+JFDEPTPROP+"',JFSTATE='"+JFSTATE+"',JFREMARK='"+JFREMARK+"'\n";
	    sql +=" where jfid='"+jfid+"'";
	    if(servletObject.dc.pjdo.execute(sql)>0){
	        servletObject.dc.pjdo.dbConn.commit();
	        httpServletRequest.setAttribute("jfid", jfid);
		    httpServletRequest.setAttribute("Message", "保存数据成功!");

	    }else{
	      servletObject.dc.ec.rollback();
	      httpServletRequest.setAttribute("Message", "保存人员数据失败!");
	      return;
	    }		
	}

	protected void other(ServletObject so) {
		String forward = so.getActForward();
		if ("DETAIL".equals(forward)) {
			String jfid = so.httpServletRequest.getParameter("jfid");
			String sql = "SELECT JFID,JFREGCODE,JFREGNAME, JFREGPROP, JFSTATE,JFREMARK FROM Dsys06 WHERE jfid='"+jfid+"' ";
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
