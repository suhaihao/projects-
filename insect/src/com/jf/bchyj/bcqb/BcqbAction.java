package com.jf.bchyj.bcqb;

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

public class BcqbAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String lb = so.httpServletRequest.getParameter("lb");
		String bt = so.httpServletRequest.getParameter("bt");
		String zt = so.httpServletRequest.getParameter("zt");
		String lrrq_b = so.httpServletRequest.getParameter("lrrq_b");
		String lrrq_e = so.httpServletRequest.getParameter("lrrq_e");
		String sql = "SELECT JFID,decode(lb,'01','区县','02','全市','03','全国','04','其他省市') lb,bt,f_get_mc('INSECT_ALL',bch) bch,to_char(fbrq,'yyyy-mm-dd hh24:mi:ss') fbrq,decode(zt,'0','初始','1','提交') zt,zt ztbm FROM dqbfb WHERE zt='1' ";
		if(lb == null){lb="";}
		if(bt == null){bt="";}
		if(zt == null){zt="";}
		if(lrrq_b == null){lrrq_b="";}
		if(lrrq_e == null){lrrq_e="";}
		if (lb.length()>0) { //
			sql +=  " and lb = '"+lb+"'";
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
		}
	}

}
