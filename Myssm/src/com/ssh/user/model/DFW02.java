package com.ssh.user.model;

import java.util.Date;

public class DFW02 {
	/**
	 * 唯一ID
	 */
	private String JFID;
	/**
	 * 对应JFID（评价类别为全程服务时对应完工日期的当前月YYYY.MM,否则对应要评价的工单号）
	 */
	private String DY_JFID;
	/**
	 * 评价结果
	 */
	private String PJJG;
	/**
	 * 评价分数
	 */
	private Integer PJFS;
	/**
	 * 产生日期
	 */
	private Date CSRQ;
	/**
	 * 评价日期
	 */
	private Date PJRQ;
	/**
	 * 评价说明
	 */
	private String PJSM;
	/**
	 * 服务内容
	 */
	private String FWNRLB;
	/**
	 * 服务内容
	 */
	private String FWNRLBMC;
	/**
	 * 状态
	 */
	private String ZT;
	/**
	 * 评价开始日期
	 */
	private Date PJ_KSRQ;
	/**
	 * 评价截止日期
	 */
	private Date PJ_JZRQ;
	/**
	 * 专访组织id
	 */
	private String DDJ01_JFID;
	/**
	 * 专访组织名称
	 */
	private String DDJ01_MC;
	/**
	 * 人员id
	 */
	private String DDJ02_JFID;
	/**
	 * 评价人员DDJ01_JFID
	 */
	private String PJRY;
	/**
	 * 评价人员名称
	 */
	private String PJRY_MC;
	/**
	 * 提醒日期
	 */
	private Date TXRQ;
	
	public String getFWNRLBMC() {
		return FWNRLBMC;
	}
	public void setFWNRLBMC(String fWNRLBMC) {
		FWNRLBMC = fWNRLBMC;
	}
	public String getJFID() {
		return JFID;
	}
	public void setJFID(String jFID) {
		JFID = jFID;
	}
	public String getDY_JFID() {
		return DY_JFID;
	}
	public void setDY_JFID(String dY_JFID) {
		DY_JFID = dY_JFID;
	}
	public String getPJJG() {
		return PJJG;
	}
	public void setPJJG(String pJJG) {
		PJJG = pJJG;
	}
	public Integer getPJFS() {
		return PJFS;
	}
	public void setPJFS(Integer pJFS) {
		PJFS = pJFS;
	}
	public Date getCSRQ() {
		return CSRQ;
	}
	public void setCSRQ(Date cSRQ) {
		CSRQ = cSRQ;
	}
	public Date getPJRQ() {
		return PJRQ;
	}
	public void setPJRQ(Date pJRQ) {
		PJRQ = pJRQ;
	}
	public String getPJSM() {
		return PJSM;
	}
	public void setPJSM(String pJSM) {
		PJSM = pJSM;
	}
	public String getFWNRLB() {
		return FWNRLB;
	}
	public void setFWNRLB(String fWNRLB) {
		FWNRLB = fWNRLB;
	}
	public String getZT() {
		return ZT;
	}
	public void setZT(String zT) {
		ZT = zT;
	}
	public Date getPJ_KSRQ() {
		return PJ_KSRQ;
	}
	public void setPJ_KSRQ(Date pJ_KSRQ) {
		PJ_KSRQ = pJ_KSRQ;
	}
	public Date getPJ_JZRQ() {
		return PJ_JZRQ;
	}
	public void setPJ_JZRQ(Date pJ_JZRQ) {
		PJ_JZRQ = pJ_JZRQ;
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
	public String getDDJ02_JFID() {
		return DDJ02_JFID;
	}
	public void setDDJ02_JFID(String dDJ02_JFID) {
		DDJ02_JFID = dDJ02_JFID;
	}
	public String getPJRY() {
		return PJRY;
	}
	public void setPJRY(String pJRY) {
		PJRY = pJRY;
	}
	public String getPJRY_MC() {
		return PJRY_MC;
	}
	public void setPJRY_MC(String pJRY_MC) {
		PJRY_MC = pJRY_MC;
	}
	public Date getTXRQ() {
		return TXRQ;
	}
	public void setTXRQ(Date tXRQ) {
		TXRQ = tXRQ;
	}
	
	
	
}
