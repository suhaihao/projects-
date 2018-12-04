package com.ssh.user.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;

import com.jspsmart.upload.SmartUpload;
import com.ssh.user.model.DDJ01;
import com.ssh.user.model.DDJ02;
import com.ssh.user.model.DMSG;
import com.ssh.user.model.DMSG_NR;
import com.ssh.user.model.DSYS05;
import com.ssh.user.model.Dsys01;
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ01Service;
import com.ssh.user.service.DDJ02Service;
import com.ssh.user.service.DSYS05Service;
import com.ssh.user.service.Dsys01Service;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.service.UserService;
import com.ssh.user.util.CopeFile;
import com.ssh.user.util.EHCache;
import com.ssh.user.util.Page;

@Controller
@Scope("prototype")
@RequestMapping(value = "/onlin")
public class DMSGController implements ServletConfigAware, ServletContextAware {
	@Autowired
	private DDJ02Service dDJ02Service;
	@Autowired
	private UserService userService;
	@Autowired
	private DDJ01Service dDJ01Service;
	@Autowired
	private Dsys01Service dsys01Service;
	@Autowired
	private Dsys11Service dsys11Service;
	@Autowired
	private DSYS05Service dSYS05Service;

	private ServletContext servletContext;
	private ServletConfig servletConfig;
	private EHCache eHCache = new EHCache("ehcacheMenu_zbz");
	private EHCache eHCacheMSG = new EHCache("ehcacheMSG");
	private EHCache ehcacheMSG_INFO = new EHCache("ehcacheMSG_INFO");

	@Override
	public void setServletContext(ServletContext arg0) {
		this.servletContext = arg0;

	}

	@Override
	public void setServletConfig(ServletConfig arg0) {
		this.servletConfig = arg0;

	}

	@RequestMapping(value = "/sel.do")
	public String OnlinSel(HttpServletRequest request,
			HttpServletResponse response, Model model,
			@ModelAttribute("msg") String msg) {
		request.setAttribute("msg", msg);
		User user = (User) request.getSession().getAttribute("user");
		String KEY = user.getXXDBLB() + "," + user.getJFID();
		String str;
		try {
			str = (String) eHCacheMSG.getCacheElement(KEY);
			Page page = null;
			if (str != null) {
				JSONArray array = JSONArray.fromObject(str);
				List<DMSG> listdmsg = JSONArray.toList(array, DMSG.class);
				String ys = request.getParameter("page");
				if (ys == null) {
					page = new Page(10, listdmsg.size(), 1);
				} else {
					page = new Page(10, Integer.parseInt(request
							.getParameter("allSize")), Integer.parseInt(ys));
				}
				request.setAttribute("page", page);
				List<DMSG> listdNew = new ArrayList<DMSG>();
				for (int i = page.getMin() - 1; i < listdmsg.size(); i++) {
					listdNew.add(listdmsg.get(i));
					if (i - page.getMin() - 1 == 10) {
						break;
					}
				}
				request.setAttribute("listdmsg", listdNew);
			} else {
				page = new Page(10, 1, 1);
				request.setAttribute("page", page);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "jf_dmsg";
	}

	@RequestMapping(value = "/selNH.do")
	public String nhjh(HttpServletRequest request, HttpServletResponse response) {
		String MC = request.getParameter("MC");
		String DDJ01_JFID = request.getParameter("DDJ01_JFID");
		String DDJ01_MC = request.getParameter("DDJ01_MC");
		String XZQH = request.getParameter("XZQH");
		String XZQHMC = request.getParameter("XZQHMC");
		if (DDJ01_MC != null) {
			try {
				DDJ01_MC = new String(DDJ01_MC.getBytes("ISO8859-1"), "GBK");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			request.setAttribute("DDJ01_MC", DDJ01_MC);
		}
		if (XZQHMC != null) {
			try {
				XZQHMC = new String(XZQHMC.getBytes("ISO8859-1"), "GBK");
				request.setAttribute("XZQHMC", XZQHMC);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		String ys = request.getParameter("page");
		String dfw02 = request.getParameter("dfw02");
		if (dfw02 != null) {
			request.setAttribute("dfw02", dfw02);
		}
		Page page = null;
		if (ys == null) {
			if (MC != null) {
				map.put("MC", MC);
				request.setAttribute("MC", MC);
			}
			if (DDJ01_JFID != null) {
				map.put("DDJ01_JFID", DDJ01_JFID);
				request.setAttribute("DDJ01_JFID", DDJ01_JFID);
			}
			if (XZQH != null) {
				map.put("XZQH", XZQH);
				request.setAttribute("XZQH", XZQH);
			}
			page = new Page(10,dDJ02Service.getCountSelectAll(map), 1);
		} else {
			if (MC == null&&XZQH==null&&DDJ01_JFID==null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				if (MC != null) {
					map.put("MC", MC);
					request.setAttribute("MC", MC);
				}
				if (DDJ01_JFID != null) {
					map.put("DDJ01_JFID", DDJ01_JFID);
					request.setAttribute("DDJ01_JFID", DDJ01_JFID);
				}
				if (XZQH != null) {
					map.put("XZQH", XZQH);
					request.setAttribute("XZQH", XZQH);
				}
				page = new Page(10,dDJ02Service.getCountSelectAll(map),Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		map.put("max", page.getMax());
		map.put("min", page.getMin());
		List<DDJ02> listddj02 = dDJ02Service.SelectAll(map);
		request.setAttribute("listddj02", listddj02);
		return "ddj02_add_MSG";
	}

	@RequestMapping(value = "/selZFZZandRY.do")
	public String selZFZZandRY(HttpServletRequest request,
			HttpServletResponse response) {
		String JFID = request.getParameter("JFID");
		User user = (User) request.getSession().getAttribute("user");
		String JFNAME = request.getParameter("JFNAME");
		if (JFNAME != null && !JFNAME.equals("")) {
			try {
				JFNAME = new String(JFNAME.getBytes("ISO8859-1"), "GBK");
				request.setAttribute("JFNAME", JFNAME);
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}
		String XXDBLB = request.getParameter("XXDBLB");
		String DDJ01_JFID = request.getParameter("DDJ01_JFID");
		if (DDJ01_JFID == null) {
			DDJ01_JFID = user.getDDJ01_JFID();
		}
		String ys = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
		Page page = null;
		if (ys == null) {
			if (JFNAME != null) {
				map.put("JFNAME", JFNAME);
				request.setAttribute("JFNAME", JFNAME);
			}
			if (JFID != null) {
				map.put("JFID", JFID);
				request.setAttribute("JFID", JFID);
			}
			if (XXDBLB != null) {
				map.put("XXDBLB", XXDBLB);
				request.setAttribute("XXDBLB", XXDBLB);
			}
			if (DDJ01_JFID != null) {
				map.put("DDJ01_JFID", DDJ01_JFID);
				request.setAttribute("DDJ01_JFID", DDJ01_JFID);
			}
			page = new Page(10, userService.getCountAllSize(map), 1);
		} else {
			if (JFNAME == null && DDJ01_JFID == null && XXDBLB == null
					&& JFID == null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				if (JFNAME != null) {
					map.put("JFNAME", JFNAME);
					request.setAttribute("JFNAME", JFNAME);
				}
				if (XXDBLB != null) {
					map.put("XXDBLB", XXDBLB);
					request.setAttribute("XXDBLB", XXDBLB);
				}
				if (DDJ01_JFID != null) {
					map.put("DDJ01_JFID", DDJ01_JFID);
					request.setAttribute("DDJ01_JFID", DDJ01_JFID);
				}
				if (JFID != null) {
					map.put("JFID", JFID);
					request.setAttribute("JFID", JFID);
				}
				page = new Page(10, userService.getCountAllSize(map),
						Integer.parseInt(ys));
			}

		}
		request.setAttribute("page", page);
		map.put("MAX", page.getMax());
		map.put("MIN", page.getMin());
		List<User> listUser = userService.SelectAllList(map);
		request.setAttribute("listUser", listUser);
		List<DDJ01> listddj01 = dDJ01Service.SelectAlllSize();
		request.setAttribute("listddj01", listddj01);
		return "users_add_MSG";
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
		List<DDJ01> listddj01 = dDJ01Service.SelectAllZFZZ(map);
		request.setAttribute("listddj01", listddj01);
		return "users_add_MSG_ZFZZ";
	}

	@RequestMapping(value = "/selZFYR.do")
	public void selZFYR(HttpServletRequest request, HttpServletResponse response) {
		String DDJ01_JFID = request.getParameter("id");
		String MC = request.getParameter("mc");
		String XXDBLB = "3";
		Map<String, Object> map = new HashMap<String, Object>();
		if (XXDBLB != null) {
			map.put("XXDBLB", XXDBLB);
		}
		if (DDJ01_JFID != null) {
			map.put("DDJ01_JFID", DDJ01_JFID);
		}
		map.put("MAX", 10);
		map.put("MIN", 1);
		List<User> listUser = userService.SelectAllList(map);
		if (listUser.size() >= 1) {
			User user = listUser.get(0);
			String str = user.getJFID() + "," + MC + "," + user.getXXDBLB()
					+ "," + user.getZPLJ();
			try {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().println(str);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().println("0");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selZBZandRY.do")
	public String selZBZandRY(HttpServletRequest request,
			HttpServletResponse response) {
		String JFNAME = request.getParameter("JFNAME");
		if (JFNAME != null && !JFNAME.equals("")) {
			try {
				JFNAME = new String(JFNAME.getBytes("ISO8859-1"), "GBK");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		String RYFL = request.getParameter("RYFL");
		String XXDBLB = request.getParameter("XXDBLB");

		String ys = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
		Page page = null;
		if (ys == null) {
			if (JFNAME != null) {
				map.put("JFNAME", JFNAME);
				request.setAttribute("JFNAME", JFNAME);
			}
			if (RYFL != null) {
				map.put("RYFL", RYFL);
				request.setAttribute("RYFL", RYFL);
			}
			if (XXDBLB != null) {
				map.put("XXDBLB", XXDBLB);
				request.setAttribute("XXDBLB", XXDBLB);
			}
			page = new Page(10, dsys01Service.GetCount(map), 1);
		} else {
			if (JFNAME != null) {
				map.put("JFNAME", JFNAME);
				request.setAttribute("JFNAME", JFNAME);
			}
			if (RYFL != null) {
				map.put("RYFL", RYFL);
				request.setAttribute("RYFL", RYFL);
			}
			if (XXDBLB != null) {
				map.put("XXDBLB", XXDBLB);
				request.setAttribute("XXDBLB", XXDBLB);
			}
			page = new Page(10, dsys01Service.GetCount(map),
					Integer.parseInt(ys));
		}
		request.setAttribute("page", page);
		map.put("MAX", page.getMax());
		map.put("MIN", page.getMin());
		if (XXDBLB.equals("0")) {
			List<Dsys01> listdsys01 = dsys01Service.SelectAllPage_ZBZ(map);
			for (int i = 0; i < listdsys01.size(); i++) {
				listdsys01.get(i).setJFDSYS05_CODE(
						listdsys01.get(i).getJFDSYS05_CODE() + "植保站");
			}
			request.setAttribute("listdsys01", listdsys01);
		} else {
			List<Dsys01> listdsys01 = dsys01Service.SelectAllPage(map);
			request.setAttribute("listdsys01", listdsys01);
		}
		try {
			if (eHCache.getCacheElement("listzj_rylb") == null) {
				List<Dsys11> listzj_rylb = dsys11Service
						.SelecetAllBM("ZJ_RYLB");
				request.setAttribute("listzj_rylb", listzj_rylb);
				eHCache.addToCache("listzj_rylb", listzj_rylb, false);
			} else {
				List<Dsys11> listzj_rylb;
				listzj_rylb = (List<Dsys11>) eHCache
						.getCacheElement("listzj_rylb");
				request.setAttribute("listzj_rylb", listzj_rylb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "users_zbz_MSG";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/addmsg.do")
	public String addMSG(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		try {
			if (request.getParameter("DF_JFID") != null) {
				User user = (User) request.getSession().getAttribute("user");
				DSYS05 dSYS05 = dSYS05Service.SelectByBM(user
						.getJFDSYS05_CODE());
				String SZ_LB = user.getXXDBLB();
				String SZ_JFID = user.getJFID() + "";
				String SZ_MC = "";
				if (user.getXXDBLB().equals("0")) {
					SZ_MC = dSYS05.getText() + "植保站";
				} else if (user.getXXDBLB().equals("1")) {
					SZ_MC = dSYS05.getText() + "植保站" + ":" + user.getJFNAME();
				}
				String SZ_TX_LJ = user.getZPLJ();
				String DF_LB = request.getParameter("DF_LB");
				String DF_JFID = request.getParameter("DF_JFID");
				String DF_MC = request.getParameter("DF_MC");
				String DF_TX_LJ = request.getParameter("DF_TX_LJ");
				String NR = request.getParameter("NR");
				try {
					DF_MC = new String(DF_MC.getBytes("ISO8859-1"), "GBK");
					NR = new String(NR.getBytes("ISO8859-1"), "GBK");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
				// 内存key
				String KEY = SZ_LB + "," + SZ_JFID;
				// mapkey
				String MAPKEY = SZ_LB + "," + SZ_JFID + "," + DF_LB + ","
						+ DF_JFID;
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
					ehcacheMSG_INFO.addToCache(MAPKEY,
							JSONArray.fromObject(listnr).toString(), true);
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
					} else {
						boolean isAddQT = true;
						String str_DF = (String) eHCacheMSG
								.getCacheElement(KEY_DF);
						JSONArray array_DF = JSONArray.fromObject(str_DF);
						List<DMSG> listQT = JSONArray.toList(array_DF,
								DMSG.class);
						if (listQT.get(0) == null) {
							listQT = new ArrayList<DMSG>();
						}
						// 修改其他人
						if (eHCacheMSG.getCacheElement(KEY_DF) != null) {
							for (int i = 0; i < listQT.size(); i++) {
								if (listQT.get(i).getDF_JFID().equals(DF_JFID)
										&& listQT.get(i).getDF_LB()
												.equals(DF_LB)
										|| listQT.get(i).getDF_JFID()
												.equals(SZ_JFID)
										&& listQT.get(i).getDF_LB()
												.equals(SZ_LB)) {
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
											.fromObject(listQT).toString(),
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
									ehcacheMSG_INFO.addToCache(MAPKEY_DF,
											JSONArray.fromObject(listnrQT)
													.toString(), true);
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
									JSONArray.fromObject(listQT).toString(),
									true);
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
							//修改
							eHCacheMSG.getCache().remove(KEY);
							eHCacheMSG
									.addToCache(KEY, JSONArray.fromObject(list)
											.toString(), true);
							String str_info = (String) ehcacheMSG_INFO
									.getCacheElement(MAPKEY);
							JSONArray arrayinfo = JSONArray
									.fromObject(str_info);
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
						ehcacheMSG_INFO.addToCache(MAPKEY, JSONArray
								.fromObject(listnr).toString(), true);
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
								//修改
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
				// 上传的图片
				int maxFileSize = 2;// 兆
				String AllowedExtensions = ",.jpg,.jpeg,.gif,.png,";// 允许上传的文件类型
				Random rdm = new Random(System.currentTimeMillis());// 获得随机种子
				SmartUpload mySmartUpload = new SmartUpload();
				mySmartUpload.initialize(servletConfig, request, response);
				mySmartUpload.upload();
				String saveurl = "";
				String wjm = "";
				for (int i = 0; i < mySmartUpload.getFiles().getCount(); i++) {
					// 唯一文件名
					long time = Math.abs(rdm.nextInt()) % 1000000000;
					// 获取文件
					com.jspsmart.upload.File myfile = mySmartUpload.getFiles()
							.getFile(i);
					// 获取文件大小
					int filesize = myfile.getSize() / 1024 / 1024;
					// 获取文件名长度
					int len = myfile.getFileName().length();
					// 获取文件后缀
					if (len != 0) {
						String hz = myfile.getFileName().substring(
								myfile.getFileName().indexOf("."), len);
						// 获取文件名
						wjm = myfile.getFileName();
						if (filesize > maxFileSize) {
							model.addAttribute("msg", "1");
							return "redirect:/onlin/sel.do";
						}
						if (AllowedExtensions.indexOf(hz) == -1) {
							model.addAttribute("msg", "2");
							return "redirect:/onlin/sel.do";
						}
						myfile.saveAs("/assets/img/head/" + time + hz);
						CopeFile copeFile=new CopeFile();
						String oldPath=request.getSession().getServletContext().getRealPath("\\assets\\img\\head\\"+time + hz) ;
						String newPath=oldPath.split("Myssm_ZBZ")[0]+"Myssm"+oldPath.split("Myssm_ZBZ")[1];
						copeFile.copyFile(oldPath, newPath);
						saveurl = "//assets//img//head//" + time + hz;
						// 处理相关数据
						User user = (User) request.getSession().getAttribute(
								"user");
						DSYS05 dSYS05 = dSYS05Service.SelectByBM(user
								.getJFDSYS05_CODE());
						String SZ_LB = user.getXXDBLB();
						String SZ_JFID = user.getJFID() + "";
						String SZ_MC = "";
						if (user.getXXDBLB().equals("0")) {
							SZ_MC = dSYS05.getText() + "植保站";
						} else if (user.getXXDBLB().equals("1")) {
							SZ_MC = dSYS05.getText() + "植保站" + ":"
									+ user.getJFNAME();
						}
						String SZ_TX_LJ = user.getZPLJ();
						String DF_LB = mySmartUpload.getRequest().getParameter(
								"DF_LB");
						String DF_JFID = mySmartUpload.getRequest()
								.getParameter("DF_JFID");
						String DF_MC = mySmartUpload.getRequest().getParameter(
								"DF_MC");
						String DF_TX_LJ = mySmartUpload.getRequest()
								.getParameter("DF_TX_LJ");
						SimpleDateFormat sdf = new SimpleDateFormat(
								"yy-MM-dd HH:mm:ss");
						// 内存key
						String KEY = SZ_LB + "," + SZ_JFID;
						// mapkey
						String MAPKEY = SZ_LB + "," + SZ_JFID + "," + DF_LB
								+ "," + DF_JFID;
						// 对方的内存key
						String KEY_DF = DF_LB + "," + DF_JFID;
						// 对方mapkey
						String MAPKEY_DF = DF_LB + "," + DF_JFID + "," + SZ_LB
								+ "," + SZ_JFID;
						if (eHCacheMSG.getCacheElement(KEY) == null) {
							List<DMSG> list = new ArrayList<DMSG>();
							DMSG dMSG = new DMSG();
							dMSG.setSZ_LB(SZ_LB);
							dMSG.setSZ_JFID(SZ_JFID);
							dMSG.setSZ_MC(SZ_MC);
							dMSG.setSZ_TX_LJ(SZ_TX_LJ);
							dMSG.setFS_RQ(sdf.format(new Date()));
							dMSG.setNR_LB("1");
							dMSG.setNR("[图片]");
							dMSG.setTB_DZ(saveurl);
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
							eHCacheMSG
									.addToCache(KEY, JSONArray.fromObject(list)
											.toString(), true);
							List<DMSG_NR> listnr = new ArrayList<DMSG_NR>();
							DMSG_NR dMSG_NR = new DMSG_NR();
							dMSG_NR.setFS_RQ(sdf.format(new Date()));
							dMSG_NR.setTB_DZ(saveurl);
							dMSG_NR.setFX("0");
							listnr.add(dMSG_NR);
							ehcacheMSG_INFO.getCache().remove(MAPKEY);
							ehcacheMSG_INFO.addToCache(MAPKEY, JSONArray
									.fromObject(listnr).toString(), true);
							// 插入其他人的
							if (eHCacheMSG.getCacheElement(KEY_DF) == null) {
								List<DMSG> listQT = new ArrayList<DMSG>();
								DMSG dMSGQT = new DMSG();
								dMSGQT.setSZ_LB(DF_LB);
								dMSGQT.setSZ_JFID(DF_JFID);
								dMSGQT.setSZ_MC(DF_MC);
								dMSGQT.setSZ_TX_LJ(DF_TX_LJ);
								dMSGQT.setFS_RQ(sdf.format(new Date()));
								dMSGQT.setNR_LB("1");
								dMSGQT.setNR("[图片]");
								dMSGQT.setTB_DZ(saveurl);
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
								eHCacheMSG.addToCache(KEY_DF, JSONArray
										.fromObject(listQT).toString(), true);
								List<DMSG_NR> listnrQT = new ArrayList<DMSG_NR>();
								DMSG_NR dMSG_NRQT = new DMSG_NR();
								dMSG_NRQT.setFS_RQ(sdf.format(new Date()));
								dMSG_NRQT.setTB_DZ(saveurl);
								dMSG_NRQT.setFX("1");
								listnrQT.add(dMSG_NRQT);
								ehcacheMSG_INFO.getCache().remove(MAPKEY_DF);
								ehcacheMSG_INFO.addToCache(MAPKEY_DF, JSONArray
										.fromObject(listnrQT).toString(), true);
							} else {
								String str_DF = (String) eHCacheMSG
										.getCacheElement(KEY_DF);
								JSONArray array_DF = JSONArray
										.fromObject(str_DF);
								List<DMSG> listQT = JSONArray.toList(array_DF,
										DMSG.class);
								if (listQT.get(0) == null) {
									listQT = new ArrayList<DMSG>();
								}
								boolean isAddQT = true;
								// 修改其他人
								if (eHCacheMSG.getCacheElement(KEY_DF) != null) {
									for (int i1 = 0; i1 < listQT.size(); i1++) {
										if (listQT.get(i1).getDF_JFID()
												.equals(DF_JFID)
												&& listQT.get(i1).getDF_LB()
														.equals(DF_LB)
												|| listQT.get(i1).getDF_JFID()
														.equals(SZ_JFID)
												&& listQT.get(i1).getDF_LB()
														.equals(SZ_LB)) {
											DMSG dMSGQT = listQT.get(i1);
											listQT.remove(i1);
											dMSGQT.setFS_RQ(sdf
													.format(new Date()));
											dMSGQT.setNR_LB("1");
											dMSGQT.setNR("[图片]");
											dMSGQT.setTB_DZ(saveurl);
											dMSGQT.setJLS_WEB(dMSGQT
													.getJLS_WEB() + 1);
											dMSGQT.setJLS_SJ(dMSGQT.getJLS_SJ() + 1);
											listQT.add(0, dMSGQT);
											eHCacheMSG.getCache().remove(KEY_DF);
											eHCacheMSG.addToCache(KEY_DF,
													JSONArray
															.fromObject(listQT)
															.toString(), true);
											String str_info = (String) ehcacheMSG_INFO
													.getCacheElement(MAPKEY_DF);
											JSONArray arrayinfo = JSONArray
													.fromObject(str_info);
											List<DMSG_NR> listnrQT = JSONArray
													.toList(arrayinfo,
															DMSG_NR.class);
											DMSG_NR dMSG_NRQT = new DMSG_NR();
											dMSG_NRQT.setFS_RQ(sdf
													.format(new Date()));
											dMSG_NRQT.setTB_DZ(saveurl);
											dMSG_NRQT.setFX("1");
											listnrQT.add(dMSG_NRQT);
											ehcacheMSG_INFO.getCache().remove(MAPKEY_DF);
											ehcacheMSG_INFO.addToCache(
													MAPKEY_DF,
													JSONArray.fromObject(
															listnrQT)
															.toString(), true);
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
									dMSGQT.setNR_LB("1");
									dMSGQT.setNR("[图片]");
									dMSGQT.setTB_DZ(saveurl);
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
									eHCacheMSG.addToCache(KEY_DF, JSONArray
											.fromObject(listQT).toString(),
											true);
									List<DMSG_NR> listnrQT = new ArrayList<DMSG_NR>();
									DMSG_NR dMSG_NRQT = new DMSG_NR();
									dMSG_NRQT.setFS_RQ(sdf.format(new Date()));
									dMSG_NRQT.setTB_DZ(saveurl);
									dMSG_NRQT.setFX("1");
									listnrQT.add(dMSG_NRQT);
									ehcacheMSG_INFO.getCache().remove(MAPKEY_DF);
									ehcacheMSG_INFO.addToCache(MAPKEY_DF,
											JSONArray.fromObject(listnrQT)
													.toString(), true);
								}
							}
						} else {
							String str = (String) eHCacheMSG
									.getCacheElement(KEY);
							JSONArray array = JSONArray.fromObject(str);
							List<DMSG> list = JSONArray.toList(array,
									DMSG.class);
							boolean isAdd = true;
							for (int i1 = 0; i1 < list.size(); i1++) {
								if (list.get(i1).getDF_JFID().equals(DF_JFID)
										&& list.get(i1).getDF_LB()
												.equals(DF_LB)
										|| list.get(i1).getDF_JFID()
												.equals(SZ_JFID)
										&& list.get(i1).getDF_LB()
												.equals(SZ_LB)) {
									DMSG dMSG = list.get(i1);
									list.remove(i1);
									dMSG.setFS_RQ(sdf.format(new Date()));
									dMSG.setNR_LB("1");
									dMSG.setNR("[图片]");
									dMSG.setTB_DZ(saveurl);
									dMSG.setJLS_WEB(0);
									dMSG.setJLS_SJ(dMSG.getJLS_SJ() + 1);
									list.add(0, dMSG);
									eHCacheMSG.getCache().remove(KEY);
									eHCacheMSG.addToCache(KEY, JSONArray
											.fromObject(list).toString(), true);
									String str_info = (String) ehcacheMSG_INFO
											.getCacheElement(MAPKEY);
									JSONArray arrayinfo = JSONArray
											.fromObject(str_info);
									List<DMSG_NR> listnr = JSONArray.toList(
											arrayinfo, DMSG_NR.class);
									DMSG_NR dMSG_NR = new DMSG_NR();
									dMSG_NR.setFS_RQ(sdf.format(new Date()));
									dMSG_NR.setTB_DZ(saveurl);
									dMSG_NR.setFX("0");
									listnr.add(dMSG_NR);
									ehcacheMSG_INFO.getCache().remove(MAPKEY);
									ehcacheMSG_INFO.addToCache(MAPKEY,
											JSONArray.fromObject(listnr)
													.toString(), true);
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
								dMSG.setNR_LB("1");
								dMSG.setNR("[图片]");
								dMSG.setTB_DZ(saveurl);
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
								eHCacheMSG.addToCache(KEY, JSONArray
										.fromObject(list).toString(), true);
								List<DMSG_NR> listnr = new ArrayList<DMSG_NR>();
								DMSG_NR dMSG_NR = new DMSG_NR();
								dMSG_NR.setFS_RQ(sdf.format(new Date()));
								dMSG_NR.setTB_DZ(saveurl);
								dMSG_NR.setFX("0");
								listnr.add(dMSG_NR);
								ehcacheMSG_INFO.getCache().remove(MAPKEY);
								ehcacheMSG_INFO.addToCache(MAPKEY, JSONArray
										.fromObject(listnr).toString(), true);
							}
							String str_DF = (String) eHCacheMSG
									.getCacheElement(KEY_DF);
							JSONArray array_DF = JSONArray.fromObject(str_DF);
							List<DMSG> listQT = JSONArray.toList(array_DF,
									DMSG.class);
							if (listQT.get(0) == null) {
								listQT = new ArrayList<DMSG>();
							}
							boolean isAddQT = true;
							// 修改其他人
							if (eHCacheMSG.getCacheElement(KEY_DF) != null) {
								for (int i1 = 0; i1 < listQT.size(); i1++) {
									if (listQT.get(i1).getDF_JFID()
											.equals(DF_JFID)
											&& listQT.get(i1).getDF_LB()
													.equals(DF_LB)
											|| listQT.get(i1).getDF_JFID()
													.equals(SZ_JFID)
											&& listQT.get(i1).getDF_LB()
													.equals(SZ_LB)) {
										DMSG dMSGQT = listQT.get(i1);
										listQT.remove(i1);
										dMSGQT.setFS_RQ(sdf.format(new Date()));
										dMSGQT.setNR_LB("1");
										dMSGQT.setNR("[图片]");
										dMSGQT.setTB_DZ(saveurl);
										dMSGQT.setJLS_WEB(dMSGQT.getJLS_WEB() + 1);
										dMSGQT.setJLS_SJ(dMSGQT.getJLS_SJ() + 1);
										listQT.add(0, dMSGQT);
										eHCacheMSG.getCache().remove(KEY_DF);
										eHCacheMSG.addToCache(KEY_DF, JSONArray
												.fromObject(listQT).toString(),
												true);
										String str_info = (String) ehcacheMSG_INFO
												.getCacheElement(MAPKEY_DF);
										JSONArray arrayinfo = JSONArray
												.fromObject(str_info);
										List<DMSG_NR> listnrQT = JSONArray
												.toList(arrayinfo,
														DMSG_NR.class);
										DMSG_NR dMSG_NRQT = new DMSG_NR();
										dMSG_NRQT.setFS_RQ(sdf
												.format(new Date()));
										dMSG_NRQT.setTB_DZ(saveurl);
										dMSG_NRQT.setFX("1");
										listnrQT.add(dMSG_NRQT);
										ehcacheMSG_INFO.getCache().remove(MAPKEY_DF);
										ehcacheMSG_INFO.addToCache(MAPKEY_DF,
												JSONArray.fromObject(listnrQT)
														.toString(), true);
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
								dMSGQT.setNR_LB("1");
								dMSGQT.setNR("[图片]");
								dMSGQT.setTB_DZ(saveurl);
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
								eHCacheMSG.addToCache(KEY_DF, JSONArray
										.fromObject(listQT).toString(), true);
								List<DMSG_NR> listnrQT = new ArrayList<DMSG_NR>();
								DMSG_NR dMSG_NRQT = new DMSG_NR();
								dMSG_NRQT.setFS_RQ(sdf.format(new Date()));
								dMSG_NRQT.setTB_DZ(saveurl);
								dMSG_NRQT.setFX("1");
								listnrQT.add(dMSG_NRQT);
								ehcacheMSG_INFO.getCache().remove(MAPKEY_DF);
								ehcacheMSG_INFO.addToCache(MAPKEY_DF, JSONArray
										.fromObject(listnrQT).toString(), true);
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/onlin/sel.do";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/msginfo.do")
	public String msginfo(HttpServletRequest request,
			HttpServletResponse response, Model model,
			@ModelAttribute("msg") String msg) {
		request.setAttribute("msg", msg);
		String list = request.getParameter("list");
		String SZ_LB = request.getParameter("SZ_LB");
		String SZ_JFID = request.getParameter("SZ_JFID");
		String SZ_TX_LJ = request.getParameter("SZ_TX_LJ");
		String DF_LB = request.getParameter("DF_LB");
		request.setAttribute("DF_LB", DF_LB);
		String DF_JFID = request.getParameter("DF_JFID");
		request.setAttribute("DF_JFID", DF_JFID);
		String DF_TX_LJ = request.getParameter("DF_TX_LJ");
		request.setAttribute("SZ_TX_LJ", SZ_TX_LJ);
		request.setAttribute("DF_TX_LJ", DF_TX_LJ);
		// 内存key
		String KEY = SZ_LB + "," + SZ_JFID;
		try {
			if (eHCacheMSG.getCacheElement(KEY) != null) {
				String str = (String) eHCacheMSG.getCacheElement(KEY);
				JSONArray array = JSONArray.fromObject(str);
				List<DMSG> list1 = JSONArray.toList(array, DMSG.class);
				for (int i = 0; i < list1.size(); i++) {
					if (list1.get(i).getDF_JFID().equals(DF_JFID)
							&& list1.get(i).getSZ_JFID().equals(SZ_JFID)) {
						DMSG dMSG = list1.get(i);
						list1.remove(i);
						dMSG.setJLS_WEB(0);
						request.setAttribute("SZ_MC", dMSG.getSZ_MC());
						request.setAttribute("DF_MC", dMSG.getDF_MC());
						list1.add(dMSG);
						eHCacheMSG.getCache().remove(KEY);
						eHCacheMSG.addToCache(KEY, JSONArray.fromObject(list1)
								.toString(), true);
						break;
					}
				}
			}
			String str = (String) ehcacheMSG_INFO.getCacheElement(list);
			JSONArray arrayinfo = JSONArray.fromObject(str);
			List<DMSG_NR> listnr = JSONArray.toList(arrayinfo, DMSG_NR.class);
			request.setAttribute("listnr", listnr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "jf_dmsg_INFO";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/msginfoadd.do")
	public String msginfoadd(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		try {
			if (request.getParameter("DF_JFID") != null) {
				User user = (User) request.getSession().getAttribute("user");
				String SZ_LB = user.getXXDBLB();
				model.addAttribute("SZ_LB", SZ_LB);
				String SZ_JFID = user.getJFID() + "";
				model.addAttribute("SZ_JFID", SZ_JFID);
				String SZ_MC = user.getJFNAME();
				model.addAttribute("SZ_MC", SZ_MC);
				String SZ_TX_LJ = user.getZPLJ();
				model.addAttribute("SZ_TX_LJ", SZ_TX_LJ);
				String DF_LB = request.getParameter("DF_LB");
				model.addAttribute("DF_LB", DF_LB);
				String DF_JFID = request.getParameter("DF_JFID");
				model.addAttribute("DF_JFID", DF_JFID);
				String DF_MC = request.getParameter("DF_MC");
				model.addAttribute("DF_MC", DF_MC);
				String DF_TX_LJ = request.getParameter("DF_TX_LJ");
				model.addAttribute("DF_TX_LJ", DF_TX_LJ);
				String NR = request.getParameter("NR");
				try {
					DF_MC = new String(DF_MC.getBytes("ISO8859-1"), "GBK");
					NR = new String(NR.getBytes("ISO8859-1"), "GBK");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
				// 内存key
				String KEY = SZ_LB + "," + SZ_JFID;
				// mapkey
				String MAPKEY = SZ_LB + "," + SZ_JFID + "," + DF_LB + ","
						+ DF_JFID;
				model.addAttribute("list", MAPKEY);
				// 对方的内存key
				String KEY_DF = DF_LB + "," + DF_JFID;
				// 对方mapkey
				String MAPKEY_DF = DF_LB + "," + DF_JFID + "," + SZ_LB + ","
						+ SZ_JFID;
				if (eHCacheMSG.getCacheElement(KEY) != null) {
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
							eHCacheMSG
									.addToCache(KEY, JSONArray.fromObject(list)
											.toString(), true);
							String str_info = (String) ehcacheMSG_INFO
									.getCacheElement(MAPKEY);
							JSONArray arrayinfo = JSONArray
									.fromObject(str_info);
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
					// 修改其他人
					if (eHCacheMSG.getCacheElement(KEY_DF) != null) {
						String str_DF = (String) eHCacheMSG
								.getCacheElement(KEY_DF);
						JSONArray array_DF = JSONArray.fromObject(str_DF);
						List<DMSG> listQT = JSONArray.toList(array_DF,
								DMSG.class);
						boolean isAddQT = true;
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
				}

			} else {
				// 上传的图片
				int maxFileSize = 2;// 兆
				String AllowedExtensions = ",.jpg,.jpeg,.gif,.png,";// 允许上传的文件类型
				Random rdm = new Random(System.currentTimeMillis());// 获得随机种子
				SmartUpload mySmartUpload = new SmartUpload();
				mySmartUpload.initialize(servletConfig, request, response);
				mySmartUpload.upload();
				String saveurl = "";
				String wjm = "";
				for (int i = 0; i < mySmartUpload.getFiles().getCount(); i++) {
					// 唯一文件名
					long time = Math.abs(rdm.nextInt()) % 1000000000;
					// 获取文件
					com.jspsmart.upload.File myfile = mySmartUpload.getFiles()
							.getFile(i);
					// 获取文件大小
					int filesize = myfile.getSize() / 1024 / 1024;
					// 获取文件名长度
					int len = myfile.getFileName().length();
					// 获取文件后缀
					if (len != 0) {
						String hz = myfile.getFileName().substring(
								myfile.getFileName().indexOf("."), len);
						// 获取文件名
						wjm = myfile.getFileName();
						if (filesize > maxFileSize) {
							model.addAttribute("msg", "1");
							return "redirect:/onlin/sel.do";
						}
						if (AllowedExtensions.indexOf(hz) == -1) {
							model.addAttribute("msg", "2");
							return "redirect:/onlin/sel.do";
						}
						myfile.saveAs("/assets/img/head/" + time + hz);
						CopeFile copeFile=new CopeFile();
						String oldPath=request.getSession().getServletContext().getRealPath("\\assets\\img\\head\\"+time + hz) ;
						String newPath=oldPath.split("Myssm_ZBZ")[0]+"Myssm"+oldPath.split("Myssm_ZBZ")[1];
						copeFile.copyFile(oldPath, newPath);
						saveurl = "//assets//img//head//" + time + hz;
						// 处理相关数据
						User user = (User) request.getSession().getAttribute(
								"user");
						String SZ_LB = user.getXXDBLB();
						model.addAttribute("SZ_LB", SZ_LB);
						String SZ_JFID = user.getJFID() + "";
						model.addAttribute("SZ_JFID", SZ_JFID);
						String SZ_MC = user.getJFNAME();
						model.addAttribute("SZ_MC", SZ_MC);
						String SZ_TX_LJ = user.getZPLJ();
						model.addAttribute("SZ_TX_LJ", SZ_TX_LJ);
						String DF_LB = mySmartUpload.getRequest().getParameter(
								"DF_LB");
						model.addAttribute("DF_LB", DF_LB);
						String DF_JFID = mySmartUpload.getRequest()
								.getParameter("DF_JFID");
						model.addAttribute("DF_JFID", DF_JFID);
						String DF_MC = mySmartUpload.getRequest().getParameter(
								"DF_MC");
						model.addAttribute("DF_MC", DF_MC);
						String DF_TX_LJ = mySmartUpload.getRequest()
								.getParameter("DF_TX_LJ");
						model.addAttribute("DF_TX_LJ", DF_TX_LJ);
						SimpleDateFormat sdf = new SimpleDateFormat(
								"yy-MM-dd HH:mm:ss");
						// 内存key
						String KEY = SZ_LB + "," + SZ_JFID;
						// mapkey
						String MAPKEY = SZ_LB + "," + SZ_JFID + "," + DF_LB
								+ "," + DF_JFID;
						model.addAttribute("list", MAPKEY);
						// 对方的内存key
						String KEY_DF = DF_LB + "," + DF_JFID;
						// 对方mapkey
						String MAPKEY_DF = DF_LB + "," + DF_JFID + "," + SZ_LB
								+ "," + SZ_JFID;
						if (eHCacheMSG.getCacheElement(KEY) != null) {
							String str = (String) eHCacheMSG
									.getCacheElement(KEY);
							JSONArray array = JSONArray.fromObject(str);
							List<DMSG> list = JSONArray.toList(array,
									DMSG.class);
							boolean isAdd = true;
							for (int i1 = 0; i1 < list.size(); i1++) {
								if (list.get(i1).getDF_JFID().equals(DF_JFID)
										&& list.get(i1).getDF_LB()
												.equals(DF_LB)
										|| list.get(i1).getDF_JFID()
												.equals(SZ_JFID)
										&& list.get(i1).getDF_LB()
												.equals(SZ_LB)) {
									DMSG dMSG = list.get(i1);
									list.remove(i1);
									dMSG.setFS_RQ(sdf.format(new Date()));
									dMSG.setNR_LB("1");
									dMSG.setNR("[图片]");
									dMSG.setTB_DZ(saveurl);
									dMSG.setJLS_WEB(0);
									dMSG.setJLS_SJ(dMSG.getJLS_SJ() + 1);
									list.add(0, dMSG);
									eHCacheMSG.getCache().remove(KEY);
									eHCacheMSG.addToCache(KEY, JSONArray
											.fromObject(list).toString(), true);
									String str_info = (String) ehcacheMSG_INFO
											.getCacheElement(MAPKEY);
									JSONArray arrayinfo = JSONArray
											.fromObject(str_info);
									List<DMSG_NR> listnr = JSONArray.toList(
											arrayinfo, DMSG_NR.class);
									DMSG_NR dMSG_NR = new DMSG_NR();
									dMSG_NR.setFS_RQ(sdf.format(new Date()));
									dMSG_NR.setTB_DZ(saveurl);
									dMSG_NR.setFX("0");
									listnr.add(dMSG_NR);
									ehcacheMSG_INFO.getCache().remove(MAPKEY);
									ehcacheMSG_INFO.addToCache(MAPKEY,
											JSONArray.fromObject(listnr)
													.toString(), true);
									isAdd = false;
									break;
								}
							}
							// 修改其他人
							if (eHCacheMSG.getCacheElement(KEY_DF) != null) {
								String str_DF = (String) eHCacheMSG
										.getCacheElement(KEY_DF);
								JSONArray array_DF = JSONArray
										.fromObject(str_DF);
								List<DMSG> listQT = JSONArray.toList(array_DF,
										DMSG.class);
								boolean isAddQT = true;
								for (int i1 = 0; i1 < listQT.size(); i1++) {
									if (listQT.get(i1).getDF_JFID()
											.equals(DF_JFID)
											&& listQT.get(i1).getDF_LB()
													.equals(DF_LB)
											|| listQT.get(i1).getDF_JFID()
													.equals(SZ_JFID)
											&& listQT.get(i1).getDF_LB()
													.equals(SZ_LB)) {
										DMSG dMSGQT = listQT.get(i1);
										listQT.remove(i1);
										dMSGQT.setFS_RQ(sdf.format(new Date()));
										dMSGQT.setNR_LB("1");
										dMSGQT.setNR("[图片]");
										dMSGQT.setTB_DZ(saveurl);
										dMSGQT.setJLS_WEB(dMSGQT.getJLS_WEB() + 1);
										dMSGQT.setJLS_SJ(dMSGQT.getJLS_SJ() + 1);
										listQT.add(0, dMSGQT);
										eHCacheMSG.getCache().remove(KEY_DF);
										eHCacheMSG.addToCache(KEY_DF, JSONArray
												.fromObject(listQT).toString(),
												true);
										String str_info = (String) ehcacheMSG_INFO
												.getCacheElement(MAPKEY_DF);
										JSONArray arrayinfo = JSONArray
												.fromObject(str_info);
										List<DMSG_NR> listnrQT = JSONArray
												.toList(arrayinfo,
														DMSG_NR.class);
										DMSG_NR dMSG_NRQT = new DMSG_NR();
										dMSG_NRQT.setFS_RQ(sdf
												.format(new Date()));
										dMSG_NRQT.setTB_DZ(saveurl);
										dMSG_NRQT.setFX("1");
										listnrQT.add(dMSG_NRQT);
										ehcacheMSG_INFO.getCache().remove(MAPKEY_DF);
										ehcacheMSG_INFO.addToCache(MAPKEY_DF,
												JSONArray.fromObject(listnrQT)
														.toString(), true);
										isAddQT = false;
										break;
									}
								}
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/onlin/msginfo.do";
	}
}
