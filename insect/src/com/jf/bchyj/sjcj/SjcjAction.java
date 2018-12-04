package com.jf.bchyj.sjcj;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;

public class SjcjAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String jflb = so.httpServletRequest.getParameter("jflb");
		String bbbm = so.httpServletRequest.getParameter("bbbm");
		String bbmc = so.httpServletRequest.getParameter("bbmc");
		String bbzl = so.httpServletRequest.getParameter("bbzl");
		String sql = "select jfid,jfcode,jftabname,f_get_mc('RYBM',jflister) zbr,to_char(jflistdate,'yyyy-mm-dd') zbrq,decode(jftabsort,'0','系统表','1','普查表','&nbsp;') bbzl from dbbzb where jfstate='1' ";
		/*if (jflb != null) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < jflb.length; i++) {
				sb.append(jflb[i] + ",");
			}
			sb.deleteCharAt(sb.length()-1);
			sql = sql + " and jflb like '%" + sb.toString() + "%'";
		}*/
		if (jflb != null && !"".equals(jflb)) {
			sql = sql + " and jflb like '%" + jflb + "%'";
		}
		if (bbbm != null && !"".equals(bbbm)) {
			sql = sql + " and jfcode like '%" + bbbm + "%'";
		}
		if (bbmc != null && !"".equals(bbmc)) {
			sql = sql + " and jftabname like '%" + bbmc + "%'";
		}
		if (bbzl != null && !"".equals(bbzl)) {
			sql = sql + " and jftabsort='" + bbzl + "'";
		}
		sql += " order by jfcode";
		ContainDivPage cdp = new ContainDivPage();
		cdp.sqlselect = sql;
		cdp.sqlWhole = sql;
		so.getSession().setAttribute(
				so.actionMapping.findForward(switchForward(so.getActForward()))
						.getPath() + "_sql", cdp);
	}
}
