package com.jf.bchyj.action.system.zw;

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

public class ZwAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String bmbm = so.httpServletRequest.getParameter("bmbm");
		String bmmc = so.httpServletRequest.getParameter("bmmc");
		String lb = so.httpServletRequest.getParameter("lb");
		String zt = so.httpServletRequest.getParameter("zt");
		String sql = "SELECT JFID,JFPLANTCODE,JFPLANTNAME,f_get_mc('PLANT',JFSTATCODE) lb,f_get_mc('SCZL',SCZL) SCZL,decode(JFSTATE,'0','废弃','1','使用') JFSTATE FROM dzw WHERE 1=1 ";
		if(bmbm == null){bmbm="";}
		if(bmmc == null){bmmc="";}
		if(lb == null){lb="";}
		if(zt == null){zt="";}
		if (bmbm.length()>0) { //
			sql +=  " and JFPLANTCODE = '"+bmbm+"'";
		}
		if (bmmc.length()>0) { // 
			sql +=  " and JFPLANTNAME like '%"+bmmc+"%'";
		}
		if (lb.length()>0) { // 
			sql +=  " and JFSTATCODE = '"+lb+"'";
		}
		if (zt.length()>0) { // 
			sql +=  " and JFSTATE = '"+zt+"'";
		}
		sql += " ORDER BY JFPLANTCODE";
	      javax.servlet.http.HttpSession session = so.httpServletRequest.getSession(true);
	      ContainDivPage cdp = new ContainDivPage();
	      cdp.sqlWhole = sql;
	      cdp.sqlsort = "";
	      cdp.sqlselect = sql;
	      session.setAttribute(so.actionMapping.findForward(switchForward(
	    		  so.actForward)).getPath() + "_sql", cdp);
		
	}

	protected void insert(ServletObject so) {
		String JFPLANTCODE = so.httpServletRequest.getParameter("JFPLANTCODE");
		String JFPLANTNAME = so.httpServletRequest.getParameter("JFPLANTNAME");
		String JFSTATCODE = so.httpServletRequest.getParameter("JFSTATCODE");
		String SCZL = so.httpServletRequest.getParameter("SCZL");
		String JFREMARK = so.httpServletRequest.getParameter("JFREMARK");
		String zt = so.httpServletRequest.getParameter("zt");
		String jfid="";
		if(JFPLANTCODE == null){JFPLANTCODE="";}
		if(JFPLANTNAME == null){JFPLANTNAME="";}
		if(SCZL == null){SCZL="";}
		if(JFSTATCODE == null){JFSTATCODE="";}
		if(JFREMARK == null){JFREMARK="";}
		if(zt == null){zt="";}
		String sql_temp="select * from dzw where JFPLANTCODE='"+JFPLANTCODE+"'";
		int c = so.dc.pjdo.execute(sql_temp);
		if (c > 0) {
			so.httpServletRequest.setAttribute("Message", "作物编码已存在！");
            return;
		} 
	    try {
	        so.dc.pjdo.executeQuery("SELECT SEQU_DZW.NEXTVAL FROM dual");
	        if (so.dc.pjdo.rs.next())
	          jfid = so.dc.pjdo.rs.getString(1);
	      }
	      catch (SQLException e) {
	        e.printStackTrace();
	      }
		String sql = "INSERT INTO dzw(JFID,JFPLANTCODE,JFPLANTNAME,JFSTATCODE,SCZL,JFREMARK,JFSTATE) VALUES('"+jfid+"','" 
			+ JFPLANTCODE + "','" + JFPLANTNAME + "','"+JFSTATCODE+"','" + SCZL + "','" + JFREMARK + "','" + zt + "')";
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
		String JFPLANTCODE = servletObject.httpServletRequest.getParameter("dqbfb:JFPLANTCODE:str:s");
		String JFPLANTNAME = servletObject.httpServletRequest.getParameter("dqbfb:JFPLANTNAME:str:s");
		String SCZL = servletObject.httpServletRequest.getParameter("dqbfb:SCZL:str:s");
		String JFSTATCODE = servletObject.httpServletRequest.getParameter("dqbfb:JFSTATCODE:str:s");
		String JFREMARK = servletObject.httpServletRequest.getParameter("dqbfb:JFREMARK:str:s");
		String JFSTATE = servletObject.httpServletRequest.getParameter("dqbfb:JFSTATE:str:s");
		if(JFPLANTCODE == null){JFPLANTCODE="";}
		if(JFPLANTNAME == null){JFPLANTNAME="";}
		if(SCZL == null){SCZL="";}
		if(JFSTATCODE == null){JFSTATCODE="";}
		if(JFREMARK == null){JFREMARK="";}
		if(JFSTATE == null){JFSTATE="";}
	    String jfid = httpServletRequest.getParameter("dqbfb:jfid:str:P");
	 

	    sql = "update dzw set JFPLANTCODE='"+JFPLANTCODE+"',\n";
	    sql +="JFPLANTNAME='"+JFPLANTNAME+"',SCZL='"+SCZL+"',JFSTATCODE='"+JFSTATCODE+"',JFREMARK='"+JFREMARK+"',JFSTATE='"+JFSTATE+"'\n";
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
		      String sql = "SELECT JFID,JFPLANTCODE,JFPLANTNAME,JFSTATCODE,SCZL,JFREMARK,JFSTATE FROM dZW WHERE JFID='" + id + "'";
		      String sql_zw = "select a.jfid,a.JFINSECTCODE,f_get_mc('INSECT_ALL',a.JFINSECTCODE) JFINSECTNAME from dbchzw a,dzw b where a.JFPLANTCODE=b.JFPLANTCODE and b.jfid='" + id + "'";
		      req.setAttribute("ID", id);
		      ContainUpdateSql cus = new ContainUpdateSql();
		      cus.masteSql = sql;
		      cus.detail2Sql = sql_zw;
		      so.getSession().setAttribute(
		        so.actionMapping.findForward(
		        switchForward(so.actForward)).getPath() + 
		        "_updatesql", cus);
		}else if ("DETAIL_ZW".equalsIgnoreCase(so.getActForward())) {
		      String sql = "SELECT JFID,JFINSECTCODE,f_get_mc('PLANT_ALL',JFPLANTCODE) JFPLANTNAME,JFPLANTCODE,JFHARM,JFHABIT,JFCURE FROM dbchzw WHERE JFID='" + id + "'";
		      String sql_fj = "SELECT JFID,LJ,mc WJM FROM dbchzw_img WHERE JFDBCHZW_ID='" + id + "'";
		      String bch_jfid="";
			    try {
			        so.dc.pjdo.executeQuery("SELECT a.jfid FROM dzw a,dbchzw b where a.JFPLANTCODE=b.JFPLANTCODE and b.JFID='" + id + "'");
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
		        out.print("<script>alert('删除成功');parent.window.location='/insect/zwAction.do?ACT_TYPE=DETAIL_ZW&id=" + 
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
			String sql = "UPDATE dbchzw set JFINSECTCODE='"+JFINSECTCODE+"',JFHARM='"+JFHARM+"',JFHABIT='"+JFHABIT+"',JFCURE='"+JFCURE+"' where jfid='"+jfid+"'";
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
		        so.dc.pjdo.executeQuery("SELECT a.jfid FROM dzw a,dbchzw b where a.JFPLANTCODE=b.JFPLANTCODE and b.JFID='" + id + "'");
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
	
