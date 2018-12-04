package com.jf.bchyj.index;


import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;

public class YjtsAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String sql = "SELECT YJNR,YJJB,to_char(LRRQ,'yyyy-mm-dd') LRRQ,JFID_BODY,TNAME FROM DBBZB_YJ order by LRRQ desc";
		ContainDivPage cdp = new ContainDivPage();
		cdp.sqlselect = sql;
		cdp.sqlWhole = sql;
		so.getSession().setAttribute(
				so.actionMapping.findForward(switchForward(so.getActForward()))
						.getPath() + "_sql", cdp);
	}
}
