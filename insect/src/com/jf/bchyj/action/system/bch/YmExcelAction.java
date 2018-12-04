package com.jf.bchyj.action.system.bch;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jf.bchyj.bean.User;
import com.jf.bchyj.common.zjz_upload.DeleteFile;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ContainUpdateSql;
import mt.controller.base.ServletObject;

public class YmExcelAction extends InitAction {

	protected void other(ServletObject so) {
		String fwd = so.getActForward();
		User user = (User) so.httpServletRequest.getSession().getAttribute(
				"user");
		String BMBM = user.getBmbm();
		String JFID = so.httpServletRequest.getParameter("JFID");
		String KSTBRQ = so.httpServletRequest.getParameter("KSTBRQ");
		String JZTBRQ = so.httpServletRequest.getParameter("JZTBRQ");
		String RWSJ = so.httpServletRequest.getParameter("RWSJ");
		String DCRQ = so.httpServletRequest.getParameter("DCRQ");
		String ZT = so.httpServletRequest.getParameter("ZT");
		String lb = so.httpServletRequest.getParameter("lb");
		String zbid = so.httpServletRequest.getParameter("zbid");
		String rwid = so.httpServletRequest.getParameter("rwid");
		String DC = so.httpServletRequest.getParameter("DC");
		String LRRY = user.getUsername();
		Calendar c = Calendar.getInstance();
		String JFNO = c.get(Calendar.YEAR) + "" + (c.get(Calendar.MONTH) + 1)
				+ zbid;
		String BBLX = "";
		if (ZT.equals("0")) {
			BBLX = "1";
		} else {
			if (lb.equals("zc")) {
				BBLX = "2";
			} else if (lb.equals("cb")) {
				BBLX = "3";
			} else if (lb.equals("lb")) {
				BBLX = "4";
			}
		}
		so.httpServletRequest.setAttribute("jfid", JFID);
		so.httpServletRequest.setAttribute("bbzt", BBLX);
		so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
		so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
		so.httpServletRequest.setAttribute("lb", lb);
		so.httpServletRequest.setAttribute("zbid", zbid);
		so.httpServletRequest.setAttribute("rwid", rwid);
		so.httpServletRequest.setAttribute("rwsj", RWSJ);
		so.httpServletRequest.setAttribute("DC", DC);
	}
}
	
