package com.ssh.user.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.user.model.DDJ01;
import com.ssh.user.model.DDJ01_PJ;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ01Service;
import com.ssh.user.service.DDJ01_PJService;
import com.ssh.user.util.Page;

@Controller
@Scope("prototype")
@RequestMapping("/pj")
public class PJController {
	@Autowired
	private DDJ01_PJService dDJ01_PJService;
	@Autowired
	private DDJ01Service dDJ01Service;

	/**
	 * 用户管理的查询界面
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
			page = new Page(10, dDJ01_PJService.getCount(map), 1);
		} else {
			if (DDJ01_JFID == null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				if (DDJ01_JFID != null) {
					map.put("DDJ01_JFID", DDJ01_JFID);
					request.setAttribute("DDJ01_JFID", DDJ01_JFID);
				}
				page = new Page(10, dDJ01_PJService.getCount(map),
						Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		map.put("MAX", page.getMax());
		map.put("MIN", page.getMin());
		List<DDJ01_PJ> listddj01_pj = dDJ01_PJService.SelectByDDJ01_JFID(map);
		request.setAttribute("listddj01_pj", listddj01_pj);
		return "jf_ddj01_pj";
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
		DDJ01_PJ dDJ01_PJ = dDJ01_PJService.SelectById(JFID);
		request.setAttribute("dDJ01_PJ", dDJ01_PJ);
		return "jf_ddj01_pj_up";
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
		DDJ01_PJ dDJ01_PJ = dDJ01_PJService.SelectById(JFID);
		request.setAttribute("dDJ01_PJ", dDJ01_PJ);
		return "jf_ddj01_pj_label";
	}
	/**
	 * 更新评级信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/update.do")
	public String update(DDJ01_PJ dDJ01_PJ, HttpServletRequest request,
			Model model) {
		try {
			dDJ01_PJ.setDDJ01_MC(new String(dDJ01_PJ.getDDJ01_MC().getBytes(
					"ISO8859-1"), "GBK"));
			dDJ01_PJ.setPJ_SM(new String(dDJ01_PJ.getPJ_SM().getBytes(
					"ISO8859-1"), "GBK"));
			dDJ01_PJService.update(dDJ01_PJ);
			model.addAttribute("JFID", dDJ01_PJ.getJFID());
			if(dDJ01_PJ.getZT().equals("1"))
			{
				DDJ01 dDJ01 = new DDJ01();
				dDJ01.setJFID(dDJ01_PJ.getDDJ01_JFID());
				dDJ01.setPJ(dDJ01_PJ.getPJ());
				dDJ01Service.updd01Byid(dDJ01);
				return "redirect:/pj/sel.do";
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/pj/gotoup.do";
	}

	/**
	 * 添加信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/add.do")
	public String add(DDJ01_PJ dDJ01_PJ, HttpServletRequest request, Model model) {
		User user = (User) request.getSession().getAttribute("user");
		try {
			String JFID = dDJ01_PJService.getJFID();
			dDJ01_PJ.setJFID(JFID);
			dDJ01_PJ.setDDJ01_MC(new String(dDJ01_PJ.getDDJ01_MC().getBytes(
					"ISO8859-1"), "GBK"));
			dDJ01_PJ.setPJ_SM(new String(dDJ01_PJ.getPJ_SM().getBytes(
					"ISO8859-1"), "GBK"));
			dDJ01_PJ.setLRRY(user.getJFNAME());
			dDJ01_PJService.insert(dDJ01_PJ);
			model.addAttribute("JFID", JFID);
			if (dDJ01_PJ.getZT().equals("1")) {
				DDJ01 dDJ01 = new DDJ01();
				dDJ01.setJFID(dDJ01_PJ.getDDJ01_JFID());
				dDJ01.setPJ(dDJ01_PJ.getPJ());
				dDJ01Service.updd01Byid(dDJ01);
				return "redirect:/pj/sel.do";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/pj/gotoup.do";
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
		dDJ01_PJService.delete(JFID);
		return "redirect:/pj/sel.do";
	}
}
