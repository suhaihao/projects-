package com.jf.bchyj.index;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;

public class QxrwtjAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String lb = so.httpServletRequest.getParameter("lb"); // 类别
		String qx = so.httpServletRequest.getParameter("qx"); // 区县
		String sql = 
			"SELECT JFID,F_GET_MC('DEPT',BMBM) QX,RWMC,TO_CHAR(TBRQ,'YYYY-MM-DD') TBRQ,\n" +
			"TO_CHAR(TBRQ-KSTBTS,'YYYY-MM-DD') KSTBRQ,\n" + 
			"TO_CHAR(TBRQ+JZTBTS,'YYYY-MM-DD') JZTBRQ,\n" + 
			"TO_CHAR(TBRQ+JZCBTS,'YYYY-MM-DD') JZCBRQ,\n" + 
			"TO_CHAR(SJTBRQ,'YYYY-MM-DD') SJTBRQ,\n" + 
			"DECODE(BBZT,'2','detail','3','detail','no') ZTBM,\n" + 
			"DECODE(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') ZXZT\n" + 
			" FROM DBBZB_RW WHERE ND=TO_CHAR(SYSDATE,'YYYY')";
		if (qx != null && !"".equals(qx)) {
			sql = sql + " AND BMBM='" + qx + "'";
		}
		if ("ybs".equals(lb)) { // 应报
		} else if ("ybzc".equals(lb)) { // 应报正常
			sql += " AND BBZT='2'";
		} else if ("ybcb".equals(lb)) { // 应报迟报
			sql += " AND BBZT='3'";
		} else if ("wbzc".equals(lb)) { // 未报正常
			sql += " AND BBZT IN ('0','1')";
		} else if ("wblb".equals(lb)) { // 未报漏报
			sql += " AND BBZT='4'";
		} else {
			sql += " AND BBZT='-1'";
		}
		sql += " ORDER BY JZTBRQ";
		ContainDivPage cdp = new ContainDivPage();
		cdp.sqlselect = sql;
		cdp.sqlWhole = sql;
		so.getSession().setAttribute(
				so.actionMapping.findForward(switchForward(so.getActForward()))
						.getPath() + "_sql", cdp);
	}
	
	protected void other(ServletObject so) {
		String forward = so.getActForward();
		String sql = "";
		String jfid = so.httpServletRequest.getParameter("id");
		if ("DETAIL".equals(forward)) { // 详情页
			sql = "SELECT ND,RWMC,F_GET_MC('DEPT',BMBM) QX,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ,'MM-DD') TBRQ,KSTSTS,KSTBTS,JZTBTS,JZCBTS,TO_CHAR(SJTBRQ,'YYYY-MM-DD') SJTBRQ,DECODE(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') ZXZT,DECODE(LB,'1','系统生成','2','手动生成') LB,TO_CHAR(LRRQ,'YYYY-MM-DD') LRRQ FROM DBBZB_RW WHERE JFID='" + jfid + "'";
			ContainDivPage cdp = new ContainDivPage();
			cdp.sqlselect = sql;
			cdp.sqlWhole = sql;
			so.getSession().setAttribute(
					so.actionMapping.findForward(switchForward(so.getActForward()))
							.getPath() + "_sql", cdp);
		}
	}
}
