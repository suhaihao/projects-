package com.jf.bchyj.index;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;

public class QxrwtjAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String lb = so.httpServletRequest.getParameter("lb"); // ���
		String qx = so.httpServletRequest.getParameter("qx"); // ����
		String sql = 
			"SELECT JFID,F_GET_MC('DEPT',BMBM) QX,RWMC,TO_CHAR(TBRQ,'YYYY-MM-DD') TBRQ,\n" +
			"TO_CHAR(TBRQ-KSTBTS,'YYYY-MM-DD') KSTBRQ,\n" + 
			"TO_CHAR(TBRQ+JZTBTS,'YYYY-MM-DD') JZTBRQ,\n" + 
			"TO_CHAR(TBRQ+JZCBTS,'YYYY-MM-DD') JZCBRQ,\n" + 
			"TO_CHAR(SJTBRQ,'YYYY-MM-DD') SJTBRQ,\n" + 
			"DECODE(BBZT,'2','detail','3','detail','no') ZTBM,\n" + 
			"DECODE(BBZT,'0','δ�','1','���δ�ϱ�','2','�����ϱ�','3','�ٱ�','4','©��') ZXZT\n" + 
			" FROM DBBZB_RW WHERE ND=TO_CHAR(SYSDATE,'YYYY')";
		if (qx != null && !"".equals(qx)) {
			sql = sql + " AND BMBM='" + qx + "'";
		}
		if ("ybs".equals(lb)) { // Ӧ��
		} else if ("ybzc".equals(lb)) { // Ӧ������
			sql += " AND BBZT='2'";
		} else if ("ybcb".equals(lb)) { // Ӧ���ٱ�
			sql += " AND BBZT='3'";
		} else if ("wbzc".equals(lb)) { // δ������
			sql += " AND BBZT IN ('0','1')";
		} else if ("wblb".equals(lb)) { // δ��©��
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
		if ("DETAIL".equals(forward)) { // ����ҳ
			sql = "SELECT ND,RWMC,F_GET_MC('DEPT',BMBM) QX,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ,'MM-DD') TBRQ,KSTSTS,KSTBTS,JZTBTS,JZCBTS,TO_CHAR(SJTBRQ,'YYYY-MM-DD') SJTBRQ,DECODE(BBZT,'0','δ�','1','���δ�ϱ�','2','�����ϱ�','3','�ٱ�','4','©��') ZXZT,DECODE(LB,'1','ϵͳ����','2','�ֶ�����') LB,TO_CHAR(LRRQ,'YYYY-MM-DD') LRRQ FROM DBBZB_RW WHERE JFID='" + jfid + "'";
			ContainDivPage cdp = new ContainDivPage();
			cdp.sqlselect = sql;
			cdp.sqlWhole = sql;
			so.getSession().setAttribute(
					so.actionMapping.findForward(switchForward(so.getActForward()))
							.getPath() + "_sql", cdp);
		}
	}
}
