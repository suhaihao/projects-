package com.ssh.user.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.jws.WebParam.Mode;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;

import com.jspsmart.upload.SmartUpload;
import com.ssh.user.model.DMSG;
import com.ssh.user.model.Dsys01_dsys03;
import com.ssh.user.model.Dsys03;
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.User;
import com.ssh.user.service.DSYS01_DSYS03Service;
import com.ssh.user.service.Dsys03Service;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.service.UserService;
import com.ssh.user.util.CopeFile;
import com.ssh.user.util.EHCache;
import com.ssh.user.util.MD5YZJM;
import com.ssh.user.util.Page;
import com.ssh.user.util.ReturnJson;

/**
 * 查询防治对的用户信息
 * 
 * @author Administrator
 * 
 */
@Controller
@Scope("prototype")
@RequestMapping("/preven")
public class PreventionController implements ServletConfigAware,
		ServletContextAware {
	@Autowired
	private UserService userService;
	@Autowired
	private Dsys03Service dsys03Service;
	@Autowired
	private Dsys11Service dsys11Service;
	@Autowired
	private DSYS01_DSYS03Service dSYS01_DSYS03Service;
	private EHCache eHCache = new EHCache("ehcacheMenu_zbz");
	private EHCache eHCacheMSG = new EHCache("ehcacheMSG");
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

	/**
	 * 
	 * @param request
	 * @param response
	 * @param msg
	 * @return
	 */
	@RequestMapping("/sel.do")
	public String getPreventions(HttpServletRequest request,
			HttpServletResponse response, @ModelAttribute("msg") String msg) {
		String JFNAME = request.getParameter("JFNAME");
		String ys = request.getParameter("page");
		Page page = null;
		if (ys == null) {
			if (JFNAME == null) {
				page = new Page(10, userService.getAllUserSize(), 1);
			} else {
				try {
					JFNAME = new String(JFNAME.getBytes("ISO8859-1"), "GBK");
					request.setAttribute("JFNAME", JFNAME);
				} catch (UnsupportedEncodingException e1) {
					e1.printStackTrace();
				}
				page = new Page(10, userService.getAllUserSizeByTJ(JFNAME), 1);
			}
		} else {
			if (JFNAME == null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				try {
					JFNAME = new String(JFNAME.getBytes("ISO8859-1"), "GBK");
					request.setAttribute("JFNAME", JFNAME);
				} catch (UnsupportedEncodingException e1) {
					e1.printStackTrace();
				}
				page = new Page(10, userService.getAllUserSizeByTJ(JFNAME),
						Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		if (JFNAME != null) {
			List<User> listUser = userService.SelectByName(page, JFNAME);
			request.setAttribute("listUser", listUser);
		} else {
			List<User> listUser = userService.SelectAllUser(page);
			request.setAttribute("listUser", listUser);
		}
		try {
			if (eHCache.getCacheElement("listxl") == null
					&& eHCache.getCacheElement("listrylb") == null) {
				List<Dsys11> listrylb = dsys11Service.SelecetAllBM("ZJ_RYLB");
				List<Dsys11> listxl = dsys11Service.SelecetAllBM("ZJ_XL");
				eHCache.addToCache("listxl", listxl, false);
				eHCache.addToCache("listrylb", listrylb, false);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "jf_users";
	}

	/**
	 * 添加用户
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/add.do")
	public String addPrevention(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		String JFUSERID = request.getParameter("JFUSERID");
		if (JFUSERID == null) {
			int maxFileSize = 2;// 兆
			String AllowedExtensions = ",.jpg,.jpeg,.gif,.png,";// 允许上传的文件类型
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
							model.addAttribute("msg", "1");
							return "redirect:/preven/sel.do";
						}
						if (AllowedExtensions.indexOf(hz) == -1) {
							model.addAttribute("msg", "2");
							return "redirect:/preven/sel.do";
						}
						myfile.saveAs("/assets/img/head/" + time + hz);
						CopeFile copeFile=new CopeFile();
						String oldPath=request.getSession().getServletContext().getRealPath("\\assets\\img\\head\\"+time + hz) ;
						String newPath=oldPath.split("Myssm_ZBZ")[0]+"Myssm"+oldPath.split("Myssm_ZBZ")[1];
						copeFile.copyFile(oldPath, newPath);
						saveurl = "//assets//img//head//" + time + hz;
						User user = new User();
						user.setDH(mySmartUpload.getRequest()
								.getParameter("DH"));
						user.setJFDSYS05_CODE(mySmartUpload.getRequest()
								.getParameter("JFDSYS05_CODE"));
						user.setDZXX(mySmartUpload.getRequest().getParameter(
								"DZXX"));
						user.setJFNAME(mySmartUpload.getRequest().getParameter(
								"JFNAME"));
						user.setJFPASSWORD(md5.md5Password(mySmartUpload
								.getRequest().getParameter("JFPASSWORD")));
						user.setJFREMARK(mySmartUpload.getRequest()
								.getParameter("JFREMARK"));
						user.setJFSTATE("0");
						user.setJFUSERID(mySmartUpload.getRequest()
								.getParameter("JFUSERID"));
						user.setLRRQ(new Date());
						user.setLRRY(mySmartUpload.getRequest().getParameter(
								"LRRY"));
						user.setRYFL(mySmartUpload.getRequest().getParameter(
								"RYFL"));
						user.setSF_XGPW("0");
						user.setSJ(mySmartUpload.getRequest()
								.getParameter("SJ"));
						String date = mySmartUpload.getRequest().getParameter(
								"SR");
						if (date != null && !date.equals("")) {
							Date SR = new SimpleDateFormat("yyyy-MM-dd")
									.parse(date);
							user.setSR(SR);
						}
						user.setXB(mySmartUpload.getRequest()
								.getParameter("XB"));
						if (!mySmartUpload.getRequest().getParameter("XL")
								.equals("0")) {
							user.setXL(mySmartUpload.getRequest().getParameter(
									"XL"));
						}
						user.setZPLJ(saveurl);
						user.setZPWJM(wjm);
						userService.addUser(user);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				User user = new User();
				user.setDH(request.getParameter("DH"));
				user.setJFDSYS05_CODE(request.getParameter("JFDSYS05_CODE"));
				user.setDZXX(request.getParameter("DZXX"));
				String JFNAME = request.getParameter("JFNAME");
				JFNAME = new String(JFNAME.getBytes("ISO8859-1"), "GBK");
				user.setJFNAME(JFNAME);
				user.setJFPASSWORD(md5.md5Password(request
						.getParameter("JFPASSWORD")));
				String JFREMARK = request.getParameter("JFREMARK");
				JFREMARK = new String(JFREMARK.getBytes("ISO8859-1"), "GBK");
				user.setJFREMARK(JFREMARK);
				user.setJFSTATE("0");
				user.setJFUSERID(request.getParameter("JFUSERID"));
				user.setLRRQ(new Date());
				user.setLRRY(request.getParameter("LRRY"));
				user.setRYFL(request.getParameter("RYFL"));
				user.setSF_XGPW("0");
				user.setSJ(request.getParameter("SJ"));
				String date = request.getParameter("SR");
				if (date != null && !date.equals("")) {
					Date SR = new SimpleDateFormat("yyyy-MM-dd").parse(date);
					user.setSR(SR);
				}
				user.setXB(request.getParameter("XB"));
				user.setZPLJ("//assets//img//head//1.png");
				user.setZPWJM("1.png");
				if (!request.getParameter("XL").equals("0")) {
					user.setXL(request.getParameter("XL"));
				}
				userService.addUser(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/preven/sel.do";
	}

	/**
	 * 去往更新页面根据id查询用户
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/up.do")
	public String upPrevention(HttpServletRequest request) {
		String id = request.getParameter("id");
		User user = userService.SelectById(id);
		request.setAttribute("userxq", user);
		// 查询全部角色
		List<Dsys03> lisrole = dsys03Service.SelectAllList();
		request.setAttribute("lisrole", lisrole);
		List<Dsys01_dsys03> listdsys01_dsys03 = dSYS01_DSYS03Service
				.SelectByJS(id);
		if (listdsys01_dsys03.size() >= 1) {
			String ids = "";
			for (int i = 0; i < listdsys01_dsys03.size(); i++) {
				ids += listdsys01_dsys03.get(i).getDSYS03_JFID() + ",";
			}
			ids = ids.substring(0, ids.length() - 1);
			request.setAttribute("ids", ids);
		}
		return "jf_users_up";
	}

	/**
	 * 更新用户信息
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/usms.do")
	public String upusermsg(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		String DZXX = request.getParameter("DZXX");
		if (DZXX == null) {
			int maxFileSize = 2;// 兆
			String AllowedExtensions = ",.jpg,.jpeg,.gif,.png,";// 允许上传的文件类型
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
							model.addAttribute("msg", "1");
							return "redirect:/preven/up.do";
						}
						if (AllowedExtensions.indexOf(hz) == -1) {
							model.addAttribute("msg", "2");
							return "redirect:/preven/up.do";
						}
						myfile.saveAs("/assets/img/head/" + time + hz);
						//同步头像
						CopeFile copeFile = new CopeFile();
						String oldPath = request
								.getSession()
								.getServletContext()
								.getRealPath(
										"\\assets\\img\\head\\" + time + ".jpg");
						String newPath = oldPath.split("Myssm_ZBZ")[0]
								+ "Myssm" + oldPath.split("Myssm_ZBZ")[1];
						copeFile.copyFile(oldPath, newPath);
						saveurl = "//assets//img//head//" + time + hz;
						User user = new User();
						user.setJFID(Integer.parseInt(mySmartUpload
								.getRequest().getParameter("JFID")));
						user.setJFDSYS05_CODE(mySmartUpload.getRequest()
								.getParameter("JFDSYS05_CODE"));
						user.setDH(mySmartUpload.getRequest()
								.getParameter("DH"));
						user.setDZXX(mySmartUpload.getRequest().getParameter(
								"DZXX"));
						user.setJFNAME(mySmartUpload.getRequest().getParameter(
								"JFNAME"));
						user.setJFREMARK(mySmartUpload.getRequest()
								.getParameter("JFREMARK"));
						user.setJFSTATE(mySmartUpload.getRequest()
								.getParameter("JFSTATE"));
						user.setRYFL(mySmartUpload.getRequest().getParameter(
								"RYFL"));
						user.setSF_XGPW(mySmartUpload.getRequest()
								.getParameter("SF_XGPW"));
						user.setSJ(mySmartUpload.getRequest()
								.getParameter("SJ"));
						String date = mySmartUpload.getRequest().getParameter(
								"SR");
						if (date != null && !date.equals("")) {
							Date SR = new SimpleDateFormat("yyyy-MM-dd")
									.parse(date);
							user.setSR(SR);
						}
						user.setXB(mySmartUpload.getRequest()
								.getParameter("XB"));
						if (!mySmartUpload.getRequest().getParameter("XL")
								.equals("0")) {
							user.setXL(mySmartUpload.getRequest().getParameter(
									"XL"));
						}
						user.setZPLJ(saveurl);
						user.setZPWJM(wjm);
						userService.UpUser(user);
						//更新用户头像相关的数据
						String ryfl="";
						if(mySmartUpload.getRequest().getParameter("RYFL")==null)
						{
							ryfl="0";
						}
						else
						{
							ryfl="1";
						}
						String KEY = ryfl + "," + user.getJFID();
						String str = (String) eHCacheMSG.getCacheElement(KEY);
						if (str != null && !str.equals("")) {
							JSONArray array = JSONArray.fromObject(str);
							List<DMSG> listdmsg = JSONArray.toList(array,
									DMSG.class);
							for (int j = 0; j < listdmsg.size(); j++) {
								listdmsg.get(j).setSZ_TX_LJ(saveurl);
								eHCacheMSG.getCache().remove(KEY);
								eHCacheMSG.addToCache(KEY,
										JSONArray.fromObject(listdmsg).toString(),
										true);
							}
						}
						String path = mySmartUpload.getRequest().getParameter(
								"ZPLJ");
						// 取出文件的绝对路径，然后用File方法删除相应文件。
						String absolutePath = request.getSession()
								.getServletContext().getRealPath(path);
						File file = new File(absolutePath);
						if (file.exists()) {
							file.delete();
						}
						return "redirect:/preven/sel.do";
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				User user = new User();
				user.setJFDSYS05_CODE(request.getParameter("JFDSYS05_CODE"));
				user.setJFID(Integer.parseInt(request.getParameter("JFID")));
				user.setDH(request.getParameter("DH"));
				user.setDZXX(request.getParameter("DZXX"));
				String JFNAME = request.getParameter("JFNAME");
				JFNAME = new String(JFNAME.getBytes("ISO8859-1"), "GBK");
				user.setJFNAME(JFNAME);
				String JFREMARK = request.getParameter("JFREMARK");
				JFREMARK = new String(JFREMARK.getBytes("ISO8859-1"), "GBK");
				user.setJFREMARK(JFREMARK);
				user.setJFSTATE(request.getParameter("JFSTATE"));
				user.setRYFL(request.getParameter("RYFL"));
				user.setSF_XGPW(request.getParameter("SF_XGPW"));
				user.setSJ(request.getParameter("SJ"));
				String date = request.getParameter("SR");
				if (date != null && !date.equals("")) {
					Date SR;
					SR = new SimpleDateFormat("yyyy-MM-dd").parse(date);
					user.setSR(SR);
				}
				user.setXB(request.getParameter("XB"));
				if (!request.getParameter("XL").equals("0")) {
					user.setXL(request.getParameter("XL"));
				}
				userService.UpUser(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/preven/sel.do";
	}

	/**
	 * 根据id删除用户
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/del.do")
	public String delPrevention(HttpServletRequest request) {
		String id = (String) request.getParameter("id");
		userService.delUser(id);
		return "redirect:/preven/sel.do";
	}

	/**
	 * 验证用户是否重复
	 * 
	 * @throws IOException
	 */
	@RequestMapping("/yzname.do")
	public void yzName(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("JFUSERID");
		User user = userService.SelectByName(name);
		if (user != null) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("data", "1");
			try {
				response.getWriter().print(jsonObj);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 修改密码
	 */
	@RequestMapping("/uppas.do")
	public String uppasword(HttpServletRequest request) {
		User user = new User();
		user.setJFID(Integer.parseInt(request.getParameter("JFID")));
		user.setJFPASSWORD(md5.md5Password(request.getParameter("JFPASSWORD")));
		userService.uppasword(user);
		return "redirect:/preven/sel.do";
	}
	/**
	 * 修改当前用户密码
	 * @param request
	 * @param response
	 */
	@RequestMapping("/xgmm.do")
	public void xgmm(HttpServletRequest request, HttpServletResponse response) {
		String OLDJFPASSWORD = request.getParameter("OLDJFPASSWORD");
		String JFPASSWORD = request.getParameter("JFPASSWORD");
		User user = (User) request.getSession().getAttribute("user");
		try {
			if (md5.md5Password(OLDJFPASSWORD).equals(user.getJFPASSWORD())) {
				user.setJFPASSWORD(md5.md5Password(JFPASSWORD));
				userService.uppasword(user);
				response.getWriter().print("OK");
			} else {
				response.getWriter().print("-1");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 添加角色
	 */
	@RequestMapping("/addjs.do")
	public String addjs(HttpServletRequest request, Model model) {
		String JFID = request.getParameter("JFID");
		String ids = request.getParameter("ids");
		String[] id = ids.split(",");
		dSYS01_DSYS03Service.delAll(Integer.parseInt(JFID));
		Dsys01_dsys03 dsys01_dsys03 = new Dsys01_dsys03();
		for (int i = 0; i < id.length; i++) {
			dsys01_dsys03.setDSYS01_JFID(Integer.parseInt(JFID));
			dsys01_dsys03.setDSYS03_JFID(Integer.parseInt(id[i]));
			dSYS01_DSYS03Service.insertJS(dsys01_dsys03);
		}
		model.addAttribute("id", JFID);
		return "redirect:/preven/up.do";

	}

	/**
	 * 添加角色
	 */
	@RequestMapping("/yzname_zfzz.do")
	public void yzname_zfzz(HttpServletRequest request,
			HttpServletResponse response) {
		String name = request.getParameter("JFUSERID");
		User user = userService.SelectByName_zfzz(name);
		if (user != null) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("data", "1");
			try {
				response.getWriter().print(jsonObj);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping("/yzname_nouser.do")
	public void yzname_nouser(HttpServletRequest request,
			HttpServletResponse response) {
		String name = request.getParameter("JFUSERID");
		String DDJ01_JFID = request.getParameter("JFID");
		String YHMOLD = request.getParameter("YHMOLD");
		User userzfzz = userService.SelectByZFZZBy99(DDJ01_JFID);
		User userold = userService.SelectByName_zfzz(YHMOLD);
		User user = userService.SelectByName_zfzz(name);
		JSONObject jsonObj = new JSONObject();
		int idzfzz = userzfzz.getJFID();
		int id = userold.getJFID();
		int idN=0;
		if (user != null) {
			 idN = user.getJFID();
		}
		try {
			if (user != null && idN != idzfzz) {
				jsonObj.put("data", "1");
				response.getWriter().print(jsonObj);
			} else if (user == null) {
				jsonObj.put("data", idzfzz + "");
				response.getWriter().print(jsonObj);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
