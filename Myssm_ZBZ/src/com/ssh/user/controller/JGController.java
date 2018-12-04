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
import com.ssh.user.model.DSYS05;
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ01Service;
import com.ssh.user.service.DDJ01_JLService;
import com.ssh.user.service.DDJ11Service;
import com.ssh.user.service.DSYS05Service;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.service.UserService;
import com.ssh.user.util.CopeFile;
import com.ssh.user.util.EHCache;
import com.ssh.user.util.MD5YZJM;
import com.ssh.user.util.Page;

@Controller
@Scope("prototype")
@RequestMapping(value = "/jg")
public class JGController {
	@Autowired
	private Dsys11Service dsys11Service;
	@Autowired
	private DDJ11Service dDJ11Service;
	private EHCache eHCache = new EHCache("ehcacheMenu_zbz");

	/**
	 * 主页面查询数据
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/sel.do")
	public String sel(HttpServletRequest request) {
		String XZ = request.getParameter("XZ");
		if (XZ == null) {
			XZ = "1";
			request.setAttribute("XZ", XZ);
		} else {
			request.setAttribute("XZ", XZ);
		}
		// 施药器械监管
		String ys = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
		Page page = null;
		map.put("BMLB", "SYQX");
		if (ys == null) {
			page = new Page(10, dsys11Service.getDsys11Count(map), 1);
		} else {
			page = new Page(10, Integer.parseInt(request
					.getParameter("allSize")), Integer.parseInt(ys));
		}
		request.setAttribute("page", page);
		map.put("MAX", page.getMax());
		map.put("MIN", page.getMin());
		List<Dsys11> listdsys11 = dsys11Service.SelectDsys11(map);
		request.setAttribute("listdsys11", listdsys11);
		// 防治措施监管
		String MC = request.getParameter("MC");
		String FL = request.getParameter("FL");
		String DDJ01_JFID = request.getParameter("DDJ01_JFID");
		String DDJ01_MC = request.getParameter("DDJ01_MC");
		String ysfz = request.getParameter("pagefz");
		Map<String, Object> mapfz = new HashMap<String, Object>();
		try {
			if (MC != null && !MC.equals("")) {
				MC = new String(MC.getBytes("ISO8859-1"), "GBK");
			}
			if (DDJ01_MC != null && !DDJ01_MC.equals("")) {
				DDJ01_MC = new String(DDJ01_MC.getBytes("ISO8859-1"), "GBK");
				request.setAttribute("DDJ01_MC", DDJ01_MC);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Page pagefz = null;
		if (ysfz == null) {
			if (DDJ01_JFID != null && !DDJ01_JFID.equals("")) {
				mapfz.put("DDJ01_JFID", DDJ01_JFID);
				request.setAttribute("DDJ01_JFID", DDJ01_JFID);
			}
			if (MC != null && !MC.equals("")) {
				mapfz.put("MC", MC);
				request.setAttribute("MC", MC);
			}
			if (FL != null && !FL.equals("")) {
				mapfz.put("FL", FL);
				request.setAttribute("FL", FL);
			}
			pagefz = new Page(10, dDJ11Service.getCountAll(mapfz), 1);
		} else {
			if (MC == null && FL == null && DDJ01_JFID == null) {
				pagefz = new Page(10, Integer.parseInt(request
						.getParameter("allSizefz")), Integer.parseInt(ysfz));
			} else {
				pagefz = new Page(10, dDJ11Service.getCountAll(mapfz),
						Integer.parseInt(ysfz));
			}
		}
		request.setAttribute("pagefz", pagefz);
		mapfz.put("MAX", pagefz.getMax());
		mapfz.put("MIN", pagefz.getMin());
		List<DDJ11> listddj11 = dDJ11Service.selectAll(mapfz);
		request.setAttribute("listddj11", listddj11);
		try {
			if (eHCache.getCacheElement("lisfzfl") == null) {
				List<Dsys11> lisfzfl = dsys11Service.selectAllfzcsfl();
				request.setAttribute("lisfzfl", lisfzfl);
				eHCache.addToCache("lisfzfl", lisfzfl, false);
			} else {
				List<Dsys11> lisfzfl = (List<Dsys11>) eHCache
						.getCacheElement("lisfzfl");
				request.setAttribute("lisfzfl", lisfzfl);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "jf_ddj01_jg";
	}

	/**
	 * 验证部门
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/yzname.do")
	public void yzname(HttpServletRequest request, HttpServletResponse response) {
		String bm = request.getParameter("JFUSERID");
		Dsys11 dsys11 = dsys11Service.SelectByBM_BMLB(bm, "SYQX");
		if (dsys11 != null) {
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
	 * 插入数据
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/add.do")
	public String add(Dsys11 dsys11, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			dsys11.setHZMC(new String(dsys11.getHZMC().getBytes("ISO8859-1"),
					"GBK"));
			dsys11.setBZ(new String(dsys11.getBZ().getBytes("ISO8859-1"), "GBK"));

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		dsys11.setBMLB("SYQX");
		dsys11Service.insert(dsys11);
		return "redirect:/jg/sel.do";
	}

	/**
	 * 查询一条信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/gotoup.do")
	public String gotoup(HttpServletRequest request,
			HttpServletResponse response) {
		String JFID = request.getParameter("JFID");
		Dsys11 dsys11 = dsys11Service.SelectByJFID(JFID);
		request.setAttribute("dsys11", dsys11);
		return "jf_ddj01_jg_up";
	}

	/**
	 * 更新信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/update.do")
	public String update(Dsys11 dsys11, HttpServletRequest request, Model model) {
		try {
			dsys11.setHZMC(new String(dsys11.getHZMC().getBytes("ISO8859-1"),
					"GBK"));
			dsys11.setBZ(new String(dsys11.getBZ().getBytes("ISO8859-1"), "GBK"));
			dsys11Service.update(dsys11);
			model.addAttribute("JFID", dsys11.getJFID());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/jg/gotoup.do";
	}

	/**
	 * 根据ID删除数据
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/del.do")
	public String del(HttpServletRequest request) {
		String JFID = request.getParameter("JFID");
		dsys11Service.delete(JFID);
		return "redirect:/jg/sel.do";
	}
}
