package com.ssh.user.model;

import java.util.List;

public class DMSG {
	/**
	 * 方向0发送 1接收
	 */
	private String FX;
	/**
	 * WEB更新记录数
	 */
	private Integer JLS_WEB;
	/**
	 * 手机更新记录数
	 */
	private Integer JLS_SJ;
	/**
	 * 属主JFID
	 */
	private String SZ_JFID;
	/**
	 * 属主类别
	 */
	private String SZ_LB;
	/**
	 * 属主名称
	 */
	private String SZ_MC;
	/**
	 * 属主头像路径
	 */
	private String SZ_TX_LJ;
	/**
	 * 对方类别
	 */
	private String DF_LB;
	/**
	 * 对方ID
	 */
	private String DF_JFID;
	/**
	 * 对方名称
	 */
	private String DF_MC;
	/**
	 * 对方头像路径
	 */
	private String DF_TX_LJ;
	/**
	 * 最后一次发送日期
	 */
	private String FS_RQ;
	/**
	 * 发送的类别
	 */
	private String NR_LB;
	/**
	 * 发送内容
	 */
	private String NR;
	/**
	 * 图片路径
	 */
	private String TB_DZ;
	/**
	 * 对应聊天集合
	 * @return
	 */
	private String list;
	
	public String getTB_DZ() {
		return TB_DZ;
	}
	public void setTB_DZ(String tB_DZ) {
		TB_DZ = tB_DZ;
	}
	public String getSZ_JFID() {
		return SZ_JFID;
	}
	public void setSZ_JFID(String sZ_JFID) {
		SZ_JFID = sZ_JFID;
	}
	public String getSZ_LB() {
		return SZ_LB;
	}
	public void setSZ_LB(String sZ_LB) {
		SZ_LB = sZ_LB;
	}
	public String getFX() {
		return FX;
	}
	public void setFX(String fX) {
		FX = fX;
	}
	public Integer getJLS_WEB() {
		return JLS_WEB;
	}
	public void setJLS_WEB(Integer jLS_WEB) {
		JLS_WEB = jLS_WEB;
	}
	public Integer getJLS_SJ() {
		return JLS_SJ;
	}
	public void setJLS_SJ(Integer jLS_SJ) {
		JLS_SJ = jLS_SJ;
	}
	public String getSZ_MC() {
		return SZ_MC;
	}
	public void setSZ_MC(String sZ_MC) {
		SZ_MC = sZ_MC;
	}
	public String getSZ_TX_LJ() {
		return SZ_TX_LJ;
	}
	public void setSZ_TX_LJ(String sZ_TX_LJ) {
		SZ_TX_LJ = sZ_TX_LJ;
	}
	public String getDF_TX_LJ() {
		return DF_TX_LJ;
	}
	public void setDF_TX_LJ(String dF_TX_LJ) {
		DF_TX_LJ = dF_TX_LJ;
	}
	public String getFS_RQ() {
		return FS_RQ;
	}
	public void setFS_RQ(String fS_RQ) {
		FS_RQ = fS_RQ;
	}
	public String getNR_LB() {
		return NR_LB;
	}
	public void setNR_LB(String nR_LB) {
		NR_LB = nR_LB;
	}
	public String getNR() {
		return NR;
	}
	public void setNR(String nR) {
		NR = nR;
	}
	
	
	
	public String getList() {
		return list;
	}
	public void setList(String list) {
		this.list = list;
	}
	public String getDF_LB() {
		return DF_LB;
	}
	public void setDF_LB(String dF_LB) {
		DF_LB = dF_LB;
	}
	public String getDF_JFID() {
		return DF_JFID;
	}
	public void setDF_JFID(String dF_JFID) {
		DF_JFID = dF_JFID;
	}
	public String getDF_MC() {
		return DF_MC;
	}
	public void setDF_MC(String dF_MC) {
		DF_MC = dF_MC;
	}
	@Override
	public String toString() {
		return "DMSG [FX=" + FX + ", JLS_WEB=" + JLS_WEB + ", JLS_SJ=" + JLS_SJ
				+ ", SZ_JFID=" + SZ_JFID + ", SZ_LB=" + SZ_LB + ", SZ_MC="
				+ SZ_MC + ", SZ_TX_LJ=" + SZ_TX_LJ + ", DF_LB=" + DF_LB
				+ ", DF_JFID=" + DF_JFID + ", DF_MC=" + DF_MC + ", DF_TX_LJ="
				+ DF_TX_LJ + ", FS_RQ=" + FS_RQ + ", NR_LB=" + NR_LB + ", NR="
				+ NR + ", TB_DZ=" + TB_DZ + ", list=" + list + "]";
	}

	
	
}
