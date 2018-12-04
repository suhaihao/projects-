package com.ssh.user.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.user.model.DDJ02;
import com.ssh.user.model.DDJ02_D;
import com.ssh.user.model.DDJ02_DDJ01;
import com.ssh.user.model.DFW01_D;
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ02Service;
import com.ssh.user.service.DDJ02_DDJ01Service;
import com.ssh.user.service.DDJ02_DService;
import com.ssh.user.service.DFW01_DService;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.util.EHCache;
import com.ssh.user.util.Page;

@Controller
@Scope("prototype")
@RequestMapping(value = "/searchnh")
public class DDJ02Controller {
	@Autowired
	private DDJ02Service dDJ02Service;
	@Autowired
	private Dsys11Service dsys11Service;
	@Autowired
	private DDJ02_DDJ01Service dDJ02_DDJ01Service;
	@Autowired
	private DDJ02_DService dDJ02_DService;
	@Autowired
	private DFW01_DService dFW01_DService;

	private EHCache eHCache = new EHCache("ehcacheMenu");

	@RequestMapping(value = "/sel.do")
	public String SelelAllNh(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		String DDJ01_JFID = user.getDDJ01_JFID();
		String MC = request.getParameter("MC");
		String XZQHMC = request.getParameter("XZQHMC");
		String StarTime=request.getParameter("StarTime");
		String EndTime=request.getParameter("EndTime");
		if (MC != null && !MC.equals("")) {
			try {
				MC = new String(MC.getBytes("ISO8859-1"), "GBK");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		if (XZQHMC != null && !XZQHMC.equals("")) {
			try {
				XZQHMC = new String(XZQHMC.getBytes("ISO8859-1"), "GBK");
				request.setAttribute("XZQHMC", XZQHMC);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		String XZQH = request.getParameter("XZQH");
		String ys = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
		if (DDJ01_JFID != null) {
			map.put("DDJ01_JFID", DDJ01_JFID);
		}
		Page page = null;
		if (ys == null) {
			if (MC != null) {
				map.put("MC", MC);
				request.setAttribute("MC", MC);
			}
			if (XZQH != null) {
				map.put("XZQH", XZQH);
				request.setAttribute("XZQH", XZQH);
			}
			if (StarTime != null) {
				map.put("StarTime", StarTime);
			}
			if (EndTime != null) {
				map.put("EndTime", EndTime);
			}
			page = new Page(10, dDJ02Service.GetCount(map), 1);
		} else {
			if (MC == null && XZQH == null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				if (MC != null) {
					map.put("MC", MC);
					request.setAttribute("MC", MC);
				}
				if (XZQH != null) {
					map.put("XZQH", XZQH);
					request.setAttribute("XZQH", XZQH);
				}
				if (StarTime != null) {
					map.put("StarTime", StarTime);
				}
				if (EndTime != null) {
					map.put("EndTime", EndTime);
				}
				page = new Page(10, dDJ02Service.GetCount(map), Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		map.put("MAX", page.getMax());
		map.put("MIN", page.getMin());
		List<DDJ02> listddj02 = dDJ02Service.SelectAllSize(map);
		request.setAttribute("listddj02", listddj02);
		return "jf_ddj02_serch";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gotolabel.do")
	public String gotolabel(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		try {
			if (eHCache.getCacheElement("listxl") == null) {
				List<Dsys11> listxl = dsys11Service.SelecetAllBM("ZJ_XL");
				request.setAttribute("listxl", listxl);
				eHCache.addToCache("listxl", listxl, false);
			} else {
				List<Dsys11> listxl = (List<Dsys11>) eHCache
						.getCacheElement("listxl");
				request.setAttribute("listxl", listxl);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String id = request.getParameter("id");
		List<DDJ02> listddj02 = dDJ02Service.SelectByID(id);
		request.setAttribute("dDJ02", listddj02.get(0));
		DDJ02_DDJ01 dDJ02_DDJ01 = dDJ02_DDJ01Service.SelectByZZID(
				user.getDDJ01_JFID(), listddj02.get(0).getJFID());
		request.setAttribute("dDJ02_DDJ01", dDJ02_DDJ01);
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
		List<DDJ02_D> listddj02_d = dDJ02_DService.SelectByDDJ02_JFID(id);
		request.setAttribute("listddj02_d", listddj02_d);
		return "jf_dd02_label_serch";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gotodklabel.do")
	public String gotodklabel(HttpServletRequest request) {
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
		String id = request.getParameter("id");
		DDJ02_D dDJ02_D = dDJ02_DService.SelectById(id);
		request.setAttribute("dDJ02_D", dDJ02_D);
		return "jf_dd02_dk_label_serch";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gotodfzcx.do")
	public String gotodfzcx(HttpServletRequest request) {
		String DDJ02_D_JFID = request.getParameter("DDJ02_D_JFID");
		
		DDJ02_D dDJ02_D = dDJ02_DService.SelectById(DDJ02_D_JFID);
		request.setAttribute("dDJ02_D", dDJ02_D);
		DDJ02 dDJ02 = dDJ02Service.SelectByID(dDJ02_D.getDDJ02_JFID()).get(0);
		request.setAttribute("dDJ02", dDJ02);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("DDJ02_D_JFID", DDJ02_D_JFID);
		List<DFW01_D> listdfw01_d = dFW01_DService
				.SelectByDDJ02_D_JFID(map);
		for (int i = 0; i < listdfw01_d.size(); i++) {
			if(listdfw01_d.get(i).getLSRQ().equals("-"))
			{
				listdfw01_d.get(i).setLSRQ("");
			}
			if(listdfw01_d.get(i).getFZRY_MC()!=null&&!listdfw01_d.get(i).getFZRY_MC().equals(""))
			{
				listdfw01_d.get(i).setFZRY_MC(listdfw01_d.get(i).getFZRY_MC().substring(0, listdfw01_d.get(i).getFZRY_MC().length()-1));
			}
		}
		request.setAttribute("listdfw01_d", listdfw01_d);
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
		return "jf_dd02_dk_label_fz_serch";
	}

	@RequestMapping(value = "/cxtj.do")
	public String cxtj(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		String DDJ01_JFID = user.getDDJ01_JFID();
		String StarTime = request.getParameter("StarTime");
		String EndTime = request.getParameter("EndTime");
		String XZQH = request.getParameter("XZQH");
		String XZQHMC = request.getParameter("XZQHMC");
		if (XZQHMC != null && !XZQHMC.equals("")) {
			try {
				XZQHMC = new String(XZQHMC.getBytes("ISO8859-1"), "GBK");
				request.setAttribute("XZQHMC", XZQHMC);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		String TJFS = request.getParameter("TJFS");
		if (TJFS != null) {
			request.setAttribute("TJFS", TJFS);
		} else {
			TJFS="1";
			request.setAttribute("TJFS", 1);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("DDJ01_JFID", DDJ01_JFID);
		if (StarTime != null) {
			map.put("StarTime", StarTime);
			request.setAttribute("StarTime", StarTime);
		}
		if (EndTime != null) {
			map.put("EndTime", EndTime);
			request.setAttribute("EndTime", EndTime);
		}
		if (XZQH != null) {
			map.put("XZQH", XZQH);
			request.setAttribute("XZQH", XZQH);
		}
		List<DDJ02> listddj02 = null;
		if (TJFS.equals("1")) {
			listddj02 = dDJ02Service.SelectTJ(map);
		}
		if (TJFS.equals("2")) {
			listddj02 = dDJ02Service.SelectTJ2(map);
		}
		if (TJFS.equals("3")) {
			listddj02 = dDJ02Service.SelectTJ3(map);
		}
		request.setAttribute("listddj02", listddj02);
		DDJ02  dDJ02 =dDJ02Service.SelectHj(map);
		request.setAttribute("dDJ02", dDJ02);
		return "jf_ddj02_tj";
	}
}
