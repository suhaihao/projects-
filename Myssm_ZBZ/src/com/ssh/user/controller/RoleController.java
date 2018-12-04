package com.ssh.user.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.user.model.Dsys02_dsys03;
import com.ssh.user.model.Dsys02_zfzz;
import com.ssh.user.model.Dsys03;
import com.ssh.user.service.Dsys02_dsys03Service;
import com.ssh.user.service.Dsys02_zfzzService;
import com.ssh.user.service.Dsys03Service;

@Controller
@Scope("prototype")
@RequestMapping("/role")
public class RoleController {

	@Autowired
	private Dsys03Service dsys03Service;
	@Autowired
	private Dsys02_zfzzService dsys02_zfzzService;
	@Autowired
	private Dsys02_dsys03Service dsys02_dsys03Service;

	@RequestMapping("/lis.do")
	public String getAlllist(HttpServletRequest request) {
		// 查询全部角色
		List<Dsys03> lisrole = dsys03Service.SelectAllList();
		request.setAttribute("lisrole", lisrole);
		// 获取全部菜单列表
		List<Dsys02_zfzz> listAllmenu = dsys02_zfzzService.SelectAllQXMenu();
		request.setAttribute("listAllmenu", listAllmenu);
		return "jf_role";
	}

	@RequestMapping("/addqx.do")
	public String addQX(HttpServletRequest request) {
		String ids = request.getParameter("ids");
		String[] idls = ids.split(",");
		String father = request.getParameter("father");
		dsys02_dsys03Service.deldsys0203(Integer.parseInt(father));
		Dsys02_dsys03 dsys02_dsys03 = new Dsys02_dsys03();
		for (int i = 0; i < idls.length; i++) {
			dsys02_dsys03.setDSYS02_JFID(Integer.parseInt(idls[i]));
			dsys02_dsys03.setDSYS03_JFID(Integer.parseInt(father));
			dsys02_dsys03.setQX("1");
			dsys02_dsys03Service.indsys0203(dsys02_dsys03);
		}
		return "redirect:/role/lis.do";
	}

	@RequestMapping("/selqx.do")
	public void selqx(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		List<Integer> list = dsys02_dsys03Service.SelectByfather(Integer
				.parseInt(id));
		String ids = "";
		if (list.size() >= 1) {
			for (int i = 0; i < list.size(); i++) {
				ids += list.get(i) + ",";
			}
			try {
				response.getWriter().println(ids);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping("/addjs.do")
	public String addjs(Dsys03 dsys03) {
		try {
			dsys03.setROLE_NAME(new String(dsys03.getROLE_NAME().getBytes(
					"ISO8859-1"), "GBK"));
			dsys03.setROLE_BM(new String(dsys03.getROLE_BM().getBytes(
					"ISO8859-1"), "GBK"));
			dsys03.setBZ(new String(dsys03.getBZ().getBytes("ISO8859-1"), "GBK"));
			dsys03.setROLE_BMLB("ZJ_RYLB");
			dsys03Service.insertJS(dsys03);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/role/lis.do";
	}

	@RequestMapping("/gotoup.do")
	public String gotoup(HttpServletRequest request) {
		String JFID = request.getParameter("JFID");
		Dsys03 dsys03 = dsys03Service.SelectByJfid(Integer.parseInt(JFID));
		request.setAttribute("dsys03", dsys03);
		return "jf_role_up";
	}

	@RequestMapping("/upinfo.do")
	public String upinfo(Dsys03 dsys03,Model model) {
		try {
			dsys03.setROLE_NAME(new String(dsys03.getROLE_NAME().getBytes(
					"ISO8859-1"), "GBK"));
			dsys03.setROLE_BM(new String(dsys03.getROLE_BM().getBytes(
					"ISO8859-1"), "GBK"));
			dsys03.setBZ(new String(dsys03.getBZ().getBytes("ISO8859-1"), "GBK"));
			dsys03Service.upInfo(dsys03);
			model.addAttribute("JFID", dsys03.getJFID());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/role/gotoup.do";
	}
}
