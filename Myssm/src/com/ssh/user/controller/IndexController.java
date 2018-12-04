package com.ssh.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;
import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.user.model.DFW21;
import com.ssh.user.model.DFW22;
import com.ssh.user.model.Dsys02_zfzz;
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.Tree_bj;
import com.ssh.user.model.Tree_hb;
import com.ssh.user.model.Tree_tj;
import com.ssh.user.model.User;
import com.ssh.user.service.DFW21Service;
import com.ssh.user.service.DFW22Service;
import com.ssh.user.service.Dsys02_zfzzService;
import com.ssh.user.service.Dsys03Service;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.service.TreeService;
import com.ssh.user.service.UserService;
import com.ssh.user.util.EHCache;
/**
 * 登陆index的控制类
 * @author Administrator
 *
 */
@Controller
@Scope("prototype")
@RequestMapping("/go")
public class IndexController {
	@Autowired
	private Dsys02_zfzzService dsys02_zfzzService;
	@Autowired
	private Dsys03Service dsys03Service;
	@Autowired
	private Dsys11Service dsys11Service;
	@Autowired
	private TreeService treeService;
	@Autowired
	private UserService userService;
	@Autowired
	private DFW21Service dFW21Service;
	@Autowired
	private DFW22Service dFW22Service;
	
	private EHCache eHCache = new EHCache("ehcacheMenu");
	private EHCache ehcacheOndesk = new EHCache("ehcacheOndesk");
	/**
	 * 跳转主页面
	 * @return
	 */
	@RequestMapping(value = "/index.do")
	public String gotoindex(HttpServletRequest request, HttpServletResponse response)
	{
		User user=(User) request.getSession().getAttribute("user");
		int JFID=dsys03Service.SelectByBm(user.getRYFL());
		Map<String,String> map=new HashMap<String, String>();
		map.put("DSYS03_JFID",JFID+"");
		if(JFID!=3)
		{
			map.put("DDJ01_JFID",user.getDDJ01_JFID());
		}
		List<Dsys02_zfzz> menlist = dsys02_zfzzService.SelectByBmMenu(map);
		//设置树状结构数据
		try {
			List<Dsys11> listsyqx = dsys11Service.SelecetAllBM("SYQX");
			eHCache.addToCache("listsyqx", listsyqx, false);
		if(ehcacheOndesk.getCacheElement("xzqh")==null)
		{
			List<Tree_bj> lit_bj=treeService.seleByBJAllList();
			List<Tree_tj> lit_tj=treeService.seleByTJAllList();
			List<Tree_hb> lit_hb=treeService.seleByHBAllList();
			List<Object> list=new ArrayList<Object>();
			list.add(lit_bj.get(0));
			list.add(lit_tj.get(0));
			list.add(lit_hb.get(0));
			ehcacheOndesk.addToCache("xzqh",JSONArray.fromObject(list).toString(), true);
		}
			eHCache.addToCache("menu",menlist,false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		/**
		 * 查询是否有消息
		 */
		List<DFW21> listdfw21=dFW21Service.SelectAllCX(user.getDDJ01_JFID());
		if(listdfw21.size()>=1)
		{
			request.getSession().setAttribute("DFW21_JFID", listdfw21.get(0).getJFID());
		}
		/**
		 * 查询是否有技术推送
		 */
		List<DFW22> listdfw22=dFW22Service.SelectAllCX(user.getDDJ01_JFID());
		if(listdfw22.size()>=1)
		{
			request.getSession().setAttribute("DFW22_JFID", listdfw22.get(0).getJFID());
		}
		//判断是否有权限跳转主页
		map.put("JFID", user.getJFID());
		String JFNAME=userService.SelectByQx(map);
		if(JFNAME!=null&&!JFNAME.equals(""))
		{
			return "redirect:/ordergd/sel.do";
		}
		else
		{
			return "redirect:/gdcx/sel.do";
		}
	}
}
