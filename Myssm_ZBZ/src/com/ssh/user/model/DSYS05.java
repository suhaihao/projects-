package com.ssh.user.model;

import java.util.List;

public class DSYS05 {
	/**
	 * 唯一ID
	 */
	private Integer JFID;
	/**
	 * 部门编码
	 */
	private String BM;
	/**
	 * 部门名称
	 */
	private String Text;
	/**
	 * 部门级次
	 */
	private String BMJC;
	/**
	 * 是否末级 0否 1是
	 */
	private String SF_MJ;
	/**
	 * 部门首字母
	 * @return
	 */
	private String DH_FIRST;
	/**
	 * 负责人
	 * @return
	 */
	private String FZR;
	/**
	 * 联系电话
	 * @return
	 */
	private String DH;
	/**
	 * 职能与简介
	 * @return
	 */
	private String BMZZ;
	/**
	 * 备注
	 * @return
	 */
	private String BZ;
	/**
	 * 上级ID
	 * @return
	 */
	private Integer PARENT_ID;
	/**
	 * 邮编
	 * @return
	 */
	private String YB;
	/**
	 * 地址
	 * @return
	 */
	private String DZ;
	/**
	 * 机构全称
	 * @return
	 */
	private String QC;
	/**
	 * 状态
	 */
	private String ZT;
	
	public String getZT() {
		return ZT;
	}
	public void setZT(String zT) {
		ZT = zT;
	}
	public Integer getJFID() {
		return JFID;
	}
	public void setJFID(Integer jFID) {
		JFID = jFID;
	}
	public String getDH_FIRST() {
		return DH_FIRST;
	}
	public void setDH_FIRST(String dH_FIRST) {
		DH_FIRST = dH_FIRST;
	}
	public String getFZR() {
		return FZR;
	}
	public void setFZR(String fZR) {
		FZR = fZR;
	}
	public String getDH() {
		return DH;
	}
	public void setDH(String dH) {
		DH = dH;
	}
	public String getBMZZ() {
		return BMZZ;
	}
	public void setBMZZ(String bMZZ) {
		BMZZ = bMZZ;
	}
	public String getBZ() {
		return BZ;
	}
	public void setBZ(String bZ) {
		BZ = bZ;
	}
	public Integer getPARENT_ID() {
		return PARENT_ID;
	}
	public void setPARENT_ID(Integer pARENT_ID) {
		PARENT_ID = pARENT_ID;
	}
	public String getYB() {
		return YB;
	}
	public void setYB(String yB) {
		YB = yB;
	}
	public String getDZ() {
		return DZ;
	}
	public void setDZ(String dZ) {
		DZ = dZ;
	}
	public String getQC() {
		return QC;
	}
	public void setQC(String qC) {
		QC = qC;
	}
	public String getBM() {
		return BM;
	}
	public void setBM(String bM) {
		BM = bM;
	}
	public String getText() {
		return Text;
	}
	public void setText(String text) {
		Text = text;
	}
	public String getBMJC() {
		return BMJC;
	}
	public void setBMJC(String bMJC) {
		BMJC = bMJC;
	}
	public String getSF_MJ() {
		return SF_MJ;
	}
	public void setSF_MJ(String sF_MJ) {
		SF_MJ = sF_MJ;
	}
	@Override
	public String toString() {
		return "DSYS05 [JFID=" + JFID + ", BM=" + BM + ", Text=" + Text
				+ ", BMJC=" + BMJC + ", SF_MJ=" + SF_MJ + ", DH_FIRST="
				+ DH_FIRST + ", FZR=" + FZR + ", DH=" + DH + ", BMZZ=" + BMZZ
				+ ", BZ=" + BZ + ", PARENT_ID=" + PARENT_ID + ", YB=" + YB
				+ ", DZ=" + DZ + ", QC=" + QC + "]";
	}
	
}
