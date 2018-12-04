package com.jf.bchyj.action.system.role;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import com.jf.bchyj.bean.User;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;

public class RoleAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String jsmc = so.httpServletRequest.getParameter("jsmc");
		String sql = "SELECT JFID,jfname,bz FROM Dsys20 WHERE 1=1 ";
		if(jsmc == null){jsmc="";}
		if (jsmc.length()>0) { //
			sql +=  " and jfname like '%"+jsmc+"%'";
		}
		sql += " ORDER BY JFID";
	      javax.servlet.http.HttpSession session = so.httpServletRequest.getSession(true);
	      ContainDivPage cdp = new ContainDivPage();
	      cdp.sqlWhole = sql;
	      cdp.sqlsort = "";
	      cdp.sqlselect = sql;
	      session.setAttribute(so.actionMapping.findForward(switchForward(
	    		  so.actForward)).getPath() + "_sql", cdp);
		
	}

	protected void insert(ServletObject so) {
		String jsmc = so.httpServletRequest.getParameter("jsmc");
		String bz = so.httpServletRequest.getParameter("bz");
		String lrry = ((User) so.getSession().getAttribute("user")).getUserid();
		String sql = "INSERT INTO dsys20(JFID,JFNAME,BZ) VALUES(SEQU_DSYS20.NEXTVAL,'" 
			+ jsmc + "','" + bz + "')";
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
	    String JFDEPTCODE = httpServletRequest.getParameter("d_hy_zx:JFDEPTCODE:str:s");
	    String JFDEPTNAME = httpServletRequest.getParameter("dfirm_zhg:JFDEPTNAME:str:s");
	    String JFDEPTPROP = httpServletRequest.getParameter("dfirm_zhg:JFDEPTPROP:str:s");
	    String JFSTATE = httpServletRequest.getParameter("dfirm_zhg:JFSTATE:str:s");
	    String JFREMARK = httpServletRequest.getParameter("dfirm_zhg:JFREMARK:str:s");
	    String jfid = httpServletRequest.getParameter("dfirm_zhg:jfid:str:s");
	 

	    sql = "update dsys05 set JFDEPTNAME='"+JFDEPTNAME+"',\n";
	    sql +="JFDEPTPROP='"+JFDEPTPROP+"',JFSTATE='"+JFSTATE+"',JFREMARK='"+JFREMARK+"'\n";
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
			String sql = "SELECT JFID,JFDEPTCODE,JFDEPTNAME, JFDEPTPROP, JFSTATE,JFREMARK FROM Dsys05 WHERE jfid='"+jfid+"' ";
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
