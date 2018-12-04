package com.ssh.user.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;

import com.ssh.user.model.DFW11;
import com.ssh.user.model.DFW11_D;
import com.ssh.user.model.Dsys11;
import com.ssh.user.service.DFW11Service;
import com.ssh.user.service.DFW11_DService;
import com.ssh.user.service.Dsys11Service;
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
	private EHCache eHCache = new EHCache("ehcacheMenu");
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
				page = new Page(10, dFW11Service.GetCount(map),Integer.parseInt(ys));
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
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gotolabel.do")
	public String gotoup(HttpServletRequest request) {
		String id=request.getParameter("id");
		DFW11 dFW11=dFW11Service.SelectByJfid(id);
		request.setAttribute("dFW11",dFW11);
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
		List<DFW11_D> listdfw11_d=dFW11_DService.SelectByFatherID(id);
		request.setAttribute("listdfw11_d",listdfw11_d);
		return "jf_dfw11_label";
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
}
