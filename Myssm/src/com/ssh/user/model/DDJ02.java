package com.ssh.user.model;

import java.util.Date;

/**
 * �û�����ʵ����
 * 
 * @author Administrator
 * 
 */
public class DDJ02 {
	/**
	 * Ψһid
	 */
	private String JFID;
	/**
	 * �û���
	 */
	private String YHM;
	/**
	 * ����
	 */
	private String MC;
	/**
	 * �ֻ�
	 */
	private String YDDH;
	/**
	 * ����
	 */
	private String YX;
	/**
	 * ��ע
	 */
	private String BZ;
	/**
	 * ¼����Ա����
	 */
	private int LRRY;
	/**
	 * ¼������
	 */
	private String LRRY_MC;
	/**
	 * ¼������
	 */
	private Date LRRQ;
	/**
	 * ״̬
	 */
	private String ZT;
	/**
	 * ��Ƭ·��
	 */
	private String ZPLJ;
	/**
	 * ��Ƭ����
	 */
	private String ZPWJM;
	/**
	 * ����
	 */
	private int JF;
	/**
	 * ��������
	 */
	private String XZQH;
	/**
	 * ������������
	 */
	private String XZQHMC;
	/**
	 * ��ַ
	 */
	private String DZ;
	/**
	 * �Ա�
	 */
	private String XB;
	/**
	 * ����
	 */
	private Date SR;
	/**
	 * ѧ��
	 */
	private String XL;
	/**
	 * ��ͥ�˿�
	 */
	private int JTRK;
	/**
	 * �˾�������
	 */
	private double RJSR;
	/**
	 * ����
	 */
	
	private String JFPASSWORD;
	/**
	 * ��Ա���
	 * @return
	 */
	private String YHLB;
	/**
	 * �������
	 * @return
	 */
	private Double SCMJ;
	/**
	 * ddj02����ddj01�ֶη��㷵��
	 * @return
	 * 
	 */
	private String FWNR;
	/***
	 * �û���½����
	 * @return
	 */
	private Date DLRQ;
	/**
	 * ��½����
	 * @return
	 */
	private String TOKEN;
	/**
	 * ����
	 * @return
	 */
	private String RN;
	/**
	 * �ؿ���
	 * @return
	 */
	private Integer DKS;
	
	public Integer getDKS() {
		return DKS;
	}
	public void setDKS(Integer dKS) {
		DKS = dKS;
	}
	public String getRN() {
		return RN;
	}
	public void setRN(String rN) {
		RN = rN;
	}
	public Date getDLRQ() {
		return DLRQ;
	}
	public void setDLRQ(Date dLRQ) {
		DLRQ = dLRQ;
	}
	public String getTOKEN() {
		return TOKEN;
	}
	public void setTOKEN(String tOKEN) {
		TOKEN = tOKEN;
	}
	public String getFWNR() {
		return FWNR;
	}
	public void setFWNR(String fWNR) {
		FWNR = fWNR;
	}
	public Double getSCMJ() {
		return SCMJ;
	}
	public void setSCMJ(Double sCMJ) {
		SCMJ = sCMJ;
	}
	public String getXZQHMC() {
		return XZQHMC;
	}
	public void setXZQHMC(String xZQHMC) {
		XZQHMC = xZQHMC;
	}
	@Override
	public String toString() {
		return "DDJ02 [JFID=" + JFID + ", YHM=" + YHM + ", MC=" + MC
				+ ", YDDH=" + YDDH + ", YX=" + YX + ", BZ=" + BZ + ", LRRY="
				+ LRRY + ", LRRY_MC=" + LRRY_MC + ", LRRQ=" + LRRQ + ", ZT="
				+ ZT + ", ZPLJ=" + ZPLJ + ", ZPWJM=" + ZPWJM + ", JF=" + JF
				+ ", XZQH=" + XZQH + ", DZ=" + DZ + ", XB=" + XB + ", SR=" + SR
				+ ", XL=" + XL + ", JTRK=" + JTRK + ", RJSR=" + RJSR
				+ ", JFPASSWORD=" + JFPASSWORD + ", YHLB=" + YHLB + "]";
	}
	public String getYHLB() {
		return YHLB;
	}
	public void setYHLB(String yHLB) {
		YHLB = yHLB;
	}
	public double getRJSR() {
		return RJSR;
	}
	public void setRJSR(double rJSR) {
		RJSR = rJSR;
	}
	public String getJFID() {
		return JFID;
	}
	public void setJFID(String jFID) {
		JFID = jFID;
	}
	public String getYHM() {
		return YHM;
	}
	public void setYHM(String yHM) {
		YHM = yHM;
	}
	public String getMC() {
		return MC;
	}
	public void setMC(String mC) {
		MC = mC;
	}
	public String getYDDH() {
		return YDDH;
	}
	public void setYDDH(String yDDH) {
		YDDH = yDDH;
	}
	public String getYX() {
		return YX;
	}
	public void setYX(String yX) {
		YX = yX;
	}
	public String getBZ() {
		return BZ;
	}
	public void setBZ(String bZ) {
		BZ = bZ;
	}
	public int getLRRY() {
		return LRRY;
	}
	public void setLRRY(int lRRY) {
		LRRY = lRRY;
	}
	public String getLRRY_MC() {
		return LRRY_MC;
	}
	public void setLRRY_MC(String lRRY_MC) {
		LRRY_MC = lRRY_MC;
	}
	public Date getLRRQ() {
		return LRRQ;
	}
	public void setLRRQ(Date lRRQ) {
		LRRQ = lRRQ;
	}
	public String getZT() {
		return ZT;
	}
	public void setZT(String zT) {
		ZT = zT;
	}
	public String getZPLJ() {
		return ZPLJ;
	}
	public void setZPLJ(String zPLJ) {
		ZPLJ = zPLJ;
	}
	public String getZPWJM() {
		return ZPWJM;
	}
	public void setZPWJM(String zPWJM) {
		ZPWJM = zPWJM;
	}
	public int getJF() {
		return JF;
	}
	public void setJF(int jF) {
		JF = jF;
	}
	public String getXZQH() {
		return XZQH;
	}
	public void setXZQH(String xZQH) {
		XZQH = xZQH;
	}
	public String getDZ() {
		return DZ;
	}
	public void setDZ(String dZ) {
		DZ = dZ;
	}
	public String getXB() {
		return XB;
	}
	public void setXB(String xB) {
		XB = xB;
	}
	public Date getSR() {
		return SR;
	}
	public void setSR(Date sR) {
		SR = sR;
	}
	public String getXL() {
		return XL;
	}
	public void setXL(String xL) {
		XL = xL;
	}
	public int getJTRK() {
		return JTRK;
	}
	public void setJTRK(int jTRK) {
		JTRK = jTRK;
	}
	public String getJFPASSWORD() {
		return JFPASSWORD;
	}
	public void setJFPASSWORD(String jFPASSWORD) {
		JFPASSWORD = jFPASSWORD;
	}
	
	
}
