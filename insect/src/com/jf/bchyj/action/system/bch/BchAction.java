package com.jf.bchyj.action.system.bch;

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

public class BchAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String bmbm = so.httpServletRequest.getParameter("bmbm");
		String bmmc = so.httpServletRequest.getParameter("bmmc");
		String lb = so.httpServletRequest.getParameter("lb");
		String zt = so.httpServletRequest.getParameter("zt");
		String sql = "SELECT JFID,JFINSECTCODE,JFINSECTNAME,JFLATIN,JFENGLISH,f_get_mc('INSECT',JFSTATCODE) lb,decode(JFSTATE,'0','废弃','1','使用') JFSTATE FROM dbch WHERE 1=1 ";
		if(bmbm == null){bmbm="";}
		if(bmmc == null){bmmc="";}
		if(lb == null){lb="";}
		if(zt == null){zt="";}
		if (bmbm.length()>0) { //
			sql +=  " and JFINSECTCODE = '"+bmbm+"'";
		}
		if (bmmc.length()>0) { // 
			sql +=  " and JFINSECTNAME like '%"+bmmc+"%'";
		}
		if (lb.length()>0) { // 
			sql +=  " and JFSTATCODE = '"+lb+"'";
		}
		if (zt.length()>0) { // 
			sql +=  " and JFSTATE = '"+zt+"'";
		}
		sql += " ORDER BY JFINSECTCODE";
	      javax.servlet.http.HttpSession session = so.httpServletRequest.getSession(true);
	      ContainDivPage cdp = new ContainDivPage();
	      cdp.sqlWhole = sql;
	      cdp.sqlsort = "";
	      cdp.sqlselect = sql;
	      session.setAttribute(so.actionMapping.findForward(switchForward(
	    		  so.actForward)).getPath() + "_sql", cdp);
		
	}

	protected void insert(ServletObject so) {
		String JFINSECTCODE = so.httpServletRequest.getParameter("JFINSECTCODE");
		String JFINSECTNAME = so.httpServletRequest.getParameter("JFINSECTNAME");
		String JFLATIN = so.httpServletRequest.getParameter("JFLATIN");
		String JFENGLISH = so.httpServletRequest.getParameter("JFENGLISH");
		String JFSTATCODE = so.httpServletRequest.getParameter("JFSTATCODE");
		String JFREMARK = so.httpServletRequest.getParameter("JFREMARK");
		String zt = so.httpServletRequest.getParameter("zt");
		String jfid="";
		if(JFINSECTCODE == null){JFINSECTCODE="";}
		if(JFINSECTNAME == null){JFINSECTNAME="";}
		if(JFLATIN == null){JFLATIN="";}
		if(JFENGLISH == null){JFENGLISH="";}
		if(JFSTATCODE == null){JFSTATCODE="";}
		if(JFREMARK == null){JFREMARK="";}
		if(zt == null){zt="";}
		String sql_temp="select * from dbch where JFINSECTCODE='"+JFINSECTCODE+"'";
		int c = so.dc.pjdo.execute(sql_temp);
		if (c > 0) {
			so.httpServletRequest.setAttribute("Message", "病虫害编码已存在！");
            return;
		} 
	    try {
	        so.dc.pjdo.executeQuery("SELECT SEQU_DBCH.NEXTVAL FROM dual");
	        if (so.dc.pjdo.rs.next())
	          jfid = so.dc.pjdo.rs.getString(1);
	      }
	      catch (SQLException e) {
	        e.printStackTrace();
	      }
		String sql = "INSERT INTO dbch(JFID,JFINSECTCODE,JFINSECTNAME,JFLATIN,JFENGLISH,JFSTATCODE,JFREMARK,JFSTATE) VALUES('"+jfid+"','" 
			+ JFINSECTCODE + "','" + JFINSECTNAME + "','"+JFLATIN+"','" + JFENGLISH + "','" + JFSTATCODE + "','" + JFREMARK + "','" + zt + "')";
		 c = so.dc.pjdo.execute(sql);
		if (c > 0) {
			so.httpServletRequest.setAttribute("Message", "提交成功！");
			so.setActForward("INSERT");
	    	  so.httpServletRequest.setAttribute("id", jfid);
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
		String JFINSECTCODE = servletObject.httpServletRequest.getParameter("dqbfb:JFINSECTCODE:str:s");
		String JFINSECTNAME = servletObject.httpServletRequest.getParameter("dqbfb:JFINSECTNAME:str:s");
		String JFLATIN = servletObject.httpServletRequest.getParameter("dqbfb:JFLATIN:str:s");
		String JFENGLISH = servletObject.httpServletRequest.getParameter("dqbfb:JFENGLISH:str:s");
		String JFSTATCODE = servletObject.httpServletRequest.getParameter("dqbfb:JFSTATCODE:str:s");
		String JFREMARK = servletObject.httpServletRequest.getParameter("dqbfb:JFREMARK:str:s");
		String JFSTATE = servletObject.httpServletRequest.getParameter("dqbfb:JFSTATE:str:s");
		if(JFINSECTCODE == null){JFINSECTCODE="";}
		if(JFINSECTNAME == null){JFINSECTNAME="";}
		if(JFLATIN == null){JFLATIN="";}
		if(JFENGLISH == null){JFENGLISH="";}
		if(JFSTATCODE == null){JFSTATCODE="";}
		if(JFREMARK == null){JFREMARK="";}
		if(JFSTATE == null){JFSTATE="";}
	    String jfid = httpServletRequest.getParameter("dqbfb:jfid:str:P");
	 

	    sql = "update dbch set JFINSECTCODE='"+JFINSECTCODE+"',\n";
	    sql +="JFINSECTNAME='"+JFINSECTNAME+"',JFLATIN='"+JFLATIN+"',JFENGLISH='"+JFENGLISH+"',JFSTATCODE='"+JFSTATCODE+"',JFREMARK='"+JFREMARK+"',JFSTATE='"+JFSTATE+"'\n";
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
	    servletObject.httpServletRequest.setAttribute("ID", jfid);
	}

	protected void other(ServletObject so) {
		String forward = so.getActForward();
	    HttpServletRequest req = so.httpServletRequest;
	    HttpServletResponse resp = so.httpServletResponse;
	    String id = req.getParameter("id");
	    String lb = "";
	    PrintWriter out = null;
	    try {
	      out = resp.getWriter();
	    } catch (IOException e) {
	      e.printStackTrace();
	    }
		if ("DETAIL".equals(forward)) {
		      String sql = "SELECT JFID,JFINSECTCODE,JFINSECTNAME,JFLATIN,JFENGLISH,JFSTATCODE,JFREMARK,JFSTATE FROM dbch WHERE JFID='" + id + "'";
		      String sql_fj = "SELECT JFID,LJ,mc WJM FROM dbch_img WHERE jfdbch_id='" + id + "'";
		      String sql_zw = "select a.jfid,a.JFPLANTCODE,f_get_mc('PLANT_ALL',a.JFPLANTCODE) JFPLANTNAME from dbchzw a,dbch b where a.JFINSECTCODE=b.JFINSECTCODE and b.jfid='" + id + "'";
		      req.setAttribute("ID", id);
		      ContainUpdateSql cus = new ContainUpdateSql();
		      cus.masteSql = sql;
		      cus.detail1Sql = sql_fj;
		      cus.detail2Sql = sql_zw;
		      so.getSession().setAttribute(
		        so.actionMapping.findForward(
		        switchForward(so.actForward)).getPath() + 
		        "_updatesql", cus);
		}else if ("DEL".equalsIgnoreCase(so.getActForward())) {
		      String sql = "DELETE FROM dbch_img WHERE JFID='" + id + "'";
		      if (so.dc.pjdo.execute(sql) > 0) {
		        String path = req.getParameter("path");
		        String idd = req.getParameter("idd");
		        so.dc.ec.commit();
		        out.print("<script>alert('删除成功');parent.window.location='/insect/bchAction.do?ACT_TYPE=DETAIL&id=" + 
		          idd + ";</script>");
		        DeleteFile.delete(getServlet().getServletContext().getRealPath("/") + path.substring(8));
		      } else {
		        so.dc.ec.rollback();
		        req.setAttribute("Message", "删除失败");
		      }
		}else if ("DETAIL_ZW".equalsIgnoreCase(so.getActForward())) {
		      String sql = "SELECT JFID,JFINSECTCODE,f_get_mc('INSECT_ALL',JFINSECTCODE) JFINSECTNAME,JFPLANTCODE,JFHARM,JFHABIT,JFCURE FROM dbchzw WHERE JFID='" + id + "'";
		      String sql_fj = "SELECT JFID,LJ,mc WJM FROM dbchzw_img WHERE JFDBCHZW_ID='" + id + "'";
		      String bch_jfid="";
			    try {
			        so.dc.pjdo.executeQuery("SELECT a.jfid FROM dbch a,dbchzw b where a.JFINSECTCODE=b.JFINSECTCODE and b.JFID='" + id + "'");
			        if (so.dc.pjdo.rs.next())
			        	bch_jfid = so.dc.pjdo.rs.getString(1);
			      }
			      catch (SQLException e) {
			        e.printStackTrace();
			      }
			      req.setAttribute("ID", id);
			      req.setAttribute("BCH_ID", bch_jfid);
		      ContainUpdateSql cus = new ContainUpdateSql();
		      cus.masteSql = sql;
		      cus.detail1Sql = sql_fj;
		      so.getSession().setAttribute(
		        so.actionMapping.findForward(
		        switchForward(so.actForward)).getPath() + 
		        "_updatesql", cus);
		}else if ("INSERT_ZW".equalsIgnoreCase(so.getActForward())) {
			String JFINSECTCODE = so.httpServletRequest.getParameter("JFINSECTCODE");
			String JFPLANTCODE = so.httpServletRequest.getParameter("JFPLANTCODE");
			String JFHARM = so.httpServletRequest.getParameter("JFHARM");
			String JFHABIT = so.httpServletRequest.getParameter("JFHABIT");
			String JFCURE = so.httpServletRequest.getParameter("JFCURE");
			String bch_jfid = so.httpServletRequest.getParameter("bch_jfid");
			String jfid="";
			if(JFINSECTCODE == null){JFINSECTCODE="";}
			if(JFPLANTCODE == null){JFPLANTCODE="";}
			if(JFHARM == null){JFHARM="";}
			if(JFHABIT == null){JFHABIT="";}
			if(JFCURE == null){JFCURE="";}
			if(bch_jfid == null){bch_jfid="";}
			String sql_temp="select * from dbchzw where JFINSECTCODE='"+JFINSECTCODE+"' and JFPLANTCODE='"+JFPLANTCODE+"'";
			int c = so.dc.pjdo.execute(sql_temp);
			if (c > 0) {
				so.httpServletRequest.setAttribute("Message", "作物编码已存在！");
	            return;
			} 
		    try {
		        so.dc.pjdo.executeQuery("SELECT SEQU_DBCHZW.NEXTVAL FROM dual");
		        if (so.dc.pjdo.rs.next())
		          jfid = so.dc.pjdo.rs.getString(1);
		      }
		      catch (SQLException e) {
		        e.printStackTrace();
		      }
			String sql = "INSERT INTO dbchzw(JFID,JFINSECTCODE,JFPLANTCODE,JFHARM,JFHABIT,JFCURE) VALUES('"+jfid+"','" 
				+ JFINSECTCODE + "','" + JFPLANTCODE + "','"+JFHARM+"','" + JFHABIT + "','" + JFCURE + "')";
			 c = so.dc.pjdo.execute(sql);
			if (c > 0) {
				so.httpServletRequest.setAttribute("Message", "成功！");
				so.setActForward("UPDATE_ZW");
		    	  so.httpServletRequest.setAttribute("id", jfid);
		    	  so.httpServletRequest.setAttribute("bch_id", bch_jfid);
			} else {
				so.httpServletRequest.setAttribute("Message", "失败！");
	            return;
			}
		}else if ("DEL_ZW".equalsIgnoreCase(so.getActForward())) {
		      String sql = "DELETE FROM dbchzw_img WHERE JFID='" + id + "'";
		      if (so.dc.pjdo.execute(sql) > 0) {
		        String path = req.getParameter("path");
		        String idd = req.getParameter("idd");
		        so.dc.ec.commit();
		        out.print("<script>alert('删除成功');parent.window.location='/insect/bchAction.do?ACT_TYPE=DETAIL_ZW&id=" + 
		          idd + ";</script>");
		        DeleteFile.delete(getServlet().getServletContext().getRealPath("/") + path.substring(8));
		      } else {
		        so.dc.ec.rollback();
		        req.setAttribute("Message", "删除失败");
		      }
		}else if ("UPDATE_ZW".equalsIgnoreCase(so.getActForward())) {
			String JFINSECTCODE = so.httpServletRequest.getParameter("dqbfb:JFINSECTCODE:str:s");
			String JFPLANTCODE = so.httpServletRequest.getParameter("dqbfb:JFPLANTCODE:str:s");
			String JFHARM = so.httpServletRequest.getParameter("dqbfb:JFHARM:str:s");
			String JFHABIT = so.httpServletRequest.getParameter("dqbfb:JFHABIT:str:s");
			String JFCURE = so.httpServletRequest.getParameter("dqbfb:JFCURE:str:s");
			String bch_jfid = so.httpServletRequest.getParameter("bch_id");
			String jfid=so.httpServletRequest.getParameter("dqbfb:jfid:str:P");
			if(JFPLANTCODE == null){JFPLANTCODE="";}
			if(JFHARM == null){JFHARM="";}
			if(JFHABIT == null){JFHABIT="";}
			if(JFCURE == null){JFCURE="";}
			if(bch_jfid == null){bch_jfid="";}
			String sql_temp="select * from dbchzw where JFINSECTCODE='"+JFINSECTCODE+"' and JFPLANTCODE='"+JFPLANTCODE+"'";
			int c = so.dc.pjdo.execute(sql_temp);
			if (c > 0) {
				so.httpServletRequest.setAttribute("Message", "作物编码已存在！");
	            return;
			} 
			String sql = "UPDATE dbchzw set JFPLANTCODE='"+JFPLANTCODE+"',JFHARM='"+JFHARM+"',JFHABIT='"+JFHABIT+"',JFCURE='"+JFCURE+"' where jfid='"+jfid+"'";
			 c = so.dc.pjdo.execute(sql);
			if (c > 0) {
				so.httpServletRequest.setAttribute("Message", "成功！");
				so.setActForward("UPDATE_ZW");
		    	  so.httpServletRequest.setAttribute("id", jfid);
		    	  so.httpServletRequest.setAttribute("bch_id", bch_jfid);
			} else {
				so.httpServletRequest.setAttribute("Message", "失败！");
	            return;
			}
		}else if ("DELZW".equalsIgnoreCase(so.getActForward())) {
			String bch_jfid="";
		    try {
		        so.dc.pjdo.executeQuery("SELECT a.jfid FROM dbch a,dbchzw b where a.JFINSECTCODE=b.JFINSECTCODE and b.JFID='" + id + "'");
		        if (so.dc.pjdo.rs.next())
		        	bch_jfid = so.dc.pjdo.rs.getString(1);
		      }
		      catch (SQLException e) {
		        e.printStackTrace();
		      }
		      String sql = "DELETE FROM dbchzw WHERE JFID='" + id + "'";
		      if (so.dc.pjdo.execute(sql) > 0) {
		        so.dc.ec.commit();
		        out.print("<script>alert('删除成功');window.close();</script>");
		      } else {
		        so.dc.ec.rollback();
		        req.setAttribute("Message", "删除失败");
		      }
		}

	}
}
	
