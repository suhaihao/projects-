package com.ssh.user.model;
/**
 * ũ����ϵ��
 * @author Administrator
 *
 */
public class DDJ02_DDJ01 {
	/**
	 * DDJ01��JFID
	 */
	private String DDJ01_JFID;
	/**
	 * DDJ02��JFID
	 */
	private String DDJ02_JFID;
	/**
	 * ��������
	 */
	private String FWNR;
	public String getDDJ01_JFID() {
		return DDJ01_JFID;
	}
	public void setDDJ01_JFID(String dDJ01_JFID) {
		DDJ01_JFID = dDJ01_JFID;
	}
	public String getDDJ02_JFID() {
		return DDJ02_JFID;
	}
	public void setDDJ02_JFID(String dDJ02_JFID) {
		DDJ02_JFID = dDJ02_JFID;
	}
	public String getFWNR() {
		return FWNR;
	}
	public void setFWNR(String fWNR) {
		FWNR = fWNR;
	}
	@Override
	public String toString() {
		return "DDJ02_DDJ01 [DDJ01_JFID=" + DDJ01_JFID + ", DDJ02_JFID="
				+ DDJ02_JFID + ", FWNR=" + FWNR + "]";
	}

}
