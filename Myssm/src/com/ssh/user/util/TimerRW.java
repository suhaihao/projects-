package com.ssh.user.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.ssh.user.model.DDJ02;
import com.ssh.user.model.DFW01;
import com.ssh.user.model.DFW01_D;
import com.ssh.user.model.DFW02;
import com.ssh.user.model.DMSG;
import com.ssh.user.model.DMSG_NR;
import com.ssh.user.model.User;
import com.ssh.user.service.DDJ02Service;
import com.ssh.user.service.DFW01Service;
import com.ssh.user.service.DFW01_DService;
import com.ssh.user.service.DFW02Service;
import com.ssh.user.service.UserService;

public class TimerRW {
	protected static Logger ldapLog = Logger.getLogger("night——bug");
	@Autowired
	private DFW01Service dFW01Service;
	@Autowired
	private DFW01_DService dFW01_DService;
	@Autowired
	private DFW02Service dFW02Service;
	@Autowired
	private UserService userService;
	@Autowired
	private DDJ02Service dDJ02Service;

	private EHCache eHCacheMSG = new EHCache("ehcacheMSG");
	private EHCache ehcacheMSG_INFO = new EHCache("ehcacheMSG_INFO");

	/**
	 * 执行任务方法
	 */
	protected void Performtasks() {
		List<DFW01_D> listdfw01_d=dFW01_DService.SelectByZT2();
		if (listdfw01_d.size() >= 1) {
			String pso_return = "";
			String pso_reason = "";
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("psi_cllb", "0");
			map.put("psi_lrry", "0");
			map.put("psi_lrry_mc", "系统取消");
			for (int i = 0; i < listdfw01_d.size(); i++) {
				map.put("psi_jfid", listdfw01_d.get(i).getJFID());
				dFW01Service.p_gddk_begin(map);
				pso_return = (String) map.get("pso_return");
				pso_reason = (String) map.get("pso_reason");
				if (!pso_return.equals("0")) {
					ldapLog.equals("错误信息" + pso_reason);
				}
			}
		}
		List<DFW02> listdfw02 = dFW02Service.SelectByTXRQList();
		if (listdfw02.size() >= 1) {
			DFW02 dFW02 = null;
			User user = null;
			DDJ02 dDJ02 = null;
			for (int i = 0; i < listdfw02.size(); i++) {
				dFW02 = listdfw02.get(i);
				user = userService.SelectByZFZZ(dFW02.getDDJ01_JFID());
				dDJ02 = dDJ02Service.SelectByID(dFW02.getDDJ02_JFID()).get(0);
				// 循环发送的内容
				try {
					
					SimpleDateFormat sdf = new SimpleDateFormat(
							"yy-MM-dd HH:mm:ss");
				String SZ_LB = "3";
				String SZ_JFID = user.getJFID();
				String SZ_MC = user.getJFNAME();
				String SZ_TX_LJ = user.getZPLJ();
				String DF_LB = "6";
				String DF_JFID = dDJ02.getJFID();
				String DF_MC = dDJ02.getMC();
				String DF_TX_LJ = dDJ02.getZPLJ();
				String NR = "请对" + dFW02.getDDJ01_MC() + "的"
						+ dFW02.getFWNRLB() + "工单进行评价,评价截止时间为:"
						+ sdf.format(dFW02.getPJ_JZRQ());
					// 内存key
					String KEY = SZ_LB + "," + SZ_JFID;
					// mapkey
					String MAPKEY = SZ_LB + "," + SZ_JFID + "," + DF_LB + ","
							+ DF_JFID;
					// 对方的内存key
					String KEY_DF = DF_LB + "," + DF_JFID;
					// 对方mapkey
					String MAPKEY_DF = DF_LB + "," + DF_JFID + "," + SZ_LB
							+ "," + SZ_JFID;
					if (eHCacheMSG.getCacheElement(KEY) == null) {
						List<DMSG> list = new ArrayList<DMSG>();
						DMSG dMSG = new DMSG();
						dMSG.setSZ_LB(SZ_LB);
						dMSG.setSZ_JFID(SZ_JFID);
						dMSG.setSZ_MC(SZ_MC);
						dMSG.setSZ_TX_LJ(SZ_TX_LJ);
						dMSG.setFS_RQ(sdf.format(new Date()));
						dMSG.setNR_LB("0");
						dMSG.setNR(NR);
						dMSG.setDF_LB(DF_LB);
						dMSG.setDF_JFID(DF_JFID);
						dMSG.setDF_MC(DF_MC);
						dMSG.setDF_TX_LJ(DF_TX_LJ);
						dMSG.setJLS_WEB(0);
						dMSG.setJLS_SJ(1);
						dMSG.setList(MAPKEY);
						dMSG.setFX("0");
						list.add(dMSG);
						eHCacheMSG.addToCache(KEY, JSONArray.fromObject(list)
								.toString(), true);
						List<DMSG_NR> listnr = new ArrayList<DMSG_NR>();
						DMSG_NR dMSG_NR = new DMSG_NR();
						dMSG_NR.setFS_RQ(sdf.format(new Date()));
						dMSG_NR.setNR(NR);
						dMSG_NR.setFX("0");
						listnr.add(dMSG_NR);
						ehcacheMSG_INFO.addToCache(MAPKEY, JSONArray
								.fromObject(listnr).toString(), true);
						// 插入其他人的
						if (eHCacheMSG.getCacheElement(KEY_DF) == null) {
							List<DMSG> listQT = new ArrayList<DMSG>();
							DMSG dMSGQT = new DMSG();
							dMSGQT.setSZ_LB(DF_LB);
							dMSGQT.setSZ_JFID(DF_JFID);
							dMSGQT.setSZ_MC(DF_MC);
							dMSGQT.setSZ_TX_LJ(DF_TX_LJ);
							dMSGQT.setFS_RQ(sdf.format(new Date()));
							dMSGQT.setNR_LB("0");
							dMSGQT.setNR(NR);
							dMSGQT.setDF_LB(SZ_LB);
							dMSGQT.setDF_JFID(SZ_JFID);
							dMSGQT.setDF_MC(SZ_MC);
							dMSGQT.setDF_TX_LJ(SZ_TX_LJ);
							dMSGQT.setJLS_WEB(1);
							dMSGQT.setJLS_SJ(1);
							dMSGQT.setFX("1");
							dMSGQT.setList(MAPKEY_DF);
							listQT.add(dMSGQT);
							eHCacheMSG.addToCache(KEY_DF,
									JSONArray.fromObject(listQT).toString(),
									true);
							List<DMSG_NR> listnrQT = new ArrayList<DMSG_NR>();
							DMSG_NR dMSG_NRQT = new DMSG_NR();
							dMSG_NRQT.setFS_RQ(sdf.format(new Date()));
							dMSG_NRQT.setNR(NR);
							dMSG_NRQT.setFX("1");
							listnrQT.add(dMSG_NRQT);
							ehcacheMSG_INFO.addToCache(MAPKEY_DF, JSONArray
									.fromObject(listnrQT).toString(), true);
						} else {
							boolean isAddQT = true;
							String str_DF = (String) eHCacheMSG
									.getCacheElement(KEY_DF);
							JSONArray array_DF = JSONArray.fromObject(str_DF);
							List<DMSG> listQT = JSONArray.toList(array_DF,
									DMSG.class);
							if (listQT.get(0) == null) {
								listQT = new ArrayList<DMSG>();
							}
							// 修改其他人
							if (eHCacheMSG.getCacheElement(KEY_DF) != null) {
								for (int i1 = 0; i1 < listQT.size(); i1++) {
									if (listQT.get(i1).getDF_JFID()
											.equals(DF_JFID)
											&& listQT.get(i1).getDF_LB()
													.equals(DF_LB)
											|| listQT.get(i1).getDF_JFID()
													.equals(SZ_JFID)
											&& listQT.get(i1).getDF_LB()
													.equals(SZ_LB)) {
										DMSG dMSGQT = listQT.get(i1);
										listQT.remove(i1);
										dMSGQT.setFS_RQ(sdf.format(new Date()));
										dMSGQT.setNR_LB("0");
										dMSGQT.setNR(NR);
										dMSGQT.setJLS_WEB(dMSGQT.getJLS_WEB() + 1);
										dMSGQT.setJLS_SJ(dMSGQT.getJLS_SJ() + 1);
										listQT.add(0, dMSGQT);
										eHCacheMSG.addToCache(KEY_DF, JSONArray
												.fromObject(listQT).toString(),
												true);
										String str_info = (String) ehcacheMSG_INFO
												.getCacheElement(MAPKEY_DF);
										JSONArray arrayinfo = JSONArray
												.fromObject(str_info);
										List<DMSG_NR> listnrQT = JSONArray
												.toList(arrayinfo,
														DMSG_NR.class);
										DMSG_NR dMSG_NRQT = new DMSG_NR();
										dMSG_NRQT.setFS_RQ(sdf
												.format(new Date()));
										dMSG_NRQT.setNR(NR);
										dMSG_NRQT.setFX("1");
										listnrQT.add(dMSG_NRQT);
										ehcacheMSG_INFO.addToCache(MAPKEY_DF,
												JSONArray.fromObject(listnrQT)
														.toString(), true);
										isAddQT = false;
										break;
									}
								}
							}
							// 判断是否要添加其他人
							if (isAddQT) {
								DMSG dMSGQT = new DMSG();
								dMSGQT.setSZ_LB(DF_LB);
								dMSGQT.setSZ_JFID(DF_JFID);
								dMSGQT.setSZ_MC(DF_MC);
								dMSGQT.setSZ_TX_LJ(DF_TX_LJ);
								dMSGQT.setFS_RQ(sdf.format(new Date()));
								dMSGQT.setNR_LB("0");
								dMSGQT.setNR(NR);
								dMSGQT.setDF_LB(SZ_LB);
								dMSGQT.setDF_JFID(SZ_JFID);
								dMSGQT.setDF_MC(SZ_MC);
								dMSGQT.setDF_TX_LJ(SZ_TX_LJ);
								dMSGQT.setJLS_WEB(1);
								dMSGQT.setJLS_SJ(1);
								dMSGQT.setFX("1");
								dMSGQT.setList(MAPKEY_DF);
								listQT.add(0, dMSGQT);
								eHCacheMSG.addToCache(KEY_DF, JSONArray
										.fromObject(listQT).toString(), true);
								List<DMSG_NR> listnrQT = new ArrayList<DMSG_NR>();
								DMSG_NR dMSG_NRQT = new DMSG_NR();
								dMSG_NRQT.setFS_RQ(sdf.format(new Date()));
								dMSG_NRQT.setNR(NR);
								dMSG_NRQT.setFX("1");
								listnrQT.add(dMSG_NRQT);
								ehcacheMSG_INFO.addToCache(MAPKEY_DF, JSONArray
										.fromObject(listnrQT).toString(), true);
							}
						}
					} else {
						String str = (String) eHCacheMSG.getCacheElement(KEY);
						JSONArray array = JSONArray.fromObject(str);
						List<DMSG> list = JSONArray.toList(array, DMSG.class);
						boolean isAdd = true;
						for (int i1 = 0; i1 < list.size(); i1++) {
							if (list.get(i1).getDF_JFID().equals(DF_JFID)
									&& list.get(i1).getDF_LB().equals(DF_LB)
									|| list.get(i1).getDF_JFID()
											.equals(SZ_JFID)
									&& list.get(i1).getDF_LB().equals(SZ_LB)) {
								DMSG dMSG = list.get(i1);
								list.remove(i1);
								dMSG.setFS_RQ(sdf.format(new Date()));
								dMSG.setNR_LB("0");
								dMSG.setNR(NR);
								dMSG.setJLS_WEB(0);
								dMSG.setJLS_SJ(dMSG.getJLS_SJ() + 1);
								list.add(0, dMSG);
								eHCacheMSG.addToCache(KEY, JSONArray
										.fromObject(list).toString(), true);
								String str_info = (String) ehcacheMSG_INFO
										.getCacheElement(MAPKEY);
								JSONArray arrayinfo = JSONArray
										.fromObject(str_info);
								List<DMSG_NR> listnr = JSONArray.toList(
										arrayinfo, DMSG_NR.class);
								DMSG_NR dMSG_NR = new DMSG_NR();
								dMSG_NR.setFS_RQ(sdf.format(new Date()));
								dMSG_NR.setNR(NR);
								dMSG_NR.setFX("0");
								listnr.add(dMSG_NR);
								ehcacheMSG_INFO.addToCache(MAPKEY, JSONArray
										.fromObject(listnr).toString(), true);
								isAdd = false;
								break;
							}
						}
						// 判断是否要添加新对话
						if (isAdd) {
							DMSG dMSG = new DMSG();
							dMSG.setSZ_LB(SZ_LB);
							dMSG.setSZ_JFID(SZ_JFID);
							dMSG.setSZ_MC(SZ_MC);
							dMSG.setSZ_TX_LJ(SZ_TX_LJ);
							dMSG.setFS_RQ(sdf.format(new Date()));
							dMSG.setNR_LB("0");
							dMSG.setNR(NR);
							dMSG.setDF_LB(DF_LB);
							dMSG.setDF_JFID(DF_JFID);
							dMSG.setDF_MC(DF_MC);
							dMSG.setDF_TX_LJ(DF_TX_LJ);
							dMSG.setJLS_WEB(0);
							dMSG.setJLS_SJ(1);
							dMSG.setList(MAPKEY);
							dMSG.setFX("0");
							list.add(0, dMSG);
							eHCacheMSG
									.addToCache(KEY, JSONArray.fromObject(list)
											.toString(), true);
							List<DMSG_NR> listnr = new ArrayList<DMSG_NR>();
							DMSG_NR dMSG_NR = new DMSG_NR();
							dMSG_NR.setFS_RQ(sdf.format(new Date()));
							dMSG_NR.setNR(NR);
							dMSG_NR.setFX("0");
							listnr.add(dMSG_NR);
							ehcacheMSG_INFO.addToCache(MAPKEY, JSONArray
									.fromObject(listnr).toString(), true);
						}
						boolean isAddQT = true;
						String str_DF = (String) eHCacheMSG
								.getCacheElement(KEY_DF);
						JSONArray array_DF = JSONArray.fromObject(str_DF);
						List<DMSG> listQT = JSONArray.toList(array_DF,
								DMSG.class);
						if (listQT.get(0) == null) {
							listQT = new ArrayList<DMSG>();
						}
						// 修改其他人
						if (eHCacheMSG.getCacheElement(KEY_DF) != null) {
							for (int i1 = 0; i1 < listQT.size(); i1++) {
								if (listQT.get(i1).getDF_JFID().equals(DF_JFID)
										&& listQT.get(i1).getDF_LB()
												.equals(DF_LB)
										|| listQT.get(i1).getDF_JFID()
												.equals(SZ_JFID)
										&& listQT.get(i1).getDF_LB()
												.equals(SZ_LB)) {
									DMSG dMSGQT = listQT.get(i1);
									listQT.remove(i1);
									dMSGQT.setFS_RQ(sdf.format(new Date()));
									dMSGQT.setNR_LB("0");
									dMSGQT.setNR(NR);
									dMSGQT.setJLS_WEB(dMSGQT.getJLS_WEB() + 1);
									dMSGQT.setJLS_SJ(dMSGQT.getJLS_SJ() + 1);
									listQT.add(0, dMSGQT);
									eHCacheMSG.addToCache(KEY_DF, JSONArray
											.fromObject(listQT).toString(),
											true);
									String str_info = (String) ehcacheMSG_INFO
											.getCacheElement(MAPKEY_DF);
									JSONArray arrayinfo = JSONArray
											.fromObject(str_info);
									List<DMSG_NR> listnrQT = JSONArray.toList(
											arrayinfo, DMSG_NR.class);
									DMSG_NR dMSG_NRQT = new DMSG_NR();
									dMSG_NRQT.setFS_RQ(sdf.format(new Date()));
									dMSG_NRQT.setNR(NR);
									dMSG_NRQT.setFX("1");
									listnrQT.add(dMSG_NRQT);
									ehcacheMSG_INFO.addToCache(MAPKEY_DF,
											JSONArray.fromObject(listnrQT)
													.toString(), true);
									isAddQT = false;
									break;
								}
							}
						}
						// 判断是否要添加其他人
						if (isAddQT) {
							DMSG dMSGQT = new DMSG();
							dMSGQT.setSZ_LB(DF_LB);
							dMSGQT.setSZ_JFID(DF_JFID);
							dMSGQT.setSZ_MC(DF_MC);
							dMSGQT.setSZ_TX_LJ(DF_TX_LJ);
							dMSGQT.setFS_RQ(sdf.format(new Date()));
							dMSGQT.setNR_LB("0");
							dMSGQT.setNR(NR);
							dMSGQT.setDF_LB(SZ_LB);
							dMSGQT.setDF_JFID(SZ_JFID);
							dMSGQT.setDF_MC(SZ_MC);
							dMSGQT.setDF_TX_LJ(SZ_TX_LJ);
							dMSGQT.setJLS_WEB(1);
							dMSGQT.setJLS_SJ(1);
							dMSGQT.setFX("1");
							dMSGQT.setList(MAPKEY_DF);
							listQT.add(0, dMSGQT);
							eHCacheMSG.addToCache(KEY_DF,
									JSONArray.fromObject(listQT).toString(),
									true);
							List<DMSG_NR> listnrQT = new ArrayList<DMSG_NR>();
							DMSG_NR dMSG_NRQT = new DMSG_NR();
							dMSG_NRQT.setFS_RQ(sdf.format(new Date()));
							dMSG_NRQT.setNR(NR);
							dMSG_NRQT.setFX("1");
							listnrQT.add(dMSG_NRQT);
							ehcacheMSG_INFO.addToCache(MAPKEY_DF, JSONArray
									.fromObject(listnrQT).toString(), true);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
