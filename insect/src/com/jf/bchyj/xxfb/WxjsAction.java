package com.jf.bchyj.xxfb;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jf.bchyj.bean.User;
import com.jf.bchyj.common.zjz_upload.DeleteFile;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ContainUpdateSql;
import mt.controller.base.ServletObject;

public class WxjsAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String bt=so.httpServletRequest.getParameter("bt");
		String lb=so.httpServletRequest.getParameter("lb");
		String lrrq_b=so.httpServletRequest.getParameter("lrrq_b");
		String lrrq_e=so.httpServletRequest.getParameter("lrrq_e");
		String sql = "SELECT JFID,BT,LY,ZZ,f_get_mc('INSECT_ALL',BCH)BCH,ZW,decode(ZT,'1','发布',0,'初始')ztmc,ZT,to_char(LRRQ,'yyyy-mm-dd')LRRQ,LRRY FROM DWXJS t where 1=1";
		if(bt!=null&&!bt.equals(""))
		{
			sql+=" and bt like '%"+bt+"%'";
		}
		if(lb!=null&&!lb.equals(""))
		{
			if(!lb.equals(""))
			{
				sql+=" and zt="+lb;
			}
		}
		if(lrrq_b!=null&&!lrrq_b.equals(""))
		{
			sql+=" and lrrq >= to_date('"+lrrq_b+"','yy-mm-dd')";
		}
		if(lrrq_e!=null&&!lrrq_e.equals(""))
		{
			sql+=" and lrrq < to_date('"+lrrq_e+"','yy-mm-dd')";
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
		String bt = so.httpServletRequest.getParameter("bt");
		String bch = so.httpServletRequest.getParameter("bch");
		String ly = so.httpServletRequest.getParameter("ly");
		String zz = so.httpServletRequest.getParameter("zz");
		String zw = so.httpServletRequest.getParameter("zw");
		String bmbm = so.httpServletRequest.getParameter("bmbm");
	    String zt = so.httpServletRequest.getParameter("zt");
		String jfid="";
		String zwjfid="";
		String zwid_sum="";
	    try {
	        so.dc.pjdo.executeQuery("SELECT nvl(MAX(TO_NUMBER(JFID)),0)+1 FROM dwxjs");
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
				   so.dc.pjdo.executeQuery("SELECT nvl(MAX(TO_NUMBER(JFID)),0)+1 FROM DWXJS_ZW");
				  if (so.dc.pjdo.rs.next()){
					  zwjfid = so.dc.pjdo.rs.getString(1);
					  zwid_sum+=zwjfid+",";
				  }
				  if(size>1)
				  {
					  so.dc.pjdo.executeQuery("INSERT INTO DWXJS_ZW (JFID,DYID,ZW) VALUES ('"+zwjfid+"','"+jfid+"','"+zw.substring((i-1)*3500,i*3500)+"')");
				  }
				  if(i==size)
				  {
					  if(size==1)
					  {
						  so.dc.pjdo.execute("INSERT INTO DWXJS_ZW (JFID,DYID,ZW) VALUES ('"+(Integer.parseInt(zwjfid)+1)+"','"+jfid+"','"+zw.substring(0,length)+"')");
					  }
					  else
					  {
						  so.dc.pjdo.execute("INSERT INTO DWXJS_ZW (JFID,DYID,ZW) VALUES ('"+(Integer.parseInt(zwjfid)+1)+"','"+jfid+"','"+zw.substring(i*3500,length)+"')");
					  }
				  }
				 
			     }
		     }
	      }
	      catch (SQLException e) {
	        e.printStackTrace();
	      }
	      String sql="";
	      if(zt.equals("0"))
	      {
	    	  sql = "INSERT INTO dwxjs(JFID,bt,ly,zz,bch,zw,zt,lrrq,lrry) VALUES('"+jfid+"','" 
	    	  + bt + "','" + ly + "','" + zz + "','" + bch + "','" + zwid_sum + "','" + zt + "',sysdate,'"+bmbm+"')";
	      }
	      else if(zt.equals("1"))
	      {
	    	  sql = "INSERT INTO dwxjs(JFID,bt,ly,zz,bch,zw,zt,lrrq,lrry,fbrq) VALUES('"+jfid+"','" 
	    	  + bt + "','" + ly + "','" + zz + "','" + bch + "','" + zwid_sum + "','" + zt + "',sysdate,'"+bmbm+"',sysdate)";
	    	  
	      }
		int c = so.dc.pjdo.execute(sql);
		if (c > 0) {
		    if ("1".equals(zt)) {
		    	so.httpServletRequest.setAttribute("Message", "提交成功");
		      } else {
		    	  so.httpServletRequest.setAttribute("Message", "保存成功");
		    	  so.httpServletRequest.setAttribute("id", jfid);
		    	  so.httpServletRequest.setAttribute("zt", zt);
		      }
		} else {
			so.httpServletRequest.setAttribute("Message", "数据插入失败！");
            return;
		}
	}
	protected void update(ServletObject so) {
	    HttpServletRequest req = so.httpServletRequest;
	    String jfid = req.getParameter("jfid");
	    String bt = req.getParameter("dwxjs:bt:str:s");
	    String bch = req.getParameter("dwxjs:bch:str:s");
	    String ly = req.getParameter("dwxjs:ly:str:s");
	    String zz = req.getParameter("dwxjs:zz:str:s");
	    String zw = req.getParameter("zw");
	    String lyyr = req.getParameter("bmbm");
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
		 String sqldel = "DELETE FROM DWXJS_ZW WHERE dyid='" + jfid + "'";
		 if (so.dc.pjdo.execute(sqldel) > 0) {
			 so.dc.ec.commit();
		 }
		try {
	     	 for (int i = 1; i <= size; i++) {
			   so.dc.pjdo.executeQuery("SELECT nvl(MAX(TO_NUMBER(JFID)),0)+1 FROM DWXJS_ZW");
			  if (so.dc.pjdo.rs.next()){
				  zwjfid = so.dc.pjdo.rs.getString(1);
				  zwid_sum+=zwjfid+",";
			  }
			  if(size>1)
			  {
				  so.dc.pjdo.executeQuery("INSERT INTO DWXJS_ZW (JFID,DYID,ZW) VALUES ('"+zwjfid+"','"+jfid+"','"+zw.substring((i-1)*3500,i*3500)+"')");

			  }
			  if(i==size)
			  {
				  if(size==1)
				  {
					  so.dc.pjdo.execute("INSERT INTO DWXJS_ZW (JFID,DYID,ZW) VALUES ('"+(Integer.parseInt(zwjfid)+1)+"','"+jfid+"','"+zw.substring(0,length)+"')");
				  }
				  else
				  {
					  so.dc.pjdo.execute("INSERT INTO DWXJS_ZW (JFID,DYID,ZW) VALUES ('"+(Integer.parseInt(zwjfid)+1)+"','"+jfid+"','"+zw.substring(i*3500,length)+"')");
				  }
			  }
		     }
	        }
	      catch (SQLException e) {
	        e.printStackTrace();
	      }
	    }
	    String sql="";
	    if(zt.trim().equals("0")){
		     sql = "UPDATE dwxjs SET BT='"+bt+"',LY='"+ly+"',ZZ='"+zz+"',BCH="+bch+",ZW='"+zwid_sum+"',ZT='"+zt+"' WHERE JFID='" + jfid + "'";
	    }else if(zt.trim().equals("1")){
	    	sql = "UPDATE dwxjs SET BT='"+bt+"',LY='"+ly+"',ZZ='"+zz+"',BCH="+bch+",ZW='"+zwid_sum+"',ZT='"+zt+"',FBRQ=sysdate WHERE JFID='" + jfid + "'";
	    }else if(zt.trim().equals("2"))
	    {
	    	sql = "UPDATE dwxjs set zt='0' where jfid="+jfid;
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
	    if(zt.equals("1"))
	    {
	    	if(zt!=null)
	    	{
	    		if(zt.equals("1"))
	    		{
	    			 sql="SELECT JFID,BT,LY,ZZ,f_get_mc('INSECT_ALL',BCH)BCH,ZW,ZT,LRRQ,LRRY,to_char(fbrq,'yyyy-mm-dd') fbrq FROM DWXJS t where jfid="+jfid;
	    		}
	    		else
	    		{
	    			 sql="SELECT JFID,BT,LY,ZZ,BCH,ZW,ZT,LRRQ,LRRY FROM DWXJS t where jfid="+jfid;
	    		}
	    	}
	    	String sql_fj="select JFID,dwxjs_jfid,LJ,MC,SM from DWXJS_FJ t where DWXJS_JFID="+jfid;
		      ContainUpdateSql cus = new ContainUpdateSql();
		      cus.masteSql = sql;
		      cus.detail1Sql = sql_fj;
		      so.getSession().setAttribute(
		        so.actionMapping.findForward(
		        switchForward(so.actForward)).getPath() + 
		        "_updatesql", cus);
	    }
	    
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
	    	String zt=so.httpServletRequest.getParameter("zt");
	    	String sql="";
	    	if(zt!=null)
	    	{
	    		if(zt.equals("1"))
	    		{
	    			 sql="SELECT JFID,BT,LY,ZZ,f_get_mc('INSECT_ALL',BCH)BCH,ZW,ZT,LRRQ,LRRY,to_char(fbrq,'yyyy-mm-dd') fbrq FROM DWXJS t where jfid="+id;
	    		}
	    		else
	    		{
	    			 sql="SELECT JFID,BT,LY,ZZ,BCH,ZW,ZT,LRRQ,LRRY FROM DWXJS t where jfid="+id;
	    		}
	    	}
	    	String sql_fj="select JFID,dwxjs_jfid,LJ,MC,SM from DWXJS_FJ t where DWXJS_JFID="+id;
	    	 req.setAttribute("ID", id);
		      ContainUpdateSql cus = new ContainUpdateSql();
		      cus.masteSql = sql;
		      cus.detail1Sql = sql_fj;
		      so.getSession().setAttribute(
		        so.actionMapping.findForward(
		        switchForward(so.actForward)).getPath() + 
		        "_updatesql", cus);
	    }
	    else if("DEL".equals(forward))
	    {
	    	 String sql = "DELETE FROM dwxjs_fj WHERE JFID='" + id + "'";
		      if (so.dc.pjdo.execute(sql) > 0) {
		        String path = req.getParameter("path");
		        String idd = req.getParameter("idd");
		        so.dc.ec.commit();
		        out.print("<script>alert('删除成功');parent.window.location='/insect/wxjs_Action.do?ACT_TYPE=DETAIL&id=" + 
				          idd + "&zt=0';</script>");
				DeleteFile.delete(getServlet().getServletContext().getRealPath("/") + path.substring(8));
		      }
		      else
		      {
		    	  so.dc.ec.rollback();
			      req.setAttribute("Message", "删除失败");
		      }
	    }else if ("DELZJ".equalsIgnoreCase(so.getActForward())) {
	    	String jfid = req.getParameter("id");
	    	String zt = req.getParameter("zt");
	    	if(zt.equals("0"))
			 {
	    	//删除对应关联数据
			 String sqldel = "DELETE FROM DWXJS_ZW WHERE dyid='" + jfid + "'";
			 if (so.dc.pjdo.execute(sqldel) > 0) {
				 so.dc.ec.commit();
			 }else{
				 so.dc.ec.rollback();
			 }
			 sqldel = "DELETE FROM DWXJS WHERE jfid='" + jfid + "'";
			 if (so.dc.pjdo.execute(sqldel) > 0) {
				 so.dc.ec.commit();
			 }else{
				 so.dc.ec.rollback();
			 }
			 sqldel = "DELETE FROM dwxjs_fj WHERE DWXJS_JFID='" + jfid + "'";
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
