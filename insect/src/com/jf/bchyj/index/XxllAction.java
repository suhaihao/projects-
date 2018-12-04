package com.jf.bchyj.index;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;

public class XxllAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String sql = "SELECT JFID,BT,TO_CHAR(FBRQ,'YYYY-MM-DD hh24:mi:ss') FBRQ,DECODE(SIGN(SYSDATE-FBRQ-3),1,'none','inline') ISNEW FROM DTZGG WHERE ZT='1' ORDER BY FBRQ DESC";
		ContainDivPage cdp = new ContainDivPage();
		cdp.sqlselect = sql;
		cdp.sqlWhole = sql;
		so.getSession().setAttribute(
				so.actionMapping.findForward(switchForward(so.getActForward()))
						.getPath() + "_sql", cdp);
	}
}
