package com.ssh.user.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
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
import com.ssh.user.model.DMSG;
import com.ssh.user.model.DMSG_NR;
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ01Service;
import com.ssh.user.service.DDJ02Service;
import com.ssh.user.service.DDJ02_DService;
import com.ssh.user.service.DDJ11Service;
import com.ssh.user.service.DFW01Service;
import com.ssh.user.service.DFW01_DService;
import com.ssh.user.service.DFW01_D_ZPService;
import com.ssh.user.service.DFW21Service;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.service.UserService;
import com.ssh.user.util.EHCache;
import com.ssh.user.util.Page;

@Controller
@Scope("prototype")
@RequestMapping(value = "/ordergd")
public class DFW01GDController {
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
	@Autowired
	private DFW21Service dFW21Service;

	private EHCache eHCache = new EHCache("ehcacheMenu");
	private EHCache eHCacheMSG = new EHCache("ehcacheMSG");
	private EHCache ehcacheMSG_INFO = new EHCache("ehcacheMSG_INFO");

	@RequestMapping(value = "/sel.do")
	public String gotoIn(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		String StarTime = request.getParameter("StarTime");
		String EndTime = request.getParameter("EndTime");
		String DDJ02_MC = request.getParameter("DDJ02_MC");
		if (DDJ02_MC != null) {
			try {
				DDJ02_MC = new String(DDJ02_MC.getBytes("ISO8859-1"), "GBK");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
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
			page = new Page(10, dFW01Service.getCountZT(map), 1);
		} else {
			if (DDJ02_MC == null && EndTime == null && StarTime == null) {
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
				page = new Page(10, dFW01Service.getCountZT(map),
						Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		map.put("max", page.getMax());
		map.put("min", page.getMin());
		List<DFW01> lisdfw01 = dFW01Service.SelectByPageZT(map);
		request.setAttribute("lisdfw01", lisdfw01);
		// 判断是否需要弹出消息
		if (request.getSession().getAttribute("DFW21_JFID") != null) {
			request.setAttribute("DFW21_JFID", request.getSession()
					.getAttribute("DFW21_JFID"));
			request.getSession().removeAttribute("DFW21_JFID");
		}
		if (request.getSession().getAttribute("DFW22_JFID") != null) {
			request.setAttribute("DFW22_JFID", request.getSession()
					.getAttribute("DFW22_JFID"));
			request.getSession().removeAttribute("DFW22_JFID");
		}
		return "jf_dfw01_GD";
	}

	@RequestMapping(value = "/user.do")
	public String xzuser(HttpServletRequest request) {
		String MC = request.getParameter("MC");
		User user = (User) request.getSession().getAttribute("user");
		String ys = request.getParameter("page");
		Page page = null;
		if (ys == null) {
			if (MC == null) {
				page = new Page(10,
						dDJ02Service.getCount(user.getDDJ01_JFID()), 1);
			} else {
				try {
					MC = new String(MC.getBytes("ISO8859-1"), "GBK");
					request.setAttribute("MC", MC);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				page = new Page(10, dDJ02Service.getCountByTj(
						user.getDDJ01_JFID(), MC), 1);
			}
		} else {
			if (MC == null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				try {
					MC = new String(MC.getBytes("ISO8859-1"), "GBK");
					request.setAttribute("MC", MC);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				page = new Page(10, dDJ02Service.getCountByTj(
						user.getDDJ01_JFID(), MC), Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("max", page.getMax());
		map.put("min", page.getMin());
		map.put("DDJ01_JFID", user.getDDJ01_JFID());
		map.put("MC", MC);
		List<DDJ02> listddj02 = dDJ02Service.selectByZzPage(map);
		request.setAttribute("listddj02", listddj02);
		return "ddj02_add";
	}

	@RequestMapping(value = "/fzfzr.do")
	public String xzfzr(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		String DDJ01_JFID = user.getDDJ01_JFID();
		String JFNAME = request.getParameter("JFNAME");
		String ys = request.getParameter("page");
		Page page = null;
		if (ys == null) {
			if (JFNAME == null) {
				page = new Page(10, userService.getAllUserSize(DDJ01_JFID), 1);
			} else {
				try {
					JFNAME = new String(JFNAME.getBytes("ISO8859-1"), "GBK");
					request.setAttribute("JFNAME", JFNAME);
				} catch (UnsupportedEncodingException e1) {
					e1.printStackTrace();
				}
				page = new Page(10, userService.getAllUserSizeByTJ(JFNAME,
						DDJ01_JFID), 1);
			}
		} else {
			if (JFNAME == null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				try {
					JFNAME = new String(JFNAME.getBytes("ISO8859-1"), "GBK");
					request.setAttribute("JFNAME", JFNAME);
				} catch (UnsupportedEncodingException e1) {
					e1.printStackTrace();
				}
				page = new Page(10, userService.getAllUserSizeByTJ(JFNAME,
						DDJ01_JFID), Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		if (JFNAME != null) {
			List<User> listUser = userService.SelectByName(page, JFNAME,
					DDJ01_JFID);
			request.setAttribute("listUser", listUser);
		} else {
			List<User> listUser = userService.SelectAllUser(page, DDJ01_JFID);
			request.setAttribute("listUser", listUser);
		}
		return "users_add";
	}

	@RequestMapping(value = "/fzry.do")
	public String xzry(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		String DDJ01_JFID = user.getDDJ01_JFID();
		String JFNAME = request.getParameter("JFNAME");
		String ys = request.getParameter("page");
		Page page = null;
		if (ys == null) {
			if (JFNAME == null) {
				page = new Page(10, userService.getAllUserSize(DDJ01_JFID), 1);
			} else {
				try {
					JFNAME = new String(JFNAME.getBytes("ISO8859-1"), "GBK");
					request.setAttribute("JFNAME", JFNAME);
				} catch (UnsupportedEncodingException e1) {
					e1.printStackTrace();
				}
				page = new Page(10, userService.getAllUserSizeByTJ(JFNAME,
						DDJ01_JFID), 1);
			}
		} else {
			if (JFNAME == null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				try {
					JFNAME = new String(JFNAME.getBytes("ISO8859-1"), "GBK");
					request.setAttribute("JFNAME", JFNAME);
				} catch (UnsupportedEncodingException e1) {
					e1.printStackTrace();
				}
				page = new Page(10, userService.getAllUserSizeByTJ(JFNAME,
						DDJ01_JFID), Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		if (JFNAME != null) {
			List<User> listUser = userService.SelectByName(page, JFNAME,
					DDJ01_JFID);
			request.setAttribute("listUser", listUser);
		} else {
			List<User> listUser = userService.SelectAllUser(page, DDJ01_JFID);
			request.setAttribute("listUser", listUser);
		}
		return "users_addS";
	}

	@RequestMapping(value = "/addinfo.do")
	public String addinfo(HttpServletRequest request, DFW01 dFW01, Model model) {
		User user = (User) request.getSession().getAttribute("user");
		DDJ01 dDJ01 = dDJ01Service.SelectByID(user.getDDJ01_JFID());
		String JFID = dFW01Service.getID();
		try {
			dFW01.setJFID(JFID);
			dFW01.setDDJ01_JFID(user.getDDJ01_JFID());
			dFW01.setDDJ01_MC(dDJ01.getMC());
			dFW01.setDDJ02_MC(new String(dFW01.getDDJ02_MC().getBytes(
					"ISO8859-1"), "GBK"));
			dFW01.setDDJ02_DZ(new String(dFW01.getDDJ02_DZ().getBytes(
					"ISO8859-1"), "GBK"));
			dFW01.setFZFZR_MC(new String(dFW01.getFZFZR_MC().getBytes(
					"ISO8859-1"), "GBK"));
			if (request.getParameter("PDSM") != null
					&& !request.getParameter("PDSM").equals("")) {
				dFW01.setPDSM(new String(dFW01.getPDSM().getBytes("ISO8859-1"),
						"GBK"));
			}
			dFW01.setPDRY(user.getJFID());
			dFW01.setPDRY_MC(user.getJFNAME());
			if (request.getParameter("BZ") != null
					&& !request.getParameter("BZ").equals("")) {
				dFW01.setBZ(new String(dFW01.getBZ().getBytes("ISO8859-1"),
						"GBK"));
			}
			dFW01.setBMBM(dDJ01.getBMBM());
			if (request.getParameter("FZRY_MC") != null
					&& !request.getParameter("FZRY_MC").equals("")) {
				dFW01.setFZRY_MC(new String(dFW01.getFZRY_MC().getBytes(
						"ISO8859-1"), "GBK"));
			}
			dFW01.setFZRS(dFW01.getFZRY().split(",").length + 1);
			dFW01Service.inDFW01(dFW01);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		model.addAttribute("id", JFID);
		return "redirect:/ordergd/gotoup.do";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gotoup.do")
	public String gotoup(HttpServletRequest request,
			@ModelAttribute("msg") String msg) {
		try {
			if (request.getSession().getAttribute("msg") != null
					&& !request.getSession().getAttribute("msg").equals("")) {
				request.setAttribute("msgN", java.net.URLDecoder.decode(
						(String) request.getSession().getAttribute("msg"),
						"GBK"));
				request.getSession().removeAttribute("msg");
			}
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
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
		// 查询
		return "jf_dfw01_up_GD";
	}

	@RequestMapping(value = "/seldk.do")
	public String selBydk(HttpServletRequest request) {
		String DDJ02_JFID = request.getParameter("DDJ02_JFID");
		request.setAttribute("DDJ02_JFID", DDJ02_JFID);
		String ys = request.getParameter("page");
		String DH = request.getParameter("DH");
		if (DH != null) {
			try {
				DH = new String(DH.getBytes("ISO8859-1"), "GBK");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("DDJ02_JFID", DDJ02_JFID);
		Page page = null;
		if (ys == null) {
			if (DH != null) {
				map.put("DH", DH);
				request.setAttribute("DH", DH);
			}
			page = new Page(10, dDJ02_DService.getcount(map), 1);
		} else {
			if (DH == null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				if (DH != null) {
					map.put("DH", DH);
					request.setAttribute("DH", DH);
				}
				page = new Page(10, dDJ02_DService.getcount(map), 1);
			}
		}
		request.setAttribute("page", page);
		map.put("max", page.getMax());
		map.put("min", page.getMin());
		List<DDJ02_D> listddj02_d = dDJ02_DService.SelectBYDDJ02_JFIDPage(map);
		request.setAttribute("listddj02_d", listddj02_d);
		return "users_add_dk";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selfzcs.do")
	public String cxfzcs(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		String MC = request.getParameter("MC");
		String FL = request.getParameter("FL");
		String ys = request.getParameter("page");
		Page page = null;
		if (ys == null) {
			if (MC == null && FL == null) {
				page = new Page(10, dDJ11Service.getCountByZTTJ(user
						.getDDJ01_JFID()), 1);
			} else {
				if (MC != null) {
					try {
						MC = new String(MC.getBytes("ISO8859-1"), "GBK");
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
				}
				page = new Page(10, dDJ11Service.getCountBYTJZT(
						user.getDDJ01_JFID(), MC, FL), 1);
			}
		} else {
			if (MC == null && FL == null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				if (MC != null) {
					try {
						MC = new String(MC.getBytes("ISO8859-1"), "GBK");
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
				}
				page = new Page(10, dDJ11Service.getCountBYTJZT(
						user.getDDJ01_JFID(), MC, FL), Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		if (MC != null && !MC.equals("") || FL != null && !FL.equals("")) {
			if (MC != null && !MC.equals("")) {
				request.setAttribute("MC", MC);
			}
			if (FL != null && !FL.equals("")) {
				request.setAttribute("FL", FL);
			}
			List<DDJ11> listddj11 = dDJ11Service.selectByFlandNameBYZT(page,
					MC, FL, user.getDDJ01_JFID());
			request.setAttribute("listddj11", listddj11);
		} else {
			List<DDJ11> listddj11 = dDJ11Service.selectAlllistBYZT(page,
					user.getDDJ01_JFID());
			request.setAttribute("listddj11", listddj11);
		}
		try {
			if (eHCache.getCacheElement("lisfzfl") == null) {
				List<Dsys11> lisfzfl = dsys11Service.selectAllfzcsfl();
				request.setAttribute("lisfzfl", lisfzfl);
				eHCache.addToCache("lisfzfl", lisfzfl, false);
			} else {
				List<Dsys11> lisfzfl = (List<Dsys11>) eHCache
						.getCacheElement("lisfzfl");
				request.setAttribute("lisfzfl", lisfzfl);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ddj11_add";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selfzqtcs.do")
	public String cxfzqtcs(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		String MC = request.getParameter("MC");
		String FL = request.getParameter("FL");
		String ys = request.getParameter("page");
		Page page = null;
		if (ys == null) {
			if (MC == null && FL == null) {
				page = new Page(10, dDJ11Service.getCountByQTZTTJ(user
						.getDDJ01_JFID()), 1);
			} else {
				if (MC != null) {
					try {
						MC = new String(MC.getBytes("ISO8859-1"), "GBK");
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
				}
				page = new Page(10, dDJ11Service.getCountBYQTTJZT(
						user.getDDJ01_JFID(), MC, FL), 1);
			}
		} else {
			if (MC == null && FL == null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				if (MC != null) {
					try {
						MC = new String(MC.getBytes("ISO8859-1"), "GBK");
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
				}
				page = new Page(10, dDJ11Service.getCountBYQTTJZT(
						user.getDDJ01_JFID(), MC, FL), Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		if (MC != null && !MC.equals("") || FL != null && !FL.equals("")) {
			if (MC != null && !MC.equals("")) {
				request.setAttribute("MC", MC);
			}
			if (FL != null && !FL.equals("")) {
				request.setAttribute("FL", FL);
			}
			List<DDJ11> listddj11 = dDJ11Service.selectByQTFlandNameBYZT(page,
					MC, FL, user.getDDJ01_JFID());
			request.setAttribute("listddj11", listddj11);
		} else {
			List<DDJ11> listddj11 = dDJ11Service.selectAlllistBYQTZT(page,
					user.getDDJ01_JFID());
			request.setAttribute("listddj11", listddj11);
		}
		try {
			if (eHCache.getCacheElement("lisfzfl") == null) {
				List<Dsys11> lisfzfl = dsys11Service.selectAllfzcsfl();
				request.setAttribute("lisfzfl", lisfzfl);
				eHCache.addToCache("lisfzfl", lisfzfl, false);
			} else {
				List<Dsys11> lisfzfl = (List<Dsys11>) eHCache
						.getCacheElement("lisfzfl");
				request.setAttribute("lisfzfl", lisfzfl);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ddj11_add_qt";
	}

	@RequestMapping(value = "/upinfo.do")
	public String upinfo(HttpServletRequest request, DFW01 dFW01, Model model) {
		model.addAttribute("id", dFW01.getJFID());
		User user = (User) request.getSession().getAttribute("user");
		try {
			dFW01.setDDJ02_MC(new String(dFW01.getDDJ02_MC().getBytes(
					"ISO8859-1"), "GBK"));
			dFW01.setDDJ02_DZ(new String(dFW01.getDDJ02_DZ().getBytes(
					"ISO8859-1"), "GBK"));
			dFW01.setFZFZR_MC(new String(dFW01.getFZFZR_MC().getBytes(
					"ISO8859-1"), "GBK"));
			if (dFW01.getPDSM() != null && !dFW01.getPDSM().equals("")) {
				dFW01.setPDSM(new String(dFW01.getPDSM().getBytes("ISO8859-1"),
						"GBK"));
			} else {
				dFW01.setPDSM("");
			}
			if (dFW01.getPDRY_MC() != null && !dFW01.getPDRY_MC().equals("")) {
				dFW01.setPDRY_MC(new String(dFW01.getPDRY_MC().getBytes(
						"ISO8859-1"), "GBK"));
			} else {
				dFW01.setPDRY_MC("");
			}
			if (dFW01.getBZ() != null && !dFW01.getBZ().equals("")) {
				dFW01.setBZ(new String(dFW01.getBZ().getBytes("ISO8859-1"),
						"GBK"));
			} else {
				dFW01.setBZ("");
			}
			if (dFW01.getFZRY_MC() != null && !dFW01.getFZFZR_MC().equals("")) {
				dFW01.setFZRY_MC(new String(dFW01.getFZRY_MC().getBytes(
						"ISO8859-1"), "GBK"));
			} else {
				dFW01.setFZRY_MC("");
			}
			if (dFW01.getFZRY() != null && !dFW01.getFZRY().equals("")) {
				dFW01.setFZRS(dFW01.getFZRY().split(",").length + 1);
			} else {
				dFW01.setFZRS(1);
			}
			if (!request.getParameter("OLDDDJ02_JFID").equals(
					dFW01.getDDJ02_JFID())) {
				dFW01_DService.DelBYFW01ID(dFW01.getJFID());
				dFW01.setSFJE(0);
			}
			dFW01Service.updfw01(dFW01);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/ordergd/gotoup.do";
	}

	@RequestMapping(value = "/adddk.do")
	public String addDK(HttpServletRequest request, DFW01_D dFW01_D, Model model) {
		try {
			dFW01_D.setDDJ02_D_DH(new String(dFW01_D.getDDJ02_D_DH().getBytes(
					"ISO8859-1"), "GBK"));
			if (dFW01_D.getFZDX() != null && !dFW01_D.getFZDX().equals("")) {
				dFW01_D.setFZDX(new String(dFW01_D.getFZDX().getBytes(
						"ISO8859-1"), "GBK"));
			} else {
				dFW01_D.setFZDX("");
			}
			if (dFW01_D.getSYQX() != null && !dFW01_D.getSYQX().equals("")) {
				dFW01_D.setSYQX(new String(dFW01_D.getSYQX().getBytes(
						"ISO8859-1"), "GBK"));
			} else {
				dFW01_D.setSYQX("");
			}
			if (dFW01_D.getSMZT() != null && !dFW01_D.getSMZT().equals("")) {
				dFW01_D.setSMZT(new String(dFW01_D.getSMZT().getBytes(
						"ISO8859-1"), "GBK"));
			} else {
				dFW01_D.setSMZT("");
			}
			if (dFW01_D.getDDJ11_MC1() != null
					&& !dFW01_D.getDDJ11_MC1().equals("")) {
				dFW01_D.setDDJ11_MC1(new String(dFW01_D.getDDJ11_MC1()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_MC2() != null
					&& !dFW01_D.getDDJ11_MC2().equals("")) {
				dFW01_D.setDDJ11_MC2(new String(dFW01_D.getDDJ11_MC2()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_MC3() != null
					&& !dFW01_D.getDDJ11_MC3().equals("")) {
				dFW01_D.setDDJ11_MC3(new String(dFW01_D.getDDJ11_MC3()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_MC4() != null
					&& !dFW01_D.getDDJ11_MC4().equals("")) {
				dFW01_D.setDDJ11_MC4(new String(dFW01_D.getDDJ11_MC4()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_BZGG1() != null
					&& !dFW01_D.getDDJ11_BZGG1().equals("")) {
				dFW01_D.setDDJ11_BZGG1(new String(dFW01_D.getDDJ11_BZGG1()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_BZGG2() != null
					&& !dFW01_D.getDDJ11_BZGG2().equals("")) {
				dFW01_D.setDDJ11_BZGG2(new String(dFW01_D.getDDJ11_BZGG2()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_BZGG3() != null
					&& !dFW01_D.getDDJ11_BZGG3().equals("")) {
				dFW01_D.setDDJ11_BZGG3(new String(dFW01_D.getDDJ11_BZGG3()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_BZGG4() != null
					&& !dFW01_D.getDDJ11_BZGG4().equals("")) {
				dFW01_D.setDDJ11_BZGG4(new String(dFW01_D.getDDJ11_BZGG4()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getZW_MC() != null && !dFW01_D.getZW_MC().equals("")) {
				dFW01_D.setZW_MC(new String(dFW01_D.getZW_MC().getBytes(
						"ISO8859-1"), "GBK"));
			}
			dFW01_DService.insAdd(dFW01_D);
			if (dFW01_D.getSFJE() != null && !dFW01_D.getSFJE().equals("")) {
				DFW01 dFW01 = new DFW01();
				String FatherMonney = request.getParameter("FatherMonney");
				dFW01.setJFID(dFW01_D.getDFW01_JFID());
				dFW01.setSFJE(dFW01_D.getSFJE()
						+ Double.parseDouble(FatherMonney));
				dFW01Service.UPJE(dFW01);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		model.addAttribute("id", dFW01_D.getDFW01_JFID());
		return "redirect:/ordergd/gotoup.do";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gotodkup.do")
	public String gotodkup(HttpServletRequest request, Model model,
			@ModelAttribute("msg") String msg) {
		String SFJE = request.getParameter("SFJE");
		request.setAttribute("SFJE", SFJE);
		String DDJ02_JFID = request.getParameter("DDJ02_JFID");
		request.setAttribute("DDJ02_JFID", DDJ02_JFID);
		String FWNRLB = request.getParameter("FWNRLB");
		request.setAttribute("FWNRLB", FWNRLB);
		String JFID = request.getParameter("JFID");
		request.setAttribute("fw01_d", dFW01_DService.SelectByJFID(JFID).get(0));
		try {
			if (request.getSession().getAttribute("msg") != null
					&& !request.getSession().getAttribute("msg").equals("")) {
				request.setAttribute("msgN", java.net.URLDecoder.decode(
						(String) request.getSession().getAttribute("msg"),
						"GBK"));
				request.getSession().removeAttribute("msg");
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
		List<DFW01_D_ZP> listdfw01_d_zp = dFW01_D_ZPService.SelectBYDK(JFID);
		request.setAttribute("listdfw01_d_zp", listdfw01_d_zp);
		return "jf_dfw01_dk_up_GD";
	}

	@RequestMapping(value = "/updkinfo.do")
	public String upinfodk(HttpServletRequest request, DFW01_D dFW01_D,
			Model model) {
		try {
			dFW01_D.setDDJ02_D_DH(new String(dFW01_D.getDDJ02_D_DH().getBytes(
					"ISO8859-1"), "GBK"));
			if (dFW01_D.getFZDX() != null && !dFW01_D.getFZDX().equals("")) {
				dFW01_D.setFZDX(new String(dFW01_D.getFZDX().getBytes(
						"ISO8859-1"), "GBK"));
			} else {
				dFW01_D.setFZDX("");
			}
			if (dFW01_D.getSYQX() != null && !dFW01_D.getSYQX().equals("")) {
				dFW01_D.setSYQX(new String(dFW01_D.getSYQX().getBytes(
						"ISO8859-1"), "GBK"));
			} else {
				dFW01_D.setSYQX("");
			}
			if (dFW01_D.getSMZT() != null && !dFW01_D.getSMZT().equals("")) {
				dFW01_D.setSMZT(new String(dFW01_D.getSMZT().getBytes(
						"ISO8859-1"), "GBK"));
			} else {
				dFW01_D.setSMZT("");
			}
			if (dFW01_D.getDDJ11_MC1() != null
					&& !dFW01_D.getDDJ11_MC1().equals("")) {
				dFW01_D.setDDJ11_MC1(new String(dFW01_D.getDDJ11_MC1()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_MC2() != null
					&& !dFW01_D.getDDJ11_MC2().equals("")) {
				dFW01_D.setDDJ11_MC2(new String(dFW01_D.getDDJ11_MC2()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_MC3() != null
					&& !dFW01_D.getDDJ11_MC3().equals("")) {
				dFW01_D.setDDJ11_MC3(new String(dFW01_D.getDDJ11_MC3()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_MC4() != null
					&& !dFW01_D.getDDJ11_MC4().equals("")) {
				dFW01_D.setDDJ11_MC4(new String(dFW01_D.getDDJ11_MC4()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_BZGG1() != null
					&& !dFW01_D.getDDJ11_BZGG1().equals("")) {
				dFW01_D.setDDJ11_BZGG1(new String(dFW01_D.getDDJ11_BZGG1()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_BZGG2() != null
					&& !dFW01_D.getDDJ11_BZGG2().equals("")) {
				dFW01_D.setDDJ11_BZGG2(new String(dFW01_D.getDDJ11_BZGG2()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_BZGG3() != null
					&& !dFW01_D.getDDJ11_BZGG3().equals("")) {
				dFW01_D.setDDJ11_BZGG3(new String(dFW01_D.getDDJ11_BZGG3()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_BZGG4() != null
					&& !dFW01_D.getDDJ11_BZGG4().equals("")) {
				dFW01_D.setDDJ11_BZGG4(new String(dFW01_D.getDDJ11_BZGG4()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getZW_MC() != null && !dFW01_D.getZW_MC().equals("")) {
				dFW01_D.setZW_MC(new String(dFW01_D.getZW_MC().getBytes(
						"ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getSFJE() == null) {
				dFW01_D.setSFJE(0.0);
			}
			if (dFW01_D.getDDJ11_DJ1() == null) {
				dFW01_D.setDDJ11_DJ1(0.0);
			}
			if (dFW01_D.getDDJ11_DJ2() == null) {
				dFW01_D.setDDJ11_DJ2(0.0);
			}
			if (dFW01_D.getDDJ11_DJ3() == null) {
				dFW01_D.setDDJ11_DJ3(0.0);
			}
			if (dFW01_D.getDDJ11_DJ4() == null) {
				dFW01_D.setDDJ11_DJ4(0.0);
			}
			if (dFW01_D.getSYL1() == null) {
				dFW01_D.setSYL1(0.0);
			}
			if (dFW01_D.getSYL2() == null) {
				dFW01_D.setSYL2(0.0);
			}
			if (dFW01_D.getSYL3() == null) {
				dFW01_D.setSYL3(0.0);
			}
			if (dFW01_D.getSYL4() == null) {
				dFW01_D.setSYL4(0.0);
			}
			// 更新地块信息
			dFW01_DService.upDkxx(dFW01_D);
			// 更新金钱
			double OldMonney = 0;
			double FatherMonney = 0;
			if (request.getParameter("OldMonney") != null
					&& !request.getParameter("OldMonney").equals("")) {
				OldMonney = Double.parseDouble(request
						.getParameter("OldMonney"));
			}
			if (request.getParameter("FatherMonney") != null
					&& !request.getParameter("FatherMonney").equals("")) {
				FatherMonney = Double.parseDouble(request
						.getParameter("FatherMonney"));
			}
			if (OldMonney != dFW01_D.getSFJE()) {
				DFW01 dFW01 = new DFW01();
				dFW01.setJFID(dFW01_D.getDFW01_JFID());
				dFW01.setSFJE(FatherMonney - OldMonney + dFW01_D.getSFJE());
				dFW01Service.UPJE(dFW01);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		model.addAttribute("id", dFW01_D.getDFW01_JFID());
		return "redirect:/ordergd/gotoup.do";
	}

	@RequestMapping(value = "/deldk.do")
	public String deldk(HttpServletRequest request, Model model) {
		String JFID = request.getParameter("JFID");
		DFW01_D dFW01_D = dFW01_DService.SelectByJFID(JFID).get(0);
		String fatherJFID = request.getParameter("fatherJFID");
		String fatherSFJE = request.getParameter("fatherSFJE");
		double SFJE = 0.0;
		if (fatherSFJE != null && !fatherSFJE.equals("")) {
			SFJE = Double.parseDouble(fatherSFJE);
		}
		if (dFW01_D.getSFJE() != null && !dFW01_D.getSFJE().equals("")) {
			DFW01 dFW01 = new DFW01();
			dFW01.setJFID(fatherJFID);
			dFW01.setSFJE(SFJE - dFW01_D.getSFJE());
			dFW01Service.UPJE(dFW01);
		}
		dFW01_DService.delDK(JFID);
		model.addAttribute("id", fatherJFID);
		return "redirect:/ordergd/gotoup.do";
	}

	@RequestMapping(value = "/gotolabel.do")
	public String gotolabel(HttpServletRequest request, Model model,
			@ModelAttribute("msg") String msg) {
		try {
			if (request.getSession().getAttribute("msg") != null
					&& !request.getSession().getAttribute("msg").equals("")) {
				request.setAttribute("msgN", java.net.URLDecoder.decode(
						(String) request.getSession().getAttribute("msg"),
						"GBK"));
				request.getSession().removeAttribute("msg");
			}
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
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
		return "jf_dfw01_label_GD";
	}

	@RequestMapping(value = "/qxtj.do")
	public String qxtjff(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		User user = (User) request.getSession().getAttribute("user");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("psi_cllb", "0");
		map.put("psi_jfid", id);
		map.put("psi_lrry", user.getJFID());
		map.put("psi_lrry_mc", user.getJFNAME());
		dFW01Service.p_gd_pd(map);
		String msg = (String) map.get("pso_reason");
		model.addAttribute("id", id);
		return "redirect:/ordergd/gotoup.do";
	}

	@RequestMapping(value = "/delzb.do")
	public String delzb(HttpServletRequest request) {
		String id = request.getParameter("id");
		dFW01Service.delzb(id);
		dFW01_DService.DelBYFW01ID(id);
		return "redirect:/ordergd/sel.do";
	}

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
		return "jf_dfw01_dk_label_GD";
	}

	@RequestMapping(value = "/dkgc.do")
	public String dkgc(DFW01_D dFW01_D, HttpServletRequest request, Model model) {
		try {
			dFW01_D.setDDJ02_D_DH(new String(dFW01_D.getDDJ02_D_DH().getBytes(
					"ISO8859-1"), "GBK"));
			if (dFW01_D.getFZDX() != null && !dFW01_D.getFZDX().equals("")) {
				dFW01_D.setFZDX(new String(dFW01_D.getFZDX().getBytes(
						"ISO8859-1"), "GBK"));
			} else {
				dFW01_D.setFZDX("");
			}
			if (dFW01_D.getSYQX() != null && !dFW01_D.getSYQX().equals("")) {
				dFW01_D.setSYQX(new String(dFW01_D.getSYQX().getBytes(
						"ISO8859-1"), "GBK"));
			} else {
				dFW01_D.setSYQX("");
			}
			if (dFW01_D.getSMZT() != null && !dFW01_D.getSMZT().equals("")) {
				dFW01_D.setSMZT(new String(dFW01_D.getSMZT().getBytes(
						"ISO8859-1"), "GBK"));
			} else {
				dFW01_D.setSMZT("");
			}
			if (dFW01_D.getDDJ11_MC1() != null
					&& !dFW01_D.getDDJ11_MC1().equals("")) {
				dFW01_D.setDDJ11_MC1(new String(dFW01_D.getDDJ11_MC1()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_MC2() != null
					&& !dFW01_D.getDDJ11_MC2().equals("")) {
				dFW01_D.setDDJ11_MC2(new String(dFW01_D.getDDJ11_MC2()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_MC3() != null
					&& !dFW01_D.getDDJ11_MC3().equals("")) {
				dFW01_D.setDDJ11_MC3(new String(dFW01_D.getDDJ11_MC3()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_MC4() != null
					&& !dFW01_D.getDDJ11_MC4().equals("")) {
				dFW01_D.setDDJ11_MC4(new String(dFW01_D.getDDJ11_MC4()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_BZGG1() != null
					&& !dFW01_D.getDDJ11_BZGG1().equals("")) {
				dFW01_D.setDDJ11_BZGG1(new String(dFW01_D.getDDJ11_BZGG1()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_BZGG2() != null
					&& !dFW01_D.getDDJ11_BZGG2().equals("")) {
				dFW01_D.setDDJ11_BZGG2(new String(dFW01_D.getDDJ11_BZGG2()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_BZGG3() != null
					&& !dFW01_D.getDDJ11_BZGG3().equals("")) {
				dFW01_D.setDDJ11_BZGG3(new String(dFW01_D.getDDJ11_BZGG3()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getDDJ11_BZGG4() != null
					&& !dFW01_D.getDDJ11_BZGG4().equals("")) {
				dFW01_D.setDDJ11_BZGG4(new String(dFW01_D.getDDJ11_BZGG4()
						.getBytes("ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getZW_MC() != null && !dFW01_D.getZW_MC().equals("")) {
				dFW01_D.setZW_MC(new String(dFW01_D.getZW_MC().getBytes(
						"ISO8859-1"), "GBK"));
			}
			if (dFW01_D.getSFJE() == null) {
				dFW01_D.setSFJE(0.0);
			}
			if (dFW01_D.getDDJ11_DJ1() == null) {
				dFW01_D.setDDJ11_DJ1(0.0);
			}
			if (dFW01_D.getDDJ11_DJ2() == null) {
				dFW01_D.setDDJ11_DJ2(0.0);
			}
			if (dFW01_D.getDDJ11_DJ3() == null) {
				dFW01_D.setDDJ11_DJ3(0.0);
			}
			if (dFW01_D.getDDJ11_DJ4() == null) {
				dFW01_D.setDDJ11_DJ4(0.0);
			}
			if (dFW01_D.getSYL1() == null) {
				dFW01_D.setSYL1(0.0);
			}
			if (dFW01_D.getSYL2() == null) {
				dFW01_D.setSYL2(0.0);
			}
			if (dFW01_D.getSYL3() == null) {
				dFW01_D.setSYL3(0.0);
			}
			if (dFW01_D.getSYL4() == null) {
				dFW01_D.setSYL4(0.0);
			}
			// 更新地块信息
			dFW01_DService.upDkxx(dFW01_D);
			// 更新金钱
			double OldMonney = 0;
			double FatherMonney = 0;
			if (request.getParameter("OldMonney") != null
					&& !request.getParameter("OldMonney").equals("")) {
				OldMonney = Double.parseDouble(request
						.getParameter("OldMonney"));
			}
			if (request.getParameter("FatherMonney") != null
					&& !request.getParameter("FatherMonney").equals("")) {
				FatherMonney = Double.parseDouble(request
						.getParameter("FatherMonney"));
			}
			if (OldMonney != dFW01_D.getSFJE()) {
				DFW01 dFW01 = new DFW01();
				dFW01.setJFID(dFW01_D.getDFW01_JFID());
				dFW01.setSFJE(FatherMonney - OldMonney + dFW01_D.getSFJE());
				dFW01Service.UPJE(dFW01);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String JFID = request.getParameter("JFID");
		User user = (User) request.getSession().getAttribute("user");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("psi_jfid", JFID);
		map.put("psi_lrry", user.getJFID());
		map.put("psi_lrry_mc", user.getJFNAME());
		dFW01_DService.p_gddk_wg(map);
		String msg = (String) map.get("pso_return");
		String msgs = (String) map.get("pso_reason");
		model.addAttribute("id", dFW01_D.getDFW01_JFID());
		if (!msg.equals("0")) {
			model.addAttribute("JFID", dFW01_D.getJFID());
			try {
				request.getSession().setAttribute("msg",
						java.net.URLEncoder.encode(msgs, "GBK"));
				// model.addAttribute("msg",java.net.URLEncoder.encode(msgs,"GBK"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return "redirect:/ordergd/gotodkup.do";
		}
		model.addAttribute("msg", msgs);
		return "redirect:/ordergd/gotoup.do";
	}

	@RequestMapping(value = "/gotodklabelWG.do")
	public String gotodklabelWG(HttpServletRequest request,
			@ModelAttribute("msg") String msg) {
		try {
			if (request.getSession().getAttribute("msg") != null
					&& !request.getSession().getAttribute("msg").equals("")) {
				request.setAttribute("msgN", java.net.URLDecoder.decode(
						(String) request.getSession().getAttribute("msg"),
						"GBK"));
				request.getSession().removeAttribute("msg");
			}
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
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
		// List<DFW01_D_ZP> listdfw01_d_zp = dFW01_D_ZPService.SelectBYDK(JFID);
		// request.setAttribute("listdfw01_d_zp", listdfw01_d_zp);
		return "jf_dfw01_dk_label_GD_WG";
	}

	@RequestMapping(value = "/dkzf.do")
	public String dkzf(HttpServletRequest request, Model model) {
		String JFID = request.getParameter("JFID");
		User user = (User) request.getSession().getAttribute("user");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("psi_jfid", JFID);
		map.put("psi_lrry", user.getJFID());
		map.put("psi_lrry_mc", user.getJFNAME());
		dFW01_DService.P_gddk_zf(map);
		String msg = (String) map.get("pso_reason");
		model.addAttribute("JFID", JFID);
		if (!msg.equals("OK")) {
			try {
				request.getSession().setAttribute("msg",
						java.net.URLEncoder.encode(msg, "GBK"));
				// model.addAttribute("msg",java.net.URLEncoder.encode(msg,"GBK"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return "redirect:/ordergd/gotodkup.do";
		}
		model.addAttribute("msg", msg);
		return "redirect:/ordergd/gotodklabelWG.do";
	}

	@RequestMapping(value = "/zbwg.do")
	public String zbwg(HttpServletRequest request, Model model,
			HttpServletResponse response, DFW01 dFW01) {
		String JFID = request.getParameter("JFID");
		model.addAttribute("id", JFID);
		User user = (User) request.getSession().getAttribute("user");
		try {
			dFW01.setDDJ02_MC(new String(dFW01.getDDJ02_MC().getBytes(
					"ISO8859-1"), "GBK"));
			dFW01.setDDJ02_DZ(new String(dFW01.getDDJ02_DZ().getBytes(
					"ISO8859-1"), "GBK"));
			dFW01.setFZFZR_MC(new String(dFW01.getFZFZR_MC().getBytes(
					"ISO8859-1"), "GBK"));
			if (dFW01.getPDSM() != null && !dFW01.getPDSM().equals("")) {
				dFW01.setPDSM(new String(dFW01.getPDSM().getBytes("ISO8859-1"),
						"GBK"));
			} else {
				dFW01.setPDSM("");
			}
			if (dFW01.getPDRY_MC() != null && !dFW01.getPDRY_MC().equals("")) {
				dFW01.setPDRY_MC(new String(dFW01.getPDRY_MC().getBytes(
						"ISO8859-1"), "GBK"));
			} else {
				dFW01.setPDRY_MC("");
			}
			if (dFW01.getBZ() != null && !dFW01.getBZ().equals("")) {
				dFW01.setBZ(new String(dFW01.getBZ().getBytes("ISO8859-1"),
						"GBK"));
			} else {
				dFW01.setBZ("");
			}
			if (dFW01.getFZRY_MC() != null && !dFW01.getFZFZR_MC().equals("")) {
				dFW01.setFZRY_MC(new String(dFW01.getFZRY_MC().getBytes(
						"ISO8859-1"), "GBK"));
			} else {
				dFW01.setFZRY_MC("");
			}
			if (dFW01.getFZRY() != null && !dFW01.getFZRY().equals("")) {
				dFW01.setFZRS(dFW01.getFZRY().split(",").length + 1);
			} else {
				dFW01.setFZRS(1);
			}
			if (!request.getParameter("OLDDDJ02_JFID").equals(
					dFW01.getDDJ02_JFID())) {
				dFW01_DService.DelBYFW01ID(dFW01.getJFID());
				dFW01.setSFJE(0);
			}
			dFW01Service.updfw01(dFW01);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("psi_cllb", "1");
			map.put("psi_jfid", JFID);
			map.put("psi_lrry", user.getJFID());
			map.put("psi_lrry_mc", user.getJFNAME());
			dFW01Service.P_gd_wg(map);
			String msg = (String) map.get("pso_return");
			String msgxx = (String) map.get("pso_reason");
			if (!msg.equals("0")) {
				request.getSession().setAttribute("msg",
						java.net.URLEncoder.encode(msgxx, "GBK"));
				return "redirect:/ordergd/gotoup.do";
			}
			// 发送推送消息
			List<DDJ01> listddj01 = dDJ01Service.SelectByDD01ID(user
					.getDDJ01_JFID());
			DDJ02 dDJ02 = dDJ02Service.SelectByID(dFW01.getDDJ02_JFID()).get(0);
			String SZ_LB = user.getXXDBLB();
			String SZ_JFID = user.getJFID();
			String SZ_MC = "";
			if (user.getXXDBLB().equals("3")) {
				SZ_MC = listddj01.get(0).getMC();
			} else if (user.getXXDBLB().equals("4")) {
				SZ_MC = listddj01.get(0).getMC() + ":" + user.getJFNAME();
			}
			String SZ_TX_LJ = user.getZPLJ();
			String DF_LB = "6";
			String DF_JFID = dFW01.getDDJ02_JFID();
			String DF_MC = dFW01.getDDJ02_MC();
			String DF_TX_LJ = dDJ02.getZPLJ();
			String NR = "";
			if (dFW01.getFWNRLB().equals("01")) {
				NR = "本次全程服务作业已完成，请您在30日内对本次服务进行评价";
			}
			if (dFW01.getFWNRLB().equals("11")) {
				NR = "本次高效施药作业已完成，请您在10日内对本次服务进行评价";
			}
			if (dFW01.getFWNRLB().equals("21")) {
				NR = "本次土壤消毒作业已完成，请您在90日内对本次服务进行评价";
			}
			if (dFW01.getFWNRLB().equals("31")) {
				NR = "本次棚室消毒作业已完成，请您在45日内对本次服务进行评价";
			}
				DF_MC = new String(DF_MC.getBytes("ISO8859-1"), "GBK");
				//NR = new String(NR.getBytes("ISO8859-1"), "GBK");
			SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
			// 内存key
			String KEY = SZ_LB + "," + SZ_JFID;
			// mapkey
			String MAPKEY = SZ_LB + "," + SZ_JFID + "," + DF_LB + "," + DF_JFID;
			// 对方的内存key
			String KEY_DF = DF_LB + "," + DF_JFID;
			// 对方mapkey
			String MAPKEY_DF = DF_LB + "," + DF_JFID + "," + SZ_LB + ","
					+ SZ_JFID;
			if (eHCacheMSG.getCacheElement(KEY) == null) {
				List<DMSG> list = new ArrayList<DMSG>();
				DMSG dMSG = new DMSG();
				dMSG.setSZ_LB(SZ_LB);
				dMSG.setSZ_JFID(SZ_JFID);
				dMSG.setSZ_MC(SZ_MC);
				dMSG.setSZ_TX_LJ(SZ_TX_LJ);
				dMSG.setFS_RQ(sdf.format(new Date()));
				dMSG.setNR_LB("0");
				dMSG.setNR(NR);
				dMSG.setDF_LB(DF_LB);
				dMSG.setDF_JFID(DF_JFID);
				dMSG.setDF_MC(DF_MC);
				dMSG.setDF_TX_LJ(DF_TX_LJ);
				dMSG.setJLS_WEB(0);
				dMSG.setJLS_SJ(1);
				dMSG.setList(MAPKEY);
				dMSG.setFX("0");
				list.add(dMSG);
				eHCacheMSG.getCache().remove(KEY);
				eHCacheMSG.addToCache(KEY, JSONArray.fromObject(list)
						.toString(), true);
				List<DMSG_NR> listnr = new ArrayList<DMSG_NR>();
				DMSG_NR dMSG_NR = new DMSG_NR();
				dMSG_NR.setFS_RQ(sdf.format(new Date()));
				dMSG_NR.setNR(NR);
				dMSG_NR.setFX("0");
				listnr.add(dMSG_NR);
				ehcacheMSG_INFO.getCache().remove(MAPKEY);
				ehcacheMSG_INFO.addToCache(MAPKEY, JSONArray.fromObject(listnr)
						.toString(), true);
				// 插入其他人的
				if (eHCacheMSG.getCacheElement(KEY_DF) == null) {
					List<DMSG> listQT = new ArrayList<DMSG>();
					DMSG dMSGQT = new DMSG();
					dMSGQT.setSZ_LB(DF_LB);
					dMSGQT.setSZ_JFID(DF_JFID);
					dMSGQT.setSZ_MC(DF_MC);
					dMSGQT.setSZ_TX_LJ(DF_TX_LJ);
					dMSGQT.setFS_RQ(sdf.format(new Date()));
					dMSGQT.setNR_LB("0");
					dMSGQT.setNR(NR);
					dMSGQT.setDF_LB(SZ_LB);
					dMSGQT.setDF_JFID(SZ_JFID);
					dMSGQT.setDF_MC(SZ_MC);
					dMSGQT.setDF_TX_LJ(SZ_TX_LJ);
					dMSGQT.setJLS_WEB(1);
					dMSGQT.setJLS_SJ(1);
					dMSGQT.setFX("1");
					dMSGQT.setList(MAPKEY_DF);
					listQT.add(dMSGQT);
					eHCacheMSG.getCache().remove(KEY_DF);
					eHCacheMSG.addToCache(KEY_DF, JSONArray.fromObject(listQT)
							.toString(), true);
					List<DMSG_NR> listnrQT = new ArrayList<DMSG_NR>();
					DMSG_NR dMSG_NRQT = new DMSG_NR();
					dMSG_NRQT.setFS_RQ(sdf.format(new Date()));
					dMSG_NRQT.setNR(NR);
					dMSG_NRQT.setFX("1");
					listnrQT.add(dMSG_NRQT);
					ehcacheMSG_INFO.getCache().remove(MAPKEY_DF);
					ehcacheMSG_INFO.addToCache(MAPKEY_DF,
							JSONArray.fromObject(listnrQT).toString(), true);
				} else {
					boolean isAddQT = true;
					String str_DF = (String) eHCacheMSG.getCacheElement(KEY_DF);
					JSONArray array_DF = JSONArray.fromObject(str_DF);
					List<DMSG> listQT = JSONArray.toList(array_DF, DMSG.class);
					if (listQT.get(0) == null) {
						listQT = new ArrayList<DMSG>();
					}
					// 修改其他人
					if (eHCacheMSG.getCacheElement(KEY_DF) != null) {
						for (int i = 0; i < listQT.size(); i++) {
							if (listQT.get(i).getDF_JFID().equals(DF_JFID)
									&& listQT.get(i).getDF_LB().equals(DF_LB)
									|| listQT.get(i).getDF_JFID()
											.equals(SZ_JFID)
									&& listQT.get(i).getDF_LB().equals(SZ_LB)) {
								DMSG dMSGQT = listQT.get(i);
								listQT.remove(i);
								dMSGQT.setFS_RQ(sdf.format(new Date()));
								dMSGQT.setNR_LB("0");
								dMSGQT.setNR(NR);
								dMSGQT.setJLS_WEB(dMSGQT.getJLS_WEB() + 1);
								dMSGQT.setJLS_SJ(dMSGQT.getJLS_SJ() + 1);
								listQT.add(0, dMSGQT);
								eHCacheMSG.getCache().remove(KEY_DF);
								eHCacheMSG.addToCache(KEY_DF, JSONArray
										.fromObject(listQT).toString(), true);
								String str_info = (String) ehcacheMSG_INFO
										.getCacheElement(MAPKEY_DF);
								JSONArray arrayinfo = JSONArray
										.fromObject(str_info);
								List<DMSG_NR> listnrQT = JSONArray.toList(
										arrayinfo, DMSG_NR.class);
								DMSG_NR dMSG_NRQT = new DMSG_NR();
								dMSG_NRQT.setFS_RQ(sdf.format(new Date()));
								dMSG_NRQT.setNR(NR);
								dMSG_NRQT.setFX("1");
								listnrQT.add(dMSG_NRQT);
								ehcacheMSG_INFO.getCache().remove(MAPKEY_DF);
								ehcacheMSG_INFO.addToCache(MAPKEY_DF, JSONArray
										.fromObject(listnrQT).toString(), true);
								isAddQT = false;
								break;
							}
						}
					}
					// 判断是否要添加其他人
					if (isAddQT) {
						DMSG dMSGQT = new DMSG();
						dMSGQT.setSZ_LB(DF_LB);
						dMSGQT.setSZ_JFID(DF_JFID);
						dMSGQT.setSZ_MC(DF_MC);
						dMSGQT.setSZ_TX_LJ(DF_TX_LJ);
						dMSGQT.setFS_RQ(sdf.format(new Date()));
						dMSGQT.setNR_LB("0");
						dMSGQT.setNR(NR);
						dMSGQT.setDF_LB(SZ_LB);
						dMSGQT.setDF_JFID(SZ_JFID);
						dMSGQT.setDF_MC(SZ_MC);
						dMSGQT.setDF_TX_LJ(SZ_TX_LJ);
						dMSGQT.setJLS_WEB(1);
						dMSGQT.setJLS_SJ(1);
						dMSGQT.setFX("1");
						dMSGQT.setList(MAPKEY_DF);
						listQT.add(0, dMSGQT);
						eHCacheMSG.getCache().remove(KEY_DF);
						eHCacheMSG.addToCache(KEY_DF,
								JSONArray.fromObject(listQT).toString(), true);
						List<DMSG_NR> listnrQT = new ArrayList<DMSG_NR>();
						DMSG_NR dMSG_NRQT = new DMSG_NR();
						dMSG_NRQT.setFS_RQ(sdf.format(new Date()));
						dMSG_NRQT.setNR(NR);
						dMSG_NRQT.setFX("1");
						listnrQT.add(dMSG_NRQT);
						ehcacheMSG_INFO.getCache().remove(MAPKEY_DF);
						ehcacheMSG_INFO.addToCache(MAPKEY_DF, JSONArray
								.fromObject(listnrQT).toString(), true);
					}
				}
			} else {
				String str = (String) eHCacheMSG.getCacheElement(KEY);
				JSONArray array = JSONArray.fromObject(str);
				List<DMSG> list = JSONArray.toList(array, DMSG.class);
				boolean isAdd = true;
				for (int i = 0; i < list.size(); i++) {
					if (list.get(i).getDF_JFID().equals(DF_JFID)
							&& list.get(i).getDF_LB().equals(DF_LB)
							|| list.get(i).getDF_JFID().equals(SZ_JFID)
							&& list.get(i).getDF_LB().equals(SZ_LB)) {
						DMSG dMSG = list.get(i);
						list.remove(i);
						dMSG.setFS_RQ(sdf.format(new Date()));
						dMSG.setNR_LB("0");
						dMSG.setNR(NR);
						dMSG.setJLS_WEB(0);
						dMSG.setJLS_SJ(dMSG.getJLS_SJ() + 1);
						list.add(0, dMSG);
						eHCacheMSG.getCache().remove(KEY);
						eHCacheMSG.addToCache(KEY, JSONArray.fromObject(list)
								.toString(), true);
						String str_info = (String) ehcacheMSG_INFO
								.getCacheElement(MAPKEY);
						JSONArray arrayinfo = JSONArray.fromObject(str_info);
						List<DMSG_NR> listnr = JSONArray.toList(arrayinfo,
								DMSG_NR.class);
						DMSG_NR dMSG_NR = new DMSG_NR();
						dMSG_NR.setFS_RQ(sdf.format(new Date()));
						dMSG_NR.setNR(NR);
						dMSG_NR.setFX("0");
						listnr.add(dMSG_NR);
						ehcacheMSG_INFO.getCache().remove(MAPKEY);
						ehcacheMSG_INFO.addToCache(MAPKEY, JSONArray
								.fromObject(listnr).toString(), true);
						isAdd = false;
						break;
					}
				}
				// 判断是否要添加新对话
				if (isAdd) {
					DMSG dMSG = new DMSG();
					dMSG.setSZ_LB(SZ_LB);
					dMSG.setSZ_JFID(SZ_JFID);
					dMSG.setSZ_MC(SZ_MC);
					dMSG.setSZ_TX_LJ(SZ_TX_LJ);
					dMSG.setFS_RQ(sdf.format(new Date()));
					dMSG.setNR_LB("0");
					dMSG.setNR(NR);
					dMSG.setDF_LB(DF_LB);
					dMSG.setDF_JFID(DF_JFID);
					dMSG.setDF_MC(DF_MC);
					dMSG.setDF_TX_LJ(DF_TX_LJ);
					dMSG.setJLS_WEB(0);
					dMSG.setJLS_SJ(1);
					dMSG.setList(MAPKEY);
					dMSG.setFX("0");
					list.add(0, dMSG);
					eHCacheMSG.getCache().remove(KEY);
					eHCacheMSG.addToCache(KEY, JSONArray.fromObject(list)
							.toString(), true);
					List<DMSG_NR> listnr = new ArrayList<DMSG_NR>();
					DMSG_NR dMSG_NR = new DMSG_NR();
					dMSG_NR.setFS_RQ(sdf.format(new Date()));
					dMSG_NR.setNR(NR);
					dMSG_NR.setFX("0");
					listnr.add(dMSG_NR);
					ehcacheMSG_INFO.getCache().remove(MAPKEY);
					ehcacheMSG_INFO.addToCache(MAPKEY,
							JSONArray.fromObject(listnr).toString(), true);
				}
				boolean isAddQT = true;
				String str_DF = (String) eHCacheMSG.getCacheElement(KEY_DF);
				JSONArray array_DF = JSONArray.fromObject(str_DF);
				List<DMSG> listQT = JSONArray.toList(array_DF, DMSG.class);
				if (listQT.get(0) == null) {
					listQT = new ArrayList<DMSG>();
				}
				// 修改其他人
				if (eHCacheMSG.getCacheElement(KEY_DF) != null) {
					for (int i = 0; i < listQT.size(); i++) {
						if (listQT.get(i).getDF_JFID().equals(DF_JFID)
								&& listQT.get(i).getDF_LB().equals(DF_LB)
								|| listQT.get(i).getDF_JFID().equals(SZ_JFID)
								&& listQT.get(i).getDF_LB().equals(SZ_LB)) {
							DMSG dMSGQT = listQT.get(i);
							listQT.remove(i);
							dMSGQT.setFS_RQ(sdf.format(new Date()));
							dMSGQT.setNR_LB("0");
							dMSGQT.setNR(NR);
							dMSGQT.setJLS_WEB(dMSGQT.getJLS_WEB() + 1);
							dMSGQT.setJLS_SJ(dMSGQT.getJLS_SJ() + 1);
							listQT.add(0, dMSGQT);
							eHCacheMSG.getCache().remove(KEY_DF);
							eHCacheMSG.addToCache(KEY_DF,
									JSONArray.fromObject(listQT).toString(),
									true);
							String str_info = (String) ehcacheMSG_INFO
									.getCacheElement(MAPKEY_DF);
							JSONArray arrayinfo = JSONArray
									.fromObject(str_info);
							List<DMSG_NR> listnrQT = JSONArray.toList(
									arrayinfo, DMSG_NR.class);
							DMSG_NR dMSG_NRQT = new DMSG_NR();
							dMSG_NRQT.setFS_RQ(sdf.format(new Date()));
							dMSG_NRQT.setNR(NR);
							dMSG_NRQT.setFX("1");
							listnrQT.add(dMSG_NRQT);
							ehcacheMSG_INFO.getCache().remove(MAPKEY_DF);
							ehcacheMSG_INFO.addToCache(MAPKEY_DF, JSONArray
									.fromObject(listnrQT).toString(), true);
							isAddQT = false;
							break;
						}
					}
				}
				// 判断是否要添加其他人
				if (isAddQT) {
					DMSG dMSGQT = new DMSG();
					dMSGQT.setSZ_LB(DF_LB);
					dMSGQT.setSZ_JFID(DF_JFID);
					dMSGQT.setSZ_MC(DF_MC);
					dMSGQT.setSZ_TX_LJ(DF_TX_LJ);
					dMSGQT.setFS_RQ(sdf.format(new Date()));
					dMSGQT.setNR_LB("0");
					dMSGQT.setNR(NR);
					dMSGQT.setDF_LB(SZ_LB);
					dMSGQT.setDF_JFID(SZ_JFID);
					dMSGQT.setDF_MC(SZ_MC);
					dMSGQT.setDF_TX_LJ(SZ_TX_LJ);
					dMSGQT.setJLS_WEB(1);
					dMSGQT.setJLS_SJ(1);
					dMSGQT.setFX("1");
					dMSGQT.setList(MAPKEY_DF);
					listQT.add(0, dMSGQT);
					eHCacheMSG.getCache().remove(KEY_DF);
					eHCacheMSG.addToCache(KEY_DF, JSONArray.fromObject(listQT)
							.toString(), true);
					List<DMSG_NR> listnrQT = new ArrayList<DMSG_NR>();
					DMSG_NR dMSG_NRQT = new DMSG_NR();
					dMSG_NRQT.setFS_RQ(sdf.format(new Date()));
					dMSG_NRQT.setNR(NR);
					dMSG_NRQT.setFX("1");
					listnrQT.add(dMSG_NRQT);
					ehcacheMSG_INFO.getCache().remove(MAPKEY_DF);
					ehcacheMSG_INFO.addToCache(MAPKEY_DF,
							JSONArray.fromObject(listnrQT).toString(), true);
				}
			}
			// 推送结束
			model.addAttribute("msg", msgxx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/ordergd/gotolabel.do";
	}

	@RequestMapping(value = "/gotolabelWG.do")
	public String gotolabelWG(HttpServletRequest request, Model model,
			@ModelAttribute("msg") String msg) {
		try {
			request.setAttribute("msgN", java.net.URLDecoder.decode(msg, "GBK"));
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
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
		return "jf_dfw01_label_GD_WG";
	}

	@RequestMapping(value = "/deldkzp.do")
	public String deldkzp(HttpServletRequest request, Model model) {
		String JFID = request.getParameter("JFID");
		String JFIDdk = request.getParameter("JFIDdk");
		model.addAttribute("JFID", JFIDdk);
		model.addAttribute("SFJE", request.getParameter("SFJE"));
		model.addAttribute("DDJ02_JFID", request.getParameter("DDJ02_JFID"));
		model.addAttribute("FWNRLB", request.getParameter("FWNRLB"));
		dFW01_D_ZPService.delZP(JFID);
		return "redirect:/ordergd/gotodkup.do";
	}

	@RequestMapping(value = "/ckzp.do")
	public String ckzp(HttpServletRequest request) {
		String DFW01_D_JFID = request.getParameter("dfw01_d_jfid");
		List<DFW01_D_ZP> listdfw01_d_zp = dFW01_D_ZPService
				.SelectBYDK(DFW01_D_JFID);
		String YJPZ = "";
		String XCZY = "";
		String FZDX = "";
		String TSQK = "";
		for (int i = 0; i < listdfw01_d_zp.size(); i++) {
			if (listdfw01_d_zp.get(i).getLB().equals("0")) {
				YJPZ = "1";
			}
			if (listdfw01_d_zp.get(i).getLB().equals("1")) {
				XCZY = "1";
			}
			if (listdfw01_d_zp.get(i).getLB().equals("2")) {
				FZDX = "1";
			}
			if (listdfw01_d_zp.get(i).getLB().equals("3")) {
				TSQK = "1";
			}
		}
		request.setAttribute("YJPZ", YJPZ);
		request.setAttribute("XCZY", XCZY);
		request.setAttribute("FZDX", FZDX);
		request.setAttribute("TSQK", TSQK);
		request.setAttribute("listdfw01_d_zp", listdfw01_d_zp);
		return "ckzp";
	}
}
