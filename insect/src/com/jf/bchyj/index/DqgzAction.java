package com.jf.bchyj.index;

import com.jf.bchyj.bean.User;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;

public class DqgzAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String bmbm = ((User) so.getSession().getAttribute("user")).getBmbm();
		String jfdeptprop = ((User) so.getSession().getAttribute("user"))
				.getJfdeptprop();
		String par = so.httpServletRequest.getParameter("par");
		String son = so.httpServletRequest.getParameter("son");
		String qx = so.httpServletRequest.getParameter("qx");
		if (qx != null && !qx.equals("")) {
			qx=qx.substring(0, qx.length()-1);
			bmbm = qx;
			//jfdeptprop="1";
		}
		String where = "";
		String bbzt = "";
		if (bmbm.trim().length() == 4) {
			bbzt = " and BBZT<='1'";
			bmbm = " BMBM='" + bmbm + "' and SHBZ='0' ";
		} else{
			if(jfdeptprop.equals("0"))
			{
			    bmbm = " BBZT<='1' ";
			}
			else
			{
				bbzt = " AND (( BBZT<='1' and length(bmbm)=2) or (SHBZ='1' and length(bmbm)=4)) ";
				bmbm = " BMBM like '" + bmbm + "%' AND SHBZ!='2' ";
			}
		}
		if (par != null && !par.equals("0")) {
			where += " AND DBBZB_ID in (select jfid from dbbzb where jflb='"
					+ par + "')";
		}
		if (son != null && !son.equals("0")) {
			where += " AND DBBZB_ID=" + son + " ";
		}
		String sql = "";
		if (jfdeptprop.equals("0")) {
			sql = "SELECT 'repeat' STYLE,'重报 ' GZLB,DBBZB_ID,F_GET_MC('BBMC',DBBZB_ID) BBMC,'' GZRQ,jfid,dyid,'chb' lb,F_GET_MC('DEPT',BMBM) BMBM  FROM DBBZB_RW\n"
					+ "WHERE THBZ='1' AND ND=TO_CHAR(SYSDATE,'YYYY') AND"
					+ bmbm
					+ where
					+ " AND SHBZ<'2' \n"
					+ "UNION ALL SELECT * FROM (\n"
					+ "SELECT 'miss' STYLE,'漏报' GZLB,DBBZB_ID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZCBTS,'YYYY-MM-DD') GZRQ,jfid,dyid,'lb' lb,F_GET_MC('DEPT',BMBM) BMBM \n"
					+ "FROM DBBZB_RW WHERE LBJHBZ='1' AND SHBZ<'2' AND ND=TO_CHAR(SYSDATE,'YYYY') AND"
					+ bmbm
					+ where
					+ ")\n"
					+ "UNION ALL SELECT * FROM (\n"
					+ "SELECT 'urge' STYLE,'催报' GZLB,DBBZB_ID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZCBTS,'YYYY-MM-DD') GZRQ,jfid,dyid,'cb' lb,F_GET_MC('DEPT',BMBM) BMBM \n"
					+ "FROM DBBZB_RW WHERE ND=TO_CHAR(SYSDATE,'YYYY') \n"
					+ "AND TO_CHAR(TBRQ+JZCBTS+1,'YYYY-MM-DD')>TO_CHAR(SYSDATE,'YYYY-MM-DD') AND SHBZ<'2' \n"
					+ "AND TO_CHAR(TBRQ+JZTBTS,'YYYY-MM-DD')<TO_CHAR(SYSDATE,'YYYY-MM-DD') AND"
					+ bmbm
					+ where
					+ " ORDER BY GZRQ)\n"
					+ "UNION ALL SELECT * FROM (\n"
					+ "SELECT '' STYLE,'当前' GZLB,DBBZB_ID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZTBTS,'YYYY-MM-DD') GZRQ,jfid,dyid,'zc' lb,F_GET_MC('DEPT',BMBM) BMBM \n"
					+ "FROM DBBZB_RW WHERE ND=TO_CHAR(SYSDATE,'YYYY') \n"
					+ "AND TO_CHAR(TBRQ+JZTBTS+1,'YYYY-MM-DD')>TO_CHAR(SYSDATE,'YYYY-MM-DD') AND SHBZ<'2' \n"
					+ "AND TO_CHAR(TBRQ-KSTSTS,'YYYY-MM-DD')<=TO_CHAR(SYSDATE,'YYYY-MM-DD') AND"
					+ bmbm
					+ where + " ORDER BY GZRQ)";
		} else {
			sql = "SELECT 'repeat' STYLE,'重报 ' GZLB,DBBZB_ID,F_GET_MC('BBMC',DBBZB_ID) BBMC,'' GZRQ,jfid,dyid,'chb' lb,F_GET_MC('DEPT',BMBM) BMBM  FROM DBBZB_RW\n"
					+ "WHERE THBZ='1' AND ND=TO_CHAR(SYSDATE,'YYYY') AND "
					+ bmbm
					+ bbzt
					+ where
					+ "  \n"
					+ "UNION ALL SELECT * FROM (\n"
					+ "SELECT 'miss' STYLE,'漏报' GZLB,DBBZB_ID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZCBTS,'YYYY-MM-DD') GZRQ,jfid,dyid,'lb' lb,F_GET_MC('DEPT',BMBM) BMBM \n"
					+ "FROM DBBZB_RW WHERE LBJHBZ='1' AND ND=TO_CHAR(SYSDATE,'YYYY') AND "
					+ bmbm
					+ bbzt
					+ where
					+ ")\n"
					+ "UNION ALL SELECT * FROM (\n"
					+ "SELECT 'urge' STYLE,'催报' GZLB,DBBZB_ID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZCBTS,'YYYY-MM-DD') GZRQ,jfid,dyid,'cb' lb,F_GET_MC('DEPT',BMBM) BMBM \n"
					+ "FROM DBBZB_RW WHERE ND=TO_CHAR(SYSDATE,'YYYY') AND "
					+ bmbm
					+ " \n"
					+ "AND TO_CHAR(TBRQ+JZCBTS+1,'YYYY-MM-DD')>TO_CHAR(SYSDATE,'YYYY-MM-DD')\n"
					+ "AND TO_CHAR(TBRQ+JZTBTS,'YYYY-MM-DD')<TO_CHAR(SYSDATE,'YYYY-MM-DD')"
					+ bbzt
					+ where
					+ " ORDER BY GZRQ)\n"
					+ "UNION ALL SELECT * FROM (\n"
					+ "SELECT '' STYLE,'当前' GZLB,DBBZB_ID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZTBTS,'YYYY-MM-DD') GZRQ,jfid,dyid,'zc' lb,F_GET_MC('DEPT',BMBM) BMBM \n"
					+ "FROM DBBZB_RW WHERE ND=TO_CHAR(SYSDATE,'YYYY') AND "
					+ bmbm
					+ " \n"
					+ "AND TO_CHAR(TBRQ+JZTBTS+1,'YYYY-MM-DD')>TO_CHAR(SYSDATE,'YYYY-MM-DD')\n"
					+ "AND TO_CHAR(TBRQ-KSTSTS,'YYYY-MM-DD')<=TO_CHAR(SYSDATE,'YYYY-MM-DD') "
					+ bbzt + where + " ORDER BY GZRQ)";
		}

		ContainDivPage cdp = new ContainDivPage();
		cdp.sqlselect = sql;
		cdp.sqlWhole = sql;
		so.getSession().setAttribute(
				so.actionMapping.findForward(switchForward(so.getActForward()))
						.getPath() + "_sql", cdp);
	}
}
