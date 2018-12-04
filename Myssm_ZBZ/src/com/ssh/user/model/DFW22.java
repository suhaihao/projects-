package com.ssh.user.model;

import java.util.Date;

public class DFW22 {
	/**
	 * 唯一ID
	 */
	private String JFID;
	/**
	 * 标题
	 */
	private String BT;
	/**
	 * 内容
	 */
	private String NR;
	/**
	 * 录入人员
	 */
	private String LRRY;
	/**
	 * 录入日期
	 */
	private Date LRRQ;
	/**
	 * 状态 0 作废 1初始 2发布
	 */
	private String ZT;
	/**
	 * 是否全部通知
	 */
	private String SF_ALL;
	/**
	 * 序列
	 */
	private String RN;
	
	public Date getLRRQ() {
		return LRRQ;
	}
	public void setLRRQ(Date lRRQ) {
		LRRQ = lRRQ;
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
	public String getLRRY() {
		return LRRY;
	}
	public void setLRRY(String lRRY) {
		LRRY = lRRY;
	}
	public String getZT() {
		return ZT;
	}
	public void setZT(String zT) {
		ZT = zT;
	}
	public String getSF_ALL() {
		return SF_ALL;
	}
	public void setSF_ALL(String sF_ALL) {
		SF_ALL = sF_ALL;
	}
	public String getRN() {
		return RN;
	}
	public void setRN(String rN) {
		RN = rN;
	}
	
}
