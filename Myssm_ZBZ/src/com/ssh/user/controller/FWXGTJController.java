package com.ssh.user.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.user.model.DFW02;
import com.ssh.user.model.DSYS05;
import com.ssh.user.service.DFW02Service;
import com.ssh.user.service.DSYS05Service;

@Controller
@Scope("prototype")
@RequestMapping(value = "/fwxgtj")
public class FWXGTJController {
	@Autowired
	private DFW02Service dFW02Service;
	@Autowired
	private DSYS05Service dSYS05Service;
	@RequestMapping(value = "/sel.do")
	public String sel(HttpServletRequest request) {
		String StarTime = request.getParameter("StarTime");
		String EndTime = request.getParameter("EndTime");
		String BMBM = request.getParameter("BMBM");
		String TJFS = request.getParameter("TJFS");
		if (TJFS != null) {
			request.setAttribute("TJFS", TJFS);
		} else {
			TJFS="1";
			request.setAttribute("TJFS", 1);
		}
		Map<String, String> map = new HashMap<String, String>();
		if (StarTime != null) {
			map.put("StarTime", StarTime);
			request.setAttribute("StarTime", StarTime);
		}
		if (EndTime != null) {
			map.put("EndTime", EndTime);
			request.setAttribute("EndTime", EndTime);
		}
		if (BMBM != null) {
			map.put("BMBM", BMBM);
			request.setAttribute("BMBM", BMBM);
		}
		if(TJFS.equals("1"))
		{
			List<DFW02> listdw02=dFW02Service.SelectFWXGTJ1(map);
			request.setAttribute("listdw02",listdw02);
		}
		if(TJFS.equals("2"))
		{
			List<DFW02> listdw02=dFW02Service.SelectFWXGTJ2(map);
			request.setAttribute("listdw02",listdw02);
		}
		if(TJFS.equals("3"))
		{
			List<DFW02> listdw02=dFW02Service.SelectFWXGTJ3(map);
			request.setAttribute("listdw02",listdw02);
		}
		DFW02 hj=dFW02Service.SelectFWXGTJHJ(map);
		request.setAttribute("hj",hj);
		List<DSYS05> listdsys05 = dSYS05Service.SelectByFather("0001", "3");
		request.setAttribute("listdsys05", listdsys05);
		return "jf_dfw02_xg";
	}
}
