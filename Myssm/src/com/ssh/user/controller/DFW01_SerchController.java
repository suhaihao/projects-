package com.ssh.user.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.user.model.DDJ01;
import com.ssh.user.model.DDJ02;
import com.ssh.user.model.DDJ02_D;
import com.ssh.user.model.DDJ03;
import com.ssh.user.model.DDJ11;
import com.ssh.user.model.DFW01;
import com.ssh.user.model.DFW01_D;
import com.ssh.user.model.DFW01_D_ZP;
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ01Service;
import com.ssh.user.service.DDJ02Service;
import com.ssh.user.service.DDJ02_DService;
import com.ssh.user.service.DDJ11Service;
import com.ssh.user.service.DFW01Service;
import com.ssh.user.service.DFW01_DService;
import com.ssh.user.service.DFW01_D_ZPService;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.service.UserService;
import com.ssh.user.util.EHCache;
import com.ssh.user.util.Page;

@Controller
@Scope("prototype")
@RequestMapping(value = "/gdcx")
public class DFW01_SerchController {
	@Autowired
	private DFW01Service dFW01Service;
	@Autowired
	private DFW01_DService dFW01_DService;
	@Autowired
	private Dsys11Service dsys11Service;
	@Autowired
	private DDJ02Service dDJ02Service;
	@Autowired
	private UserService userService;
	@Autowired
	private DDJ01Service dDJ01Service;
	@Autowired
	private DDJ02_DService dDJ02_DService;
	@Autowired
	private DDJ11Service dDJ11Service;
	@Autowired
	private DFW01_D_ZPService dFW01_D_ZPService;

	private EHCache eHCache = new EHCache("ehcacheMenu");

	@RequestMapping(value = "/sel.do")
	public String gotoIn(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		String StarTime = request.getParameter("StarTime");
		String EndTime = request.getParameter("EndTime");
		String DDJ02_MC = request.getParameter("DDJ02_MC");
		String FZFZR_MC = request.getParameter("FZFZR_MC");
		try {
			if (DDJ02_MC != null) {
				DDJ02_MC = new String(DDJ02_MC.getBytes("ISO8859-1"), "GBK");
			}
			if (FZFZR_MC != null) {
				FZFZR_MC = new String(FZFZR_MC.getBytes("ISO8859-1"), "GBK");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String ys = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("DDJ01_JFID", user.getDDJ01_JFID());
		Page page = null;
		if (ys == null) {
			if (StarTime != null) {
				map.put("StarTime", StarTime);
				request.setAttribute("StarTime", StarTime);
			}
			if (EndTime != null) {
				map.put("EndTime", EndTime);
				request.setAttribute("EndTime", EndTime);
			}
			if (DDJ02_MC != null) {
				map.put("DDJ02_MC", DDJ02_MC);
				request.setAttribute("DDJ02_MC", DDJ02_MC);
			}
			if (FZFZR_MC != null) {
				map.put("FZFZR_MC", FZFZR_MC);
				request.setAttribute("FZFZR_MC", FZFZR_MC);
			}
			page = new Page(10, dFW01Service.getCountZT4(map), 1);
		} else {
			if (DDJ02_MC == null && EndTime == null && StarTime == null
					&& FZFZR_MC == null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				if (StarTime != null) {
					map.put("StarTime", StarTime);
					request.setAttribute("StarTime", StarTime);
				}
				if (EndTime != null) {
					map.put("EndTime", EndTime);
					request.setAttribute("EndTime", EndTime);
				}
				if (DDJ02_MC != null) {
					map.put("DDJ02_MC", DDJ02_MC);
					request.setAttribute("DDJ02_MC", DDJ02_MC);
				}
				if (FZFZR_MC != null) {
					map.put("FZFZR_MC", FZFZR_MC);
					request.setAttribute("FZFZR_MC", FZFZR_MC);
				}
				page = new Page(10, dFW01Service.getCountZT4(map),
						Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		map.put("max", page.getMax());
		map.put("min", page.getMin());
		List<DFW01> lisdfw01 = dFW01Service.SelectByPageZT4(map);
		request.setAttribute("lisdfw01", lisdfw01);
		// 判断是否需要弹出消息
		if (request.getSession().getAttribute("DFW21_JFID") != null) {
			request.setAttribute("DFW21_JFID", request.getSession()
					.getAttribute("DFW21_JFID"));
			request.getSession().removeAttribute("DFW21_JFID");
		}
		// 判断是否需要弹出消息
		if (request.getSession().getAttribute("DFW22_JFID") != null) {
			request.setAttribute("DFW22_JFID", request.getSession()
					.getAttribute("DFW22_JFID"));
			request.getSession().removeAttribute("DFW22_JFID");
		}
		return "jf_dfw01_serch";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gotolabel.do")
	public String gotolabel(HttpServletRequest request) {
		String JFID = request.getParameter("id");
		DFW01 dFW01 = dFW01Service.SelectByID(JFID);
		if (dFW01.getFZRY() != null && !dFW01.getFZRY().equals("")) {
			String[] rys = dFW01.getFZRY().split(",");
			String[] rymcs = dFW01.getFZRY_MC().split(",");
			String retrunval = "";
			for (int i = 0; i < rys.length; i++) {
				retrunval += rys[i] + "!" + rymcs[i] + ",";
			}
			request.setAttribute("retrunval", retrunval);
		}
		dFW01.setJHSJ(dFW01.getJHSJ().substring(0, 10));
		request.setAttribute("dFW01", dFW01);
		// 查询对应地块
		List<DFW01_D> listdfw01_d = dFW01_DService.SelectByID(JFID);
		request.setAttribute("listdfw01_d", listdfw01_d);
		if (listdfw01_d.size() >= 1) {
			request.setAttribute("fw01_d", listdfw01_d.get(0));
		}
		try {
			if (eHCache.getCacheElement("listFWNRLB") == null) {
				List<Dsys11> listFWNRLB = dsys11Service.SelecetAllBM("FWNRLB");
				request.setAttribute("listFWNRLB", listFWNRLB);
				eHCache.addToCache("listFWNRLB", listFWNRLB, false);
			} else {
				request.setAttribute("listFWNRLB",
						eHCache.getCacheElement("listFWNRLB"));
			}
			if (eHCache.getCacheElement("listddj03") == null) {
				List<DDJ03> listddj03 = dsys11Service.SelectAllST();
				request.setAttribute("listddj03", listddj03);
				eHCache.addToCache("listddj03", listddj03, false);
			} else {
				request.setAttribute("listddj03",
						eHCache.getCacheElement("listddj03"));
			}
			if (eHCache.getCacheElement("listdklx") == null) {
				List<Dsys11> listdklx = dsys11Service.SelecetAllBM("DLX");
				request.setAttribute("listdklx", listdklx);
				eHCache.addToCache("listdklx", listdklx, false);
			} else {
				List<Dsys11> listdklx = (List<Dsys11>) eHCache
						.getCacheElement("listdklx");
				request.setAttribute("listdklx", listdklx);
			}
			if (eHCache.getCacheElement("listzw") == null) {
				List<Dsys11> listzw = dsys11Service.SelecetAllBM("NZW");
				request.setAttribute("listzw", listzw);
				eHCache.addToCache("listzw", listzw, false);
			} else {
				List<Dsys11> listzw = (List<Dsys11>) eHCache
						.getCacheElement("listzw");
				request.setAttribute("listzw", listzw);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "jf_dfw01_label_serch";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gotodklabel.do")
	public String gotodklabel(HttpServletRequest request) {
		String SFJE = request.getParameter("SFJE");
		request.setAttribute("SFJE", SFJE);
		String DDJ02_JFID = request.getParameter("DDJ02_JFID");
		request.setAttribute("DDJ02_JFID", DDJ02_JFID);
		String FWNRLB = request.getParameter("FWNRLB");
		request.setAttribute("FWNRLB", FWNRLB);
		String JFID = request.getParameter("JFID");
		request.setAttribute("fw01_d", dFW01_DService.SelectByJFID(JFID).get(0));
		try {
			if (eHCache.getCacheElement("listdklx") == null) {
				List<Dsys11> listdklx = dsys11Service.SelecetAllBM("DLX");
				request.setAttribute("listdklx", listdklx);
				eHCache.addToCache("listdklx", listdklx, false);
			} else {
				List<Dsys11> listdklx = (List<Dsys11>) eHCache
						.getCacheElement("listdklx");
				request.setAttribute("listdklx", listdklx);
			}
			if (eHCache.getCacheElement("listzw") == null) {
				List<Dsys11> listzw = dsys11Service.SelecetAllBM("NZW");
				request.setAttribute("listzw", listzw);
				eHCache.addToCache("listzw", listzw, false);
			} else {
				List<Dsys11> listzw = (List<Dsys11>) eHCache
						.getCacheElement("listzw");
				request.setAttribute("listzw", listzw);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "jf_dfw01_dk_label_serch";
	}
}
