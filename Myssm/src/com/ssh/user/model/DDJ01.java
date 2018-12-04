package com.ssh.user.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
/**
 * 专访组织
 * @author Administrator
 *
 */
@Entity
@Table(name = "ddj01")
public class DDJ01 {
/**
 * 用户唯一id
 */
@Id
@Column(name="JFID")
private String JFID;
/**
 * 名称
 */
@Column(name="MC")
private String MC;
/**
 * 所属部门
 */
@Column(name="BMBM")
private String BMBM;
/**
 * 行政区划
 */
@Column(name="XZQH")
private String XZQH;
/**
 * 地址
 */
@Column(name="DZ")
private String DZ;
/**
 * GPS东京
 */
@Column(name="GPS_DJ")
private String GPS_DJ;
/**
 * GPS北纬
 */
@Column(name="GPS_BW")
private String GPS_BW;
/**
 * 电话
 */
@Column(name="LX_DH")
private String LX_DH;
/**
 * 手机
 */
@Column(name="LX_SJ")
private String LX_SJ;
/**
 * 信用积分
 */
@Column(name="XY_JF")
private int XY_JF;
/**
 * 评价记录数
 */
@Column(name="XY_PJS")
private int XY_PJS;
/**
 * 图片地址
 */
@Column(name="LOGO")
private String LOGO;
/**
 * 简介
 */
@Column(name="JJ")
private String JJ;
/**
 * 备注
 */
@Column(name="BZ")
private String BZ;
/**
 * 录入人员
 */
@Column(name="LRRY")
private String LRRY;
/**
 * 录入日期
 */
@Column(name="LRRQ")
private String LRRQ;
/**
 * 状态0作废1初始2提交
 */
@Column(name="ZT")
private String ZT;
/**
 * 状态0作废1初始2提交
 */
@Column(name="LRRY_MC")
private String LRRY_MC;
/**
 * 状态0作废1初始2提交
 */
@Column(name="YHM")
private String YHM;
/**
 * 平星1~5
 */
@Column(name="PJ")
private String PJ;
/**
 * 网址
 */
@Column(name="WWW")
private String WWW;
/**
 * 邮箱
 * @return
 */
@Column(name="YX")
private String YX;
/**
 * 临时字段
 */
private String XZQHMC;
/**
 * 距离
 * @return
 */
private Double JL;
/**
 * ddj01_d的说明
 */
private String SM;
/**
 * ddj01_d的信用积分
 */
private String XY_JF_D;
/**
 * ddj01_d的服务类别
 * @return
 */
private String FWNRLB;

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
public String getLRRQ() {
	return LRRQ;
}
public void setLRRQ(String lRRQ) {
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
	return "DDJ01 [JFID=" + JFID + ", MC=" + MC + ", BMBM=" + BMBM + ", XZQH="
			+ XZQH + ", DZ=" + DZ + ", GPS_DJ=" + GPS_DJ + ", GPS_BW=" + GPS_BW
			+ ", LX_DH=" + LX_DH + ", LX_SJ=" + LX_SJ + ", XY_JF=" + XY_JF
			+ ", XY_PJS=" + XY_PJS + ", LOGO=" + LOGO + ", JJ=" + JJ + ", BZ="
			+ BZ + ", LRRY=" + LRRY + ", LRRQ=" + LRRQ + ", ZT=" + ZT
			+ ", LRRY_MC=" + LRRY_MC + ", YHM=" + YHM + ", PJ=" + PJ + ", WWW="
			+ WWW + ", YX=" + YX + ", XZQHMC=" + XZQHMC + ", JL=" + JL + "]";
}

}
