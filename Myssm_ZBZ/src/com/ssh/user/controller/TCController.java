package com.ssh.user.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.user.model.DDJ01;
import com.ssh.user.model.DDJ01_D;
import com.ssh.user.model.DDJ01_PJ;
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ01Service;
import com.ssh.user.service.DDJ01_PJService;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.util.Page;

@Controller
@Scope("prototype")
@RequestMapping("/tc")
public class TCController {
	@Autowired
	private DDJ01Service dDJ01Service;
	@Autowired
	private Dsys11Service dsys11Service;
	/**
	 * 用户管理的查询界面
	 */
	@RequestMapping(value = "/sel.do")
	public String sel(HttpServletRequest request) {
		String MC = request.getParameter("MC");
		try {
			if (MC != null) {
				MC = new String(MC.getBytes("ISO8859-1"), "GBK");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String ys = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
		Page page = null;
		if (ys == null) {
			if (MC != null) {
				map.put("MC", MC);
				request.setAttribute("MC", MC);
			}
			page = new Page(10, dDJ01Service.getCountByZT(map), 1);
		} else {
			if (MC == null) {
				page = new Page(10, Integer.parseInt(request
						.getParameter("allSize")), Integer.parseInt(ys));
			} else {
				if (MC != null) {
					map.put("MC", MC);
					request.setAttribute("MC", MC);
				}
				page = new Page(10, dDJ01Service.getCountByZT(map),
						Integer.parseInt(ys));
			}
		}
		request.setAttribute("page", page);
		map.put("MAX", page.getMax());
		map.put("MIN", page.getMin());
		List<DDJ01> listddj01=dDJ01Service.SelectByZT(map);
		request.setAttribute("listddj01", listddj01);
		return "jf_ddj01_tc";
	}
	/**
	 * 退出专访组织更新数据
	 */
	@RequestMapping(value = "/add.do")
	public String add(DDJ01 dDJ01,HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		try {
			dDJ01.setMC("");
			dDJ01.setTC_LRRY(user.getJFNAME());
			dDJ01.setTC_LRRQ(new Date());
			dDJ01.setTC_SM(new String(dDJ01.getTC_SM().getBytes(
					"ISO8859-1"), "GBK"));
			dDJ01.setZT("0");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		dDJ01Service.updd01Byid(dDJ01);
		return "redirect:/tc/sel.do";
	}
	/**
	 * 退出专访组织更新数据
	 */
	@RequestMapping(value = "/gotolabel.do")
	public String gotolabel(HttpServletRequest request,
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
		return "jf_ddj01_tc_lable";
	}
}
