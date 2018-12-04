package com.ssh.user.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.user.model.Dsys10;
import com.ssh.user.model.Dsys11;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.util.Page;

@Controller
@Scope("prototype")
@RequestMapping(value = "/dmgl")
public class Dsys11Controller {
	@Autowired
	private Dsys11Service dsys11Service;

	@RequestMapping(value = "/sel.do")
	public String sel(HttpServletRequest request) {
		String HZMC = request.getParameter("HZMC");
		try {
			if (HZMC != null) {
				HZMC = new String(HZMC.getBytes("ISO8859-1"), "GBK");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String ys = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
		Page page = null;
		if (ys == null) {
			if (HZMC != null) {
				map.put("HZMC", HZMC);
				request.setAttribute("HZMC", HZMC);
			}
			page = new Page(10, dsys11Service.getDsys10Count(map), 1);
		} else {
			if (HZMC == null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				if (HZMC != null) {
					map.put("HZMC", HZMC);
					request.setAttribute("HZMC", HZMC);
				}
				page = new Page(10, dsys11Service.getDsys10Count(map),
						Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		map.put("MAX", page.getMax());
		map.put("MIN", page.getMin());
		List<Dsys10> listdsys10 = dsys11Service.SelectDsys10(map);
		request.setAttribute("listdsys10", listdsys10);
		return "jf_dsys10";
	}

	@RequestMapping(value = "/gotodsys11.do")
	public String gotodsys11(HttpServletRequest request) {
		String BMLB = request.getParameter("BMLB");
		String HZMC = request.getParameter("HZMC");
		try {
			if (HZMC != null) {
				HZMC = new String(HZMC.getBytes("ISO8859-1"), "GBK");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String ys = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
		Page page = null;
		if (ys == null) {
			if (HZMC != null) {
				map.put("HZMC", HZMC);
				request.setAttribute("HZMC", HZMC);
			}
			if (BMLB != null) {
				map.put("BMLB", BMLB);
				request.setAttribute("BMLB", BMLB);
			}
			page = new Page(10, dsys11Service.getDsys11Count(map), 1);
		} else {
			if (HZMC == null && BMLB == null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				if (HZMC != null) {
					map.put("HZMC", HZMC);
					request.setAttribute("HZMC", HZMC);
				}
				if (BMLB != null) {
					map.put("BMLB", BMLB);
					request.setAttribute("BMLB", BMLB);
				}
				page = new Page(10, dsys11Service.getDsys11Count(map),
						Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		map.put("MAX", page.getMax());
		map.put("MIN", page.getMin());
		List<Dsys11> listdsys11 = dsys11Service.SelectDsys11(map);
		request.setAttribute("listdsys11", listdsys11);
		return "jf_dsys10_11";
	}

	@RequestMapping(value = "/add.do")
	public String add(HttpServletRequest request, Model model) {
		Dsys11 dsys11 = new Dsys11();
		dsys11.setBM(request.getParameter("BM"));
		dsys11.setBMLB(request.getParameter("BMLB"));
		try {
			dsys11.setHZMC(new String(request.getParameter("HZMC").getBytes(
					"ISO8859-1"), "GBK"));
			dsys11.setBZ1(new String(request.getParameter("BZ1").getBytes(
					"ISO8859-1"), "GBK"));
			dsys11.setBZ2(new String(request.getParameter("BZ2").getBytes(
					"ISO8859-1"), "GBK"));
			dsys11.setBZ3(new String(request.getParameter("BZ3").getBytes(
					"ISO8859-1"), "GBK"));
			dsys11.setBZ4(new String(request.getParameter("BZ4").getBytes(
					"ISO8859-1"), "GBK"));
			dsys11.setBZ5(new String(request.getParameter("BZ5").getBytes(
					"ISO8859-1"), "GBK"));
			dsys11.setBZ6(new String(request.getParameter("BZ6").getBytes(
					"ISO8859-1"), "GBK"));
			dsys11.setBZ(new String(request.getParameter("BZ").getBytes(
					"ISO8859-1"), "GBK"));
			dsys11Service.insert(dsys11);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		model.addAttribute("BMLB", request.getParameter("BMLB"));
		return "redirect:/dmgl/gotodsys11.do";
	}

	@RequestMapping(value = "/yzbm.do")
	public void yzbm(HttpServletRequest request, HttpServletResponse response) {
		String BM = request.getParameter("BM");
		String BMLB = request.getParameter("BMLB");
		Dsys11 dsys11 = dsys11Service.SelectByBM_BMLB(BM, BMLB);
		JSONObject jsonObj = new JSONObject();
		if (dsys11 != null) {
			jsonObj.put("data", "1");
			try {
				response.getWriter().print(jsonObj);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "/gotoup.do")
	public String gotoup(HttpServletRequest request) {
		String JFID = request.getParameter("JFID");
		Dsys11 dsys11 = dsys11Service.SelectByJFID(JFID);
		request.setAttribute("dsys11", dsys11);
		return "jf_dsys11_up";
	}

	@RequestMapping(value = "/update.do")
	public String update(HttpServletRequest request,Model model) {
		Dsys11 dsys11 = new Dsys11();
		dsys11.setJFID(request.getParameter("JFID"));
		dsys11.setBM(request.getParameter("BM"));
		try {
			dsys11.setHZMC(new String(request.getParameter("HZMC").getBytes(
					"ISO8859-1"), "GBK"));
			dsys11.setBZ1(new String(request.getParameter("BZ1").getBytes(
					"ISO8859-1"), "GBK"));
			dsys11.setBZ2(new String(request.getParameter("BZ2").getBytes(
					"ISO8859-1"), "GBK"));
			dsys11.setBZ3(new String(request.getParameter("BZ3").getBytes(
					"ISO8859-1"), "GBK"));
			dsys11.setBZ4(new String(request.getParameter("BZ4").getBytes(
					"ISO8859-1"), "GBK"));
			dsys11.setBZ5(new String(request.getParameter("BZ5").getBytes(
					"ISO8859-1"), "GBK"));
			dsys11.setBZ6(new String(request.getParameter("BZ6").getBytes(
					"ISO8859-1"), "GBK"));
			dsys11.setBZ(new String(request.getParameter("BZ").getBytes(
					"ISO8859-1"), "GBK"));
			dsys11Service.update(dsys11);
			model.addAttribute("JFID", request.getParameter("JFID"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/dmgl/gotoup.do";
	}
	@RequestMapping(value = "/delete.do")
	public String delete(HttpServletRequest request,Model model) {
		String JFID=request.getParameter("JFID");
		String BMLB=request.getParameter("BMLB");
		dsys11Service.delete(JFID);
		model.addAttribute("BMLB",BMLB);
		return "redirect:/dmgl/gotodsys11.do";
	}

}
