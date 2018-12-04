package com.jf.bchyj.action.system.user;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import com.jf.bchyj.bean.User;
import com.jf.util.MD5YZJM;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;

public class UserAction extends InitAction {

	private MD5YZJM md5=new MD5YZJM();
	protected void actionQuery(ServletObject so) {
		String bmbm = so.httpServletRequest.getParameter("bmbm");
		String jfname = so.httpServletRequest.getParameter("jfname");
		String jfuserid = so.httpServletRequest.getParameter("jfuserid");
		String zt = so.httpServletRequest.getParameter("zt");
		String sql = "SELECT JFID,jfuserid,jfname,f_get_mc('DEPT',JFDSYS05_CODE) bmmc,decode(JFSTATE,'0','废弃','1','使用') JFSTATE FROM Dsys01 WHERE 1=1 ";
		if(bmbm == null){bmbm="";}
		if(jfname == null){jfname="";}
		if(jfuserid == null){jfuserid="";}
		if(zt == null){zt="";}
		if (bmbm.length()>0) { //
			sql +=  " and JFDSYS05_CODE like '"+bmbm+"%'";
		}
		if (jfname.length()>0) { // 
			sql +=  " and jfname like '%"+jfname+"%'";
		}
		if (jfuserid.length()>0) { // 
			sql +=  " and jfuserid = '"+jfuserid+"'";
		}
		if (zt.length()>0) { // 
			sql +=  " and JFSTATE = '"+zt+"'";
		}
		sql += " ORDER BY JFDSYS05_CODE";
	      javax.servlet.http.HttpSession session = so.httpServletRequest.getSession(true);
	      ContainDivPage cdp = new ContainDivPage();
	      cdp.sqlWhole = sql;
	      cdp.sqlsort = "";
	      cdp.sqlselect = sql;
	      session.setAttribute(so.actionMapping.findForward(switchForward(
	    		  so.actForward)).getPath() + "_sql", cdp);
		
	}

	protected void insert(ServletObject so) {
		String jfcode = so.httpServletRequest.getParameter("jfcode");
		String jfname = so.httpServletRequest.getParameter("jfname");
		String bmbm = so.httpServletRequest.getParameter("bmbm");
		String jfuserid = so.httpServletRequest.getParameter("jfuserid");
		String jfpassword = so.httpServletRequest.getParameter("jfpassword");
		String zt = so.httpServletRequest.getParameter("zt");
		String bz = so.httpServletRequest.getParameter("bz");
		String lrry = ((User) so.getSession().getAttribute("user")).getUserid();
		String sql_temp="select * from dsys01 where jfcode='"+jfcode+"'";
		int c = so.dc.pjdo.execute(sql_temp);
		if (c > 0) {
			so.httpServletRequest.setAttribute("Message", "用户编码已存在！");
            return;
		} 
		 sql_temp="select * from dsys01 where jfuserid='"+jfuserid+"'";
		 c = so.dc.pjdo.execute(sql_temp);
		if (c > 0) {
			so.httpServletRequest.setAttribute("Message", "用户名已存在！");
            return;
		} 
		String sql = "INSERT INTO dsys01(JFID,JFCODE,JFNAME,JFDSYS05_CODE,JFUSERID,JFPASSWORD,JFREMARK,JFSTATE) VALUES(SEQU_DSYS01.NEXTVAL,'" 
			+ jfcode + "','" + jfname + "','" + bmbm + "','" + jfuserid + "','" + md5.md5Password(jfpassword) + "','" + bz + "','"+zt+"')";
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
	    String jfcode = httpServletRequest.getParameter("dfirm_zhg:jfcode:str:s");
	    String jfname = httpServletRequest.getParameter("dfirm_zhg:jfname:str:s");
	    String JFDSYS05_CODE = httpServletRequest.getParameter("dfirm_zhg:JFDSYS05_CODE:str:s");
	    String jfuserid = httpServletRequest.getParameter("dfirm_zhg:jfuserid:str:s");
	    String jfpassword = httpServletRequest.getParameter("dfirm_zhg:jfpassword:str:s");
	    String JFSTATE = httpServletRequest.getParameter("dfirm_zhg:JFSTATE:str:s");
	    String JFREMARK = httpServletRequest.getParameter("dfirm_zhg:JFREMARK:str:s");
	    String jfid = httpServletRequest.getParameter("dfirm_zhg:jfid:str:s");
	 

	    sql = "update dsys01 set jfcode='"+jfcode+"',JFDSYS05_CODE='"+JFDSYS05_CODE+"',jfuserid='"+jfuserid+"',jfpassword='"+md5.md5Password(jfpassword)+"',\n";
	    sql +="jfname='"+jfname+"',JFSTATE='"+JFSTATE+"',JFREMARK='"+JFREMARK+"'\n";
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
			String sql = "SELECT JFID,JFCODE,JFNAME, JFDSYS05_CODE,JFUSERID,JFPASSWORD, JFSTATE,JFREMARK FROM Dsys01 WHERE jfid='"+jfid+"' ";
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
