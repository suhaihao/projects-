package com.jf.bchyj.action.system.bbgl;

import java.sql.ResultSet;
import java.sql.Statement;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;
import mt.database.extend.QueryConnection;

public class ScbleiAction extends InitAction {

	protected void other(ServletObject so) {
		String fwd = so.getActForward();
		String zbid = so.httpServletRequest.getParameter("zbid");
		String rwid = so.httpServletRequest.getParameter("rwid");
		String lb = so.httpServletRequest.getParameter("lb");
		String jfid = so.httpServletRequest.getParameter("jfid");
		so.httpServletRequest.setAttribute("zbid", zbid);
		so.httpServletRequest.setAttribute("rwid", rwid);
		so.httpServletRequest.setAttribute("lb", lb);
		so.httpServletRequest.setAttribute("jfid", jfid);
		String zdm = "";
		if (!zbid.substring(0, 1).equals("0")) {
			if (fwd.equals("Q" + zbid)) {
				// 任务
				String sqlrw = "select tbrq,to_char(tbrq,'yyyy-mm-dd') rwsj from DBBZB_RW t where jfid=" + rwid;
				QueryConnection qcrw = new QueryConnection();
				Statement stmtrw = null;
				ResultSet rsrw = null;
				String rw = "";
				String rwsj = "";
				try {
					int a = 1;
					stmtrw = qcrw.con.createStatement();
					rsrw = stmtrw.executeQuery(sqlrw);
					while (rsrw.next()) {
						rw = rsrw.getString("tbrq");
						rwsj = rsrw.getString("rwsj");
					}
					if (rw == null || rw.equals("null")) {
						rw = "";
						rwsj = "";
					}
					so.httpServletRequest.setAttribute("rw", rw);
					so.httpServletRequest.setAttribute("rwsj", rwsj);
				} catch (Exception e) {
					e.printStackTrace();
				}
				if (jfid != null && !jfid.equals("")) {
					// 经办人
					String sqljbr = "SELECT JBR FROM D" + zbid
							+ "_Head where jfid=" + jfid;
					QueryConnection qcjbr = new QueryConnection();
					Statement stmtjbr = null;
					ResultSet rsjbr = null;
					String jbr = "";
					try {
						int a = 1;
						stmtjbr = qcjbr.con.createStatement();
						rsjbr = stmtjbr.executeQuery(sqljbr);
						while (rsjbr.next()) {
							jbr = rsjbr.getString("JBR");
						}
						if (jbr == null || jbr.equals("null")) {
							jbr = "";
							so.httpServletRequest.setAttribute("jbr", jbr);
						} else {
							so.httpServletRequest.setAttribute("jbr", jbr);
						}

					} catch (Exception e) {
						e.printStackTrace();
					}
				} else {
					so.httpServletRequest.setAttribute("jbr", "");
				}
				if (jfid == null || jfid.equals("") || jfid.equals("null")) {
					String sql = "select JFCOLID,JFCOLSTYLE,JFCOLVEST  from DBBZB_JG t where jfdbbzb_id="
							+ zbid;
					QueryConnection qc = new QueryConnection();
					Statement stmt = null;
					ResultSet rs = null;
					try {
						int a = 1;
						stmt = qc.con.createStatement();
						rs = stmt.executeQuery(sql);
						while (rs.next()) {
							if (a == 1) {
								if (rs.getString("JFCOLVEST").equals("2")) {
									zdm += "'" + jfid + "' JFDYID,";
									zdm += "'' " + rs.getString("JFCOLID")
											+ ",";
									a = 2;
								}
							} else {
								if (rs.getString("JFCOLVEST").equals("2")) {
									zdm += "'' " + rs.getString("JFCOLID")
											+ ",";
								}
							}

						}
						if (zdm != null && !zdm.equals("")) {
							zdm = zdm.substring(0, zdm.length() - 1);
							sql = "SELECT " + zdm + "  FROM dual";
							so.httpServletRequest.setAttribute("cxzt", "");
							so.httpServletRequest.setAttribute("cxlrrq", "");
							so.httpServletRequest.setAttribute("cxlrry", "");
							so.httpServletRequest.setAttribute("jbr", "");
							ContainDivPage cdp = new ContainDivPage();
							cdp.sqlWhole = sql;
							cdp.sqlsort = "";
							cdp.sqlselect = sql;
							so.getSession().setAttribute(
									so.actionMapping.findForward(
											switchForward(so.actForward))
											.getPath()
											+ "_sql", cdp);
							so.setActForward("Q" + zbid);
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else {
					// 查询字段
					String sql = "select JFCOLID,JFCOLSTYLE,JFCOLVEST  from DBBZB_JG t where jfdbbzb_id="
							+ zbid;
					QueryConnection qc = new QueryConnection();
					Statement stmt = null;
					ResultSet rs = null;
					try {
						int a = 1;
						stmt = qc.con.createStatement();
						rs = stmt.executeQuery(sql);
						while (rs.next()) {
							if (a == 1) {
								if (rs.getString("JFCOLVEST").equals("2")) {
									if (rs.getString("JFCOLSTYLE").equals("1")) {
										zdm += "'" + jfid + "' JFDYID,";
										zdm += "to_char("
												+ rs.getString("JFCOLID")
												+ ",'yyyy-mm-dd')"
												+ rs.getString("JFCOLID") + ",";
										a = 2;
									} else {
										zdm += "'" + jfid + "' JFDYID,";
										zdm += rs.getString("JFCOLID") + ",";
										a = 2;
									}
								}
							} else {
								if (rs.getString("JFCOLSTYLE").equals("1")) {
									if (rs.getString("JFCOLVEST").equals("2")) {
										zdm += "to_char("
												+ rs.getString("JFCOLID")
												+ ",'yyyy-mm-dd') "
												+ rs.getString("JFCOLID") + ",";
									}
								} else {
									if (rs.getString("JFCOLVEST").equals("2")) {
										zdm += rs.getString("JFCOLID") + ",";
									}
								}
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					zdm = zdm.substring(0, zdm.length() - 1);
					// 查询
					sql = "SELECT " + zdm + " FROM D" + zbid
							+ "_BODY where JFDYID=" + jfid;
					try {
						QueryConnection qcxc = new QueryConnection();
						Statement stmtxc = qcxc.con.createStatement();
						ResultSet rsxc = stmtxc.executeQuery(sql);
						String xzcode = "";
						if (rsxc.next()) {
							xzcode = rsxc.getString("XZ");
						}
						ResultSet bm = stmtxc
								.executeQuery("select bmbm from DBBZB_RW t where jfid="
										+ rwid);
						String cxbm = "";
						if (bm.next()) {
							cxbm = bm.getString(1);
							so.httpServletRequest.setAttribute("cxbm",
									bm.getString(1));
						} else {
							so.httpServletRequest.setAttribute("cxbm", "");
						}
						ResultSet usid = stmtxc
								.executeQuery("select jfid from dsys01 where jfdsys05_code="
										+ cxbm);
						if (usid.next()) {
							so.httpServletRequest.setAttribute("cxuserid",
									usid.getString(1));
						} else {
							so.httpServletRequest.setAttribute("cxuserid", "");
						}
						ResultSet xzorcun = stmtxc
								.executeQuery("select xz,cun from dsys05 where jfdeptcode="
										+ cxbm);
						if (xzorcun.next()) {
							so.httpServletRequest.setAttribute("cxxz",
									usid.getString(1));
							so.httpServletRequest.setAttribute("cxcun",
									usid.getString(2));
						} else {
							so.httpServletRequest.setAttribute("cxxz", "");
							so.httpServletRequest.setAttribute("cxcun", "");
						}
						ResultSet cxbmmc = stmtxc
								.executeQuery("select f_get_mc('DEPT',bmbm)bmbm from DBBZB_RW t where jfid="
										+ rwid);
						if (cxbmmc.next()) {
							so.httpServletRequest.setAttribute("cxbmmc",
									cxbmmc.getString(1));
						} else {
							so.httpServletRequest.setAttribute("cxbmmc", "");
						}
						ResultSet cxzt = stmtxc
								.executeQuery("select zt,to_char(lrrq,'yyyy-mm-dd') lrrq,f_get_mc('RYBM',lrry) lrry,jbr from d"
										+ zbid + "_head where jfid=" + jfid);
						if (cxzt.next()) {
							if (cxzt.getString(1) != null
									&& !cxzt.getString(1).equals("")) {
								so.httpServletRequest.setAttribute("cxzt",
										cxzt.getString(1));
							} else {
								so.httpServletRequest.setAttribute("cxzt", "");
							}
							if (cxzt.getString(2) != null
									&& !cxzt.getString(2).equals("")) {
								so.httpServletRequest.setAttribute("cxlrrq",
										cxzt.getString(2));
							} else {
								so.httpServletRequest
										.setAttribute("cxlrrq", "");
							}
							if (cxzt.getString(3) != null
									&& !cxzt.getString(3).equals("")) {
								so.httpServletRequest.setAttribute("cxlrry",
										cxzt.getString(3));
							} else {
								so.httpServletRequest
										.setAttribute("cxlrry", "");
							}
							if (cxzt.getString(4) != null
									&& !cxzt.getString(4).equals("")) {
								so.httpServletRequest.setAttribute("jbr",
										cxzt.getString(4));
							} else {
								so.httpServletRequest.setAttribute("jbr", "");
							}
						} else {
							so.httpServletRequest.setAttribute("cxzt", "");
							so.httpServletRequest.setAttribute("cxlrrq", "");
							so.httpServletRequest.setAttribute("cxlrry", "");
							so.httpServletRequest.setAttribute("jbr", "");
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					ContainDivPage cdp = new ContainDivPage();
					cdp.sqlWhole = sql;
					cdp.sqlsort = "";
					cdp.sqlselect = sql;
					so.getSession().setAttribute(
							so.actionMapping.findForward(
									switchForward(so.actForward)).getPath()
									+ "_sql", cdp);
					so.setActForward("Q" + zbid);
				}
			}
		} else {
			String sqlrw = "select to_char(tbrq,'yyyy-mm-dd') tbrq,bbzt,lrry,lrrq,TO_CHAR(tbrq-kstbts,'yyyy-mm-dd HH24:MI:SS') kstbrq,TO_CHAR(tbrq+jztbts,'yyyy-mm-dd HH24:MI:SS') jztbrq from DBBZB_RW t where jfid=" + rwid;
			QueryConnection qcrw = new QueryConnection();
			Statement stmtrw = null;
			ResultSet rsrw = null;
			String bbzt="";
			String lrry="";
			String lrrq="";
			String kstbrq="";
			String jztbrq="";
			String rwsj="";
			try {
				stmtrw = qcrw.con.createStatement();
				rsrw = stmtrw.executeQuery(sqlrw);
				while (rsrw.next()) {
					bbzt = rsrw.getString("bbzt");
					lrry = rsrw.getString("lrry");
					lrrq = rsrw.getString("lrrq");
					kstbrq = rsrw.getString("kstbrq");
					jztbrq = rsrw.getString("jztbrq");
					rwsj = rsrw.getString("tbrq");
				}
				rsrw.close();
				stmtrw.close();
				qcrw.close();
				so.httpServletRequest.setAttribute("bbzt", bbzt);
				so.httpServletRequest.setAttribute("kstbrq", kstbrq);
				so.httpServletRequest.setAttribute("jztbrq", jztbrq);
				so.httpServletRequest.setAttribute("rwsj", rwsj);
				so.httpServletRequest.setAttribute("lb", lb);
				if(jfid!=null)
				{
					so.httpServletRequest.setAttribute("jfid", jfid);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
	
			//特殊表群
			so.setActForward("Q" + zbid);
		}
	}
}
