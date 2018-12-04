package com.ssh.user.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.user.model.DSYS05;
import com.ssh.user.service.DSYS05Service;
import com.ssh.user.util.EHCache;

@Controller
@Scope("prototype")
@RequestMapping("/tree")
public class TreeController {
	@Autowired
	private DSYS05Service dSYS05Service;
	private EHCache eHCache = new EHCache("ehcacheMenu_zbz");

	/**
	 * 添加部门
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/add.do")
	public void add(HttpServletRequest request, HttpServletResponse response) {
		DSYS05 dSYS05 = new DSYS05();
		dSYS05.setText(request.getParameter("Text"));
		dSYS05.setBMJC(request.getParameter("BMJC"));
		dSYS05.setSF_MJ(request.getParameter("SF_MJ"));
		dSYS05.setDH_FIRST(request.getParameter("DH_FIRST"));
		dSYS05.setFZR(request.getParameter("FZR"));
		dSYS05.setDH(request.getParameter("DH"));
		dSYS05.setBMZZ(request.getParameter("BMZZ"));
		dSYS05.setBZ(request.getParameter("BZ"));
		dSYS05.setPARENT_ID(Integer.parseInt(request.getParameter("PARENT_ID")));
		dSYS05.setYB(request.getParameter("YB"));
		dSYS05.setDZ(request.getParameter("DZ"));
		dSYS05.setQC(request.getParameter("QC"));
		dSYS05.setZT("1");
		DSYS05 dSYS05father = dSYS05Service.SelectByJFID(dSYS05.getPARENT_ID());
		List<DSYS05> listdsys05 = dSYS05Service.SelectByFather(
				dSYS05father.getBM(), Integer.parseInt(dSYS05father.getBMJC())
						+ 1 + "");
		if (listdsys05.size() >= 1) {
			String sonBM = listdsys05.get(listdsys05.size() - 1).getBM();
			String[] bm = sonBM.split(dSYS05father.getBM());
			int inbm = Integer.parseInt(bm[1]) + 1;
			String Nbm = dSYS05father.getBM() + inbm;
			dSYS05.setBM(Nbm);
		} else {
			dSYS05.setBM(dSYS05father.getBM() + "1");
		}
		dSYS05Service.instInfo(dSYS05);
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
								str = str.substring(0, str.length() - 1);
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
		try {
			eHCache.addToCache("bm", str, false);
			response.getWriter().println("ok");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 修改部门部门
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/up.do")
	public void up(HttpServletRequest request, HttpServletResponse response) {
		DSYS05 dSYS05 = new DSYS05();
		dSYS05.setJFID(Integer.parseInt(request.getParameter("JFID")));
		dSYS05.setText(request.getParameter("Text"));
		dSYS05.setBMJC(request.getParameter("BMJC"));
		dSYS05.setSF_MJ(request.getParameter("SF_MJ"));
		dSYS05.setDH_FIRST(request.getParameter("DH_FIRST"));
		dSYS05.setFZR(request.getParameter("FZR"));
		dSYS05.setDH(request.getParameter("DH"));
		dSYS05.setBMZZ(request.getParameter("BMZZ"));
		dSYS05.setBZ(request.getParameter("BZ"));
		dSYS05.setYB(request.getParameter("YB"));
		dSYS05.setDZ(request.getParameter("DZ"));
		dSYS05.setQC(request.getParameter("QC"));
		dSYS05Service.upInfo(dSYS05);
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
								str = str.substring(0, str.length() - 1);
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
		try {
			eHCache.addToCache("bm", str, false);
			response.getWriter().println("ok");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 删除部门
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/del.do")
	public String del(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}

	/**
	 * 修改部门
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/sel.do")
	public void sel(HttpServletRequest request, HttpServletResponse response) {
		String bmbm = request.getParameter("bmbm");
		DSYS05 dSYS05 = dSYS05Service.SelectByBM(bmbm);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().println(JSONObject.fromObject(dSYS05));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
