package com.ssh.user.model;

import java.util.Date;

/**
 * ���δ�ʩʵ����
 * 
 * @author Administrator
 * 
 */
public class DDJ11 {
	/**
	 * Ψһid
	 */
	private String JFID;
	/**
	 * �û�dd01.jfid
	 */
	private String DDJ01_JFID;
	/**
	 * ����
	 */
	private String MC;
	/**
	 * ����
	 */
	private String FL;
	/**
	 * ��������
	 */
	private String FLMC;
	/**
	 * ��λ
	 */
	private String DW;
	/**
	 * ��λ����
	 */
	private String DWMC;
	/**
	 * ����
	 */
	private double DJ;
	/**
	 * ��װ���
	 */
	private String BZGG;
	/**
	 * ��ע
	 */
	private String BZ;
	/**
	 * ״̬0����1��ʼ2�ύ
	 */
	private String ZT;
	/**
	 * ¼����Ա
	 */
	private String LRRY;
	/**
	 * ¼����Ա����
	 */
	private String LRRYMC;
	/**
	 * ¼������
	 */
	private Date LRRQ;
	/**
	 * ����
	 */
	private String RN;
	/**
	 * ��������
	 */
	private String SCCJ;
	
	public String getSCCJ() {
		return SCCJ;
	}

	public void setSCCJ(String sCCJ) {
		SCCJ = sCCJ;
	}

	public String getRN() {
		return RN;
	}

	public void setRN(String rN) {
		RN = rN;
	}

	public String getFLMC() {
		return FLMC;
	}

	public void setFLMC(String fLMC) {
		FLMC = fLMC;
	}

	public String getDWMC() {
		return DWMC;
	}

	public void setDWMC(String dWMC) {
		DWMC = dWMC;
	}

	public double getDJ() {
		return DJ;
	}

	public void setDJ(double dJ) {
		DJ = dJ;
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

	public String getMC() {
		return MC;
	}

	public void setMC(String mC) {
		MC = mC;
	}

	public String getFL() {
		return FL;
	}

	public void setFL(String fL) {
		FL = fL;
	}

	public String getDW() {
		return DW;
	}

	public void setDW(String dW) {
		DW = dW;
	}

	public String getBZGG() {
		return BZGG;
	}

	public void setBZGG(String bZGG) {
		BZGG = bZGG;
	}

	public String getBZ() {
		return BZ;
	}

	public void setBZ(String bZ) {
		BZ = bZ;
	}

	public String getZT() {
		return ZT;
	}

	public void setZT(String zT) {
		ZT = zT;
	}

	public String getLRRY() {
		return LRRY;
	}

	public void setLRRY(String lRRY) {
		LRRY = lRRY;
	}

	public String getLRRYMC() {
		return LRRYMC;
	}

	public void setLRRYMC(String lRRYMC) {
		LRRYMC = lRRYMC;
	}

	public Date getLRRQ() {
		return LRRQ;
	}

	public void setLRRQ(Date lRRQ) {
		LRRQ = lRRQ;
	}

	@Override
	public String toString() {
		return "DDJ11 [JFID=" + JFID + ", DDJ01_JFID=" + DDJ01_JFID + ", MC="
				+ MC + ", FL=" + FL + ", DW=" + DW + ", DJ=" + DJ + ", BZGG="
				+ BZGG + ", BZ=" + BZ + ", ZT=" + ZT + ", LRRY=" + LRRY
				+ ", LRRYMC=" + LRRYMC + ", LRRQ=" + LRRQ + "]";
	}

}
