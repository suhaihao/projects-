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

public class YmExcel_TJ_Action extends InitAction {

	protected void other(ServletObject so) {
		String fwd = so.getActForward();
		String zbid=so.httpServletRequest.getParameter("zbid");
		String DCRQUP=so.httpServletRequest.getParameter("DCRQUP");
		String DCRQDOWN=so.httpServletRequest.getParameter("DCRQDOWN");
		String BMBM=so.httpServletRequest.getParameter("BMBM");
		String DC=so.httpServletRequest.getParameter("DC");
		so.httpServletRequest.setAttribute("DCRQUP", DCRQUP);
		so.httpServletRequest.setAttribute("DCRQDOWN", DCRQDOWN);
		so.httpServletRequest.setAttribute("BMBM", BMBM);
		so.httpServletRequest.setAttribute("zbid", zbid);
		so.httpServletRequest.setAttribute("DC", DC);
	}
}
	
