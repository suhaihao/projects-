package com.ssh.user.controller;

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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;

import com.jspsmart.upload.SmartUpload;
import com.ssh.user.model.DDJ01;
import com.ssh.user.model.DDJ01_D;
import com.ssh.user.model.DDJ02;
import com.ssh.user.model.DSYS05;
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ01Service;
import com.ssh.user.service.DSYS05Service;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.service.UserService;
import com.ssh.user.util.CopeFile;
import com.ssh.user.util.MD5YZJM;
import com.ssh.user.util.Page;

@Controller
@Scope("prototype")
@RequestMapping(value = "/label")
public class DDJ01_LabelController implements ServletConfigAware, ServletContextAware {
	@Autowired
	private DDJ01Service dDJ01Service;
	@Autowired
	private Dsys11Service dsys11Service;
	@Autowired
	private DSYS05Service dSYS05Service;
	@Autowired
	private UserService userService;

	private ServletContext servletContext;
	private ServletConfig servletConfig;
	private MD5YZJM md5 = new MD5YZJM();

	@Override
	public void setServletContext(ServletContext arg0) {
		this.servletContext = arg0;

	}

	@Override
	public void setServletConfig(ServletConfig arg0) {
		this.servletConfig = arg0;

	}

	@RequestMapping(value = "/sel.do")
	public String seleByzfzz(HttpServletRequest request) {
		String MC = request.getParameter("MC");
		if (MC != null) {
			try {
				MC = new String(MC.getBytes("ISO8859-1"), "GBK");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		String BMBM = request.getParameter("BMBM");
		String ys = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
		Page page = null;
		if (ys == null) {
			if (MC != null) {
				map.put("MC", MC);
				request.setAttribute("MC", MC);
			}
			if (BMBM != null) {
				map.put("BMBM", BMBM);
				request.setAttribute("BMBM", BMBM);
			}
			page = new Page(10, dDJ01Service.getCount(map), 1);
		} else {
			if (MC == null && BMBM == null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				if (MC != null) {
					map.put("MC", MC);
					request.setAttribute("MC", MC);
				}
				if (BMBM != null) {
					map.put("BMBM", BMBM);
					request.setAttribute("BMBM", BMBM);
				}
				page = new Page(10, dDJ01Service.getCount(map),
						Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		map.put("MAX", page.getMax());
		map.put("MIN", page.getMin());
		List<DSYS05> listdsys05 = dSYS05Service.SelectByFather("0001", "3");
		request.setAttribute("listdsys05", listdsys05);
		List<DDJ01> listddj01 = dDJ01Service.SelectAll_ZBZ(map);
		request.setAttribute("listddj01", listddj01);
		return "jf_ddj01_label";
	}

	@RequestMapping(value = "/ind.do")
	public String insd(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if (request.getParameter("zt") == null) {
			int maxFileSize = 2;// ��
			String AllowedExtensions = ",.jpg,.jpeg,.gif,.png,";// �����ϴ����ļ�����
			Random rdm = new Random(System.currentTimeMillis());// ����������
			SmartUpload mySmartUpload = new SmartUpload();
			try {
				mySmartUpload.initialize(servletConfig, request, response);
				mySmartUpload.upload();
				String saveurl = "";
				String wjm = "";
				for (int i = 0; i < mySmartUpload.getFiles().getCount(); i++) {
					// Ψһ�ļ���
					long time = Math.abs(rdm.nextInt()) % 1000000000;
					// ��ȡ�ļ�
					com.jspsmart.upload.File myfile = mySmartUpload.getFiles()
							.getFile(i);
					// ��ȡ�ļ���С
					int filesize = myfile.getSize() / 1024 / 1024;
					// ��ȡ�ļ�������
					int len = myfile.getFileName().length();
					// ��ȡ�ļ���׺
					if (len != 0) {
						String hz = myfile.getFileName().substring(
								myfile.getFileName().indexOf("."), len);
						// ��ȡ�ļ���
						wjm = myfile.getFileName();
						if (filesize > maxFileSize) {
							model.addAttribute("msg", "1");
							return "redirect:/info/sel.do";
						}
						if (AllowedExtensions.indexOf(hz) == -1) {
							model.addAttribute("msg", "2");
							return "redirect:/info/sel.do";
						}
						myfile.saveAs("/assets/img/logo/" + time + hz);
						CopeFile copeFile=new CopeFile();
						String oldPath=request.getSession().getServletContext().getRealPath("\\assets\\img\\logo\\"+time + hz) ;
						String newPath=oldPath.split("Myssm_ZBZ")[0]+"Myssm"+oldPath.split("Myssm_ZBZ")[1];
						copeFile.copyFile(oldPath, newPath);
						saveurl = "//assets//img//logo//" + time + hz;
						DDJ01 dDJ01 = new DDJ01();
						dDJ01.setJFID(mySmartUpload.getRequest().getParameter(
								"JFID"));
						model.addAttribute("JFID", mySmartUpload.getRequest()
								.getParameter("JFID"));
						dDJ01.setXZQH(mySmartUpload.getRequest().getParameter(
								"XZQH"));
						dDJ01.setDZ(mySmartUpload.getRequest().getParameter(
								"DZ"));
						dDJ01.setGPS_DJ(mySmartUpload.getRequest()
								.getParameter("GPS_DJ"));
						dDJ01.setGPS_BW(mySmartUpload.getRequest()
								.getParameter("GPS_BW"));
						dDJ01.setLX_DH(mySmartUpload.getRequest().getParameter(
								"LX_DH"));
						dDJ01.setLX_SJ(mySmartUpload.getRequest().getParameter(
								"LX_SJ"));
						dDJ01.setWWW(mySmartUpload.getRequest().getParameter(
								"WWW"));
						dDJ01.setYX(mySmartUpload.getRequest().getParameter(
								"YX"));
						dDJ01.setJJ(mySmartUpload.getRequest().getParameter(
								"JJ"));
						dDJ01.setBZ(mySmartUpload.getRequest().getParameter(
								"BZ"));
						dDJ01.setLOGO(saveurl);
						dDJ01Service.updd01Byid(dDJ01);
						DDJ01_D dDJ01_D = new DDJ01_D();
						String ids = mySmartUpload.getRequest().getParameter(
								"ids");
						if (ids != null) {
							// ɾ����ط���
							dDJ01Service.delAllfw(mySmartUpload.getRequest()
									.getParameter("JFID"));
							String[] idsz = ids.split(",");
							if (idsz.length >= 1) {
								for (int j = 0; j < idsz.length; j++) {
									String id_d = mySmartUpload.getRequest()
											.getParameter(idsz[j]);
									if (id_d != null) {
										dDJ01_D.setDDJ01_JFID(dDJ01.getJFID());
										dDJ01_D.setFWNRLB(id_d);
										dDJ01_D.setXY_JF(4);
										dDJ01_D.setSM(mySmartUpload
												.getRequest().getParameter(
														"sm" + id_d));
										dDJ01Service.insdd_d(dDJ01_D);
									}
								}
							}
						}
					}
				}
				return "redirect:/info/gotoup.do";
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				DDJ01 dDJ01 = new DDJ01();
				dDJ01.setJFID(request.getParameter("JFID"));
				model.addAttribute("JFID", request.getParameter("JFID"));
				dDJ01.setXZQH(request.getParameter("XZQH"));
				dDJ01.setGPS_DJ(request.getParameter("GPS_DJ"));
				dDJ01.setGPS_BW(request.getParameter("GPS_BW"));
				dDJ01.setLX_DH(request.getParameter("LX_DH"));
				dDJ01.setLX_SJ(request.getParameter("LX_SJ"));
				dDJ01.setWWW(request.getParameter("WWW"));
				dDJ01.setYX(request.getParameter("YX"));
				dDJ01.setDZ(new String(request.getParameter("DZ").getBytes(
						"ISO8859-1"), "GBK"));
				dDJ01.setJJ(new String(request.getParameter("JJ").getBytes(
						"ISO8859-1"), "GBK"));
				dDJ01.setBZ(new String(request.getParameter("BZ").getBytes(
						"ISO8859-1"), "GBK"));
				dDJ01Service.updd01Byid(dDJ01);
				DDJ01_D dDJ01_D = new DDJ01_D();
				String ids = request.getParameter("ids");
				if (ids != null) {
					// ɾ����ط���
					dDJ01Service.delAllfw(request.getParameter("JFID"));
					String[] idsz = ids.split(",");
					if (idsz.length >= 1) {
						for (int i = 0; i < idsz.length; i++) {
							String id_d = request.getParameter(idsz[i]);
							if (id_d != null) {
								dDJ01_D.setDDJ01_JFID(dDJ01.getJFID());
								dDJ01_D.setFWNRLB(id_d);
								dDJ01_D.setXY_JF(4);
								dDJ01_D.setSM(new String(request.getParameter(
										"sm" + id_d).getBytes("ISO8859-1"),
										"GBK"));
								dDJ01Service.insdd_d(dDJ01_D);
							}
						}
					}
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return "redirect:/info/gotoup.do";
	}

	@RequestMapping(value = "/add.do")
	public String add(HttpServletRequest request, HttpServletResponse response,
			Model model) {
		String JFID = dDJ01Service.getJFID();
		String BMBM = request.getParameter("BMBM");
		String JFUSERID = request.getParameter("JFUSERID");
		String JFPASSWORD = request.getParameter("JFPASSWORD");
		String JFNAME = request.getParameter("JFNAME");
		String LRRY = request.getParameter("LRRY");
		String LRRY_MC = request.getParameter("LRRY_MC");
		try {
			if (JFNAME != null) {
				JFNAME = new String(request.getParameter("JFNAME").getBytes(
						"ISO8859-1"), "GBK");
			}
			if (LRRY_MC != null) {
				LRRY_MC = new String(request.getParameter("LRRY_MC").getBytes(
						"ISO8859-1"), "GBK");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		DDJ01 dDJ01 = new DDJ01();
		dDJ01.setJFID(JFID);
		dDJ01.setMC(JFNAME);
		dDJ01.setBMBM(BMBM);
		dDJ01.setLRRY(LRRY);
		SimpleDateFormat dateTimeFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		String date = dateTimeFormat.format(new Date());
		try {
			dDJ01.setLRRQ(dateTimeFormat.parse(date));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		dDJ01.setLRRY_MC(LRRY_MC);
		dDJ01.setYHM(JFUSERID);
		dDJ01Service.insertInfo(dDJ01);
		// ��Ӷ�Ӧר����֯��Ϣ
		User user = new User();
		user.setJFUSERID(JFUSERID);
		user.setJFPASSWORD(md5.md5Password(JFPASSWORD));
		user.setJFNAME(JFNAME + "ϵͳ����Ա");
		user.setDDJ01_JFID(JFID);
		user.setJFSTATE("0");
		try {
			user.setLRRQ(dateTimeFormat.parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		user.setLRRY(LRRY);
		user.setLRRYMC(LRRY_MC);
		user.setRYFL("99");
		user.setXXDBLB("3");
		userService.insertZFZZ(user);
		model.addAttribute("JFID", JFID);
		return "redirect:/info/gotoup.do";
	}

	@RequestMapping(value = "/gotoup.do")
	public String gotoup(HttpServletRequest request,
			HttpServletResponse response) {
		String JFID = request.getParameter("JFID");
		List<DDJ01> list = dDJ01Service.SelectByDD01ID(JFID);
		request.setAttribute("DDJ01", list.get(0));
		List<Dsys11> lisfw = dsys11Service.selectAllFw();
		request.setAttribute("lisfw", lisfw);
		List<DDJ01_D> list_d = dDJ01Service.SelectByDDID(JFID);
		if (list_d != null && list_d.size() >= 1) {
			String ids = "";
			for (int i = 0; i < list_d.size(); i++) {
				ids = ids + list_d.get(i).getFWNRLB() + ",";
			}
			request.setAttribute("ids", ids);
		}
		request.setAttribute("list_d", list_d);
		return "jf_ddj01_up_lable";
	}

	@RequestMapping(value = "/uppassword.do")
	public void uppassword(HttpServletRequest request,
			HttpServletResponse response) {
		String JFUSERID = request.getParameter("JFUSERID");
		String JFPASSWORD = request.getParameter("JFPASSWORD");
		dDJ01Service.updatePassword(JFUSERID, md5.md5Password(JFPASSWORD));
	}

	@RequestMapping(value = "/selryxx.do")
	public String selryxx(HttpServletRequest request,
			HttpServletResponse response) {
		String DDJ01_JFID = request.getParameter("DDJ01_JFID");
		String JFNAME = request.getParameter("JFNAME");
		if (JFNAME != null) {
			try {
				JFNAME = new String(JFNAME.getBytes("ISO8859-1"), "GBK");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		String ys = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
		Page page = null;
		if (ys == null) {
			if (JFNAME != null) {
				map.put("JFNAME", JFNAME);
				request.setAttribute("JFNAME", JFNAME);
			}
			if (DDJ01_JFID != null) {
				map.put("DDJ01_JFID", DDJ01_JFID);
				request.setAttribute("DDJ01_JFID", DDJ01_JFID);
			}
			page = new Page(10, userService.getCountAllSize(map), 1);
		} else {
			if (JFNAME == null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				if (JFNAME != null) {
					map.put("JFNAME", JFNAME);
					request.setAttribute("JFNAME", JFNAME);
				}
				if (DDJ01_JFID != null) {
					map.put("DDJ01_JFID", DDJ01_JFID);
					request.setAttribute("DDJ01_JFID", DDJ01_JFID);
				}
				page = new Page(10, userService.getCountAllSize(map),
						Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		map.put("MAX", page.getMax());
		map.put("MIN", page.getMin());
		List<User> listuser = userService.SelectAllList(map);
		request.setAttribute("listuser", listuser);
		return "users_zfzz";
	}

	@RequestMapping(value = "/del.do")
	public String del(HttpServletRequest request,
			HttpServletResponse response) {
		String JFID=request.getParameter("JFID");
		userService.deleteByZFZZ(JFID);
		dDJ01Service.delAllfw(JFID);
		dDJ01Service.deleteZFZZ(JFID);
		return "redirect:/info/sel.do";
	}
}
