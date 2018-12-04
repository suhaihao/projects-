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
import com.ssh.user.model.DDJ01_JL;
import com.ssh.user.model.DDJ01_PJ;
import com.ssh.user.model.DDJ02;
import com.ssh.user.model.DSYS05;
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ01Service;
import com.ssh.user.service.DDJ01_JLService;
import com.ssh.user.service.DSYS05Service;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.service.UserService;
import com.ssh.user.util.CopeFile;
import com.ssh.user.util.MD5YZJM;
import com.ssh.user.util.Page;

@Controller
@Scope("prototype")
@RequestMapping(value = "/jl")
public class GiftController {
	@Autowired
	private DDJ01_JLService dDJ01_JLService;
	/**
	 * 主页面查询数据
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/sel.do")
	public String sel(HttpServletRequest request) {
		String DDJ01_JFID = request.getParameter("DDJ01_JFID");
		String DDJ01_MC = request.getParameter("DDJ01_MC");
		try {
			if (DDJ01_MC != null) {
				DDJ01_MC = new String(DDJ01_MC.getBytes("ISO8859-1"), "GBK");
				request.setAttribute("DDJ01_MC", DDJ01_MC);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String ys = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
		Page page = null;
		if (ys == null) {
			if (DDJ01_JFID != null) {
				map.put("DDJ01_JFID", DDJ01_JFID);
				request.setAttribute("DDJ01_JFID", DDJ01_JFID);
			}
			page = new Page(10, dDJ01_JLService.getCount(map), 1);
		} else {
			if (DDJ01_JFID == null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				if (DDJ01_JFID != null) {
					map.put("DDJ01_JFID", DDJ01_JFID);
					request.setAttribute("DDJ01_JFID", DDJ01_JFID);
				}
				page = new Page(10, dDJ01_JLService.getCount(map),
						Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		map.put("MAX", page.getMax());
		map.put("MIN", page.getMin());
		List<DDJ01_JL> listddj01_jl = dDJ01_JLService.SelectByDDJ01_JFID(map);
		request.setAttribute("listddj01_jl", listddj01_jl);
		return "jf_ddj01_jl";
	}
	/**
	 * 去往更新界面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/gotoup.do")
	public String gotoup(HttpServletRequest request) {
		String JFID = request.getParameter("JFID");
		DDJ01_JL dDJ01_JL = dDJ01_JLService.SelectById(JFID);
		request.setAttribute("dDJ01_JL", dDJ01_JL);
		return "jf_ddj01_jl_up";
	}
	/**
	 * 去往查看页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/gotolabel.do")
	public String gotolabel(HttpServletRequest request) {
		String JFID = request.getParameter("JFID");
		DDJ01_JL dDJ01_JL = dDJ01_JLService.SelectById(JFID);
		request.setAttribute("dDJ01_JL", dDJ01_JL);
		return "jf_ddj01_jl_label";
	}
	/**
	 * 更新评级信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/update.do")
	public String update(DDJ01_JL dDJ01_JL, HttpServletRequest request,
			Model model) {
		try {
			dDJ01_JL.setDDJ01_MC(new String(dDJ01_JL.getDDJ01_MC().getBytes(
					"ISO8859-1"), "GBK"));
			dDJ01_JL.setJL_SM(new String(dDJ01_JL.getJL_SM().getBytes(
					"ISO8859-1"), "GBK"));
			dDJ01_JL.setJL(new String(dDJ01_JL.getJL().getBytes(
					"ISO8859-1"), "GBK"));
			dDJ01_JLService.update(dDJ01_JL);
			model.addAttribute("JFID", dDJ01_JL.getJFID());
			if(dDJ01_JL.getZT().equals("1"))
			{
				return "redirect:/jl/sel.do";
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/jl/gotoup.do";
	}
	/**
	 * 添加信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/add.do")
	public String add(DDJ01_JL dDJ01_JL, HttpServletRequest request, Model model) {
		User user = (User) request.getSession().getAttribute("user");
		try {
			String JFID = dDJ01_JLService.getJFID();
			dDJ01_JL.setJFID(JFID);
			dDJ01_JL.setDDJ01_MC(new String(dDJ01_JL.getDDJ01_MC().getBytes(
					"ISO8859-1"), "GBK"));
			dDJ01_JL.setJL_SM(new String(dDJ01_JL.getJL_SM().getBytes(
					"ISO8859-1"), "GBK"));
			dDJ01_JL.setJL(new String(dDJ01_JL.getJL().getBytes(
					"ISO8859-1"), "GBK"));
			dDJ01_JL.setLRRY(user.getJFNAME());
			dDJ01_JLService.insert(dDJ01_JL);
			model.addAttribute("JFID", JFID);
			if(dDJ01_JL.getZT().equals("1"))
			{
				return "redirect:/jl/sel.do";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/jl/gotoup.do";
	}
	/**
	 * 根据ID删除数据
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/del.do")
	public String del(HttpServletRequest request) {
		String JFID=request.getParameter("JFID");
		dDJ01_JLService.delete(JFID);
		return "redirect:/jl/sel.do";
	}
}
