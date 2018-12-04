package com.jf.bchyj.common.tjsjxz;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;

public class TbsjxzAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String bmbm = so.httpServletRequest.getParameter("bmbm"); // 区县
		String nd = so.httpServletRequest.getParameter("nd"); // 年度
		String dbbzb_id = so.httpServletRequest.getParameter("dbbzb_id"); // 报表id
		String sbrq_b = so.httpServletRequest.getParameter("sbrq_b");
		String sbrq_e = so.httpServletRequest.getParameter("sbrq_e");
		String sql_rw = "SELECT DBBZB_TBRQ_JFID FROM DBBZB_RW WHERE 1=1"; // 已经存在的当年报表填报时间不可重复选择
		String sql = "SELECT JFID,TO_CHAR(TBRQ,'MM-DD') RQ,'" + nd + "-'||TO_CHAR(TBRQ,'MM-DD') RQ2,KSTSTS,KSTBTS,JZTBTS,JZCBTS,DYBM FROM DBBZB_TBRQ WHERE 1=1";
		if (sbrq_b != null && !"".equals(sbrq_b)) {
			sql = sql + " AND TBRQ>=TO_DATE('" + sbrq_b + "','YYYY-MM-DD')";
		}
		if (sbrq_e != null && !"".equals(sbrq_e)) {
			sql = sql + " AND TBRQ<=TO_DATE('" + sbrq_e + "','YYYY-MM-DD')";
		}
		if (!"".equals(dbbzb_id) && dbbzb_id != null) {
			sql += " AND JFDBBZB_ID='" + dbbzb_id + "'";
			sql_rw += " AND DBBZB_ID='" + dbbzb_id + "'";
		}
		if (!"".equals(bmbm) && bmbm != null) {
			sql_rw += " AND BMBM='" + bmbm + "'";
		}
		if (!"".equals(nd) && nd != null) {
			sql_rw += " AND ND='" + nd + "'";
		}
		sql += "AND JFID NOT IN (" + sql_rw + ")";
		sql += " ORDER BY TBRQ";
		ContainDivPage cdp = new ContainDivPage();
		cdp.sqlselect = sql;
		cdp.sqlWhole = sql;
		so.getSession().setAttribute(
				so.actionMapping.findForward(switchForward(so.getActForward()))
						.getPath() + "_sql", cdp);
	}
}
