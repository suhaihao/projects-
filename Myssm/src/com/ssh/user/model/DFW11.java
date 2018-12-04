package com.ssh.user.model;

import java.util.Date;

public class DFW11 {
	/**
	 * 表单唯一id
	 */
	private String JFID;
	/**
	 * 标题
	 */
	private String BT;
	/**
	 * 内容简介
	 */
	private String NR;
	/**
	 * 分类
	 */
	private String FL;
	/**
	 * 分类名称
	 */
	private String FLMC;
	/**
	 * 录入日期
	 */
	private Date LRRY;
	/**
	 * 录入人员
	 */
	private  String LRRQ;
	/**
	 * 状态
	 */
	private String ZT;
	/**
	 * 序列
	 */
	private String RN;
	
	public String getRN() {
		return RN;
	}
	public void setRN(String rN) {
		RN = rN;
	}
	public String getJFID() {
		return JFID;
	}
	public void setJFID(String jFID) {
		JFID = jFID;
	}
	public String getBT() {
		return BT;
	}
	public void setBT(String bT) {
		BT = bT;
	}
	public String getNR() {
		return NR;
	}
	public void setNR(String nR) {
		NR = nR;
	}
	public String getFL() {
		return FL;
	}
	public void setFL(String fL) {
		FL = fL;
	}
	public Date getLRRY() {
		return LRRY;
	}
	public void setLRRY(Date lRRY) {
		LRRY = lRRY;
	}
	public String getLRRQ() {
		return LRRQ;
	}
	public void setLRRQ(String lRRQ) {
		LRRQ = lRRQ;
	}
	public String getZT() {
		return ZT;
	}
	public void setZT(String zT) {
		ZT = zT;
	}
	public String getFLMC() {
		return FLMC;
	}
	public void setFLMC(String fLMC) {
		FLMC = fLMC;
	}
	
}
