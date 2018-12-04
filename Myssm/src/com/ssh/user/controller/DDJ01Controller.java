package com.ssh.user.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ01Service;
import com.ssh.user.service.Dsys11Service;

@Controller
@Scope("prototype")
@RequestMapping(value = "/info")
public class DDJ01Controller implements ServletConfigAware,
ServletContextAware{
	@Autowired
	private DDJ01Service dDJ01Service;
	@Autowired
	private Dsys11Service dsys11Service;
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
	@RequestMapping(value = "/sel.do")
	public String seleByzfzz(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		List<DDJ01> list = dDJ01Service.SelectByDD01ID(user.getDDJ01_JFID());
		request.setAttribute("DDJ01", list.get(0));
		List<Dsys11> lisfw = dsys11Service.selectAllFw();
		request.setAttribute("lisfw", lisfw);
		List<DDJ01_D> list_d = dDJ01Service.SelectByDDID(user.getDDJ01_JFID());
		if (list_d != null && list_d.size() >= 1) {
			String ids = "";
			for (int i = 0; i < list_d.size(); i++) {
				ids=ids+list_d.get(i).getFWNRLB()+",";
			}
			request.setAttribute("ids", ids);
		}
		request.setAttribute("list_d", list_d);
		return "jf_dd01";
	}

	@RequestMapping(value = "/ind.do")
	public String insd(HttpServletRequest request,HttpServletResponse response,Model model) {
		if(request.getParameter("zt")==null)
		{
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
							return "redirect:/info/sel.do";
						}
						if (AllowedExtensions.indexOf(hz) == -1) {
							model.addAttribute("msg", "2");
							return "redirect:/info/sel.do";
						}
						myfile.saveAs("/assets/img/logo/"+time+hz);
						saveurl = "//assets//img//logo//" + time + hz;
						DDJ01 dDJ01=new DDJ01();
						dDJ01.setJFID(mySmartUpload.getRequest().getParameter("JFID"));
						dDJ01.setXZQH(mySmartUpload.getRequest().getParameter("XZQH"));
						dDJ01.setDZ(mySmartUpload.getRequest().getParameter("DZ"));
						dDJ01.setGPS_DJ(mySmartUpload.getRequest().getParameter("GPS_DJ"));
						dDJ01.setGPS_BW(mySmartUpload.getRequest().getParameter("GPS_BW"));
						dDJ01.setLX_DH(mySmartUpload.getRequest().getParameter("LX_DH"));
						dDJ01.setLX_SJ(mySmartUpload.getRequest().getParameter("LX_SJ"));
						dDJ01.setWWW(mySmartUpload.getRequest().getParameter("WWW"));
						dDJ01.setYX(mySmartUpload.getRequest().getParameter("YX"));
						dDJ01.setJJ(mySmartUpload.getRequest().getParameter("JJ"));
						dDJ01.setBZ(mySmartUpload.getRequest().getParameter("BZ"));
						dDJ01.setLOGO(saveurl);
						dDJ01Service.updd01Byid(dDJ01);
						DDJ01_D dDJ01_D = new DDJ01_D();
						String ids = mySmartUpload.getRequest().getParameter("ids");
						if (ids != null) {
						//删除相关服务
							dDJ01Service.delAllfw(mySmartUpload.getRequest().getParameter("JFID"));	
							String[] idsz = ids.split(",");
							if (idsz.length >= 1) {
								for (int j = 0; j < idsz.length; j++) {
									String id_d = mySmartUpload.getRequest().getParameter(idsz[j]);
									if (id_d != null) {
										dDJ01_D.setDDJ01_JFID(dDJ01.getJFID());
										dDJ01_D.setFWNRLB(id_d);
										dDJ01_D.setXY_JF(4);
										dDJ01_D.setSM(mySmartUpload.getRequest().getParameter("sm"+id_d));
										dDJ01Service.insdd_d(dDJ01_D);
									}
								}
							}
						}
					}
				}
				return "redirect:/info/sel.do";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else
		{
		try {
			DDJ01 dDJ01=new DDJ01();
			dDJ01.setJFID(request.getParameter("JFID"));
			dDJ01.setXZQH(request.getParameter("XZQH"));
			dDJ01.setGPS_DJ(request.getParameter("GPS_DJ"));
			dDJ01.setGPS_BW(request.getParameter("GPS_BW"));
			dDJ01.setLX_DH(request.getParameter("LX_DH"));
			dDJ01.setLX_SJ(request.getParameter("LX_SJ"));
			dDJ01.setWWW(request.getParameter("WWW"));
			dDJ01.setYX(request.getParameter("YX"));
			dDJ01.setDZ(new String(request.getParameter("DZ").getBytes("ISO8859-1"), "GBK"));
			dDJ01.setJJ(new String(request.getParameter("JJ").getBytes("ISO8859-1"), "GBK"));
			dDJ01.setBZ(new String(request.getParameter("BZ").getBytes("ISO8859-1"), "GBK"));
			dDJ01Service.updd01Byid(dDJ01);
			DDJ01_D dDJ01_D = new DDJ01_D();
			String ids = request.getParameter("ids");
			if (ids != null) {
			//删除相关服务
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
									"sm" + id_d).getBytes("ISO8859-1"), "GBK"));
							dDJ01Service.insdd_d(dDJ01_D);
						}
					}
				}
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	   }
		return "redirect:/info/sel.do";
	}
}
