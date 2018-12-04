package com.jf.bchyj.bbhz;

import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.Statement;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;
import mt.database.extend.QueryConnection;

import com.jf.bchyj.bean.User;

public class BbhzAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String jflb = so.httpServletRequest.getParameter("jflb"); // ���  
		String bbbm = so.httpServletRequest.getParameter("bbbm"); // �������
		String bbmc = so.httpServletRequest.getParameter("bbmc"); // ��������
		String bbzl = so.httpServletRequest.getParameter("bbzl"); // ��������
		String sql = "select distinct dbbzb.jfid,dbbzb.jfcode,dbbzb.jftabname,f_get_mc('RYBM',dbbzb.jflister) rymc,to_char(dbbzb.jflistdate,'yyyy-mm-dd') lrrq,decode(dbbzb.jftabsort,'0','ϵͳ��','1','�ղ��','&nbsp;') bbzl from dbbzb,dtjbb where dbbzb.jfstate='1' and dbbzb.jfid=dtjbb.jfdbbzb_id ";
		/*if (jflb != null) { // Ԥ�����Ϊ��ѡ���
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < jflb.length; i++) {
				sb.append(jflb[i] + ",");
			}
			sb.deleteCharAt(sb.length()-1);
			sql = sql + " and dbbzb.jflb like '%" + sb.toString() + "%'";
		}*/
		if (jflb != null && !"".equals(jflb)) {
			sql = sql + " and dbbzb.jflb like '%" + jflb + "%'";
		}
		if (bbbm != null && !"".equals(bbbm)) {
			sql = sql + " and dbbzb.jfcode like '%" + bbbm + "%'";
		}
		if (bbmc != null && !"".equals(bbmc)) {
			sql = sql + " and dbbzb.jftabname like '%" + bbmc + "%'";
		}
		if (bbzl != null && !"".equals(bbzl)) {
			sql = sql + " and dbbzb.jftabsort='" + bbzl + "'";
		}
		sql += " order by dbbzb.jfcode";
		ContainDivPage cdp = new ContainDivPage();
		cdp.sqlselect = sql;
		cdp.sqlWhole = sql;
		so.getSession().setAttribute(
				so.actionMapping.findForward(switchForward(so.getActForward()))
						.getPath() + "_sql", cdp);
	}

	protected void other(ServletObject so) {
		String forward = so.getActForward();
		if ("LIST".equals(forward)) {
			String dbbzb_jfid = so.httpServletRequest.getParameter("dbbzb_jfid");
			String bbmc = so.httpServletRequest.getParameter("bbmc");
			User user = (User)so.getSession().getAttribute("user");
			try {
				bbmc = java.net.URLDecoder.decode(bbmc, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			so.httpServletRequest.setAttribute("BBMC", bbmc);
			String sql = "select jfid,jfname,f_get_mc('RYBM',jflister) jflister,to_char(jflistdate,'yyyy-mm-dd') jflistdate,decode(jfattribute,'0','����','1','˽��')jfattribute,decode(jfstate,'0','��ʼ','1','�ύ')jfstate from dtjbb where jfdbbzb_id='" 
				+ dbbzb_jfid + "'";
			// �Լ����Կ����Լ��ύ����Ϣ����վ���˿��Կ���ȫ���ύ��Ϣ
			sql = sql + "and (('10'='" + user.getBmbm() + "' or jfattribute='0'or jflister='" + user.getUserjfid() + "') and jfstate='1')";
			sql = sql + " order by jfstate";
			try {
			QueryConnection qc = new QueryConnection();
			Statement stmt = qc.con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next())
			{
				so.httpServletRequest.setAttribute("dbbzb_tj_jfid", rs.getString(1));
			}
			
			} catch (Exception e) {
				e.printStackTrace();
			}
//			ContainDivPage cdp = new ContainDivPage();
//			cdp.sqlWhole = sql;
//			so.getSession().setAttribute(
//					so.actionMapping.findForward(switchForward(so.getActForward()))
//							.getPath() + "_sql", cdp);
		}
	}

}
