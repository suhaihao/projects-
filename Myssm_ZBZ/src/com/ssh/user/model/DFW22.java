package com.ssh.user.model;

import java.util.Date;

public class DFW22 {
	/**
	 * ΨһID
	 */
	private String JFID;
	/**
	 * ����
	 */
	private String BT;
	/**
	 * ����
	 */
	private String NR;
	/**
	 * ¼����Ա
	 */
	private String LRRY;
	/**
	 * ¼������
	 */
	private Date LRRQ;
	/**
	 * ״̬ 0 ���� 1��ʼ 2����
	 */
	private String ZT;
	/**
	 * �Ƿ�ȫ��֪ͨ
	 */
	private String SF_ALL;
	/**
	 * ����
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
