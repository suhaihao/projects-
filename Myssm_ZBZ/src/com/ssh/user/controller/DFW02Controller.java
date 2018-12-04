package com.ssh.user.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;

import com.jspsmart.upload.SmartUpload;
import com.ssh.user.model.DDJ01;
import com.ssh.user.model.DDJ01_D;
import com.ssh.user.model.DDJ02;
import com.ssh.user.model.DFW02;
import com.ssh.user.model.DSYS05;
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ01Service;
import com.ssh.user.service.DFW02Service;
import com.ssh.user.service.DSYS05Service;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.service.UserService;
import com.ssh.user.util.MD5YZJM;
import com.ssh.user.util.Page;

@Controller
@Scope("prototype")
@RequestMapping(value = "/evaluate")
public class DFW02Controller {
	@Autowired
	private DDJ01Service dDJ01Service;
	@Autowired
	private DFW02Service dFW02Service;
	@Autowired
	private DSYS05Service dSYS05Service;
	
	@RequestMapping(value = "/sel.do")
	public String seleByzfzz(HttpServletRequest request) {
		String StarTime = request.getParameter("StarTime");
		String EndTime = request.getParameter("EndTime");
		String DDJ01_JFID = request.getParameter("DDJ01_JFID");
		String DDJ02_JFID = request.getParameter("DDJ02_JFID");
		String PJJG = request.getParameter("PJJG");
		if(PJJG==null)
		{
			request.setAttribute("PJJG","0");
		}
		String DDJ01_MC = request.getParameter("DDJ01_MC");
		String DDJ02_JFIDMC = request.getParameter("DDJ02_JFIDMC");
		if (StarTime != null || EndTime != null || DDJ01_JFID != null
				|| DDJ02_JFID != null) {

			try {
				if (DDJ01_MC != null) {
					DDJ01_MC = new String(DDJ01_MC.getBytes("ISO8859-1"), "GBK");
					request.setAttribute("DDJ01_MC", DDJ01_MC);
				}
				if (DDJ02_JFIDMC != null) {
					DDJ02_JFIDMC = new String(
							DDJ02_JFIDMC.getBytes("ISO8859-1"), "GBK");
					request.setAttribute("DDJ02_JFIDMC", DDJ02_JFIDMC);
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			String ys = request.getParameter("page");
			Map<String, Object> map = new HashMap<String, Object>();
			Page page = null;
			if (StarTime != null && !StarTime.equals("")) {
				map.put("StarTime", StarTime);
				request.setAttribute("StarTime", StarTime);
			}
			if (EndTime != null && !EndTime.equals("")) {
				map.put("EndTime", EndTime);
				request.setAttribute("EndTime", EndTime);
			}
			if (DDJ01_JFID != null && !DDJ01_JFID.equals("")) {
				map.put("DDJ01_JFID", DDJ01_JFID);
				request.setAttribute("DDJ01_JFID", DDJ01_JFID);
			}
			if (DDJ02_JFID != null && !DDJ02_JFID.equals("")) {
				map.put("DDJ02_JFID", DDJ02_JFID);
				request.setAttribute("DDJ02_JFID", DDJ02_JFID);
			}
			if (PJJG != null && !PJJG.equals("0")) {
				map.put("PJJG", PJJG);
				request.setAttribute("PJJG", PJJG);
			}
			if(PJJG!=null&&PJJG.equals("0"))
			{
				request.setAttribute("PJJG", PJJG);
			}
			if (ys == null) {
				page = new Page(10, dFW02Service.getCount(map), 1);
			} else {
				page = new Page(10, dFW02Service.getCount(map),
						Integer.parseInt(ys));
			}
			request.setAttribute("page", page);
			map.put("MAX", page.getMax());
			map.put("MIN", page.getMin());
			List<DFW02> listdfw02=dFW02Service.SelectByTimeDddj01Dddj02(map);
			request.setAttribute("listdfw02", listdfw02);
		} else {
			Page page = new Page(10, 0, 1);
			request.setAttribute("page", page);
		}
		return "jf_dfw02";
	}

	@RequestMapping(value = "/selZFZZ.do")
	public String selZFZZ(HttpServletRequest request,
			HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		String JFID = "";
		if (user.getXXDBLB().equals("3")) {
			JFID = user.getDDJ01_JFID();
		}
		String MC = request.getParameter("MC");
		String BMBM = request.getParameter("BMBM");
		if (MC != null && !MC.equals("")) {
			try {
				MC = new String(MC.getBytes("ISO8859-1"), "GBK");
				request.setAttribute("MC", MC);
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}
		String ys = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
		Page page = null;
		if (ys == null) {
			if (MC != null) {
				map.put("MC", MC);
			}
			if (BMBM != null) {
				map.put("BMBM", BMBM);
				request.setAttribute("BMBM", BMBM);
			}
			if (JFID != null) {
				map.put("JFID", JFID);
			}
			page = new Page(10, dDJ01Service.getCount(map), 1);
		} else {
			if (MC == null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				if (JFID != null) {
					map.put("JFID", JFID);
				}
				if (BMBM != null) {
					map.put("BMBM", BMBM);
					request.setAttribute("BMBM", BMBM);
				}
				if (MC != null) {
					map.put("MC", MC);
				}
				page = new Page(10, dDJ01Service.getCount(map),
						Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		map.put("MAX", page.getMax());
		map.put("MIN", page.getMin());
		List<DSYS05> listdsys05 = dSYS05Service.SelectByFather("0001", "3");
		request.setAttribute("listdsys05", listdsys05);
		List<DDJ01> listddj01 = dDJ01Service.SelectAllZFZZ(map);
		request.setAttribute("listddj01", listddj01);
		return "dfw02_user_zfzz";
	}
	@RequestMapping(value = "/selZFZZD.do")
	public String selZFZZD(HttpServletRequest request,
			HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		String JFID = "";
		if (user.getXXDBLB().equals("3")) {
			JFID = user.getDDJ01_JFID();
		}
		String MC = request.getParameter("MC");
		String BMBM = request.getParameter("BMBM");
		if (MC != null && !MC.equals("")) {
			try {
				MC = new String(MC.getBytes("ISO8859-1"), "GBK");
				request.setAttribute("MC", MC);
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}
		String ys = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
		Page page = null;
		if (ys == null) {
			if (MC != null) {
				map.put("MC", MC);
			}
			if (BMBM != null) {
				map.put("BMBM", BMBM);
				request.setAttribute("BMBM", BMBM);
			}
			if (JFID != null) {
				map.put("JFID", JFID);
			}
			page = new Page(10, dDJ01Service.getCount(map), 1);
		} else {
			if (MC == null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				if (JFID != null) {
					map.put("JFID", JFID);
				}
				if (BMBM != null) {
					map.put("BMBM", BMBM);
					request.setAttribute("BMBM", BMBM);
				}
				if (MC != null) {
					map.put("MC", MC);
				}
				page = new Page(10, dDJ01Service.getCount(map),
						Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		map.put("MAX", page.getMax());
		map.put("MIN", page.getMin());
		List<DSYS05> listdsys05 = dSYS05Service.SelectByFather("0001", "3");
		request.setAttribute("listdsys05", listdsys05);
		List<DDJ01> listddj01 = dDJ01Service.SelectAllZFZZ(map);
		request.setAttribute("listddj01", listddj01);
		return "dfw02_user_zfzzd";
	}
}
