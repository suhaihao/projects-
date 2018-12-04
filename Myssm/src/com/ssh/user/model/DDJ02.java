package com.ssh.user.model;

import java.util.Date;

/**
 * 用户管理实体类
 * 
 * @author Administrator
 * 
 */
public class DDJ02 {
	/**
	 * 唯一id
	 */
	private String JFID;
	/**
	 * 用户名
	 */
	private String YHM;
	/**
	 * 名称
	 */
	private String MC;
	/**
	 * 手机
	 */
	private String YDDH;
	/**
	 * 邮箱
	 */
	private String YX;
	/**
	 * 备注
	 */
	private String BZ;
	/**
	 * 录入人员编码
	 */
	private int LRRY;
	/**
	 * 录入名称
	 */
	private String LRRY_MC;
	/**
	 * 录入日期
	 */
	private Date LRRQ;
	/**
	 * 状态
	 */
	private String ZT;
	/**
	 * 照片路径
	 */
	private String ZPLJ;
	/**
	 * 照片名称
	 */
	private String ZPWJM;
	/**
	 * 积分
	 */
	private int JF;
	/**
	 * 行政区划
	 */
	private String XZQH;
	/**
	 * 行政区划名称
	 */
	private String XZQHMC;
	/**
	 * 地址
	 */
	private String DZ;
	/**
	 * 性别
	 */
	private String XB;
	/**
	 * 生日
	 */
	private Date SR;
	/**
	 * 学历
	 */
	private String XL;
	/**
	 * 家庭人口
	 */
	private int JTRK;
	/**
	 * 人均年收入
	 */
	private double RJSR;
	/**
	 * 密码
	 */
	
	private String JFPASSWORD;
	/**
	 * 人员类别
	 * @return
	 */
	private String YHLB;
	/**
	 * 生产面积
	 * @return
	 */
	private Double SCMJ;
	/**
	 * ddj02——ddj01字段方便返回
	 * @return
	 * 
	 */
	private String FWNR;
	/***
	 * 用户登陆日期
	 * @return
	 */
	private Date DLRQ;
	/**
	 * 登陆令牌
	 * @return
	 */
	private String TOKEN;
	/**
	 * 序列
	 * @return
	 */
	private String RN;
	/**
	 * 地块数
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
