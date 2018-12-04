package com.ssh.user.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.ssh.user.model.DDJ02;
import com.ssh.user.model.DDJ02_D;
import com.ssh.user.model.DDJ02_DDJ01;
import com.ssh.user.model.DFW01_D;
import com.ssh.user.model.DFW01_D_ZP;
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ02Service;
import com.ssh.user.service.DDJ02_DDJ01Service;
import com.ssh.user.service.DDJ02_DService;
import com.ssh.user.service.DFW01_DService;
import com.ssh.user.service.DFW01_D_ZPService;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.util.EHCache;
import com.ssh.user.util.MD5YZJM;
import com.ssh.user.util.Page;
import com.ssh.user.util.QRUtil;

@Controller
@Scope("prototype")
@RequestMapping("/yhgl")
public class YhglController {
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
	@Autowired
	private DFW01_D_ZPService dFW01_D_ZPService;
	
	private EHCache eHCache = new EHCache("ehcacheMenu");
	private MD5YZJM md5 = new MD5YZJM();

	/**
	 * 用户管理的查询界面
	 */
	@RequestMapping(value = "/sel.do")
	public String gotolist(HttpServletRequest request) {
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
		return "jf_ddj02";
	}

	/**
	 * 判断农户手机号
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/cxtz.do")
	public String cxtz(HttpServletRequest request, Model model) {
		User user = (User) request.getSession().getAttribute("user");
		String tym = "";
		// 查询对应组织下是否有农户
		DDJ02 dDJ02 = dDJ02Service.selectbyZZ(user.getDDJ01_JFID(),
				request.getParameter("YHM"));
		if (dDJ02 != null) {
			model.addAttribute("id", dDJ02.getJFID());
			return "redirect:/yhgl/up.do";
		} else {
			// 判断别的组织是否有这个农户
			List<DDJ02> DDJ02LIST = dDJ02Service.selectByBDZZ(
					user.getDDJ01_JFID(), request.getParameter("YHM"));
			if (DDJ02LIST.size() >= 1) {
				dDJ02 = DDJ02LIST.get(0);
			} else {
				dDJ02 = null;
			}
			if (dDJ02 != null) {
				// 带数据跳添加
				request.setAttribute("dDJ02", dDJ02);
				try {
					if (eHCache.getCacheElement("listxl") == null) {
						List<Dsys11> listxl = dsys11Service
								.SelecetAllBM("ZJ_XL");
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
				return "jf_dd02_add_dcs";
			} else {
				// 是否有这个用户
				List<DDJ02> DDJ02list = dDJ02Service.selecByYHM(request
						.getParameter("YHM"));
				if (DDJ02list.size() >= 1) {
					dDJ02 = DDJ02list.get(0);
				} else {
					dDJ02 = null;
				}
				if (dDJ02 != null) {
					// 带数据跳跳添加
					request.setAttribute("dDJ02", dDJ02);
					try {
						if (eHCache.getCacheElement("listxl") == null) {
							List<Dsys11> listxl = dsys11Service
									.SelecetAllBM("ZJ_XL");
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
					return "jf_dd02_add_dcs";
				} else {
					request.setAttribute("YHM", request.getParameter("YHM"));
					tym = "jf_dd02_add";
				}
			}
		}
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
		return tym;
	}

	/**
	 * 插入对应组织下的农户信息
	 */
	@RequestMapping(value = "/addnh.do")
	public String addzznonghu(HttpServletRequest request, Model model) {
		try {
			User user = (User) request.getSession().getAttribute("user");
			String JFID = "";
			if (request.getParameter("JFID") == null) {
				JFID = dDJ02Service.getID();
				model.addAttribute("id", JFID);
				DDJ02 dDJ02 = new DDJ02();
				dDJ02.setJFID(JFID);
				dDJ02.setYHM(request.getParameter("YHM"));
				dDJ02.setJFPASSWORD(md5.md5Password(request
						.getParameter("JFPASSWORD")));
				dDJ02.setMC(new String(request.getParameter("MC").getBytes(
						"ISO8859-1"), "GBK"));

				dDJ02.setXZQH(request.getParameter("XZQH"));
				dDJ02.setDZ(new String(request.getParameter("DZ").getBytes(
						"ISO8859-1"), "GBK"));
				dDJ02.setYDDH(request.getParameter("YDDH"));
				dDJ02.setYHLB(request.getParameter("YHLB"));
				if (request.getParameter("SCMJ") != null
						&& !request.getParameter("SCMJ").equals("")) {
					dDJ02.setSCMJ(Double.parseDouble(request
							.getParameter("SCMJ")));
				}
				if (request.getParameter("YHLB").equals("1")) {
					dDJ02.setXB(request.getParameter("XB"));
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					try {
						dDJ02.setSR(format.parse(request.getParameter("SR")));
					} catch (ParseException e) {
						e.printStackTrace();
					}
					dDJ02.setXL(request.getParameter("XL"));
					dDJ02.setJTRK(Integer.parseInt(request.getParameter("JTRK")));
					dDJ02.setRJSR(Double.parseDouble(request
							.getParameter("RJSR")));
					dDJ02.setYX(request.getParameter("YX"));
					if (request.getParameter("BZ") != null
							&& !request.getParameter("BZ").equals("")) {
						dDJ02.setBZ(new String(request.getParameter("BZ")
								.getBytes("ISO8859-1"), "GBK"));
					}
					dDJ02.setLRRY(Integer.parseInt(user.getJFID()));
					dDJ02.setLRRY_MC(user.getJFNAME());
					SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
					dDJ02.setLRRQ(sdf.parse(sdf.format(new Date())));
				} else {
					dDJ02.setXB(request.getParameter("XBN"));
					if (request.getParameter("SRN") != null
							&& !request.getParameter("SRN").equals("")) {
						SimpleDateFormat format = new SimpleDateFormat(
								"yyyy-MM-dd");
						try {
							dDJ02.setSR(format.parse(request
									.getParameter("SRN")));
						} catch (ParseException e) {
							e.printStackTrace();
						}
					}
					dDJ02.setXL(request.getParameter("XLN"));
					if (request.getParameter("JTRKN") != null
							&& !request.getParameter("JTRKN").equals("")) {
						dDJ02.setJTRK(Integer.parseInt(request
								.getParameter("JTRKN")));
					}
					if (request.getParameter("RJSRN") != null
							&& !request.getParameter("RJSRN").equals("")) {
						dDJ02.setRJSR(Double.parseDouble(request
								.getParameter("RJSRN")));
					}
					dDJ02.setYX(request.getParameter("YX"));
					if (request.getParameter("BZ") != null
							&& !request.getParameter("BZ").equals("")) {
						dDJ02.setBZ(new String(request.getParameter("BZ")
								.getBytes("ISO8859-1"), "GBK"));
					}
					dDJ02.setLRRY(Integer.parseInt(user.getJFID()));
					dDJ02.setLRRY_MC(user.getJFNAME());
					SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
					dDJ02.setLRRQ(sdf.parse(sdf.format(new Date())));
				}
				dDJ02Service.insddj02(dDJ02);
			} else {
				JFID = request.getParameter("JFID");
				model.addAttribute("id", JFID);
				// 更新数据
				DDJ02 dDJ02 = new DDJ02();
				dDJ02.setJFID(request.getParameter("JFID"));
				try {
					dDJ02.setMC(new String(request.getParameter("MC").getBytes(
							"ISO8859-1"), "GBK"));
					dDJ02.setXZQH(request.getParameter("XZQH"));
					dDJ02.setDZ(new String(request.getParameter("DZ").getBytes(
							"ISO8859-1"), "GBK"));
					dDJ02.setYDDH(request.getParameter("YDDH"));
					dDJ02.setYHLB(request.getParameter("YHLB"));
					if (request.getParameter("YHLB").equals("1")) {
						dDJ02.setXB(request.getParameter("XB"));
						if (request.getParameter("SR") != null
								&& !request.getParameter("SR").equals("")) {
							SimpleDateFormat format = new SimpleDateFormat(
									"yyyy-MM-dd");
							dDJ02.setSR(format.parse(request.getParameter("SR")));
						}
						dDJ02.setXL(request.getParameter("XL"));
						if (request.getParameter("JTRK") != null
								&& !request.getParameter("JTRK").equals("")) {
							dDJ02.setJTRK(Integer.parseInt(request
									.getParameter("JTRK")));
						}
						if (request.getParameter("RJSR") != null
								&& !request.getParameter("RJSR").equals("")) {
							dDJ02.setRJSR(Double.parseDouble(request
									.getParameter("RJSR")));
						}
					} else {
						dDJ02.setXB(request.getParameter("XBN"));
						if (request.getParameter("SRN") != null
								&& !request.getParameter("SRN").equals("")) {
							SimpleDateFormat format = new SimpleDateFormat(
									"yyyy-MM-dd");
							dDJ02.setSR(format.parse(request
									.getParameter("SRN")));
						}
						dDJ02.setXL(request.getParameter("XLN"));
						if (request.getParameter("JTRKN") != null
								&& !request.getParameter("JTRKN").equals("")) {
							dDJ02.setJTRK(Integer.parseInt(request
									.getParameter("JTRKN")));
						}
						if (request.getParameter("RJSRN") != null
								&& !request.getParameter("RJSRN").equals("")) {
							dDJ02.setRJSR(Double.parseDouble(request
									.getParameter("RJSRN")));
						}
					}
					dDJ02.setYX(request.getParameter("YX"));
					if (request.getParameter("SCMJ") != null
							&& !request.getParameter("SCMJ").equals("")) {
						dDJ02.setSCMJ(Double.parseDouble(request
								.getParameter("SCMJ")));
					}
					if (request.getParameter("BZ") != null
							&& !request.getParameter("BZ").equals("")) {
						dDJ02.setBZ(new String(request.getParameter("BZ")
								.getBytes("ISO8859-1"), "GBK"));
					}

					dDJ02Service.upnhxx(dDJ02);
					if (request.getParameter("FWNR") != null) {
						DDJ02_DDJ01 dDJ02_DDJ01 = new DDJ02_DDJ01();
						dDJ02_DDJ01.setDDJ01_JFID(user.getJFID());
						dDJ02_DDJ01.setDDJ02_JFID(dDJ02.getJFID());
						dDJ02_DDJ01.setFWNR(new String(request.getParameter(
								"FWNR").getBytes("ISO8859-1"), "GBK"));
						dDJ02_DDJ01Service.upsj(dDJ02_DDJ01);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			DDJ02_DDJ01 dDJ02_DDJ01 = new DDJ02_DDJ01();
			dDJ02_DDJ01.setDDJ01_JFID(user.getDDJ01_JFID());
			dDJ02_DDJ01.setDDJ02_JFID(JFID);
			if (request.getParameter("FWNR") != null) {
				dDJ02_DDJ01.setFWNR(new String(request.getParameter("FWNR")
						.getBytes("ISO8859-1"), "GBK"));
			}
			dDJ02_DDJ01Service.insedd02_d(dDJ02_DDJ01);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return "redirect:/yhgl/up.do";
	}

	/**
	 * 去往更新界面
	 */
	@RequestMapping(value = "/up.do")
	public String gotoup(HttpServletRequest request) {
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
		return "jf_dd02_up";
	}

	/**
	 * 添加对应地块
	 */
	@RequestMapping(value = "/adddk.do")
	public String adddk(DDJ02_D dDJ02_D, HttpServletRequest request, Model model) {
		User user = (User) request.getSession().getAttribute("user");
		try {
			dDJ02_D.setDH(new String(dDJ02_D.getDH().getBytes("ISO8859-1"),
					"GBK"));
			if (dDJ02_D.getNZW().equals("99")) {
				dDJ02_D.setNZW_MC(new String(dDJ02_D.getNZW_MC().getBytes(
						"ISO8859-1"), "GBK"));
			}
			if (dDJ02_D.getBZ() != null && !dDJ02_D.equals("")) {
				dDJ02_D.setBZ(new String(dDJ02_D.getBZ().getBytes("ISO8859-1"),
						"GBK"));
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		dDJ02_D.setLRRY(user.getJFID());
		dDJ02_D.setLRRYMC(user.getJFNAME());
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
		try {
			dDJ02_D.setLRRQ(sdf.parse(sdf.format(new Date())));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		dDJ02_DService.insDDXX(dDJ02_D);
		model.addAttribute("id", dDJ02_D.getDDJ02_JFID());
		return "redirect:/yhgl/up.do";
	}

	/**
	 * 修改地快信息
	 */
	@RequestMapping(value = "/updk.do")
	public String updkxx(HttpServletRequest request) {
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
		return "jf_dd02_dk_up";
	}

	/**
	 * 保存地块修改
	 */
	@RequestMapping(value = "/bcupdk.do")
	public String bcdkxg(DDJ02_D dDJ02_D, Model model) {
		try {
			dDJ02_D.setDH(new String(dDJ02_D.getDH().getBytes("ISO8859-1"),
					"GBK"));
			if (dDJ02_D.getNZW().equals("99")) {
				dDJ02_D.setNZW_MC(new String(dDJ02_D.getNZW_MC().getBytes(
						"ISO8859-1"), "GBK"));
			} else {
				dDJ02_D.setNZW_MC("");
			}
			if (dDJ02_D.getBZ() != null && !dDJ02_D.equals("")) {
				dDJ02_D.setBZ(new String(dDJ02_D.getBZ().getBytes("ISO8859-1"),
						"GBK"));
			}
			dDJ02_DService.uodkxx(dDJ02_D);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		model.addAttribute("id", dDJ02_D.getDDJ02_JFID());
		return "redirect:/yhgl/up.do";
	}

	/**
	 * 删除地块信息
	 */
	@RequestMapping(value = "/deldk.do")
	public String deldk(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		dDJ02_DService.delddj02_d(id);
		model.addAttribute("id", request.getParameter("upid"));
		return "redirect:/yhgl/up.do";
	}

	/**
	 * 修改农户信息
	 */
	@RequestMapping(value = "/xgnhxx.do")
	public String xgnhxx(HttpServletRequest request, Model model) {
		User user = (User) request.getSession().getAttribute("user");
		DDJ02 dDJ02 = new DDJ02();
		dDJ02.setJFID(request.getParameter("JFID"));
		try {
			dDJ02.setMC(new String(request.getParameter("MC").getBytes(
					"ISO8859-1"), "GBK"));
			dDJ02.setXZQH(request.getParameter("XZQH"));
			dDJ02.setDZ(new String(request.getParameter("DZ").getBytes(
					"ISO8859-1"), "GBK"));
			dDJ02.setYDDH(request.getParameter("YDDH"));
			dDJ02.setYHLB(request.getParameter("YHLB"));
			if (request.getParameter("YHLB").equals("1")) {
				dDJ02.setXB(request.getParameter("XB"));
				if (request.getParameter("SR") != null
						&& !request.getParameter("SR").equals("")) {
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					dDJ02.setSR(format.parse(request.getParameter("SR")));
				}
				dDJ02.setXL(request.getParameter("XL"));
				if (request.getParameter("JTRK") != null) {
					dDJ02.setJTRK(Integer.parseInt(request.getParameter("JTRK")));
				}
				if (request.getParameter("RJSR") != null) {
					dDJ02.setRJSR(Double.parseDouble(request
							.getParameter("RJSR")));
				}
			} else {
				dDJ02.setXB(request.getParameter("XBN"));
				if (request.getParameter("SRN") != null) {
					if (!request.getParameter("SRN").equals("")) {
						SimpleDateFormat format = new SimpleDateFormat(
								"yyyy-MM-dd");
						dDJ02.setSR(format.parse(request.getParameter("SRN")));
					} else {
						dDJ02.setSR(null);
					}
				}
				dDJ02.setXL(request.getParameter("XLN"));
				if (request.getParameter("JTRKN") != null) {
					if (!request.getParameter("JTRKN").equals("")) {
						dDJ02.setJTRK(Integer.parseInt(request
								.getParameter("JTRKN")));
					} else {
						dDJ02.setJTRK(0);
					}
				}
				if (request.getParameter("RJSRN") != null) {
					if (!request.getParameter("RJSRN").equals("")) {
						dDJ02.setRJSR(Double.parseDouble(request
								.getParameter("RJSRN")));
					} else {
						dDJ02.setRJSR(0.0);
					}
				}
			}
			dDJ02.setYX(request.getParameter("YX"));
			if (request.getParameter("SCMJ") != null) {
				String SCMJ = request.getParameter("SCMJ");
				if (SCMJ.equals("")) {
					dDJ02.setSCMJ(0.0);
				} else {
					dDJ02.setSCMJ(Double.parseDouble(request
							.getParameter("SCMJ")));
				}
			}
			if (request.getParameter("BZ") != null) {
				if (!request.getParameter("BZ").equals("")) {
					dDJ02.setBZ(new String(request.getParameter("BZ").getBytes(
							"ISO8859-1"), "GBK"));
				} else {
					dDJ02.setBZ("");
				}
			}

			dDJ02Service.upnhxx(dDJ02);
			if (request.getParameter("FWNR") != null) {
				DDJ02_DDJ01 dDJ02_DDJ01 = new DDJ02_DDJ01();
				dDJ02_DDJ01.setDDJ01_JFID(user.getJFID());
				dDJ02_DDJ01.setDDJ02_JFID(dDJ02.getJFID());
				if (!request.getParameter("FWNR").equals("")) {
					dDJ02_DDJ01.setFWNR(new String(request.getParameter("FWNR")
							.getBytes("ISO8859-1"), "GBK"));
				} else {
					dDJ02_DDJ01.setFWNR(request.getParameter("FWNR"));
				}
				dDJ02_DDJ01Service.upsj(dDJ02_DDJ01);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("id", dDJ02.getJFID());
		return "redirect:/yhgl/up.do";
	}

	/**
	 * 删除关系表
	 */
	@RequestMapping(value = "/delgxb.do")
	public String delgxb(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		DDJ02_DDJ01 dDJ02_DDJ01 = new DDJ02_DDJ01();
		dDJ02_DDJ01.setDDJ01_JFID(user.getDDJ01_JFID());
		dDJ02_DDJ01.setDDJ02_JFID(request.getParameter("id"));
		dDJ02_DDJ01Service.delgxb(dDJ02_DDJ01);
		return "redirect:/yhgl/sel.do";
	}

	/**
	 * 修改密码
	 */
	@RequestMapping(value = "/upmm.do")
	public String upmm(HttpServletRequest request, Model model) {
		String JFID = request.getParameter("JFID");
		String JFPASSWORD = request.getParameter("JFPASSWORD");
		DDJ02 dDJ02 = new DDJ02();
		dDJ02.setJFID(JFID);
		dDJ02.setJFPASSWORD(md5.md5Password(JFPASSWORD));
		dDJ02Service.uppassword(dDJ02);
		model.addAttribute("id", JFID);
		return "redirect:/yhgl/up.do";
	}

	/**
	 * 生成二维码
	 */
	@RequestMapping(value = "/scewm.do")
	public String scewm(HttpServletRequest request, HttpServletResponse response) {
		String JFID = request.getParameter("JFID");
		String DDJ02_JFID = request.getParameter("DDJ02_JFID");
		DDJ02_D dDJ02_D = dDJ02_DService.SelectById(JFID);
		request.setAttribute("dDJ02_D", dDJ02_D);
		DDJ02 dDJ02 = dDJ02Service.SelectByID(DDJ02_JFID).get(0);
		request.setAttribute("dDJ02", dDJ02);
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
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "dk_ewm";
	}

	@RequestMapping(value = "/wcewm.do")
	public void wcewm(HttpServletRequest request, HttpServletResponse response) {
		String MC = request.getParameter("MC");
		String MJ = request.getParameter("MJ");
		String DH = request.getParameter("DH");
		String DLX = request.getParameter("DLX");
		try {
			if (DH != null && !DH.equals("")) {
				DH = new String(DH.getBytes("ISO8859-1"), "GBK");
			}
			if (MC != null && !MC.equals("")) {
				MC = new String(MC.getBytes("ISO8859-1"), "GBK");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String text = "http://218.247.232.15:8080/Myssm/"
				+ request.getParameter("path")+"&MC="+MC+"&MJ="+MJ+"&DH="+DH+"&DLX="+DLX;
		int width = 300;
		int height = 300;
		// 二维码的图片格式
		String format = "png";
		Hashtable hints = new Hashtable();
		// 内容所使用编码
		hints.put(EncodeHintType.CHARACTER_SET, "GBK");
		BitMatrix bitMatrix;
		try {
			bitMatrix = new MultiFormatWriter().encode(text,
					BarcodeFormat.QR_CODE, width, height, hints);
			// 生成二维码
			QRUtil.writeToStream(bitMatrix, format, response.getOutputStream());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/ewmcx.do")
	public String ewmcx(HttpServletRequest request, HttpServletResponse response) {
		String DDJ02_D_JFID = request.getParameter("DDJ02_D_JFID");
		String MC = request.getParameter("MC");
		String MJ = request.getParameter("MJ");
		String DH = request.getParameter("DH");
		String DLX = request.getParameter("DLX");
		try {
			if (DH != null && !DH.equals("")) {
				DH = new String(DH.getBytes("ISO8859-1"), "UTF-8");
			}
			if (MC != null && !MC.equals("")) {
				MC = new String(MC.getBytes("ISO8859-1"), "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		request.setAttribute("MC",MC);
		request.setAttribute("MJ",MJ);
		request.setAttribute("DH",DH);
		request.setAttribute("DLX",DLX);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("DDJ02_D_JFID", DDJ02_D_JFID);
		List<DFW01_D> listdfw01_d = dFW01_DService
				.SelectByDDJ02_D_JFID(map);
		for (int i = 0; i < listdfw01_d.size(); i++) {
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
		return "ewm";
	}
	@RequestMapping(value = "/cktp.do")
	public String cktp(HttpServletRequest request, HttpServletResponse response) {
		String DFW01_D_JFID=request.getParameter("dfw01_d_jfid");
		List<DFW01_D_ZP> listdfw01_d_zp=dFW01_D_ZPService.SelectBYDK(DFW01_D_JFID);
		String YJPZ="";
		String XCZY="";
		String FZDX="";
		String TSQK="";
		for (int i = 0; i < listdfw01_d_zp.size(); i++) {
			if (listdfw01_d_zp.get(i).getLB().equals("0")) {
				YJPZ="1";
			}
			if (listdfw01_d_zp.get(i).getLB().equals("1")) {
				XCZY="1";
			}
			if (listdfw01_d_zp.get(i).getLB().equals("2")) {
				FZDX="1";
			}
			if (listdfw01_d_zp.get(i).getLB().equals("3")) {
				TSQK="1";
			}
		}
		request.setAttribute("YJPZ",YJPZ);
		request.setAttribute("XCZY",XCZY);
		request.setAttribute("FZDX",FZDX);
		request.setAttribute("TSQK",TSQK);
		request.setAttribute("listdfw01_d_zp",listdfw01_d_zp);
		return "ewmTP";
	}
}
