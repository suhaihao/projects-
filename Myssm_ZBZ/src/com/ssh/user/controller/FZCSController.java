package com.ssh.user.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import oracle.sql.DATE;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.user.model.DDJ11;
import com.ssh.user.model.DDJ12;
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ11Service;
import com.ssh.user.service.DDJ12Service;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.util.EHCache;
import com.ssh.user.util.Page;

@Controller
@Scope("prototype")
@RequestMapping(value = "/fzcs")
public class FZCSController {
	@Autowired
	private DDJ11Service dDJ11Service;
	@Autowired
	private Dsys11Service dsys11Service;
	@Autowired
	private DDJ12Service dDJ12Service;
	private EHCache eHCache = new EHCache("ehcacheMenu");

	/**
	 * 查询防治措施的全部集合
	 */
	@RequestMapping(value = "/sel.do")
	public String getAllfzcsList(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		String MC = request.getParameter("MC");
		String FL = request.getParameter("FL");
		String ys = request.getParameter("page");
		Page page = null;
		if (ys == null) {
			if (MC == null && FL == null) {
				page = new Page(10,
						dDJ11Service.getCount(user.getDDJ01_JFID()), 1);
			} else {
				if (MC != null) {
					try {
						MC = new String(MC.getBytes("ISO8859-1"), "GBK");
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
				}
				page = new Page(10, dDJ11Service.getCountBYTJ(
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
				page = new Page(10, dDJ11Service.getCountBYTJ(
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
			List<DDJ11> listddj11 = dDJ11Service.selectByFlandName(page, MC,
					FL, user.getDDJ01_JFID());
			request.setAttribute("listddj11", listddj11);
		} else {
			List<DDJ11> listddj11 = dDJ11Service.selectAlllist(page,
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
		return "jf_ddj11";
	}

	/**
	 * 添加相关信息
	 */
	@RequestMapping(value = "/add.do")
	public String addfzzz(HttpServletRequest request) {
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
		return "jf_ddj11_add";
	}

	@RequestMapping(value = "/addfzcs.do")
	public String tjxx(DDJ11 dDJ11, HttpServletRequest request, Model model) {
		User user = (User) request.getSession().getAttribute("user");
		try {
			// 获取唯一id
			String id = dDJ11Service.getID();
			dDJ11.setJFID(id);
			dDJ11.setDDJ01_JFID(user.getDDJ01_JFID());
			dDJ11.setMC(new String(dDJ11.getMC().getBytes("ISO8859-1"), "GBK"));
			dDJ11.setBZGG(new String(dDJ11.getBZGG().getBytes("ISO8859-1"),
					"GBK"));
			if (dDJ11.getBZ() != null) {
				dDJ11.setBZ(new String(dDJ11.getBZ().getBytes("ISO8859-1"),
						"GBK"));
			}
			dDJ11.setLRRY(user.getJFID());
			dDJ11.setLRRYMC(user.getJFNAME());
			dDJ11.setLRRQ(new Date());
			dDJ11Service.inddj11(dDJ11);
			if (dDJ11.getZT().equals("1")) {
				model.addAttribute("id", dDJ11.getJFID());
				return "redirect:/fzcs/goup.do";
			}
			if (dDJ11.getZT().equals("2")) {
				DDJ12 dDJ12 = dDJ12Service.selectByName(dDJ11.getMC());
				dDJ12 = new DDJ12();
				dDJ12.setDDJ11_JFID(dDJ11.getJFID());
				String msg = dDJ12Service.inserddj12(dDJ12);
				model.addAttribute("msg",java.net.URLEncoder.encode(msg,"GBK"));
				if (msg.equals("OK")) {
					model.addAttribute("id", dDJ11.getJFID());
					return "redirect:/fzcs/qxck.do";
				} else {
					model.addAttribute("id", dDJ11.getJFID());
					return "redirect:/fzcs/goup.do";
				}
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/fzcs/sel.do";
	}

	/**
	 * 根据id删除一条数据
	 */
	@RequestMapping(value = "/del.do")
	public String delfzcs(HttpServletRequest request) {
		dDJ11Service.delddj11(request.getParameter("id"));
		return "redirect:/fzcs/sel.do";
	}

	/**
	 * 去往更新界面
	 */
	@RequestMapping(value = "/goup.do")
	public String gotoupfzcs(HttpServletRequest request,
			@ModelAttribute("id") String idc,@ModelAttribute("msg") String msg) {
		try {
			request.setAttribute("msgN",java.net.URLDecoder.decode(msg,"GBK"));
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
		String id = request.getParameter("id");
		if (id == null) {
			id = idc;
		}
		List<DDJ11> listddj11 = dDJ11Service.selectByid(id);
		DDJ11 dDJ11 = listddj11.get(0);
		Dsys11 dsys11 = dsys11Service.SeleBybm("FZCSFL", dDJ11.getFL());
		String bz1 = dsys11.getBZ1();
		String[] bz1s = bz1.split(",");
		List<Dsys11> lisdj = new ArrayList<Dsys11>();
		for (int i = 0; i < bz1s.length; i++) {
			dsys11 = dsys11Service.seletBbmDw(bz1s[i]);
			lisdj.add(dsys11);
		}
		request.setAttribute("lisdj", lisdj);
		request.setAttribute("listddj11", dDJ11);
		return "jf_ddj11_up";
	}

	/**
	 * 验证用户名是否重复
	 */
	@RequestMapping(value = "/yz.do")
	public void yzmc(HttpServletRequest request, HttpServletResponse response) {
		String MC = request.getParameter("MC");
		User user = (User) request.getSession().getAttribute("user");
		DDJ11 dDJ11 = dDJ11Service.selectByMc(MC, user.getDDJ01_JFID());
		if (dDJ11 != null) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("data", "1");
			try {
				response.getWriter().print(jsonObj);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 去往公共库
	 */
	@RequestMapping(value = "/ggk.do")
	public String goggk(HttpServletRequest request) {
		String MC = request.getParameter("MC");
		String FL = request.getParameter("FL");
		String ys = request.getParameter("page");
		Page page = null;
		if (ys == null) {
			page = new Page(10, dDJ12Service.getcount(), 1);
		} else {
			page = new Page(10, Integer.parseInt(request
					.getParameter("allSize")), Integer.parseInt(ys));
		}
		request.setAttribute("page", page);
		if (MC != null && !MC.equals("") || FL != null && !FL.equals("")) {
			if (MC != null && !MC.equals("")) {
				try {
					MC = new String(MC.getBytes("ISO8859-1"), "GBK");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				request.setAttribute("MC", MC);
			}
			if (FL != null && !FL.equals("")) {
				request.setAttribute("FL", FL);
			}
			List<DDJ12> listddj11 = dDJ12Service.SelectctByTJ(page, MC, FL);
			request.setAttribute("listddj11", listddj11);
		} else {
			List<DDJ12> listddj11 = dDJ12Service.SelectctAllList(page);
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
		return "jf_ddj12";
	}

	/**
	 * 根据选择查出对应的数据
	 */
	@RequestMapping(value = "/ggkcx.do")
	public String getByid(HttpServletRequest request) {
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
		String xz = request.getParameter("xz");
		DDJ12 dDJ12 = dDJ12Service.selsctByid(xz);
		Dsys11 dsys11 = dsys11Service.SeleBybm("FZCSFL", dDJ12.getFL());
		String bz1 = dsys11.getBZ1();
		String[] bz1s = bz1.split(",");
		List<Dsys11> lisdj = new ArrayList<Dsys11>();
		for (int i = 0; i < bz1s.length; i++) {
			dsys11 = dsys11Service.seletBbmDw(bz1s[i]);
			lisdj.add(dsys11);
		}
		request.setAttribute("lisdj", lisdj);
		request.setAttribute("dDJ12", dDJ12);
		return "jf_ddj12_add";
	}

	/**
	 * 更新验证
	 */
	@RequestMapping(value = "/upyz.do")
	public void upyzname(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		String mc = request.getParameter("mc");
		User user = (User) request.getSession().getAttribute("user");
		DDJ11 dDJ11 = dDJ11Service.selectByMcID(id, mc, user.getDDJ01_JFID());
		if (dDJ11 != null) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("data", "1");
			try {
				response.getWriter().print(jsonObj);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 更新对应数据
	 */
	@RequestMapping(value = "/upxj.do")
	public String genxinfzxx(DDJ11 dDJ11, Model model) {
		try {
			dDJ11.setMC(new String(dDJ11.getMC().getBytes("ISO8859-1"), "GBK"));
			dDJ11.setBZGG(new String(dDJ11.getBZGG().getBytes("ISO8859-1"),
					"GBK"));
			if (dDJ11.getBZ() != null && !dDJ11.getBZ().equals("")) {
				dDJ11.setBZ(new String(dDJ11.getBZ().getBytes("ISO8859-1"),
						"GBK"));
			} else {
				dDJ11.setBZ("");
			}
			dDJ11Service.upsj(dDJ11);
			if (dDJ11.getZT().equals("1")) {
				model.addAttribute("id", dDJ11.getJFID());
				return "redirect:/fzcs/goup.do";
			}
			if (dDJ11.getZT().equals("2")) {
				DDJ12 dDJ12 = dDJ12Service.selectByName(dDJ11.getMC());
				dDJ12 = new DDJ12();
				dDJ12.setDDJ11_JFID(dDJ11.getJFID());
				String msg = dDJ12Service.inserddj12(dDJ12);
				model.addAttribute("msg",java.net.URLEncoder.encode(msg,"GBK"));
				if (msg.equals("OK")) {
					model.addAttribute("id", dDJ11.getJFID());
					return "redirect:/fzcs/qxck.do";
				} else {
					model.addAttribute("id", dDJ11.getJFID());
					return "redirect:/fzcs/goup.do";
				}
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/fzcs/sel.do";
	}

	/**
	 * goto取消界面
	 */
	@RequestMapping(value = "/qxck.do")
	public String gotoqxjm(HttpServletRequest request,
			@ModelAttribute("id") String idc, @ModelAttribute("msg") String msg) {
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
		List<Dsys11> lisdj = dsys11Service.selectAllDj();
		request.setAttribute("lisdj", lisdj);
		String id = request.getParameter("id");
		if (id == null) {
			id = idc;
		}
		try {
			request.setAttribute("msgN",java.net.URLDecoder.decode(msg,"GBK"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<DDJ11> listddj11 = dDJ11Service.selectByid(id);
		request.setAttribute("listddj11", listddj11.get(0));
		return "jf_ddj11_label";
	}

	/**
	 * 取消提交更新字段
	 */
	@RequestMapping(value = "/qxup.do")
	public String qxtjgxzd(DDJ11 dDJ11) {
		String msg = dDJ11Service.qxup(dDJ11);
		return "redirect:/fzcs/sel.do";
	}

	/**
	 * 联动
	 */
	@RequestMapping(value = "/cxdw.do")
	public void cxdw(HttpServletRequest request, HttpServletResponse response) {
		String bm = request.getParameter("bm");
		Dsys11 dsys11 = dsys11Service.SeleBybm("FZCSFL", bm);
		String bz1 = dsys11.getBZ1();
		String[] bz1s = bz1.split(",");
		Map<String, String> maps = new HashMap<String, String>();
		for (int i = 0; i < bz1s.length; i++) {
			dsys11 = dsys11Service.seletBbmDw(bz1s[i]);
			maps.put(dsys11.getHZMC(), dsys11.getBM());
		}
		JSONObject jsonObj = JSONObject.fromObject(maps);
		try {
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(jsonObj);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
