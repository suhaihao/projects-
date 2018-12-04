package com.ssh.user.model;

/**
 * 专访服务表
 * 
 * @author Administrator
 * 
 */
public class DDJ01_D {
	/**
	 * 从表唯一id
	 */
	private String JFID;
	/**
	 * DDJ01.jfid
	 */
	private String DDJ01_JFID;
	/**
	 * 服务内容Dsys11-fwnrlb
	 */
	private String FWNRLB;
	/**
	 * 信用积分
	 */
	private int XY_JF;
	/**
	 * 说明
	 */
	private String SM;
	/**
	 * 服务名称
	 */
	private String FWNRLBMC;
	public String getFWNRLBMC() {
		return FWNRLBMC;
	}

	public void setFWNRLBMC(String fWNRLBMC) {
		FWNRLBMC = fWNRLBMC;
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

	public String getFWNRLB() {
		return FWNRLB;
	}

	public void setFWNRLB(String fWNRLB) {
		FWNRLB = fWNRLB;
	}

	public int getXY_JF() {
		return XY_JF;
	}

	public void setXY_JF(int xY_JF) {
		XY_JF = xY_JF;
	}

	public String getSM() {
		return SM;
	}

	public void setSM(String sM) {
		SM = sM;
	}

}
