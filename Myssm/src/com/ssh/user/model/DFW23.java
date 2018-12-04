package com.ssh.user.model;

import java.util.Date;

public class DFW23 {
	/**
	 * 唯一ID
	 */
	private String JFID;
	/**
	 * 标题
	 */
	private String BT;
	/**
	 * 咨询内容
	 */
	private String NR;
	/**
	 * 咨询人员
	 */
	private String LRRY;
	/**
	 * 咨询日期
	 */
	private Date LRRQ;
	/**
	 * 0作废 1初始 2咨询 3已解答
	 */
	private String ZT;
	/**
	 * 专访组织ID
	 */
	private String DDJ01_JFID;
	/**
	 * 解答人员ID
	 */
	private String JDRY;
	/**
	 * 解答日期
	 */
	private Date JDRQ;
	/**
	 * 解答内容
	 */
	private String JD;
	/**
	 * 序列
	 */
	private String RN;
	/**
	 * 专访组织名称
	 */
	private String DDJ01_MC;
	/**
	 * 咨询人员名称
	 */
	private String LRRYMC;
	/**
	 * 解答人员名称
	 */
	private String JDRYMC;
	
	public String getRN() {
		return RN;
	}

	public void setRN(String rN) {
		RN = rN;
	}

	public String getDDJ01_MC() {
		return DDJ01_MC;
	}

	public void setDDJ01_MC(String dDJ01_MC) {
		DDJ01_MC = dDJ01_MC;
	}

	public String getLRRYMC() {
		return LRRYMC;
	}

	public void setLRRYMC(String lRRYMC) {
		LRRYMC = lRRYMC;
	}

	public String getJDRYMC() {
		return JDRYMC;
	}

	public void setJDRYMC(String jDRYMC) {
		JDRYMC = jDRYMC;
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

	public String getDDJ01_JFID() {
		return DDJ01_JFID;
	}

	public void setDDJ01_JFID(String dDJ01_JFID) {
		DDJ01_JFID = dDJ01_JFID;
	}

	public String getJDRY() {
		return JDRY;
	}

	public void setJDRY(String jDRY) {
		JDRY = jDRY;
	}


	public Date getLRRQ() {
		return LRRQ;
	}

	public void setLRRQ(Date lRRQ) {
		LRRQ = lRRQ;
	}

	public Date getJDRQ() {
		return JDRQ;
	}

	public void setJDRQ(Date jDRQ) {
		JDRQ = jDRQ;
	}

	public String getJD() {
		return JD;
	}

	public void setJD(String jD) {
		JD = jD;
	}

}
