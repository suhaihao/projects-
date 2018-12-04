package com.jf.bchyj.action.system.bbtj;

import java.sql.SQLException;
import java.sql.Statement;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ContainUpdateSql;
import mt.controller.base.ServletObject;
import mt.database.extend.ExecuteConnection;

import com.jf.bchyj.bean.User;

public class BbtjAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String bbbm = so.httpServletRequest.getParameter("bbbm"); // �������
		String bbmc = so.httpServletRequest.getParameter("bbmc"); // ��������
		String zt = so.httpServletRequest.getParameter("zt"); // ״̬
		String sql = "SELECT JFID,JFCODE,JFNAME,JFDBBZB_ID, DECODE(NVL(JFYESNO,'0'),'0','��','��'),F_GET_MC('RYBM',JFLISTER) RYMC,TO_CHAR(JFLISTDATE,'YYYY-MM-DD') LRRQ,DECODE(JFSTATE,'0','��ʼ','1','����','2','�鵵','') ZT,DECODE(JFSTATE, '0', '','disabled') DEL FROM DTJBB WHERE 1=1";
		if (bbbm != null && !"".equals(bbbm)) {
			sql = sql + " and jfcode like '%" + bbbm + "%'";
		}
		if (bbmc != null && !"".equals(bbmc)) {
			sql = sql + " and JFNAME like '%" + bbmc + "%'";
		}
		if (zt != null && !"".equals(zt)) {
			sql = sql + " and jfstate='" + zt + "'";
		}
		sql += " ORDER BY JFCODE,JFNAME";
		ContainDivPage cdp = new ContainDivPage();
		cdp.sqlselect = sql;
		cdp.sqlWhole = sql;
		so.getSession().setAttribute(
				so.actionMapping.findForward(switchForward(so.getActForward()))
						.getPath() + "_sql", cdp);
		
	}

	protected void insert(ServletObject so) {
		String jfcode = so.httpServletRequest.getParameter("jfcode");
		String jfname = so.httpServletRequest.getParameter("jfname");
		String jfdbbzb_id = so.httpServletRequest.getParameter("jfdbbzb_id");
		String jfyesno = so.httpServletRequest.getParameter("jfyesno");
		String jfattribute = so.httpServletRequest.getParameter("jfattribute");
		String jftjpj = so.httpServletRequest.getParameter("jftjpj");
		String jftjhj = so.httpServletRequest.getParameter("jftjhj");
		String zt = so.httpServletRequest.getParameter("zt");
		String lrry = ((User) so.getSession().getAttribute("user")).getUserjfid();
		String jfid = getSequence(so, "DTJBB"); // ��ȡ����jfid
		if (null == jftjpj) jftjpj = "";
		if (null == jftjhj) jftjhj = "";
		so.httpServletRequest.setAttribute("jfid", jfid);
		String sql = "INSERT INTO DTJBB(JFID,JFCODE,JFNAME,JFDBBZB_ID,JFLISTER,JFLISTDATE,JFYESNO,JFSTATE,JFATTRIBUTE,JFTJPJ,JFTJHZ) VALUES('" 
			+ jfid + "','" + jfcode + "','" + jfname + "','" + jfdbbzb_id + "','" + lrry 
			+ "',SYSDATE,'" + jfyesno + "','" + zt + "','" + jfattribute + "','" + jftjpj + "','" + jftjhj + "')";
		int c = so.dc.pjdo.execute(sql);
		if (c > 0) {
			so.setActForward("MODIFY"); // ��ת���޸�ҳ
		} else {
			so.setActForward("ADD"); // ��ת�����ҳ
		}
		other(so);
	}

	protected void update(ServletObject so) {
		String jfid = so.httpServletRequest.getParameter("jfid");
		String jfcode = so.httpServletRequest.getParameter("jfcode");
		String jfname = so.httpServletRequest.getParameter("jfname");
		String jfdbbzb_id = so.httpServletRequest.getParameter("d:jfdbbzb_id:str:s");
		String jfyesno = so.httpServletRequest.getParameter("d:jfyesno:str:s");
		String jfattribute = so.httpServletRequest.getParameter("d:jfattribute:str:s");
		String jftjpj = so.httpServletRequest.getParameter("jftjpj");
		String jftjhj = so.httpServletRequest.getParameter("jftjhj");
		String zt = so.httpServletRequest.getParameter("zt");
		if (null == jftjpj) jftjpj = "";
		if (null == jftjhj) jftjhj = "";
		String sql = "UPDATE DTJBB SET JFCODE='" + jfcode + "',JFNAME='" + jfname 
			+ "',JFDBBZB_ID='" + jfdbbzb_id + "',JFATTRIBUTE='" + jfattribute 
			+ "',JFYESNO='" + jfyesno + "',JFSTATE='" + zt + "',JFTJPJ='" 
			+ jftjpj + "',JFTJHZ='" + jftjhj + "' WHERE JFID='" + jfid + "'";
		if (so.dc.pjdo.execute(sql) > 0) {
			so.httpServletRequest.setAttribute("Message", "����ɹ���");
		} else {
			so.httpServletRequest.setAttribute("Message", "����ʧ�ܣ�");
		}
		so.httpServletRequest.setAttribute("jfid", jfid);
		so.setActForward("MODIFY");
		other(so);
	}

	protected void other(ServletObject so) {
		String forward = so.getActForward();
		String jfid = so.httpServletRequest.getParameter("jfid");
		if ("MODIFY".equals(forward)) {
			if (jfid == null || "".equals(jfid)) {
				jfid = (String) so.httpServletRequest.getAttribute("jfid");
			}
			String sql = "SELECT JFID,JFCODE,JFNAME,JFDBBZB_ID,NVL(JFYESNO,'0')JFYESNO,F_GET_MC('RYBM',JFLISTER) RYMC,JFLISTER,TO_CHAR(JFLISTDATE,'YYYY-MM-DD') LRRQ,JFSTATE,DECODE(JFSTATE,'0','��ʼ','1','����','2','�鵵','') ZT,jfattribute,DECODE(JFTJPJ,'1','checked','')JFTJPJ,DECODE(JFTJHZ,'1','checked','')JFTJHJ FROM DTJBB WHERE JFID='" + jfid + "'";
			ContainUpdateSql cus = new ContainUpdateSql();
			cus.masteSql = sql;
			so.getSession().setAttribute(
					so.actionMapping.findForward(
							switchForward(so.actForward)).getPath()
							+ "_updatesql", cus);
		} else if ("DEL".equals(forward)) {
			String sql = "";
			String[] jfids = so.httpServletRequest.getParameterValues("chkdel");
			ExecuteConnection ec = new ExecuteConnection();
			Statement stmt = null;
			try {
				ec.con.setAutoCommit(false);
				stmt = ec.con.createStatement();
				boolean err = false; // �Ƿ���ʧ�ܡ����У�ȫ���ع�
				for (int i = 0; i < jfids.length; i++) {
					sql = "DELETE FROM DTJBB WHERE JFSTATE='0' AND JFID='" + jfids[i] + "'";
					if (stmt.executeUpdate(sql) <= 0) {
						err = true;
					}
				}
				if (!err) {
					ec.commit();
					so.httpServletRequest.setAttribute("Message", "ɾ���ɹ���");
				} else {
					ec.rollback();
					so.httpServletRequest.setAttribute("Message", "ɾ��ʧ�ܣ�");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					ec.con.setAutoCommit(true);
					if(stmt != null) stmt.close();
					ec.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			so.setActForward("QUERY");
			actionQuery(so);
		}
	}

}
