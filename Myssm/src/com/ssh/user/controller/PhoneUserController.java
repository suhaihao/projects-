package com.ssh.user.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;

import Decoder.BASE64Decoder;

import com.ssh.user.model.DDJ01;
import com.ssh.user.model.DDJ01_D;
import com.ssh.user.model.DDJ02;
import com.ssh.user.model.DFW01;
import com.ssh.user.model.DFW01_D;
import com.ssh.user.model.DFW01_D_ZP;
import com.ssh.user.model.DFW02;
import com.ssh.user.model.DMSG;
import com.ssh.user.model.DMSG_NR;
import com.ssh.user.model.DSYS05;
import com.ssh.user.model.Dsys01;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ01Service;
import com.ssh.user.service.DDJ02Service;
import com.ssh.user.service.DFW01Service;
import com.ssh.user.service.DFW01_DService;
import com.ssh.user.service.DFW01_D_ZPService;
import com.ssh.user.service.DFW02Service;
import com.ssh.user.service.Dsys01Service;
import com.ssh.user.service.UserService;
import com.ssh.user.util.CopeFile;
import com.ssh.user.util.Distance;
import com.ssh.user.util.EHCache;
import com.ssh.user.util.MD5YZJM;
import com.ssh.user.util.Page;
import com.ssh.user.util.ReturnJson;

@Controller
@Scope("prototype")
@RequestMapping("/phone/users")
public class PhoneUserController implements ServletConfigAware,
		ServletContextAware {
	@Autowired
	private DDJ02Service dDJ02Service;
	@Autowired
	private DDJ01Service dDJ01Service;
	@Autowired
	private DFW01_DService dFW01_DService;
	@Autowired
	private DFW01_D_ZPService dFW01_D_ZPService;
	@Autowired
	private DFW02Service dFW02Service;
	@Autowired
	private DFW01Service dFW01Service;
	@Autowired
	private Dsys01Service dsys01Service;
	@Autowired
	private UserService userService;

	private ServletContext servletContext;
	private ServletConfig servletConfig;

	private MD5YZJM md5 = new MD5YZJM();
	private EHCache eHCache = new EHCache("ehcacheOnetoken");
	private EHCache eHCacheMSG = new EHCache("ehcacheMSG");
	private EHCache ehcacheMSG_INFO = new EHCache("ehcacheMSG_INFO");
	private Distance distance = new Distance();

	@Override
	public void setServletContext(ServletContext arg0) {
		this.servletContext = arg0;

	}

	@Override
	public void setServletConfig(ServletConfig arg0) {
		this.servletConfig = arg0;

	}

	/**
	 * 手机登陆接口
	 * 
	 * @param req
	 * @param rep
	 */
	@RequestMapping(value = "/login.zyfzjson", method = RequestMethod.GET)
	public void Phonelogin(HttpServletRequest req, HttpServletResponse rep) {
		String yhm = req.getParameter("yhm");
		String password = req.getParameter("password");
		ReturnJson returnjson = new ReturnJson();
		JSONObject msg = new JSONObject();
		// 查询用户是否存在
		DDJ02 dDJ02 = dDJ02Service.SelectByYHMOne(yhm);
		if (dDJ02 == null) {
			// 用户名不存在
			msg.put("result", "9010202");
		} else {
			if (md5.md5Password(password).equals(dDJ02.getJFPASSWORD())) {
				// 更新登陆日期令牌以及返回数据
				SimpleDateFormat sp = new SimpleDateFormat(
						"yyyy-MM-dd hh:mm:ss");
				String date = sp.format(new Date());
				try {
					dDJ02.setDLRQ(sp.parse(date));
					String tOKEN = "1.0" + dDJ02.getYHM() + dDJ02.getJFID()
							+ date;
					tOKEN = md5.md5Password(tOKEN);
					dDJ02.setTOKEN(tOKEN);
					dDJ02Service.upToken(dDJ02);
					msg.put("result", "0");
					msg.put("code", tOKEN);
					eHCache.addToCache(tOKEN, yhm, true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				// 用户名不存在
				msg.put("result", "9010201");
			}
		}
		returnjson.printStr(rep, msg.toString());
	}

	/**
	 * 主界面找服务
	 * 
	 * @param req
	 * @param rep
	 */
	@RequestMapping(value = "/zfw_list.zyfzjson", method = RequestMethod.GET)
	public void zfw_list(HttpServletRequest request,
			HttpServletResponse response) {
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		String count = request.getParameter("count");
		String sort = request.getParameter("sort");
		String sort_mode = request.getParameter("sort_mode");
		String FWNRLB = request.getParameter("fwnrlb");
		String MC = request.getParameter("mc");
		String GPS_DJ = request.getParameter("gps_dj");
		String GPS_BW = request.getParameter("gps_bw");
		String ys = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
		// Page page = null;
		if (ys != null) {
			if (FWNRLB != null) {
				map.put("FWNRLB", FWNRLB);
			}
			if (MC != null) {
				try {
					MC = new String(MC.getBytes("ISO-8859-1"), "utf-8");
					msg.put("MC", MC);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				map.put("MC", MC);
			}
			// page = new Page(Integer.parseInt(count),
			// dDJ01Service.PhoneGetCount(map), Integer.parseInt(ys));
		}
		if (sort.equals("02")) {
			if (sort_mode.equals("0")) {
				map.put("sort_mode", "ASC");
			} else if (sort_mode.equals("1")) {
				map.put("sort_mode", "DESC");
			}
		}
		map.put("MAX", Integer.parseInt(count) * Integer.parseInt(ys));
		if (ys.equals("1")) {
			map.put("MIN", 1);
		} else {
			map.put("MIN", Integer.parseInt(count) * (Integer.parseInt(ys) - 1)
					+ 1);
		}
		List<DDJ01> listddj01 = dDJ01Service.PhoneSelectByPage(map);
		if (listddj01.size() >= 1) {
			DDJ01 dDJ01 = null;
			double dist = 0.0;
			for (int i = 0; i < listddj01.size(); i++) {
				dDJ01 = listddj01.get(i);
				listddj01.remove(i);
				dist = distance.LantitudeLongitudeDist(
						Double.parseDouble(dDJ01.getGPS_DJ()),
						Double.parseDouble(dDJ01.getGPS_BW()),
						Double.parseDouble(GPS_DJ), Double.parseDouble(GPS_BW));
				dDJ01.setJL(dist);
				listddj01.add(i, dDJ01);
			}
			if (sort.equals("01")) {
				DDJ01 dDJ01_2 = null;
				if (sort_mode.equals("1")) {
					for (int i = 0; i < listddj01.size(); i++) {
						for (int j = i + 1; j < listddj01.size(); j++) {
							if (listddj01.get(i).getJL() < listddj01.get(j)
									.getJL()) {
								dDJ01 = listddj01.get(i);
								dDJ01_2 = listddj01.get(j);
								listddj01.remove(i);
								listddj01.add(i, dDJ01_2);
								listddj01.remove(j);
								listddj01.add(j, dDJ01);
							}
						}
					}
				} else if (sort_mode.equals("0")) {
					for (int i = 0; i < listddj01.size(); i++) {
						for (int j = i + 1; j < listddj01.size(); j++) {
							if (listddj01.get(i).getJL() > listddj01.get(j)
									.getJL()) {
								dDJ01 = listddj01.get(i);
								dDJ01_2 = listddj01.get(j);
								listddj01.remove(i);
								listddj01.add(i, dDJ01_2);
								listddj01.remove(j);
								listddj01.add(j, dDJ01);
							}
						}
					}
				}
			}
			msg.put("result", "0");
			msg.put("FWNRLB", FWNRLB);
			msg.put("MY_CONSULT", JSONArray.fromObject(listddj01));
			returnjson.printStr(response, msg.toString());
		} else {
			msg.put("result", "0");
			msg.put("FWNRLB", FWNRLB);
			msg.put("MY_CONSULT", JSONArray.fromObject(listddj01));
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 专业防治信息
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/zfw_detail.zyfzjson", method = RequestMethod.GET)
	public void zfw_detail(HttpServletRequest request,
			HttpServletResponse response) {
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		String JFID = request.getParameter("jfid");
		DDJ01 dDJ01 = dDJ01Service.SelectByID(JFID);
		List<DDJ01_D> lisddj01_d = dDJ01Service.SelectByDDID(dDJ01.getJFID());
		if (dDJ01 != null) {
			msg = JSONObject.fromObject(dDJ01);
			msg.put("result", "0");
			msg.put("MY_CONSULT", JSONArray.fromObject(lisddj01_d));
			returnjson.printStr(response, msg.toString());
		} else {
			msg = JSONObject.fromObject(dDJ01);
			msg.put("result", "1000003");
			msg.put("MY_CONSULT", JSONArray.fromObject(lisddj01_d));
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 手机服务查询
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/fw_list.zyfzjson", method = RequestMethod.GET)
	public void fw_list(HttpServletRequest request, HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		try {
			String yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				String count = request.getParameter("count");
				String ys = request.getParameter("page");
				Map<String, Object> map = new HashMap<String, Object>();
				// Page page = null;
				if (ys != null) {
					map.put("YHM", yhm);
					// page = new Page(Integer.parseInt(count),
					// dFW01_DService.getCountByYHSize(map),
					// Integer.parseInt(ys));
					map.put("MAX",
							Integer.parseInt(count) * Integer.parseInt(ys));
					if (ys.equals("1")) {
						map.put("MIN", 1);
					} else {
						map.put("MIN",
								Integer.parseInt(count)
										* (Integer.parseInt(ys) - 1) + 1);
					}
					List<DFW01_D> listdfw01_d = dFW01_DService
							.SelectByYHList(map);
					for (int i = 0; i < listdfw01_d.size(); i++) {
						listdfw01_d.get(i).setZpjh(
								dFW01_D_ZPService.SelectBYDK(listdfw01_d.get(i)
										.getJFID().split("-")[1]));
					}
					msg.put("result", "0");
					msg.put("MY_CONSULT", JSONArray.fromObject(listdfw01_d));
					returnjson.printStr(response, msg.toString());
				}
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 用户查看地块照片
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/fw_picture.zyfzjson", method = RequestMethod.GET)
	public void fw_picture(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		String jfid = request.getParameter("jfid");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		String yhm;
		try {
			yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				List<DFW01_D_ZP> listdfw01_d_zp = dFW01_D_ZPService
						.SelectBYDK(jfid);
				msg.put("result", "0");
				msg.put("MY_CONSULT", JSONArray.fromObject(listdfw01_d_zp));
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 评价接口
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/fwpj_list.zyfzjson", method = RequestMethod.GET)
	public void fwpj_list(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		String zt = request.getParameter("zt");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		String yhm;
		try {
			yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				String count = request.getParameter("count");
				String ys = request.getParameter("page");
				Map<String, Object> map = new HashMap<String, Object>();
				// Page page = null;
				if (ys != null) {
					map.put("zt", zt);
					map.put("yhm", yhm);
					// page = new Page(Integer.parseInt(count),
					// dFW02Service.getCountLL(map), Integer.parseInt(ys));
					map.put("max",
							Integer.parseInt(count) * Integer.parseInt(ys));
					if (ys.equals("1")) {
						map.put("min", 1);
					} else {
						map.put("min",
								Integer.parseInt(count)
										* (Integer.parseInt(ys) - 1) + 1);
					}
					List<DFW02> listdfw02 = dFW02Service.SelectByLLList(map);
					msg.put("result", "0");
					msg.put("MY_CONSULT", JSONArray.fromObject(listdfw02));
					returnjson.printStr(response, msg.toString());
				}
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 非全程服务评价详情
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/fwpj_fqc_detail.zyfzjson", method = RequestMethod.GET)
	public void fwpj_fqc_detail(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		String dfw01_jfid = request.getParameter("dfw01_jfid");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		String yhm;
		try {
			yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				String FWNRLB = request.getParameter("fwnrlb");
				Map<String, Object> map = new HashMap<String, Object>();
				if (dfw01_jfid != null) {
					map.put("dfw01_jfid", dfw01_jfid);
				}
				if (FWNRLB != null) {
					map.put("FWNRLB", FWNRLB);
				}
				DFW01 dFW01 = dFW01Service.SelectByJFID(map);
				msg = JSONObject.fromObject(dFW01);
				msg.put("result", "0");
				List<DFW01_D> listdfw01_d = dFW01_DService.SelectByID(dFW01
						.getJFID());
				for (int i = 0; i < listdfw01_d.size(); i++) {
					listdfw01_d.get(i).setZpjh(
							dFW01_D_ZPService.SelectBYDK(listdfw01_d.get(i)
									.getJFID()));
				}
				msg.put("MY_CONSULT", JSONArray.fromObject(listdfw01_d));
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 全程服务评价详情1
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/fwpj_qc1_detail.zyfzjson", method = RequestMethod.GET)
	public void fwpj_qc1_detail(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		String yhm;
		try {
			yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				String dfw02_jfid = request.getParameter("dfw02_jfid");
				DFW02 dFW02 = dFW02Service.SelectByJFID(dfw02_jfid);
				msg = JSONObject.fromObject(dFW02);
				msg.put("result", "0");
				List<DFW01> listdfw01 = dFW01Service.SelectByRqYh(
						dFW02.getDY_JFID(), dFW02.getDDJ02_JFID());
				msg.put("MY_CONSULT", JSONArray.fromObject(listdfw01));
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 全程服务评价详情2
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/fwpj_qc2_detail.zyfzjson", method = RequestMethod.GET)
	public void fwpj_qc2_detail(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		String dfw01_jfid = request.getParameter("dfw01_jfid");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		String yhm;
		try {
			yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				String FWNRLB = request.getParameter("fwnrlb");
				Map<String, Object> map = new HashMap<String, Object>();
				if (dfw01_jfid != null) {
					map.put("dfw01_jfid", dfw01_jfid);
				}
				if (FWNRLB != null) {
					map.put("FWNRLB", FWNRLB);
				}
				DFW01 dFW01 = dFW01Service.SelectByID(dfw01_jfid);
				msg = JSONObject.fromObject(dFW01);
				msg.put("result", "0");
				List<DFW01_D> listdfw01_d = dFW01_DService.SelectByID(dFW01
						.getJFID());
				msg.put("MY_CONSULT", JSONArray.fromObject(listdfw01_d));
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 评价提交
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/fwpj_insert.zyfzjson", method = RequestMethod.POST)
	public void fwpj_insert(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		String yhm;
		try {
			yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				String dfw02_jfid = request.getParameter("dfw02_jfid");
				String pjjg = request.getParameter("pjjg");
				String pjsm = java.net.URLDecoder.decode(
						request.getParameter("pjsm"), "utf-8");
				DDJ02 dDJ02 = dDJ02Service.SelectByYHMOne(yhm);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("psi_jfid", dfw02_jfid);
				map.put("psi_PJJG", pjjg);
				map.put("psi_PJSM", pjsm);
				map.put("psi_lrry", dDJ02.getJFID());
				map.put("psi_lrry_mc", dDJ02.getMC());
				dFW02Service.p_gd_pj(map);
				String retrunmsg = (String) map.get("pso_return");
				if (retrunmsg.equals("0")) {
					msg.put("result", "0");
					returnjson.printStr(response, msg.toString());
				} else {
					msg.put("result", "-1");
					msg.put("gc", retrunmsg);
					returnjson.printStr(response, msg.toString());
				}
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 消息列表
	 * 
	 * @param request
	 * @param response
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/mes_list.zyfzjson", method = RequestMethod.GET)
	public void mes_list(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		String yhm;
		try {
			yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				String count = request.getParameter("count");
				String ys = request.getParameter("page");
				DDJ02 dDJ02 = dDJ02Service.SelectByYHMOne(yhm);
				String KEY = "6," + dDJ02.getJFID();
				String str;
				str = (String) eHCacheMSG.getCacheElement(KEY);
				if (str != null) {
					JSONArray array = JSONArray.fromObject(str);
					List<DMSG> listdmsg = JSONArray.toList(array, DMSG.class);
					int Max = 0;
					int Min = 0;
					if (ys != null) {
						Max = Integer.parseInt(count) * Integer.parseInt(ys);
						if (ys.equals("1")) {
							Min = 1;
						} else {
							Min = Integer.parseInt(count)
									* (Integer.parseInt(ys) - 1) + 1;
						}
					}
					List<DMSG> listdNew = new ArrayList<DMSG>();
					for (int i = Min - 1; i < listdmsg.size(); i++) {
						listdNew.add(listdmsg.get(i));
						if (i - Min - 1 == Integer.parseInt(count)) {
							break;
						}
					}
					msg.put("result", "0");
					msg.put("MY_CONSULT", JSONArray.fromObject(listdNew));
					returnjson.printStr(response, msg.toString());
				} else {
					msg.put("result", "0");
					List<DMSG> listdNew = new ArrayList<DMSG>();
					msg.put("MY_CONSULT", JSONArray.fromObject(listdNew));
					returnjson.printStr(response, msg.toString());
				}
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 消息详情
	 * 
	 * @param request
	 * @param response
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/mes_detail.zyfzjson", method = RequestMethod.GET)
	public void mes_detail(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		String yhm;
		try {
			yhm = (String) eHCache.getCacheElement(auth_token);
			List<DDJ02> ddj02list = dDJ02Service.selecByYHM(yhm);
			DDJ02 dDJ02 = ddj02list.get(0);
			if (yhm != null) {
				request.setAttribute("msg", msg);
				String SZ_LB = "6";
				String SZ_JFID = dDJ02.getJFID();
				String DF_LB = request.getParameter("df_lb");
				String DF_JFID = request.getParameter("df_jfid");
				String list = SZ_LB + "," + SZ_JFID + "," + DF_LB + ","
						+ DF_JFID;
				// 内存key
				String KEY = SZ_LB + "," + SZ_JFID;
				if (eHCacheMSG.getCacheElement(KEY) != null) {
					String str = (String) eHCacheMSG.getCacheElement(KEY);
					JSONArray array = JSONArray.fromObject(str);
					List<DMSG> list1 = JSONArray.toList(array, DMSG.class);
					for (int i = 0; i < list1.size(); i++) {
						if (list1.get(i).getDF_JFID().equals(DF_JFID)
								&& list1.get(i).getSZ_JFID().equals(SZ_JFID)) {
							DMSG dMSG = list1.get(i);
							list1.remove(i);
							dMSG.setJLS_SJ(0);
							list1.add(dMSG);
							eHCacheMSG.getCache().remove(KEY);
							eHCacheMSG.addToCache(KEY,
									JSONArray.fromObject(list1).toString(),
									true);
							msg = JSONObject.fromObject(dMSG);
							break;
						}
					}
				}
				String str = (String) ehcacheMSG_INFO.getCacheElement(list);
				msg.put("result", "0");
				if (str == null) {
					msg.put("MY_CONSULT", "[]");
				} else {
					msg.put("MY_CONSULT", str);
				}
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	@RequestMapping(value = "/mes_jsr_create1.zyfzjson", method = RequestMethod.GET)
	public void mes_jsr_create1(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		String yhm;
		try {
			yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				String lb = request.getParameter("lb");
				String count = request.getParameter("count");
				String ys = request.getParameter("page");
				Map<String, Object> map = new HashMap<String, Object>();
				// Page page = null;
				if (ys != null) {
					if (lb.equals("6")) {
						// page = new Page(Integer.parseInt(count),
						// dDJ02Service.getCountBySJ(),
						// Integer.parseInt(ys));
						String MC=request.getParameter("mc");
						if(MC!=null)
						{
							MC = new String(MC.getBytes("ISO-8859-1"), "utf-8");
							map.put("MC", MC);
						}
						map.put("MAX",
								Integer.parseInt(count) * Integer.parseInt(ys));
						if (ys.equals("1")) {
							map.put("MIN", 1);
						} else {
							map.put("MIN",
									Integer.parseInt(count)
											* (Integer.parseInt(ys) - 1) + 1);
						}
						List<DDJ02> listddj02 = dDJ02Service
								.SelectAllSizeBySJ(map);
						msg.put("result", "0");
						msg.put("lb", lb);
						msg.put("MY_CONSULT", JSONArray.fromObject(listddj02));
						returnjson.printStr(response, msg.toString());
					}
					if (lb.equals("0") || lb.equals("1")) {
						map.put("MAX",
								Integer.parseInt(count) * Integer.parseInt(ys));
						if (ys.equals("1")) {
							map.put("MIN", 1);
						} else {
							map.put("MIN",
									Integer.parseInt(count)
											* (Integer.parseInt(ys) - 1) + 1);
						}
						List<DSYS05> listdsys05=dsys01Service.selectBysys05(map);
						msg.put("result", "0");
						msg.put("lb", lb);
						msg.put("MY_CONSULT", JSONArray.fromObject(listdsys05));
						returnjson.printStr(response, msg.toString());
					}
					if (lb.equals("3") || lb.equals("4")) {
						map.put("MAX",
								Integer.parseInt(count) * Integer.parseInt(ys));
						if (ys.equals("1")) {
							map.put("MIN", 1);
						} else {
							map.put("MIN",
									Integer.parseInt(count)
											* (Integer.parseInt(ys) - 1) + 1);
						}
						List<DDJ01> listddj01 = dDJ01Service.SelectAllZFZZ(map);
						msg.put("result", "0");
						msg.put("lb", lb);
						msg.put("MY_CONSULT", JSONArray.fromObject(listddj01));
						returnjson.printStr(response, msg.toString());
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	@RequestMapping(value = "/mes_jsr_create2.zyfzjson", method = RequestMethod.GET)
	public void mes_jsr_create2(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		String yhm;
		try {
			yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				String lb = request.getParameter("lb");
				String zfzz_jfid = request.getParameter("zfzz_jfid");
				String count = request.getParameter("count");
				String ys = request.getParameter("page");
				Map<String, Object> map = new HashMap<String, Object>();
				// Page page = null;
				if (ys != null) {
					if (zfzz_jfid != null) {
						map.put("DDJ01_JFID", zfzz_jfid);
					}
					if (lb != null) {
						map.put("XXDBLB", lb);
					}
					// page = new Page(Integer.parseInt(count),
					// userService.getCountByzz(map), Integer.parseInt(ys));
					map.put("MAX",
							Integer.parseInt(count) * Integer.parseInt(ys));
					if (ys.equals("1")) {
						map.put("MIN", 1);
					} else {
						map.put("MIN",
								Integer.parseInt(count)
										* (Integer.parseInt(ys) - 1) + 1);
					}
					List<User> listuser = userService.SelectByLBZZ(map);
					msg.put("result", "0");
					msg.put("lb", lb);
					msg.put("MY_CONSULT", JSONArray.fromObject(listuser));
					returnjson.printStr(response, msg.toString());
				}
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}
	@RequestMapping(value = "/mes_jsr_create3.zyfzjson", method = RequestMethod.GET)
	public void mes_jsr_create3(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		String yhm;
		try {
			yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				String lb = request.getParameter("lb");
				String count = request.getParameter("count");
				String jfdsys05_code = request.getParameter("jfdsys05_code");
				String ys = request.getParameter("page");
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("XXDBLB", lb);
				map.put("JFDSYS05_CODE", jfdsys05_code);
				map.put("MAX",
						Integer.parseInt(count) * Integer.parseInt(ys));
				if (ys.equals("1")) {
					map.put("MIN", 1);
				} else {
					map.put("MIN",
							Integer.parseInt(count)
									* (Integer.parseInt(ys) - 1) + 1);
				}
				List<Dsys01> listdsys01 = dsys01Service.SelectAllByxxdblb(map);
				msg.put("result", "0");
				msg.put("lb", lb);
				msg.put("MY_CONSULT", JSONArray.fromObject(listdsys01));
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/mes_insert.zyfzjson", method = RequestMethod.POST)
	public void mes_insert(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		String tpr = request.getParameter("tpr");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		String yhm;
		try {
			yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				if (tpr == null || tpr.equals("")) {
					List<DDJ02> listddj02 = dDJ02Service.selecByYHM(yhm);
					DDJ02 dDJ02 = listddj02.get(0);
					String SZ_LB = "6";
					String SZ_JFID = dDJ02.getJFID();
					String SZ_MC = dDJ02.getMC();
					String SZ_TX_LJ = dDJ02.getZPLJ();
					String DF_LB = request.getParameter("df_lb");
					String DF_JFID = request.getParameter("df_jfid");
					String DF_MC = request.getParameter("df_mc");
					String DF_TX_LJ = request.getParameter("df_tx_lj");
					String NR = request.getParameter("nr");
					try {
						DF_MC = new String(DF_MC.getBytes("GBK"), "GBK");
						NR = new String(NR.getBytes("GBK"), "GBK");
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
					SimpleDateFormat sdf = new SimpleDateFormat(
							"yy-MM-dd HH:mm:ss");
					// 内存key
					String KEY = SZ_LB + "," + SZ_JFID;
					// mapkey
					String MAPKEY = SZ_LB + "," + SZ_JFID + "," + DF_LB + ","
							+ DF_JFID;
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
									if (listQT.get(i).getDF_JFID()
											.equals(DF_JFID)
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
										List<DMSG_NR> listnrQT = JSONArray
												.toList(arrayinfo,
														DMSG_NR.class);
										DMSG_NR dMSG_NRQT = new DMSG_NR();
										dMSG_NRQT.setFS_RQ(sdf
												.format(new Date()));
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
								eHCacheMSG.addToCache(KEY_DF, JSONArray
										.fromObject(listQT).toString(), true);
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
							eHCacheMSG
									.addToCache(KEY, JSONArray.fromObject(list)
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
					msg.put("result", "0");
					returnjson.printStr(response, msg.toString());
				} else {
					// 上传的图片
					Random rdm = new Random(System.currentTimeMillis());// 获得随机种子
					// 唯一文件名
					long time = Math.abs(rdm.nextInt()) % 1000000000;
					String saveurl = "//assets//img//head//" + time + ".jpg";
					if (GenerateImage(tpr, saveurl)) {
						// 复制图片
						CopeFile copeFile = new CopeFile();
						String oldPath = request
								.getSession()
								.getServletContext()
								.getRealPath(
										"\\assets\\img\\head\\" + time + ".jpg");
						String newPath = oldPath.split("Myssm")[0]
								+ "Myssm_ZBZ" + oldPath.split("Myssm")[1];
						copeFile.copyFile(oldPath, newPath);
						// 处理相关数据
						List<DDJ02> listddj02 = dDJ02Service.selecByYHM(yhm);
						DDJ02 dDJ02 = listddj02.get(0);
						String SZ_LB = "6";
						String SZ_JFID = dDJ02.getJFID();
						String SZ_MC = dDJ02.getMC();
						String SZ_TX_LJ = dDJ02.getZPLJ();
						String DF_LB = request.getParameter("df_lb");
						String DF_JFID = request.getParameter("df_jfid");
						String DF_MC = request.getParameter("df_mc");
						try {
							DF_MC = new String(DF_MC.getBytes("GBK"), "GBK");
						} catch (UnsupportedEncodingException e) {
							e.printStackTrace();
						}
						String DF_TX_LJ = request.getParameter("df_tx_lj");
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
						msg.put("result", "0");
						returnjson.printStr(response, msg.toString());
					} else {
						msg.put("result", "2");
						returnjson.printStr(response, msg.toString());
					}
				}
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	public boolean GenerateImage(String imgStr, String url) { // 对字节数组字符串进行Base64解码并生成图片
		if (imgStr == null) {
			return false;
		}// 图像数据为空
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			// Base64解码
			byte[] b = decoder.decodeBuffer(imgStr);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {// 调整异常数据
					b[i] += 256;
				}
			}
			// 生成jpeg图片
			String imgFilePath = servletContext.getRealPath(url);// 新生成的图片
			OutputStream out = new FileOutputStream(imgFilePath);
			out.write(b);
			out.flush();
			out.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 用户信息详情
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/userinfo.zyfzjson", method = RequestMethod.GET)
	public void userinfo(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		try {
			String yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				DDJ02 dDJ02 = dDJ02Service.selecByYHM(yhm).get(0);
				msg = JSONObject.fromObject(dDJ02);
				msg.put("result", "0");
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 修改用户信息
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/upuserinfo.zyfzjson", method = RequestMethod.POST)
	public void upuserinfo(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		try {
			String yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				DDJ02 dDJ02 = new DDJ02();
				dDJ02.setJFID(request.getParameter("jfid"));
				dDJ02.setYDDH(request.getParameter("yddh"));
				dDJ02.setYX(request.getParameter("yx"));
				if (request.getParameter("tpr") != null
						&& !request.getParameter("tpr").equals("")) {
					// 上传的图片
					Random rdm = new Random(System.currentTimeMillis());// 获得随机种子
					// 唯一文件名
					long time = Math.abs(rdm.nextInt()) % 1000000000;
					String saveurl = "//assets//img//head//" + time + ".jpg";
					if (GenerateImage(request.getParameter("tpr"), saveurl)) {
						dDJ02.setZPLJ(saveurl);
						dDJ02.setZPWJM(time + ".jpg");
					}
					//同步头像
					CopeFile copeFile = new CopeFile();
					String oldPath = request
							.getSession()
							.getServletContext()
							.getRealPath(
									"\\assets\\img\\head\\" + time + ".jpg");
					String newPath = oldPath.split("Myssm")[0]
							+ "Myssm_ZBZ" + oldPath.split("Myssm")[1];
					copeFile.copyFile(oldPath, newPath);
					//同步头像聊天信息
					List<DDJ02> listddj02 = dDJ02Service.selecByYHM(yhm);
					DDJ02 dDJ02up = listddj02.get(0);
					String KEY ="6," + dDJ02up.getJFID();
					String str = (String) eHCacheMSG.getCacheElement(KEY);
					if (str != null && !str.equals("")) {
						JSONArray array = JSONArray.fromObject(str);
						List<DMSG> listdmsg = JSONArray.toList(array,
								DMSG.class);
						for (int i = 0; i < listdmsg.size(); i++) {
							listdmsg.get(i).setSZ_TX_LJ(saveurl);
							eHCacheMSG.getCache().remove(KEY);
							eHCacheMSG.addToCache(KEY,
									JSONArray.fromObject(listdmsg).toString(),
									true);
						}
					}
				}
				dDJ02Service.upusermsg(dDJ02);
				msg.put("result", "0");
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 校验用户的旧密码
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/jyjmm.zyfzjson", method = RequestMethod.GET)
	public void jyjmm(HttpServletRequest request, HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		try {
			String yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				DDJ02 dDJ02 = dDJ02Service.selecByYHM(yhm).get(0);
				if (dDJ02.getJFPASSWORD().equals(
						md5.md5Password(request.getParameter("password")))) {
					// 用户密码正确
					msg.put("result", "0");
					returnjson.printStr(response, msg.toString());
				} else {
					// 用户密码不正确
					msg.put("result", "1");
					returnjson.printStr(response, msg.toString());
				}
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 修改密码
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/uppasword.zyfzjson", method = RequestMethod.GET)
	public void uppasword(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		try {
			String yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				String JFID = request.getParameter("jfid");
				String JFPASSWORD = request.getParameter("password");
				DDJ02 dDJ02 = new DDJ02();
				dDJ02.setJFID(JFID);
				dDJ02.setJFPASSWORD(md5.md5Password(JFPASSWORD));
				dDJ02Service.uppassword(dDJ02);
				msg.put("result", "0");
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 下载App农户
	 */
	@RequestMapping(value = "/downloadappnh.zyfzjson", method = RequestMethod.GET)
	public void downloadappnh(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			// path是指欲下载的文件的路径。
			File file = new File(request.getServletContext().getRealPath(
					"/assets/file/nh.apk"));
			// 取得文件名。
			String filename = file.getName();
			// 取得文件的后缀名。
			String ext = filename.substring(filename.lastIndexOf(".") + 1)
					.toUpperCase();

			// 以流的形式下载文件。
			InputStream fis = new BufferedInputStream(new FileInputStream(
					request.getServletContext().getRealPath(
							"/assets/file/nh.apk")));
			byte[] buffer = new byte[fis.available()];
			fis.read(buffer);
			fis.close();
			// 清空response
			response.reset();
			// 设置response的Header
			response.addHeader("Content-Disposition", "attachment;filename="
					+ new String(filename.getBytes()));
			response.addHeader("Content-Length", "" + file.length());
			OutputStream toClient = new BufferedOutputStream(
					response.getOutputStream());
			response.setContentType("application/octet-stream");
			toClient.write(buffer);
			toClient.flush();
			toClient.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 下载App专访组织
	 */
	@RequestMapping(value = "/downloadappzfzz.zyfzjson", method = RequestMethod.GET)
	public void downloadappzfzz(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			// path是指欲下载的文件的路径。
			File file = new File(request.getServletContext().getRealPath(
					"/assets/file/zfzz.apk"));
			// 取得文件名。
			String filename = file.getName();
			// 取得文件的后缀名。
			String ext = filename.substring(filename.lastIndexOf(".") + 1)
					.toUpperCase();

			// 以流的形式下载文件。
			InputStream fis = new BufferedInputStream(new FileInputStream(
					request.getServletContext().getRealPath(
							"/assets/file/zfzz.apk")));
			byte[] buffer = new byte[fis.available()];
			fis.read(buffer);
			fis.close();
			// 清空response
			response.reset();
			// 设置response的Header
			response.addHeader("Content-Disposition", "attachment;filename="
					+ new String(filename.getBytes()));
			response.addHeader("Content-Length", "" + file.length());
			OutputStream toClient = new BufferedOutputStream(
					response.getOutputStream());
			response.setContentType("application/octet-stream");
			toClient.write(buffer);
			toClient.flush();
			toClient.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
