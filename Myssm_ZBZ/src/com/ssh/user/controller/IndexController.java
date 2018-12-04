package com.ssh.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.user.model.DSYS05;
import com.ssh.user.model.Dsys02_zfzz;
import com.ssh.user.model.Dsys11;
import com.ssh.user.model.Tree_bj;
import com.ssh.user.model.Tree_hb;
import com.ssh.user.model.Tree_tj;
import com.ssh.user.model.User;
import com.ssh.user.service.DSYS05Service;
import com.ssh.user.service.Dsys02_zfzzService;
import com.ssh.user.service.Dsys03Service;
import com.ssh.user.service.Dsys11Service;
import com.ssh.user.service.TreeService;
import com.ssh.user.service.UserService;
import com.ssh.user.util.EHCache;

/**
 * 登陆index的控制类
 * 
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
	private TreeService treeService;
	@Autowired
	private UserService userService;
	@Autowired
	private Dsys11Service dsys11Service;
	@Autowired
	private DSYS05Service dSYS05Service;

	private EHCache eHCache = new EHCache("ehcacheMenu_zbz");
	private EHCache ehcacheOndesk = new EHCache("ehcacheOndesk_zbz");

	/**
	 * 跳转主页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/index.do")
	public String gotoindex(HttpServletRequest request,
			HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		List<Dsys02_zfzz> menlist = dsys02_zfzzService.SelectByBmMenu(user
				.getJFID());
		// 设置树状结构数据
		try {
			if (ehcacheOndesk.getCacheElement("xzqh") == null) {
				List<Tree_bj> lit_bj = treeService.seleByBJAllList();
				List<Tree_tj> lit_tj = treeService.seleByTJAllList();
				List<Tree_hb> lit_hb = treeService.seleByHBAllList();
				List<Object> list = new ArrayList<Object>();
				list.add(lit_bj.get(0));
				list.add(lit_tj.get(0));
				list.add(lit_hb.get(0));
				ehcacheOndesk.addToCache("xzqh", JSONArray.fromObject(list)
						.toString(), true);
			}
			eHCache.addToCache("menu", menlist, false);
			if (eHCache.getCacheElement("bm") == null) {
				String str = "[";
				String endstr = "";
				int a = 0;
				int jc = 2;
				boolean sw = false;
				List<DSYS05> list = dSYS05Service.SelectAllBM();
				for (int i = 0; i < list.size(); i++) {
					if (list.get(i).getSF_MJ().equals("0")) {
						sw = true;
						if (i != 0) {
							if (a == 1) {
								if (list.get(i).getBMJC().equals("2")) {
									if (str.substring(str.length() - 1,
											str.length()).equals(",")) {
										str = str
												.substring(0, str.length() - 1);
									}
									if (jc - 1 <= Integer.parseInt(list.get(
											i - 1).getBMJC())) {
										for (int j = 0; j < jc - 2; j++) {
											str += "]}";
										}
									} else {
										for (int j = 0; j < jc
												- 2
												- (jc - 1 - Integer
														.parseInt(list.get(
																i - 1)
																.getBMJC())); j++) {
											str += "]}";
										}
									}
									str += ",";
									a = 0;
									endstr = "";
									jc = 2;
									sw = false;
								} else {
									if (Integer.parseInt(list.get(i).getBMJC()) < Integer
											.parseInt(list.get(i - 1).getBMJC())) {
										if (str.substring(str.length() - 1,
												str.length()).equals(",")) {
											str = str.substring(0,
													str.length() - 1);
										}
										if (Integer.parseInt(list.get(i)
												.getBMJC()) + 1 == Integer
												.parseInt(list.get(i - 1)
														.getBMJC())
												&& list.get(i).getBM().length() == list
														.get(i - 1).getBM()
														.length()) {
											for (int j = 0; j < Integer
													.parseInt(list.get(i - 1)
															.getBMJC())
													- Integer.parseInt(list
															.get(i).getBMJC()); j++) {
												str += "]}";
											}
											str += ",";
										} else {
											if (list.get(i - 1).getSF_MJ()
													.equals("1")) {
												for (int j = 0; j < Integer
														.parseInt(list.get(
																i - 1)
																.getBMJC())
														- Integer.parseInt(list
																.get(i)
																.getBMJC()); j++) {
													str += "]}";
												}
											} else {
												for (int j = 0; j < Integer
														.parseInt(list.get(
																i - 1)
																.getBMJC())
														- Integer.parseInt(list
																.get(i)
																.getBMJC()) + 1; j++) {
													str += "]}";
												}
											}
											str += ",";
										}
									}
								}
							}
							if (list.get(i).getBM().length() == list.get(i - 1)
									.getBM().length()) {
								if (Integer.parseInt(list.get(i).getBMJC()) != Integer
										.parseInt(list.get(i - 1).getBMJC())) {
									if (str.substring(str.length() - 1,
											str.length()).equals(",")) {
										str = str
												.substring(0, str.length() - 1);
									}
								}
								if (!str.substring(str.length() - 1,
										str.length()).equals(",")) {
									str += "]},";
								}
							} else {
								if (a == 0) {
									if (Integer.parseInt(list.get(i).getBMJC()) < Integer
											.parseInt(list.get(i - 1).getBMJC())
											&& sw) {
										if (list.get(i - 1).getSF_MJ()
												.equals("1")) {
											if (str.substring(str.length() - 1,
													str.length()).equals(",")) {
												str = str.substring(0,
														str.length() - 1);
											}
											for (int j = 0; j < Integer
													.parseInt(list.get(i - 1)
															.getBMJC())
													- Integer.parseInt(list
															.get(i).getBMJC()); j++) {
												str += "]}";
											}
										} else {
											for (int j = 0; j < Integer
													.parseInt(list.get(i - 1)
															.getBMJC())
													- Integer.parseInt(list
															.get(i).getBMJC())
													+ 1; j++) {
												str += "]}";
											}
										}
										str += ",";
										a = 0;
										endstr = "";
										jc = 2;
										sw = false;
									}
									endstr = endstr + "]}";
								}
							}
						}
						str += "{\"BM\":\"" + list.get(i).getBM()
								+ "\",\"text\":\"" + list.get(i).getText()
								+ "\",\"nodes\":[";
					} else {
						a = 1;
						if (Integer.parseInt(list.get(i).getBMJC()) > jc) {
							jc = Integer.parseInt(list.get(i).getBMJC());
						}
						if (Integer.parseInt(list.get(i - 1).getBMJC()) == Integer
								.parseInt(list.get(i).getBMJC())
								&& !str.substring(str.length() - 1,
										str.length()).equals(",")) {
							str += "]},";
						}
						str += "{\"BM\":\"" + list.get(i).getBM()
								+ "\",\"text\":\"" + list.get(i).getText()
								+ "\"},";
					}
				}
				if (str.substring(str.length() - 1, str.length()).equals(",")) {
					str = str.substring(0, str.length() - 1);
					for (int j = 0; j < Integer.parseInt(list.get(
							list.size() - 1).getBMJC()) - 2; j++) {
						str += "]}";
					}
				} else {
					if (!list.get(list.size() - 1).getBMJC().equals("2")) {
						for (int j = 0; j < Integer.parseInt(list.get(
								list.size() - 1).getBMJC()) - 2 + 1; j++) {
							str += "]}";
						}
					} else {
						str += "]}";
					}
				}
				str += "]}]";
				eHCache.addToCache("bm", str, false);
			}
			List<Dsys11> listsyqx = dsys11Service.SelecetAllBM("SYQX");
			eHCache.addToCache("listsyqx", listsyqx, false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/gdcx/sel.do";
	}
}
