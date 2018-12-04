package com.ssh.user.model;

public class DFW22_JSR {
	/**
	 * 唯一ID
	 */
	private String JFID;
	/**
	 * 主表ID
	 */
	private String DFW22_JFID;
	/**
	 * 专访组织ID
	 */
	private String DDJ01_JFID;
	/**
	 * 专防组织名称
	 */
	private String DDJ01_MC;
	/**
	 * 0未读1已读
	 */
	private String ZT;

	public String getJFID() {
		return JFID;
	}

	public void setJFID(String jFID) {
		JFID = jFID;
	}

	

	public String getDFW22_JFID() {
		return DFW22_JFID;
	}

	public void setDFW22_JFID(String dFW22_JFID) {
		DFW22_JFID = dFW22_JFID;
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

	public String getZT() {
		return ZT;
	}

	public void setZT(String zT) {
		ZT = zT;
	}

}
