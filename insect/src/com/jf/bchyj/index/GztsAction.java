package com.jf.bchyj.index;

import com.jf.bchyj.bean.User;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;

public class GztsAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String bmbm = ((User)so.getSession().getAttribute("user")).getBmbm();
		String sql = "SELECT F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ-KSTBTS,'YYYY-MM-DD') KSTBRQ FROM DBBZB_RW WHERE BMBM='" 
				+ bmbm + "' AND ND=TO_CHAR(SYSDATE,'YYYY') AND TO_CHAR(TBRQ+JZCBTS+1,'YYYY-MM-DD')>TO_CHAR(SYSDATE,'YYYY-MM-DD') "
				+ "AND TO_CHAR(TBRQ-KSTSTS,'YYYY-MM-DD')<=TO_CHAR(SYSDATE,'YYYY-MM-DD') ORDER BY KSTBRQ";
		ContainDivPage cdp = new ContainDivPage();
		cdp.sqlselect = sql;
		cdp.sqlWhole = sql;
		so.getSession().setAttribute(
				so.actionMapping.findForward(switchForward(so.getActForward()))
						.getPath() + "_sql", cdp);
	}
}
