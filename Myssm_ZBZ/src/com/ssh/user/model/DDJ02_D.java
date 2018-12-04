package com.ssh.user.model;

import java.util.Date;

/**
 * 农户地块实体类
 * 
 * @author Administrator
 * 
 */
public class DDJ02_D {
	/**
	 * 地块唯一id
	 */
	private String JFID;
	/**
	 * 地块名称
	 */
	private String DH;
	/**
	 * 地类型
	 */
	private String DLX;
	/**
	 * 地类型名称
	 */
	private String DLXMC;
	/**
	 * 面积
	 */
	private double MJ;
	/**
	 * 作物
	 */
	private String NZW;
	/**
	 * 农作物名称
	 */
	private String NZWMC;
	/**
	 * 用户作物选其他时录入的名字
	 */
	private String NZW_MC;
	/**
	 * 防治对象
	 */
	private String FZDX;
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
	 * 备注
	 */
	private String BZ;
	/**
	 * 主表的jfid
	 */
	private String DDJ02_JFID;
	/**
	 * 经度
	 */
	private String JD;
	/**
	 * 纬度
	 */
	private String WD;
	/**
	 * 用户名称
	 * @return
	 */
	private String MC;
	
	public String getMC() {
		return MC;
	}
	public void setMC(String mC) {
		MC = mC;
	}
	public String getJD() {
		return JD;
	}
	public void setJD(String jD) {
		JD = jD;
	}
	public String getWD() {
		return WD;
	}
	public void setWD(String wD) {
		WD = wD;
	}
	public String getNZWMC() {
		return NZWMC;
	}
	public void setNZWMC(String nZWMC) {
		NZWMC = nZWMC;
	}
	public String getDLXMC() {
		return DLXMC;
	}
	public void setDLXMC(String dLXMC) {
		DLXMC = dLXMC;
	}
	public String getDDJ02_JFID() {
		return DDJ02_JFID;
	}
	public void setDDJ02_JFID(String dDJ02_JFID) {
		DDJ02_JFID = dDJ02_JFID;
	}
	public String getJFID() {
		return JFID;
	}
	public void setJFID(String jFID) {
		JFID = jFID;
	}
	public String getDH() {
		return DH;
	}
	public void setDH(String dH) {
		DH = dH;
	}
	public String getDLX() {
		return DLX;
	}
	public void setDLX(String dLX) {
		DLX = dLX;
	}
	public double getMJ() {
		return MJ;
	}
	public void setMJ(double mJ) {
		MJ = mJ;
	}
	public String getNZW() {
		return NZW;
	}
	public void setNZW(String nZW) {
		NZW = nZW;
	}
	public String getNZW_MC() {
		return NZW_MC;
	}
	public void setNZW_MC(String nZW_MC) {
		NZW_MC = nZW_MC;
	}
	public String getFZDX() {
		return FZDX;
	}
	public void setFZDX(String fZDX) {
		FZDX = fZDX;
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
	public String getBZ() {
		return BZ;
	}
	public void setBZ(String bZ) {
		BZ = bZ;
	}
	@Override
	public String toString() {
		return "DDJ02_D [JFID=" + JFID + ", DH=" + DH + ", DLX=" + DLX
				+ ", MJ=" + MJ + ", NZW=" + NZW + ", NZW_MC=" + NZW_MC
				+ ", FZDX=" + FZDX + ", LRRY=" + LRRY + ", LRRYMC=" + LRRYMC
				+ ", LRRQ=" + LRRQ + ", BZ=" + BZ + "]";
	}
	
}
