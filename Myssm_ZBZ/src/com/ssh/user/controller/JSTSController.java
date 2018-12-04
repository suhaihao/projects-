package com.ssh.user.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.ssh.user.model.DDJ01_D;
import com.ssh.user.model.DDJ01_JL;
import com.ssh.user.model.DDJ01_PJ;
import com.ssh.user.model.DDJ02;
import com.ssh.user.model.DDJ11;
import com.ssh.user.model.DFW11;
import com.ssh.user.model.DFW11_D;
import com.ssh.user.model.DFW21;
import com.ssh.user.model.DFW21_FJ;
import com.ssh.user.model.DFW21_JSR;
import com.ssh.user.model.DFW22;
import com.ssh.user.model.DFW22_CKWJ;
import com.ssh.user.model.DFW22_FJ;
import com.ssh.user.model.DFW22_JSR;
import com.ssh.user.model.DSYS05;
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ01Service;
import com.ssh.user.service.DDJ01_JLService;
import com.ssh.user.service.DDJ11Service;
import com.ssh.user.service.DFW11Service;
import com.ssh.user.service.DFW21Service;
import com.ssh.user.service.DFW22Service;
import com.ssh.user.service.DSYS05Service;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.service.UserService;
import com.ssh.user.util.CopeFile;
import com.ssh.user.util.EHCache;
import com.ssh.user.util.MD5YZJM;
import com.ssh.user.util.Page;

@Controller
@Scope("prototype")
@RequestMapping(value = "/jsts")
public class JSTSController implements ServletConfigAware, ServletContextAware {
	@Autowired
	private DFW22Service dFW22Service;
	@Autowired
	private DDJ01Service dDJ01Service;
	@Autowired
	private DFW11Service dFW11Service;
	@Autowired
	private Dsys11Service dsys11Service;
	private EHCache eHCache = new EHCache("ehcacheMenu_zbz");

	private ServletContext servletContext;
	private ServletConfig servletConfig;

	@Override
	public void setServletContext(ServletContext arg0) {
		this.servletContext = arg0;

	}

	@Override
	public void setServletConfig(ServletConfig arg0) {
		this.servletConfig = arg0;

	}

	/**
	 * 主页面查询数据
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/sel.do")
	public String sel(HttpServletRequest request) {
		String StarTime = request.getParameter("StarTime");
		String EndTime = request.getParameter("EndTime");
		String BT = request.getParameter("BT");
		try {
			if (BT != null && !BT.equals("")) {
				BT = new String(BT.getBytes("ISO8859-1"), "GBK");
			}
			if (request.getSession().getAttribute("msg") != null
					&& !request.getSession().getAttribute("msg").equals("")) {
				request.setAttribute("msg", java.net.URLDecoder.decode(
						(String) request.getSession().getAttribute("msg"),
						"GBK"));
				request.getSession().removeAttribute("msg");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String ys = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
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
			if (BT != null) {
				map.put("BT", BT);
				request.setAttribute("BT", BT);
			}
			page = new Page(10, dFW22Service.getCount(map), 1);
		} else {
			if (StarTime == null && EndTime == null && BT == null) {

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
				if (BT != null) {
					map.put("BT", BT);
					request.setAttribute("BT", BT);
				}
				page = new Page(10, dFW22Service.getCount(map),
						Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		map.put("MAX", page.getMax());
		map.put("MIN", page.getMin());
		List<DFW22> listdfw22 = dFW22Service.SelectAll(map);
		request.setAttribute("listdfw22", listdfw22);
		return "jf_dfw22_jsts";
	}

	/**
	 * 选择知识库
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/selzsk.do")
	public String selzsk(HttpServletRequest request,
			HttpServletResponse response) {
		String FL = request.getParameter("FL");
		String BT = request.getParameter("BT");
		if (BT != null && !BT.equals("")) {
			try {
				BT = new String(BT.getBytes("ISO8859-1"), "GBK");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		String ys = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
		Page page = null;
		if (ys == null) {
			if (FL != null) {
				map.put("FL", FL);
				request.setAttribute("FL", FL);
			}
			if (BT != null) {
				map.put("BT", BT);
				request.setAttribute("BT", BT);
			}
			page = new Page(10, dFW11Service.GetCount(map), 1);
		} else {
			if (FL == null && BT == null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				if (FL != null) {
					map.put("FL", FL);
					request.setAttribute("FL", FL);
				}
				if (BT != null) {
					map.put("BT", BT);
					request.setAttribute("BT", BT);
				}
				page = new Page(10, dFW11Service.GetCount(map),
						Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		map.put("MAX", page.getMax());
		map.put("MIN", page.getMin());
		List<DFW11> listdfw11 = dFW11Service.SelectByPageAll(map);
		request.setAttribute("listdfw11", listdfw11);
		try {
			if (eHCache.getCacheElement("listhxjsfl") == null) {
				List<Dsys11> listhxjsfl = dsys11Service.SelecetAllBM("HXJSFL");
				request.setAttribute("listhxjsfl", listhxjsfl);
				eHCache.addToCache("listhxjsfl", listhxjsfl, false);
			} else {
				List<Dsys11> listhxjsfl = (List<Dsys11>) eHCache
						.getCacheElement("listhxjsfl");
				request.setAttribute("listhxjsfl", listhxjsfl);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "dfw22_zsk";
	}

	/**
	 * 添加通知信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/add.do")
	public String add(HttpServletRequest request, HttpServletResponse response,
			Model model) {
		User user = (User) request.getSession().getAttribute("user");
		String DDJ01_JFIDS = request.getParameter("DDJ01_JFIDS");
		String JFID = dFW22Service.getJFID();
		model.addAttribute("JFID", JFID);
		if (DDJ01_JFIDS == null) {
			int maxFileSize = 50;// 兆
			Random rdm = new Random(System.currentTimeMillis());// 获得随机种子
			SmartUpload mySmartUpload = new SmartUpload();
			try {
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
							request.getSession().setAttribute("msg",
									"文件不能超过50兆");
							return "redirect:/jsts/sel.do";
						}
						myfile.saveAs("/assets/fj/" + time + hz);
						CopeFile copeFile = new CopeFile();
						String oldPath = request.getSession()
								.getServletContext()
								.getRealPath("\\assets\\fj\\" + time + hz);
						String newPath = oldPath.split("Myssm_ZBZ")[0]
								+ "Myssm" + oldPath.split("Myssm_ZBZ")[1];
						copeFile.copyFile(oldPath, newPath);
						saveurl = "//assets//fj//" + time + hz;
						if (i == 0) {
							// 插入主表
							DFW22 dFW22 = new DFW22();
							dFW22.setJFID(JFID);
							dFW22.setBT(mySmartUpload.getRequest()
									.getParameter("BT"));
							dFW22.setNR(mySmartUpload.getRequest()
									.getParameter("NR"));
							dFW22.setLRRY(user.getJFNAME());
							dFW22.setLRRQ(new Date());
							dFW22.setZT(mySmartUpload.getRequest()
									.getParameter("ZT"));
							dFW22.setSF_ALL(mySmartUpload.getRequest()
									.getParameter("SF_ALL"));
							dFW22Service.insert(dFW22);
							// 插入发送人员表
							if (mySmartUpload.getRequest()
									.getParameter("SF_ALL").equals("0")) {
								String DDJ01_JFIDAll = mySmartUpload
										.getRequest().getParameter(
												"DDJ01_JFIDS");
								String DDJ01_MCAll = mySmartUpload.getRequest()
										.getParameter("DDJ01_MCS");
								String[] DDJ01_JFIDSZ = DDJ01_JFIDAll
										.split(",");
								String[] DDJ01_MCSZ = DDJ01_MCAll.split(",");
								DFW22_JSR dFW22_JSR = new DFW22_JSR();
								dFW22_JSR.setDFW22_JFID(JFID);
								dFW22_JSR.setZT("0");
								for (int j = 0; j < DDJ01_JFIDSZ.length; j++) {
									dFW22_JSR.setDDJ01_JFID(DDJ01_JFIDSZ[j]);
									dFW22_JSR.setDDJ01_MC(DDJ01_MCSZ[j]);
									dFW22Service.insert_jsr(dFW22_JSR);
								}
							} else {
								List<DDJ01> listddj01 = dDJ01Service
										.SelectAlllSize();
								DFW22_JSR dFW22_JSR = new DFW22_JSR();
								dFW22_JSR.setDFW22_JFID(JFID);
								dFW22_JSR.setZT("0");
								for (int j = 0; j < listddj01.size(); j++) {
									dFW22_JSR.setDDJ01_JFID(listddj01.get(j)
											.getJFID());
									dFW22_JSR.setDDJ01_MC(listddj01.get(j)
											.getMC());
									dFW22Service.insert_jsr(dFW22_JSR);
								}
							}
							// 插入知识库中间
							String DFW11_JFIDAll = mySmartUpload.getRequest()
									.getParameter("DFW11_JFIDS");
							String DFW11_MCAll = mySmartUpload.getRequest()
									.getParameter("DFW11_MCS");
							if (DFW11_JFIDAll != null
									&& !DFW11_JFIDAll.equals("")) {
								String[] DFW11_JFIDSZ = DFW11_JFIDAll
										.split(",");
								String[] DFW11_MCSZ = DFW11_MCAll.split(",");
								DFW22_CKWJ dFW22_CKWJ = new DFW22_CKWJ();
								for (int j = 0; j < DFW11_JFIDSZ.length; j++) {
									dFW22_CKWJ.setDFW11_BT(DFW11_MCSZ[j]);
									dFW22_CKWJ.setDFW11_JFID(DFW11_JFIDSZ[j]);
									dFW22_CKWJ.setDFW22_JFID(JFID);
									dFW22Service.insert_ckwj(dFW22_CKWJ);
								}
							}

							DFW22_FJ dFW22_FJ = new DFW22_FJ();
							dFW22_FJ.setDFW22_JFID(JFID);
							dFW22_FJ.setFJ(saveurl);
							dFW22_FJ.setWJM(wjm);
							dFW22Service.insert_fj(dFW22_FJ);
						} else {
							DFW22_FJ dFW22_FJ = new DFW22_FJ();
							dFW22_FJ.setDFW22_JFID(JFID);
							dFW22_FJ.setFJ(saveurl);
							dFW22_FJ.setWJM(wjm);
							dFW22Service.insert_fj(dFW22_FJ);
						}
					}
				}
				if (mySmartUpload.getRequest().getParameter("ZT").equals("2")) {
					return "redirect:/jsts/sel.do";
				}
				return "redirect:/jsts/gotoup.do";
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			String BT = request.getParameter("BT");
			String NR = request.getParameter("NR");
			String ZT = request.getParameter("ZT");
			String SF_ALL = request.getParameter("SF_ALL");
			String DDJ01_MCS = request.getParameter("DDJ01_MCS");
			String DFW11_JFIDAll = request.getParameter("DFW11_JFIDS");
			String DFW11_MCAll = request.getParameter("DFW11_MCS");
			try {
				if (BT != null && !BT.equals("")) {
					BT = new String(BT.getBytes("ISO8859-1"), "GBK");
				}
				if (NR != null && !NR.equals("")) {
					NR = new String(NR.getBytes("ISO8859-1"), "GBK");
				}
				if (DDJ01_MCS != null && !DDJ01_MCS.equals("")) {
					DDJ01_MCS = new String(DDJ01_MCS.getBytes("ISO8859-1"),
							"GBK");
				}
				if (DFW11_MCAll != null && !DFW11_MCAll.equals("")) {
					DFW11_MCAll = new String(DFW11_MCAll.getBytes("ISO8859-1"),
							"GBK");
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			// 插入主表
			DFW22 dFW22 = new DFW22();
			dFW22.setJFID(JFID);
			dFW22.setBT(BT);
			dFW22.setNR(NR);
			dFW22.setLRRY(user.getJFNAME());
			dFW22.setLRRQ(new Date());
			dFW22.setZT(ZT);
			dFW22.setSF_ALL(SF_ALL);
			dFW22Service.insert(dFW22);
			// 插入从表
			if (SF_ALL.equals("0")) {
				String[] DDJ01_JFIDSZ = DDJ01_JFIDS.split(",");
				String[] DDJ01_MCSZ = DDJ01_MCS.split(",");
				DFW22_JSR dFW22_JSR = new DFW22_JSR();
				dFW22_JSR.setDFW22_JFID(JFID);
				dFW22_JSR.setZT("0");
				for (int j = 0; j < DDJ01_JFIDSZ.length; j++) {
					dFW22_JSR.setDDJ01_JFID(DDJ01_JFIDSZ[j]);
					dFW22_JSR.setDDJ01_MC(DDJ01_MCSZ[j]);
					dFW22Service.insert_jsr(dFW22_JSR);
				}
			} else {
				List<DDJ01> listddj01 = dDJ01Service.SelectAlllSize();
				DFW22_JSR dFW22_JSR = new DFW22_JSR();
				dFW22_JSR.setDFW22_JFID(JFID);
				dFW22_JSR.setZT("0");
				for (int j = 0; j < listddj01.size(); j++) {
					dFW22_JSR.setDDJ01_JFID(listddj01.get(j).getJFID());
					dFW22_JSR.setDDJ01_MC(listddj01.get(j).getMC());
					dFW22Service.insert_jsr(dFW22_JSR);
				}
			}
			if (DFW11_JFIDAll != null && !DFW11_JFIDAll.equals("")) {
				String[] DFW11_JFIDSZ = DFW11_JFIDAll.split(",");
				String[] DFW11_MCSZ = DFW11_MCAll.split(",");
				DFW22_CKWJ dFW22_CKWJ = new DFW22_CKWJ();
				for (int j = 0; j < DFW11_JFIDSZ.length; j++) {
					dFW22_CKWJ.setDFW11_BT(DFW11_MCSZ[j]);
					dFW22_CKWJ.setDFW11_JFID(DFW11_JFIDSZ[j]);
					dFW22_CKWJ.setDFW22_JFID(JFID);
					dFW22Service.insert_ckwj(dFW22_CKWJ);
				}
			}
		}
		if (request.getParameter("ZT").equals("2")) {
			return "redirect:/jsts/sel.do";
		}
		return "redirect:/jsts/gotoup.do";
	}

	/**
	 * 添加通知信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/gotoup.do")
	public String gotoup(HttpServletRequest request,
			HttpServletResponse response) {
		String JFID = request.getParameter("JFID");
		DFW22 dFW22 = dFW22Service.SelectByID(JFID);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("DFW22_JFID", JFID);
		List<DFW22_FJ> listdfw22_fj = dFW22Service.SelectByDFW22_JFID_FJ(map);
		List<DFW22_JSR> listdfw22_jsr = dFW22Service
				.SelectByDFW22_JFID_JSR(map);
		String retrunval = "";
		for (int i = 0; i < listdfw22_jsr.size(); i++) {
			retrunval += listdfw22_jsr.get(i).getDDJ01_JFID() + "!"
					+ listdfw22_jsr.get(i).getDDJ01_MC() + ",";
		}
		List<DFW22_CKWJ> listdfw22_ckwj=dFW22Service.SelectByDFW22_JFID_CKWJ(map);
		String retrunvalckwj = "";
		for (int i = 0; i < listdfw22_ckwj.size(); i++) {
			retrunvalckwj+=listdfw22_ckwj.get(i).getDFW11_JFID()+"!"+listdfw22_ckwj.get(i).getDFW11_BT()+",";
		}
		request.setAttribute("retrunval", retrunval);
		request.setAttribute("retrunvalckwj", retrunvalckwj);
		request.setAttribute("dFW22", dFW22);
		request.setAttribute("listdfw22_fj", listdfw22_fj);
		request.setAttribute("listdfw22_jsr", listdfw22_jsr);
		request.setAttribute("listdfw22_ckwj", listdfw22_ckwj);
		return "jf_dfw22_jsts_up";
	}

	/**
	 * 更新数据
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/update.do")
	public String update(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		String DDJ01_JFIDS = request.getParameter("DDJ01_JFIDS");
		if (DDJ01_JFIDS == null) {
			int maxFileSize = 50;// 兆
			Random rdm = new Random(System.currentTimeMillis());// 获得随机种子
			SmartUpload mySmartUpload = new SmartUpload();
			try {
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
							request.getSession().setAttribute("msg",
									"文件不能超过50兆");
							model.addAttribute("JFID", mySmartUpload
									.getRequest().getParameter("JFID"));
							return "redirect:/jsts/gotoup.do";
						}
						myfile.saveAs("/assets/fj/" + time + hz);
						CopeFile copeFile = new CopeFile();
						String oldPath = request.getSession()
								.getServletContext()
								.getRealPath("\\assets\\fj\\" + time + hz);
						String newPath = oldPath.split("Myssm_ZBZ")[0]
								+ "Myssm" + oldPath.split("Myssm_ZBZ")[1];
						copeFile.copyFile(oldPath, newPath);
						saveurl = "//assets//fj//" + time + hz;
						if (i == 0) {
							// 插入主表
							DFW22 dFW22 = new DFW22();
							dFW22.setJFID(mySmartUpload.getRequest()
									.getParameter("JFID"));
							dFW22.setBT(mySmartUpload.getRequest()
									.getParameter("BT"));
							dFW22.setNR(mySmartUpload.getRequest()
									.getParameter("NR"));
							dFW22.setZT(mySmartUpload.getRequest()
									.getParameter("ZT"));
							dFW22.setSF_ALL(mySmartUpload.getRequest()
									.getParameter("SF_ALL"));
							dFW22Service.update(dFW22);
							// 清空对应的人员 附件表 参考文件
							dFW22Service.del_fj_f(mySmartUpload.getRequest()
									.getParameter("JFID"));
							dFW22Service.del_jsr_f(mySmartUpload.getRequest()
									.getParameter("JFID"));
							dFW22Service.del_ckwj_f(mySmartUpload.getRequest()
									.getParameter("JFID"));
							// 插入发送人员表
							if (mySmartUpload.getRequest()
									.getParameter("SF_ALL").equals("0")) {
								String DDJ01_JFIDAll = mySmartUpload
										.getRequest().getParameter(
												"DDJ01_JFIDS");
								String DDJ01_MCAll = mySmartUpload.getRequest()
										.getParameter("DDJ01_MCS");
								String[] DDJ01_JFIDSZ = DDJ01_JFIDAll
										.split(",");
								String[] DDJ01_MCSZ = DDJ01_MCAll.split(",");
								DFW22_JSR dFW22_JSR = new DFW22_JSR();
								dFW22_JSR.setDFW22_JFID(mySmartUpload
										.getRequest().getParameter("JFID"));
								dFW22_JSR.setZT("0");
								for (int j = 0; j < DDJ01_JFIDSZ.length; j++) {
									dFW22_JSR.setDDJ01_JFID(DDJ01_JFIDSZ[j]);
									dFW22_JSR.setDDJ01_MC(DDJ01_MCSZ[j]);
									dFW22Service.insert_jsr(dFW22_JSR);
								}

							} else {
								List<DDJ01> listddj01 = dDJ01Service
										.SelectAlllSize();
								DFW22_JSR dFW22_JSR = new DFW22_JSR();
								dFW22_JSR.setDFW22_JFID(mySmartUpload
										.getRequest().getParameter("JFID"));
								dFW22_JSR.setZT("0");
								for (int j = 0; j < listddj01.size(); j++) {
									dFW22_JSR.setDDJ01_JFID(listddj01.get(j)
											.getJFID());
									dFW22_JSR.setDDJ01_MC(listddj01.get(j)
											.getMC());
									dFW22Service.insert_jsr(dFW22_JSR);
								}
							}
							// 插入知识库中间
							String DFW11_JFIDAll = mySmartUpload.getRequest()
									.getParameter("DFW11_JFIDS");
							String DFW11_MCAll = mySmartUpload.getRequest()
									.getParameter("DFW11_MCS");
							if (DFW11_JFIDAll != null
									&& !DFW11_JFIDAll.equals("")) {
								String[] DFW11_JFIDSZ = DFW11_JFIDAll
										.split(",");
								String[] DFW11_MCSZ = DFW11_MCAll.split(",");
								DFW22_CKWJ dFW22_CKWJ = new DFW22_CKWJ();
								for (int j = 0; j < DFW11_JFIDSZ.length; j++) {
									dFW22_CKWJ.setDFW11_BT(DFW11_MCSZ[j]);
									dFW22_CKWJ.setDFW11_JFID(DFW11_JFIDSZ[j]);
									dFW22_CKWJ.setDFW22_JFID(mySmartUpload
											.getRequest().getParameter("JFID"));
									dFW22Service.insert_ckwj(dFW22_CKWJ);
								}
							}
							DFW22_FJ dFW22_FJ = new DFW22_FJ();
							dFW22_FJ.setDFW22_JFID(mySmartUpload.getRequest()
									.getParameter("JFID"));
							dFW22_FJ.setFJ(saveurl);
							dFW22_FJ.setWJM(wjm);
							dFW22Service.insert_fj(dFW22_FJ);
						} else {
							DFW22_FJ dFW22_FJ = new DFW22_FJ();
							dFW22_FJ.setDFW22_JFID(mySmartUpload.getRequest()
									.getParameter("JFID"));
							dFW22_FJ.setFJ(saveurl);
							dFW22_FJ.setWJM(wjm);
							dFW22Service.insert_fj(dFW22_FJ);
						}
					}
				}
				model.addAttribute("JFID", mySmartUpload.getRequest()
						.getParameter("JFID"));
				if (mySmartUpload.getRequest().getParameter("ZT").equals("2")) {
					return "redirect:/jsts/sel.do";
				}
				return "redirect:/jsts/gotoup.do";
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			String JFID = request.getParameter("JFID");
			String BT = request.getParameter("BT");
			String NR = request.getParameter("NR");
			String ZT = request.getParameter("ZT");
			String SF_ALL = request.getParameter("SF_ALL");
			String DDJ01_MCS = request.getParameter("DDJ01_MCS");
			String DFW11_JFIDAll =request.getParameter("DFW11_JFIDS");
			String DFW11_MCAll = request.getParameter("DFW11_MCS");
			try {
				if (BT != null && !BT.equals("")) {
					BT = new String(BT.getBytes("ISO8859-1"), "GBK");
				}
				if (NR != null && !NR.equals("")) {
					NR = new String(NR.getBytes("ISO8859-1"), "GBK");
				}
				if (DDJ01_MCS != null && !DDJ01_MCS.equals("")) {
					DDJ01_MCS = new String(DDJ01_MCS.getBytes("ISO8859-1"),
							"GBK");
				}
				if (DFW11_MCAll != null && !DFW11_MCAll.equals("")) {
					DFW11_MCAll = new String(DFW11_MCAll.getBytes("ISO8859-1"),
							"GBK");
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			// 插入主表
			DFW22 dFW22 = new DFW22();
			dFW22.setJFID(JFID);
			dFW22.setBT(BT);
			dFW22.setNR(NR);
			dFW22.setZT(ZT);
			dFW22.setSF_ALL(SF_ALL);
			dFW22Service.update(dFW22);
			// 删除人员
			dFW22Service.del_jsr_f(JFID);
			dFW22Service.del_ckwj_f(JFID);
			// 插入从表
			if (SF_ALL.equals("0")) {
				String[] DDJ01_JFIDSZ = DDJ01_JFIDS.split(",");
				String[] DDJ01_MCSZ = DDJ01_MCS.split(",");
				DFW22_JSR dFW22_JSR = new DFW22_JSR();
				dFW22_JSR.setDFW22_JFID(JFID);
				dFW22_JSR.setZT("0");
				for (int j = 0; j < DDJ01_JFIDSZ.length; j++) {
					dFW22_JSR.setDDJ01_JFID(DDJ01_JFIDSZ[j]);
					dFW22_JSR.setDDJ01_MC(DDJ01_MCSZ[j]);
					dFW22Service.insert_jsr(dFW22_JSR);
				}
			} else {
				List<DDJ01> listddj01 = dDJ01Service.SelectAlllSize();
				DFW22_JSR dFW22_JSR = new DFW22_JSR();
				dFW22_JSR.setDFW22_JFID(JFID);
				dFW22_JSR.setZT("0");
				for (int j = 0; j < listddj01.size(); j++) {
					dFW22_JSR.setDDJ01_JFID(listddj01.get(j).getJFID());
					dFW22_JSR.setDDJ01_MC(listddj01.get(j).getMC());
					dFW22Service.insert_jsr(dFW22_JSR);
				}
			}
			// 插入知识库中间
			if (DFW11_JFIDAll != null
					&& !DFW11_JFIDAll.equals("")) {
				String[] DFW11_JFIDSZ = DFW11_JFIDAll
						.split(",");
				String[] DFW11_MCSZ = DFW11_MCAll.split(",");
				DFW22_CKWJ dFW22_CKWJ = new DFW22_CKWJ();
				for (int j = 0; j < DFW11_JFIDSZ.length; j++) {
					dFW22_CKWJ.setDFW11_BT(DFW11_MCSZ[j]);
					dFW22_CKWJ.setDFW11_JFID(DFW11_JFIDSZ[j]);
					dFW22_CKWJ.setDFW22_JFID(JFID);
					dFW22Service.insert_ckwj(dFW22_CKWJ);
				}
			}
		}
		model.addAttribute("JFID", request.getParameter("JFID"));
		if (request.getParameter("ZT").equals("2")) {
			return "redirect:/jsts/sel.do";
		}
		return "redirect:/jsts/gotoup.do";
	}

	/**
	 * 删除附件
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/delfj.do")
	public String delfj(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		String JFID = request.getParameter("JFID");
		String DFW22_JFID = request.getParameter("DFW22_JFID");
		model.addAttribute("JFID", DFW22_JFID);
		dFW22Service.del_fj(JFID);
		return "redirect:/jsts/gotoup.do";
	}

	/**
	 * 去往label页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/gotolabel.do")
	public String gotolabel(HttpServletRequest request,
			HttpServletResponse response) {
		String JFID = request.getParameter("JFID");
		DFW22 dFW22 = dFW22Service.SelectByID(JFID);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("DFW22_JFID", JFID);
		List<DFW22_FJ> listdfw22_fj = dFW22Service.SelectByDFW22_JFID_FJ(map);
		List<DFW22_JSR> listdfw22_jsr = dFW22Service
				.SelectByDFW22_JFID_JSR(map);
		String retrunval = "";
		for (int i = 0; i < listdfw22_jsr.size(); i++) {
			retrunval += listdfw22_jsr.get(i).getDDJ01_JFID() + "!"
					+ listdfw22_jsr.get(i).getDDJ01_MC() + ",";
		}
		List<DFW22_CKWJ> listdfw22_ckwj=dFW22Service.SelectByDFW22_JFID_CKWJ(map);
		String retrunvalckwj = "";
		for (int i = 0; i < listdfw22_ckwj.size(); i++) {
			retrunvalckwj+=listdfw22_ckwj.get(i).getDFW11_JFID()+"!"+listdfw22_ckwj.get(i).getDFW11_BT()+",";
		}
		request.setAttribute("retrunval", retrunval);
		request.setAttribute("retrunvalckwj", retrunvalckwj);
		request.setAttribute("dFW22", dFW22);
		request.setAttribute("listdfw22_fj", listdfw22_fj);
		request.setAttribute("listdfw22_jsr", listdfw22_jsr);
		request.setAttribute("listdfw22_ckwj", listdfw22_ckwj);
		return "jf_dfw22_jsts_label";
	}

	/**
	 * 删除
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/del.do")
	public String del(HttpServletRequest request, HttpServletResponse response) {
		String JFID = request.getParameter("JFID");
		dFW22Service.del(JFID);
		return "redirect:/jsts/sel.do";
	}

}
