package com.ssh.user.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * ר����֯
 * 
 * @author Administrator
 * 
 */
@Entity
@Table(name = "ddj01")
public class DDJ01 {
	/**
	 * �û�Ψһid
	 */
	@Id
	@Column(name = "JFID")
	private String JFID;
	/**
	 * ����
	 */
	@Column(name = "MC")
	private String MC;
	/**
	 * ��������
	 */
	@Column(name = "BMBM")
	private String BMBM;
	/**
	 * ������������
	 */
	private String BMMC;
	/**
	 * ��������
	 */
	@Column(name = "XZQH")
	private String XZQH;
	/**
	 * ��ַ
	 */
	@Column(name = "DZ")
	private String DZ;
	/**
	 * GPS����
	 */
	@Column(name = "GPS_DJ")
	private String GPS_DJ;
	/**
	 * GPS��γ
	 */
	@Column(name = "GPS_BW")
	private String GPS_BW;
	/**
	 * �绰
	 */
	@Column(name = "LX_DH")
	private String LX_DH;
	/**
	 * �ֻ�
	 */
	@Column(name = "LX_SJ")
	private String LX_SJ;
	/**
	 * ���û���
	 */
	@Column(name = "XY_JF")
	private int XY_JF;
	/**
	 * ���ۼ�¼��
	 */
	@Column(name = "XY_PJS")
	private int XY_PJS;
	/**
	 * ͼƬ��ַ
	 */
	@Column(name = "LOGO")
	private String LOGO;
	/**
	 * ���
	 */
	@Column(name = "JJ")
	private String JJ;
	/**
	 * ��ע
	 */
	@Column(name = "BZ")
	private String BZ;
	/**
	 * ¼����Ա
	 */
	@Column(name = "LRRY")
	private String LRRY;
	/**
	 * ¼������
	 */
	@Column(name = "LRRQ")
	private Date LRRQ;
	/**
	 * ״̬0����1��ʼ2�ύ
	 */
	@Column(name = "ZT")
	private String ZT;
	/**
	 * ״̬0����1��ʼ2�ύ
	 */
	@Column(name = "LRRY_MC")
	private String LRRY_MC;
	/**
	 * ״̬0����1��ʼ2�ύ
	 */
	@Column(name = "YHM")
	private String YHM;
	/**
	 * ƽ��1~5
	 */
	@Column(name = "PJ")
	private String PJ;
	/**
	 * ��ַ
	 */
	@Column(name = "WWW")
	private String WWW;
	/**
	 * ����
	 * 
	 * @return
	 */
	@Column(name = "YX")
	private String YX;
	/**
	 * ��ʱ�ֶ�
	 */
	private String XZQHMC;
	/**
	 * ����
	 * 
	 * @return
	 */
	private Double JL;
	/**
	 * ddj01_d��˵��
	 */
	private String SM;
	/**
	 * ddj01_d�����û���
	 */
	private String XY_JF_D;
	/**
	 * ddj01_d�ķ������
	 * 
	 * @return
	 */
	private String FWNRLB;
	/**
	 * ����
	 */
	private String RN;
	/**
	 * �˳�˵��
	 */
	private String TC_SM;
	/**
	 * �˳�¼����Ա
	 */
	private String TC_LRRY;
	/**
	 * �˳�ʱ��
	 */
	private Date TC_LRRQ;
	
	public String getBMMC() {
		return BMMC;
	}

	public void setBMMC(String bMMC) {
		BMMC = bMMC;
	}

	public String getTC_SM() {
		return TC_SM;
	}

	public void setTC_SM(String tC_SM) {
		TC_SM = tC_SM;
	}

	public String getTC_LRRY() {
		return TC_LRRY;
	}

	public void setTC_LRRY(String tC_LRRY) {
		TC_LRRY = tC_LRRY;
	}

	public Date getTC_LRRQ() {
		return TC_LRRQ;
	}

	public void setTC_LRRQ(Date tC_LRRQ) {
		TC_LRRQ = tC_LRRQ;
	}

	public String getRN() {
		return RN;
	}

	public void setRN(String rN) {
		RN = rN;
	}

	public String getSM() {
		return SM;
	}

	public void setSM(String sM) {
		SM = sM;
	}

	public String getXY_JF_D() {
		return XY_JF_D;
	}

	public void setXY_JF_D(String xY_JF_D) {
		XY_JF_D = xY_JF_D;
	}

	public String getFWNRLB() {
		return FWNRLB;
	}

	public void setFWNRLB(String fWNRLB) {
		FWNRLB = fWNRLB;
	}

	public Double getJL() {
		return JL;
	}

	public void setJL(Double jL) {
		JL = jL;
	}

	public String getXZQHMC() {
		return XZQHMC;
	}

	public void setXZQHMC(String xZQHMC) {
		XZQHMC = xZQHMC;
	}

	public String getYX() {
		return YX;
	}

	public void setYX(String yX) {
		YX = yX;
	}

	public String getJFID() {
		return JFID;
	}

	public void setJFID(String jFID) {
		JFID = jFID;
	}

	public String getMC() {
		return MC;
	}

	public void setMC(String mC) {
		MC = mC;
	}

	public String getBMBM() {
		return BMBM;
	}

	public void setBMBM(String bMBM) {
		BMBM = bMBM;
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

	public String getGPS_DJ() {
		return GPS_DJ;
	}

	public void setGPS_DJ(String gPS_DJ) {
		GPS_DJ = gPS_DJ;
	}

	public String getGPS_BW() {
		return GPS_BW;
	}

	public void setGPS_BW(String gPS_BW) {
		GPS_BW = gPS_BW;
	}

	public String getLX_DH() {
		return LX_DH;
	}

	public void setLX_DH(String lX_DH) {
		LX_DH = lX_DH;
	}

	public String getLX_SJ() {
		return LX_SJ;
	}

	public void setLX_SJ(String lX_SJ) {
		LX_SJ = lX_SJ;
	}

	public int getXY_JF() {
		return XY_JF;
	}

	public void setXY_JF(int xY_JF) {
		XY_JF = xY_JF;
	}

	public int getXY_PJS() {
		return XY_PJS;
	}

	public void setXY_PJS(int xY_PJS) {
		XY_PJS = xY_PJS;
	}

	public String getLOGO() {
		return LOGO;
	}

	public void setLOGO(String lOGO) {
		LOGO = lOGO;
	}

	public String getJJ() {
		return JJ;
	}

	public void setJJ(String jJ) {
		JJ = jJ;
	}

	public String getBZ() {
		return BZ;
	}

	public void setBZ(String bZ) {
		BZ = bZ;
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

	public String getZT() {
		return ZT;
	}

	public void setZT(String zT) {
		ZT = zT;
	}

	public String getLRRY_MC() {
		return LRRY_MC;
	}

	public void setLRRY_MC(String lRRY_MC) {
		LRRY_MC = lRRY_MC;
	}

	public String getYHM() {
		return YHM;
	}

	public void setYHM(String yHM) {
		YHM = yHM;
	}

	public String getPJ() {
		return PJ;
	}

	public void setPJ(String pJ) {
		PJ = pJ;
	}

	public String getWWW() {
		return WWW;
	}

	public void setWWW(String wWW) {
		WWW = wWW;
	}

	@Override
	public String toString() {
		return "DDJ01 [JFID=" + JFID + ", MC=" + MC + ", BMBM=" + BMBM
				+ ", XZQH=" + XZQH + ", DZ=" + DZ + ", GPS_DJ=" + GPS_DJ
				+ ", GPS_BW=" + GPS_BW + ", LX_DH=" + LX_DH + ", LX_SJ="
				+ LX_SJ + ", XY_JF=" + XY_JF + ", XY_PJS=" + XY_PJS + ", LOGO="
				+ LOGO + ", JJ=" + JJ + ", BZ=" + BZ + ", LRRY=" + LRRY
				+ ", LRRQ=" + LRRQ + ", ZT=" + ZT + ", LRRY_MC=" + LRRY_MC
				+ ", YHM=" + YHM + ", PJ=" + PJ + ", WWW=" + WWW + ", YX=" + YX
				+ ", XZQHMC=" + XZQHMC + ", JL=" + JL + "]";
	}

}
