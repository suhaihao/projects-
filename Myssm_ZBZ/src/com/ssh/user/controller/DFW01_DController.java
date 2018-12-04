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
import com.ssh.user.model.DFW01_D;
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ02Service;
import com.ssh.user.service.DDJ02_DService;
import com.ssh.user.service.DFW01_DService;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.util.EHCache;
import com.ssh.user.util.Page;

@Controller
@Scope("prototype")
@RequestMapping(value = "/dkzz")
public class DFW01_DController {
	@Autowired
	private DDJ02_DService dDJ02_DService;
	@Autowired
	private DFW01_DService dFW01_DService;
	@Autowired
	private Dsys11Service dsys11Service;
	@Autowired
	private DDJ02Service dDJ02Service;
	private EHCache eHCache = new EHCache("ehcacheMenu_zbz");
	@RequestMapping(value = "/sel.do")
	public String seleByzfzz(HttpServletRequest request) {
		String DDJ02_D_DH = request.getParameter("DDJ02_D_DH");
		String DDJ02_D_JFID = request.getParameter("DDJ02_D_JFID");
		String StarTime = request.getParameter("StarTime");
		String EndTime = request.getParameter("EndTime");
		if (DDJ02_D_JFID != null && !DDJ02_D_JFID.equals("")) {
			try {
				DDJ02_D_DH = new String(DDJ02_D_DH.getBytes("ISO8859-1"), "GBK");
				request.setAttribute("DDJ02_D_JFID", DDJ02_D_JFID);
				request.setAttribute("DDJ02_D_DH", DDJ02_D_DH);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			DDJ02_D dDJ02_D = dDJ02_DService.SelectById(DDJ02_D_JFID);
			request.setAttribute("dDJ02_D", dDJ02_D);
			DDJ02 dDJ02 = dDJ02Service.SelectByID(dDJ02_D.getDDJ02_JFID()).get(
					0);
			request.setAttribute("dDJ02", dDJ02);
			Map<String,Object> map=new HashMap<String, Object>();
			map.put("DDJ02_D_JFID", DDJ02_D_JFID);
			if(StarTime!=null&&!StarTime.equals(""))
			{
				map.put("StarTime", StarTime);
				request.setAttribute("StarTime",StarTime);
			}
			if(EndTime!=null&&!EndTime.equals(""))
			{
				map.put("EndTime", EndTime);
				request.setAttribute("EndTime",EndTime);
			}
			List<DFW01_D> listdfw01_d = dFW01_DService
					.SelectByDDJ02_D_JFID(map);
			for (int i = 0; i < listdfw01_d.size(); i++) {
				if (listdfw01_d.get(i).getLSRQ().equals("-")) {
					listdfw01_d.get(i).setLSRQ("");
				}
				if (listdfw01_d.get(i).getFZRY_MC() != null
						&& !listdfw01_d.get(i).getFZRY_MC().equals("")) {
					listdfw01_d.get(i).setFZRY_MC(
							listdfw01_d
									.get(i)
									.getFZRY_MC()
									.substring(
											0,
											listdfw01_d.get(i).getFZRY_MC()
													.length() - 1));
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
		}
		return "jf_dfw01_d_serch";
	}

	@RequestMapping(value = "/seldk.do")
	public String seldk(HttpServletRequest request) {
		String DH = request.getParameter("DH");
		String DDJ02_MC=request.getParameter("DDJ02_MC");
		String DDJ02_JFID=request.getParameter("DDJ02_JFID");
		if (DH != null && !DH.equals("")) {
			try {
				DH = new String(DH.getBytes("ISO8859-1"), "GBK");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		if (DDJ02_MC != null && !DDJ02_MC.equals("")) {
			try {
				DDJ02_MC = new String(DDJ02_MC.getBytes("ISO8859-1"), "GBK");
				request.setAttribute("DDJ02_MC", DDJ02_MC);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		String ys = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
		Page page = null;
		if (ys == null) {
			if (DH != null) {
				map.put("DH", DH);
				request.setAttribute("DH", DH);
			}
			if (DDJ02_JFID != null) {
				map.put("DDJ02_JFID", DDJ02_JFID);
				request.setAttribute("DDJ02_JFID", DDJ02_JFID);
			}
			page = new Page(10, dDJ02_DService.GetAllNhDkCount(map), 1);
		} else {
			if (DH == null&&DDJ02_JFID==null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				if (DH != null) {
					map.put("DH", DH);
					request.setAttribute("DH", DH);
				}
				if (DDJ02_JFID != null) {
					map.put("DDJ02_JFID", DDJ02_JFID);
					request.setAttribute("DDJ02_JFID", DDJ02_JFID);
				}
				page = new Page(10, dDJ02_DService.GetAllNhDkCount(map), 1);
			}
		}
		request.setAttribute("page", page);
		map.put("MAX", page.getMax());
		map.put("MIN", page.getMin());
		List<DDJ02_D> listddj02_d = dDJ02_DService.SelectAllNhDk(map);
		request.setAttribute("listddj02_d", listddj02_d);
		return "users_zz_dk";
	}
}
