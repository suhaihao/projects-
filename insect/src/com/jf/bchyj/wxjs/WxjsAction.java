package com.jf.bchyj.wxjs;

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
		String bch=so.httpServletRequest.getParameter("bch");
		String lb=so.httpServletRequest.getParameter("lb");
		String lrrq_b=so.httpServletRequest.getParameter("lrrq_b");
		String lrrq_e=so.httpServletRequest.getParameter("lrrq_e");
		String sql = "SELECT JFID,BT,LY,ZZ,f_get_mc('INSECT_ALL',BCH)BCH,ZW,decode(ZT,'1','发布',0,'初始')ztmc,ZT,to_char(LRRQ,'yyyy-mm-dd')LRRQ,LRRY FROM DWXJS t where zt=1";
		if(bt!=null&&!bt.equals(""))
		{
			sql+=" and bt like '%"+bt+"%'";
		}
		if(bch!=null&&!bch.equals(""))
		{
			sql+=" and bch="+bch;
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
	    try {
	        so.dc.pjdo.executeQuery("SELECT nvl(MAX(TO_NUMBER(JFID)),0)+1 FROM dwxjs");
	        if (so.dc.pjdo.rs.next())
	          jfid = so.dc.pjdo.rs.getString(1);
	      }
	      catch (SQLException e) {
	        e.printStackTrace();
	      }
	      String sql="";
	      if(zt.equals("0"))
	      {
	    	  sql = "INSERT INTO dwxjs(JFID,bt,ly,zz,bch,zw,zt,lrrq,lrry) VALUES('"+jfid+"','" 
	    	  + bt + "','" + ly + "','" + zz + "','" + bch + "','" + zw + "','" + zt + "',sysdate,'"+bmbm+"')";
	      }
	      else if(zt.equals("1"))
	      {
	    	  sql = "INSERT INTO dwxjs(JFID,bt,ly,zz,bch,zw,zt,lrrq,lrry,fbrq) VALUES('"+jfid+"','" 
	    	  + bt + "','" + ly + "','" + zz + "','" + bch + "','" + zw + "','" + zt + "',sysdate,'"+bmbm+"',sysdate)";
	    	  
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
	    String zw = req.getParameter("dwxjs:zw:str:s");
	    String lyyr = req.getParameter("bmbm");
	    String zt = req.getParameter("zt");
	    String sql="";
	    if(zt.trim().equals("0")){
		     sql = "UPDATE dwxjs SET BT='"+bt+"',LY='"+ly+"',ZZ='"+zz+"',BCH="+bch+",ZW='"+zw+"',ZT='"+zt+"' WHERE JFID='" + jfid + "'";
	    }else if(zt.trim().equals("1")){
	    	sql = "UPDATE dwxjs SET BT='"+bt+"',LY='"+ly+"',ZZ='"+zz+"',BCH="+bch+",ZW='"+zw+"',ZT='"+zt+"',FBRQ=sysdate WHERE JFID='" + jfid + "'";
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
	    }
	}
}
