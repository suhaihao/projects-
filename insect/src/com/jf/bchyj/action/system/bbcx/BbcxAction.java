package com.jf.bchyj.action.system.bbcx;

import java.io.UnsupportedEncodingException;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ContainUpdateSql;
import mt.controller.base.ServletObject;

import com.jf.bchyj.bean.User;

public class BbcxAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String jflb = so.httpServletRequest.getParameter("jflb"); // 类别  
		String bbbm = so.httpServletRequest.getParameter("bbbm"); // 报表编码
		String bbmc = so.httpServletRequest.getParameter("bbmc"); // 报表名称
		String zt = so.httpServletRequest.getParameter("zt"); // 状态
		String sql = "SELECT JFID,JFTABNAME,JFCODE,JFPLANTSORT,JFWORMSORT,F_GET_MC('RYBM',JFLISTER) RYMC,TO_CHAR(JFLISTDATE,'YYYY-MM-DD') LRRQ,DECODE(JFSTATE,'0','初始','1','发布','2','归档','') JFSTATE FROM DBBZB WHERE JFSTATE='1'";
		/*if (jflb != null) { // 预留类别为多选情况
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
		if (zt != null && !"".equals(zt)) {
			sql = sql + " and jfstate='" + zt + "'";
		}
		sql += " ORDER BY JFCODE,JFTABNAME";
		ContainDivPage cdp = new ContainDivPage();
		cdp.sqlselect = sql;
		cdp.sqlWhole = sql;
		so.getSession().setAttribute(
				so.actionMapping.findForward(switchForward(so.getActForward()))
						.getPath() + "_sql", cdp);
	}

	protected void insert(ServletObject so) {
		String cxmc = so.httpServletRequest.getParameter("cxmc");
		String cxlb = so.httpServletRequest.getParameter("cxlb");
		String zbid = so.httpServletRequest.getParameter("dbbzb_jfid");
		String lrry = ((User) so.getSession().getAttribute("user")).getUserjfid();
		String jfid = getSequence(so, "DBBZB_CX"); // 获取序列jfid
		so.httpServletRequest.setAttribute("jfid", jfid);
		String sql = "INSERT INTO DBBZB_CX(JFID,JFDBBZB_ID,JFNAME,JFLISTER,JFLISTDATE,JFATTRIBUTE,JFSTATE) VALUES('" 
			+ jfid + "','" + zbid + "','" + cxmc + "','" + lrry + "',SYSDATE,'" + cxlb + "','0')";
		int c = so.dc.pjdo.execute(sql);
		if (c > 0) {
			so.setActForward("MODIFY"); // 跳转到修改页
		} else {
			so.setActForward("ADD"); // 跳转到添加页
		}
		other(so);
	}

	protected void update(ServletObject so) {
		String cxmc = so.httpServletRequest.getParameter("cxmc");
		String cxlb = so.httpServletRequest.getParameter("d:jfattribute:str:s");
		String jfid = so.httpServletRequest.getParameter("jfid");
		String zt = so.httpServletRequest.getParameter("zt");
		String sql = "UPDATE DBBZB_CX SET JFNAME='" + cxmc 
			+ "',JFATTRIBUTE='" + cxlb + "',JFSTATE='" 
			+ zt + "' WHERE JFID='" + jfid + "'";
		if (so.dc.pjdo.execute(sql) > 0) {
			so.httpServletRequest.setAttribute("Message", "保存成功！");
		} else {
			so.httpServletRequest.setAttribute("Message", "保存失败！");
		}
		so.httpServletRequest.setAttribute("jfid", jfid);
		so.setActForward("MODIFY");
		other(so);
	}

	protected void other(ServletObject so) {
		String forward = so.getActForward();
		String jfid = so.httpServletRequest.getParameter("jfid");
		if ("LIST".equals(forward)) {
			String bb = so.httpServletRequest.getParameter("bb");
			try {
				bb = new String(bb.getBytes("ISO-8859-1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		} else if ("MODIFY".equals(forward)) {
			if (jfid == null || "".equals(jfid)) {
				jfid = (String) so.httpServletRequest.getAttribute("jfid");
			}
			String sql = "SELECT JFID,JFDBBZB_ID,JFNAME,F_GET_MC('RYBM',JFLISTER) LRRY,JFLISTER,JFLISTDATE,JFATTRIBUTE,JFSTATE,DECODE(JFSTATE,'0','初始','1','提交') ZT FROM DBBZB_CX WHERE JFID='" + jfid + "'";
			ContainUpdateSql cus = new ContainUpdateSql();
			cus.masteSql = sql;
			so.getSession().setAttribute(
					so.actionMapping.findForward(
							switchForward(so.actForward)).getPath()
							+ "_updatesql", cus);
		} else if ("DEL".equals(forward)) {
			try {
				String id = so.httpServletRequest.getParameter("id");
				String bbmc = so.httpServletRequest.getParameter("bbmc");
				if (so.dc.pjdo.execute("DELETE FROM DBBZB_CX WHERE JFID='" + id + "'") > 0) {
					so.httpServletResponse.getWriter().print("<script>alert('删除成功！');window.location='/insect/system/cxtj/bbcx_list.jsp?jfid=" 
							+ jfid + "&bb=" + bbmc + "'</script>");
				} else {
					so.httpServletResponse.getWriter().print("<script>alert('删除失败！');window.location='/insect/system/cxtj/bbcx_list.jsp?jfid=" 
							+ jfid + "&bb=" + bbmc + "'</script>");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
