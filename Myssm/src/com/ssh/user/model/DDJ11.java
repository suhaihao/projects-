package com.ssh.user.model;

import java.util.Date;

/**
 * 防治措施实体类
 * 
 * @author Administrator
 * 
 */
public class DDJ11 {
	/**
	 * 唯一id
	 */
	private String JFID;
	/**
	 * 用户dd01.jfid
	 */
	private String DDJ01_JFID;
	/**
	 * 名称
	 */
	private String MC;
	/**
	 * 分类
	 */
	private String FL;
	/**
	 * 分类名称
	 */
	private String FLMC;
	/**
	 * 单位
	 */
	private String DW;
	/**
	 * 单位名称
	 */
	private String DWMC;
	/**
	 * 单价
	 */
	private double DJ;
	/**
	 * 包装规格
	 */
	private String BZGG;
	/**
	 * 备注
	 */
	private String BZ;
	/**
	 * 状态0作废1初始2提交
	 */
	private String ZT;
	/**
	 * 录入人员
	 */
	private String LRRY;
	/**
	 * 录入人员名称
	 */
	private String LRRYMC;
	/**
	 * 录入日期
	 */
	private Date LRRQ;
	/**
	 * 序列
	 */
	private String RN;
	/**
	 * 生产厂家
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
