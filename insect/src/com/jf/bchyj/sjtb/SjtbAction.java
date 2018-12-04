package com.jf.bchyj.sjtb;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;

import com.jf.bchyj.bean.User;

public class SjtbAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String where = "";
		String bbmc = so.httpServletRequest.getParameter("bbmc"); // ��������
		String zt = so.httpServletRequest.getParameter("zt"); // ����״̬1Ϊ�ϱ�2���ϱ�3ȫ��
		String qx = so.httpServletRequest.getParameter("qx"); // ����״̬1Ϊ�ϱ�2���ϱ�3ȫ��
		String bmbm = ((User)so.getSession().getAttribute("user")).getBmbm(); // ���ر���
		String jfdeptprop = ((User)so.getSession().getAttribute("user")).getJfdeptprop(); // ���ر���
		if(qx!=null&&!qx.equals(""))
		{
			qx=qx.substring(0, qx.length()-1);
			bmbm=qx;
		}
		if(zt==null)
		{
			if(!jfdeptprop.equals("0"))
			{
			zt="0";
			}
			else
			{
			zt="2";
			}
		}
		if(!zt.equals("2")&&!zt.equals("3"))
		{
			if(jfdeptprop.equals("0"))
			{
				where += " AND BBZT="+zt+" and SHBZ='2' ";
			}
			else
			{
				    where += "AND BMBM LIKE '" + bmbm + "%' AND BBZT="+zt;
			}
			if (!"".equals(bbmc) && bbmc != null) {
				where += " AND DBBZB_ID=" + bbmc +" AND BBZT="+zt;
		    }
		}
		else if(zt.equals("2"))
		{
			if(jfdeptprop.equals("0"))
			{
				where += " AND BBZT in ('2','3','4') and SHBZ='2' ";
			}
			else
			{
				if(bbmc!=null&&!bbmc.equals(""))
				{
				where += "AND LIKE '" + bbmc + "%' AND BBZT in ('2','3','4') and SHBZ='2'";
				}
				else
				{
					where += " AND BBZT in ('2','3','4') and SHBZ='2'";
				}
			}
			if (!"".equals(bbmc) && bbmc != null) {
				where = " AND DBBZB_ID=" + bbmc + " AND BBZT in ('2','3','4') and SHBZ='2'";
		    }
		}
		else
		{
			if(jfdeptprop.equals("0"))
			{
				where += " AND BBZT='2' and SHBZ=2 ";
			}
			else
			{
				where += "AND BMBM like '%" + bmbm + "%' and ( BBZT='2' and length(bmbm)=4) and SHBZ=1";
			}
			if (!"".equals(bbmc) && bbmc != null) {
				where = " AND DBBZB_ID=" + bbmc + " and ( BBZT='2' and length(bmbm)=4) and SHBZ=1";
		    }
		}
		if(!jfdeptprop.equals("0"))
		{
			where+=" AND BMBM like '" + bmbm + "%'";
		}
		String sql = 
			"select * from (SELECT 'repeat' STYLE,'�ر� ' GZLB,JFID,DBBZB_ID,DYID,F_GET_MC('BBMC',DBBZB_ID) BBMC,'' GZRQ,RWMC,'���δ�ϱ�' ZXZT,BBZT,SHBZ,f_get_mc('DEPT',BMBM) bmbm FROM DBBZB_RW\n" +
			"WHERE THBZ='1' AND ND=TO_CHAR(SYSDATE,'YYYY')\n" + where +
			"UNION ALL SELECT * FROM (\n" + 
			"SELECT 'miss' STYLE,'©��' GZLB,JFID,DBBZB_ID,DYID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZCBTS,'YYYY-MM-DD') GZRQ,RWMC,'δ�' ZXZT,BBZT,SHBZ,f_get_mc('DEPT',BMBM) bmbm \n" + 
			"FROM DBBZB_RW WHERE LBJHBZ='1' AND ND=TO_CHAR(SYSDATE,'YYYY')\n" + where +
			") UNION ALL SELECT * FROM (\n" + 
			"SELECT 'urge' STYLE,'�߱�' GZLB,JFID,DBBZB_ID,DYID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZCBTS,'YYYY-MM-DD') GZRQ,RWMC,DECODE(BBZT,'0','δ�','1','���δ�ϱ�','2','�����ϱ�','3','�ٱ�','4','©��') ZXZT,BBZT,SHBZ,f_get_mc('DEPT',BMBM) bmbm \n" + 
			"FROM DBBZB_RW WHERE ND=TO_CHAR(SYSDATE,'YYYY')\n" + 
			"AND TO_CHAR(TBRQ+JZCBTS+1,'YYYY-MM-DD')>TO_CHAR(SYSDATE,'YYYY-MM-DD')\n" + 
			"AND TO_CHAR(TBRQ+JZTBTS,'YYYY-MM-DD')<TO_CHAR(SYSDATE,'YYYY-MM-DD')" + where + " ORDER BY GZRQ)\n" + 
			"UNION ALL SELECT * FROM (\n" + 
			"SELECT '' STYLE,'��ǰ' GZLB,JFID,DBBZB_ID,DYID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZTBTS,'YYYY-MM-DD') GZRQ,RWMC,DECODE(BBZT,'0','δ�','1','���δ�ϱ�','2','�����ϱ�','3','�ٱ�','4','©��') ZXZT,BBZT,SHBZ,f_get_mc('DEPT',BMBM) bmbm \n" + 
			"FROM DBBZB_RW WHERE ND=TO_CHAR(SYSDATE,'YYYY') \n" + 
			"AND TO_CHAR(TBRQ+JZTBTS+1,'YYYY-MM-DD')>TO_CHAR(SYSDATE,'YYYY-MM-DD')\n" + 
			"AND TO_CHAR(TBRQ-KSTBTS,'YYYY-MM-DD')<=TO_CHAR(SYSDATE,'YYYY-MM-DD')" + where + " ORDER BY GZRQ)) order by gzrq desc";
		ContainDivPage cdp = new ContainDivPage();
		cdp.sqlselect = sql;
		cdp.sqlWhole = sql;
		so.getSession().setAttribute(
				so.actionMapping.findForward(switchForward(so.getActForward()))
						.getPath() + "_sql", cdp);
	}
}
