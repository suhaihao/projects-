package com.jf.bchyj.xxfb;

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

public class Xxfb_cbgfQueryAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String lb = so.httpServletRequest.getParameter("lb");
		String lx = so.httpServletRequest.getParameter("lx");
		String ly = so.httpServletRequest.getParameter("ly");
		String zz = so.httpServletRequest.getParameter("zz");
		String lrrq_b = so.httpServletRequest.getParameter("lrrq_b");
		String lrrq_e = so.httpServletRequest.getParameter("lrrq_e");
		String sql = "SELECT JFID,decode(lb,'01','北京','02','全国') lb,decode(lx,'01','国标','02','行标','03','地标','04','测报办法') lx,bt,ly,to_char(fbrq,'yyyy-mm-dd hh24:mi:ss') fbrq,decode(zt,'0','初始','1','提交') zt,zt ztbm FROM dcbgf WHERE 1=1 ";
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

	protected void insert(ServletObject so) {
		String lb = so.httpServletRequest.getParameter("lb");
		String lx = so.httpServletRequest.getParameter("lx");
		String bt = so.httpServletRequest.getParameter("bt");
	    String zt = so.httpServletRequest.getParameter("zt");
		String lrry = ((User) so.getSession().getAttribute("user")).getUserid();
		String jfid="";
		String zw = so.httpServletRequest.getParameter("zw");
		String zwjfid="";
		String zwid_sum="";
	    try {
	        so.dc.pjdo.executeQuery("SELECT nvl(MAX(TO_NUMBER(JFID)),0)+1 FROM dcbgf");
	        if (so.dc.pjdo.rs.next())
	        {
	          jfid = so.dc.pjdo.rs.getString(1);
	        }
	        if(zw!=null)
			{
			zw=zw.replaceAll("'", "!");
			int length=zw.length();
			int size=zw.length()/3500;
			if(size==0)
			{
				size=1;
			}
		     	 for (int i = 1; i <= size; i++) {
				   so.dc.pjdo.executeQuery("SELECT nvl(MAX(TO_NUMBER(JFID)),0)+1 FROM dcbgf_zw");
				  if (so.dc.pjdo.rs.next()){
					  zwjfid = so.dc.pjdo.rs.getString(1);
					  zwid_sum+=zwjfid+",";
				  }
				  if(size>1)
				  {
					  so.dc.pjdo.executeQuery("INSERT INTO dcbgf_zw (JFID,DYID,ZW) VALUES ('"+zwjfid+"','"+jfid+"','"+zw.substring((i-1)*3500,i*3500)+"')");

				  }
				  if(i==size)
				  {
					  if(size==1)
					  {
						  so.dc.pjdo.execute("INSERT INTO dcbgf_zw (JFID,DYID,ZW) VALUES ('"+(Integer.parseInt(zwjfid)+1)+"','"+jfid+"','"+zw.substring(0,length)+"')");
					  }else{
						  so.dc.pjdo.execute("INSERT INTO dcbgf_zw (JFID,DYID,ZW) VALUES ('"+(Integer.parseInt(zwjfid)+1)+"','"+jfid+"','"+zw.substring(i*3500,length)+"')");
					  }
				  }
			     }
		        }
	      }
	      catch (SQLException e) {
	        e.printStackTrace();
	      }
	    String sql="";
	    if(!zt.equals("1"))
	    {
	    	
		 sql = "INSERT INTO dcbgf(JFID,lb,lx,bt,zw,zt,lrrq,lrry) VALUES('"+jfid+"','" 
				+ lb + "','" + lx + "','" + bt + "','" + zwid_sum + "','"+zt+"',sysdate,'"+lrry+"')";
	    }
	    else
	    {
	     sql = "INSERT INTO dcbgf(JFID,lb,lx,bt,zw,zt,lrrq,lrry,fbrq) VALUES('"+jfid+"','" 
	    			+ lb + "','" + lx + "','" + bt + "','" + zwid_sum + "','"+zt+"',sysdate,'"+lrry+"',sysdate)";
	    }
		int c = so.dc.pjdo.execute(sql);
		if (c > 0) {
		    if ("1".equals(zt)) {
		    	so.httpServletRequest.setAttribute("Message", "提交成功");
		      } else {
		    	  so.httpServletRequest.setAttribute("Message", "保存成功");
		    	  so.httpServletRequest.setAttribute("id", jfid);
		      }
		} else {
			so.httpServletRequest.setAttribute("Message", "数据插入失败！");
            return;
		}
	}

	protected void update(ServletObject so) {
	    HttpServletRequest req = so.httpServletRequest;
	    String jfid = req.getParameter("dcbgf:jfid:str:P");
	    String lb = req.getParameter("dcbgf:lb:str:s");
	    String lx = req.getParameter("dcbgf:lx:str:s");
	    String bt = req.getParameter("dcbgf:bt:str:s");
	    String zw = req.getParameter("zw");
	    String zt = req.getParameter("zt");
	    String zwjfid="";
	    String zwid_sum="";
	    if(zw!=null)
	    {
	    	
	    zw=zw.replaceAll("'", "!");
		int length=zw.length();
		int size=zw.length()/3500;
		if(size==0)
		{
			size=1;
		}
		//删除对应关联数据
		 String sqldel = "DELETE FROM dcbgf_zw WHERE dyid='" + jfid + "'";
		 if (so.dc.pjdo.execute(sqldel) > 0) {
			 so.dc.ec.commit();
		 }
		try {
	     	 for (int i = 1; i <= size; i++) {
			   so.dc.pjdo.executeQuery("SELECT nvl(MAX(TO_NUMBER(JFID)),0)+1 FROM dcbgf_zw");
			  if (so.dc.pjdo.rs.next()){
				  zwjfid = so.dc.pjdo.rs.getString(1);
				  zwid_sum+=zwjfid+",";
			  }
			  if(size>1)
			  {
				  so.dc.pjdo.executeQuery("INSERT INTO dcbgf_zw (JFID,DYID,ZW) VALUES ('"+zwjfid+"','"+jfid+"','"+zw.substring((i-1)*3500,i*3500)+"')");

			  }
			  if(i==size)
			  {
				  if(size==1)
				  {
					  so.dc.pjdo.execute("INSERT INTO dcbgf_zw (JFID,DYID,ZW) VALUES ('"+(Integer.parseInt(zwjfid)+1)+"','"+jfid+"','"+zw.substring(0,length)+"')");
				  }else{
					  so.dc.pjdo.execute("INSERT INTO dcbgf_zw (JFID,DYID,ZW) VALUES ('"+(Integer.parseInt(zwjfid)+1)+"','"+jfid+"','"+zw.substring(i*3500,length)+"')");
				  }
			  }
		     }
	        }
	      catch (SQLException e) {
	        e.printStackTrace();
	      }
	    }
	    String sql="";
	    if(zt.trim().equals("2")){
		     sql = "UPDATE dcbgf SET ZT='0' WHERE JFID='" + jfid + "'";
	    }else if(zt.trim().equals("0")){
	     sql = "UPDATE dcbgf SET lb='" + lb + "',lx='" + lx + "',BT='" + bt + "',zw='" + zwid_sum + "',ZT='" + zt + "' WHERE JFID='" + jfid + "'";
	    }else if(zt.trim().equals("1")){
	     sql = "UPDATE dcbgf SET lb='" + lb + "',lx='" + lx + "',BT='" + bt + "',zw='" + zwid_sum + "',ZT='" + zt + "',fbrq=sysdate WHERE JFID='" + jfid + "'";
	    }
	    if (so.dc.pjdo.execute(sql) > 0)
	      so.dc.ec.commit();
	    else {
	      so.dc.ec.rollback();
	    }
	    if ("1".equals(zt))
	      req.setAttribute("Message", "提交成功");
	    else {
	      req.setAttribute("Message", "保存成功");
	    }
	    req.setAttribute("ZT", zt);
	    req.setAttribute("ID", jfid);
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
		}else if ("DEL".equalsIgnoreCase(so.getActForward())) {
		      String sql = "DELETE FROM Dcbgf_FJ WHERE JFID='" + id + "'";
		      if (so.dc.pjdo.execute(sql) > 0) {
		        String path = req.getParameter("path");
		        String idd = req.getParameter("idd");
		        so.dc.ec.commit();
		        out.print("<script>alert('删除成功');parent.window.location='/insect/xxfb_cbgfQueryAction.do?ACT_TYPE=DETAIL&id=" + 
		          idd + "&zt=0';</script>");
		        DeleteFile.delete(getServlet().getServletContext().getRealPath("/") + path.substring(8));
		      } else {
		        so.dc.ec.rollback();
		        req.setAttribute("Message", "删除失败");
		      }
		}else if ("DELZJ".equalsIgnoreCase(so.getActForward())) {
			 String jfid = req.getParameter("id");
			 String zt = req.getParameter("zt");
			 if(zt.equals("0"))
			 {
			 String sqldel = "DELETE FROM dcbgf_zw WHERE dyid='" + jfid + "'";
			 if (so.dc.pjdo.execute(sqldel) > 0) {
				 so.dc.ec.commit();
			 }else{
				 so.dc.ec.rollback();
			 }
			 sqldel = "DELETE FROM Dcbgf_FJ WHERE DCBGF_JFID='" + jfid + "'";
			 if (so.dc.pjdo.execute(sqldel) > 0) {
				 so.dc.ec.commit();
			 }else{
				 so.dc.ec.rollback();
			 }
			 sqldel = "DELETE FROM dcbgf WHERE jfid='" + jfid + "'";
			 if (so.dc.pjdo.execute(sqldel) > 0) {
				 so.dc.ec.commit();
			 }else{
				 so.dc.ec.rollback();
			 }
			     req.setAttribute("Message", "删除成功");
			 }else{
				 req.setAttribute("Message", "提交无法删除");
			 }
			
		}
	}

}
