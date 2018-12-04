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

public class Xxfb_bcqbAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String lb = so.httpServletRequest.getParameter("lb");
		String bch = so.httpServletRequest.getParameter("bch");
		String bt = so.httpServletRequest.getParameter("bt");
		String zt = so.httpServletRequest.getParameter("zt");
		String lrrq_b = so.httpServletRequest.getParameter("lrrq_b");
		String lrrq_e = so.httpServletRequest.getParameter("lrrq_e");
		String bmbm = ((User) so.getSession().getAttribute("user")).getBmbm();
		String sql = "SELECT JFID,decode(lb,'01','区县','02','全市','03','全国','04','其他省市') lb,bt,f_get_mc('INSECT_ALL',bch) bch,to_char(fbrq,'yyyy-mm-dd hh24:mi:ss') fbrq,decode(zt,'0','初始','1','提交') zt,zt ztbm FROM dqbfb WHERE 1=1 ";
		if(lb == null){lb="";}
		if(bch == null){bch="";}
		if(bt == null){bt="";}
		if(zt == null){zt="";}
		if(lrrq_b == null){lrrq_b="";}
		if(lrrq_e == null){lrrq_e="";}
		if(!bmbm.substring(0,1).equals("1")){
			sql +=  " and lb = '01' and qx='"+bmbm+"' ";
			
		}else if (lb.length()>0) { //
			sql +=  " and lb = '"+lb+"'";
		}
		if (bch.length()>0) { //
			sql +=  " and bch = '"+bch+"'";
		}
		if (bt.length()>0) { // 
			sql +=  " and bt like '%"+bt+"%'";
		}
		if (zt.length()>0) { // 
			sql +=  " and zt = '"+zt+"'";
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
		String qx = so.httpServletRequest.getParameter("qx");
		String sf = so.httpServletRequest.getParameter("sf");
		String bt = so.httpServletRequest.getParameter("bt");
		String zt = so.httpServletRequest.getParameter("zt");
		String lrry = ((User) so.getSession().getAttribute("user")).getUserid();
		String jfid="";
		String zw = so.httpServletRequest.getParameter("zw");
		String zwjfid="";
		String zwid_sum="";
		try {
		so.dc.pjdo.executeQuery("SELECT nvl(MAX(TO_NUMBER(JFID)),0)+1 FROM dqbfb");
		if (so.dc.pjdo.rs.next())
			jfid = so.dc.pjdo.rs.getString(1);
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
			   so.dc.pjdo.executeQuery("SELECT nvl(MAX(TO_NUMBER(JFID)),0)+1 FROM dqbfb_zw");
			  if (so.dc.pjdo.rs.next()){
				  zwjfid = so.dc.pjdo.rs.getString(1);
				  zwid_sum+=zwjfid+",";
			  }
			  if(size>1)
			  {
				  so.dc.pjdo.executeQuery("INSERT INTO dqbfb_zw (JFID,DYID,ZW) VALUES ('"+zwjfid+"','"+jfid+"','"+zw.substring((i-1)*3500,i*3500)+"')");
			  }
			  if(i==size)
			  {
				  if(size==1)
				  {
					  so.dc.pjdo.execute("INSERT INTO dqbfb_zw (JFID,DYID,ZW) VALUES ('"+(Integer.parseInt(zwjfid)+1)+"','"+jfid+"','"+zw.substring(0,length)+"')");
				  }else{
				  so.dc.pjdo.execute("INSERT INTO dqbfb_zw (JFID,DYID,ZW) VALUES ('"+(Integer.parseInt(zwjfid)+1)+"','"+jfid+"','"+zw.substring(i*3500,length)+"')");
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
			 sql =" INSERT INTO dqbfb(JFID,lb,qx,sf,bt,zw,zt,lrrq,lrry) VALUES('"+jfid+"','"+ lb + "','" + qx + "','" + sf + "','" + bt + "','"+zwid_sum+"','"+zt+"',sysdate,'"+lrry+"')";
		}
		else
		{
			 sql =" INSERT INTO dqbfb(JFID,lb,qx,sf,bt,zw,zt,lrrq,lrry,fbrq) VALUES('"+jfid+"','"+ lb + "','" + qx + "','" + sf + "','" + bt + "','"+zwid_sum+"','"+zt+"',sysdate,'"+lrry+"',sysdate)";
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
	    String jfid = req.getParameter("dqbfb:jfid:str:P");
	    String lb = req.getParameter("dqbfb:lb:str:s");
	    String qx = req.getParameter("dqbfb:qx:str:s");
	    String sf = req.getParameter("dqbfb:sf:str:s");
	    String bch = req.getParameter("dqbfb:bch:str:s");
	    String bt = req.getParameter("dqbfb:bt:str:s");
	    String zw = req.getParameter("zw");
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
		 String sqldel = "DELETE FROM dqbfb_zw WHERE dyid='" + jfid + "'";
		 if (so.dc.pjdo.execute(sqldel) > 0) {
			 so.dc.ec.commit();
		 }
		try {
	     	 for (int i = 1; i <= size; i++) {
			   so.dc.pjdo.executeQuery("SELECT nvl(MAX(TO_NUMBER(JFID)),0)+1 FROM dqbfb_zw");
			  if (so.dc.pjdo.rs.next()){
				  zwjfid = so.dc.pjdo.rs.getString(1);
				  zwid_sum+=zwjfid+",";
			  }
			  if(size>1)
			  {
				  so.dc.pjdo.executeQuery("INSERT INTO dqbfb_zw (JFID,DYID,ZW) VALUES ('"+zwjfid+"','"+jfid+"','"+zw.substring((i-1)*3500,i*3500)+"')");
			  }
			  if(i==size)
			  {
				  if(size==1)
				  {
					  so.dc.pjdo.execute("INSERT INTO dqbfb_zw (JFID,DYID,ZW) VALUES ('"+(Integer.parseInt(zwjfid)+1)+"','"+jfid+"','"+zw.substring(0,length)+"')");
				  }else{
					  so.dc.pjdo.execute("INSERT INTO dqbfb_zw (JFID,DYID,ZW) VALUES ('"+(Integer.parseInt(zwjfid)+1)+"','"+jfid+"','"+zw.substring(i*3500,length)+"')");
				  }
			  }
		     }
	        }
	      catch (SQLException e) {
	        e.printStackTrace();
	      }
	    }
		
	    String zt = req.getParameter("zt");
	    String sql="";
	    if(zt.trim().equals("2")){
		     sql = "UPDATE dqbfb SET ZT='0' WHERE JFID='" + jfid + "'";
	    }else if(zt.trim().equals("0")){
	     sql = "UPDATE dqbfb SET lb='" + lb + "',qx='" + qx + "',sf='" + sf + "',bch='" + bch + "',BT='" + bt + "',zw='" + zwid_sum + "',ZT='" + zt + "' WHERE JFID='" + jfid + "'";
	    }else if(zt.trim().equals("1")){
		     sql = "UPDATE dqbfb SET lb='" + lb + "',qx='" + qx + "',sf='" + sf + "',bch='" + bch + "',BT='" + bt + "',zw='" + zwid_sum + "',ZT='" + zt + "',fbrq=sysdate WHERE JFID='" + jfid + "'";
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
	    String lb = "";
	    PrintWriter out = null;
	    try {
	      out = resp.getWriter();
	    } catch (IOException e) {
	      e.printStackTrace();
	    }
		if ("DETAIL".equals(forward)) {
		      String sql = "SELECT JFID,decode(lb,'01','区县','02','全市','03','全国','04','其他省市') lbmc,f_get_mc('DEPT',qx) qxmc,f_get_mc('BCQB_QTSS',sf) sfmc,f_get_mc('INSECT_ALL',bch) bchmc,bch,lb,qx,sf,BT,zw,F_GET_MC('RYBM',LRRY)LRRY,TO_CHAR(fbrq,'YYYY-MM-DD')fbrq,ZT FROM dqbfb WHERE JFID='" + id + "'";
		      String sql_fj = "SELECT JFID,LJ,mc WJM FROM Dqbfb_FJ WHERE dqbfb_JFID='" + id + "'";
			    try {
			        so.dc.pjdo.executeQuery("SELECT lb FROM dqbfb WHERE JFID='" + id + "'");
			        if (so.dc.pjdo.rs.next())
			          lb = so.dc.pjdo.rs.getString(1);
			      }
			      catch (SQLException e) {
			        e.printStackTrace();
			      }
			      if(lb.trim().equals("01")){
				      req.setAttribute("display_01","");
				      req.setAttribute("display_04","none");
			      }else if(lb.trim().equals("04")){
				      req.setAttribute("display_01","none");
				      req.setAttribute("display_04","");
			      }else{
				      req.setAttribute("display_01","none");
				      req.setAttribute("display_04","none");
			      }
		      req.setAttribute("ID", id);
		      ContainUpdateSql cus = new ContainUpdateSql();
		      cus.masteSql = sql;
		      cus.detail1Sql = sql_fj;
		      so.getSession().setAttribute(
		        so.actionMapping.findForward(
		        switchForward(so.actForward)).getPath() + 
		        "_updatesql", cus);
		}else if ("DEL".equalsIgnoreCase(so.getActForward())) {
		      String sql = "DELETE FROM Dqbfb_FJ WHERE JFID='" + id + "'";
		      if (so.dc.pjdo.execute(sql) > 0) {
		        String path = req.getParameter("path");
		        String idd = req.getParameter("idd");
		        so.dc.ec.commit();
		        out.print("<script>alert('删除成功');parent.window.location='/insect/xxfb_bcqbAction.do?ACT_TYPE=DETAIL&id=" + 
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
			//删除对应关联数据
			 String sqldel = "DELETE FROM dqbfb_zw WHERE dyid='" + jfid + "'";
			 if (so.dc.pjdo.execute(sqldel) > 0) {
				 so.dc.ec.commit();
			 }else{
				 so.dc.ec.rollback();
			 }
			 sqldel = "DELETE FROM Dqbfb_FJ WHERE DQBFB_JFID='" + jfid + "'";
			 if (so.dc.pjdo.execute(sqldel) > 0) {
				 so.dc.ec.commit();
			 }else{
				 so.dc.ec.rollback();
			 }
			 sqldel = "DELETE FROM dqbfb WHERE jfid='" + jfid + "'";
			 if (so.dc.pjdo.execute(sqldel) > 0) {
				 so.dc.ec.commit();
			 }else{
				 so.dc.ec.rollback();
			 }
			     req.setAttribute("Message", "删除成功");
			 }
			 else
			 {
				 req.setAttribute("Message", "提交无法删除");
			 }
		 }
	}

}
