package com.ssh.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.user.model.DDJ03;
import com.ssh.user.model.DFW01;
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.FWTJ;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ11Service;
import com.ssh.user.service.DFW01Service;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.util.EHCache;
import com.ssh.user.util.Page;

@Controller
@Scope("prototype")
@RequestMapping(value = "/fwtj")
public class FWTJController {
	@Autowired
	private Dsys11Service dsys11Service;
	@Autowired
	private DFW01Service dFW01Service;

	private EHCache eHCache = new EHCache("ehcacheMenu");

	@RequestMapping(value = "/sel.do")
	public String gotoIn(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("DDJ01_JFID", user.getDDJ01_JFID());
			String FZFZR_MC = request.getParameter("FZFZR_MC");
			if (FZFZR_MC != null) {
				FZFZR_MC = new String(FZFZR_MC.getBytes("ISO8859-1"), "GBK");
				request.setAttribute("FZFZR_MC", FZFZR_MC);
			}
			String FZFZR = request.getParameter("FZFZR");
			if (FZFZR != null) {
				request.setAttribute("FZFZR", FZFZR);
				map.put("FZFZR", FZFZR);
			}
			String DDJ02_MC = request.getParameter("DDJ02_MC");
			if (DDJ02_MC != null) {
				DDJ02_MC = new String(DDJ02_MC.getBytes("ISO8859-1"), "GBK");
				request.setAttribute("DDJ02_MC", DDJ02_MC);
			}
			String DDJ02_JFID = request.getParameter("DDJ02_JFID");
			if (DDJ02_JFID != null) {
				request.setAttribute("DDJ02_JFID", DDJ02_JFID);
				map.put("DDJ02_JFID", DDJ02_JFID);
			}
			String StarTime = request.getParameter("StarTime");
			if (StarTime != null) {
				request.setAttribute("StarTime", StarTime);
				map.put("StarTime", StarTime);
			}
			String EndTime = request.getParameter("EndTime");
			if (EndTime != null) {
				request.setAttribute("EndTime", EndTime);
				map.put("EndTime", EndTime);
			}
			String DDJ03_JFID = request.getParameter("DDJ03_JFID");
			if (DDJ03_JFID != null) {
				request.setAttribute("DDJ03_JFID", DDJ03_JFID);
				map.put("DDJ03_JFID", DDJ03_JFID);
			}
			String XZQHMC = request.getParameter("XZQHMC");
			if (XZQHMC != null) {
				XZQHMC = new String(XZQHMC.getBytes("ISO8859-1"), "GBK");
				request.setAttribute("XZQHMC", XZQHMC);
			}
			String XZQH = request.getParameter("XZQH");
			if (XZQH != null) {
				request.setAttribute("XZQH", XZQH);
				map.put("XZQH", XZQH);
			}
			String FWNRLB = request.getParameter("FWNRLB");
			if (FWNRLB != null) {
				request.setAttribute("FWNRLB", FWNRLB);
				map.put("FWNRLB", FWNRLB);
			}
			String bt = request.getParameter("bt");
			if (bt != null) {
				bt = new String(bt.getBytes("ISO8859-1"), "GBK");
				List<String> btlist = new ArrayList<String>();
				if (!bt.equals("")) {
					String[] bts = bt.split("!");
					for (int i = 0; i < bts.length; i++) {
						btlist.add(bts[i]);
					}
				}
				request.setAttribute("bt", btlist);
				request.setAttribute("jzbt", bt);
			}
			String sel = request.getParameter("sel");
			if (sel != null) {
				map.put("SEL", sel);
			}
			String group = request.getParameter("group");
			if (group != null && !group.equals("")) {
				String[] ssbm = group.split("ssbm");
				if (ssbm.length == 2) {
					group = ssbm[0] + ssbm[1];
				} else {
					group = ssbm[0];
				}
				String[] qxbm = group.split("qxbm");
				if (qxbm.length == 2) {
					group = qxbm[0] + qxbm[1];
				} else {
					group = qxbm[0];
				}
				String[] xzbm = group.split("xzbm");
				if (xzbm.length == 2) {
					group = xzbm[0] + xzbm[1];
				} else {
					group = xzbm[0];
				}
				map.put("GROUP", group);
			}
			String ids = request.getParameter("ids");
			if (ids != null) {
				String[] idsz = ids.split(",");
				List<String> idslist = new ArrayList<String>();
				for (int i = 0; i < idsz.length; i++) {
					idslist.add(idsz[i]);
				}
				request.setAttribute("ids", idslist);
			}
			if (ids != null && !ids.equals("")) {
				List<FWTJ> listfwtj = dFW01Service.TJSJ(map);
				request.setAttribute("listfwtj", listfwtj);
				FWTJ fWTJ = dFW01Service.TJSJHJ(map);
				request.setAttribute("fWTJ", fWTJ);
				request.setAttribute("idsfh", ids);
			}
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
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "jf_dfw01_tj";
	}

	@RequestMapping(value = "/djtj.do")
	public String djtj(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		String idsfh = request.getParameter("idsfh");
		request.setAttribute("idsfh", idsfh);
		String FZFZR = request.getParameter("FZFZR");
		request.setAttribute("FZFZR", FZFZR);
		String DDJ02_JFID = request.getParameter("DDJ02_JFID");
		request.setAttribute("DDJ02_JFID", DDJ02_JFID);
		String StarTime = request.getParameter("StarTime");
		request.setAttribute("StarTime", StarTime);
		String EndTime = request.getParameter("EndTime");
		request.setAttribute("EndTime", EndTime);
		String FWNRLB = request.getParameter("FWNRLB");
		request.setAttribute("FWNRLB", FWNRLB);
		String vals = request.getParameter("vals");
		request.setAttribute("vals", vals);
		String[] val = vals.split("!");
		String ys = request.getParameter("page");
		String[] ids = idsfh.split(",");
		String And = "";
		for (int i = 0; i < ids.length; i++) {
			if (ids[i].equals("n")) {
				And += " AND TO_CHAR(A.WCRQ,'yyyy')='" + val[0].split(",")[0]+"'";
			} else if (ids[i].equals("nj")) {
				And += " AND TO_CHAR(A.WCRQ,'yyyy-Q')='" + val[1].split(",")[0]+"'";
			} else if (ids[i].equals("ny")) {
				And += " AND TO_CHAR(A.WCRQ,'yyyy-mm')='" + val[2].split(",")[0]+"'";
			} else if (ids[i].equals("r")) {
				And += " AND TO_CHAR(A.WCRQ,'yyyy-mm-dd')='"
						+ val[3].split(",")[0]+"'";
			} else if (ids[i].equals("jd")) {
				And += " AND TO_CHAR(A.WCRQ,'Q')='" + val[4].split(",")[0]+"'";
			} else if (ids[i].equals("yf")) {
				And += " AND TO_CHAR(A.WCRQ,'mm')='" + val[5].split(",")[0]+"'";
			} else if (ids[i].equals("fwnr")) {
				And += " AND A.FWNRLB=" + val[6].split(",")[0];
			} else if (ids[i].equals("xm")) {
				And += " AND A.DDJ03_JFID=" + val[7].split(",")[0];
			} else if (ids[i].equals("fzfzrmc")) {
				And += " AND A.FZFZR=" + val[8].split(",")[0];
			} else if (ids[i].equals("ss")) {
				And += " AND SUBSTR(c.XZQH,1,5)=" + val[9].split(",")[0];
			} else if (ids[i].equals("qx")) {
				And += " AND SUBSTR(c.XZQH,1,7)=" + val[10].split(",")[0];
			} else if (ids[i].equals("xz")) {
				And += " AND SUBSTR(c.XZQH,1,9)=" + val[11].split(",")[0];
			} else if (ids[i].equals("yh")) {
				And += " AND A.DDJ02_JFID=" + val[12].split(",")[0];
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("DDJ01_JFID", user.getDDJ01_JFID());
		map.put("And", And);
		Page page = null;
		if (ys == null) {
			if (FZFZR != null) {
				map.put("FZFZR", FZFZR);
			}
			if (DDJ02_JFID != null) {
				map.put("DDJ02_JFID", DDJ02_JFID);
			}
			if (StarTime != null) {
				map.put("StarTime", StarTime);
			}
			if (EndTime != null) {
				map.put("EndTime", EndTime);
			}
			if (FWNRLB != null) {
				map.put("FWNRLB", FWNRLB);
			}
			page = new Page(10, dFW01Service.getcounTJSJclick(map), 1);
		} else {
			if (FZFZR != null) {
				map.put("FZFZR", FZFZR);
			}
			if (DDJ02_JFID != null) {
				map.put("DDJ02_JFID", DDJ02_JFID);
			}
			if (StarTime != null) {
				map.put("StarTime", StarTime);
			}
			if (EndTime != null) {
				map.put("EndTime", EndTime);
			}
			if (FWNRLB != null) {
				map.put("FWNRLB", FWNRLB);
			}
			page = new Page(10, dFW01Service.getcounTJSJclick(map), 1);
		}
		request.setAttribute("page", page);
		map.put("MAX", page.getMax());
		map.put("MIN", page.getMin());
		List<DFW01> listdfw01 = dFW01Service.TJSJclick(map);
		request.setAttribute("listdfw01", listdfw01);
		return "jf_fwtj";
	}
}
