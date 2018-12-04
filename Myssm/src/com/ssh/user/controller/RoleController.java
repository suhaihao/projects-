package com.ssh.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.user.model.Dsys02_dsys03;
import com.ssh.user.model.Dsys02_zfzz;
import com.ssh.user.model.Dsys03;
import com.ssh.user.model.User;
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
		User user = (User) request.getSession().getAttribute("user");
		// 查询全部角色
		List<Dsys03> lisrole = dsys03Service.SelectAllList();
		request.setAttribute("lisrole", lisrole);
		// 获取全部菜单列表
		List<Dsys02_zfzz> listAllmenu = dsys02_zfzzService.SelectAllQXMenu();
		request.setAttribute("listAllmenu", listAllmenu);
		// 获取对应的集合
		List<Integer> list1 = dsys02_dsys03Service.SelectByfather(1,Integer.parseInt(user.getDDJ01_JFID()));
		request.setAttribute("list1", list1);
		List<Integer> list2 = dsys02_dsys03Service.SelectByfather(2,Integer.parseInt(user.getDDJ01_JFID()));
		request.setAttribute("list2", list2);
		List<Integer> list3 = dsys02_dsys03Service.SelectByfather(3,Integer.parseInt(user.getDDJ01_JFID()));
		request.setAttribute("list3", list3);
		return "jf_role";
	}

	@RequestMapping("/addqx.do")
	public String addQX(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		String ids = request.getParameter("ids");
		String father = request.getParameter("father");
		dsys02_dsys03Service.deldsys0203(Integer.parseInt(father),
				Integer.parseInt(user.getDDJ01_JFID()));
		Dsys02_dsys03 dsys02_dsys03 = new Dsys02_dsys03();
		if (ids != null && !ids.equals("")) {
			String[] idls = ids.split(",");
			for (int i = 0; i < idls.length; i++) {
				dsys02_dsys03.setDSYS02_JFID(Integer.parseInt(idls[i]));
				dsys02_dsys03.setDSYS03_JFID(Integer.parseInt(father));
				dsys02_dsys03.setQX("1");
				dsys02_dsys03.setDDJ01_JFID(user.getDDJ01_JFID());
				dsys02_dsys03Service.indsys0203(dsys02_dsys03);
			}
		}
		return "redirect:/role/lis.do";
	}
}
