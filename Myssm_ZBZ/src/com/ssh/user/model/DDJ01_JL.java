package com.ssh.user.model;

import java.util.Date;

public class DDJ01_JL {
	/**
	 * 唯一ID
	 */
	private String JFID;
	/**
	 * 专访组织ID
	 */
	private String DDJ01_JFID;
	/**
	 * 专防组织名称
	 */
	private String DDJ01_MC;
	/**
	 * 奖励名称
	 */
	private String JL;
	/**
	 * 奖励说明
	 */
	private String JL_SM;
	/**
	 * 录入人员
	 */
	private String LRRY;
	/**
	 * 录入日期
	 */
	private Date LRRQ;
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

	public String getZT() {
		return ZT;
	}

	public void setZT(String zT) {
		ZT = zT;
	}

	public String getJFID() {
		return JFID;
	}

	public void setJFID(String jFID) {
		JFID = jFID;
	}

	public String getDDJ01_JFID() {
		return DDJ01_JFID;
	}

	public void setDDJ01_JFID(String dDJ01_JFID) {
		DDJ01_JFID = dDJ01_JFID;
	}

	public String getDDJ01_MC() {
		return DDJ01_MC;
	}

	public void setDDJ01_MC(String dDJ01_MC) {
		DDJ01_MC = dDJ01_MC;
	}

	public String getJL() {
		return JL;
	}

	public void setJL(String jL) {
		JL = jL;
	}

	public String getJL_SM() {
		return JL_SM;
	}

	public void setJL_SM(String jL_SM) {
		JL_SM = jL_SM;
	}

	public String getLRRY() {
		return LRRY;
	}

	public void setLRRY(String lRRY) {
		LRRY = lRRY;
	}

	public Date getLRRQ() {
		return LRRQ;
	}

	public void setLRRQ(Date lRRQ) {
		LRRQ = lRRQ;
	}

}
