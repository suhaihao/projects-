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
import com.ssh.user.model.DDJ02;
import com.ssh.user.model.DDJ11;
import com.ssh.user.model.DFW11;
import com.ssh.user.model.DFW11_D;
import com.ssh.user.model.DFW21;
import com.ssh.user.model.DFW21_FJ;
import com.ssh.user.model.DFW21_JSR;
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ01Service;
import com.ssh.user.service.DDJ11Service;
import com.ssh.user.service.DFW21Service;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.service.UserService;
import com.ssh.user.util.CopeFile;
import com.ssh.user.util.EHCache;
import com.ssh.user.util.MD5YZJM;
import com.ssh.user.util.Page;

@Controller
@Scope("prototype")
@RequestMapping(value = "/tz")
public class TZController implements ServletConfigAware, ServletContextAware {
	@Autowired
	private DFW21Service dFW21Service;
	@Autowired
	private DDJ01Service dDJ01Service;

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
		User user=(User) request.getSession().getAttribute("user");
		String DDJ01_JFID=user.getDDJ01_JFID();
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
		// 施药器械监管
		String ys = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("DDJ01_JFID", DDJ01_JFID);
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
			page = new Page(10, dFW21Service.getCount(map), 1);
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
				page = new Page(10, dFW21Service.getCount(map),
						Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		map.put("MAX", page.getMax());
		map.put("MIN", page.getMin());
		List<DFW21> listdfw21 = dFW21Service.SelectAll(map);
		request.setAttribute("listdfw21", listdfw21);
		return "jf_dfw21_tz";
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
		String JFID = dFW21Service.getJFID();
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
							return "redirect:/tz/sel.do";
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
							DFW21 dFW21 = new DFW21();
							dFW21.setJFID(JFID);
							dFW21.setBT(mySmartUpload.getRequest()
									.getParameter("BT"));
							dFW21.setNR(mySmartUpload.getRequest()
									.getParameter("NR"));
							dFW21.setLRRY(user.getJFNAME());
							dFW21.setLRRQ(new Date());
							dFW21.setZT(mySmartUpload.getRequest()
									.getParameter("ZT"));
							dFW21.setSF_ALL(mySmartUpload.getRequest()
									.getParameter("SF_ALL"));
							dFW21Service.insert(dFW21);
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
								DFW21_JSR dFW21_JSR = new DFW21_JSR();
								dFW21_JSR.setDFW21_JFID(JFID);
								dFW21_JSR.setZT("0");
								for (int j = 0; j < DDJ01_JFIDSZ.length; j++) {
									dFW21_JSR.setDDJ01_JFID(DDJ01_JFIDSZ[j]);
									dFW21_JSR.setDDJ01_MC(DDJ01_MCSZ[j]);
									dFW21Service.insert_jsr(dFW21_JSR);
								}

							} else {
								List<DDJ01> listddj01 = dDJ01Service
										.SelectAlllSize();
								DFW21_JSR dFW21_JSR = new DFW21_JSR();
								dFW21_JSR.setDFW21_JFID(JFID);
								dFW21_JSR.setZT("0");
								for (int j = 0; j < listddj01.size(); j++) {
									dFW21_JSR.setDDJ01_JFID(listddj01.get(j)
											.getJFID());
									dFW21_JSR.setDDJ01_MC(listddj01.get(j)
											.getMC());
									dFW21Service.insert_jsr(dFW21_JSR);
								}
							}
							DFW21_FJ dFW21_FJ = new DFW21_FJ();
							dFW21_FJ.setDFW21_JFID(JFID);
							dFW21_FJ.setFJ(saveurl);
							dFW21_FJ.setWJM(wjm);
							dFW21Service.insert_fj(dFW21_FJ);
						} else {
							DFW21_FJ dFW21_FJ = new DFW21_FJ();
							dFW21_FJ.setDFW21_JFID(JFID);
							dFW21_FJ.setFJ(saveurl);
							dFW21_FJ.setWJM(wjm);
							dFW21Service.insert_fj(dFW21_FJ);
						}
					}
				}
				if (mySmartUpload.getRequest().getParameter("ZT").equals("2")) {
					return "redirect:/tz/gotolabel.do";
				}
				return "redirect:/tz/gotoup.do";
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			String BT = request.getParameter("BT");
			String NR = request.getParameter("NR");
			String ZT = request.getParameter("ZT");
			String SF_ALL = request.getParameter("SF_ALL");
			String DDJ01_MCS = request.getParameter("DDJ01_MCS");
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
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			// 插入主表
			DFW21 dFW21 = new DFW21();
			dFW21.setJFID(JFID);
			dFW21.setBT(BT);
			dFW21.setNR(NR);
			dFW21.setLRRY(user.getJFNAME());
			dFW21.setLRRQ(new Date());
			dFW21.setZT(ZT);
			dFW21.setSF_ALL(SF_ALL);
			dFW21Service.insert(dFW21);
			// 插入从表
			if (SF_ALL.equals("0")) {
				String[] DDJ01_JFIDSZ = DDJ01_JFIDS.split(",");
				String[] DDJ01_MCSZ = DDJ01_MCS.split(",");
				DFW21_JSR dFW21_JSR = new DFW21_JSR();
				dFW21_JSR.setDFW21_JFID(JFID);
				dFW21_JSR.setZT("0");
				for (int j = 0; j < DDJ01_JFIDSZ.length; j++) {
					dFW21_JSR.setDDJ01_JFID(DDJ01_JFIDSZ[j]);
					dFW21_JSR.setDDJ01_MC(DDJ01_MCSZ[j]);
					dFW21Service.insert_jsr(dFW21_JSR);
				}
			} else {
				List<DDJ01> listddj01 = dDJ01Service.SelectAlllSize();
				DFW21_JSR dFW21_JSR = new DFW21_JSR();
				dFW21_JSR.setDFW21_JFID(JFID);
				dFW21_JSR.setZT("0");
				for (int j = 0; j < listddj01.size(); j++) {
					dFW21_JSR.setDDJ01_JFID(listddj01.get(j).getJFID());
					dFW21_JSR.setDDJ01_MC(listddj01.get(j).getMC());
					dFW21Service.insert_jsr(dFW21_JSR);
				}
			}
		}
		if (request.getParameter("ZT").equals("2")) {
			return "redirect:/tz/gotolabel.do";
		}
		return "redirect:/tz/gotoup.do";
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
		DFW21 dFW21 = dFW21Service.SelectByID(JFID);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("DFW21_JFID", JFID);
		List<DFW21_FJ> listdfw21_fj = dFW21Service.SelectByDFW21_JFID_FJ(map);
		List<DFW21_JSR> listdfw21_jsr = dFW21Service
				.SelectByDFW21_JFID_JSR(map);
		String retrunval = "";
		for (int i = 0; i < listdfw21_jsr.size(); i++) {
			retrunval += listdfw21_jsr.get(i).getDDJ01_JFID() + "!"
					+ listdfw21_jsr.get(i).getDDJ01_MC() + ",";
		}
		request.setAttribute("retrunval", retrunval);
		request.setAttribute("dFW21", dFW21);
		request.setAttribute("listdfw21_fj", listdfw21_fj);
		request.setAttribute("listdfw21_jsr", listdfw21_jsr);
		return "jf_dfw21_tz_up";
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
							return "redirect:/tz/gotoup.do";
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
							DFW21 dFW21 = new DFW21();
							dFW21.setJFID(mySmartUpload.getRequest()
									.getParameter("JFID"));
							dFW21.setBT(mySmartUpload.getRequest()
									.getParameter("BT"));
							dFW21.setNR(mySmartUpload.getRequest()
									.getParameter("NR"));
							dFW21.setZT(mySmartUpload.getRequest()
									.getParameter("ZT"));
							dFW21.setSF_ALL(mySmartUpload.getRequest()
									.getParameter("SF_ALL"));
							dFW21Service.update(dFW21);
							// 清空对应的人员 附件表
							dFW21Service.del_fj_f(mySmartUpload.getRequest()
									.getParameter("JFID"));
							dFW21Service.del_jsr_f(mySmartUpload.getRequest()
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
								DFW21_JSR dFW21_JSR = new DFW21_JSR();
								dFW21_JSR.setDFW21_JFID(mySmartUpload
										.getRequest().getParameter("JFID"));
								dFW21_JSR.setZT("0");
								for (int j = 0; j < DDJ01_JFIDSZ.length; j++) {
									dFW21_JSR.setDDJ01_JFID(DDJ01_JFIDSZ[j]);
									dFW21_JSR.setDDJ01_MC(DDJ01_MCSZ[j]);
									dFW21Service.insert_jsr(dFW21_JSR);
								}

							} else {
								List<DDJ01> listddj01 = dDJ01Service
										.SelectAlllSize();
								DFW21_JSR dFW21_JSR = new DFW21_JSR();
								dFW21_JSR.setDFW21_JFID(mySmartUpload
										.getRequest().getParameter("JFID"));
								dFW21_JSR.setZT("0");
								for (int j = 0; j < listddj01.size(); j++) {
									dFW21_JSR.setDDJ01_JFID(listddj01.get(j)
											.getJFID());
									dFW21_JSR.setDDJ01_MC(listddj01.get(j)
											.getMC());
									dFW21Service.insert_jsr(dFW21_JSR);
								}
							}
							DFW21_FJ dFW21_FJ = new DFW21_FJ();
							dFW21_FJ.setDFW21_JFID(mySmartUpload.getRequest()
									.getParameter("JFID"));
							dFW21_FJ.setFJ(saveurl);
							dFW21_FJ.setWJM(wjm);
							dFW21Service.insert_fj(dFW21_FJ);
						} else {
							DFW21_FJ dFW21_FJ = new DFW21_FJ();
							dFW21_FJ.setDFW21_JFID(mySmartUpload.getRequest()
									.getParameter("JFID"));
							dFW21_FJ.setFJ(saveurl);
							dFW21_FJ.setWJM(wjm);
							dFW21Service.insert_fj(dFW21_FJ);
						}
					}
				}
				model.addAttribute("JFID", mySmartUpload.getRequest()
						.getParameter("JFID"));
				if (mySmartUpload.getRequest().getParameter("ZT").equals("2")) {
					return "redirect:/tz/gotolabel.do";
				}
				return "redirect:/tz/gotoup.do";
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
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			// 插入主表
			DFW21 dFW21 = new DFW21();
			dFW21.setJFID(JFID);
			dFW21.setBT(BT);
			dFW21.setNR(NR);
			dFW21.setZT(ZT);
			dFW21.setSF_ALL(SF_ALL);
			dFW21Service.update(dFW21);
			// 删除人员
			dFW21Service.del_jsr_f(JFID);
			// 插入从表
			if (SF_ALL.equals("0")) {
				String[] DDJ01_JFIDSZ = DDJ01_JFIDS.split(",");
				String[] DDJ01_MCSZ = DDJ01_MCS.split(",");
				DFW21_JSR dFW21_JSR = new DFW21_JSR();
				dFW21_JSR.setDFW21_JFID(JFID);
				dFW21_JSR.setZT("0");
				for (int j = 0; j < DDJ01_JFIDSZ.length; j++) {
					dFW21_JSR.setDDJ01_JFID(DDJ01_JFIDSZ[j]);
					dFW21_JSR.setDDJ01_MC(DDJ01_MCSZ[j]);
					dFW21Service.insert_jsr(dFW21_JSR);
				}
			} else {
				List<DDJ01> listddj01 = dDJ01Service.SelectAlllSize();
				DFW21_JSR dFW21_JSR = new DFW21_JSR();
				dFW21_JSR.setDFW21_JFID(JFID);
				dFW21_JSR.setZT("0");
				for (int j = 0; j < listddj01.size(); j++) {
					dFW21_JSR.setDDJ01_JFID(listddj01.get(j).getJFID());
					dFW21_JSR.setDDJ01_MC(listddj01.get(j).getMC());
					dFW21Service.insert_jsr(dFW21_JSR);
				}
			}
		}
		model.addAttribute("JFID", request.getParameter("JFID"));
		if (request.getParameter("ZT").equals("2")) {
			return "redirect:/tz/gotolabel.do";
		}
		return "redirect:/tz/gotoup.do";
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
		String DFW21_JFID = request.getParameter("DFW21_JFID");
		model.addAttribute("JFID", DFW21_JFID);
		dFW21Service.del_fj(JFID);
		return "redirect:/tz/gotoup.do";
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
		String ZT=request.getParameter("ZT");
		request.setAttribute("ZT", ZT);
		DFW21 dFW21 = dFW21Service.SelectByID(JFID);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("DFW21_JFID", JFID);
		List<DFW21_FJ> listdfw21_fj = dFW21Service.SelectByDFW21_JFID_FJ(map);
		List<DFW21_JSR> listdfw21_jsr = dFW21Service
				.SelectByDFW21_JFID_JSR(map);
		String retrunval = "";
		for (int i = 0; i < listdfw21_jsr.size(); i++) {
			retrunval += listdfw21_jsr.get(i).getDDJ01_JFID() + "!"
					+ listdfw21_jsr.get(i).getDDJ01_MC() + ",";
		}
		request.setAttribute("retrunval", retrunval);
		request.setAttribute("dFW21", dFW21);
		request.setAttribute("listdfw21_fj", listdfw21_fj);
		request.setAttribute("listdfw21_jsr", listdfw21_jsr);
		return "jf_dfw21_tz_label";
	}
	/**
	 * 去往登陆label
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/gotolabeldl.do")
	public String gotolabeldl(HttpServletRequest request,
			HttpServletResponse response) {
		String JFID = request.getParameter("JFID");
		String ZT=request.getParameter("ZT");
		request.setAttribute("ZT", ZT);
		DFW21 dFW21 = dFW21Service.SelectByID(JFID);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("DFW21_JFID", JFID);
		List<DFW21_FJ> listdfw21_fj = dFW21Service.SelectByDFW21_JFID_FJ(map);
		List<DFW21_JSR> listdfw21_jsr = dFW21Service
				.SelectByDFW21_JFID_JSR(map);
		String retrunval = "";
		for (int i = 0; i < listdfw21_jsr.size(); i++) {
			retrunval += listdfw21_jsr.get(i).getDDJ01_JFID() + "!"
					+ listdfw21_jsr.get(i).getDDJ01_MC() + ",";
		}
		request.setAttribute("retrunval", retrunval);
		request.setAttribute("dFW21", dFW21);
		request.setAttribute("listdfw21_fj", listdfw21_fj);
		request.setAttribute("listdfw21_jsr", listdfw21_jsr);
		return "jf_dfw21_tz_labeldl";
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
		dFW21Service.del(JFID);
		return "redirect:/tz/sel.do";
	}
	/**
	 * 已读更新
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/upjsr.do")
	public String upjsr(HttpServletRequest request, HttpServletResponse response) {
		String DFW02_JFID=request.getParameter("DFW02_JFID");
		User user=(User) request.getSession().getAttribute("user");
		String DDJ01_JFID=user.getDDJ01_JFID();
		DFW21_JSR dFW21_JSR=new DFW21_JSR();
		dFW21_JSR.setDDJ01_JFID(DDJ01_JFID);
		dFW21_JSR.setDFW21_JFID(DFW02_JFID);
		dFW21_JSR.setZT("1");
		dFW21Service.upjsr(dFW21_JSR);
		return "redirect:/tz/sel.do";
	}
	/**
	 * 已读登陆更新
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/upjsrdl.do")
	public void upjsrdl(HttpServletRequest request, HttpServletResponse response) {
		String DFW02_JFID=request.getParameter("DFW02_JFID");
		User user=(User) request.getSession().getAttribute("user");
		String DDJ01_JFID=user.getDDJ01_JFID();
		DFW21_JSR dFW21_JSR=new DFW21_JSR();
		dFW21_JSR.setDDJ01_JFID(DDJ01_JFID);
		dFW21_JSR.setDFW21_JFID(DFW02_JFID);
		dFW21_JSR.setZT("1");
		dFW21Service.upjsr(dFW21_JSR);
		try {
			response.getWriter().print("1");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
