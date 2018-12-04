package com.jf.bchyj.action.system.dept;


import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import com.jf.bchyj.bean.User;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;
import mt.database.extend.QueryConnection;

public class DeptAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String bmbm = so.httpServletRequest.getParameter("bmbm");
		String bmmc = so.httpServletRequest.getParameter("bmmc");
		String bmsx = so.httpServletRequest.getParameter("bmsx");
		String zt = so.httpServletRequest.getParameter("zt");
		String sql = "SELECT JFID,JFDEPTCODE,JFDEPTNAME,decode(JFDEPTPROP,'0','总部','1','市县','2','基点') JFDEPTPROP,decode(JFSTATE,'0','废弃','1','使用') JFSTATE FROM Dsys05 WHERE 1=1 ";
		if(bmbm == null){bmbm="";}
		if(bmmc == null){bmmc="";}
		if(bmsx == null){bmsx="";}
		if(zt == null){zt="";}
		if (bmbm.length()>0) { //
			sql +=  " and JFDEPTCODE like '"+bmbm+"%'";
		}
		if (bmmc.length()>0) { // 
			sql +=  " and JFDEPTNAME like '%"+bmmc+"%'";
		}
		if (bmsx.length()>0) { // 
			sql +=  " and JFDEPTPROP = '"+bmsx+"'";
		}
		if (zt.length()>0) { // 
			sql +=  " and JFSTATE = '"+zt+"'";
		}
		sql += " ORDER BY JFDEPTCODE";
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
		String sjbm = so.httpServletRequest.getParameter("sjbm");
		String xz = so.httpServletRequest.getParameter("xz");
		String cun = so.httpServletRequest.getParameter("cun");
		String zt = so.httpServletRequest.getParameter("zt");
		String bz = so.httpServletRequest.getParameter("bz");
		String lrry = ((User) so.getSession().getAttribute("user")).getUserid();
		String sql_temp="select * from dsys05 where JFDEPTCODE='"+bmbm+"'";
		int c = so.dc.pjdo.execute(sql_temp);
		if (c > 0) {
			so.httpServletRequest.setAttribute("Message", "部门编码已存在！");
            return;
		} 
		String sql = "INSERT INTO dsys05(JFID,JFDEPTCODE,JFDEPTNAME,JFDEPTPROP,JFSTATE,JFREMARK,JFRESEARCH,XZ,CUN,SJBM) VALUES(SEQU_DSYS05.NEXTVAL,'" 
			+ bmbm + "','" + bmmc + "','" + bmsx + "','"+zt+"','" + bz + "','1','"+xz+"','"+cun+"','"+sjbm+"')";
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
	    String JFDEPTCODE = httpServletRequest.getParameter("d_hy_zx:JFDEPTCODE:str:s");
	    String JFDEPTNAME = httpServletRequest.getParameter("dfirm_zhg:JFDEPTNAME:str:s");
	    String JFDEPTPROP = httpServletRequest.getParameter("dfirm_zhg:JFDEPTPROP:str:s");
	    String JFSTATE = httpServletRequest.getParameter("dfirm_zhg:JFSTATE:str:s");
	    String JFREMARK = httpServletRequest.getParameter("dfirm_zhg:JFREMARK:str:s");
	    String SJBM = httpServletRequest.getParameter("dfirm_zhg:sjbm:str:s");
	    String XZ = httpServletRequest.getParameter("dfirm_zhg:xz:str:s");
	    String CUN = httpServletRequest.getParameter("dfirm_zhg:cun:str:s");
	    String jfid = httpServletRequest.getParameter("dfirm_zhg:jfid:str:s");
	    servletObject.httpServletRequest.setAttribute("JFDEPTPROP",JFDEPTPROP);
	    servletObject.httpServletRequest.setAttribute("SJBM", SJBM);
	    servletObject.httpServletRequest.setAttribute("XZ", XZ);

	    sql = "update dsys05 set JFDEPTNAME='"+JFDEPTNAME+"',\n";
	    sql +="JFDEPTPROP='"+JFDEPTPROP+"',JFSTATE='"+JFSTATE+"',JFREMARK='"+JFREMARK+"',SJBM='"+SJBM+"',XZ='"+XZ+"',CUN='"+CUN+"'\n";
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
			String sql = "SELECT JFID,JFDEPTCODE,JFDEPTNAME, JFDEPTPROP, JFSTATE,JFREMARK,SJBM,XZ,CUN FROM Dsys05 WHERE jfid='"+jfid+"' ";
			QueryConnection qc = new QueryConnection();
			try {
				Statement stmt = qc.con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while (rs.next()) {
					so.httpServletRequest.setAttribute("JFDEPTPROP",rs.getString("JFDEPTPROP"));
					so.httpServletRequest.setAttribute("SJBM", rs.getString("SJBM"));
					so.httpServletRequest.setAttribute("XZ", rs.getString("XZ"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
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
