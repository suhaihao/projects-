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
import com.ssh.user.model.DFW23;
import com.ssh.user.model.DFW23_FJ;
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ01Service;
import com.ssh.user.service.DDJ11Service;
import com.ssh.user.service.DFW21Service;
import com.ssh.user.service.DFW23Service;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.service.UserService;
import com.ssh.user.util.CopeFile;
import com.ssh.user.util.EHCache;
import com.ssh.user.util.MD5YZJM;
import com.ssh.user.util.Page;

@Controller
@Scope("prototype")
@RequestMapping(value = "/jszx")
public class JSZXController implements ServletConfigAware, ServletContextAware {
	@Autowired
	private DFW23Service dFW23Service;
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
		String ZT = request.getParameter("ZT");
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
			if (ZT != null) {
				map.put("ZT", ZT);
				request.setAttribute("ZT", ZT);
			}
			page = new Page(10, dFW23Service.getCount(map), 1);
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
				if (ZT != null) {
					map.put("ZT", ZT);
					request.setAttribute("ZT", ZT);
				}
				page = new Page(10, dFW23Service.getCount(map),
						Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		map.put("MAX", page.getMax());
		map.put("MIN", page.getMin());
		List<DFW23> listdfw23 = dFW23Service.SelectAll(map);
		request.setAttribute("listdfw23", listdfw23);
		return "jf_dfw23_jszx";
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
		String ZT = request.getParameter("ZT");
		String JFID = dFW23Service.getJFID();
		model.addAttribute("JFID", JFID);
		if (ZT == null) {
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
							return "redirect:/jszx/sel.do";
						}
						myfile.saveAs("/assets/fj/" + time + hz);
						CopeFile copeFile = new CopeFile();
						String oldPath = request.getSession()
								.getServletContext()
								.getRealPath("\\assets\\fj\\" + time + hz);
						String newPath = oldPath.split("Myssm")[0]
								+ "Myssm_ZBZ" + oldPath.split("Myssm")[1];
						copeFile.copyFile(oldPath, newPath);
						saveurl = "//assets//fj//" + time + hz;
						if (i == 0) {
							// 插入主表
							DFW23 dFW23 = new DFW23();
							dFW23.setJFID(JFID);
							dFW23.setBT(mySmartUpload.getRequest()
									.getParameter("BT"));
							dFW23.setNR(mySmartUpload.getRequest()
									.getParameter("NR"));
							dFW23.setLRRY(user.getJFID()+"");
							dFW23.setLRRQ(new Date());
							dFW23.setZT(mySmartUpload.getRequest()
									.getParameter("ZT"));
							dFW23.setDDJ01_JFID(user.getDDJ01_JFID());
							dFW23.setDDJ01_MC(dDJ01Service.SelectByID(user.getDDJ01_JFID()).getMC());
							dFW23.setLRRYMC(user.getJFNAME());
							dFW23Service.insert(dFW23);
							// 插入发送人员表
							DFW23_FJ dFW23_FJ = new DFW23_FJ();
							dFW23_FJ.setDFW23_JFID(JFID);
							dFW23_FJ.setFJ(saveurl);
							dFW23_FJ.setWJM(wjm);
							dFW23Service.insert_fj(dFW23_FJ);
						} else {
							DFW23_FJ dFW23_FJ = new DFW23_FJ();
							dFW23_FJ.setDFW23_JFID(JFID);
							dFW23_FJ.setFJ(saveurl);
							dFW23_FJ.setWJM(wjm);
							dFW23Service.insert_fj(dFW23_FJ);
						}
					}
				}
				if (mySmartUpload.getRequest().getParameter("ZT").equals("2")) {
					return "redirect:/jszx/gotolabel.do";
				}
				return "redirect:/jszx/gotoup.do";
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			String BT = request.getParameter("BT");
			String NR = request.getParameter("NR");
			try {
				if (BT != null && !BT.equals("")) {
					BT = new String(BT.getBytes("ISO8859-1"), "GBK");
				}
				if (NR != null && !NR.equals("")) {
					NR = new String(NR.getBytes("ISO8859-1"), "GBK");
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			// 插入主表
			DFW23 dFW23 = new DFW23();
			dFW23.setJFID(JFID);
			dFW23.setBT(BT);
			dFW23.setNR(NR);
			dFW23.setLRRY(user.getJFID()+"");
			dFW23.setLRRQ(new Date());
			dFW23.setZT(ZT);
			dFW23.setDDJ01_JFID(user.getDDJ01_JFID());
			dFW23.setDDJ01_MC(dDJ01Service.SelectByID(user.getDDJ01_JFID()).getMC());
			dFW23.setLRRYMC(user.getJFNAME());
			dFW23Service.insert(dFW23);
		}
		if (request.getParameter("ZT").equals("2")) {
			return "redirect:/jszx/gotolabel.do";
		}
		return "redirect:/jszx/gotoup.do";
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
		DFW23 dFW23 = dFW23Service.SelectByID(JFID);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("DFW23_JFID", JFID);
		List<DFW23_FJ> listdfw23_fj = dFW23Service.SelectByDFW23_JFID_FJ(map);
		request.setAttribute("dFW23", dFW23);
		request.setAttribute("listdfw23_fj", listdfw23_fj);
		return "jf_dfw23_jszx_up";
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
		    User user = (User) request.getSession().getAttribute("user");
		    String JFID = request.getParameter("JFID");
		    String JD = request.getParameter("JD");
			String ZT = request.getParameter("ZT");
			try {
				if (JD != null && !JD.equals("")) {
					JD = new String(JD.getBytes("ISO8859-1"), "GBK");
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			// 插入主表
			DFW23 dFW23 = new DFW23();
			dFW23.setJFID(JFID);
			dFW23.setJDRY(user.getJFID()+"");
			dFW23.setJDRQ(new Date());
			dFW23.setJD(JD);
			dFW23.setJDRYMC(user.getJFNAME());
			dFW23.setZT(ZT);
			dFW23Service.update(dFW23);
		model.addAttribute("JFID", request.getParameter("JFID"));
		return "redirect:/jszx/gotolabel.do";
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
		String DFW23_JFID = request.getParameter("DFW23_JFID");
		model.addAttribute("JFID", DFW23_JFID);
		dFW23Service.del_fj(JFID);
		return "redirect:/jszx/gotoup.do";
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
		DFW23 dFW23 = dFW23Service.SelectByID(JFID);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("DFW23_JFID", JFID);
		List<DFW23_FJ> listdfw23_fj = dFW23Service.SelectByDFW23_JFID_FJ(map);
		request.setAttribute("dFW23", dFW23);
		request.setAttribute("listdfw23_fj", listdfw23_fj);
		return "jf_dfw23_jszx_label";
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
		dFW23Service.del(JFID);
		return "redirect:/jszx/sel.do";
	}

}
