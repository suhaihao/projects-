package com.jf.bchyj.action.system.tbgl;


import java.sql.SQLException;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;


public class TbglAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		// 查询条件
		String bbno = so.httpServletRequest.getParameter("bbno");
		String bmbm = so.httpServletRequest.getParameter("bmbm");
		String dbbzb_id = so.httpServletRequest.getParameter("dbbzb_id");
		String sbrq_b = so.httpServletRequest.getParameter("sbrq_b");
		String sbrq_e = so.httpServletRequest.getParameter("sbrq_e");
		String sql = 
			"SELECT JFID,RWMC,TO_CHAR(TBRQ,'YYYY-MM-DD') TBRQ,F_GET_BBNO(DYBM,DYID) bbno,\n" +
			"TO_CHAR(TBRQ-KSTSTS,'YYYY-MM-DD') KSTSRQ,\n" + 
			"TO_CHAR(TBRQ-KSTBTS,'YYYY-MM-DD') KSTBRQ,\n" + 
			"TO_CHAR(TBRQ+JZTBTS,'YYYY-MM-DD') JZTBRQ,\n" + 
			"TO_CHAR(TBRQ+JZCBTS,'YYYY-MM-DD') JZCBRQ,\n" + 
			"TO_CHAR(SJTBRQ,'YYYY-MM-DD') SJTBRQ,DECODE(ZT,'0','初始','1','发布') RWZT\n" + 
			",DECODE(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') ZXZT\n" + 
			" FROM DBBZB_RW WHERE (bbzt='2' or bbzt='3') and thbz<>'1' ";
		if (bbno != null && !"".equals(bbno)) {
			sql = sql + " AND F_GET_BBNO(DYBM,DYID) = '" + bbno + "'";
		}
		if (bmbm != null && !"".equals(bmbm)) {
			sql = sql + " AND BMBM='" + bmbm + "'";
		}
		if (dbbzb_id != null && !"".equals(dbbzb_id)) {
			sql = sql + " AND DBBZB_ID='" + dbbzb_id + "'";
		}
		if (sbrq_b != null && !"".equals(sbrq_b)) {
			sql = sql + " AND TBRQ>=TO_DATE('" + sbrq_b + "','YYYY-MM-DD')";
		}else{
			sql = sql + " AND to_char(TBRQ,'yyyy-mm')>=TO_char(sysdate,'YYYY-MM')";
		}
		if (sbrq_e != null && !"".equals(sbrq_e)) {
			sql = sql + " AND TBRQ<=TO_DATE('" + sbrq_e + "','YYYY-MM-DD')";
		}
		sql += " ORDER BY JZTBRQ";
		ContainDivPage cdp = new ContainDivPage();
		cdp.sqlselect = sql;
		cdp.sqlWhole = sql;
		so.getSession().setAttribute(
				so.actionMapping.findForward(switchForward(so.getActForward()))
						.getPath() + "_sql", cdp);
		
	}


	protected void update(ServletObject so) {
		String jfid = so.httpServletRequest.getParameter("id");
		so.httpServletRequest.setAttribute("jfid", jfid);
		String sql = "UPDATE DBBZB_RW SET thbz='1' WHERE JFID='"+ jfid + "'";
		String table = "",dyid="";
		String sql_temp = "select dybm,dyid from dbbzb_rw WHERE JFID='"+ jfid + "'";
	    try {
	        so.dc.pjdo.executeQuery(sql_temp);
	        if (so.dc.pjdo.rs.next())
	        	table = so.dc.pjdo.rs.getString(1);
	        dyid = so.dc.pjdo.rs.getString(2);
	      }
	      catch (SQLException e) {
	        e.printStackTrace();
	      }
	      String sql_bb="update "+table+" set zt='0' where jfid="+dyid;
			int c = so.dc.pjdo.execute(sql);
			int d = so.dc.pjdo.execute(sql_bb);
		if (c > 0&&d>0) {
				so.httpServletRequest.setAttribute("Message", "成功！");
		} else {
				so.httpServletRequest.setAttribute("Message", "失败！");
		}
		so.setActForward("UPDATE");
		other(so);
	}
}
