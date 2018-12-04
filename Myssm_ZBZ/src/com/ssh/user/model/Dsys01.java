package com.ssh.user.model;

import java.util.Date;

public class Dsys01 {
	/**
	 * 唯一ID
	 */
	private Integer JFID;
	/**
	 * 人员名称
	 */
	private String JFNAME;
	/**
	 * DSYS05编码
	 */
	private String JFDSYS05_CODE;
	/**
	 * 用户账户
	 */
	private String JFUSERID;
	/**
	 * 用户密码
	 */
	private String JFPASSWORD;
	/**
	 * 备注
	 */
	private String JFREMARK;
	/**
	 * 状态
	 */
	private String JFSTATE;
	/**
	 * 人员分类
	 */
	private String RYFL;
	/**
	 * 人员分类名称
	 */
	private String RYFLMC;
	/**
	 * 生日
	 */
	private Date SR;
	/**
	 * 性别
	 */
	private String XB;
	/**
	 * 学历
	 */
	private String XL;
	/**
	 * 电话
	 */
	private String DH;
	/**
	 * 手机
	 */
	private String SJ;
	/**
	 * 电子邮箱
	 */
	private String DZXX;
	/**
	 * 录入日期
	 */
	private Date LRRQ;
	/**
	 * 录入人员
	 */
	private String LRRY;
	/**
	 * 照片路径
	 */
	private String ZPLJ;
	/**
	 * 照片文件名称
	 */
	private String ZPWJM;
	/**
	 * 查询范围
	 */
	private String CXFW;
	/**
	 * 是否强制修改密码
	 */
	private String SF_XGPW;
	/**
	 * 消息代表类别0植保站1个人
	 */
	private String XXDBLB;
	
	public String getRYFLMC() {
		return RYFLMC;
	}
	public void setRYFLMC(String rYFLMC) {
		RYFLMC = rYFLMC;
	}
	public Integer getJFID() {
		return JFID;
	}
	public void setJFID(Integer jFID) {
		JFID = jFID;
	}
	public String getJFNAME() {
		return JFNAME;
	}
	public void setJFNAME(String jFNAME) {
		JFNAME = jFNAME;
	}
	public String getJFDSYS05_CODE() {
		return JFDSYS05_CODE;
	}
	public void setJFDSYS05_CODE(String jFDSYS05_CODE) {
		JFDSYS05_CODE = jFDSYS05_CODE;
	}
	public String getJFUSERID() {
		return JFUSERID;
	}
	public void setJFUSERID(String jFUSERID) {
		JFUSERID = jFUSERID;
	}
	public String getJFPASSWORD() {
		return JFPASSWORD;
	}
	public void setJFPASSWORD(String jFPASSWORD) {
		JFPASSWORD = jFPASSWORD;
	}
	public String getJFREMARK() {
		return JFREMARK;
	}
	public void setJFREMARK(String jFREMARK) {
		JFREMARK = jFREMARK;
	}
	public String getJFSTATE() {
		return JFSTATE;
	}
	public void setJFSTATE(String jFSTATE) {
		JFSTATE = jFSTATE;
	}
	public String getRYFL() {
		return RYFL;
	}
	public void setRYFL(String rYFL) {
		RYFL = rYFL;
	}
	public Date getSR() {
		return SR;
	}
	public void setSR(Date sR) {
		SR = sR;
	}
	public String getXB() {
		return XB;
	}
	public void setXB(String xB) {
		XB = xB;
	}
	public String getXL() {
		return XL;
	}
	public void setXL(String xL) {
		XL = xL;
	}
	public String getDH() {
		return DH;
	}
	public void setDH(String dH) {
		DH = dH;
	}
	public String getSJ() {
		return SJ;
	}
	public void setSJ(String sJ) {
		SJ = sJ;
	}
	public String getDZXX() {
		return DZXX;
	}
	public void setDZXX(String dZXX) {
		DZXX = dZXX;
	}
	public Date getLRRQ() {
		return LRRQ;
	}
	public void setLRRQ(Date lRRQ) {
		LRRQ = lRRQ;
	}
	public String getLRRY() {
		return LRRY;
	}
	public void setLRRY(String lRRY) {
		LRRY = lRRY;
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
	public String getCXFW() {
		return CXFW;
	}
	public void setCXFW(String cXFW) {
		CXFW = cXFW;
	}
	public String getSF_XGPW() {
		return SF_XGPW;
	}
	public void setSF_XGPW(String sF_XGPW) {
		SF_XGPW = sF_XGPW;
	}
	public String getXXDBLB() {
		return XXDBLB;
	}
	public void setXXDBLB(String xXDBLB) {
		XXDBLB = xXDBLB;
	}
	@Override
	public String toString() {
		return "DSYS01 [JFID=" + JFID + ", JFNAME=" + JFNAME
				+ ", JFDSYS05_CODE=" + JFDSYS05_CODE + ", JFUSERID=" + JFUSERID
				+ ", JFPASSWORD=" + JFPASSWORD + ", JFREMARK=" + JFREMARK
				+ ", JFSTATE=" + JFSTATE + ", RYFL=" + RYFL + ", SR=" + SR
				+ ", XB=" + XB + ", XL=" + XL + ", DH=" + DH + ", SJ=" + SJ
				+ ", DZXX=" + DZXX + ", LRRQ=" + LRRQ + ", LRRY=" + LRRY
				+ ", ZPLJ=" + ZPLJ + ", ZPWJM=" + ZPWJM + ", CXFW=" + CXFW
				+ ", SF_XGPW=" + SF_XGPW + ", XXDBLB=" + XXDBLB + "]";
	}
	
}
