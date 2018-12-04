package com.jf.bchyj.action.system.task;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;
import mt.database.extend.QueryConnection;

import com.jf.bchyj.bean.User;

public class TaskAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		// 查询条件
		String lb = so.httpServletRequest.getParameter("lb");
		String rwmc = so.httpServletRequest.getParameter("rwmc");
		String bmbm = so.httpServletRequest.getParameter("bmbm");
		String dbbzb_id = so.httpServletRequest.getParameter("dbbzb_id");
		String rwzt = so.httpServletRequest.getParameter("rwzt");
		String zxzt = so.httpServletRequest.getParameter("zxzt");
		String sbrq_b = so.httpServletRequest.getParameter("sbrq_b");
		String sbrq_e = so.httpServletRequest.getParameter("sbrq_e");
		String sql = 
			"SELECT JFID,RWMC,TO_CHAR(TBRQ,'YYYY-MM-DD') TBRQ,\n" +
			"TO_CHAR(TBRQ-KSTSTS,'YYYY-MM-DD') KSTSRQ,\n" + 
			"TO_CHAR(TBRQ-KSTBTS,'YYYY-MM-DD') KSTBRQ,\n" + 
			"TO_CHAR(TBRQ+JZTBTS,'YYYY-MM-DD') JZTBRQ,\n" + 
			"TO_CHAR(TBRQ+JZCBTS,'YYYY-MM-DD') JZCBRQ,\n" + 
			"TO_CHAR(SJTBRQ,'YYYY-MM-DD') SJTBRQ,DECODE(ZT,'0','初始','1','发布') RWZT\n" + 
			",DECODE(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') ZXZT\n" + 
			" FROM DBBZB_RW WHERE 1=1";
		if (lb != null && !"".equals(lb)) {
			if (!"all".equals(lb)) {
				sql = sql + " AND LB='" + lb + "'";
			}
		}
		if (rwmc != null && !"".equals(rwmc)) {
			sql = sql + " AND RWMC LIKE '%" + rwmc + "%'";
		}
		if (bmbm != null && !"".equals(bmbm)) {
			sql = sql + " AND BMBM='" + bmbm + "'";
		}
		if (dbbzb_id != null && !"".equals(dbbzb_id)) {
			sql = sql + " AND DBBZB_ID='" + dbbzb_id + "'";
		}
		if (rwzt != null && !"".equals(rwzt)) {
			if (!"all".equals(rwzt)) {
				sql = sql + " AND ZT='" + rwzt + "'";
			}
		}
		if (zxzt != null && !"".equals(zxzt)) {
			if (!"all".equals(zxzt)) {
				sql = sql + " AND BBZT='" + zxzt + "'";
			}
		}
		if (sbrq_b != null && !"".equals(sbrq_b)) {
			sql = sql + " AND TBRQ>=TO_DATE('" + sbrq_b + "','YYYY-MM-DD')";
		}
		if (sbrq_e != null && !"".equals(sbrq_e)) {
			sql = sql + " AND TBRQ<=TO_DATE('" + sbrq_e + "','YYYY-MM-DD')";
		}
		sql += " ORDER BY JZTBRQ";
		ContainDivPage cdp = new ContainDivPage();
		cdp.sqlselect = sql;
		cdp.sqlWhole = sql;
		so.getSession().setAttribute(
				so.actionMapping.findForward(switchForward(so.getActForward()))
						.getPath() + "_sql", cdp);
		
	}

	protected void insert(ServletObject so) {
		String bmbm = so.httpServletRequest.getParameter("bmbm");
		String nd = so.httpServletRequest.getParameter("nd");
		String dbbzb_id = so.httpServletRequest.getParameter("dbbzb_id");
		String tbrq_id = so.httpServletRequest.getParameter("tbrq_id");
		String sbrq = so.httpServletRequest.getParameter("sbrq");
		String rwmc = so.httpServletRequest.getParameter("rwmc");
		String kststs = so.httpServletRequest.getParameter("kststs");
		String kstbts = so.httpServletRequest.getParameter("kstbts");
		String jztbts = so.httpServletRequest.getParameter("jztbts");
		String jzcbts = so.httpServletRequest.getParameter("jzcbts");
		String rwzt = so.httpServletRequest.getParameter("rwzt");
		String lrry = ((User) so.getSession().getAttribute("user")).getUserid();
		String jfid = getSequence(so, "DBBZB_RW"); // 获取序列jfid
		so.httpServletRequest.setAttribute("jfid", jfid);
		sbrq = nd + "-" + sbrq;
		
		String sql = "INSERT INTO DBBZB_RW (JFID,DBBZB_ID,BMBM,TBRQ,RWMC,KSTSTS,KSTBTS,JZTBTS,JZCBTS,DYBM,LB,LRRQ,LRRY,ZT,DBBZB_TBRQ_JFID,ND) VALUES ('" 
			+ jfid + "','" + dbbzb_id + "','" + bmbm + "',TO_DATE('" + sbrq + "','YYYY-MM-DD'),'" + rwmc 
			+ "','" + kststs + "','" + kstbts + "','" + jztbts + "','" + jzcbts 
			+ "','D" + dbbzb_id + "_HEAD','2',SYSDATE,'" + lrry + "','" + rwzt 
			+ "','" + tbrq_id + "','" + nd + "')";
		int c = so.dc.pjdo.execute(sql);
		if (c > 0) {
			if ("0".equals(rwzt)) {
				so.httpServletRequest.setAttribute("Message", "保存成功！");
			} else {
				so.httpServletRequest.setAttribute("Message", "发布成功！");
			}
			so.setActForward("MODIFY");
		} else {
			if ("0".equals(rwzt)) {
				so.httpServletRequest.setAttribute("Message", "保存失败！");
			} else {
				so.httpServletRequest.setAttribute("Message", "发布失败！");
			}
			so.setActForward("ADD");
		}
		other(so);
	}

	protected void update(ServletObject so) {
		String bmbm = so.httpServletRequest.getParameter("bmbm");
		String nd = so.httpServletRequest.getParameter("nd");
		String dbbzb_id = so.httpServletRequest.getParameter("dbbzb_id");
		String tbrq_id = so.httpServletRequest.getParameter("tbrq_id");
		String sbrq = so.httpServletRequest.getParameter("sbrq");
		String rwmc = so.httpServletRequest.getParameter("rwmc");
		String kststs = so.httpServletRequest.getParameter("kststs");
		String kstbts = so.httpServletRequest.getParameter("kstbts");
		String jztbts = so.httpServletRequest.getParameter("jztbts");
		String jzcbts = so.httpServletRequest.getParameter("jzcbts");
		String rwzt = so.httpServletRequest.getParameter("rwzt");
		String jfid = so.httpServletRequest.getParameter("jfid");
		so.httpServletRequest.setAttribute("jfid", jfid);
		sbrq = nd + "-" + sbrq;
		String sql = "UPDATE DBBZB_RW SET BMBM='" + bmbm + "',TBRQ=TO_DATE('" + sbrq + "','YYYY-MM-DD'),RWMC='" + rwmc 
			+ "',KSTSTS='" + kststs + "',KSTBTS='" + kstbts + "',JZTBTS='" + jztbts + "',JZCBTS='" + jzcbts + "',DYBM='D" 
			+ dbbzb_id + "_HEAD',ZT='" + rwzt + "',DBBZB_TBRQ_JFID='" + tbrq_id + "',ND='" + nd + "' WHERE JFID='"+ jfid + "'";
		int c = so.dc.pjdo.execute(sql);
		if (c > 0) {
			if ("0".equals(rwzt)) {
				so.httpServletRequest.setAttribute("Message", "保存成功！");
			} else {
				so.httpServletRequest.setAttribute("Message", "发布成功！");
			}
		} else {
			if ("0".equals(rwzt)) {
				so.httpServletRequest.setAttribute("Message", "保存失败！");
			} else {
				so.httpServletRequest.setAttribute("Message", "发布失败！");
			}
		}
		so.setActForward("MODIFY");
		other(so);
	}

	protected void other(ServletObject so) {
		String forward = so.getActForward();
		String sql = "";
		String jfid = so.httpServletRequest.getParameter("jfid");
		if ("MODIFY".equals(forward)) { // 详情页
			if (null == jfid) {
				jfid = (String) so.httpServletRequest.getAttribute("jfid");
			}
			sql = "SELECT JFID,BMBM,ND,RWMC,DBBZB_ID,(SELECT JFTABNAME FROM DBBZB WHERE JFID=DBBZB_ID) BBMC,TO_CHAR(TBRQ,'MM-DD') TBRQ,KSTSTS,KSTBTS,JZTBTS,JZCBTS,TO_CHAR(TBRQ-KSTBTS,'YYYY-MM-DD') KSTBRQ,TO_CHAR(SJTBRQ,'YYYY-MM-DD') SJTBRQ,DECODE(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') ZXZT,ZT,DECODE(LB,'1','系统生成','2','手动生成') LB,TO_CHAR(LRRQ,'YYYY-MM-DD') LRRQ,DBBZB_TBRQ_JFID FROM DBBZB_RW WHERE JFID='" + jfid + "'";
			ContainDivPage cdp = new ContainDivPage();
			cdp.sqlselect = sql;
			cdp.sqlWhole = sql;
			so.getSession().setAttribute(
					so.actionMapping.findForward(switchForward(so.getActForward()))
							.getPath() + "_sql", cdp);
		} else if ("DEL".equals(forward)) { // 删除
			sql = "DELETE FROM DBBZB_RW WHERE ZT='0' AND JFID='" + jfid + "'";
			int c = so.dc.pjdo.execute(sql);
			if (c > 0) {
				so.httpServletRequest.setAttribute("Message", "删除成功！");
			} else {
				so.httpServletRequest.setAttribute("Message", "删除失败！");
			}
			so.setActForward("SEARCH");
			other(so);
		} else if ("CANCEL".equals(forward)) { // 取消发布
			sql = "UPDATE DBBZB_RW SET ZT='0' WHERE JFID='" + jfid + "'";
			int c = so.dc.pjdo.execute(sql);
			if (c > 0) {
				so.httpServletRequest.setAttribute("Message", "取消发布成功！");
			} else {
				so.httpServletRequest.setAttribute("Message", "取消发布失败！");
			}
			so.setActForward("MODIFY");
			other(so);
		} else if ("ACTIVE".equals(forward)) { // 漏报激活
			sql = "UPDATE DBBZB_RW SET LBJHBZ='1' WHERE JFID='" + jfid + "'";
			int c = so.dc.pjdo.execute(sql);
			if (c > 0) {
				so.httpServletRequest.setAttribute("Message", "漏报激活成功！");
			} else {
				so.httpServletRequest.setAttribute("Message", "漏报激活失败！");
			}
			so.setActForward("MODIFY");
			other(so);
		} else if ("GENTASK".equals(forward)) { // 任务生成
			
			// 根据选择年度的上一年自动生成任务
			String nd = so.httpServletRequest.getParameter("nd");
			String lrry = ((User) so.getSession().getAttribute("user")).getUserid();
			if (nd == null)
			{
				return ;
			};
			int newNd = Integer.valueOf(nd) - 1;
			try {
				so.dc.pjdo.executeQuery("SELECT JFID FROM DBBZB_RW WHERE ND='" + nd + "'");
				if (so.dc.pjdo.rs.next()) {
					//已经有返回
					so.httpServletRequest.setAttribute("Message", "所选年度的任务已生成！");
				} else {
					//查看上一年度是否有
					so.dc.pjdo.executeQuery("SELECT JFID FROM DBBZB_RW WHERE ND='" + newNd + "'");
					if(so.dc.pjdo.rs.next())
					{
						sql = "INSERT INTO DBBZB_RW (JFID,DBBZB_ID,BMBM,TBRQ,RWMC,KSTSTS,KSTBTS,JZTBTS,JZCBTS,DYBM,LB,LRRQ,LRRY,ZT,DBBZB_TBRQ_JFID,ND)\n" +
						"SELECT SEQU_DBBZB_RW.NEXTVAL,DBBZB_ID,BMBM,TO_DATE('" + nd + "-' || TO_CHAR(TBRQ,'MM-DD'),'YYYY-MM-DD'),\n" + 
						"REPLACE(RWMC,'" + newNd + "','" + nd + "'),KSTSTS,KSTBTS,JZTBTS,JZCBTS,DYBM,'1',SYSDATE,'" 
						+ lrry + "',ZT,DBBZB_TBRQ_JFID,'" + nd + "' FROM DBBZB_RW WHERE ND='" + newNd + "'";
					int c = so.dc.pjdo.execute(sql);
					if (c > 0) {
						so.httpServletRequest.setAttribute("Message", "任务生成成功！");
					} else {
						so.httpServletRequest.setAttribute("Message", "任务生成失败！");
					}
					
					}else{
						//上一年度也没有需要从新生成
					    sql="SELECT jfdeptcode,jfdeptname FROM dsys05 where jfid in (201,241,281,282,301,302,303,304,305)";
					    so.dc.pjdo.executeQuery(sql);
					    String jfdeptcode="";
					    String jfdeptname="";
					    String sqlin="";
					    String jfidrw="";
					    //循环部门
						while (so.dc.pjdo.rs.next()){
						jfdeptcode=so.dc.pjdo.rs.getString("jfdeptcode");
						jfdeptname=so.dc.pjdo.rs.getString("jfdeptname");
							    	sqlin="INSERT INTO DBBZB_RW (JFID,DBBZB_ID,BMBM,TBRQ,RWMC,KSTSTS,KSTBTS,JZTBTS,JZCBTS,DYBM,LB,LRRQ,LRRY,ZT,BBZT,THBZ,LBJHBZ,DBBZB_TBRQ_JFID,ND)\n"+
							    	"  select SEQU_DBBZB_RW.NEXTVAL,jfDBBZB_ID,'"+jfdeptcode+"',TO_DATE('2016-' || TO_CHAR(TBRQ, 'MM-DD'), 'YYYY-MM-DD'),'"+jfdeptname+"_' || f_get_mc('BBMC', JFDBBZB_ID) || '_' ||TO_CHAR(TO_DATE('"+nd+"-' || TO_CHAR(TBRQ, 'MM-DD'), 'YYYY-MM-DD'),'YYYY-MM-DD'), KSTSTS, KSTBTS, JZTBTS, JZCBTS, DYBM, '1', sysdate, 'system', '1', '0', '0', '0', jfid, '"+nd+"'from DBBZB_tbrq";
							    	if (so.dc.pjdo.execute(sqlin) <= 0) {
							    		so.httpServletRequest.setAttribute("Message", "任务生成失败！");
							    	}
						}
						
						so.httpServletRequest.setAttribute("Message", "任务生成成功！");
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
				so.httpServletRequest.setAttribute("Message", "任务生成失败！");
			}
			so.setActForward("SEARCH");
			other(so);
		}
	}

}
