package com.ssh.user.controller;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.enterprise.context.RequestScoped;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.RequestWrapper;

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
import com.ssh.user.model.DDJ02_D;
import com.ssh.user.model.DDJ11;
import com.ssh.user.model.DFW01;
import com.ssh.user.model.DFW01_D;
import com.ssh.user.model.DFW01_D_FZMX;
import com.ssh.user.model.DFW01_D_ZP;
import com.ssh.user.model.DFW02;
import com.ssh.user.model.DMSG;
import com.ssh.user.model.DMSG_NR;
import com.ssh.user.model.Dsys01;
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ01Service;
import com.ssh.user.service.DDJ02Service;
import com.ssh.user.service.DDJ02_DService;
import com.ssh.user.service.DDJ11Service;
import com.ssh.user.service.DFW01Service;
import com.ssh.user.service.DFW01_DService;
import com.ssh.user.service.DFW01_D_ZPService;
import com.ssh.user.service.DFW02Service;
import com.ssh.user.service.Dsys01Service;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.service.UserService;
import com.ssh.user.util.CopeFile;
import com.ssh.user.util.Distance;
import com.ssh.user.util.EHCache;
import com.ssh.user.util.MD5YZJM;
import com.ssh.user.util.Page;
import com.ssh.user.util.ReturnJson;

@Controller
@Scope("prototype")
@RequestMapping("/phone/zfzz")
public class PhoneZFZZController implements ServletConfigAware,
		ServletContextAware {
	@Autowired
	private DDJ02Service dDJ02Service;
	@Autowired
	private DDJ02_DService dDJ02_DService;
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
	@Autowired
	private DDJ11Service dDJ11Service;
	@Autowired
	private Dsys11Service dsys11Service;

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
		User user = userService.SelectByName(yhm);
		if (user == null) {
			// 用户名不存在
			msg.put("result", "9010202");
		} else {
			if (md5.md5Password(password).equals(user.getJFPASSWORD())) {
				// 更新登陆日期令牌以及返回数据
				SimpleDateFormat sp = new SimpleDateFormat(
						"yyyy-MM-dd hh:mm:ss");
				String date = sp.format(new Date());
				try {
					String tOKEN = "1.0" + user.getJFUSERID() + user.getJFID()
							+ date;
					tOKEN = md5.md5Password(tOKEN);
					msg.put("result", "0");
					msg.put("ddj01_jfid", user.getDDJ01_JFID());
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
	 * 主界面
	 * 
	 * @param req
	 * @param rep
	 */
	@RequestMapping(value = "/dcl_list.zyfzjson", method = RequestMethod.GET)
	public void zfw_list(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		try {
			String yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				String count = request.getParameter("count");
				String ys = request.getParameter("page");
				String DDJ01_JFID = request.getParameter("ddj01_jfid");
				Map<String, Object> map = new HashMap<String, Object>();
				// Page page = null;
				if (ys != null) {
					if (DDJ01_JFID != null) {
						map.put("DDJ01_JFID", DDJ01_JFID);
					}
					// page = new Page(Integer.parseInt(count),
					// dFW01Service.getBy_ZT_DDJ01_JFIDCount(map),
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
					List<DFW01> listdfw01 = dFW01Service
							.SelectBy_ZT_DDJ01_JFID(map);
					JSONArray jsonArray = JSONArray.fromObject(listdfw01);
					for (int i = 0; i < listdfw01.size(); i++) {
						List<DFW01_D_FZMX> listdfw01_d_fzmx = dFW01Service
								.SelectDFW01_D_FZMX(listdfw01.get(i).getJFID());
						JSONObject jsonObject = (JSONObject) jsonArray.get(i);
						jsonObject.put("MY_CONSULT1",
								JSONArray.fromObject(listdfw01_d_fzmx));
						jsonArray.remove(i);
						jsonArray.add(i, jsonObject);
					}
					msg.put("result", "0");
					msg.put("MY_CONSULT", jsonArray);
					returnjson.printStr(response, msg.toString());
				}
			} else {
				msg.put("result", "-2");
				returnjson.printStr(response, msg.toString());
			}

		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 处理工单
	 * 
	 * @param req
	 * @param rep
	 */
	@RequestMapping(value = "/dcl_list1.zyfzjson", method = RequestMethod.GET)
	public void dcl_list1(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		try {
			String yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				String DFW01_JFID = request.getParameter("dfw01_jfid");
				String FWNRLB = request.getParameter("fwnrlb");
				FWNRLB = new String(FWNRLB.getBytes("ISO-8859-1"), "utf-8");
				List<DFW01_D> listdfw01_d = dFW01_DService.SelectByID(DFW01_JFID);
				for (int i = 0; i < listdfw01_d.size(); i++) {
					listdfw01_d.get(i).setFWNRLB(FWNRLB);
					if (listdfw01_d.get(i).getLSRQ().equals("-")) {
						listdfw01_d.get(i).setLSRQ("");
					}
				}
				msg.put("result", "0");
				msg.put("dfw01_jfid", DFW01_JFID);
				msg.put("MY_CONSULT", JSONArray.fromObject(listdfw01_d));
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}

	}

	/**
	 * 查询地块集合
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/dk_list.zyfzjson", method = RequestMethod.GET)
	public void zfw_detail(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		try {
			String yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				String dfw01_jfid = request.getParameter("dfw01_jfid");
				String count = request.getParameter("count");
				String ys = request.getParameter("page");
				Map<String, Object> map = new HashMap<String, Object>();
				if (ys != null) {
					DFW01 dFW01 = dFW01Service.SelectByID(dfw01_jfid);
					msg.put("result", "0");
					msg.put("dfw01_jfid", dfw01_jfid);
					msg.put("fwnrlb", dFW01.getFWNRLB());
					map.put("max",
							Integer.parseInt(count) * Integer.parseInt(ys));
					if (ys.equals("1")) {
						map.put("min", 1);
					} else {
						map.put("min",
								Integer.parseInt(count)
										* (Integer.parseInt(ys) - 1) + 1);
					}
					map.put("DDJ02_JFID", dFW01.getDDJ02_JFID());
					List<DDJ02_D> listddj02_d = dDJ02_DService
							.SelectBYDDJ02_JFIDPage(map);
					msg.put("MY_CONSULT", JSONArray.fromObject(listddj02_d));
					returnjson.printStr(response, msg.toString());
				}
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 插入地块
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/dk_insert.zyfzjson", method = RequestMethod.POST)
	public void fw_list(HttpServletRequest request, HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		try {
			String yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				DFW01_D dFW01_D = new DFW01_D();
				dFW01_D.setDFW01_JFID(request.getParameter("dfw01_jfid"));
				dFW01_D.setDDJ02_D_JFID(request.getParameter("ddj02_d_jfid"));
				dFW01_D.setDDJ02_D_DH(java.net.URLDecoder.decode(
						request.getParameter("ddj02_d_dh"), "utf-8"));
				dFW01_D.setDDJ02_D_DLX(request.getParameter("ddj02_d_dlx"));
				dFW01_D.setDDJ02_D_MJ(Double.parseDouble(request
						.getParameter("ddj02_d_mj")));
				dFW01_D.setZW(request.getParameter("zw"));
				dFW01_D.setZW_MC(java.net.URLDecoder.decode(
						request.getParameter("zwmc"), "utf-8"));
				dFW01_D.setFZMJ(Double.parseDouble(request.getParameter("fzmj")));
				dFW01_D.setFZDX(java.net.URLDecoder.decode(
						request.getParameter("fzdx"), "utf-8"));
				dFW01_D.setSYQX(java.net.URLDecoder.decode(
						request.getParameter("syqx"), "utf-8"));
				dFW01_D.setSFJE(Double.parseDouble(request.getParameter("sfje")));
				dFW01_D.setSF_FZ(request.getParameter("sf_fz"));
				dFW01_D.setSF_XP(request.getParameter("sf_xp"));
				dFW01_D.setDDJ11_JFID1(request.getParameter("ddj11_jfid1"));
				dFW01_D.setDDJ11_MC1(java.net.URLDecoder.decode(
						request.getParameter("ddj11_mc1"), "utf-8"));
				dFW01_D.setDDJ11_FL1(request.getParameter("ddj11_fl1"));
				dFW01_D.setDDJ11_DW1(request.getParameter("ddj11_dw1"));
				dFW01_D.setDDJ11_DJ1(Double.parseDouble(request
						.getParameter("ddj11_dj1")));
				dFW01_D.setDDJ11_BZGG1(java.net.URLDecoder.decode(
						request.getParameter("ddj11_bzgg1"), "utf-8"));
				dFW01_D.setSYL1(Double.parseDouble(request
						.getParameter("ddj11_syl1")));
				dFW01_D.setDDJ11_JFID2(request.getParameter("ddj11_jfid2"));
				dFW01_D.setDDJ11_MC2(java.net.URLDecoder.decode(
						request.getParameter("ddj11_mc2"), "utf-8"));
				dFW01_D.setDDJ11_FL2(request.getParameter("ddj11_fl2"));
				dFW01_D.setDDJ11_DW2(request.getParameter("ddj11_dw2"));
				dFW01_D.setDDJ11_DJ2(Double.parseDouble(request
						.getParameter("ddj11_dj2")));
				dFW01_D.setDDJ11_BZGG2(java.net.URLDecoder.decode(
						request.getParameter("ddj11_bzgg2"), "utf-8"));
				dFW01_D.setSYL2(Double.parseDouble(request
						.getParameter("ddj11_syl2")));
				dFW01_D.setDDJ11_JFID3(request.getParameter("ddj11_jfid3"));
				dFW01_D.setDDJ11_MC3(java.net.URLDecoder.decode(
						request.getParameter("ddj11_mc3"), "utf-8"));
				dFW01_D.setDDJ11_FL3(request.getParameter("ddj11_fl3"));
				dFW01_D.setDDJ11_DW3(request.getParameter("ddj11_dw3"));
				dFW01_D.setDDJ11_DJ3(Double.parseDouble(request
						.getParameter("ddj11_dj3")));
				dFW01_D.setDDJ11_BZGG3(java.net.URLDecoder.decode(
						request.getParameter("ddj11_bzgg3"), "utf-8"));
				dFW01_D.setSYL3(Double.parseDouble(request
						.getParameter("ddj11_syl3")));
				dFW01_D.setDDJ11_JFID4(request.getParameter("ddj11_jfid4"));
				dFW01_D.setDDJ11_MC4(java.net.URLDecoder.decode(
						request.getParameter("ddj11_mc4"), "utf-8"));
				dFW01_D.setDDJ11_FL4(request.getParameter("ddj11_fl4"));
				dFW01_D.setDDJ11_DW4(request.getParameter("ddj11_dw4"));
				dFW01_D.setDDJ11_DJ4(Double.parseDouble(request
						.getParameter("ddj11_dj4")));
				dFW01_D.setDDJ11_BZGG4(java.net.URLDecoder.decode(
						request.getParameter("ddj11_bzgg4"), "utf-8"));
				dFW01_D.setSYL4(Double.parseDouble(request
						.getParameter("ddj11_syl4")));
				dFW01_D.setSMZT(java.net.URLDecoder.decode(
						request.getParameter("smzt"), "utf-8"));
				dFW01_DService.insAdd(dFW01_D);
				if (dFW01_D.getSFJE() != null && !dFW01_D.getSFJE().equals("")) {
					DFW01 dFW01 = dFW01Service.SelectByID(dFW01_D
							.getDFW01_JFID());
					dFW01.setSFJE(dFW01_D.getSFJE() + dFW01.getSFJE());
					dFW01Service.UPJE(dFW01);
				}
				msg.put("result", "0");
				msg.put("dfw01_jfid", dFW01_D.getDFW01_JFID());
				returnjson.printStr(response, msg.toString());
			}

		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 服务处理
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/fwcl_update.zyfzjson", method = RequestMethod.GET)
	public void fw_picture(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		String yhm;
		try {
			yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				String JFID = request.getParameter("dfw01_d_jfid");
				String FWNRLB = request.getParameter("fwnrlb");
				FWNRLB = new String(FWNRLB.getBytes("ISO-8859-1"), "utf-8");
				DFW01_D dFW01_D = dFW01_DService.SelectByJFID(JFID).get(0);
				DDJ02_D dDJ02_D = dDJ02_DService.SelectById(dFW01_D
						.getDDJ02_D_JFID());
				DDJ02 dDJ02 = dDJ02Service.SelectByID(dDJ02_D.getDDJ02_JFID())
						.get(0);
				if (dFW01_D.getLSRQ().equals("-")) {
					dFW01_D.setLSRQ("");
				}
				dFW01_D.setFWNRLB(FWNRLB);
				msg = JSONObject.fromObject(dFW01_D);
				msg.put("result", "0");
				msg.put("df_lb", "6");
				msg.put("df_jfid", dDJ02.getJFID());
				msg.put("df_mc", dDJ02.getMC());
				msg.put("ddj02_d_mj", dDJ02_D.getMJ());
				if (dDJ02.getZPLJ() == null) {
					msg.put("df_tx_lj", "");
				} else {
					msg.put("df_tx_lj", dDJ02.getZPLJ());
				}
				List<DFW01_D_ZP> listdfw01_d_zp = dFW01_D_ZPService
						.SelectBYDK(JFID);
				msg.put("MY_CONSULT", JSONArray.fromObject(listdfw01_d_zp));
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 开始工作取消开始工作
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/ksgz_update.zyfzjson", method = RequestMethod.GET)
	public void fwpj_list(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		String yhm;
		try {
			yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				String dfw01_d_jfid = request.getParameter("dfw01_d_jfid");
				DFW01_D dFW01_D = dFW01_DService.SelectByJFID(dfw01_d_jfid)
						.get(0);
				String lb = request.getParameter("lb");
				if (lb != null && lb.equals("0")) {
					dFW01_D.setZT("2");
					SimpleDateFormat formatter = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");
					dFW01_D.setKSSJ(formatter.parse(formatter
							.format(new Date())));
					dFW01_DService.upDkxx(dFW01_D);
				} else if (lb != null && lb.equals("1")) {
					dFW01_D.setZT("1");
					dFW01_D.setKSSJ(null);
					dFW01_DService.upDkxx(dFW01_D);
					dFW01_D_ZPService.deleteByDFW01_D_JFID(dFW01_D.getJFID());
				}
				msg.put("result", "0");
				msg.put("dfw01_d_jfid", dFW01_D.getJFID());
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 结束工作
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/jsgz_update.zyfzjson", method = RequestMethod.GET)
	public void fwpj_fqc_detail(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		String yhm;
		try {
			yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				String dfw01_d_jfid = request.getParameter("dfw01_d_jfid");
				DFW01_D dFW01_D = dFW01_DService.SelectByJFID(dfw01_d_jfid)
						.get(0);
				dFW01_D.setZT("3");
				SimpleDateFormat formatter = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				dFW01_D.setJSSJ(formatter.parse(formatter.format(new Date())));
				dFW01_DService.upDkxx(dFW01_D);
				msg.put("result", "0");
				msg.put("dfw01_d_jfid", dFW01_D.getJFID());
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 修改防治措施
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/fzcs_update.zyfzjson", method = RequestMethod.GET)
	public void fwpj_qc1_detail(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		String yhm;
		try {
			yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				String fzcsfl = request.getParameter("fzcsfl");
				String ddj01_jfid = request.getParameter("ddj01_jfid");
				String count = request.getParameter("count");
				String ys = request.getParameter("page");
				// 不是必传
				String MC = request.getParameter("mc");
				String FL = request.getParameter("fl");
				Map<String, Object> map = new HashMap<String, Object>();
				Page page = new Page(1, 0, 1);
				if (ys != null) {
					if (ddj01_jfid != null) {
						map.put("DDJ01_JFID", ddj01_jfid);
					}
					if (fzcsfl.equals("1")) {
						// 其他防治
						page.setMax(Integer.parseInt(count)
								* Integer.parseInt(ys));
						page.setMin(Integer.parseInt(count)
								* (Integer.parseInt(ys) - 1) + 1);
						map.put("MAX", page.getMax());
						map.put("MIN", page.getMin());
						if (MC != null && !MC.equals("") || FL != null
								&& !FL.equals("")) {
							List<DDJ11> listddj11 = dDJ11Service
									.selectByQTFlandNameBYZT(page, MC, FL,
											ddj01_jfid);
							msg.put("result", "0");
							msg.put("MY_CONSULT",
									JSONArray.fromObject(listddj11));
							returnjson.printStr(response, msg.toString());
						} else {
							List<DDJ11> listddj11 = dDJ11Service
									.selectAlllistBYQTZT(page, ddj01_jfid);
							msg.put("result", "0");
							msg.put("MY_CONSULT",
									JSONArray.fromObject(listddj11));
							returnjson.printStr(response, msg.toString());
						}
					} else {
						// 农药防治
						page = new Page(
								Integer.parseInt(count),
								dDJ11Service.getCountBYTJZT(ddj01_jfid, MC, FL),
								Integer.parseInt(ys));
						map.put("MAX", page.getMax());
						map.put("MIN", page.getMin());
						if (MC != null && !MC.equals("") || FL != null
								&& !FL.equals("")) {
							List<DDJ11> listddj11 = dDJ11Service
									.selectByFlandNameBYZT(page, MC, FL,
											ddj01_jfid);
							msg.put("result", "0");
							msg.put("MY_CONSULT",
									JSONArray.fromObject(listddj11));
							returnjson.printStr(response, msg.toString());
						} else {
							List<DDJ11> listddj11 = dDJ11Service
									.selectAlllistBYZT(page, ddj01_jfid);
							msg.put("result", "0");
							msg.put("MY_CONSULT",
									JSONArray.fromObject(listddj11));
							returnjson.printStr(response, msg.toString());
						}
					}
				}
			} else {
				msg.put("result", "-2");
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 保存完工确认
	 * 
	 * @param request
	 * @param response
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/fwcl_commit.zyfzjson", method = RequestMethod.POST)
	public void fwcl_commit(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		String yhm;
		try {
			yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				String dfw01_d_jfid = request.getParameter("dfw01_d_jfid");
				DFW01_D dFW01_D = dFW01_DService.SelectByJFID(dfw01_d_jfid)
						.get(0);
				DFW01 dFW01 = dFW01Service.SelectByID(dFW01_D.getDFW01_JFID());
				String lb = request.getParameter("lb");
				List<String> zplb = JSONArray.toList(
						JSONArray.fromObject(request.getParameter("zplb")),
						String.class);
				List<String> pzsj = JSONArray.toList(
						JSONArray.fromObject(request.getParameter("pzsj")),
						String.class);
				List<String> gps_jd = JSONArray.toList(
						JSONArray.fromObject(request.getParameter("gps_jd")),
						String.class);
				List<String> gps_wd = JSONArray.toList(
						JSONArray.fromObject(request.getParameter("gps_wd")),
						String.class);
				List<String> zp = JSONArray.toList(
						JSONArray.fromObject(request.getParameter("zp")),
						String.class);
				// 上传的图片
				Random rdm = new Random(System.currentTimeMillis());// 获得随机种子
				DFW01_D_ZP dFW01_D_ZP = new DFW01_D_ZP();
				if (lb.equals("0")) {
					// 保存
					if (zp.size() >= 1) {
						dFW01_D_ZPService.deleteByDFW01_D_JFID(dfw01_d_jfid);
						for (int i = 0; i < zp.size(); i++) {
							// 唯一文件名
							long time = Math.abs(rdm.nextInt()) % 1000000000;
							CopeFile copeFile=new CopeFile();
							String oldPath=request.getSession().getServletContext().getRealPath("\\assets\\img\\head\\"+time +".jpg") ;
							String newPath=oldPath.split("Myssm")[0]+"Myssm_ZBZ"+oldPath.split("Myssm")[1];
							copeFile.copyFile(oldPath, newPath);
							String saveurl = "//assets//img//head//" + time
									+ ".jpg";
							msg.put("tp", zp.size());
							msg.put("tpnr", zp.get(i));
							if (GenerateImage(zp.get(i), saveurl)) {
								dFW01_D_ZP.setDFW01_D_JFID(dfw01_d_jfid);
								dFW01_D_ZP.setZP_LJ(saveurl);
								dFW01_D_ZP.setZP_WJM(time + ".jpg");
								dFW01_D_ZP.setPZSJ(pzsj.get(i));
								dFW01_D_ZP.setLB(zplb.get(i) + "");
								dFW01_D_ZP.setGPS_DJ(gps_jd.get(i));
								dFW01_D_ZP.setGPS_BW(gps_wd.get(i));
								dFW01_D_ZP.setSL_LJ(saveurl);
								dFW01_D_ZP.setSL_WJM(time + ".jpg");
							} else {
								// 上传失败
								msg.put("result", "-3");
								returnjson.printStr(response, msg.toString());
							}
							dFW01_D_ZPService.insert(dFW01_D_ZP);
						}
					}
					if (dFW01_D.getSFJE() != null) {
						if (dFW01_D.getSFJE() > 0) {
							dFW01.setSFJE(dFW01.getSFJE()
									- dFW01_D.getSFJE()
									+ Double.parseDouble(request
											.getParameter("sfje")));
							dFW01Service.UPJE(dFW01);
						} else {
							dFW01.setSFJE(dFW01.getSFJE()
									+ Double.parseDouble(request
											.getParameter("sfje")));
							dFW01Service.UPJE(dFW01);
						}
					} else {
						dFW01.setSFJE(dFW01.getSFJE()
								+ Double.parseDouble(request
										.getParameter("sfje")));
						dFW01Service.UPJE(dFW01);
					}
					dFW01_D.setZW(request.getParameter("zw"));
					dFW01_D.setFZMJ(Double.parseDouble(request
							.getParameter("fzmj")));
					dFW01_D.setSFJE(Double.parseDouble(request
							.getParameter("sfje")));
					dFW01_D.setSF_FZ(request.getParameter("sf_fz"));
					dFW01_D.setSF_XP(request.getParameter("sf_xp"));
					dFW01_D.setDDJ11_JFID1(request.getParameter("ddj11_jfid1"));
					dFW01_D.setFZDX(java.net.URLDecoder.decode(
							request.getParameter("fzdx"), "utf-8"));
					dFW01_D.setSYQX(java.net.URLDecoder.decode(
							request.getParameter("syqx"), "utf-8"));
					dFW01_D.setZW_MC(java.net.URLDecoder.decode(
							request.getParameter("zwmc"), "utf-8"));
					dFW01_D.setDDJ11_MC1(java.net.URLDecoder.decode(
							request.getParameter("ddj11_mc1"), "utf-8"));
					dFW01_D.setDDJ11_MC2(java.net.URLDecoder.decode(
							request.getParameter("ddj11_mc2"), "utf-8"));
					dFW01_D.setDDJ11_MC3(java.net.URLDecoder.decode(
							request.getParameter("ddj11_mc3"), "utf-8"));
					dFW01_D.setDDJ11_MC4(java.net.URLDecoder.decode(
							request.getParameter("ddj11_mc4"), "utf-8"));
					dFW01_D.setDDJ11_BZGG1(java.net.URLDecoder.decode(
							request.getParameter("ddj11_bzgg1"), "utf-8"));
					dFW01_D.setDDJ11_BZGG2(java.net.URLDecoder.decode(
							request.getParameter("ddj11_bzgg2"), "utf-8"));
					dFW01_D.setDDJ11_BZGG3(java.net.URLDecoder.decode(
							request.getParameter("ddj11_bzgg3"), "utf-8"));
					dFW01_D.setDDJ11_BZGG4(java.net.URLDecoder.decode(
							request.getParameter("ddj11_bzgg4"), "utf-8"));
					dFW01_D.setSMZT(java.net.URLDecoder.decode(
							request.getParameter("smzt"), "utf-8"));
					dFW01_D.setDDJ11_FL1(request.getParameter("ddj11_fl1"));
					dFW01_D.setDDJ11_DW1(request.getParameter("ddj11_dw1"));
					if (request.getParameter("ddj11_dj1") != null) {
						dFW01_D.setDDJ11_DJ1(Double.parseDouble(request
								.getParameter("ddj11_dj1")));
					}
					if (request.getParameter("ddj11_syl1") != null) {
						dFW01_D.setSYL1(Double.parseDouble(request
								.getParameter("ddj11_syl1")));
					}
					dFW01_D.setDDJ11_JFID2(request.getParameter("ddj11_jfid2"));
					dFW01_D.setDDJ11_FL2(request.getParameter("ddj11_fl2"));
					dFW01_D.setDDJ11_DW2(request.getParameter("ddj11_dw2"));
					if (request.getParameter("ddj11_dj2") != null) {
						dFW01_D.setDDJ11_DJ2(Double.parseDouble(request
								.getParameter("ddj11_dj2")));
					}
					if (request.getParameter("ddj11_syl2") != null) {
						dFW01_D.setSYL2(Double.parseDouble(request
								.getParameter("ddj11_syl2")));
					}
					dFW01_D.setDDJ11_JFID3(request.getParameter("ddj11_jfid3"));
					dFW01_D.setDDJ11_FL3(request.getParameter("ddj11_fl3"));
					dFW01_D.setDDJ11_DW3(request.getParameter("ddj11_dw3"));
					if (request.getParameter("ddj11_dj3") != null) {
						dFW01_D.setDDJ11_DJ3(Double.parseDouble(request
								.getParameter("ddj11_dj3")));
					}
					if (request.getParameter("ddj11_syl3") != null) {
						dFW01_D.setSYL3(Double.parseDouble(request
								.getParameter("ddj11_syl3")));
					}
					dFW01_D.setDDJ11_JFID4(request.getParameter("ddj11_jfid4"));
					dFW01_D.setDDJ11_FL4(request.getParameter("ddj11_fl4"));
					dFW01_D.setDDJ11_DW4(request.getParameter("ddj11_dw4"));
					if (request.getParameter("ddj11_dj4") != null) {
						dFW01_D.setDDJ11_DJ4(Double.parseDouble(request
								.getParameter("ddj11_dj4")));
					}
					if (request.getParameter("ddj11_syl4") != null) {
						dFW01_D.setSYL4(Double.parseDouble(request
								.getParameter("ddj11_syl4")));
					}
					if (request.getParameter("kssj") != null
							&& !request.getParameter("kssj").equals("")) {
						SimpleDateFormat formatter = new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss");
						dFW01_D.setKSSJ(formatter.parse(request
								.getParameter("kssj")));
					}
					dFW01_DService.upDkxx(dFW01_D);
					msg.put("result", "0");
					msg.put("dfw01_d_jfid", dfw01_d_jfid);
					returnjson.printStr(response, msg.toString());
				} else if (lb.equals("1")) {
					// 保存图片
					if (zp.size() >= 1) {
						dFW01_D_ZPService.deleteByDFW01_D_JFID(dfw01_d_jfid);
						for (int i = 0; i < zp.size(); i++) {
							// 唯一文件名
							long time = Math.abs(rdm.nextInt()) % 1000000000;
							String saveurl = "//assets//img//head//" + time
									+ ".jpg";
							if (GenerateImage(zp.get(i), saveurl)) {
								dFW01_D_ZP.setDFW01_D_JFID(dfw01_d_jfid);
								dFW01_D_ZP.setZP_LJ(saveurl);
								dFW01_D_ZP.setZP_WJM(time + ".jpg");
								dFW01_D_ZP.setPZSJ(pzsj.get(i));
								dFW01_D_ZP.setLB(zplb.get(i) + "");
								dFW01_D_ZP.setGPS_DJ(gps_jd.get(i));
								dFW01_D_ZP.setGPS_BW(gps_wd.get(i));
								dFW01_D_ZP.setSL_LJ(saveurl);
								dFW01_D_ZP.setSL_WJM(time + ".jpg");
							} else {
								// 上传失败
								msg.put("result", "-3");
								returnjson.printStr(response, msg.toString());
							}
							dFW01_D_ZPService.insert(dFW01_D_ZP);
						}
					}
					if (dFW01_D.getSFJE() != null) {
						if (dFW01_D.getSFJE() > 0) {
							dFW01.setSFJE(dFW01.getSFJE()
									- dFW01_D.getSFJE()
									+ Double.parseDouble(request
											.getParameter("sfje")));
							dFW01Service.UPJE(dFW01);
						} else {
							dFW01.setSFJE(dFW01.getSFJE()
									+ Double.parseDouble(request
											.getParameter("sfje")));
							dFW01Service.UPJE(dFW01);
						}
					} else {
						dFW01.setSFJE(dFW01.getSFJE()
								+ Double.parseDouble(request
										.getParameter("sfje")));
						dFW01Service.UPJE(dFW01);
					}
					dFW01_D.setZW(request.getParameter("zw"));
					dFW01_D.setFZMJ(Double.parseDouble(request
							.getParameter("fzmj")));
					dFW01_D.setSFJE(Double.parseDouble(request
							.getParameter("sfje")));
					dFW01_D.setSF_FZ(request.getParameter("sf_fz"));
					dFW01_D.setSF_XP(request.getParameter("sf_xp"));
					dFW01_D.setDDJ11_JFID1(request.getParameter("ddj11_jfid1"));
					dFW01_D.setFZDX(java.net.URLDecoder.decode(
							request.getParameter("fzdx"), "utf-8"));
					dFW01_D.setSYQX(java.net.URLDecoder.decode(
							request.getParameter("syqx"), "utf-8"));
					dFW01_D.setZW_MC(java.net.URLDecoder.decode(
							request.getParameter("zwmc"), "utf-8"));
					dFW01_D.setDDJ11_MC1(java.net.URLDecoder.decode(
							request.getParameter("ddj11_mc1"), "utf-8"));
					dFW01_D.setDDJ11_MC2(java.net.URLDecoder.decode(
							request.getParameter("ddj11_mc2"), "utf-8"));
					dFW01_D.setDDJ11_MC3(java.net.URLDecoder.decode(
							request.getParameter("ddj11_mc3"), "utf-8"));
					dFW01_D.setDDJ11_MC4(java.net.URLDecoder.decode(
							request.getParameter("ddj11_mc4"), "utf-8"));
					dFW01_D.setDDJ11_BZGG1(java.net.URLDecoder.decode(
							request.getParameter("ddj11_bzgg1"), "utf-8"));
					dFW01_D.setDDJ11_BZGG2(java.net.URLDecoder.decode(
							request.getParameter("ddj11_bzgg2"), "utf-8"));
					dFW01_D.setDDJ11_BZGG3(java.net.URLDecoder.decode(
							request.getParameter("ddj11_bzgg3"), "utf-8"));
					dFW01_D.setDDJ11_BZGG4(java.net.URLDecoder.decode(
							request.getParameter("ddj11_bzgg4"), "utf-8"));
					dFW01_D.setSMZT(java.net.URLDecoder.decode(
							request.getParameter("smzt"), "utf-8"));
					dFW01_D.setDDJ11_FL1(request.getParameter("ddj11_fl1"));
					dFW01_D.setDDJ11_DW1(request.getParameter("ddj11_dw1"));
					if (request.getParameter("ddj11_dj1") != null) {
						dFW01_D.setDDJ11_DJ1(Double.parseDouble(request
								.getParameter("ddj11_dj1")));
					}
					if (request.getParameter("ddj11_syl1") != null) {
						dFW01_D.setSYL1(Double.parseDouble(request
								.getParameter("ddj11_syl1")));
					}
					dFW01_D.setDDJ11_JFID2(request.getParameter("ddj11_jfid2"));
					dFW01_D.setDDJ11_FL2(request.getParameter("ddj11_fl2"));
					dFW01_D.setDDJ11_DW2(request.getParameter("ddj11_dw2"));
					if (request.getParameter("ddj11_dj2") != null) {
						dFW01_D.setDDJ11_DJ2(Double.parseDouble(request
								.getParameter("ddj11_dj2")));
					}
					if (request.getParameter("ddj11_syl2") != null) {
						dFW01_D.setSYL2(Double.parseDouble(request
								.getParameter("ddj11_syl2")));
					}
					dFW01_D.setDDJ11_JFID3(request.getParameter("ddj11_jfid3"));
					dFW01_D.setDDJ11_FL3(request.getParameter("ddj11_fl3"));
					dFW01_D.setDDJ11_DW3(request.getParameter("ddj11_dw3"));
					if (request.getParameter("ddj11_dj3") != null) {
						dFW01_D.setDDJ11_DJ3(Double.parseDouble(request
								.getParameter("ddj11_dj3")));
					}
					if (request.getParameter("ddj11_syl3") != null) {
						dFW01_D.setSYL3(Double.parseDouble(request
								.getParameter("ddj11_syl3")));
					}
					dFW01_D.setDDJ11_JFID4(request.getParameter("ddj11_jfid4"));
					dFW01_D.setDDJ11_FL4(request.getParameter("ddj11_fl4"));
					dFW01_D.setDDJ11_DW4(request.getParameter("ddj11_dw4"));
					if (request.getParameter("ddj11_dj4") != null) {
						dFW01_D.setDDJ11_DJ4(Double.parseDouble(request
								.getParameter("ddj11_dj4")));
					}
					if (request.getParameter("ddj11_syl4") != null) {
						dFW01_D.setSYL4(Double.parseDouble(request
								.getParameter("ddj11_syl4")));
					}
					if (request.getParameter("kssj") != null
							&& !request.getParameter("kssj").equals("")) {
						SimpleDateFormat formatter = new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss");
						dFW01_D.setKSSJ(formatter.parse(request
								.getParameter("kssj")));
					}
					dFW01_DService.upDkxx(dFW01_D);
					Map<String, Object> map = new HashMap<String, Object>();
					User user = userService.SelectByName(yhm);
					map.put("psi_jfid", dFW01_D.getJFID());
					map.put("psi_lrry", user.getJFID());
					map.put("psi_lrry_mc", user.getJFNAME());
					dFW01_DService.p_gddk_wg(map);
					String returnmsg = (String) map.get("pso_return");
					if (returnmsg.equals("0")) {
						msg.put("result", "0");
						msg.put("dfw01_d_jfid", dfw01_d_jfid);
						returnjson.printStr(response, msg.toString());
					} else {
						// 过程失败
						msg.put("result", "-2");
						msg.put("gc", returnmsg);
						returnjson.printStr(response, msg.toString());
					}
				}
			} else {
				msg.put("result", "-3");
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 已处理
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/ycl_list.zyfzjson", method = RequestMethod.POST)
	public void ycl_list(HttpServletRequest request,
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
				String DDJ01_JFID = request.getParameter("ddj01_jfid");
				Map<String, Object> map = new HashMap<String, Object>();
				// Page page = null;
				if (ys != null) {
					if (DDJ01_JFID != null) {
						map.put("DDJ01_JFID", DDJ01_JFID);
					}
					// page = new Page(Integer.parseInt(count),
					// dFW01Service.getCountZT4(map),
					// Integer.parseInt(ys));
					map.put("max",
							Integer.parseInt(count) * Integer.parseInt(ys));
					if (ys.equals("1")) {
						map.put("min", 1);
					} else {
						map.put("min",
								Integer.parseInt(count)
										* (Integer.parseInt(ys) - 1) + 1);
					}
					List<DFW01> listdfw01 = dFW01Service.SelectByPageZT4(map);
					msg.put("result", "0");
					msg.put("MY_CONSULT", JSONArray.fromObject(listdfw01));
					returnjson.printStr(response, msg.toString());
				}
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 已处理返回明细
	 * 
	 * @param request
	 * @param response
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/ycl_detail.zyfzjson", method = RequestMethod.GET)
	public void ycl_detail(HttpServletRequest request,
			HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		String yhm;
		try {
			yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				String dfw01_jfid = request.getParameter("dfw01_jfid");
				String FWNRLB = request.getParameter("fwnrlb");
				FWNRLB = new String(FWNRLB.getBytes("ISO-8859-1"), "utf-8");
				List<DFW01_D> listdfw01_d = dFW01_DService
						.SelectByID(dfw01_jfid);
				for (int i = 0; i < listdfw01_d.size(); i++) {
					listdfw01_d.get(i).setFWNRLB(FWNRLB);
					if (listdfw01_d.get(i).getLSRQ().equals("-")) {
						listdfw01_d.get(i).setLSRQ("");
					}
					listdfw01_d.get(i).setZpjh(
							dFW01_D_ZPService.SelectBYDK(listdfw01_d.get(i)
									.getJFID()));
				}
				msg.put("result", "0");
				msg.put("MY_CONSULT", JSONArray.fromObject(listdfw01_d));
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 处理工单历史
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/clgd_lishi.zyfzjson", method = RequestMethod.GET)
	public void clgd_lishi(HttpServletRequest request,
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
				String DDJ02_D_JFID = request.getParameter("ddj02_d_jfid");
				String FWNRLB = request.getParameter("fwnrlb");
				FWNRLB = new String(FWNRLB.getBytes("ISO-8859-1"), "utf-8");
				Map<String, Object> map = new HashMap<String, Object>();
				if (ys != null) {
					if (DDJ02_D_JFID != null) {
						map.put("DDJ02_D_JFID", DDJ02_D_JFID);
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
					List<DFW01_D> listdfw01_d = dFW01_DService
							.SelectByDDJ02_D_JFIDZT(map);
					for (int i = 0; i < listdfw01_d.size(); i++) {
						listdfw01_d.get(i).setFWNRLB(FWNRLB);
						listdfw01_d.get(i).setZpjh(
								dFW01_D_ZPService.SelectBYDK(listdfw01_d.get(i)
										.getJFID().split("-")[1]));
					}
					msg.put("result", "0");
					msg.put("MY_CONSULT", JSONArray.fromObject(listdfw01_d));
					returnjson.printStr(response, msg.toString());
				}
			} else {
				msg.put("result", "-2");
				returnjson.printStr(response, msg.toString());
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
			User user = userService.SelectByName(yhm);
			if (yhm != null) {
				request.setAttribute("msg", msg);
				String SZ_LB = user.getXXDBLB();
				String SZ_JFID = user.getJFID();
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
				User user = userService.SelectByName(yhm);
				String KEY = user.getXXDBLB() + "," + user.getJFID();
				String str;
				str = (String) eHCacheMSG.getCacheElement(KEY);
				int Max = 0;
				int Min = 0;
				if (str != null) {
					JSONArray array = JSONArray.fromObject(str);
					List<DMSG> listdmsg = JSONArray.toList(array, DMSG.class);
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
	 * 发送消息
	 * 
	 * @param request
	 * @param response
	 */
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
					User user = userService.SelectByName(yhm);
					String SZ_LB = user.getXXDBLB();
					String SZ_JFID = user.getJFID();
					String SZ_MC = user.getJFNAME();
					String SZ_TX_LJ = user.getZPLJ();
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
										ehcacheMSG_INFO.getCache().remove(
												MAPKEY_DF);
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
									ehcacheMSG_INFO.getCache()
											.remove(MAPKEY_DF);
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
						// 处理相关数据
						User user = userService.SelectByName(yhm);
						String SZ_LB = user.getXXDBLB();
						String SZ_JFID = user.getJFID();
						String SZ_MC = user.getJFNAME();
						String SZ_TX_LJ = user.getZPLJ();
						String DF_LB = request.getParameter("df_lb");
						String DF_JFID = request.getParameter("df_jfid");
						String DF_MC = request.getParameter("df_mc");
						String DF_TX_LJ = request.getParameter("df_tx_lj");
						try {
							DF_MC = new String(DF_MC.getBytes("GBK"), "GBK");
						} catch (UnsupportedEncodingException e) {
							e.printStackTrace();
						}
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
											eHCacheMSG.getCache()
													.remove(KEY_DF);
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
											ehcacheMSG_INFO.getCache().remove(
													MAPKEY_DF);
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
									ehcacheMSG_INFO.getCache()
											.remove(MAPKEY_DF);
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
										ehcacheMSG_INFO.getCache().remove(
												MAPKEY_DF);
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
						msg.put("result", "0");
						returnjson.printStr(response, msg.toString());
					} else {
						msg.put("result", "2");
						returnjson.printStr(response, msg.toString());
					}
				}
			} else {
				msg.put("result", "-2");
				returnjson.printStr(response, msg.toString());
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
	 * 获取服务内容类别
	 */
	@RequestMapping(value = "/getfwnrlb.zyfzjson", method = RequestMethod.GET)
	public void getfwnrlb(HttpServletResponse response) {
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		try {
			if (eHCache.getCacheElement("listFWNRLB") == null) {
				List<Dsys11> listFWNRLB = dsys11Service.SelecetAllBM("FWNRLB");
				eHCache.addToCache("listFWNRLB", listFWNRLB, false);
				msg.put("result", "0");
				msg.put("MY_CONSULT", JSONArray.fromObject(listFWNRLB));
				returnjson.printStr(response, msg.toString());
			} else {
				List<Dsys11> listFWNRLB = (List<Dsys11>) eHCache
						.getCacheElement("listFWNRLB");
				msg.put("result", "0");
				msg.put("MY_CONSULT", JSONArray.fromObject(listFWNRLB));
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取地块类型
	 */
	@RequestMapping(value = "/getdklx.zyfzjson", method = RequestMethod.GET)
	public void getdklx(HttpServletResponse response) {
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		try {
			if (eHCache.getCacheElement("listdklx") == null) {
				List<Dsys11> listdklx = dsys11Service.SelecetAllBM("DLX");
				eHCache.addToCache("listdklx", listdklx, false);
				msg.put("result", "0");
				msg.put("MY_CONSULT", JSONArray.fromObject(listdklx));
				returnjson.printStr(response, msg.toString());
			} else {
				List<Dsys11> listdklx = (List<Dsys11>) eHCache
						.getCacheElement("listdklx");
				msg.put("result", "0");
				msg.put("MY_CONSULT", JSONArray.fromObject(listdklx));
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取农作物
	 */
	@RequestMapping(value = "/getzw.zyfzjson", method = RequestMethod.GET)
	public void getzw(HttpServletResponse response) {
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		try {
			if (eHCache.getCacheElement("listzw") == null) {
				List<Dsys11> listzw = dsys11Service.SelecetAllBM("NZW");
				eHCache.addToCache("listzw", listzw, false);
				msg.put("result", "0");
				msg.put("MY_CONSULT", JSONArray.fromObject(listzw));
				returnjson.printStr(response, msg.toString());
			} else {
				List<Dsys11> listzw = (List<Dsys11>) eHCache
						.getCacheElement("listzw");
				msg.put("result", "0");
				msg.put("MY_CONSULT", JSONArray.fromObject(listzw));
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取用户信息
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
				User user = userService.SelectByName(yhm);
				msg = JSONObject.fromObject(user);
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
				User user = new User();
				user.setJFID(request.getParameter("jfid"));
				user.setDH(request.getParameter("dh"));
				user.setDZXX(request.getParameter("dzxx"));
				if (request.getParameter("tpr") != null
						&& !request.getParameter("tpr").equals("")) {
					// 上传的图片
					Random rdm = new Random(System.currentTimeMillis());// 获得随机种子
					// 唯一文件名
					long time = Math.abs(rdm.nextInt()) % 1000000000;
					String saveurl = "//assets//img//head//" + time + ".jpg";
					if (GenerateImage(request.getParameter("tpr"), saveurl)) {
						user.setZPLJ(saveurl);
						user.setZPWJM(time + ".jpg");
					}
					// 同步头像
					CopeFile copeFile = new CopeFile();
					String oldPath = request
							.getSession()
							.getServletContext()
							.getRealPath(
									"\\assets\\img\\head\\" + time + ".jpg");
					String newPath = oldPath.split("Myssm")[0] + "Myssm_ZBZ"
							+ oldPath.split("Myssm")[1];
					copeFile.copyFile(oldPath, newPath);
					// 同步头像聊天信息
					User userup = userService.SelectByName(yhm);
					String KEY = userup.getXXDBLB() + "," + userup.getJFID();
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
				userService.UpUserphone(user);
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
				User user = userService.SelectByName(yhm);
				if (user.getJFPASSWORD().equals(
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
				User user = new User();
				user.setJFID(JFID);
				user.setJFPASSWORD(md5.md5Password(JFPASSWORD));
				userService.uppasword(user);
				msg.put("result", "0");
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

	/**
	 * 获取施药器械
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/getsyqx.zyfzjson", method = RequestMethod.GET)
	public void getsyqx(HttpServletRequest request, HttpServletResponse response) {
		String auth_token = request.getParameter("auth_token");
		JSONObject msg = new JSONObject();
		ReturnJson returnjson = new ReturnJson();
		try {
			String yhm = (String) eHCache.getCacheElement(auth_token);
			if (yhm != null) {
				List<Dsys11> listsyqx = dsys11Service.SelecetAllBM("SYQX");
				msg.put("result", "0");
				msg.put("MY_CONSULT", JSONArray.fromObject(listsyqx));
				returnjson.printStr(response, msg.toString());
			}
		} catch (Exception e) {
			msg.put("result", "-1");
			returnjson.printStr(response, msg.toString());
		}
	}

}
