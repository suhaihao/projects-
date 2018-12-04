package com.ssh.user.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.ssh.user.model.DFW11;
import com.ssh.user.model.DFW11_D;
import com.ssh.user.model.Dsys11;
import com.ssh.user.service.DFW11Service;
import com.ssh.user.service.DFW11_DService;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.util.CopeFile;
import com.ssh.user.util.EHCache;
import com.ssh.user.util.Page;

@Controller
@Scope("prototype")
@RequestMapping(value = "/hxjs")
public class DFW11Controller implements ServletConfigAware, ServletContextAware {
	@Autowired
	private DFW11Service dFW11Service;
	@Autowired
	private Dsys11Service dsys11Service;
	@Autowired
	private DFW11_DService dFW11_DService;
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

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/sel.do")
	public String seleByzfzz(HttpServletRequest request) {
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
		return "jf_dfw11";
	}

	/**
	 * 去往查看页面
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gotolabel.do")
	public String gotoup(HttpServletRequest request) {
		String id = request.getParameter("id");
		DFW11 dFW11 = dFW11Service.SelectByJfid(id);
		request.setAttribute("dFW11", dFW11);
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
		List<DFW11_D> listdfw11_d = dFW11_DService.SelectByFatherID(id);
		request.setAttribute("listdfw11_d", listdfw11_d);
		return "jf_dfw11_label";
	}

	/**
	 * 添加
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/add.do")
	public String add(HttpServletRequest request, HttpServletResponse response,
			Model model) {
		SimpleDateFormat dateTimeFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		String date = dateTimeFormat.format(new Date());
		if (request.getParameter("ZT") == null) {
			int maxFileSize = 50;// 兆
			Random rdm = new Random(System.currentTimeMillis());// 获得随机种子
			SmartUpload mySmartUpload = new SmartUpload();
			try {
				mySmartUpload.initialize(servletConfig, request, response);
				mySmartUpload.upload();
				String saveurl = "";
				String wjm = "";
				String JFID = "";
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
							return "redirect:/hxjs/sel.do";
						}
						myfile.saveAs("/assets/img/logo/" + time + hz);
						CopeFile copeFile=new CopeFile();
						String oldPath=request.getSession().getServletContext().getRealPath("\\assets\\img\\logo\\"+time + hz) ;
						String newPath=oldPath.split("Myssm_ZBZ")[0]+"Myssm"+oldPath.split("Myssm_ZBZ")[1];
						copeFile.copyFile(oldPath, newPath);
						saveurl = "//assets//img//logo//" + time + hz;
						request.getSession().setAttribute("URL", saveurl);
						request.getSession().setAttribute("SIZE", myfile.getSize());
						if (i == 0) {
							JFID = dFW11Service.getJFID();
							DFW11 dFW11 = new DFW11();
							dFW11.setJFID(JFID);
							dFW11.setBT(mySmartUpload.getRequest()
									.getParameter("BT"));
							dFW11.setNR(mySmartUpload.getRequest()
									.getParameter("NR"));
							dFW11.setFL(mySmartUpload.getRequest()
									.getParameter("FL"));
							dFW11.setLRRY(mySmartUpload.getRequest()
									.getParameter("LRRY"));
							dFW11.setLRRQ(dateTimeFormat.parse(date));
							dFW11.setZT(mySmartUpload.getRequest()
									.getParameter("ZT"));
							dFW11Service.insertDFW11(dFW11);
							DFW11_D dFW11_D = new DFW11_D();
							dFW11_D.setDFW11_JFID(JFID);
							dFW11_D.setFJ_LJ(saveurl);
							dFW11_D.setFJ_WJM(wjm);
							dFW11_DService.insert(dFW11_D);
						} else {
							DFW11_D dFW11_D = new DFW11_D();
							dFW11_D.setDFW11_JFID(JFID);
							dFW11_D.setFJ_LJ(saveurl);
							dFW11_D.setFJ_WJM(wjm);
							dFW11_DService.insert(dFW11_D);
						}
					}
				}
				return "redirect:/hxjs/sel.do";
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				String JFID = dFW11Service.getJFID();
				DFW11 dFW11 = new DFW11();
				dFW11.setJFID(JFID);
				dFW11.setBT(new String(request.getParameter("BT").getBytes(
						"ISO8859-1"), "GBK"));
				String NR = request.getParameter("NR");
				if (NR != null) {
					dFW11.setNR(new String(request.getParameter("NR").getBytes(
							"ISO8859-1"), "GBK"));
				}
				dFW11.setFL(request.getParameter("FL"));
				dFW11.setLRRY(request.getParameter("LRRY"));
				dFW11.setLRRQ(dateTimeFormat.parse(date));
				dFW11.setZT(request.getParameter("ZT"));
				dFW11Service.insertDFW11(dFW11);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/hxjs/sel.do";
	}

	/**
	 * 删除数据
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/del.do")
	public String del(HttpServletRequest request, HttpServletResponse response,
			Model model) {
		String JFID = request.getParameter("JFID");
		dFW11Service.delete(JFID);
		dFW11_DService.delete(JFID);
		return "redirect:/hxjs/sel.do";
	}

	/**
	 * 去往更新界面
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gotoup.do")
	public String gotoup(HttpServletRequest request,
			HttpServletResponse response, @ModelAttribute("msg") String msg) {
		String JFID = request.getParameter("JFID");
		request.setAttribute("msg", msg);
		DFW11 dFW11 = dFW11Service.SelectByJfid(JFID);
		request.setAttribute("dFW11", dFW11);
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
		List<DFW11_D> listdfw11_d = dFW11_DService.SelectByFatherID(JFID);
		request.setAttribute("listdfw11_d", listdfw11_d);
		return "jf_dfw11_up";
	}

	@RequestMapping(value = "/update.do")
	public String update(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if (request.getParameter("ZT") == null) {
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
							model.addAttribute("msg", "1");
							return "redirect:/hxjs/gotoup.do";
						}
						myfile.saveAs("/assets/img/logo/" + time + hz);
						CopeFile copeFile=new CopeFile();
						String oldPath=request.getSession().getServletContext().getRealPath("\\assets\\img\\logo\\"+time + hz) ;
						String newPath=oldPath.split("Myssm_ZBZ")[0]+"Myssm"+oldPath.split("Myssm_ZBZ")[1];
						copeFile.copyFile(oldPath, newPath);
						saveurl = "//assets//img//logo//" + time + hz;
						if (i == 0) {
							DFW11 dFW11 = new DFW11();
							dFW11.setJFID(mySmartUpload.getRequest()
									.getParameter("JFID"));
							dFW11.setBT(mySmartUpload.getRequest()
									.getParameter("BT"));
							dFW11.setNR(mySmartUpload.getRequest()
									.getParameter("NR"));
							dFW11.setFL(mySmartUpload.getRequest()
									.getParameter("FL"));
							dFW11.setZT(mySmartUpload.getRequest()
									.getParameter("ZT"));
							dFW11Service.update(dFW11);
							DFW11_D dFW11_D = new DFW11_D();
							dFW11_D.setDFW11_JFID(mySmartUpload.getRequest()
									.getParameter("JFID"));
							dFW11_D.setFJ_LJ(saveurl);
							dFW11_D.setFJ_WJM(wjm);
							dFW11_DService.insert(dFW11_D);
						} else {
							DFW11_D dFW11_D = new DFW11_D();
							dFW11_D.setDFW11_JFID(mySmartUpload.getRequest()
									.getParameter("JFID"));
							dFW11_D.setFJ_LJ(saveurl);
							dFW11_D.setFJ_WJM(wjm);
							dFW11_DService.insert(dFW11_D);
						}
					}
				}
				if (mySmartUpload.getRequest().getParameter("ZT").equals("0")) {
					model.addAttribute("JFID", mySmartUpload.getRequest()
							.getParameter("JFID"));
					return "redirect:/hxjs/gotoup.do";
				} else {
					return "redirect:/hxjs/sel.do";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				DFW11 dFW11 = new DFW11();
				dFW11.setJFID(request.getParameter("JFID"));
				dFW11.setBT(new String(request.getParameter("BT").getBytes(
						"ISO8859-1"), "GBK"));
				String NR = request.getParameter("NR");
				if (NR != null) {
					dFW11.setNR(new String(request.getParameter("NR").getBytes(
							"ISO8859-1"), "GBK"));
				}
				dFW11.setFL(request.getParameter("FL"));
				dFW11.setZT(request.getParameter("ZT"));
				dFW11Service.update(dFW11);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (request.getParameter("ZT").equals("0")) {
			model.addAttribute("JFID", request.getParameter("JFID"));
			return "redirect:/hxjs/gotoup.do";
		} else {
			return "redirect:/hxjs/sel.do";
		}
	}

	@RequestMapping(value = "/cancelsubmit.do")
	public String cancelsubmit(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		String JFID = request.getParameter("JFID");
		dFW11Service.updateZT(JFID);
		model.addAttribute("JFID", JFID);
		return "redirect:/hxjs/gotoup.do";
	}

	@RequestMapping(value = "/deleteattachment.do")
	public String deleteattachment(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		String JFID = request.getParameter("JFID");
		String DFW11_JFID = request.getParameter("DFW11_JFID");
		dFW11_DService.deleteByJFID(JFID);
		model.addAttribute("JFID", DFW11_JFID);
		return "redirect:/hxjs/gotoup.do";
	}

	@RequestMapping(value = "/downloadfile.do")
	public void downloadfile(HttpServletRequest request,
			HttpServletResponse response) {
		String filename = request.getParameter("filename");
		String fileurl = request.getParameter("fileurl");
		// 读取文件
		try {
			if(filename!=null)
			{
			filename = new String(filename.getBytes("ISO8859-1"), "GBK");
			}
			// 设置文件MIME类型
			response.setContentType(servletContext.getMimeType(filename));
			filename=URLEncoder.encode(filename,"UTF-8");
			// 设置Content-Disposition
			response.setHeader("Content-Disposition", "attachment;filename="+filename);
			File html_file = new File(servletContext.getRealPath(fileurl));  
            FileInputStream inputStream = new FileInputStream(html_file); 
            ServletOutputStream out;
			// 写文件
            out = response.getOutputStream();  
            int b = 0;  
            byte[] buffer = new byte[1024];  
            while ((b = inputStream.read(buffer)) != -1) {  
                // 4.写到输出流(out)中  
                out.write(buffer, 0, b);  
            }  
            inputStream.close(); 
            out.flush();  
            out.close();  
		} catch (IOException e) {
		}
	}
	@RequestMapping(value = "/getfileSize.do")
	public void getfileSize(HttpServletRequest request,
			HttpServletResponse response) {
		String URL=(String) request.getSession().getAttribute("URL");
		String SIZE=(String) request.getSession().getAttribute("SIZE");
		String a=servletContext.getRealPath(URL);
		File f= new File(servletContext.getRealPath(a));  
	    if (f.exists() && f.isFile()){  
	        long lenght=f.length(); 
	    }else{  
	    	
	    }  
	}

}
